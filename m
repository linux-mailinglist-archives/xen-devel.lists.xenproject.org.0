Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68623192AEC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 15:19:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH6q6-00077m-9I; Wed, 25 Mar 2020 14:17:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=grKZ=5K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jH6q4-00077f-Ql
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 14:17:00 +0000
X-Inumbo-ID: 49e1ed16-6ea3-11ea-8626-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49e1ed16-6ea3-11ea-8626-12813bfff9fa;
 Wed, 25 Mar 2020 14:16:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 227D6AC4A;
 Wed, 25 Mar 2020 14:16:58 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200323101724.15655-1-andrew.cooper3@citrix.com>
 <20200323101724.15655-8-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <de9a73c3-4568-c010-4669-e39aa0b9c31d@suse.com>
Date: Wed, 25 Mar 2020 15:16:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200323101724.15655-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 7/7] x86/ucode/intel: Fold structures
 together
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23.03.2020 11:17, Andrew Cooper wrote:
> Currently, we allocate an 8 byte struct microcode_patch to point at a
> separately allocated struct microcode_intel.  This is wasteful.

As indicated elsewhere I'm very much in favor of this, but I think it
wants doing in one of the earlier series, and then for AMD at the same
time. Possibly, to limit code churn there, ...

> --- a/xen/arch/x86/cpu/microcode/intel.c
> +++ b/xen/arch/x86/cpu/microcode/intel.c
> @@ -32,17 +32,12 @@
>  
>  #define pr_debug(x...) ((void)0)
>  
> -struct microcode_header_intel {
> +struct microcode_patch {

... accompanying this with

#define microcode_header_intel microcode_patch

or even ...

> -    union {
> -        struct {
> -            uint16_t year;
> -            uint8_t day;
> -            uint8_t month;
> -        };
> -        unsigned int date;
> -    };
> +    uint16_t year;
> +    uint8_t  day;
> +    uint8_t  month;
>      unsigned int sig;
>      unsigned int cksum;
>      unsigned int ldrver;
> @@ -57,10 +52,7 @@ struct microcode_header_intel {
>      unsigned int _datasize;
>      unsigned int _totalsize;
>      unsigned int reserved[3];
> -};
>  
> -struct microcode_intel {
> -    struct microcode_header_intel hdr;
>      uint8_t data[];
>  };

... keeping the two structures separate until here, which would
make this one what would initially become struct microcode_patch.
This is in particular because ...

>  static void free_patch(struct microcode_patch *patch)
>  {
> -    if ( patch )
> -    {
> -        xfree(patch->mc_intel);
> -        xfree(patch);
> -    }
> +    xfree(patch);
>  }

... in that earlier series you've moved the 2nd xfree() here just
to now delete it again.

Jan


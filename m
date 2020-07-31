Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 208752347F7
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 16:45:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1WH9-0006Zi-Mv; Fri, 31 Jul 2020 14:44:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k1WH8-0006Zc-Dc
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 14:44:46 +0000
X-Inumbo-ID: 6019293e-d33c-11ea-abc5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6019293e-d33c-11ea-abc5-12813bfff9fa;
 Fri, 31 Jul 2020 14:44:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00986AB3D;
 Fri, 31 Jul 2020 14:44:57 +0000 (UTC)
Subject: Re: [PATCH 4/5] xen/memory: Fix acquire_resource size semantics
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <75a7761f-45c6-5642-ea46-1b92072914b1@suse.com>
Date: Fri, 31 Jul 2020 16:44:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728113712.22966-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.07.2020 13:37, Andrew Cooper wrote:
> @@ -1026,19 +1047,6 @@ static int acquire_resource(
>      if ( xmar.pad != 0 )
>          return -EINVAL;
>  
> -    if ( guest_handle_is_null(xmar.frame_list) )
> -    {
> -        if ( xmar.nr_frames )
> -            return -EINVAL;
> -
> -        xmar.nr_frames = ARRAY_SIZE(mfn_list);
> -
> -        if ( __copy_field_to_guest(arg, &xmar, nr_frames) )
> -            return -EFAULT;
> -
> -        return 0;
> -    }
> -
>      if ( xmar.nr_frames > ARRAY_SIZE(mfn_list) )
>          return -E2BIG;

While arguably minor, the error code in the null-handle case
would imo better be the same, no matter how big xmar.nr_frames
is.

Jan


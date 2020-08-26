Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2512D2530CD
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 16:03:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAw0x-0006Eo-JH; Wed, 26 Aug 2020 14:02:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vb2W=CE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kAw0v-0006Ej-OF
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 14:02:57 +0000
X-Inumbo-ID: d2574985-67b4-465f-b76f-2c700fa8b6bf
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2574985-67b4-465f-b76f-2c700fa8b6bf;
 Wed, 26 Aug 2020 14:02:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AECE0B596;
 Wed, 26 Aug 2020 14:03:26 +0000 (UTC)
Subject: Re: [PATCH v7 8/9] x86/time: add a domain context record for
 tsc_info...
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200818103032.3050-1-paul@xen.org>
 <20200818103032.3050-9-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <153634db-bd1a-62d8-f53f-2c4019ffda4c@suse.com>
Date: Wed, 26 Aug 2020 16:02:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200818103032.3050-9-paul@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.08.2020 12:30, Paul Durrant wrote:
> --- a/xen/include/public/save.h
> +++ b/xen/include/public/save.h
> @@ -93,7 +93,18 @@ struct domain_shared_info_context {
>  
>  DECLARE_DOMAIN_SAVE_TYPE(SHARED_INFO, 2, struct domain_shared_info_context);
>  
> -#define DOMAIN_SAVE_CODE_MAX 2
> +#if defined(__i386__) || defined(__x86_64__)
> +struct domain_tsc_info_context {
> +    uint32_t mode;
> +    uint32_t incarnation;
> +    uint64_t elapsed_nsec;
> +    uint32_t khz;
> +};

sizeof() for this struct varies between 32-bit and 64-bit - is
this not a problem? (alignof() varies too, but there I think
it's indeed not a problem, albeit it could still be taken care
of by using uint64_aligned_t, alongside the addition of an
explicit padding field).

Jan


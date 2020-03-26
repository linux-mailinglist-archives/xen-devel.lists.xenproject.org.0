Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22717193CF4
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 11:33:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHPlz-0005dT-Va; Thu, 26 Mar 2020 10:30:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BM0P=5L=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jHPly-0005Yc-OD
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 10:30:02 +0000
X-Inumbo-ID: bf4f07ce-6f4c-11ea-879b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf4f07ce-6f4c-11ea-879b-12813bfff9fa;
 Thu, 26 Mar 2020 10:30:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EE899AD08;
 Thu, 26 Mar 2020 10:29:59 +0000 (UTC)
To: xen-devel@lists.xenproject.org
References: <20200326094557.13822-1-jgross@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <1a94286a-a164-27dd-3f1f-2d19ba5d547c@suse.com>
Date: Thu, 26 Mar 2020 11:29:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200326094557.13822-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH] tools/libxl: make default of max event
 channels dependant on vcpus
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.03.20 10:45, Juergen Gross wrote:
> Today the maximum number of event channels for a guest is defaulting
> to 1023. For large guests with lots of vcpus this is not enough, as
> e.g. the Linux kernel uses 7 event channels per vcpu, limiting the
> guest to about 140 vcpus.
> 
> Instead of requiring to specify the allowed number of event channels
> via the "event_channels" domain config option, make the default
> depend on the maximum number of vcpus of the guest.
> 
> In order not to regress current configs use 1023 as the minimum
> default setting.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/libxl/libxl_create.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
> index e7cb2dbc2b..eddd0e98e5 100644
> --- a/tools/libxl/libxl_create.c
> +++ b/tools/libxl/libxl_create.c
> @@ -226,7 +226,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
>               b_info->iomem[i].gfn = b_info->iomem[i].start;
>   
>       if (!b_info->event_channels)
> -        b_info->event_channels = 1023;
> +        b_info->event_channels = min(1023, b_info->max_vcpus * 8 + 255);

Sorry, forgot to do "stg refresh", this should be max(), of course.


Juergen


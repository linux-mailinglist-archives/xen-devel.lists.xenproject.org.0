Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9013719F26B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 11:24:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLNza-0000L4-4B; Mon, 06 Apr 2020 09:24:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=glNc=5W=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jLNzY-0000Kr-K5
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 09:24:28 +0000
X-Inumbo-ID: 69c7627a-77e8-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69c7627a-77e8-11ea-b4f4-bc764e2007e4;
 Mon, 06 Apr 2020 09:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fvy6vfuH+8nE3SpAK4tUpE0tV15nZY/imx4NaGXvdSk=; b=yIyBtwkkiGAtkHtEJhVV9Sg4U9
 EgOqxfB5noBQIwR2Ug/u/Xz5TX08NuMIztUqg22al3exdsPPS7KiWN9eAkrWplbHj3D0yNjglqgOA
 EK/Svt/+AxpFirCF4sVwJIU8ZzUJjA6IMO5iOBUOKkdzLVnpXd+elkjPoyxT8I0wz9pM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jLNzX-0005hu-7g; Mon, 06 Apr 2020 09:24:27 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jLNzX-0007X1-0m; Mon, 06 Apr 2020 09:24:27 +0000
Subject: Re: [PATCH v2] tools/libxl: make default of max event channels
 dependant on vcpus
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20200406082704.13994-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <afc7e988-3b51-bbee-cba8-af30a7605dc4@xen.org>
Date: Mon, 6 Apr 2020 10:24:25 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200406082704.13994-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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

Hi Jurgen,

On 06/04/2020 09:27, Juergen Gross wrote:
> Since Xen 4.4 the maximum number of event channels for a guest is
> defaulting to 1023. For large guests with lots of vcpus this is not
> enough, as e.g. the Linux kernel uses 7 event channels per vcpu,
> limiting the guest to about 140 vcpus.

Large guests on which arch? Which type of guests?

> Instead of requiring to specify the allowed number of event channels
> via the "event_channels" domain config option, make the default
> depend on the maximum number of vcpus of the guest. This will require
> to use the "event_channels" domain config option in fewer cases as
> before.
> 
> As different guests will have differing needs the calculation of the
> maximum number of event channels can be a rough estimate only,
> currently based on the Linux kernel requirements.

I am not overly happy to extend the default numbers of event channels 
for everyone based on Linux behavior on a given setup. Yes you have more 
guests that would be able to run, but at the expense of allowing a guest 
to use more xen memory.

For instance, I don't think this limit increase is necessary on Arm.

> Nevertheless it is
> much better than the static upper limit of today as more guests will
> boot just fine with the new approach.
> 
> In order not to regress current configs use 1023 as the minimum
> default setting.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - use max() instead of min()
> - clarify commit message a little bit
> ---
>   tools/libxl/libxl_create.c | 2 +-

The documentation should be updated.

>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
> index e7cb2dbc2b..c025b21894 100644
> --- a/tools/libxl/libxl_create.c
> +++ b/tools/libxl/libxl_create.c
> @@ -226,7 +226,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
>               b_info->iomem[i].gfn = b_info->iomem[i].start;
>   
>       if (!b_info->event_channels)
> -        b_info->event_channels = 1023;
> +        b_info->event_channels = max(1023, b_info->max_vcpus * 8 + 255);

What is the 255 for?

Cheers,

-- 
Julien Grall


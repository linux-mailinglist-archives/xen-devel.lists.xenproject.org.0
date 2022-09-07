Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 238E25B048D
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 15:01:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401651.643535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVug6-0001cP-0Q; Wed, 07 Sep 2022 13:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401651.643535; Wed, 07 Sep 2022 13:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVug5-0001aG-TX; Wed, 07 Sep 2022 13:01:13 +0000
Received: by outflank-mailman (input) for mailman id 401651;
 Wed, 07 Sep 2022 13:01:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVug5-0001aA-8g
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 13:01:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVug4-0005tC-VN; Wed, 07 Sep 2022 13:01:12 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVug4-0002M9-NC; Wed, 07 Sep 2022 13:01:12 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=tFLOGVsaec1S7Yg1ZuhZf6vw0vm8mmJEGOrYUELJloc=; b=n6lXuU7UKCP3SPkDsrZ+AnI3O3
	zWdnb0DdK4kW2Mf+Ac83RizDDx8VdDz/bZ0HnxugvVKQaUKQTWh6Ioz/1zr7omCzCMQovsIoGehfz
	zr/uA61SI7n70BroxFJOn1E4UYJF5N7QjnrcNEKHZmOT3uevF5XR2kGXRpaJxjQronns=;
Message-ID: <b04c4abf-9c7e-9b39-aafd-ece061a07197@xen.org>
Date: Wed, 7 Sep 2022 14:01:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v4 3/7] xen/evtchn: restrict the maximum number of evtchn
 supported for domUs
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1662462034.git.rahul.singh@arm.com>
 <a631af9b5499eb3fab76cae372d623021431347c.1662462034.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a631af9b5499eb3fab76cae372d623021431347c.1662462034.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/09/2022 14:40, Rahul Singh wrote:
> Restrict the maximum number of evtchn supported for domUs to avoid
> allocating a large amount of memory in Xen.
> 
> Set the default value of max_evtchn_port to 1023. The value of 1023
> should be sufficient for domUs guests because on ARM we don't bind

To me, domUs and guests mean the same. So s/guests//

> physical interrupts to event channels. The only use of the evtchn port
> is inter-domain communications. Another reason why we choose the value
> of 1023 to follow the default behavior of libxl.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Changes in v4:
>   - fix minor comments in commit msg
>   - Added Michal Reviewed-by
> Changes in v3:
>   - added in commit msg why we set the max_evtchn_port value to 1023.
>   - added the comment in code also why we set the max_evtchn_port to 1023
>   - remove the define and set the value to 1023 in code directly.
> Changes in v2:
>   - new patch in the version
> ---
>   xen/arch/arm/domain_build.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 3fd1186b53..fde133cd94 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3277,7 +3277,13 @@ void __init create_domUs(void)
>           struct xen_domctl_createdomain d_cfg = {
>               .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
>               .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
> -            .max_evtchn_port = -1,
> +            /*
> +             * The default of 1023 should be sufficient for domUs guests

To me, domUs and guests mean the same. So s/guests//

Same here. With that:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


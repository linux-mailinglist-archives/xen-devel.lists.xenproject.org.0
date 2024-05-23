Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 845D78CDD35
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 01:11:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728930.1134019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAHah-00061Q-Sh; Thu, 23 May 2024 23:11:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728930.1134019; Thu, 23 May 2024 23:11:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAHah-0005yb-PN; Thu, 23 May 2024 23:11:19 +0000
Received: by outflank-mailman (input) for mailman id 728930;
 Thu, 23 May 2024 23:11:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sAHag-0005yV-9m
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 23:11:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAHaf-0008I4-W3; Thu, 23 May 2024 23:11:17 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAHaf-0001oZ-Qd; Thu, 23 May 2024 23:11:17 +0000
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
	bh=EwDu3x4EZ7cn1iaD41BLePUbCeqetI5jMQx2kpFydyo=; b=5+q/n0sqtgiM06k6YSoKLLTjyh
	l2/VwMwKZjrU2RY94YW7bsR9kN7HX484zTP0CbX19S7HiEgKotNIpXMVFVRZIudM9tI4ZsYJ+Z24I
	ITmxAzGMlXjl5qQIDKybBCdAsEIItXwAggvOspygw7X43NHylS43KFnN431gws8sX2ZE=;
Message-ID: <fc2ff110-0af7-439b-a220-2cb21c63c54e@xen.org>
Date: Fri, 24 May 2024 00:11:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/9] tools: Introduce the "xl dt-overlay
 {attach,detach}" commands
Content-Language: en-GB
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20240523074040.1611264-1-xin.wang2@amd.com>
 <20240523074040.1611264-9-xin.wang2@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240523074040.1611264-9-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 23/05/2024 08:40, Henry Wang wrote:
> With the XEN_DOMCTL_dt_overlay DOMCTL added, users should be able to
> attach/detach devices from the provided DT overlay to domains.
> Support this by introducing a new set of "xl dt-overlay" commands and
> related documentation, i.e. "xl dt-overlay {attach,detach}". Slightly
> rework the command option parsing logic.
> 
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> v4:
> - Add Jason's Reviewed-by tag.
> v3:
> - Introduce new API libxl_dt_overlay_domain() and co., instead of
>    reusing existing API libxl_dt_overlay().
> - Add in-code comments for the LIBXL_DT_OVERLAY_* macros.
> - Use find_domain() to avoid getting domain_id from strtol().
> v2:
> - New patch.
> ---
>   tools/include/libxl.h               | 10 +++++++
>   tools/include/xenctrl.h             |  3 +++
>   tools/libs/ctrl/xc_dt_overlay.c     | 31 +++++++++++++++++++++
>   tools/libs/light/libxl_dt_overlay.c | 28 +++++++++++++++++++
>   tools/xl/xl_cmdtable.c              |  4 +--
>   tools/xl/xl_vmcontrol.c             | 42 ++++++++++++++++++++---------
>   6 files changed, 104 insertions(+), 14 deletions(-)
> 
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index 62cb07dea6..6cc6d6bf6a 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h

I think you also need to introduce LIBXL_HAVE_...

Cheers,

-- 
Julien Grall


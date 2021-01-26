Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A844303877
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 09:59:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74657.134172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4KBf-0002l8-Ui; Tue, 26 Jan 2021 08:58:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74657.134172; Tue, 26 Jan 2021 08:58:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4KBf-0002kj-RB; Tue, 26 Jan 2021 08:58:59 +0000
Received: by outflank-mailman (input) for mailman id 74657;
 Tue, 26 Jan 2021 08:58:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l4KBd-0002kc-UH
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 08:58:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l4KBX-00021O-Mx; Tue, 26 Jan 2021 08:58:51 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l4KBX-0003kk-Dc; Tue, 26 Jan 2021 08:58:51 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=rhAAX9mxj63ew3jmpnE1Ia71wlWyOVFdlBb/ficbzoU=; b=yru/o5L84qgpaUOxxwyETVaAyZ
	UtjeTiQHX1Q0sT9gKMgupwYeBkF52FI4IRVB2S49mvj+9oBeiMqYiCVqOrxk0UrOtt8JCro9vb0Yq
	/JaKF3sd0vq5KkpUxJpIjO7m/w5F0yDKHsu5OzvUxp0MEtXliEiuP387HqbUC5yLwA1U=;
Subject: Re: [PATCH v7 01/10] xen+tools: Introduce XEN_SYSCTL_PHYSCAP_vmtrace
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
 <20210121212718.2441-2-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <bd8061a1-70ae-13bd-906f-e4a180f394a9@xen.org>
Date: Tue, 26 Jan 2021 08:58:49 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210121212718.2441-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 21/01/2021 21:27, Andrew Cooper wrote:
> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> index a073647117..d4453d2eab 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -100,6 +100,7 @@ struct xen_sysctl_tbuf_op {
>   #define _XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share 5
>   #define XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share  \
>       (1u << _XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share)
> +#define XEN_SYSCTL_PHYSCAP_vmtrace       (1 << 6)
>   
>   /* Max XEN_SYSCTL_PHYSCAP_* constant.  Used for ABI checking. */
>   #define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share

XEN_SYSCTL_PHYSCAP_MAX needs to be bumped.

Cheers,

-- 
Julien Grall


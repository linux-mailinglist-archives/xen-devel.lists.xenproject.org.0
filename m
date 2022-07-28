Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC09D584050
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 15:49:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376803.609810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH3ta-0004fb-Im; Thu, 28 Jul 2022 13:49:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376803.609810; Thu, 28 Jul 2022 13:49:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH3ta-0004d6-G1; Thu, 28 Jul 2022 13:49:46 +0000
Received: by outflank-mailman (input) for mailman id 376803;
 Thu, 28 Jul 2022 13:49:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZgEr=YB=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oH3tY-0004d0-MC
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 13:49:44 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20ce845e-0e7c-11ed-bd2d-47488cf2e6aa;
 Thu, 28 Jul 2022 15:49:43 +0200 (CEST)
Received: from [10.10.1.164] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1659016175847317.65226815143023;
 Thu, 28 Jul 2022 06:49:35 -0700 (PDT)
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
X-Inumbo-ID: 20ce845e-0e7c-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1659016178; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RZ3/5+OgMnn7+i4WOylOm9oMJtBE29tVxj6LMMFZj2P6LOq35s2H6y5xK26KRot0wU/93NRsCKGSPv0b9hunZvEch1tBva9NsmYEjUJha5RK1Sh4MQb/KotjPE1MSPsJZWM2f/SmXGrTdainauQKWtSgdyMvvWZDc86deDYp5Bc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1659016178; h=Content-Type:Content-Transfer-Encoding:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=afEealVpeYYQ911mkvyUU5lYhSkqtAYFJ71SELmAqOw=; 
	b=eXb0Ulq7C1tdaWv6RKe0uy27S/+OexMmRv5UfhCV3GoSv4ulJkdM1TwPxA1qI4yRV0uQB8L6GSmM9ffYNn55OYq6pRSETGD8/pNfUhtLzP6mj0W7n8AEo9WeM2tbmDCM0Ld/w0/MqxTxgrqRnfSKyqtyqpjvN9w0ssdu8rwOfj0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659016178;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=afEealVpeYYQ911mkvyUU5lYhSkqtAYFJ71SELmAqOw=;
	b=MQVAUv/Mx0HLttTef6MHBbFVOw7C6KlHQSQ32R+nylvBnqxF99QCiPJBhx1h22zO
	o04iyhyY8EhhJTmpDG3Iokos1ypf6N2tbZEwLrwpRYxFUaoKzJl6uCJNZC5HxW6oA8k
	pcgmrFj6n9BoAm36nCz/HmV3CIQ2sVTXJ6syqsDI=
Message-ID: <7f11413d-659d-cc4e-9af7-bef7b0331d49@apertussolutions.com>
Date: Thu, 28 Jul 2022 09:48:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] xen/xsm: dummy.h: Fix MISRA C 2012 Directive 4.10
 violation
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
References: <20220727151953.1125331-1-burzalodowa@gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20220727151953.1125331-1-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/27/22 11:19, Xenia Ragiadakou wrote:
> Protect header file from being included more than once by adding ifndef guard.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> ---
>   xen/include/xsm/dummy.h | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index 77f27e7163..8671af1ba4 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -15,6 +15,9 @@
>    *  value of action.
>    */
>   
> +#ifndef __XEN_XSM_DUMMY_H__
> +#define __XEN_XSM_DUMMY_H__
> +
>   #include <xen/sched.h>
>   #include <xsm/xsm.h>
>   #include <public/hvm/params.h>
> @@ -843,3 +846,5 @@ static XSM_INLINE int cf_check xsm_domain_resource_map(
>       XSM_ASSERT_ACTION(XSM_DM_PRIV);
>       return xsm_default_action(action, current->domain, d);
>   }
> +
> +#endif /* __XEN_XSM_DUMMY_H__ */

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>


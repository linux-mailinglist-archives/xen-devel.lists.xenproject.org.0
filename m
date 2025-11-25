Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CCFC8598A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 15:58:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171976.1497052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNuUZ-000868-UL; Tue, 25 Nov 2025 14:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171976.1497052; Tue, 25 Nov 2025 14:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNuUZ-00083a-RG; Tue, 25 Nov 2025 14:58:07 +0000
Received: by outflank-mailman (input) for mailman id 1171976;
 Tue, 25 Nov 2025 14:58:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BAQ+=6B=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1vNuUY-00083U-7Q
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 14:58:06 +0000
Received: from sender3-of-o50.zoho.com (sender3-of-o50.zoho.com
 [136.143.184.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24c27ce2-ca0f-11f0-9d18-b5c5bf9af7f9;
 Tue, 25 Nov 2025 15:58:04 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1764082677546407.94879297700277;
 Tue, 25 Nov 2025 06:57:57 -0800 (PST)
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
X-Inumbo-ID: 24c27ce2-ca0f-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; t=1764082681; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ljs2Q7oPVoSq4duXuaCrrbQS3LoAI1tqy80/NKdVTVB9yEKj3HlK+Jxc93UJ2FjqxBtgl/XfzXMm6ctZHxnHQtrOJ/SmQhhVQLQTi1bBjbUQY3u428aYIvdwk8lZO/9z38EdmcBx2yO8q7qxtlgpgdHTchh7Y1EnQ8Ig3ncvals=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764082681; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Yoz+RmkU/7jj1zCZCID1kFNyOV4CekRZCg3A5rDy9vE=; 
	b=RU1gRiizwb5RaVCn1JAZ5HhlVkLwno/+Vg8Nl8i66O9/wza2cvsnMxyJPfDMzF0AymcE37O9BEO27kgI0EtwI5O8Z1RTp6eevx3Ami1LL4sNpaxz0qWVdJnzK10v+MMAPMxNvAWTayi27KZF2IdWafAbN0L54cP4YS5E0YzfErA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764082680;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Yoz+RmkU/7jj1zCZCID1kFNyOV4CekRZCg3A5rDy9vE=;
	b=h283OBldJIdzqmsB4zntuaydR8ko41UenB9IsALPkk3kndcUTEqm6WspJDd2K0YR
	NAs0UQWs+wSsYr1OkqkgwCAixp6Te8zFc7zCMn0+3+FI5gnp6SppRIdbEkf5JFstDyo
	CNCbxF+l9QewiiWZ2eRkUlzpSkG4IZfg4VxJmPXA=
Message-ID: <d441c5b1-7ab0-4b28-b00a-67b8d6869fbf@apertussolutions.com>
Date: Tue, 25 Nov 2025 09:57:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] xen/xsm: wrap xsm_vm_event_control() with
 CONFIG_VM_EVENT
To: Penny Zheng <Penny.Zheng@amd.com>, xen-devel@lists.xenproject.org
Cc: ray.huang@amd.com, grygorii_strashko@epam.com
References: <20251121091554.1003315-1-Penny.Zheng@amd.com>
 <20251121091554.1003315-3-Penny.Zheng@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20251121091554.1003315-3-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/21/25 4:15 AM, Penny Zheng wrote:
> Function xsm_vm_event_control() is only invoked under CONFIG_VM_EVENT, so
> it shall be wrapped with it, otherwiae it will become unreachable when

otherwiae --> otherwise (maybe committer is willing to fix on commit?)

> VM_EVENT=n and hence violating Misra rule 2.1.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v1 -> v3:
> - new commit
> ---
>   xen/include/xsm/dummy.h | 2 +-
>   xen/include/xsm/xsm.h   | 4 ++--
>   xen/xsm/dummy.c         | 2 +-
>   xen/xsm/flask/hooks.c   | 4 ++--
>   4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index 12792c3a43..e801dbcdba 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -640,6 +640,7 @@ static XSM_INLINE int cf_check xsm_hvm_altp2mhvm_op(
>       }
>   }
>   
> +#ifdef CONFIG_VM_EVENT
>   static XSM_INLINE int cf_check xsm_vm_event_control(
>       XSM_DEFAULT_ARG struct domain *d, int mode, int op)
>   {
> @@ -647,7 +648,6 @@ static XSM_INLINE int cf_check xsm_vm_event_control(
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> -#ifdef CONFIG_VM_EVENT
>   static XSM_INLINE int cf_check xsm_mem_access(XSM_DEFAULT_ARG struct domain *d)
>   {
>       XSM_ASSERT_ACTION(XSM_DM_PRIV);
> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index 9a23d2827c..d9e5c831f3 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -155,9 +155,9 @@ struct xsm_ops {
>       int (*hvm_altp2mhvm_op)(struct domain *d, uint64_t mode, uint32_t op);
>       int (*get_vnumainfo)(struct domain *d);
>   
> +#ifdef CONFIG_VM_EVENT
>       int (*vm_event_control)(struct domain *d, int mode, int op);
>   
> -#ifdef CONFIG_VM_EVENT
>       int (*mem_access)(struct domain *d);
>   #endif
>   
> @@ -649,13 +649,13 @@ static inline int xsm_get_vnumainfo(xsm_default_t def, struct domain *d)
>       return alternative_call(xsm_ops.get_vnumainfo, d);
>   }
>   
> +#ifdef CONFIG_VM_EVENT
>   static inline int xsm_vm_event_control(
>       xsm_default_t def, struct domain *d, int mode, int op)
>   {
>       return alternative_call(xsm_ops.vm_event_control, d, mode, op);
>   }
>   
> -#ifdef CONFIG_VM_EVENT
>   static inline int xsm_mem_access(xsm_default_t def, struct domain *d)
>   {
>       return alternative_call(xsm_ops.mem_access, d);
> diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
> index 8b7e01b506..96dc82ac2e 100644
> --- a/xen/xsm/dummy.c
> +++ b/xen/xsm/dummy.c
> @@ -115,9 +115,9 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
>       .remove_from_physmap           = xsm_remove_from_physmap,
>       .map_gmfn_foreign              = xsm_map_gmfn_foreign,
>   
> +#ifdef CONFIG_VM_EVENT
>       .vm_event_control              = xsm_vm_event_control,
>   
> -#ifdef CONFIG_VM_EVENT
>       .mem_access                    = xsm_mem_access,
>   #endif
>   
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index b0308e1b26..9f3915617c 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1365,12 +1365,12 @@ static int cf_check flask_hvm_altp2mhvm_op(struct domain *d, uint64_t mode, uint
>       return current_has_perm(d, SECCLASS_HVM, HVM__ALTP2MHVM_OP);
>   }
>   
> +#ifdef CONFIG_VM_EVENT
>   static int cf_check flask_vm_event_control(struct domain *d, int mode, int op)
>   {
>       return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__VM_EVENT);
>   }
>   
> -#ifdef CONFIG_VM_EVENT
>   static int cf_check flask_mem_access(struct domain *d)
>   {
>       return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__MEM_ACCESS);
> @@ -1967,9 +1967,9 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
>       .do_xsm_op = do_flask_op,
>       .get_vnumainfo = flask_get_vnumainfo,
>   
> +#ifdef CONFIG_VM_EVENT
>       .vm_event_control = flask_vm_event_control,
>   
> -#ifdef CONFIG_VM_EVENT
>       .mem_access = flask_mem_access,
>   #endif
>   

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>


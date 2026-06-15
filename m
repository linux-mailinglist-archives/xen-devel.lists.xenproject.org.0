Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h0OBIJZnMGr5SgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 22:59:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0998668A145
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 22:59:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=apertussolutions.com header.s=zoho header.b=Fb8Pt4JM;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none;
	arc=pass ("zohomail.com:s=zohoarc:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338589.1599670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZENn-0006q2-6D; Mon, 15 Jun 2026 20:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338589.1599670; Mon, 15 Jun 2026 20:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZENn-0006oD-3I; Mon, 15 Jun 2026 20:58:11 +0000
Received: by outflank-mailman (input) for mailman id 1338589;
 Mon, 15 Jun 2026 20:58:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wZENl-0006o7-Hr
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 20:58:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZENk-001yAg-Q2
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 22:58:08 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a306756-5cb7-0a2a0a5109dd-0a2a45018250-4
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 22:58:07 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a30675d-c1f2-0a2a45010019-888fbc3352a2-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 22:58:07 +0200
Received: by mx.zohomail.com with SMTPS id 1781557075955537.0765508599555;
 Mon, 15 Jun 2026 13:57:55 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1781557079; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VJ4CRmWVuHyrtyj8pZ3zmsGueqWWh/WBW6EF4knnADJ0cDLbOTC3O+qX+pmujaYWAKdVmTbRshUcy9WFTdW27Et+6nIc1hq5dOIAUSEKAr8pLvXS4FDfEKOMwiKncEPGgyoiUjVLwczeQRRA7VpMUam2ibmKc5mLy+PICJD5/YI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781557079; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pq6G/TrdOTj3+AGR//pinKM6urItHglXx3EtWTrB7xM=; 
	b=NyOnrPKdldeck2Rh202j9nJJTIC7T9mHyk7MrTr1O4Ps1MduUDgH3sLptkeZ/yKW7MWDUUSIcrX/p1fSCdyIXYZiPLs5FSG6ol9kx90QRssFcVE7JPtGVxr+W7fPIAyEScyU5S0Yf3ZcCOu2GgHRoTDLMmy2hrwgJNX/odyVPNE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781557079;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=pq6G/TrdOTj3+AGR//pinKM6urItHglXx3EtWTrB7xM=;
	b=Fb8Pt4JM+gv0mNChvGzm/j+KJHqUGlqLU7pEJfqGtnLqy1ww0sUr5QBbmCvcRFdh
	c3Du9dmdTTCmNiszCHi5lTDLlpiYf1f2yI/XjtGfpI7PJx62KqljnirSgzrcO8CcJ0+
	0K270c2lT8qUUjpYRNXo9qocOZHo0RwKmzLT6wzw=
Message-ID: <814fbf20-3652-4051-acef-01abbae49362@apertussolutions.com>
Date: Mon, 15 Jun 2026 16:57:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22? 5/9] domctl/XSM: avoid XSM_OTHER with
 xsm_domctl()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
 <0986c7e3-7a1f-4e1e-b132-78593c8b63e1@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <0986c7e3-7a1f-4e1e-b132-78593c8b63e1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-d62444/1781557087-ADBA8FF4-9988D806/0/0
X-purgate-type: clean
X-purgate-size: 2495
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[9];
	DMARC_NA(0.00)[apertussolutions.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,gmail.com];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,apertussolutions.com:dkim,apertussolutions.com:email,apertussolutions.com:mid,apertussolutions.com:from_mime];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0998668A145

On 6/15/26 10:13 AM, Jan Beulich wrote:
> Make explicit at the call sites what (default) permission is required.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -331,7 +331,7 @@ long arch_do_domctl(
>           /* Games to allow this code block to handle a compat guest. */
>           void __user *guest_handle = domctl->u.getpageframeinfo3.array.p;
>   
> -        ret = xsm_domctl(XSM_OTHER, d, domctl);
> +        ret = xsm_domctl(XSM_PRIV, d, domctl);
>           if ( ret )
>               break;
>   
> --- a/xen/arch/x86/mm/paging.c
> +++ b/xen/arch/x86/mm/paging.c
> @@ -743,7 +743,7 @@ long do_paging_domctl_cont(
>       if ( d == NULL )
>           return -ESRCH;
>   
> -    ret = xsm_domctl(XSM_OTHER, d, &op);
> +    ret = xsm_domctl(XSM_PRIV, d, &op);
>       if ( !ret )
>       {
>           bool lock = !(op.u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_CLEAN ||
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -516,7 +516,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
>           if ( op->u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_CLEAN ||
>                op->u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_PEEK )
>           {
> -            ret = xsm_domctl(XSM_OTHER, d, op);
> +            ret = xsm_domctl(XSM_PRIV, d, op);
>               if ( !ret )
>                   ret = arch_do_domctl(op, d, u_domctl);
>               goto domctl_out_unlock_rcuonly;
> @@ -542,7 +542,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
>           break;
>       }
>   
> -    ret = xsm_domctl(XSM_OTHER, d, op);
> +    ret = xsm_domctl(XSM_PRIV, d, op);
>       if ( ret )
>           goto domctl_out_unlock_rcuonly;
>   
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -157,7 +157,7 @@ static XSM_INLINE int cf_check xsm_set_t
>   static XSM_INLINE int cf_check xsm_domctl(
>       XSM_DEFAULT_ARG struct domain *d, struct xen_domctl *op)
>   {
> -    XSM_ASSERT_ACTION(XSM_OTHER);
> +    XSM_ASSERT_ACTION(XSM_PRIV);
>       switch ( op->cmd )
>       {
>       case XEN_DOMCTL_bind_pt_irq:
> @@ -176,7 +176,7 @@ static XSM_INLINE int cf_check xsm_domct
>           return -EILSEQ;
>   
>       default:
> -        return xsm_default_action(XSM_PRIV, current->domain, d);
> +        return xsm_default_action(action, current->domain, d);
>       }
>   }
>   
> 

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>



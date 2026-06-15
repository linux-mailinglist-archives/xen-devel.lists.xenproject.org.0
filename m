Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NiKgFq8IMGrAMAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 16:14:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B695A686FE9
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 16:14:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=eLslGjym;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338282.1599301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ84Z-0002WY-DG; Mon, 15 Jun 2026 14:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338282.1599301; Mon, 15 Jun 2026 14:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ84Z-0002Ux-AQ; Mon, 15 Jun 2026 14:13:55 +0000
Received: by outflank-mailman (input) for mailman id 1338282;
 Mon, 15 Jun 2026 14:13:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZ84Y-0002UK-0Q
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 14:13:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ84W-006mCl-Tu
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 16:13:52 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a30089a-e002-0a2a0a5209dd-0a2a450c9d2c-16
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:13:52 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3008a0-62f1-0a2a450c0019-d1558035dc20-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:13:52 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4905529b933so34284455e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 07:13:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922033156csm242890575e9.7.2026.06.15.07.13.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 07:13:51 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781532832; x=1782137632; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zMGq+ldkZYUEV1vp7v9zJ2c75lUX/WxhphkfBdJ74bA=;
        b=eLslGjymOfRi7dYoMnv0R4c37z0in3BWdsV9f5nbADwcMMPx1xZWxXj/Rnp9NbcpGj
         s0DpYO1XDOQuvNGSRyKeYUWs3dxRKpSwniCgC5D+itO3Z37LUnSpGNC+/jowv7U5bkWy
         iCGWInD8SFHWVzgHmUCTT4QPguxKJbOo4FpeLmBDecKPrkGmt9VKJHidp6tB7SEM+Zrs
         SwbjLqXBtV79CVY6AB1WQ2vUEsmi7yOmy28iGPyHZl3GlkoXKIa/XJHaHVHP0rpRUQgF
         td0YNaygx1ZeM7DsoE2ov3Am4C/5gPc9p9xG9L9b2snDypfwmcQvrXpphpOVFf6gOFHl
         RHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532832; x=1782137632;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMGq+ldkZYUEV1vp7v9zJ2c75lUX/WxhphkfBdJ74bA=;
        b=S/OJN/ivVyk6GiF2q1JtqWzKf3UASXTCbG3jjJ6/lThvsQv02rZaqUV9PHdERC6vxp
         PWhJoGgA+gkAUPctb7W7e7ipleGRYYlM4QqaLQWBl+XpB8l1JJIT7KK07B34yLxVDJJL
         GV7dWFiLK1N1//bMwQVMBzenUne2RwV00f98GNnnpXpTK9qVEqucH4VuW6qYqTU0P/xe
         98BoLniKFBx9P+/o+OyAItdq6H5NGuAAkpr4GUXGTpfanHy6KxMBjRCPa1ghHHF9Ng9X
         +s3qyXC4EhxinLoN4hrZC1kW0FICBFDNPPi6+xaxb7OQagsqRGhiZ6z/ZSujwgRACVXy
         mx7A==
X-Gm-Message-State: AOJu0YyMYwzpU+snsLnjyZq5GNKcEtv/TAS4+U9O7X7/wb1Md9VUliq4
	PQDqbASTfUCZnloM3pf9zSJq7tgHktf140FAM6se6RIrs0SVpvE8l6u3YwAuAJKDHcKt3aR4QaE
	h07M=
X-Gm-Gg: Acq92OE6ywmKlvybqEDqBE0a9ZpfqzJMsApXQxfqwFrKPHcibvYS+XDdPvaZW/gnUwo
	7OXOljGKxzPzXh4I9Jj98KYTA7yCbSogVbJ7xx0Di2TtErh1CuO32HhD0jFHwS3nWO0gdBAdbLb
	kC85/EEoCdLPS1gQ1B4GL76gIt6OrPXHNzNphyeVvIjlM/6KFW5Zw+B5fuxP07Juyx5dAwjO/DM
	DhQeD/5wjX1zQKFIF1Ui48F3S391Vr03bo/WxBxA961xsPcbJgI2LEF7Eqb6HlYBQ0k1vqdp4/o
	3OjT1veEDys+lseujRxFpcpy79JCPuPdyexGvhAAfRoIteC2+E4cUdWXPT7QTgzUpDlEBt5X9dU
	zMseDSkKv1lJC8bgNPPsKyJJE9MXoG9gTb/ZbXtis/N0R3Ap4PiS79ptYlRIxTalBLFr1yYAKb3
	IeEaQtFTjoIlTm5Z7DWDrfr90vE6zYzdQ6A8H0VVIU3aFH7ugrCSVcoJMBUTfrGrJ3V/mbKFLj7
	TTmNUHJoKBtddKssV/jZM7thA==
X-Received: by 2002:a05:600c:83c8:b0:492:1e36:d16e with SMTP id 5b1f17b1804b1-4921e36d1a9mr147508545e9.36.1781532832246;
        Mon, 15 Jun 2026 07:13:52 -0700 (PDT)
Message-ID: <0986c7e3-7a1f-4e1e-b132-78593c8b63e1@suse.com>
Date: Mon, 15 Jun 2026 16:13:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.22? 5/9] domctl/XSM: avoid XSM_OTHER with xsm_domctl()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1781532832-E2D73CF5-81C86F79/0/0
X-purgate-type: clean
X-purgate-size: 2222
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,gmail.com,apertussolutions.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:dpsmith@apertussolutions.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B695A686FE9

Make explicit at the call sites what (default) permission is required.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -331,7 +331,7 @@ long arch_do_domctl(
         /* Games to allow this code block to handle a compat guest. */
         void __user *guest_handle = domctl->u.getpageframeinfo3.array.p;
 
-        ret = xsm_domctl(XSM_OTHER, d, domctl);
+        ret = xsm_domctl(XSM_PRIV, d, domctl);
         if ( ret )
             break;
 
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -743,7 +743,7 @@ long do_paging_domctl_cont(
     if ( d == NULL )
         return -ESRCH;
 
-    ret = xsm_domctl(XSM_OTHER, d, &op);
+    ret = xsm_domctl(XSM_PRIV, d, &op);
     if ( !ret )
     {
         bool lock = !(op.u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_CLEAN ||
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -516,7 +516,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
         if ( op->u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_CLEAN ||
              op->u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_PEEK )
         {
-            ret = xsm_domctl(XSM_OTHER, d, op);
+            ret = xsm_domctl(XSM_PRIV, d, op);
             if ( !ret )
                 ret = arch_do_domctl(op, d, u_domctl);
             goto domctl_out_unlock_rcuonly;
@@ -542,7 +542,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
         break;
     }
 
-    ret = xsm_domctl(XSM_OTHER, d, op);
+    ret = xsm_domctl(XSM_PRIV, d, op);
     if ( ret )
         goto domctl_out_unlock_rcuonly;
 
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -157,7 +157,7 @@ static XSM_INLINE int cf_check xsm_set_t
 static XSM_INLINE int cf_check xsm_domctl(
     XSM_DEFAULT_ARG struct domain *d, struct xen_domctl *op)
 {
-    XSM_ASSERT_ACTION(XSM_OTHER);
+    XSM_ASSERT_ACTION(XSM_PRIV);
     switch ( op->cmd )
     {
     case XEN_DOMCTL_bind_pt_irq:
@@ -176,7 +176,7 @@ static XSM_INLINE int cf_check xsm_domct
         return -EILSEQ;
 
     default:
-        return xsm_default_action(XSM_PRIV, current->domain, d);
+        return xsm_default_action(action, current->domain, d);
     }
 }
 



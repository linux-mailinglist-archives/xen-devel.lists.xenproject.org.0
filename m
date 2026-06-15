Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1AKNFmEIMGqZMAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 16:12:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E17686FAA
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 16:12:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=aNmehiaE;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338262.1599275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ83N-00012a-Jh; Mon, 15 Jun 2026 14:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338262.1599275; Mon, 15 Jun 2026 14:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ83N-0000zz-GQ; Mon, 15 Jun 2026 14:12:41 +0000
Received: by outflank-mailman (input) for mailman id 1338262;
 Mon, 15 Jun 2026 14:12:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZ83M-0000zl-Mi
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 14:12:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ83M-002zqf-3P
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 16:12:40 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a300851-2eae-0a2a0a5409dd-0a2a4506d8c6-16
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:12:40 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a300857-7371-0a2a45060019-d155dd2fc5e5-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:12:40 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-4619990ca5fso677726f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 07:12:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2c3fcfsm30875264f8f.26.2026.06.15.07.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 07:12:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1781532759; x=1782137559; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fK7QM9bVPTyHbmVo2K2FzO8qnNGFwS/xRqf+62OlG7M=;
        b=aNmehiaE+K4GWliA7sc1Wu7AiiLBrnz1MqMXahBr/u9JYkLUU6kH3H8nO9uoivH/HR
         I4kEgzwSb/4NUyckYVQjAl/acYh2FFCvBB45XJ/TUWj0sSgO2Zuc/09Yl8gNzKtLSxwv
         j0JcpyQxQNUmt9NFEnmBqfMQ5eTX38rPkOJT/329pFdEhjCAgYtcY1eEVZGEZrTb5YQC
         ra4cX2+yCXCCijknyRkKlGWXa+Xbz+EDZ5YyOUTecedtccIY/jyTcnvYo13Za9hyp5yM
         mldgoogT11pPbWfXUiom3UJQ7F1a+Q88/ixsVTRzAcDtMXYx6kFidN0ZBwU0i1LToVjY
         I5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532759; x=1782137559;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fK7QM9bVPTyHbmVo2K2FzO8qnNGFwS/xRqf+62OlG7M=;
        b=Js6M3Z5JFTQhtuTsRXFX9RAE7PElo+8pL+pdnTu4f8ZBPQ+7PbFEiSFrF5dCqId/f2
         TKg0QGQwPJlmKgTXG2dIortzQb7Brl0d98t8Cgkk85xWFgj9wQ+4UMwdaWgkwYocBH4S
         AICzQOAZJlvAaO3FRRPjwPp7AJf1Fqri5EWpMh21US5G3dWDY/qwPwd/kT6d5s1fg8I+
         6n6KMR/x9bStDY+WjSt+h8uH3QxeLjWxHyuFtEe/nDeJUm5JBnibyDJpChAwV/E4cmQw
         Bo1808sJnF7lezyc6YUJbfU0TMgdGqtrjubZ9SS/4DgvtmcuHfOMDmLFgvCpqQQ4Dooh
         gtiQ==
X-Gm-Message-State: AOJu0Yx52luQGgOdU3c5sjuHZnvVOdePffAE/7ty+D8670fGaQSPFdQD
	DipcYFZEWIO6ZODEJsC1vDEis9gbHzpxof+e8jgPdqzLhov310uJSqO1vfglHAQTX7dUI/GY8Xs
	4oTM=
X-Gm-Gg: Acq92OGdRgcL8/bwEhjh6MCPo4kLCs1fMWbg0njzKND3oUTDRH3UK1kJ0OX/rW1jB29
	Ji65rVn3XDi6prfu5fPE3sbSmZbWeHBCGO/JqbND2bsbWYs9CIo1wacRPce3mCMSDf5d2X6GeOm
	EIkxuh+MM53PxFB4vsX5erZuvXs1XjTLVCLoQUopMm+h8TUWCrm3/RFFLpOUqnebSfOJANSXtRA
	6IqybT87umtpG7ut/eY4JGoIZ8kB8fBv1Ll9vhR4v37NGDkrQ/vzft1EHkFen21RlBG+wb3ZItf
	EZwWY1FGoR1HnSu0A1kR/igDKRAbyA11MwMbkrO58rizFJ0iNmHFJUrXXK+1Bn024HCvkWqIlXR
	6SEICpCIQA+Wfx+HJ/Wt5fR2EgPHnf6oaRu8Chiu8eEA/RhOVwGAbQpGSTDBVoFoxu7+eQwn4gb
	6quhTRRwYOFpWKP/8v6R87SUJvCwJEYa+iaWcgTa6QQOLnlV+YHNBf1NPUbcqJN/B+/Fp3UMb5u
	h9bpllvbLeihwU=
X-Received: by 2002:a05:6000:1446:b0:43c:fb48:6856 with SMTP id ffacd0b85a97d-46074a5bdeamr15698080f8f.13.1781532759294;
        Mon, 15 Jun 2026 07:12:39 -0700 (PDT)
Message-ID: <96a089dc-a0dd-4f40-b1e4-5573202bf532@suse.com>
Date: Mon, 15 Jun 2026 16:12:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.22? 2/9] domctl: move XEN_DOMCTL_irq_permission handling
 to x86 code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1781532760-86168D75-1721B01B/0/0
X-purgate-type: clean
X-purgate-size: 2830
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,citrix.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4E17686FAA

HAS_PIRQ is selected by x86 only, and that's expected to remain that way.
Avoid the #ifdef needed by moving the logic to arch_do_domctl(). Leverage
"currd" being available as a local variable there while doing so.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -258,6 +258,36 @@ long arch_do_domctl(
         break;
     }
 
+    case XEN_DOMCTL_irq_permission:
+    {
+        unsigned int pirq = domctl->u.irq_permission.pirq, irq;
+        bool allow = domctl->u.irq_permission.allow_access;
+
+        ret = -EINVAL;
+        if ( pirq >= currd->nr_pirqs )
+            break;
+
+        irq = domain_pirq_to_irq(currd, pirq);
+
+        ret = -EPERM;
+        if ( irq )
+            ret = xsm_irq_permission(XSM_PRIV, d, irq, allow);
+        if ( ret )
+            break;
+
+        iocaps_double_lock(d, true);
+
+        if ( !irq_access_permitted(currd, irq) )
+            ret = -EPERM;
+        else if ( allow )
+            ret = irq_permit_access(d, irq);
+        else
+            ret = irq_deny_access(d, irq);
+
+        iocaps_double_unlock(d, true);
+        break;
+    }
+
     case XEN_DOMCTL_gsi_permission:
     {
         int irq;
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -471,38 +471,6 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
         goto domctl_out_unlock_domonly;
     }
 
-#ifdef CONFIG_HAS_PIRQ
-    case XEN_DOMCTL_irq_permission:
-    {
-        unsigned int pirq = op->u.irq_permission.pirq, irq;
-        bool allow = op->u.irq_permission.allow_access;
-
-        ret = -EINVAL;
-        if ( pirq >= current->domain->nr_pirqs )
-            goto domctl_out_unlock_domonly;
-
-        irq = domain_pirq_to_irq(current->domain, pirq);
-
-        ret = -EPERM;
-        if ( irq )
-            ret = xsm_irq_permission(XSM_PRIV, d, irq, allow);
-        if ( ret )
-            goto domctl_out_unlock_domonly;
-
-        iocaps_double_lock(d, true);
-
-        if ( !irq_access_permitted(current->domain, irq) )
-            ret = -EPERM;
-        else if ( allow )
-            ret = irq_permit_access(d, irq);
-        else
-            ret = irq_deny_access(d, irq);
-
-        iocaps_double_unlock(d, true);
-        goto domctl_out_unlock_domonly;
-    }
-#endif
-
     case XEN_DOMCTL_set_target:
     {
         struct domain *e = get_domain_by_id(op->u.set_target.target);
@@ -563,6 +531,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
 
     case XEN_DOMCTL_ioport_permission:
     case XEN_DOMCTL_ioport_mapping:
+    case XEN_DOMCTL_irq_permission:
     case XEN_DOMCTL_gsi_permission:
     case XEN_DOMCTL_bind_pt_irq:
     case XEN_DOMCTL_unbind_pt_irq:



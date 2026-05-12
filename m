Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCdYNhxJA2pU2wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:37:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C086523CA6
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:36:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307009.1578749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpAC-0004J9-0C; Tue, 12 May 2026 15:36:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307009.1578749; Tue, 12 May 2026 15:36:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpAB-0004Gj-TL; Tue, 12 May 2026 15:36:51 +0000
Received: by outflank-mailman (input) for mailman id 1307009;
 Tue, 12 May 2026 15:36:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMpAA-0004G2-47
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 15:36:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMpA9-00AM4u-H4
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:36:49 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a034911-bab6-0a2a0a5309dd-0a2a4508c200-0
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:36:49 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a034911-63b5-0a2a45080019-d1558029e984-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:36:49 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4891d7164ddso32279685e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 08:36:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8d15e09sm5653765e9.3.2026.05.12.08.36.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 08:36:48 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778600209; x=1779205009; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Oi+Og7lmHi8fzPQHLlkJ8CT1xlB+s06Eq97nVFSpVO8=;
        b=IeH7ecdVEaaBi/1qTxUZOeRvkKadcscVEzGutApZIKleWkrxDQwM64SWyfQKny54z9
         9QQA7WxJFgh81G5NUFcMo7xdxtCjkN6Ao7YAG1MTDEgrwFb6egSmclvbryI+cHDRCuyA
         q7gA93TxmF8UANSu8rWdPxQsHe2M2+kOS/SyODjPAt/4w8/4AAd+w7B7AesxLnnEJ4Fr
         1DPhiYHsIMtBHJ3kBWjcSFrI4r8FI64lXf5C1Sx77X5w111bdSPve7OjLtWNJQY8E2BE
         fwrfN3B7PWk52RR9lG7SMrA+LmAMfsMQ2OYiU2ff2AO9H4zr6wtPOKbjm9MNbFXUegXa
         XdiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778600209; x=1779205009;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oi+Og7lmHi8fzPQHLlkJ8CT1xlB+s06Eq97nVFSpVO8=;
        b=LWvEFBwEjjz4puR9jTHvcUhfJ2O8Y+MQN2494cBwqesK28GDWgvUTgtZ+Z0MVWVtQj
         BIdASPpspN6Il+sKsZrZbEagt1U8mj9oDZlDViFy+elLplN6RWMePQf1vQRsh266MDbT
         bT8IqpoAD5mo60axpyxk3RU8i3M8ehUHEZkqpkuAws8KbfwH9odhQt+FaqG52KPLRkYc
         cp5S/X0SrVEtxQ3gCswuG75ne41PVvYv+mGF9n986qhqOMOKqhPs4zW4VXTyXEaMPeuB
         WnKUTnxGJ1eduZPbQetbCqXniM7hElF1BPTyHsj3ifraQ3bG4B9GMBWfxr37RtW5pxxG
         9xWA==
X-Gm-Message-State: AOJu0YyP+RTAsCj+B8BnD8bsfOElgEw/Gxve1pS4COocYqaHXyxNpTAB
	jF5/Oie2Yiy20QREWNMTpeEfdiaZ94YZyfAo/vOqHNq3azq65/AgMAiMFTw/yU27WC6Ht89pGTU
	CqFk=
X-Gm-Gg: Acq92OHJ5mNRsb+xXimGwQK4jajjFqT/XTCjgMHDvknrmNv+i8cmROCylWVZw4hs4sR
	HvJgG9xJNmePgoaKLsem9smjLhnT7EstxLzQUdDoLeXZCGjSStqHNTS3zMqO/KVtFilH7VHUtpO
	Whn0EU5WRhSYgLSfyWVZjEfknhWQW5cFgywDc8vCtk8wNkSeszbEzKJ4+op5BZFlVSn1IjIgdei
	hRBq3phHua1PjrXHPgv9E/tz8DYMjLMYttfqtt/mY2sTUH/8prUJnTQLk213idnho8h+fSRgvfE
	7pZyB8ETaG4bAWWBCYc4XM9el5iK0OMzsUG/QaIlLtIQVY8DBa5YMa29xVQPZgfCJ2tLbWnq/4K
	qt4aiIYkLk/k1ikt1hEYJCkTcvfTDFKuWujQeHdvIiaeGVXHtSlqx/vGK9IapL/hZQOVSzF88+9
	zEi86jw7OgFzBeBEQ178ddHzfOmLca0ZegSNxvSxMzzR8Tl+CD7CAZGGpEA8s3fYPL9sivV5UL2
	PoZizrmvu6T+og=
X-Received: by 2002:a05:600c:6290:b0:485:3f30:6250 with SMTP id 5b1f17b1804b1-48e51f3fd58mr510167455e9.20.1778600208885;
        Tue, 12 May 2026 08:36:48 -0700 (PDT)
Message-ID: <2e8a4a74-fae9-4c75-aa98-f4b0dc7ac6bf@suse.com>
Date: Tue, 12 May 2026 17:36:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.22 v2 4/8] x86/mwait-idle: move pre-initialized struct
 idle_cpu instances
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <178739fe-fa41-4ff7-b16e-67c4b2a99b38@suse.com>
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
In-Reply-To: <178739fe-fa41-4ff7-b16e-67c4b2a99b38@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1778600209-BCD63DB1-4E30620E/0/0
X-purgate-type: clean
X-purgate-size: 5568
X-Rspamd-Queue-Id: 5C086523CA6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:mid,suse.com:dkim,citrix.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Now that they're not referenced anymore post-init, they can themselves
move into .init.rodata. (idle_cpu_adl{,_l} can also become const in the
first place.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -1167,132 +1167,132 @@ static void cf_check c1e_promotion_disab
 	wrmsrl(MSR_IA32_POWER_CTL, msr_bits);
 }
 
-static const struct idle_cpu idle_cpu_nehalem = {
+static const struct idle_cpu __initconstrel idle_cpu_nehalem = {
 	.state_table = nehalem_cstates,
 	.auto_demotion_disable_flags = NHM_C1_AUTO_DEMOTE | NHM_C3_AUTO_DEMOTE,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
-static const struct idle_cpu idle_cpu_atom = {
+static const struct idle_cpu __initconstrel idle_cpu_atom = {
 	.state_table = atom_cstates,
 };
 
-static const struct idle_cpu idle_cpu_tangier = {
+static const struct idle_cpu __initconstrel idle_cpu_tangier = {
 	.state_table = tangier_cstates,
 };
 
-static const struct idle_cpu idle_cpu_lincroft = {
+static const struct idle_cpu __initconstrel idle_cpu_lincroft = {
 	.state_table = atom_cstates,
 	.auto_demotion_disable_flags = ATM_LNC_C6_AUTO_DEMOTE,
 };
 
-static const struct idle_cpu idle_cpu_snb = {
+static const struct idle_cpu __initconstrel idle_cpu_snb = {
 	.state_table = snb_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
-static const struct idle_cpu idle_cpu_byt = {
+static const struct idle_cpu __initconstrel idle_cpu_byt = {
 	.state_table = byt_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
-static const struct idle_cpu idle_cpu_cht = {
+static const struct idle_cpu __initconstrel idle_cpu_cht = {
 	.state_table = cht_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
-static const struct idle_cpu idle_cpu_ivb = {
+static const struct idle_cpu __initconstrel idle_cpu_ivb = {
 	.state_table = ivb_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
-static const struct idle_cpu idle_cpu_ivt = {
+static const struct idle_cpu __initconstrel idle_cpu_ivt = {
 	.state_table = ivt_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
-static const struct idle_cpu idle_cpu_hsw = {
+static const struct idle_cpu __initconstrel idle_cpu_hsw = {
 	.state_table = hsw_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
-static const struct idle_cpu idle_cpu_bdw = {
+static const struct idle_cpu __initconstrel idle_cpu_bdw = {
 	.state_table = bdw_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
-static const struct idle_cpu idle_cpu_skl = {
+static const struct idle_cpu __initconstrel idle_cpu_skl = {
 	.state_table = skl_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
-static const struct idle_cpu idle_cpu_skx = {
+static const struct idle_cpu __initconstrel idle_cpu_skx = {
 	.state_table = skx_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
-static const struct idle_cpu idle_cpu_icx = {
+static const struct idle_cpu __initconstrel idle_cpu_icx = {
 	.state_table = icx_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
-static struct idle_cpu __ro_after_init idle_cpu_adl = {
+static const struct idle_cpu __initconstrel idle_cpu_adl = {
 	.state_table = adl_cstates,
 };
 
-static struct idle_cpu __ro_after_init idle_cpu_adl_l = {
+static const struct idle_cpu __initconstrel idle_cpu_adl_l = {
 	.state_table = adl_l_cstates,
 };
 
-static const struct idle_cpu idle_cpu_mtl_l = {
+static const struct idle_cpu __initconstrel idle_cpu_mtl_l = {
 	.state_table = mtl_l_cstates,
 };
 
-static const struct idle_cpu idle_cpu_gmt = {
+static const struct idle_cpu __initconstrel idle_cpu_gmt = {
 	.state_table = gmt_cstates,
 };
 
-static const struct idle_cpu idle_cpu_spr = {
+static const struct idle_cpu __initconstrel idle_cpu_spr = {
 	.state_table = spr_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
-static const struct idle_cpu idle_cpu_gnr = {
+static const struct idle_cpu __initconstrel idle_cpu_gnr = {
 	.state_table = gnr_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
-static const struct idle_cpu idle_cpu_gnrd = {
+static const struct idle_cpu __initconstrel idle_cpu_gnrd = {
 	.state_table = gnrd_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
-static const struct idle_cpu idle_cpu_avn = {
+static const struct idle_cpu __initconstrel idle_cpu_avn = {
 	.state_table = avn_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
-static const struct idle_cpu idle_cpu_bxt = {
+static const struct idle_cpu __initconstrel idle_cpu_bxt = {
 	.state_table = bxt_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
-static const struct idle_cpu idle_cpu_dnv = {
+static const struct idle_cpu __initconstrel idle_cpu_dnv = {
 	.state_table = dnv_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
-static const struct idle_cpu idle_cpu_snr = {
+static const struct idle_cpu __initconstrel idle_cpu_snr = {
 	.state_table = snr_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
-static const struct idle_cpu idle_cpu_grr = {
+static const struct idle_cpu __initconstrel idle_cpu_grr = {
 	.state_table = grr_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
-static const struct idle_cpu idle_cpu_srf = {
+static const struct idle_cpu __initconstrel idle_cpu_srf = {
 	.state_table = srf_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };



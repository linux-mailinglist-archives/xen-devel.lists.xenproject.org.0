Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ABfGyTwsmnAQwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:56:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0043F27615B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:56:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252772.1549337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0jKF-0000xa-UD; Thu, 12 Mar 2026 16:55:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252772.1549337; Thu, 12 Mar 2026 16:55:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0jKF-0000vU-RE; Thu, 12 Mar 2026 16:55:55 +0000
Received: by outflank-mailman (input) for mailman id 1252772;
 Thu, 12 Mar 2026 16:55:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0jKE-0000EC-1y
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 16:55:54 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 547a5fb3-1e34-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 17:55:53 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4853510b4f3so16238635e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 09:55:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541aa73dasm693358825e9.2.2026.03.12.09.55.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 09:55:51 -0700 (PDT)
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
X-Inumbo-ID: 547a5fb3-1e34-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773334552; x=1773939352; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Zqpvz5INomrf1w7sEL/xZCVv7pCruy4Bd5QH3mgXqjc=;
        b=GdJFuQ08B6/lyk/mNyxz+jG/rxUGjossdmGtp8RVU/aJqMRlL9daUTcGUMl1I8PVsz
         yQx8gJY/wirGaE5dGJrEuio7+kY9j6khIv4PRaxgYS4cXDJS9ZlfmjnmUxr16DNzo8lI
         /zReHFS0k3UPaSjKQbL4XgKZfFa44CaYRV94p0pg4Ox+yZJ4WaJpqT+Da14VrnVbGVqQ
         w98a/ZKVgxWlViAwrP7Z5pOv/Mc/m54rLvwdub/2hQFmxgQfYfTyy8vQC9qVkihZZUaB
         FfY7l9eoY9N4jABB5tCYtthHsQk85EI/6+HxEDVYlWEQ3x+Yzp5fPjAGR8Pjdtrzqoln
         FaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773334552; x=1773939352;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zqpvz5INomrf1w7sEL/xZCVv7pCruy4Bd5QH3mgXqjc=;
        b=OPmyZbPOoDtQLXw3T/TFgYlBGf7tx9o2P01gDkYMmEksawsi1YVBdTDLq4D45eJc4P
         FOL5FZgkv4/rlRJ0Cyj5hIZA/gYhtcgQEPXdeqQB59ouovpxyRDiKUDHwGEAGpybIIHs
         /fHS1me2P86NVxArr0SIoCk9CT7rSaUENChxi51sTI0ZwDgAfCnH2NJeGJ80alYTOnJZ
         sQrBH7h2MQzd7MyUaRFNHKD2h6aA6h8zrUxZSi4Ve6SvhNoOLwhNnsLvfAwOWgrlSwlP
         2IILiMpYGkyJOuC/3TlT9oJFiOU7N3y0ajCOPUHU74rbOGPXPfHZy9mLhxOZIPseEwz7
         NwMA==
X-Gm-Message-State: AOJu0YwF8FwYrgkJQBG8Hb2ti+LRR1x37kfSCn2NyJDLS5dwNKEyS4XC
	dFvtG9ke92CfWc+YubRqqUpjdxM15cBCUSQ8vcRI9klgE0dr0QV7kBDDNM7QaRvNGhl+Bl7AL6r
	xueE=
X-Gm-Gg: ATEYQzxCNydjNg+bti+Qk2I55imkp0Gu5UPTNr1ajy49RDK7CYFRygr0tGqbvYhr9+T
	Dt8cGCUT0Yl2WLrK8i4XanMkUz0AJdZTEse8XrFvni3NE+1Uwp0xg/Fe5d7DOWAxiQQk+FUpFJF
	ImewlFlWgxbznK9RtLIWxAWVnrj+rP9tPJJi80xG3FAgcMqahle/n0SRauDz1ORIAbjbNg9BHL8
	MhoeYa/2tUhKhrARpmm60cFm3wHMOyIjaju6fsCoFemzmbHKI1d/ZoocY7x/AEyXo0gVyMJmH+i
	LvU1HmZ+TR8t/j3T4Non+P6mRrD72sWuUUCeKXNMFbkVVh9Y/ufrUqhRg441SHLp/kJORzlYmEJ
	swH6uT+tB8cGw9SB63LSYb9O9U/kbLdmQPAE3pDBJiBV/hbHaxo7ljTe24Kuok0rIu+Iwq1xq54
	a1M7GsJV9NDw3go2MB1q3F5J/GxhjEDU2k3ji6LD1JG2YPgqtsfHsexlEqKlNIiNw6Z45tHNZyQ
	f4uRKXlw8U16w8=
X-Received: by 2002:a05:600c:4fc6:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-485566d2f96mr272825e9.5.1773334552485;
        Thu, 12 Mar 2026 09:55:52 -0700 (PDT)
Message-ID: <797f444b-886f-46ed-9672-a0f302d47336@suse.com>
Date: Thu, 12 Mar 2026 17:55:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/9] x86/mwait-idle: move pre-initialized struct idle_cpu
 instances
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <7b7a677e-a5b9-42c8-beec-3c506b4eac52@suse.com>
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
In-Reply-To: <7b7a677e-a5b9-42c8-beec-3c506b4eac52@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0043F27615B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Now that they're not referenced anymore post-init, they can themselves
move into .init.rodata. (idle_cpu_adl{,_l} can also become const in the
first place.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIJRK0tJA2pU2wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:37:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EAB523CD2
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:37:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307026.1578768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpAx-0005Vu-E6; Tue, 12 May 2026 15:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307026.1578768; Tue, 12 May 2026 15:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpAx-0005TU-BA; Tue, 12 May 2026 15:37:39 +0000
Received: by outflank-mailman (input) for mailman id 1307026;
 Tue, 12 May 2026 15:37:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMpAw-0005Ov-5K
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 15:37:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMpAv-00BBxs-I1
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:37:37 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a034938-bab6-0a2a0a5309dd-0a2a45098220-34
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:37:37 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a034941-2497-0a2a45090019-d155dd32c877-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:37:37 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-43d77f6092eso3543632f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 08:37:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-454922715b9sm35519829f8f.36.2026.05.12.08.37.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 08:37:36 -0700 (PDT)
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
        d=suse.com; s=google; t=1778600257; x=1779205057; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xN4esOL29pmrNzImPmRnozsyDtFvl0psKxBdCZmg1fA=;
        b=TEPcNpsP4D6Z4BnCyhRYfgAm/HsA5F83A53KIdnq0ABQn5gjUXgSkH2n5CtE718BoZ
         pdB/K6ODzbXjfG217/EraXCRP9JFoLsxvsFI4Uv+jc8YmFUD5J9ea1LyluHubGQ+SP8V
         BC/cx1LYN2tDUjsrhqva/Ry49ofTOZ5tk3lDShv4BSh+p2A2mYzu+iy8rW3uL5sGHKCx
         2tiDUpIKQC6aI4Qr1VdDBBY8v8ZsFjRBf2cV2jXUjqew2viqQmoT07mskTLKiJ7ylDO8
         goPT2HHZZWocH1CZfsUtesfwIjRKu6QDIn6LCKVM4FpI5Th1kkrWimC0rPuxq3JUyfG7
         YQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778600257; x=1779205057;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xN4esOL29pmrNzImPmRnozsyDtFvl0psKxBdCZmg1fA=;
        b=DUarif0K5Ow6oW1xtLK8sWXBr0LuYVx/pP0JZ/RpuJanONKClvPK1oJ3bjPI5GmQCT
         0ub7xzM28dNcvA17xLaa9hG4xjK+ZOp1s1G4QzznVbGvfeQue/Flx1F6GtVuthAJNghN
         Sh5fhHURARpqX/HaeeRQAypgi8Zy1URKvkOwoVB8eKVInbEOV+GB0XDwHhPZ7MPqQFHb
         rsT1ypez/B0Z/F0nUw8TI8RSmfQYcIKBRfpEmy/GrUd9oECkIw5FdGaHvS1elc7bsIv4
         F5+nmEcqUgn0g6TieC/zP83h4yWpNTA9miLuiL+6qZhF5P759cot4oayrRuEY66XDti4
         3kIg==
X-Gm-Message-State: AOJu0Yynb9aIxh/BJi33E94Jx2GAQMA6yrvKwYgIU4IbxZx3+Fn7pj1z
	Lr7HDVknYKXJ62STAqIxejo4M5tQX+qD/xHJgp8wPXxma2a2vh9MZWgkV0s47PMjteXRxkgovYr
	8G00=
X-Gm-Gg: Acq92OH/afjSxEDlK3aVGXyM7xvSWOu/QvYomDJmAScT5djr/DHPITpTEfB2iNJ1wrw
	Ji509PSGe+Bzh94/5HVh+vUZ7HBxU7KZSCaAqxhkUd0qPhZkI24FrIVI4Hnf/U5jTPhygRray7O
	by+a3m7uv53ohOZjhrdZgJnGwBQBUnnKuilAdTjiA0ya47qBeDpZ41Epk/MKwzSJeqAVEUqrAZf
	/fbhm6Ytr7WnQczG7t6hUx35DFP/8AFJmlAWMGpiivq7ZRHQ8DQJBHU5nCMFsWtlJLmvARxRMBh
	GELIfwttTREaCJpYwa5hODu6oBRh8UJdlMIQQq6duqFzqaIVsngMAjpf+J11cWaU8W6aP/bub2k
	8qQffUUy15SXHw8+9qRJ6NjA+toDxlPhviqYVpkbgtrTW5VqmJESx7xQ1joFmXaY4jgbM+FBVJ2
	LrMBrmeuXJI7+Z5HBEH7VtolggTp7FdRRicqpvDD9JIJN8/YccRk3u2z/4TjU8iBncz0YiXA0QC
	i+dAL7iNLj6FcY=
X-Received: by 2002:a5d:5e01:0:b0:43f:dc54:9493 with SMTP id ffacd0b85a97d-45b14adc2cemr5530776f8f.21.1778600256958;
        Tue, 12 May 2026 08:37:36 -0700 (PDT)
Message-ID: <a0d86137-b334-43e6-92c5-be42dac44aa7@suse.com>
Date: Tue, 12 May 2026 17:37:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.22 v2 6/8] x86/mwait-idle: drop const from struct
 cpuidle_state arrays
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
X-purgate-ID: tlsNG-bad1c0/1778600257-40D67A53-BB1F923F/0/0
X-purgate-type: clean
X-purgate-size: 6280
X-Rspamd-Queue-Id: 22EAB523CD2
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:mid,suse.com:dkim];
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

A subsequent change will want to be able to alter them based on a new
command line option. (Note that some were __ro_after_init already.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -83,7 +83,7 @@ enum c1e_promotion {
 };
 
 struct idle_cpu {
-	const struct cpuidle_state *state_table;
+	struct cpuidle_state *state_table;
 
 	/*
 	 * Hardware C-state auto-demotion may not always be optimal.
@@ -139,7 +139,7 @@ struct cpuidle_state {
  * which is also the index into the MWAIT hint array.
  * Thus C0 is a dummy.
  */
-static const struct cpuidle_state nehalem_cstates[] = {
+static struct cpuidle_state __ro_after_init nehalem_cstates[] = {
 	{
 		.name = "C1",
 		.flags = MWAIT2flg(0x00),
@@ -167,7 +167,7 @@ static const struct cpuidle_state nehale
 	{}
 };
 
-static const struct cpuidle_state snb_cstates[] = {
+static struct cpuidle_state __ro_after_init snb_cstates[] = {
 	{
 		.name = "C1",
 		.flags = MWAIT2flg(0x00),
@@ -201,7 +201,7 @@ static const struct cpuidle_state snb_cs
 	{}
 };
 
-static const struct cpuidle_state byt_cstates[] = {
+static struct cpuidle_state __ro_after_init byt_cstates[] = {
 	{
 		.name = "C1",
 		.flags = MWAIT2flg(0x00),
@@ -235,7 +235,7 @@ static const struct cpuidle_state byt_cs
 	{}
 };
 
-static const struct cpuidle_state cht_cstates[] = {
+static struct cpuidle_state __ro_after_init cht_cstates[] = {
 	{
 		.name = "C1",
 		.flags = MWAIT2flg(0x00),
@@ -269,7 +269,7 @@ static const struct cpuidle_state cht_cs
 	{}
 };
 
-static const struct cpuidle_state ivb_cstates[] = {
+static struct cpuidle_state __ro_after_init ivb_cstates[] = {
 	{
 		.name = "C1",
 		.flags = MWAIT2flg(0x00),
@@ -303,7 +303,7 @@ static const struct cpuidle_state ivb_cs
 	{}
 };
 
-static const struct cpuidle_state ivt_cstates[] = {
+static struct cpuidle_state __ro_after_init ivt_cstates[] = {
 	{
 		.name = "C1",
 		.flags = MWAIT2flg(0x00),
@@ -331,7 +331,7 @@ static const struct cpuidle_state ivt_cs
 	{}
 };
 
-static const struct cpuidle_state ivt_cstates_4s[] = {
+static struct cpuidle_state __ro_after_init ivt_cstates_4s[] = {
 	{
 		.name = "C1",
 		.flags = MWAIT2flg(0x00),
@@ -359,7 +359,7 @@ static const struct cpuidle_state ivt_cs
 	{}
 };
 
-static const struct cpuidle_state ivt_cstates_8s[] = {
+static struct cpuidle_state __ro_after_init ivt_cstates_8s[] = {
 	{
 		.name = "C1",
 		.flags = MWAIT2flg(0x00),
@@ -387,7 +387,7 @@ static const struct cpuidle_state ivt_cs
 	{}
 };
 
-static const struct cpuidle_state hsw_cstates[] = {
+static struct cpuidle_state __ro_after_init hsw_cstates[] = {
 	{
 		.name = "C1",
 		.flags = MWAIT2flg(0x00),
@@ -439,7 +439,7 @@ static const struct cpuidle_state hsw_cs
 	{}
 };
 
-static const struct cpuidle_state bdw_cstates[] = {
+static struct cpuidle_state __ro_after_init bdw_cstates[] = {
 	{
 		.name = "C1",
 		.flags = MWAIT2flg(0x00),
@@ -565,7 +565,7 @@ static struct cpuidle_state __ro_after_i
 	{}
 };
 
-static const struct cpuidle_state icx_cstates[] = {
+static struct cpuidle_state __ro_after_init icx_cstates[] = {
        {
                .name = "C1",
                .flags = MWAIT2flg(0x00) | CPUIDLE_FLAG_IRQ_ENABLE,
@@ -665,7 +665,7 @@ static struct cpuidle_state __ro_after_i
 	{}
 };
 
-static const struct cpuidle_state mtl_l_cstates[] = {
+static struct cpuidle_state __ro_after_init mtl_l_cstates[] = {
 	{
 		.name = "C1E",
 		.flags = MWAIT2flg(0x01),
@@ -687,7 +687,7 @@ static const struct cpuidle_state mtl_l_
 	{}
 };
 
-static const struct cpuidle_state gmt_cstates[] = {
+static struct cpuidle_state __ro_after_init gmt_cstates[] = {
 	{
 		.name = "C1",
 		.flags = MWAIT2flg(0x00) | CPUIDLE_FLAG_DISABLED,
@@ -743,7 +743,7 @@ static struct cpuidle_state __ro_after_i
 	{}
 };
 
-static const struct cpuidle_state gnr_cstates[] = {
+static struct cpuidle_state __ro_after_init gnr_cstates[] = {
 	{
 		.name = "C1",
 		.flags = MWAIT2flg(0x00),
@@ -771,7 +771,7 @@ static const struct cpuidle_state gnr_cs
 	{}
 };
 
-static const struct cpuidle_state gnrd_cstates[] = {
+static struct cpuidle_state __ro_after_init gnrd_cstates[] = {
 	{
 		.name = "C1",
 		.flags = MWAIT2flg(0x00),
@@ -799,7 +799,7 @@ static const struct cpuidle_state gnrd_c
 	{}
 };
 
-static const struct cpuidle_state atom_cstates[] = {
+static struct cpuidle_state __ro_after_init atom_cstates[] = {
 	{
 		.name = "C1E",
 		.flags = MWAIT2flg(0x00),
@@ -827,7 +827,7 @@ static const struct cpuidle_state atom_c
 	{}
 };
 
-static const struct cpuidle_state tangier_cstates[] = {
+static struct cpuidle_state __ro_after_init tangier_cstates[] = {
 	{
 		.name = "C1",
 		.flags = MWAIT2flg(0x00),
@@ -861,7 +861,7 @@ static const struct cpuidle_state tangie
 	{}
 };
 
-static const struct cpuidle_state avn_cstates[] = {
+static struct cpuidle_state __ro_after_init avn_cstates[] = {
 	{
 		.name = "C1",
 		.flags = MWAIT2flg(0x00),
@@ -923,7 +923,7 @@ static struct cpuidle_state __ro_after_i
 	{}
 };
 
-static const struct cpuidle_state dnv_cstates[] = {
+static struct cpuidle_state __ro_after_init dnv_cstates[] = {
 	{
 		.name = "C1",
 		.flags = MWAIT2flg(0x00),
@@ -949,7 +949,7 @@ static const struct cpuidle_state dnv_cs
  * Note, depending on HW and FW revision, SnowRidge SoC may or may not support
  * C6, and this is indicated in the CPUID mwait leaf.
  */
-static const struct cpuidle_state snr_cstates[] = {
+static struct cpuidle_state __ro_after_init snr_cstates[] = {
 	{
 		.name = "C1",
 		.flags = MWAIT2flg(0x00),
@@ -971,7 +971,7 @@ static const struct cpuidle_state snr_cs
 	{}
 };
 
-static const struct cpuidle_state grr_cstates[] = {
+static struct cpuidle_state __ro_after_init grr_cstates[] = {
 	{
 		.name = "C1",
 		.flags = MWAIT2flg(0x00),
@@ -993,7 +993,7 @@ static const struct cpuidle_state grr_cs
 	{}
 };
 
-static const struct cpuidle_state srf_cstates[] = {
+static struct cpuidle_state __ro_after_init srf_cstates[] = {
 	{
 		.name = "C1",
 		.flags = MWAIT2flg(0x00),



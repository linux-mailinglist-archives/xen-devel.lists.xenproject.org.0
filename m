Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eI/3N3/wsmlBRAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:57:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5470427623E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:57:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252785.1549346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0jLi-0001hl-7h; Thu, 12 Mar 2026 16:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252785.1549346; Thu, 12 Mar 2026 16:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0jLi-0001fd-4u; Thu, 12 Mar 2026 16:57:26 +0000
Received: by outflank-mailman (input) for mailman id 1252785;
 Thu, 12 Mar 2026 16:57:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0jLg-0001fS-0j
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 16:57:24 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8921ff55-1e34-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 17:57:21 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4852b81c73aso10860795e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 09:57:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541ab9f9esm251451895e9.4.2026.03.12.09.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 09:57:19 -0700 (PDT)
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
X-Inumbo-ID: 8921ff55-1e34-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773334641; x=1773939441; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W72JevWeU/QiLig4xhCD0an3/J6aVnjef/9hQUIbYAo=;
        b=XLkxS1d44mJSLviwzmOXRgoPggmonBVEb+WZ781Gg9CNNbGickzQuc2ghHZYYRNpJ+
         HD+Qw6xrXrhEOcvN1mYWne7HT8BkW7OXAq0O9sj3YuINWYzePGVRJ+cIrzQ/QLTwgOu2
         GKm93RPvx9PwBlUsZTyBSTxBNk0qdkbSOmNaAlfA+r1+Tte/jbHqWvLNAFZPDl9hbjW2
         fxvzXMmx/GKYFTUoJ8EOK0YAw3Uspa1+yZ4nG/nvbCmxAfdHZcBi8o/3SWwApSfFy+Db
         V6WqtlNoQLIxIzGKipJI5RM9RFopNDS2HyPusSNNT2eqPwyFBXxuE1UyLMMWEOe5WJnE
         1Qfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773334641; x=1773939441;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W72JevWeU/QiLig4xhCD0an3/J6aVnjef/9hQUIbYAo=;
        b=DElH9eVI6EB2nxtvBl0GYe9BSvUhAJXcJovYgkYZ6hNeELtjaQ0IvD8zDJH7KYNA8F
         Np3x0brAvXdKCH/6t7nQEECAPyeJLAeX3lmW0FU3ZeUw6HGAfqL7vWFK5kPsry0V/9VQ
         1clzLrTujU0TRv+dFdlPvpJU3ZC93DqT1ZEA+hTCNv4zVIVDormjOII1yxdtn8ITHIHp
         6kJMUg7JwlUK6uommgeNv/m40GV72HxGyOg5Ajfu7DXadi73NkYcms266I2MmzngsiY1
         741Pe2tFsPrSFmXpcho8B835Idp4x/ahV15EqysCxCLCDOibkk1m9sCq44ueqrHrKmfb
         eVTg==
X-Gm-Message-State: AOJu0YzP1fnwzbuISScefD825KGPN2MQc+D/LKIneevxD6ib2jHq0CuW
	Kq68AvEOTtDAfKtoL+cQD1bs3M3fuc3CF1VHkWyF4oJEAYEnJvueId9p++NqC6Q0s3SGLCyQvRR
	z0dk=
X-Gm-Gg: ATEYQzwnvXZzBK4U6mwmrRP8SpYYnQGLXUAAnXe2Hdf2vZjq+ikv6xJ5kTGyiFpzshm
	EjYnegOqr5MdTd6Rmn3ssaEazh9dG0LGqxks1i9W+idrXseRJovzKerTRHVBaBwZtqwCIVoBOUV
	Ty4kd+Y4USdnNhGVWF8M9jznybQDYtC9pu9p1mRh73sEkyFdgYVQmcWjNBnzAAnqx1zA/V14moJ
	YHf+6IvhPgAWBSsdyAD6vwt4hPKMaldLX/0GSVnfrSrwP4Rbimt5BPbpqyprpQOKsevOUVfAs3Z
	sE5djI+oiHlKLAHL7m/lwlAKG3Bgy+zUEz6KByy5lQGSLu1fP5HB4+nbncw3Y/rk4LCEWMRvYR0
	1YNm+64jBguodd8DeW4EhBPYf9TBVhOcTbT5yJ0GB+B2BiwtKUTiaWUlNLFO0J260Sg5A8M9Ucw
	HYeAYL8m/MQBGb8P1eDvCBP3ytFrRoG1pc3FBmKkV0QZIwfh43qStJew5B3GrQetfvAMmieXi1i
	7IdQiEOuNUfQT0=
X-Received: by 2002:a05:600c:8714:b0:485:389b:ee5f with SMTP id 5b1f17b1804b1-485566cf89fmr386065e9.2.1773334640845;
        Thu, 12 Mar 2026 09:57:20 -0700 (PDT)
Message-ID: <5516d0a1-8fac-48ff-bbe1-85726b730e94@suse.com>
Date: Thu, 12 Mar 2026 17:57:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 7/9] x86/mwait-idle: drop const from struct cpuidle_state
 arrays
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 5470427623E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A subsequent change will want to be able to alter them based on a new
command line option. (Note that some were __ro_after_init already.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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



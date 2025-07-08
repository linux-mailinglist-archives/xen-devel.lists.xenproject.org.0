Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 324E9AFCB1A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 14:57:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036440.1408671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ7sq-0003Y3-1o; Tue, 08 Jul 2025 12:57:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036440.1408671; Tue, 08 Jul 2025 12:57:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ7sp-0003VW-Ur; Tue, 08 Jul 2025 12:57:15 +0000
Received: by outflank-mailman (input) for mailman id 1036440;
 Tue, 08 Jul 2025 12:57:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ7so-0003VI-ES
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 12:57:14 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10ad2c1e-5bfb-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 14:57:12 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso2292126f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 05:57:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c84592ef4sm118058145ad.191.2025.07.08.05.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 05:57:11 -0700 (PDT)
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
X-Inumbo-ID: 10ad2c1e-5bfb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751979432; x=1752584232; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HjPneAjKTdudV80syyoVVEC7Di0qJNSEuHumxOWNEyI=;
        b=DHJMF/WPyc8fmnwH5r15VQt2E9cxkmN+24g5T/8hsBxFTKSg/XTpNdVnyrqcHrFehV
         7unTmHp1smLLryX59uR7KuZptiUWcpfG98hycU0RuN3jbtK1Lpdm8SzL+ScgcBKiC66T
         Rn7I5edAD1b8zdn1Wyiu1u65T7mAczPlkR5Z396eTFy7Z3GZdtrabSy1Mwy6ZJmqy0tQ
         uALBhn+wxNBt1mIwILoKHS/DGPtDEYUSlykREW5u5QsHT2N5WLKJWSf5R+RqXXF4aU7T
         xmxXdu3cR27M18xBrLr52UWhwQm1Xphv2Xj5lywZxPE57gkeLQWccRC7sibENVRSYKmS
         m6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751979432; x=1752584232;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HjPneAjKTdudV80syyoVVEC7Di0qJNSEuHumxOWNEyI=;
        b=suzmYaOpqkn8u99gtTHYwUZ6Czh0bhFUraEhkThaCb6eMWqbdH5RFLsaCN0d1iNlHh
         LanPzxuvtUmqhrrIqXFENyFvz28oqXQ2zVZkaVJMX5ZK7SWtziiZK+4Nh4s663QypI77
         J+39+GLLgCP3EfNdsPzARaZ0LXoLaGgGh0CcXSjGCKsFzLNhTwWdOosw/M2JNM1h7Nxw
         Q3LkC62DDR6iGENVdvWgQCjcoA5QyWRulo+2zch03hoCrQF2SXtHWuBqmw3t1xiGICuy
         RrSBKcNSI5nrTFICpsfnNTtk8UvfmaB64xZjVC3NQScLqhaOuW1xuEiUXQI4hL8couMg
         D4kQ==
X-Gm-Message-State: AOJu0YxliAk4qQvpppMQwGKPjbAq/QQGbsOFyuhcrd/Ipm9of017B3yM
	VA6KIPSQeyoK4LcRCvfCkfR5bsYljPTCXD2mVpkcSC3+EgYwVE8pWKUahmmXnhBLfsdJGF4SXVE
	qt/w=
X-Gm-Gg: ASbGnctGlvtiuzGHHlQdaZppB1+nZV0JafwGs3vge2bU4VsZoTnOzTSGEyqFqacSe1y
	589pD8fg7lhOv6hC8ApPfwlcW7U+SKJt1oiaGKAHgqFkm5fQ5ioXWuYKUtQgAgXg0bUUL+fm3oX
	saPlhwqN7H7t6EL8M7XOmJOGNhtSSU7meQKSq4+V8qwfKfroiJKcygh4VSIYLWFSJamBFYeOoCV
	tqd1zsMAwolAzVptAC49dkC2Zv+h5FGbb/G/FLmJu8hZZP2M1yNLo/+fJNzcSAqU2L5hhTLePzR
	FE1Hj5RR0/NH1iQtm0XkzrmsEzZWrmHcJb82qtJxyOAnYw5AyAqM697lr3eyAvtsZeeRRBXyxhK
	a6bxEPiAP2tiihKN+feo0t2Dl8yhDSJrV8//PudkHRWljPw4=
X-Google-Smtp-Source: AGHT+IEHZv4nySI925CsxfNwuvbaeExmnukQrsbG7AuSaj+IxLBlzGmA2csPK5nSYBAK0X49SwKhQw==
X-Received: by 2002:a05:6000:2f84:b0:3a5:39d8:57e4 with SMTP id ffacd0b85a97d-3b5ddef3ab1mr2375560f8f.41.1751979431806;
        Tue, 08 Jul 2025 05:57:11 -0700 (PDT)
Message-ID: <bc577ba9-cef7-4d6a-a9c8-e0f79597950e@suse.com>
Date: Tue, 8 Jul 2025 14:57:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/9] x86/mwait-idle: adjust section annotations
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <1df49875-99b8-4302-aed7-5a75dbdd85ca@suse.com>
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
In-Reply-To: <1df49875-99b8-4302-aed7-5a75dbdd85ca@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

idle_cpu_spr was bogusly non-const. Several other objects can be changed
from __read_mostly to __ro_after_init, for being altered from __init
functions only.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -106,14 +106,14 @@ struct idle_cpu {
 	enum c1e_promotion c1e_promotion;
 };
 
-static const struct idle_cpu *icpu;
+static const struct idle_cpu *__ro_after_init icpu;
 
 static const struct cpuidle_state {
 	char		name[16];
 	unsigned int	flags;
 	unsigned int	exit_latency; /* in US */
 	unsigned int	target_residency; /* in US */
-} *cpuidle_state_table;
+} *__ro_after_init cpuidle_state_table;
 
 #define CPUIDLE_FLAG_DISABLED		0x1
 /*
@@ -504,7 +504,7 @@ static const struct cpuidle_state bdw_cs
 	{}
 };
 
-static struct cpuidle_state __read_mostly skl_cstates[] = {
+static struct cpuidle_state __ro_after_init skl_cstates[] = {
 	{
 		.name = "C1",
 		.flags = MWAIT2flg(0x00),
@@ -556,7 +556,7 @@ static struct cpuidle_state __read_mostl
 	{}
 };
 
-static struct cpuidle_state __read_mostly skx_cstates[] = {
+static struct cpuidle_state __ro_after_init skx_cstates[] = {
 	{
 		.name = "C1",
 		.flags = MWAIT2flg(0x00) | CPUIDLE_FLAG_IRQ_ENABLE,
@@ -610,7 +610,7 @@ static const struct cpuidle_state icx_cs
  * By default we enable C1E and disable C1 by marking it with
  * 'CPUIDLE_FLAG_DISABLED'.
  */
-static struct cpuidle_state __read_mostly adl_cstates[] = {
+static struct cpuidle_state __ro_after_init adl_cstates[] = {
 	{
 		.name = "C1",
 		.flags = MWAIT2flg(0x00) | CPUIDLE_FLAG_DISABLED,
@@ -644,7 +644,7 @@ static struct cpuidle_state __read_mostl
 	{}
 };
 
-static struct cpuidle_state __read_mostly adl_l_cstates[] = {
+static struct cpuidle_state __ro_after_init adl_l_cstates[] = {
 	{
 		.name = "C1",
 		.flags = MWAIT2flg(0x00) | CPUIDLE_FLAG_DISABLED,
@@ -678,7 +678,7 @@ static struct cpuidle_state __read_mostl
 	{}
 };
 
-static struct cpuidle_state __read_mostly spr_cstates[] = {
+static struct cpuidle_state __ro_after_init spr_cstates[] = {
 	{
 		.name = "C1",
 		.flags = MWAIT2flg(0x00),
@@ -778,7 +778,7 @@ static const struct cpuidle_state avn_cs
 	{}
 };
 
-static struct cpuidle_state __read_mostly bxt_cstates[] = {
+static struct cpuidle_state __ro_after_init bxt_cstates[] = {
 	{
 		.name = "C1",
 		.flags = MWAIT2flg(0x00),
@@ -1075,15 +1075,15 @@ static const struct idle_cpu idle_cpu_ic
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
-static struct idle_cpu __read_mostly idle_cpu_adl = {
+static struct idle_cpu __ro_after_init idle_cpu_adl = {
 	.state_table = adl_cstates,
 };
 
-static struct idle_cpu __read_mostly idle_cpu_adl_l = {
+static struct idle_cpu __ro_after_init idle_cpu_adl_l = {
 	.state_table = adl_l_cstates,
 };
 
-static struct idle_cpu __read_mostly idle_cpu_spr = {
+static const struct idle_cpu idle_cpu_spr = {
 	.state_table = spr_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };



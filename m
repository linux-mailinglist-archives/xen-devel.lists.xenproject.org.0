Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74997AFCB28
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 14:59:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036463.1408701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ7us-00059N-Su; Tue, 08 Jul 2025 12:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036463.1408701; Tue, 08 Jul 2025 12:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ7us-00057D-Pd; Tue, 08 Jul 2025 12:59:22 +0000
Received: by outflank-mailman (input) for mailman id 1036463;
 Tue, 08 Jul 2025 12:59:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ7ur-000577-Qp
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 12:59:21 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c9b811c-5bfb-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 14:59:19 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a6d77b43c9so3959384f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 05:59:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce42a4117sm11264352b3a.125.2025.07.08.05.59.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 05:59:18 -0700 (PDT)
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
X-Inumbo-ID: 5c9b811c-5bfb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751979559; x=1752584359; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R6AWWL39yUQbpUen+S/NjA91boolPbLb+UdVB8EDWic=;
        b=GjiAsNZ+5IZd9wXxx/myqrggMGG6+jW32Z14x1ar2Bap083wbEzFdP0E1IyzA3xHQR
         mhFLoQ1DOHkEuAfg6B06CtOpGc36Dfgda8juY9gVlQuEwkwqk53dtN3Ay8kOAC7aQyj0
         xhz2I5RTvZD5r2yPUsIUQ8cbehDdBWUeuqB4pyRwwPSns/gymujvGcrXIh42/fVLcJaj
         wIMX5l2ZtxGDwlls87mE+r490Hp6Gk1MHAF3qvo3rEz9QIxH+ZKiVTSQIPPcpjH9OdUS
         rSm5YSbPDb4nAeZ/9yOZx5uCnWDwVbrYMIDYq8ajLwKxiH1jxXy2b1EzqSo4rX7ptGNI
         6tbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751979559; x=1752584359;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6AWWL39yUQbpUen+S/NjA91boolPbLb+UdVB8EDWic=;
        b=UkVsqOFajdU11OLbGF6Yew1Y4NPY7go/ivARqmkK0BNAKXujT0wYC+ULCE0wcaKj5I
         9EizrBh51nvnkUqxWmht2sYeieX5Ss8Nj6ahlanO1uNcvakz3mk3Rr5QbSJPX5FSlMm+
         PU1s6+cQhkgoAegAdbcWuwhTlo8Fw4ZmChJColoz/iMFjcB76TUdm7nJl80Ep5AIYBL8
         06YMNczuXIK7M9zvaH/D1gDzce93i2IBG2Asl+CoTMjh4CSOfvvP57ElLCgJ3hlr2Gn7
         9X+D6peQ8dfF8p5w0kxzHhtxxCnxdylKBJqWZkBRzq8dN45cLzDjsE6koPL9wIdkHIfG
         iSww==
X-Gm-Message-State: AOJu0YyciyxB15L1DA2yM7puqXqUmJECyot/hsHDsMC5oxuHdscbUKeX
	0lxAv6TK7TFqJchJr5uwrAPo1axxAKu7Wn1sJoD2G7lDc8Io9GAnwEcCouWtbQXQpfYYz5szlWT
	3JYc=
X-Gm-Gg: ASbGncv8wWOijkxlf7eKpMA+/LJ+E+81dM2JfsRxRPgmhufu666mr37bExEXngDAwqg
	FNz+x20T7A6nKvIq84lOsoWx6GMUaEulvFbAlikRGsKgS/coc/l6LZ+ktbqnSXMua2nhGBKUAk6
	Inr1/6nplNrsgAfjj/VrCa8lsm46cFlNmsf2gcVWcZd5yK+L5hEP6EMqjBAMHj+4hDQHUVWiT8x
	LXgFd9jtvUHnNNjJDFpPNaWS6AVEymWgkOOhxI4OHrpLYEIRWyPeKCGPZlToDydmPX59llY2z+m
	Rn08X9ATXtZasgMaT9SkxtlVQ1JAv8rg9wjtD5UmDx+EXLJVFehgz3mHepizQEiqlGxIdvXJ/G+
	Es1q6SihmgmVmuhn5E0Fn2bdFndMe3De7i0qWak4lQqXuUzo=
X-Google-Smtp-Source: AGHT+IFpaQy+nRfUluItSJwoKat8OkvwIHKlObq1qgc38QXheBSp+3ZkcZMTzk5kO79slMxQ+6SA4g==
X-Received: by 2002:adf:b652:0:b0:3a4:f644:95f0 with SMTP id ffacd0b85a97d-3b496626840mr11326541f8f.54.1751979558628;
        Tue, 08 Jul 2025 05:59:18 -0700 (PDT)
Message-ID: <26e175e7-7aaa-408e-8e3e-c29a4db1591a@suse.com>
Date: Tue, 8 Jul 2025 14:59:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/9] x86/mwait-idle: Add Meteorlake support
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alex XZ Cypher Zero <me@alex0.net>
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

Add intel_idle support for MeteorLake.

C1 and C1E states on Meteorlake are mutually exclusive, like Alderlake
and Raptorlake, but they have little latency difference with measureable
power difference, so always enable "C1E promotion" bit and expose C1E
only.

Expose C6 because it has less power compared with C1E, and smaller
latency compared with C8/C10.

Ignore C8 and expose C10, because C8 does not show latency advantage
compared with C10.

Signed-off-by: Zhang Rui <rui.zhang@intel.com>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git eeae55ed9c0a
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -678,6 +678,28 @@ static struct cpuidle_state __ro_after_i
 	{}
 };
 
+static const struct cpuidle_state mtl_l_cstates[] = {
+	{
+		.name = "C1E",
+		.flags = MWAIT2flg(0x01),
+		.exit_latency = 1,
+		.target_residency = 1,
+	},
+	{
+		.name = "C6",
+		.flags = MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.exit_latency = 140,
+		.target_residency = 420,
+	},
+	{
+		.name = "C10",
+		.flags = MWAIT2flg(0x60) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.exit_latency = 310,
+		.target_residency = 930,
+	},
+	{}
+};
+
 static const struct cpuidle_state gmt_cstates[] = {
 	{
 		.name = "C1",
@@ -1117,6 +1139,10 @@ static struct idle_cpu __ro_after_init i
 	.state_table = adl_l_cstates,
 };
 
+static const struct idle_cpu idle_cpu_mtl_l = {
+	.state_table = mtl_l_cstates,
+};
+
 static const struct idle_cpu idle_cpu_gmt = {
 	.state_table = gmt_cstates,
 };
@@ -1186,6 +1212,7 @@ static const struct x86_cpu_id intel_idl
 	ICPU(ICELAKE_D,			icx),
 	ICPU(ALDERLAKE,			adl),
 	ICPU(ALDERLAKE_L,		adl_l),
+	ICPU(METEORLAKE_L,		mtl_l),
 	ICPU(ATOM_GRACEMONT,		gmt),
 	ICPU(SAPPHIRERAPIDS_X,		spr),
 	ICPU(EMERALDRAPIDS_X,		spr),



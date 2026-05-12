Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DNNAhA+A2qr2AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 16:49:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1E2522E92
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 16:49:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306865.1578596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMoQW-00064S-Us; Tue, 12 May 2026 14:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306865.1578596; Tue, 12 May 2026 14:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMoQW-00062S-S7; Tue, 12 May 2026 14:49:40 +0000
Received: by outflank-mailman (input) for mailman id 1306865;
 Tue, 12 May 2026 14:49:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMoQV-00062K-CH
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 14:49:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMoQU-004Dpu-PN
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 16:49:38 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a033dfb-e002-0a2a0a5209dd-0a2a450ac3d2-12
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 16:49:38 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a033e02-56b3-0a2a450a0019-d155dd31d89a-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 16:49:38 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-44e1ebb3122so2950226f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 07:49:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45491bae13csm32284298f8f.29.2026.05.12.07.49.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 07:49:37 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778597378; x=1779202178; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BkBBCMkmJExXqLA468nivUiDeCwwD3TxXfg9UbGdhnI=;
        b=ZG5h0VQliZaCGL5EjRhfxf/5ETW4gcDkMK7qVneGkvkQHt0jzzXysdAiJEpBMA2wbs
         TJyz+6fjshlN101J1BidZXdjt3lsmCcOTO8Fr7oJJg+NSUTthDmbXOqUWMmP/W0yewmW
         T0YrdiBlBIqMypBC6aVE5C4AVMBMTa6KFHn+vTgUBM0nOIp90nW1Svwbi4GO0TJsZHze
         n3GSI4Ly2mx/G7DIqnAq5+pfxlAOoTfmH7LDcfQoe9tSpL8hfLl50Ec4JKPj7mn/xWHA
         NiZvSxNypYVt3nUaSdahZmAiVX9fcL7yRYrqcW4DwWPHBxiXvNY7nHOAZHbbj0Ix61of
         1umw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778597378; x=1779202178;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BkBBCMkmJExXqLA468nivUiDeCwwD3TxXfg9UbGdhnI=;
        b=PfI8HhXGPXsHgd+yt/mWRixGqB6y6tO1FccQVBuWAb+i4mzFbVCPd++cWbmx5UMUzb
         ph3zUliWs6RU2aLxinSyWMF/aWC5KfQWxu1LDUl2xK6Nbh8juVKGdbqpCCr9RPBCWyLm
         70IGpW0hc4x/btzf5T2mhj/tFheP0tANDFUvcOrgUwbL7/fmVwiCVM9jLzfy/xm0l0tQ
         qb74Enj9DvzCLzMGrQMQxMxQVFe4wEFVeWLTJhbCtg5Jpugf/SIT1g0XZtQVu7UKU/qj
         f/8oqWDfBlRh56ZU4fW/FMS+ai8G2cR7w6sFlpcyexMdRnq4AxoBkjfOthkUKbQBa7hG
         bfMA==
X-Gm-Message-State: AOJu0YzrmiTSMdcpVohzh5oj9m2DGliH7xTvXmJzGUxMlokjy5VZsIdp
	aNcUgTHQK1Y87dqZDAenSB5AFug8Vowo8JTsVFU+Fo96eLIZrV+wu2/1pkGkEnho7ELid6kTIKO
	ctBc=
X-Gm-Gg: Acq92OHYIil/vvI4RslSIU34MSBWmzT1ZDpNf37BYPznlySOfrc7ycrXigYT9PcdlLf
	KSN9JLWuEQnmiKV3b6YOkAFO/HaHtrzF3qWJkE4X6EVlG+fmMWGg8uY3thrvG4POXVU2S8diW8r
	T3xz8SFOICblmky/NUpDysrclY3nhqyG2OdhavrjK/Nbfg2xJWtWVpVa6FNnuD0zvdWKXPkbS+m
	EX5CvAPzyNuno6JRdjSA048vyTyIWh5iUnhTLWmDGRZ73Et9GVRwru+b81Z5P3GJcGoah/Q3kQr
	nB8i5stLRhr0cL4Lj9DoE3ql9IETBp7p96jjjxSWZ5V8ef9Am9DsRwlOxNC7gwkZdFHm5xJbsY8
	wpFFzrVuSMpWqyBIP64pFNfbRL+OniwUiSfJvaB7Yl2GPScz5OwspxoEq94JvCksOXOUiBmY0Mc
	dkM/F+Q1hOzxWy0WET+YHr0GyJRy+Wh/+WDgNojGjKctLI9nvBX12iRRD67uhTn+02qo+5JEMty
	aqRjUyqbVutHKc=
X-Received: by 2002:a05:6000:2483:b0:451:2157:6291 with SMTP id ffacd0b85a97d-45b14adc11bmr4866067f8f.41.1778597378108;
        Tue, 12 May 2026 07:49:38 -0700 (PDT)
Message-ID: <7b5dd0c9-ff34-4d03-be4c-7d50e517b0e9@suse.com>
Date: Tue, 12 May 2026 16:49:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RFC v2] x86/time: set AP's TSC scale estimate earlier
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1778597378-7397E8B7-C2DD9C81/0/0
X-purgate-type: clean
X-purgate-size: 2010
X-Rspamd-Queue-Id: 6A1E2522E92
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

NOW() (in particular) can be used ahead of init_percpu_time(). As the
initial scale value set is merely the BSP's, we can as well set it very
early when the AP is coming up.

Setting the scale alone, however, doesn't work, so the entire struct
cpu_time is copied.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: Copying the entire struct won't work very well when tsc_adjust[] is
     in use (and values there differ between sockets).

This in particular mostly eliminates an anomaly with log messages issued
early while APs are coming up, when "boot" console timestamps are in use.
---
v2: Call the function from very early in start_secondary()

--- a/xen/arch/x86/include/asm/time.h
+++ b/xen/arch/x86/include/asm/time.h
@@ -21,6 +21,7 @@ mktime (unsigned int year, unsigned int
 int time_suspend(void);
 int time_resume(void);
 
+void preinit_percpu_time(unsigned int cpu);
 void init_percpu_time(void);
 void time_latch_stamps(void);
 
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -356,6 +356,8 @@ void asmlinkage start_secondary(void)
     /* Safe to enable feature such as CR4.MCE with the IDT set up now. */
     write_cr4(mmu_cr4_features);
 
+    preinit_percpu_time(cpu);
+
     percpu_traps_init();
 
     cpu_init();
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2346,6 +2346,12 @@ void time_latch_stamps(void)
     ap_bringup_ref.local_stime = get_s_time_fixed(ap_bringup_ref.local_tsc);
 }
 
+void preinit_percpu_time(unsigned int cpu)
+{
+    /* Initial estimate for TSC rate etc. */
+    per_cpu(cpu_time, cpu) = per_cpu(cpu_time, 0);
+}
+
 void init_percpu_time(void)
 {
     struct cpu_time *t = &this_cpu(cpu_time);
@@ -2353,9 +2359,6 @@ void init_percpu_time(void)
     u64 tsc;
     s_time_t now;
 
-    /* Initial estimate for TSC rate. */
-    t->tsc_scale = per_cpu(cpu_time, 0).tsc_scale;
-
     if ( tsc_adjust )
     {
         unsigned int socket = cpu_to_socket(smp_processor_id());


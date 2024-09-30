Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 521AA98A8C8
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 17:40:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807504.1219015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svIV0-0006KT-9B; Mon, 30 Sep 2024 15:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807504.1219015; Mon, 30 Sep 2024 15:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svIV0-0006Hn-5n; Mon, 30 Sep 2024 15:39:46 +0000
Received: by outflank-mailman (input) for mailman id 807504;
 Mon, 30 Sep 2024 15:39:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Bw3=Q4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1svIUy-0005zN-C5
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 15:39:44 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36526171-7f42-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 17:39:42 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c896b9b3e1so2020731a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 08:39:42 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88245ec1bsm4858375a12.44.2024.09.30.08.39.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 08:39:41 -0700 (PDT)
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
X-Inumbo-ID: 36526171-7f42-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727710782; x=1728315582; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Hb6O4m9dnMzo8siQnz2tbPNmVbQhFw4pCsN6LvoMyuo=;
        b=HK7ILOu9qy17oeKb6LiHxnX6565QcqalPQO9haKocrVrUAM6Hs+osu2sCzIEUUAAHx
         cxgidEXUwOXFZHFt3Ll97LB3bNn9B7ydNDgHYEMcXgZW3ZYkHOyoGkXJVuB/2vtcNFc4
         Db3eo+gBNI5iCKe0YZM+KpHp3nGcUOFAYnjjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727710782; x=1728315582;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hb6O4m9dnMzo8siQnz2tbPNmVbQhFw4pCsN6LvoMyuo=;
        b=k3mwQjpVmbZz9MdMjmwErbLZrP7d7a/PhWV4hRvMFxjYJvi3DbEKEItv8ckgWi87AG
         XqEo9tCTmNt1D87ufKaLNHPXWZhi9v5ele6xOVPAEkR1tapgznXfB5htFZl3eXyTdLkI
         F58tTwQP91hO40gCSr9VGuS5pboWCL42wDiwlMBPeHcRwTpv0+VAHedZ+LNoa8cHUiAV
         +wmbRjsn63FXrc+86VM+aUN6cBxypDB3L6Y5w0rGAtqGOhzis1ApkRRhxml5uWcS3PlE
         iJJhAIJ8IshNwjyT//z/I3xBVvUW+8k5Ny8ulmb6+0BUBHfAz7PslQV5F54EoX51cj6+
         HzFw==
X-Forwarded-Encrypted: i=1; AJvYcCVeJNRNOY/efGW6VjIlOOCJWff/fiS35fg+/aQy29dsEvtFY5JsNsNl0x7cQrUrCJtWgE0VEOqza8U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxn+Dql8dMwQ+pwrOA0xKHif9lIWJ/gRbH1l8dja6QWEtcDlA8O
	mJAcywRIltNM9kJXxJpuRwXSpK30jNJOwO+daSbzqgF5ss0B545Yv1lfVzl4We+SmRQ8LW1Svps
	yXK0=
X-Google-Smtp-Source: AGHT+IEgz6RcWA1zDTkRxaI/JyrSwnkqLNiTJ0YWmi/8myeJC4PJPGQtYCrC0KMDanvxG+q7s85Eew==
X-Received: by 2002:a05:6402:3718:b0:5c5:c4e9:c83e with SMTP id 4fb4d7f45d1cf-5c8824d644bmr11677775a12.14.1727710782267;
        Mon, 30 Sep 2024 08:39:42 -0700 (PDT)
Message-ID: <ee679588-d992-4bbe-806a-acd8491d85b9@citrix.com>
Date: Mon, 30 Sep 2024 16:39:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/MSR: improve code gen for rdmsr_safe() and rdtsc()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <e379a005-a9ee-41ae-a797-9768c6aeb52e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e379a005-a9ee-41ae-a797-9768c6aeb52e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/09/2024 4:15 pm, Jan Beulich wrote:
> To fold two 32-bit outputs from the asm()-s into a single 64-bit value
> the compiler needs to emit a zero-extension insn for the low half. Both
> RDMSR and RDTSC clear the upper halves of their output registers anyway,
> though. So despite that zero-extending insn (a simple MOV) being cheap,
> we can do better: Without one, by declaring the local variables as 64-
> bit ones.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Hmm.  This is generally better, but not universally so.

xen$ ../scripts/bloat-o-meter xen-syms-before xen-syms-after
add/remove: 0/0 grow/shrink: 2/29 up/down: 24/-193 (-169)
Function                                     old     new   delta
pci_cfg_ok                                   335     351     +16
arch_ioreq_server_get_type_addr              251     259      +8
udelay                                        81      79      -2
tsc_get_info                                 258     256      -2
trace                                       1320    1318      -2
time_latch_stamps                             76      74      -2
set_legacy_ssbd.isra                         146     144      -2
read_hyperv_timer                             81      79      -2
read_counter                                  47      45      -2
read_clocks_slave                            135     133      -2
mcheck_mca_logout                           2059    2057      -2
hwp_write_request                            105     103      -2
get_s_time_fixed                              91      89      -2
get_s_time                                    77      75      -2
cpu_init                                     251     249      -2
amd_mcheck_init                              754     752      -2
_svm_cpu_up                                  467     465      -2
tsc_check_writability                        187     184      -3
_probe_mask_msr                              106      99      -7
time_calibration_tsc_rendezvous              541     533      -8
time_calibration_std_rendezvous              197     189      -8
probe_cpuid_faulting                         180     172      -8
hvm_save                                     343     335      -8
amd_check_erratum_1474                       140     132      -8
calibrate_tsc                                382     372     -10
wait_for_nmis                                134     119     -15
read_msr                                    1220    1204     -16
guest_rdmsr                                 1869    1853     -16
check_tsc_warp.constprop                     201     185     -16
hwp_init_msrs                                440     420     -20
amd_log_freq.cold                            519     499     -20
Total: Before=3895379, After=3895210, chg -0.00%

arch_ioreq_server_get_type_addr goes from:

    and    $0x40,%dh
    je ...

to

    shl    $0x20,%rdx
    or     %rax,%rdx
    bt     $0x2e,%rdx
    jae ...

and pci_cfg_ok gets a "movabs $0x400000000000,%rcx" and 64bit test,
where previously it used "and    $0x40,%dh"

So, the use of 64bit variables as opposed to 32bit does seem to break
GCC's ability to substitute %dh.

Oh well - it's minor either way.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>


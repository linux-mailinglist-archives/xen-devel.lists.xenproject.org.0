Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4A796D62A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 12:33:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791023.1200784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sm9o1-0002wt-IX; Thu, 05 Sep 2024 10:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791023.1200784; Thu, 05 Sep 2024 10:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sm9o1-0002u0-Fs; Thu, 05 Sep 2024 10:33:37 +0000
Received: by outflank-mailman (input) for mailman id 791023;
 Thu, 05 Sep 2024 10:33:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sm9o0-0002tu-JY
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 10:33:36 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d874685-6b72-11ef-99a1-01e77a169b0f;
 Thu, 05 Sep 2024 12:33:34 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a868d7f92feso93431766b.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 03:33:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a6aeed1b4sm76749966b.103.2024.09.05.03.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 03:33:33 -0700 (PDT)
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
X-Inumbo-ID: 4d874685-6b72-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725532414; x=1726137214; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=37FnMZG0JI/5RtrMqF0IpWXp5KFzLJZmCVgGNd4LQJY=;
        b=cfm7Qdq1kdlZCysJ1ul6LPY9WC8/5OpTkDNS5GsUhYJlzyVxjtlLfQ7hp53VnME6z7
         5QYLozj55xbZ9qczHQJFeYj7hLzc5VoCOO/bVMeOjclOO4upTntugCUPG4JWD0gjYmVX
         yF6Sl6RKKBcsRypKRDTJqFdxoA+RRnWuA9HNZHwcl0Z26uGHgtx4+BeiNd3ZFIRFPHuZ
         lBrgAWVrzPfDsVVwGLYsMJTG0AGnVMUAh5o1zxH9hFbZbXkNF4TCOSqZ30t6QQKH+/Fq
         yNrD/INO1ZL3rbH8d9cmuQPvDUxhUlmTuFADp5OeKsZmoRkK6T8KtmY4RDu64q3n2V/V
         2xaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725532414; x=1726137214;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=37FnMZG0JI/5RtrMqF0IpWXp5KFzLJZmCVgGNd4LQJY=;
        b=Wj6M2jh7gWIGbrwf1VQ0ZzANs6pT5KMEw/b/08pshT6Z7LXfCkYXY9lKXhJmN5psph
         IR8MYpTVjtt7fwtBsmcSXEV848ma1dy9YvTMsShfmHT9ZCpBCATX9Dx04VVl2d1uzvXu
         nPsZSPkqc/zxDSpeRa6B/hgdKZG7KhvSyIdsuJ8LSmT7vN7T+CkPsmlguGaqzyuSYvkJ
         SzdPj+eMi2Np/ACVr1mwu4eBeWky4qac4VuFVdStxVOdqh1Ziip7o1zPAW05s5LhQ0/s
         TDRsVlhwNmBIWUG+U8NpxvY7oUKVMeSVi356J1er2DenOc7Z3iW2qsdKsL4Qd322sQjE
         bTxw==
X-Gm-Message-State: AOJu0Yx0DMtr4Lm6Ou9nFEo/m3ZN+z1goPS8iIIDTPV+alO/1vWi6Bt7
	b4x39OsyOTHgyXWU0tyftUQ9ueI0EeGzwQQ156tX2csZ7v+zq8s5ey+PiQp5Lw==
X-Google-Smtp-Source: AGHT+IHKjBSy50+FwjNuibLH6nbipYgEFaImqUKsmcgZTMfyipxudQA9PxovTRXUA/9UTnwSnerX5Q==
X-Received: by 2002:a17:907:7f29:b0:a7a:a212:be4e with SMTP id a640c23a62f3a-a897f77fa53mr1809384866b.7.1725532413744;
        Thu, 05 Sep 2024 03:33:33 -0700 (PDT)
Message-ID: <4ffb8702-d1b4-4e7d-986c-b03ace9e75ea@suse.com>
Date: Thu, 5 Sep 2024 12:33:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [RFC] x86/HVM: stdvga caching mode
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

Hello,

I happened to spot a ~14y old revert of the crucial hunk of the ~16y old
551ceee97513 ("x86, hvm: stdvga cache always on") in our patch set,
supposedly to deal with text mode corruption when Linux is booted without
any "vga=" option, and when - after the GUI is up - the console is
switched back to one of the text mode ones.

My immediate reaction was that we shouldn't be carrying such privately.
Yet after some playing with it I'm now at the point where I'm wondering
why we have that caching mode in the first place. It looks to hardly ever
come into use:
1) As of 68e1183411be ("libxc: introduce a xc_dom_arch for hvm-3.0-x86_32
   guests") caching mode is disabled from start-of-day, due the disabling
   being unconditional in hvm/save.c:arch_hvm_load(). That can of course
   be worked around, but then 2).
2) In the course of setting up VGA, REP STOS (maybe REP MOVS) are
   apparently used by both SeaBIOS and ROMBIOS, as can be derived from
   stdvga_mem_accept() always hitting the "if ( p->dir == IOREQ_WRITE &&
   p->count > 1 )" path while BIOS initializes.

Further:
3) 551ceee97513 ("x86, hvm: stdvga cache always on") bumped the maximum
   range of "mapped" VRAM from 64k to 128k, yet without growing vram_page[].
   Afaict in mode 0 (full 128k accessible at A0000-BFFFF) vram_get{b,l}()
   now misbehave.
4) d1b531631515 ("x86/hvm: unconditionally buffer writes to VRAM") likely
   went too far (or not far enough) in bypassing write handling, yet then
   still allowing reads to be serviced from possibly stale cache, when
   ->stdvga goes first off and later back on, without ->cache changing
   state.
5) 22a1fbb575df ("x86/hvm: make sure stdvga cache cannot be re-enabled")
   likely went too far. Surely there are cases (VRAM clearing at the very
   least) after which VRAM state is known again, and hence caching could
   in principle be re-enabled.

Before I go and try to fix all of the above, I'd like to collect views
towards simply ripping out that caching mode, vastly simplifying the
source file in question.

Jan


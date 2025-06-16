Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C551EADB142
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 15:11:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017255.1394233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR9c8-0000yV-A3; Mon, 16 Jun 2025 13:11:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017255.1394233; Mon, 16 Jun 2025 13:11:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR9c8-0000x3-4p; Mon, 16 Jun 2025 13:11:04 +0000
Received: by outflank-mailman (input) for mailman id 1017255;
 Mon, 16 Jun 2025 13:11:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uR9Sv-0003pW-TN
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 13:01:33 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 067907d3-4ab2-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 15:01:32 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so3799122f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 06:01:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365dea8fd6sm60146695ad.145.2025.06.16.06.01.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 06:01:30 -0700 (PDT)
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
X-Inumbo-ID: 067907d3-4ab2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750078892; x=1750683692; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/Qgc++fc93ux80i5RmqliRbRkUUe9ZSRv/76bEt+jaE=;
        b=Fvd92rhX/gAPMsa0EmEbLm/snAK+YAuvMOcGc+F4C9qGFP9a48R8me16HREG6w2x4q
         uG6m0f0MywfucW1CmdpWS8M7/hRxRaDXgslMwk3xYzQevpts6EoqYRpN6sblifzs4qWd
         NiatMNclheC+3J4dhJg3cSVjs/FcF4WR+q38b+HNwkKXY8XB1s/ltOl7iaP2EWHjHvM0
         2GXoEZysUpnmNV7P8F9q8rnO7wzW4IludakIz/aGJPmI21zxHtxsL6nufT13CSqNQ4fa
         M80DZbkqPOQ0YrFbyLIMfau92FaHwnlO5JQKS8pgRQFF59+Ajq+juOkLvmDR4VjVIkIN
         DnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750078892; x=1750683692;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Qgc++fc93ux80i5RmqliRbRkUUe9ZSRv/76bEt+jaE=;
        b=P5GeYDflz5zQyQZ+eSYMzc+vpxZN9TTBHwOBYxMgy2Vu5az9m/yj6PSZo/NXtoi6Eg
         c9OTQcw7wdN4MdEUeh/lErNCcGz4ya/iX3mEIMhlscbjA37cBICuKOXu94EIpuz+lKOZ
         myiFjmolrT8ETBTDR8UnPWis8Leg+AABqRscgo7Wkolpibt3WynZ/f2VQZihCQStsZTP
         /8IJdDVx54JBM4ZhzIyK4Lg1IdhBDAdFm4FdK+n2hAL9oPlq+Y77uARy2LEuED+tEUA/
         xuYKrgPRN3A/bPVcYRCepFtPUekVizj+ypG+krk1VmBtpT5ZdRXtMcp5ZqapU7sChk8k
         d1GA==
X-Gm-Message-State: AOJu0YyJ8EvXAPlMf7NoIpCLcvgtOkZcStwCCq4yIoxgNuvsAKbBLiL2
	1UCp/aloHSlCEFo31cA1RaMzdAeC8g34OnlUlE/+8jlucqO62Nps/IK70PdqyDgWD23zgfHTrh5
	rCDs=
X-Gm-Gg: ASbGncsW5qZAzWKzGWBAf1uv3EsJnOMfk9mve5KJY9itoSGLF6e6F9bCxoC0B3IVWgk
	g9289I/XBQnvpAKUB1Gg6XitRYOjk7gK64Exp8QHFNvwwH8X7vrF3X1TnTPI30NVghZS/TD5yya
	Gs2JS2rWW5Pez5uoZaOaoES6qB6ujw8DEn+XMIs9uH4Rf/CuLcOrXQckLd4UuAvT5WPkoROzjZX
	fZNQzCdiwGWiPMN6HeBYA1oGY5nLM/OXO7MwQcFHQ10S6RrL2Sn4MdCqt0pBLa4jolrMfadU2Rt
	HsKej17trJZ7LOpSF36EXDvfAcLoVfbZfVFkdyh98KHwSn2F51njqSGs5L2NHfPSjzvFIP9SJqC
	xwOvgae7j7DG2Sr/CDd+wnFAP1EO17zFTc9GPslypb7CAnsk=
X-Google-Smtp-Source: AGHT+IF1/BiEdagP71nQb6AOqDYr1F9/K/R9nw/EWajmZrQN1TpdqMHOI4v1akSjxyuOoUWijBDTNg==
X-Received: by 2002:a05:6000:2f88:b0:3a5:1360:6b34 with SMTP id ffacd0b85a97d-3a56d7bacfdmr8843603f8f.2.1750078890953;
        Mon, 16 Jun 2025 06:01:30 -0700 (PDT)
Message-ID: <c926a369-598f-4b3b-87ac-cc5ab94f8dfc@suse.com>
Date: Mon, 16 Jun 2025 15:01:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v6 5/7] x86: control memset() and memcpy() inlining
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <c5e1e7e0-a295-4028-b003-152b861ee14f@suse.com>
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
In-Reply-To: <c5e1e7e0-a295-4028-b003-152b861ee14f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Stop the compiler from inlining non-trivial memset() and memcpy() (for
memset() see e.g. map_vcpu_info() or kimage_load_segments() for
examples). This way we even keep the compiler from using REP STOSQ /
REP MOVSQ when we'd prefer REP STOSB / REP MOVSB (when ERMS is
available).

With gcc10 this yields a modest .text size reduction (release build) of
around 2k.

Unfortunately these options aren't understood by the clang versions I
have readily available for testing with; I'm unaware of equivalents.

Note also that using cc-option-add is not an option here, or at least I
couldn't make things work with it (in case the option was not supported
by the compiler): The embedded comma in the option looks to be getting
in the way.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Re-base.
v2: New.
---
The boundary values are of course up for discussion - I wasn't really
certain whether to use 16 or 32; I'd be less certain about using yet
larger values. A respective Linux patch [1] uses 256 ...

Similarly whether to permit the compiler to emit REP STOSQ / REP MOVSQ
for known size, properly aligned blocks is up for discussion.

[1] https://lore.kernel.org/lkml/20250605164733.737543-1-mjguzik@gmail.com/T/#u

--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -58,6 +58,9 @@ endif
 $(call cc-option-add,CFLAGS_stack_boundary,CC,-mpreferred-stack-boundary=3)
 export CFLAGS_stack_boundary
 
+CFLAGS += $(call cc-option,$(CC),-mmemcpy-strategy=unrolled_loop:16:noalign$(comma)libcall:-1:noalign)
+CFLAGS += $(call cc-option,$(CC),-mmemset-strategy=unrolled_loop:16:noalign$(comma)libcall:-1:noalign)
+
 ifeq ($(CONFIG_UBSAN),y)
 # Don't enable alignment sanitisation.  x86 has efficient unaligned accesses,
 # and various things (ACPI tables, hypercall pages, stubs, etc) are wont-fix.



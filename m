Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC20A0580C
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 11:22:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867123.1278548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVTCZ-0001NO-Sg; Wed, 08 Jan 2025 10:22:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867123.1278548; Wed, 08 Jan 2025 10:22:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVTCZ-0001LF-Pu; Wed, 08 Jan 2025 10:22:15 +0000
Received: by outflank-mailman (input) for mailman id 867123;
 Wed, 08 Jan 2025 10:22:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVT3x-0005HN-Gg
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 10:13:21 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fe0419d-cda9-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 11:13:20 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso4076785e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 02:13:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8acafesm52401179f8f.98.2025.01.08.02.13.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 02:13:20 -0800 (PST)
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
X-Inumbo-ID: 2fe0419d-cda9-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736331200; x=1736936000; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ik+kdwvsn5sI13Sqvs0LoMAnkH/bBuVd5/sAq0CDmGU=;
        b=OzfZ1q1uDOWOLVe/M1r/qLXLQSICiOUO67YSoKNGO36gkSFIhFr7YA9y+tdK2Gyhz7
         QpRy4ASsLT/Kp28PNd4ZcrSC+QCF/Y7QvXV17yk6tp5KF9Vc7xMReEde+iejz76Sr+4n
         xzPHvY5UCt29ZrRPQsJ7vQ9Vmoo1qeDy4dUOgniwl/U3+IQJRmSbJD/xSoEUEc2/31T9
         JpiZHf/nNil3UB7ARVDPpjqufVvqcf/em5DWdjBwgCVtd9zMCOOWpK0tdYfS/wS5YSNq
         vDzVekApxhuU7hgnYLZGJ7DQf/ZV2PzVDBDfYBGc9q2a5fwo6aLqHUe93aT/ESTUN1+z
         WcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736331200; x=1736936000;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ik+kdwvsn5sI13Sqvs0LoMAnkH/bBuVd5/sAq0CDmGU=;
        b=KrgBq70RBsxaH8CUF62oqBIHWtFi+5BogzezHNzG5Si1O0qX930flMEQO9gPp8F0V5
         zBZnm5e54wcAIT9tHpumxguy7afudWDMvZ2AlWV38mvp12saMqwzlIGapxcVZXe9nWjb
         XQXTPoQvGU6wIMylfmXqeZ5eBWL9mLZcokJJc38ay8D9lUE0BG/HtYq0Cznv5WP6ONgi
         VWZKQD/ABcZgbUKLWhuOWypV+f81ni2wbdtaDIyVkOwLN90O56atgigSXlAJ3x9CfCBb
         G6zxU1n0I5LrMO71MXrsHHD+vvgTw4TNseFxaib+5jZsHdR3HCHjaxulGQQRlK0HVY0b
         AmCw==
X-Gm-Message-State: AOJu0YxjkpiAlmnTw+R6huD/j/b9D7kSdw4P9wDBBv3imXjtsQWlKgZE
	ftL0CE1hODnsLuW3piyquF79JY7XHfcNHCLlJRI3gwy+0faWNkkYtU6gjbiut2Yieh3rPVGaWWE
	=
X-Gm-Gg: ASbGncvBOhvpVuH/7h6EYruLTiFgKkzYgckSGecReO4ZlbebwvbgtyPwQqsxnUGXLpz
	7b89xalvLiPAVS9noHxahiUR/3CvmRlmF+9pB7KMcbXI4r2hmc1qnMjY1P9RHNLYm1FLTw9YIkd
	pDyj/ovuCMtc/yacv/IXKjO9ako8aKLT9z8UjFam0YijCVybaAd/NAFabHLEgHfvxgTF3bYaq6i
	EDggpiLOhFid3rG0t6m3cSvECKCrn/mWGg1LeDPuXSNw1Kd8ZzBUpaT9P18VHikcRDumn+KfHtI
	2dHSgJ+mjKbBLNHdlrld4lI2kvxXCLseFlFDJCfJlw==
X-Google-Smtp-Source: AGHT+IHaGFaaqLP4jo8cZOgpMUC9M5m87pxwlFQdAZx7tezjS6+Wa1QPSoUExOwxvVruxJ1a4gdKsA==
X-Received: by 2002:a05:600c:1d0d:b0:434:fe3c:c662 with SMTP id 5b1f17b1804b1-436e1e301e4mr19196365e9.12.1736331200437;
        Wed, 08 Jan 2025 02:13:20 -0800 (PST)
Message-ID: <aaca154b-d5f8-4bfb-8468-6f3e24ab8699@suse.com>
Date: Wed, 8 Jan 2025 11:13:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 4/6] x86: control memset() and memcpy() inlining
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <14b65231-b83b-43fb-bbcf-dec5c07d285b@suse.com>
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
In-Reply-To: <14b65231-b83b-43fb-bbcf-dec5c07d285b@suse.com>
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
larger values.

Similarly whether to permit the compiler to emit REP STOSQ / REP MOVSQ
for known size, properly aligned blocks is up for discussion.

--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -65,6 +65,9 @@ endif
 $(call cc-option-add,CFLAGS_stack_boundary,CC,-mpreferred-stack-boundary=3)
 export CFLAGS_stack_boundary
 
+CFLAGS += $(call cc-option,$(CC),-mmemcpy-strategy=unrolled_loop:16:noalign$(comma)libcall:-1:noalign)
+CFLAGS += $(call cc-option,$(CC),-mmemset-strategy=unrolled_loop:16:noalign$(comma)libcall:-1:noalign)
+
 ifeq ($(CONFIG_UBSAN),y)
 # Don't enable alignment sanitisation.  x86 has efficient unaligned accesses,
 # and various things (ACPI tables, hypercall pages, stubs, etc) are wont-fix.



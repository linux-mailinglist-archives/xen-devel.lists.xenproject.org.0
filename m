Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C3C98C146
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 17:12:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808219.1220055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sveXJ-00048y-CT; Tue, 01 Oct 2024 15:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808219.1220055; Tue, 01 Oct 2024 15:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sveXJ-00045n-96; Tue, 01 Oct 2024 15:11:37 +0000
Received: by outflank-mailman (input) for mailman id 808219;
 Tue, 01 Oct 2024 15:11:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sveXH-00045g-St
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 15:11:35 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 728c0113-8007-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 17:11:34 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a83562f9be9so29471266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 08:11:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2775d2esm723514866b.24.2024.10.01.08.11.33
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 08:11:33 -0700 (PDT)
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
X-Inumbo-ID: 728c0113-8007-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727795494; x=1728400294; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oLcHjKU9bHH4dzp3SfypEfkLtBl/1ueSO6Oo/myeT/0=;
        b=YQwhHUUTFpS6pRIEqiaaV+ZJEeoJIf8xvh7V/59n8jVXYGW1CDP2ZX+2+3sKDiJK7C
         LBF8DfH/dil6gGTO1lGUDaAQhyntvKxn1pDNxIWxFEvtZ3faWcoNMPlYgUEJDSbFa+kj
         03LRwrjcLJnKUI+/FpGgsGMuFpmy1PxwH57r0lK35N2wkM0cymI9wS1uTQQ9CeKoAbzY
         4pTk8KWQhA9t5IfClCFKrUowOKc5vqIyYClVzjnkvCXT2cYjKcncLjGyWP03pZl5ct/z
         AVqy/3FPjEkAYfmGnFRYR/NOPDeUDqNv9ry71hSK8MRmAgMU8ZzOOejoVdZ3C9wofNhD
         4KEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727795494; x=1728400294;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oLcHjKU9bHH4dzp3SfypEfkLtBl/1ueSO6Oo/myeT/0=;
        b=bNrymUzU02YKIh0yJtOp46XcMplkOM1S4J7ZUoSrOha+vPz1zWjyo5KbxyVbHDzJC3
         bS/ISXX7BRE3PTAzKZpurcyvzEoTW5RKJbw7WDTw+ikI6al56KsV1/xMIcMElkguZGzi
         JASR0GRls0mU5PT1Cwe2x0l6LcOcDYNiJVXj+Q1PAynF7DPPbKOe5fPCQoCX1mv+g6aN
         cR2dX+sFTfww8Hq6aZiIG7N6m3ooljFLUK2BJhTTROYJO05wpflVYlnIAE0njjvdi7HW
         XEf26RXGyzWzHBxm9hI5b/gZ71GrX4ye44BfgzhTN4xI76Hx/pi1fD/Fgqz3/8BD/qwB
         QszA==
X-Gm-Message-State: AOJu0YwsGcgLLEwSLohKAPNCMPmGi2MJtN7NM1ZGBo0E4vepfDDphDcE
	miVp+7pJtaUjnxW2B6QrI91GJ9crEHecWXzJyCmDPOpKBMBvoyyZuetHbcNJS4/ERjk/Y7QPNjc
	=
X-Google-Smtp-Source: AGHT+IETOkC6bVNoyXggiNR/eFjkuTzwAQ006dAW/F+uPYqXRLyI2seXuK4T+yXKu2IKVjKMrIkRBQ==
X-Received: by 2002:a17:907:1c88:b0:a8d:2a46:606f with SMTP id a640c23a62f3a-a93c4970730mr1580011066b.38.1727795494204;
        Tue, 01 Oct 2024 08:11:34 -0700 (PDT)
Message-ID: <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
Date: Tue, 1 Oct 2024 17:11:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v7 00/11] (mostly) x86+Arm32: add/convert entry point
 annotations
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
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
In-Reply-To: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

01: common: honor CONFIG_CC_SPLIT_SECTIONS also for assembly functions
02: VMX: convert entry point annotations
03: x86/ACPI: annotate assembly functions with type and size
04: x86/kexec: convert entry point annotations
05: x86: convert dom_crash_sync_extable() annotation
06: x86: move ENTRY(), GLOBAL(), and ALIGN
07: Arm32: use new-style entry annotations for library code
08: Arm32: use new-style entry annotations for MMU code
09: Arm32: use new-style entry annotations for entry code
10: Arm32: use new-style entry annotations in head.S
11: Arm: purge ENTRY(), ENDPROC(), and ALIGN

Jan


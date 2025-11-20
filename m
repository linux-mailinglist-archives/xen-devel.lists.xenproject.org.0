Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EACC74051
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 13:43:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167288.1493640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM40d-0000qA-17; Thu, 20 Nov 2025 12:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167288.1493640; Thu, 20 Nov 2025 12:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM40c-0000nG-UW; Thu, 20 Nov 2025 12:43:34 +0000
Received: by outflank-mailman (input) for mailman id 1167288;
 Thu, 20 Nov 2025 12:43:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nz19=54=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vM40c-0000nA-0j
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 12:43:34 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85adb3d2-c60e-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 13:43:32 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b7633027cb2so159599766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 04:43:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cdac18sm195688266b.11.2025.11.20.04.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 04:43:31 -0800 (PST)
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
X-Inumbo-ID: 85adb3d2-c60e-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763642612; x=1764247412; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zt/fzjuKQABw343K3VFpJ0PIKoNfi31skzZIIaiGQ3c=;
        b=hA7KZOr1hihwtSspaP5GJ/Pz+XpS/iUHufHMW0qgxPKpTzBc0hEEKfMM8tuupcWmxc
         TqIsqB5xi8JRA56WhL5yjpPAvX/GvdLII7+9dVEi65qoFRLMcB+iqaI4M38t2HFxlvIf
         w4zgvQUG9i5mJjgXJR4Gm4V3Vb03tQ+6QiHPz1R0p4Yz2P2kk//BK3+KhEPCE2Ho6Vqx
         o5boQ4zIQRcbPz5SD9dQInjVePRfYO5t1xYSNo15eJ6K+0BPm3mzW7UvKiopHL/xW84h
         bnMg8DbCRgzI3Hnq8iY8lXQNFL2nF69eYozssOpKUvYrAcVfptXtQbzBiUtp0jcUzb2n
         tFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763642612; x=1764247412;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zt/fzjuKQABw343K3VFpJ0PIKoNfi31skzZIIaiGQ3c=;
        b=p1ZSioaxR+HTjxZ1AyJ2lVqOq/96UVFwpB863iEeUCb/hKH31ryyY/S5VyeYYw/PGD
         K9VV5rGIBCorbAPWQb1Dlh0pxWNfMqgEM4JYwZGEDJbr30NUSqFFbd/rhnPCv7+glSK2
         bNmXgPZnYIhDrEeU8bdlosn/8DlhL/oG2a+v85V/hEWN/Oe2cn+ft4SrJlsaqJGcdZTy
         QRr/Tv9CVHCF9MkJkAeDJa696iV6NvUGubxzJKNzjeyAnMOXhUEhoeUxD4K8Ghq18luO
         q7Zae8RbNw9AD/QxLE/poOUosTzHK8IthyxvSehDip/beDlhV1mdsp5lK51m0yl6nfxw
         SwSw==
X-Gm-Message-State: AOJu0YzXMoOQ+8g/XiCfCqLNlGUT2sUW1WceekOM97W9hChC6vLZ+zP/
	uOiMxqFMBFJfMCyXvRG+Xv34VwjOIFsW+AeO8KVNXTB22xxmCoUiw0KF9xEKAm3oHPMPVnkhAde
	bbYQ=
X-Gm-Gg: ASbGnct1kATKkDBbYl6kS9BA9NhHZTPvfiIrDI32EfbVTma168TYPYmTtoGj6GfeQVA
	lA5ZqT5EHroyFhrLMxTOcuYxBZ13yQAH1m+Li7ay54siqAc04+8zL4MfystmwdOSgRtLzhSkUdw
	0BVNQxvuQegS5BQWfwP8zl0K+GqVa22v0sHq2sIAB35jclohoLE2a7puZ1QpI6SgwyYPYEZdEXp
	zlcb3TOYuRH1c6AuicUkJSKRx+sNUy2qt0NUjveJzbky0sTIMUmybNXpQrGyHGjYJ0qSRR/rx2E
	XhHw4r+6nsDqv/K1EmCsj/4wva1hO2h4GZzA4qJtUVUoc3E0yX519y9Zhoznp5muv4Hl3e2IsWV
	yxogjASfleOrYRjnMQKLK+BQKy7WEFjjSjoJVId4UbRZbnHPyg3WcpqNURVs1gn8SPUFJFiUIoi
	7oKMV3Ua65v+7UaeKnrc0yG4qAhdqNTVwBDkxNFrJn3MC0cc400YvHKMRImd+c0xiHveWkyNpA4
	p4=
X-Google-Smtp-Source: AGHT+IG9w1gqtxPyjeJW1LLxsyZ1bKy1W4iF9XlCcfTp2jpvmazZ6g6Q4WHrWolOu0DZ53j0phIKOg==
X-Received: by 2002:a17:907:7213:b0:b70:be84:5186 with SMTP id a640c23a62f3a-b765560d05dmr295111266b.44.1763642611702;
        Thu, 20 Nov 2025 04:43:31 -0800 (PST)
Message-ID: <9ad4e324-575c-4146-a494-82720faaafe8@suse.com>
Date: Thu, 20 Nov 2025 13:43:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul/test: correct compiler checking and avoid it when
 merely cleaning
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

The error messages that the compiler may emit can be confusing.

The check was also the wrong way round in case multiple make targets are
specified: We want to do the check whenever targets other than the running
and cleaning ones are specified.

Fixes: 05f4cc219235 ("x86emul: suppress default test harness build with incapable compiler")
Fixes: d5997399b7ad ("x86emul: suppress "not built" warning for test harness'es run targets")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -98,7 +98,7 @@ avx512bw-opmask-vecs := 4 8
 # partially even with older compilers.
 TARGET-y := $(TARGET)
 
-ifeq ($(filter run%,$(MAKECMDGOALS)),)
+ifneq ($(filter-out run% clean% distclean,$(MAKECMDGOALS)),)
 
 define isa-check-cc
 TARGET-$(shell echo 'int i;' | $(CC) -x c -c -o /dev/null -m$(1) - || echo y) :=


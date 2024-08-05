Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B2A947BCD
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 15:26:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772169.1182603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1saxjJ-0008IO-Ej; Mon, 05 Aug 2024 13:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772169.1182603; Mon, 05 Aug 2024 13:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1saxjJ-0008FH-Au; Mon, 05 Aug 2024 13:26:29 +0000
Received: by outflank-mailman (input) for mailman id 772169;
 Mon, 05 Aug 2024 13:26:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I4ub=PE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1saxjH-0008FB-Vu
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 13:26:27 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5123bfbd-532e-11ef-bc03-fd08da9f4363;
 Mon, 05 Aug 2024 15:26:26 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so1058042766b.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Aug 2024 06:26:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ec7311sm450930166b.195.2024.08.05.06.26.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Aug 2024 06:26:25 -0700 (PDT)
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
X-Inumbo-ID: 5123bfbd-532e-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722864386; x=1723469186; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+LzdTN0LrxG38E8N8sPxyACXjQToDaja2vpqjapp9Eg=;
        b=RdJmJdVBRZeoxP0pmdm9ihdh4hHZINOR2KgzvUyeDCzabyD+jqwaB7EIUntFWBdwcF
         S3d4L7/RIdGhc9jGrKypiIDcQ1lXeSah1T4KpLU/9cPwGeXuI6HRGWE4ql6oqHNaiXf1
         zK5C5uTNLoDGeSrmcjOmc5O7x05svH2io65P6OvTbpitgMbEVpG6pG0TzHZ95/5/R2rO
         2U1o5A4AzPUO/N29qP/Th1k6x16q0sfERkkui5wJljTQs6amEV42FNSX2QUJ0pLG3kJd
         2GRnzb0MQBgqagLTUFvFkcjp8wHfhMDZMLrjJlfF4sRlfuYsdacp2f6pDyskKpj7EV5+
         9a1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722864386; x=1723469186;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+LzdTN0LrxG38E8N8sPxyACXjQToDaja2vpqjapp9Eg=;
        b=Vy5xd7B5OdV0IKVaA8Tie0/Z0RGCOf86rrvUz6QXZdJ3tcPjBpVZfiiYigPtSgQLpE
         tAZ6kqkX0q1IqQEnqsJkXEEAcUsgf/cadFNYBjcSfpeFgWGYm/CS4f2Ozfcok4ME8h4Z
         NSa+0dKMYMlmGQQhnEbnShGvLGqSn1kmu6Ui2k2aL8ThM2wBCLEHADH0bQdkejOqOsin
         p3Pzkmy46Y2kUj+rz90kye39O6KNOSDdvVq0f14loBUrcf4Y43/1eFTEaHOHkr4K/xoZ
         1bzoTKfEwzh/WLmPjZmlAk5zLMv4vrRS9GScY7ZDLXEbcP3ctdsNz2xeBF1EVhb0TD5Q
         opZw==
X-Gm-Message-State: AOJu0YyjY1ixAVYt1qdBig0deGJ6b1NRlR/WV31TCq9YClh7UR6Q1bQF
	vWgSj6me8zKp+b+QUtJwbOCQe1GbaUV/I9rFCmm+NYKAlH8LLDY9ALiUVZXmgVE0yXvobs6O+ho
	=
X-Google-Smtp-Source: AGHT+IEaSEApBX9iP9WPNnL2z7ZkuNTBn/gY4lvs+wzc4dIaNoeI7NG7bGtwnguukxMUlhzFhUkQYg==
X-Received: by 2002:a17:907:2d08:b0:a7a:929f:c0ce with SMTP id a640c23a62f3a-a7dc4df9533mr670154366b.19.1722864386087;
        Mon, 05 Aug 2024 06:26:26 -0700 (PDT)
Message-ID: <81ae365f-98b4-4bb6-bbb6-c5423dfda038@suse.com>
Date: Mon, 5 Aug 2024 15:26:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: don't call ->read_segment() with x86_seg_none
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

LAR, LSL, VERR, and VERW emulation involve calling protmode_load_seg()
with x86_seg_none. The fuzzer's read_segment() hook function has an
assertion which triggers in this case. Calling the hook function,
however, makes little sense for those insns, as there's no data to
retrieve. Instead zero-filling the output structure is what properly
corresponds to those insns being invoked with a NUL selector.

Fixes: 06a3b8cd7ad2 ("x86emul: support LAR/LSL/VERR/VERW")
Oss-fuzz: 70918
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
It is pure guesswork that one of those insns did trigger the assertion.
The report from oss-fuzz sadly lacks details on the insn under
emulation. I'm further surprised that AFL never found this.

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -839,7 +839,8 @@ protmode_load_seg(
         case x86_seg_tr:
             goto raise_exn;
         }
-        if ( !_amd_like(cp) || vcpu_has_nscb() || !ops->read_segment ||
+        if ( seg == x86_seg_none || !_amd_like(cp) || vcpu_has_nscb() ||
+             !ops->read_segment ||
              ops->read_segment(seg, sreg, ctxt) != X86EMUL_OKAY )
             memset(sreg, 0, sizeof(*sreg));
         else


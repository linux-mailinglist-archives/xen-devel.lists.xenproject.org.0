Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA41ACC066
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 08:44:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003995.1383636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMLNm-0001GK-DL; Tue, 03 Jun 2025 06:44:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003995.1383636; Tue, 03 Jun 2025 06:44:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMLNm-0001E1-AX; Tue, 03 Jun 2025 06:44:22 +0000
Received: by outflank-mailman (input) for mailman id 1003995;
 Tue, 03 Jun 2025 06:44:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YrW=YS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uMLNl-0001Dv-7J
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 06:44:21 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c0a6469-4046-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 08:44:18 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so153402f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 23:44:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506cd38e0sm80475425ad.138.2025.06.02.23.44.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 23:44:16 -0700 (PDT)
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
X-Inumbo-ID: 2c0a6469-4046-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748933057; x=1749537857; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iREsn6hQ3afS1my3XeOX0j8869opqd7CwiKVSjMzsGI=;
        b=N7C6JNgMuOygOD/cVwTWiVNHPurji5qDlkaZCsKAP94vqtmYvRQDFPQX9lRlQ4o5Z4
         8hpSRqEGH8qhszi6SxMxwZoR6nw+sYTh1e/99EJiHaHHyITPY+gBJTfr+tBoTbaZzdmA
         +7Za8tfKeNQqFWnV2DoNRWquLIrNSCdSxFF/2athjoUmikf1YJi82EFQXNig/D+4XV7m
         X485xWP9nAATYxUjlJ/XxLH6D3uTSP1/J9RB8BAWyikrPr+l48V+kR1yl3xQfvhwcGwl
         QJeichUInzKRMsNQV/EUT1P9nf+BAPeaigZKw59Y3oPSu88FfnkeL93hb+xA+bGTRd9p
         7xVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748933057; x=1749537857;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iREsn6hQ3afS1my3XeOX0j8869opqd7CwiKVSjMzsGI=;
        b=Oi4FPx+fOsm/tH0SzQ4/efZRrxW3N5gnZMWuFSfIjTZZxVosubFlT6arDPiqXY7iv5
         fM277CIT1MAdN3NGztN5KvS3MhMwQ+z28iz4YUo6qOrc76jTMXZ/L6m1DlCLq3BxaFx5
         mNqbiT/4PqbMqbfNNhOttZ/pkOdX54odCO087sIlwASK+0Sg7IetD1MUMbonP6ldl9bw
         TVfClfSqjemCWPMicBzZiXgalYTuY6NZ9qpRAKHrfiHyxSjzeorTuLgVSfI4NvVWZdBp
         Tc66TFQepCnAnyP5hfarkxFkzjennU6VJ0bT6oOqEyoK43iKh+5hIuvF9MYZrYWAjhtY
         YfGg==
X-Gm-Message-State: AOJu0YwBIJBUXUOcw8vITRlsi+U5HGDsB7eHG3pFCMZbJP04bHaibFKP
	WRP+gY9cWC4NngvEXHfAvn9LnjmpAYgpecCa6c4Jpt1baG8MVgPXQP6gYhO9aKDhAOgQ2lHxMjq
	wTw4=
X-Gm-Gg: ASbGncvkXPyzwh4FN8n0Le9tgeZIuI8Ziipr0/aMGYk87WUmy2AVVusSp+pmOAnplfc
	UhP1DkFp7xgG63GuhfsnUBRIa3Ebpn/HwPg7yLGUvfBEcmONu4Pl9Ru+FaMT88MRpKMqSs1zMSq
	DtiVyamV0OLDbRjoTaVoS/h0kMO/gQUZVvkbEv1gS8435wqQWvImuaE7a97TAR7Fh5z900VK6Fq
	YWRjMI04wvG3bI/3BCDqOf+q2otIFYYf50UaVHsX0nL5tNqD5yFYssQfG3+20upA9KkplK/7L1a
	I5oZ0Z3YlhptB6bWabRiD9pWod5LHDe8GWampFfpk60E1KvICXkkICE6HgMf4bjL+ZEJWQQnQmg
	VNbjHp1Seav1Oj3U14BFzi7CAcn97fvVi+9pKjmyFPN16VxI=
X-Google-Smtp-Source: AGHT+IEyu27B/PMf2uuIFQI/zJClAFz2NkQRnW1PPOCRasV8axwAagt9DtnzVc9kp3j4cgEJYxbZUw==
X-Received: by 2002:a5d:4909:0:b0:3a4:febd:39f2 with SMTP id ffacd0b85a97d-3a4febd3a7bmr6184866f8f.37.1748933057331;
        Mon, 02 Jun 2025 23:44:17 -0700 (PDT)
Message-ID: <b113fa13-b006-4ec9-9412-fe8fdf0f096a@suse.com>
Date: Tue, 3 Jun 2025 08:44:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] compat: add header guard to xlat.h
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

This is to conform with Misra C:2012 Directive 4.10.

Reported-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -105,9 +105,14 @@ xlat-y := $(shell sed -ne 's,@arch@,$(co
 xlat-y := $(filter $(patsubst compat/%,%,$(headers-y)),$(xlat-y))
 
 quiet_cmd_xlat_h = GEN     $@
-cmd_xlat_h = \
-	cat $(filter %.h,$^) >$@.new; \
-	mv -f $@.new $@
+define cmd_xlat_h
+    echo "#ifndef COMPAT_XLAT_H" >$@.new; \
+    echo "#define COMPAT_XLAT_H" >>$@.new; \
+    cat $(filter %.h,$^) >>$@.new; \
+    echo "" >>$@.new; \
+    echo "#endif /* COMPAT_XLAT_H */" >>$@.new; \
+    mv -f $@.new $@
+endef
 
 $(obj)/compat/xlat.h: $(addprefix $(obj)/compat/.xlat/,$(xlat-y)) FORCE
 	$(call if_changed,xlat_h)


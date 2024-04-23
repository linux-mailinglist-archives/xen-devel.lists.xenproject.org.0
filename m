Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C138ADE94
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 09:52:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710353.1109521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzAwQ-0004LO-Ig; Tue, 23 Apr 2024 07:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710353.1109521; Tue, 23 Apr 2024 07:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzAwQ-0004JC-Fq; Tue, 23 Apr 2024 07:51:50 +0000
Received: by outflank-mailman (input) for mailman id 710353;
 Tue, 23 Apr 2024 07:51:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ck89=L4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzAwP-0004J6-CU
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 07:51:49 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5630cc7d-0146-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 09:51:47 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-347e635b1fcso4315109f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 00:51:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g18-20020adfa492000000b0033e9d9f891csm14040548wrb.58.2024.04.23.00.51.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 00:51:47 -0700 (PDT)
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
X-Inumbo-ID: 5630cc7d-0146-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713858707; x=1714463507; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlop5WD1SmwWjqEVAjBw9FGVKoSVOaLuqB3BYNKVRJw=;
        b=WJ7PtDQsKLTPvmDg1+4NJmx35jk5I1XPFCBtDYHt9hG66O9sTb/BtXsqJ3eHENxND/
         IFRG0OIyw9tdib5BB5vo9ikqKFCvloY4Q2w8uJLHXPe0Y9kYWm5J75RdulYtCTG+JcdM
         ZeZo35zb1i0iiHJ+RKnoHV0X7QrDbxyvkprNGbWYGRVh31/Q2RMGesclra+BiAEBq/Id
         n7XVLM+yi0sX/nCFVoeE8qXg6qzIlVgh1Oxai+LEBZ3DMMyzyl1M0HZId6soiM91rAud
         w0MtbycX3iUNAHmDvVPnmhVXKn8oBO4lePCDnbAhc6/IL0fkPGR091alG3NQS4K+D7XH
         WtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713858707; x=1714463507;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xlop5WD1SmwWjqEVAjBw9FGVKoSVOaLuqB3BYNKVRJw=;
        b=BVbLfCRz1efZ+MWhdDym22sxKXgghXw4/dxKBcnj3uUA0hGHjRJaiyXnEUs+hqZgd/
         7LZlRE6WGGxmB/c6eS3Ca4evQrTFkh3DgNK5w0LmD7CATfeU0Kpop4iU6qD3k4q2TxEJ
         pmG8X6k7DM1LrrD2L+dMhcu4IKu3gu8P+/KP8YDwBrjkW2D1Et+8Y8Pac9wuALm5+6Rz
         rJPmMU959+9dIQM7Ac6eFLWhu8aoo1m8mVlrSmlRR3luyV0BjZb1QU91c522dA+H9237
         kLbh0Yho0XEGKYl0kU+nzMTFJh3VQVJD4xTl6jb+YlWpX2uvKIPF+hEtYcfh4VWgfBjk
         gB3Q==
X-Gm-Message-State: AOJu0YyUVKAMGdSUkso6pZE2rd78irAtb0fcaQHPSUzTPSpki7Hxj8Vk
	/YtnZZGOSvLplAwDqRCy78Zgy05IKSvYqkAuVaGsiFShAH+TK4mx5zCyFnR+hSeEKAQKFaFwV2o
	=
X-Google-Smtp-Source: AGHT+IETAlxb9DREgBSzCW/jbxuxQ4KLGT790ocVRuphw+tRXocKATJ6Vxr+dsQD9o+NJYdArXietQ==
X-Received: by 2002:a5d:6da8:0:b0:34a:ed29:8d1d with SMTP id u8-20020a5d6da8000000b0034aed298d1dmr5455541wrs.64.1713858707340;
        Tue, 23 Apr 2024 00:51:47 -0700 (PDT)
Message-ID: <bcdd2e19-b89e-4cb5-86ec-f84e38db2c98@suse.com>
Date: Tue, 23 Apr 2024 09:51:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/MTRR: correct inadvertently inverted WC check
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
Content-Transfer-Encoding: 8bit

The ! clearly got lost by mistake.

Fixes: e9e0eb30d4d6 ("x86/MTRR: avoid several indirect calls")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mtrr/main.c
+++ b/xen/arch/x86/cpu/mtrr/main.c
@@ -316,7 +316,7 @@ int mtrr_add_page(unsigned long base, un
 	}
 
 	/*  If the type is WC, check that this processor supports it  */
-	if ((type == X86_MT_WC) && mtrr_have_wrcomb()) {
+	if ((type == X86_MT_WC) && !mtrr_have_wrcomb()) {
 		printk(KERN_WARNING
 		       "mtrr: your processor doesn't support write-combining\n");
 		return -EOPNOTSUPP;


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 583F7A76B53
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 17:55:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932806.1334872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzHTt-0005EL-Hv; Mon, 31 Mar 2025 15:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932806.1334872; Mon, 31 Mar 2025 15:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzHTt-0005C9-Eu; Mon, 31 Mar 2025 15:55:21 +0000
Received: by outflank-mailman (input) for mailman id 932806;
 Mon, 31 Mar 2025 15:55:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhU9=WS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzHTr-0005Bu-HX
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 15:55:19 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8aa9a069-0e48-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 17:55:17 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso40953325e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 08:55:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8fbc1889sm125371135e9.16.2025.03.31.08.55.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 08:55:16 -0700 (PDT)
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
X-Inumbo-ID: 8aa9a069-0e48-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743436517; x=1744041317; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DrgN7z1rTdLiHHSoi+g5/iGBD4lyEtsF4XB4ie4GDRs=;
        b=BRMZ/ybC79jy2yjVBeS+Nf5g+iP7s8orEi2Bq17nkKtiaZXVb9f/+J5qwx2Lfj7z2Q
         SPr7jWkDBIZO7+YsT81xT6ivAc/Xrm/Fgp0J2NsRZIHWqGFsg5UoLuDWmVt410v6Pvbk
         +vDtwYu8sPuNDX/MagGbJtE117ZyZQW+9wdvMBwTLrw6Frzl0UC1FbawPG7FeXrLOI4n
         Dubqt2rcDpK8ZFvCRvkQZc45Xyy3xtMCn+yF71EZyUvugf8IqcpnB2nVwjh8dmQuxll3
         3lS/YxzhB3+bhX4kPZnwMIDP8lIqxJcJCzVhVyjYc892rPhQ/Xm3nT3V6SsDT/2jhBGa
         7PEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743436517; x=1744041317;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DrgN7z1rTdLiHHSoi+g5/iGBD4lyEtsF4XB4ie4GDRs=;
        b=fnthUqA6+1R8Opq5oPUFxre4yss6H0TKKi2XnrJpto/RsnTsxit7EYrzNfS+GsnxOd
         jZWyi0kSH2XsKiyY7AGoDsKjj17sByPtiJdjyW09T2daxEhlryGNCZYjt4qx4DKH+WDs
         FJF3A7suVn/SnPafhtHjVRqlCb1GuGKHc6Odcq2r3A9417ou043EtPJeDgswdYvhUzBT
         W2DO1e6zbwbxDN2a6xG1YxK48Z8YTxFkjdt+FLcJVQLqLErz84ZIUMMzBnyCzkpAejQf
         q8cwvCFMgfcdwWzadoEzP+AvBH1Pl21InqCkxhF24bcwjjWzX8kmei8ystjX2GVpOlXL
         biJQ==
X-Gm-Message-State: AOJu0YzbG6ppClUZAvhaejqykIvcbb2TF58uzQqhhVdycnA9dBBeCjFo
	GJBjFd4zqr74dY016+68AuQOccKWFKIqDvPr4pFSWBLOvklUYZN2ojCIdO9g60PPuSTH2Q27cAs
	=
X-Gm-Gg: ASbGncvDrmpxsbjY+kjrMsfCHQqNJ49feW2/Bgusoi3RUtEzg7hNqu3wv9zmAO9yO9d
	hY7sNNJpFHJIGbnBJksv8VMIEN7Nkyf77R1WCgB9YLN8SBxrNJh/JZKWWNcQQ7+iyy5J/T8jSwR
	57p9LwVDRlBRJsGZjNwBmGt/bBrOqUpwgPL8xXfqvv2foxAer5zL5YWh77OFQrcxW7HF6JkduyH
	7Fl9f9M+BTIWT9TyES19yVymZjZNro+YGp/TvFHeKyiDz1Dx/+scM46b/xor7A9v6xVs11zNaai
	oR+tSQVHO+LJjDufwZHxOWbIdhAXZIFUf4eVPHlgGocuSOAisakbiOps4HF3nGm6EBmt0H1WjGT
	Y4XRBFl/Da4ZfVtaC7xMFRIIkqW/PRw==
X-Google-Smtp-Source: AGHT+IG7hOWzO+XEUraYGP7o1/5DmJfdY8dDpr+Y5S1QHLgH70M2f44r85rg7uHWbxPrw0R2cIGPtg==
X-Received: by 2002:a05:600c:34d0:b0:43c:ec0a:ddfd with SMTP id 5b1f17b1804b1-43db61e0308mr77664265e9.6.1743436517120;
        Mon, 31 Mar 2025 08:55:17 -0700 (PDT)
Message-ID: <569f350e-21bc-4fd3-8bba-991d6c34d08a@suse.com>
Date: Mon, 31 Mar 2025 17:55:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: make test harness build again as 32-bit binary
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

Adding Q suffixes to FXSAVE/FXRSTOR did break the 32-bit build. Don't go
back though, as the hand-coded 0x48 there weren't quite right either for
the 32-bit case (they might well cause confusion when looking at the
disassembly). Instead arrange for the compiler to DCE respective asm()-s,
by short-circuiting REX_* to zero.

Fixes: 5a33ea2800c1 ("x86emul: drop open-coding of REX.W prefixes")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -110,11 +110,19 @@ struct operand {
     } mem;
 };
 
+#if defined(__x86_64__)
 #define REX_PREFIX 0x40
 #define REX_B 0x01
 #define REX_X 0x02
 #define REX_R 0x04
 #define REX_W 0x08
+#elif defined(__i386__)
+#define REX_PREFIX 0
+#define REX_B 0
+#define REX_X 0
+#define REX_R 0
+#define REX_W 0
+#endif
 
 enum simd_opsize {
     simd_none,


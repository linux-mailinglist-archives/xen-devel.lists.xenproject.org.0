Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7332AD524C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 12:43:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011486.1389936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPIvN-0002Us-N6; Wed, 11 Jun 2025 10:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011486.1389936; Wed, 11 Jun 2025 10:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPIvN-0002S7-KO; Wed, 11 Jun 2025 10:43:17 +0000
Received: by outflank-mailman (input) for mailman id 1011486;
 Wed, 11 Jun 2025 10:43:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPIvM-0002CX-6U
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 10:43:16 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e124c395-46b0-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 12:43:15 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a50fc819f2so5293132f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 03:43:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482af3835fsm8907951b3a.27.2025.06.11.03.43.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 03:43:14 -0700 (PDT)
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
X-Inumbo-ID: e124c395-46b0-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749638595; x=1750243395; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CwZ9JikHD/wnh4WhC0HUOzLh2w/84RfcO+smo2vM6EY=;
        b=ZMG3XHADwY2O76FGNFVJMp69YpxMa6zfF31ugwRdRB0m48OfZfP2PkDTY7B5TxlpA0
         Zp+n3fRDvC8LZzpivPib0gOOwnKAl3aE68m147nJCO/VIlptSaA2u3w1HnU3RDwYa2lV
         89vFT2nT5gkzmZucfoprxBd9W+Uts8ErNQ9zgb9rSRxXOodjCuUjhXc5lAO/Mwhtq7a8
         KFjC/JejMkkt0Ax/EIeaB2aCwsEdpBKNpZYlEHwenQWnQRCOIMU9XP2JAqDVYZCw2UOA
         4Z8GhVnefE6ptn24qY1AX949FMhBkoGHHpI939V6KnOTasQK05VHkWz6E8uroAThvZHc
         8Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749638595; x=1750243395;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CwZ9JikHD/wnh4WhC0HUOzLh2w/84RfcO+smo2vM6EY=;
        b=OrM7TwFv5kjszZ/u0X5v0e1J4b2xIabYI0XwEfZLnwBOR8i9RSkPxMsgMDu6ETpWY2
         0CGxmQv9In5RhlaQfkDdxvHthbIGih58NhCrqjdl4tu0sg1EKXpvaduJrSciGuCz8vB9
         iZsAf+NoZgRLLnmmtMNfunP6KKzLNoA8b2Luzk6TveMAiaVkZNcllotFZcu18k7wsHDp
         aPh+iM8VA48uwMWWSEJGgTCWjAWoJX9D8tFmK1WgNA+t+TUOXNU0AFQC460M9MGtjoYe
         D3Bmiq+DmEMDEo4ot9l6ieBHUxf0nnuD6IykFD2DoB7UzP9eGxP9aMSNGUkMYbdq3x6N
         TSzw==
X-Gm-Message-State: AOJu0Yy6iYgxFWJ0oCln1VVbpui2oRo6igxT9eLSNFDDd4IAWdPl8bGr
	ynxhVamf2dehkfsYO1nFHqQpVBOIym7laL1fMxDMgzU90nde9kxzTOq7Ux0FEQKgW253BhGGQYJ
	gsBU=
X-Gm-Gg: ASbGncvxlVyqEsK6wD33fRHW6YKv+9nuwI2F0ccKXBBSMq3/kq7L0XQN50IEj8kwm+X
	M9X3/J8dBBZQXHabBk2USPW4OjQ0YCO9JpWCmwZtuJ7AaLib1Tz65h/5vZ7rf/yUK8Ule/Fh7Z3
	Ep9McYlqXxiaKRNJLAfhDUf9pNDBAP9Cey3qb/bA1FbudIZGvLQ0x3yoP3MPLIfpZK+ajwUzEpI
	Tl/Xumzf2WV0X8cxp3B3kKMps/FWm69WMvzShCxGk4aInvNMoFxEzUTlCQySxo3QVu/qCDOzdbl
	XTETXsCPKsY+9C3eJdd/pIW5JWgBEwzDDR11c5UepVs5UzZy/1zXbC1skQLcH04dbPMLrp18X5I
	2AB+SJdgabkkOluOrQ0UCrqvnANaYDmHV2tCYUb1Q0B9O9fs=
X-Google-Smtp-Source: AGHT+IEwr4ftsGO5IGXJKnsdPpYNHTLOF4rJQtTbdv1YuuTmp0MoL5SqHcMsQJ82o2O9eBoSMSwSUw==
X-Received: by 2002:adf:9d84:0:b0:3a5:300d:5e17 with SMTP id ffacd0b85a97d-3a558a276f3mr1578553f8f.29.1749638594978;
        Wed, 11 Jun 2025 03:43:14 -0700 (PDT)
Message-ID: <76166ff6-3409-4279-89fa-7ca188b8748a@suse.com>
Date: Wed, 11 Jun 2025 12:43:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/6] vVMX: adjust reg_write() for 32-bit guests
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <44d67587-415e-4ec1-a433-64a12aea80d7@suse.com>
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
In-Reply-To: <44d67587-415e-4ec1-a433-64a12aea80d7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Using the full 64-bit register values is slightly wrong in this case;
32-bit writes of registers would normally zero-extend the value to 64
bits. The difference may be observable after switching (back) to 64-bit
mode (even if as per the spec upper halves of registers are undefined
after a mode switch, in reality they retain their values).

Fixes: 33a7028fec44 ("Nexted VMX: Emulation of guest VMREAD")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Note that the sole affected VMX insn (VMREAD) is invalid to use from
compatibility mode, and hence the more expensive vmx_guest_x86_mode()
doesn't need using here.

--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -372,6 +372,8 @@ static void reg_write(struct cpu_user_re
                       unsigned int index,
                       unsigned long value)
 {
+    if ( !hvm_long_mode_active(current) )
+        value = (uint32_t)value;
     *decode_gpr(regs, index) = value;
 }
 



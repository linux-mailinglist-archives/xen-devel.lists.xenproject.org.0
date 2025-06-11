Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C236AD52A5
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 12:50:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011525.1389981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPJ2e-0005ll-5s; Wed, 11 Jun 2025 10:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011525.1389981; Wed, 11 Jun 2025 10:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPJ2e-0005jU-33; Wed, 11 Jun 2025 10:50:48 +0000
Received: by outflank-mailman (input) for mailman id 1011525;
 Wed, 11 Jun 2025 10:50:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPIwl-0002CX-1h
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 10:44:43 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14fb8239-46b1-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 12:44:42 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a54700a463so532152f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 03:44:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0edb54sm9164076b3a.173.2025.06.11.03.44.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 03:44:41 -0700 (PDT)
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
X-Inumbo-ID: 14fb8239-46b1-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749638682; x=1750243482; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qJe2b9Ve9u5yERr1EJ80GBKKaRjXsmkBckErKPpU0kg=;
        b=LNmv7DieUcYF7vRUk+HxXaVBWNcHRYi8jC5MUBtBHICgTowB/jj55c21P9eE8QkeFp
         0Lbm9scgb5lSpvkzaOfJq4yV9+fvhDwaoCMFmKnpY+aYobyr7/x5YQdKf3jpYlWOD2X8
         rlmGGn+mUPuhL1KO8fVMRwWU8otsqcVYXVdGvKLr/08KhoF4BlOshbgpFqGXsMKkbF9f
         TcaPbIQGCtdhUAKgLqcDUkuThyJwpN43TsUzwRx74ew/M7PjONsh96jUZ55+ouTXsd3i
         9dhriES90o6v5khrw4Vtk0LjbdifBeOq51YcAhBIF0WktcYfyFARjn75Fes3ep3n5wfy
         lvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749638682; x=1750243482;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJe2b9Ve9u5yERr1EJ80GBKKaRjXsmkBckErKPpU0kg=;
        b=Fg0tdNzkedSQK3RPKvajIBTEa2ZfNaFSjAtU9A/rTw3Iihrw7gQDZryB0+TzY5aR/l
         26eF15wNASIa66LxXxHiWIgPrWXX4cWj2z/egMikRCJOguqelIGygeatLN02DtfOoOtZ
         nSFa5KUqRQzfr959rBI34UnyzQLyOeqVQaWeLmexpqcbFxiITzu7sSspYEDcHP+OVtcH
         EIyPZ5N7dNF7x6ICajXXEqWRXKTU7fxZmxVfZotOsKc6LMM3K9c8XSbEYEVoLkoHYMpU
         E6deBp95dhxu/WWZhwCh9PGWLBYEZKly68cZKbirJoV8PxsHFDqBGpw5YVVPB5Z5hvQq
         Bbsg==
X-Gm-Message-State: AOJu0Yw7iTFRHIuz+QY/Ue3dKtF65evULmePkrdoOuRbcOVhNmjTMFZd
	WCxN0tWesW8KMI+Upqui4qzZGsBRjwadmexKtMimA4S//EBP1tE8bdweKqJwNXLTozs8uVx5Vbr
	/h3Q=
X-Gm-Gg: ASbGncurnHjNGDJMw2Ysuthjrk7MxEinGjeeeBprTEuA7x/rxxHYycfUKSaGlec8Cph
	QeTV7jzRCu3ex2g1zQjuqG90WPx3TJBRXFDPyBy3flT18Yr8mNHXSsZUpwwwLMWho+cFyR1h0FQ
	R6F4EqQ+VkcixCaqeeEz6hXHPs7n7Infjuq4L8emk8DW6We+S+NmcC18klCm0m4fKVcQnkCmuzX
	hAGdbOt2BlsryjzCW6QFawx91HyqTpkLD86AamDnfEt4IlSJ3lTe134XyA8DAOk2SlodVPsPZsw
	kMtJNb2vQkVRN5voPU2qgmHgvugB3aaHJr3gsxXJ8ggZm1jiiLfJevRxhTg8N5lOCE1/kubFDJC
	jBuzpAZsAwok8AISnXzGvAUP2T/DXZ5t67GxyP8Qa290iRFw=
X-Google-Smtp-Source: AGHT+IEThpE825vd6h/mVkbXdfWYgfywPI7WN9IWWju2j1Zh1DSGUJ9hblzZlgDPFzb/2sa9bWeH1g==
X-Received: by 2002:adf:edc1:0:b0:3a5:270e:7d3 with SMTP id ffacd0b85a97d-3a55824dfdcmr1896420f8f.13.1749638681906;
        Wed, 11 Jun 2025 03:44:41 -0700 (PDT)
Message-ID: <9d0696eb-52d9-4501-8aa6-2d5e572d6433@suse.com>
Date: Wed, 11 Jun 2025 12:44:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 6/6] vVMX: address size in decode_vmx_inst()
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

While the original use of the address size file in the instruction info
provided was wrong, it still wants using: The offset into the designated
segment still may need truncating accordingly.

Fixes: 09fce8016596 ("Nested VMX: Emulation of guest VMXON/OFF instruction")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -441,6 +441,13 @@ static int decode_vmx_inst(struct cpu_us
             size = 4 << mode_64bit;
 
         offset = base + index * scale + disp;
+        switch ( info.fields.addr_size )
+        {
+        case 0: offset = (uint16_t)offset; break;
+        case 1: offset = (uint32_t)offset; break;
+        default:                           break;
+        }
+
         base = !mode_64bit || info.fields.segment >= x86_seg_fs ?
                seg_base + offset : offset;
         if ( offset + size - 1 < offset ||



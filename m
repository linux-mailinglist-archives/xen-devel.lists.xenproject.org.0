Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2D3C53180
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 16:39:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160119.1488343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJCw5-0001V6-KJ; Wed, 12 Nov 2025 15:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160119.1488343; Wed, 12 Nov 2025 15:39:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJCw5-0001Si-GX; Wed, 12 Nov 2025 15:39:05 +0000
Received: by outflank-mailman (input) for mailman id 1160119;
 Wed, 12 Nov 2025 15:39:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJCw4-0007vC-Iz
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 15:39:04 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7a894ec-bfdd-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 16:39:04 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b71397df721so157016166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 07:39:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bdbc9656sm1633664466b.7.2025.11.12.07.39.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 07:39:02 -0800 (PST)
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
X-Inumbo-ID: b7a894ec-bfdd-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762961943; x=1763566743; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kYT8qoqnprdkjXlqI1OoX8dNcvzXGPzmLDAARTBQY5E=;
        b=fGoYH7d/ELZPH9du88k69a0sK2D4ad3v5m7mCGTpau4qoi06Th00Az4QQ/LsHCtjmJ
         r7mAmKdjP5QQr2DdwtlwKBlAryuGLRp6zJmPjUfDW5wwOC4O3kJ4aS3TD/nqOM7PLyre
         7IPPj9lsN+pvMeY9aagjgZ/2x7qXaENcuQMfkkyj+6yY+6hBujKaQqLYTIjI5pt9vSn0
         IWJluK3nwaGq/zBfQ8nOLro9O08uXT3khSfYpelom0m2nQIR8GobAB/BraixbgrsG0qK
         y6quAGTZAkMSx/r5Yr8crIxaAW+ICE3Bf3W/4xJ4/Ou59qYJeSqkvTzhMSE3JeLw3aL4
         PCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762961943; x=1763566743;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kYT8qoqnprdkjXlqI1OoX8dNcvzXGPzmLDAARTBQY5E=;
        b=FwjgU9EAwlp0pa0naGvEG1vfQ0itkPumSb4bOoasmCpk05YTaYNhLq9PQdL4PUwYgU
         mfuZ0de19gywx68RzVNdLFdtmnZLRijzhEwNthasuQCoZ6l1QYiWCqQr75MDLaQiFgAp
         xrQSuYOOMLepV3Ba1StZHLYcKDpcAnvRHphfsco8OZ0zhp8eK0s/nsZok8VLSP/ugW7w
         UkoqE1q/kmBAikk3TDx738sjZbgOslrJtNHcpqv1EwgmrbutkyEPDJWxzfbvJ64Yolcn
         HvVqsqdodLqCrZAE2DGm4XmXbk5tH12KxnLGS8TlLkt0O1mxKBrL+XGdJm/rHcg6KVUq
         tzCQ==
X-Gm-Message-State: AOJu0YzDHVWIc6CAIxIbjZDthlzPSfIcgo224B8dVB1Brxl6xXgHwkBQ
	J2onGA0zMxgyiHb7rFn8VJIGkftd/nz1/4C74kd3UY+/JVuxWh558iq5xrMFTBhTuFa1bioBxDU
	z2IQ=
X-Gm-Gg: ASbGncuTCl1Y3fdmsXRWKv9t/RcyC/797HLRrYJoGkloxNPNwv4JOJsws/h1M75FFJI
	ov4YIt6sIQdOJOrs9Y5UQ2y9o8la5GC8WLTDHp7yL8dJXgJWJXdMqt0z2uULLVebOndLYGlGjhR
	Du/t48KnkMHM0QCcWe8sPwmVFopXXpPH4Wv393m+aw7SgW9ZIXW3U/QS/Zy7ZDSv90nK4KnWb0S
	dUHzMLhLfhprGLiFZi+s7LINInkPPhnNatN4td3NUNiUiWGpsD2Uc70ZgS4JDabqy6EoLTm+GHU
	I8wTXstupiUfrLATrNsDC/u7NQeyJj8lHGEt8oSde6TEGNWIadbumGLL7Ht0jqd12delqwX22dn
	yK6xi76vNj/fgCQdEV2I7oAkXIFUgEdsss0cNAEcWSXMZswQjksl7y5ya9xt21TdwF1U1y2rut3
	HMDYbFfMpMy9o0rPpc7NK0leAifhyFl25F+CgywXp+jYStrzPP/Hu1XCmY7G0Hnob+
X-Google-Smtp-Source: AGHT+IFwR8ZmuJ/y07Tp1TJmMESrpC1W6wK+FNKST+o20axNFjm84y3H/Zbw2E/LEqP9u/+/rZmi/A==
X-Received: by 2002:a17:907:7f0c:b0:b6d:3f38:2969 with SMTP id a640c23a62f3a-b733198f05bmr397997766b.18.1762961943172;
        Wed, 12 Nov 2025 07:39:03 -0800 (PST)
Message-ID: <8f814892-9f20-436a-907f-f25b294a9741@suse.com>
Date: Wed, 12 Nov 2025 16:39:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: there's no use for -mpreferred-stack-boundary= when
 assembling
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

This option is only relevant for C ones.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/Rules.mk
+++ b/xen/arch/x86/Rules.mk
@@ -7,4 +7,4 @@ else
 object_label_flags = '-D__OBJECT_LABEL__=$(subst /,$$,$(subst -,_,$@))'
 endif
 c_flags += $(object_label_flags) $(CFLAGS_stack_boundary)
-a_flags += $(object_label_flags) $(CFLAGS_stack_boundary)
+a_flags += $(object_label_flags)


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F255C52DD5
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 16:01:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160012.1488252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJCLU-0000w1-R5; Wed, 12 Nov 2025 15:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160012.1488252; Wed, 12 Nov 2025 15:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJCLU-0000t7-OK; Wed, 12 Nov 2025 15:01:16 +0000
Received: by outflank-mailman (input) for mailman id 1160012;
 Wed, 12 Nov 2025 15:01:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJCLT-0000sz-RK
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 15:01:15 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68159a8e-bfd8-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 16:01:03 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b72dad1b713so155595566b.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 07:01:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf312240sm1631753366b.18.2025.11.12.07.01.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 07:01:01 -0800 (PST)
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
X-Inumbo-ID: 68159a8e-bfd8-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762959662; x=1763564462; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lcaPRH865n6YAGwHTcQgRwG+65KxLjrfsA86bwzNm3E=;
        b=MmMlxDIEJJxsZAIwn1++sOG8U/3O9eE2lf3y8rxolcSuuJpHEz+1rz57wUcVoc73OT
         GQM5KM3r2QpknVxjt8oKHW9MGpTF+Bri+VwNrYRlnyWrKTjovfJ0YCfeLyzV8VuYo1mB
         dSDLyGf/J+687hPnidBeFND12pNUeas9A+UJgOzL2hzlsRwvsCoKyshrbFl9fMRG3sJg
         lR1QyswjeHbimziyEsVoZsqb/NuGtkRFnjlazMUc2lUNczdG+Qkiqq1+qQfHv37mS4js
         TCwvhHnwEGX+6ZG71tz5RWKCR9nH1JA8UvNCGguvd8+Ef9RPVFJVf0H7BacQnRU18GV/
         BkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762959662; x=1763564462;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lcaPRH865n6YAGwHTcQgRwG+65KxLjrfsA86bwzNm3E=;
        b=bWt1z+BD9/fgiAzqi7srBiEEyN3ZyhM8h9H5DkLtLg0F/r7fs8fiErzo4wjcHc8DBv
         yCX+VYoqjP/Xwm9NAUpze4h6hfSBSiV06sa4keYwZcRaVKIsC6ioIozvvzxEJ6daJV3y
         zSAmKUNuZuC4vtgG78Tn+FnptW8X/JT3ZOp8PRi9IvSxYzreCF8fubQoXvECAfgcujU/
         9PraxMpReHK2raoochxAwhhtvIErDSfPtLX6M88lebVLfAqrEe04GOQzu+Ne3mRhQ2yj
         5C+0dIpjToZ2wS7tq4esbiSr2txOuRy8t5raI0DpcTpt2JjQtVkrwFXJx53HBYSBTjxu
         dFuQ==
X-Gm-Message-State: AOJu0YzT/srblhN4i/wEbwm7RHnCdJvm2tMbPQZgooSbsU12dbd7L+7H
	sTekvXdWDgemA98qkHqWuT1ai4ZN14EWXvc1bBYyxmlbRBEQUzCtjU1j28BPRlUwrazsdUmx5/8
	pUJ8=
X-Gm-Gg: ASbGncvwXcMN1aX7HA1nApuqn/0ZHK1h0C6/v1waqR6DWzHOvUbS0zOD6GmSdGrCYC4
	3dF3SN6nlHOSJ5fD012WPFlhWkqJskLk2gmpecJk6Qd89pTYY7RfSULyHPA0QB8BdvM3Q+I2WBA
	852YMiX5TUEz71OkCalb73/BN5F/wGDYFoKy5VpGX1U3+6g0fgfbY58JCUjMmQ2+o8AOqIvo9Lv
	YTvP5qTlO6yhPsqhp7aaG/OvqBFLCl1x11/ck7aeP/Du0U7fG+EhPfv8iZHQyaPccQUNKHPl8SR
	6iyknpMPYbmM49IBlvgOoyix8AJjtRUmJD+zfNzKGy7B9dcR4Xg8Kmfeo06W734nE+u3t15D8KD
	0SdIHWUvM0qBkjMdTOQc1DJLocv60f19XNRTWWkZX1fbBRs9Xege19a5Z/SkDIW0Or3rui/TpAg
	kF/Jf+bDoJsR4v2giy1g3l4ByMnw3wp7N2YGkKy1Mg29I+Hz7582MRS5gP26tRwwQVsuHyi3TYe
	PI=
X-Google-Smtp-Source: AGHT+IFlETA1VKOaq8Ipa1G+1E6pA6c8HY80zxqJBNw3RggB/6c5oNFKedrzD8x5ltjiTtzGqwwAnw==
X-Received: by 2002:a17:907:3f23:b0:b72:b6ae:266 with SMTP id a640c23a62f3a-b7331970a45mr368430666b.10.1762959662132;
        Wed, 12 Nov 2025 07:01:02 -0800 (PST)
Message-ID: <14254365-bd77-4081-92c3-fcd0e649adae@suse.com>
Date: Wed, 12 Nov 2025 16:00:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul/test: extend cleaning of generated files
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

Many *.c files are symlinked while building, so along with generated *.h
files they ought to be removed. Conversely $(TARGET) doesn't need removing
twice.

Fixes: cb4fcf70b2f3 ("x86emul: parallelize SIMD test code building")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -261,7 +261,8 @@ $(TARGET): $(OBJS)
 .PHONY: clean
 clean:
 	rm -rf $(TARGET) *.o *~ core *.bin x86_emulate
-	rm -rf $(TARGET) $(addsuffix .h,$(TESTCASES)) $(addsuffix -opmask.h,$(OPMASK))
+	rm -rf $(addsuffix .h,$(TESTCASES)) $(addsuffix -opmask.h,$(OPMASK))
+	rm -rf $(addsuffix .c,$(filter-out blowfish,$(TESTCASES)))
 
 .PHONY: distclean
 distclean: clean


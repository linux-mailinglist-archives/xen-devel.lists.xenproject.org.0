Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CAEA91746
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 11:05:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957218.1350384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5LBk-0007EH-AF; Thu, 17 Apr 2025 09:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957218.1350384; Thu, 17 Apr 2025 09:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5LBk-0007CL-7X; Thu, 17 Apr 2025 09:05:40 +0000
Received: by outflank-mailman (input) for mailman id 957218;
 Thu, 17 Apr 2025 09:05:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5LBi-0007CF-RM
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 09:05:38 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 202defff-1b6b-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 11:05:36 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-39c1ef4ae3aso332441f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 02:05:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c33ef11b1sm28560545ad.18.2025.04.17.02.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 02:05:35 -0700 (PDT)
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
X-Inumbo-ID: 202defff-1b6b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744880736; x=1745485536; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVg8t35EEYXdG7kYWk57/4gfAAP0SCG109d6j9RCZMA=;
        b=GLC/qLRh+CNo2vknSqOaX2EMNsHgMUezoM0x1F1e+rm02sMSPWiED9+RsbPzaJOPzq
         7s1FtVJKTvmfZOVYNHhhwko6YrC8tybsCkT155Fiyj2SFroNEW5gMFMGtXo+x5GtAMiZ
         gnEd2IRicpJi7AvInQaQKqBV2vVU6RXRj8klfcySlxYzDKo3w/ZJozlHNTQRctQiB61I
         oVF4/O4udfuy1yAHl+BbqQUHYXrYeYvH1ls8MKyRBLVBgJ3T7pP2UMrUSmUQXRRpg+zc
         /nDbo3Gpvvs7+UccQBLkoc6q/yOS7KwUtxCJrrx3yzZM2JnYDlfz5HSUaC8nio9qT5oT
         3iOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744880736; x=1745485536;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vVg8t35EEYXdG7kYWk57/4gfAAP0SCG109d6j9RCZMA=;
        b=jlBt5OIBGAb+8PGxS5pKLYYRiRKqGmP5A2RhUJ9y7g8zxBw66IPA8QU4dTK2MC+wmV
         xV3QlomwLpOFbqggIjy+tyrsAvQH4vRIGRwed9dTwatsQ23r2Ts1pwEcTADK2Qd3+NfL
         Xv2uELn4T03ekeP6XGVoEi0g+FAnN4J89x8RzXO66bvONrBU/TaUifQBrpCQ/14bGSJo
         nvvi7Goyctt0finIKvCmyUkFFjoGY6GhTeDhex6QZ/B+zjRyBJzlDzGjcSlIOHMe0TVO
         Z7frdWLzQd5Nqu0CnGiyNVzXj9pQF+lndLk2vjF1J+CedMppyeAEX/SA6iSlZ/epa6OA
         nf2Q==
X-Gm-Message-State: AOJu0Yy53h69UJP6yrw2z1CKbXPlVxaczcghf7EU8LAhpvbrjR1FpUD9
	LzlTgScXYwWQrYsLQi3i2bvcJxAed9QRQvSWgahIuI6Ymtmo+c2ZYPNvgAF9cFPoNatVKCEuDZI
	=
X-Gm-Gg: ASbGnctJK9cZG5yZE8OvIkVU8tfZEVJmIbeqV8DcmbosPu9fZufczb126Nu3O6uM2wP
	Vj9Br8dSFQ+sAimdcssBzbljSZ+iWwRMbexZMbGdZlBliiogkzf/LpLXHFs4sX2hDcCIIu7RbVW
	9gfzyMNMnu20wKsmFAkw9eclrUYKy2hshgw8I4F3S1wUaTMpdZXw9BvTpfs1f1VAsoA5bAFEKw/
	x3+JgX20gysGOoEnvhXj0obB5ca3kp9SICapHEoWoN2kaMcOWKxIZrMOKUst8mpJDNwqB1u7r6R
	pf39xSPnmQOaURRcnlpeE7iKKy4oL03Ye9z+GzEWvc05NN+3alRJwD7syPFfJNrESdFLnHXRSvA
	qBmrUyh5FssUspWRQLMqjYOMhJA==
X-Google-Smtp-Source: AGHT+IH8ONr26mp+2aHjXXvJrHK3SWk2PM8XM0AFiA7DxcX8WL6Bmsu928z2gpen0CcjJPi8OQkJoQ==
X-Received: by 2002:a05:6000:1849:b0:39c:1efb:f7c4 with SMTP id ffacd0b85a97d-39eea30ba47mr1550238f8f.25.1744880736165;
        Thu, 17 Apr 2025 02:05:36 -0700 (PDT)
Message-ID: <ebf8e47a-8cad-4ee6-9bea-61c8201364de@suse.com>
Date: Thu, 17 Apr 2025 11:05:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Fabian Specht <f.specht@tum.de>, Manuel Andreas <manuel.andreas@tum.de>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: also clip repetition count for STOS
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

Like MOVS, INS, and OUTS, STOS also has a special purpose hook, where
the hook function may legitimately have the same expectation as to the
request not straddling address space start/end.

Fixes: 5dfe4aa4eeb6 ("x86_emulate: Do not request emulation of REP instructions beyond the")
Reported-by: Fabian Specht <f.specht@tum.de>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -2221,7 +2221,7 @@ x86_emulate(
 
         dst.bytes = src.bytes;
         dst.mem.seg = x86_seg_es;
-        dst.mem.off = truncate_ea(_regs.r(di));
+        dst.mem.off = truncate_ea_and_reps(_regs.r(di), nr_reps, dst.bytes);
         if ( (nr_reps == 1) || !ops->rep_stos ||
              ((rc = ops->rep_stos(&src.val,
                                   dst.mem.seg, dst.mem.off, dst.bytes,


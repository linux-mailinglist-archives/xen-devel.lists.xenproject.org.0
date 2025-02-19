Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D623A3BB04
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 11:01:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892562.1301526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkgtM-0007ku-Bt; Wed, 19 Feb 2025 10:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892562.1301526; Wed, 19 Feb 2025 10:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkgtM-0007jS-8b; Wed, 19 Feb 2025 10:01:20 +0000
Received: by outflank-mailman (input) for mailman id 892562;
 Wed, 19 Feb 2025 10:01:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkgtL-0007W7-9M
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 10:01:19 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7624daa9-eea8-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 11:01:17 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5e0939c6456so492791a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 02:01:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb94329614sm621543166b.180.2025.02.19.02.01.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 02:01:16 -0800 (PST)
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
X-Inumbo-ID: 7624daa9-eea8-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739959277; x=1740564077; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yyClBG9zxex79n1kYGadDtuH3MJRoTans7HwlEjL4Qc=;
        b=CgmczSZ0q2SrRa4Hb7KeTa/r1NbGB5U2Kt0x2ThXxQXykQUnztYIJ3n14raQfh3gPH
         mTYc2O1O2SxcSVqJA5ORtRSRdi1j/XSH1Pa3wZqEZhBzv/1RTPCSQFwwdHPN0cSkzwB9
         L95Dfhs50Yn80XLkrMCc2bvE/EYvwbzDTeZLMd4QSJeP1P0mcKJHyz3EIaHECzuFN7M3
         zCmg6k8B1u/DPAMZxaQWqmvzmINReDCWP3y8I7QL06x7Vj6sKfVAwqPWmfZZWFqrHflc
         gOQ9YB9C6T0sYAGsRzUnfNhDRsuJGL3iyINhn60PS3CiZJ55hLzkQB8q7OK/Hop+ZoCT
         m0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739959277; x=1740564077;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yyClBG9zxex79n1kYGadDtuH3MJRoTans7HwlEjL4Qc=;
        b=DTSc/0aTi6glZgSeBSt8HpfMFrodnoDPOxdZ5xCjpG+DVvQq/bG3DVKCSCZKnvDTEg
         +p4eBsXZd+t0Ow7fpOoll0Nx18FQJCYzDa9fpt+TCmTOXcOYn8bSPrT11HsN1oFWal/K
         5lO5k/mMQ1ITKdhWEDdsWpukMw83gsCF56fHicU6gl2SsjoIXNYkKArPMskvxmRrD112
         c83MWYi/4G8OEcM/uBLqpgoefHD9CXyPiUiIvjiO3QHPEMvoPjCh4GrCzC7Km63cNlG+
         MrL1nQ7/R5nIZHlSaNcQy10WajArj8oKBOplesDxK4Pk9jiU8tcb+YQMr0y/kjZSry42
         IgFg==
X-Gm-Message-State: AOJu0Yy8eG8plr7VOWDAPqFXrNRx36I9KbB701QvUzWHnTpz1XrQYcOC
	HePkV5re4c7BYEYmzSJP0WwpMAPSKVOQUYLlJ5H4gpk3LGBUkXrY8rx9CTMWYWGiaFz7gxdo0aY
	=
X-Gm-Gg: ASbGncsFdYaCeCsQx2F3uMoQ5Y7R3jJGQATFJBO3eCEUdHxS36RFXLHJs4RdJ3Mj9r4
	eiQQnmaVp499dqXwDbJNqTNScAsLR5f9HOGFnzKrnZYKeB3BsWuTPHbqpomJ4mI0bxjKttk5fci
	paYytqp8KWoYL6UFLJqjprIw+8HX7OHSKZdOV7n1ps/kYLk2Pe7DTKjLK8zkHxIIkCz5Ey2iDNs
	Jq+guEQ4RWJ6NEN+Sno5JO6TdX8SFk1ph8AE5FNEnR2ldOh80AzVmzHAhqLeBlUq0H4tloVuiFe
	18EcbrowmeVqoKn38yAO1ggF5SESeZm5+aAF2eceeSLutbOSrI7vjR4XwcUMHuRoeTkkTEsDx5U
	M
X-Google-Smtp-Source: AGHT+IHq8TB8I/quCGV+CCtQemyk1zRtb5GI0YrG/ooLoyUx/BSvJ83nXOoYq7e8UElEMM4kLnmn4A==
X-Received: by 2002:a17:907:7b83:b0:ab7:eda3:3612 with SMTP id a640c23a62f3a-abb70de2909mr1922159866b.50.1739959277129;
        Wed, 19 Feb 2025 02:01:17 -0800 (PST)
Message-ID: <01d5464f-81c3-4b5d-92b6-08d9e22201ef@suse.com>
Date: Wed, 19 Feb 2025 11:01:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/MCE-telem: drop unnecessary per-CPU field
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

struct mc_telem_cpu_ctl's processing field is used solely in
mctelem_process_deferred(), where the local variable can as well be used
directly when retrieving the head of the list to process. This then also
eliminates the field holding a dangling pointer once the processing of
the list finished, in particular when the entry is handed to
mctelem_dismiss().

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mcheck/mctelem.c
+++ b/xen/arch/x86/cpu/mcheck/mctelem.c
@@ -122,7 +122,6 @@ struct mc_telem_cpu_ctl {
 	 * to guarantee the above mutual exclusivity.
 	 */
 	struct mctelem_ent *pending, *lmce_pending;
-	struct mctelem_ent *processing;
 };
 static DEFINE_PER_CPU(struct mc_telem_cpu_ctl, mctctl);
 
@@ -233,9 +232,7 @@ void mctelem_process_deferred(unsigned i
 	 * handled by another round of MCE softirq.
 	 */
 	mctelem_xchg_head(lmce ? &ctl->lmce_pending : &ctl->pending,
-			  &this_cpu(mctctl.processing), NULL);
-
-	head = this_cpu(mctctl.processing);
+			  &head, NULL);
 
 	/*
 	 * Then, fix up the list to include prev pointers, to make


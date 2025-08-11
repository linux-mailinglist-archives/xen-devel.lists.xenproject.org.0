Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F14FB20983
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 15:02:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077580.1438626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulS9z-0003LK-UN; Mon, 11 Aug 2025 13:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077580.1438626; Mon, 11 Aug 2025 13:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulS9z-0003IM-R6; Mon, 11 Aug 2025 13:01:55 +0000
Received: by outflank-mailman (input) for mailman id 1077580;
 Mon, 11 Aug 2025 13:01:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ku41=2X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulS9y-0003Gh-H4
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 13:01:54 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 544afa90-76b3-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 15:01:43 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-61571192ba5so6834385a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 06:01:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a86758fcsm18332979a12.0.2025.08.11.06.01.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 06:01:42 -0700 (PDT)
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
X-Inumbo-ID: 544afa90-76b3-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754917303; x=1755522103; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/ElbyNMZW5/7VaCj4lt7JPKoAcnq+O1zUIsSfH05Rg=;
        b=PxxvZH4wZu6sE8PyzAErq+ct8guCzeXUWPGkZgWk/PkLBw2sxcohwr5nWigPS8M5Q0
         1qarcIFBfokCK5rX/hTR2tIbAXurdgxxCp01zxx3PUwUZAFdj9OnySyK9ONPd8KUmzs9
         cPS+hP7PJmlalVU1jcnF3tDi4Lu50PadcGz6dtYwzLNtqCzwA5tcf8rCTB49Xxzgh6gw
         zGwkINMB70MdCShDf25T5hlmYbsCJR8EoikZDHm3j9n9s6xfTv/j2SvAF/zxDyXVUSHh
         /RT9hA7pguhUeVBF+0MCvttw4aG0HCwzSONbDbURginP0NuDW2fD7MjMJsORjTi8xSbA
         K5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754917303; x=1755522103;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L/ElbyNMZW5/7VaCj4lt7JPKoAcnq+O1zUIsSfH05Rg=;
        b=RKKNC2zcEEesDlKnCPxRliMOPJKFcL5fe5mpAZcUxBJOqWAOs4MY1waFagpWouWF/2
         0XzHSbcJHHtc2ZrdohGwQXZ9wHzXSRUeFr/8kkEwt1inZVCWOlOy+IxAVi3BTLzEobxL
         yv6voj/U1B0o37wPI4SIWnDpkg6E7/Bg8YuPxHTY0z6etvZp+byo31CXB+nFbumdi8QA
         Hw8cTctDRWJYLIz0Tnst4vF1doycrqtebbGtG7jg0LmZl4kVb8oClQ0RdhqZG9YC+Nau
         7cBQN0Ali8P66SGgWLaNaz/3pTXjPRJnbPInhMdC0e6fA3LWlUlmBaGf7XZsOyFcYM46
         sesA==
X-Gm-Message-State: AOJu0Yz8QQO6qSvOZulc6w1UKxviO3IVwFLutnjv8TIDHODY28QfH+gy
	YzmuD/EFoa/WdSNa4SG3h4Gn7lR2dvjDjRXKp13xa7h7kBbodvl59zb3ji7/hai2lvUyfKQ7gei
	8YCE=
X-Gm-Gg: ASbGncvlFgSkPYWyjvdXmHobomksg9whGaY57lfvj4hTTVfpJGDUHeQEAVzASldNQpN
	EIMjSRboAEvydfPNafKCbODwMABy96ic5e5CYRY3Gyed/IsX282U1KNe7jcfPFanjW4uJ2r0uXJ
	VvdPCN7JKhW3syAd/BPmYSQtn7xZuWwVOU6m3nfhZ2A7dy5/dQMPUIuI9dP6KI009kANtoIfORj
	2oUxFTXlIBSukcE4/AFgDpHcOe57rnSwzx+HmD9zAI5lcSt2g+Z8BS8ZFFEWRbVZrEIS61c5vWI
	5i6zIYcq44fURKpO3PZpSDZ6ktgr7wr4X04z69C/8kA2pDGI24w8i8K+TYEOpeDsqqkHiqsfNhg
	5lbpERjX2mU+5wB4z+pBcpo+ZZKryxGpXva9AyVUh8jRL5LzDKbR7F6JVjayjC2LVGkgCCVW0Fd
	h5l3FqSQjTlK30taYFaw==
X-Google-Smtp-Source: AGHT+IEDRBLp+aoagzcLD9pSmG5HEcTm5YYLMmhkgti8Ri2YhqayFK/NyJniUw0HQo6xvmkupB3yOg==
X-Received: by 2002:a05:6402:5193:b0:618:d6b:8d9e with SMTP id 4fb4d7f45d1cf-6180d6b904emr6578381a12.32.1754917302657;
        Mon, 11 Aug 2025 06:01:42 -0700 (PDT)
Message-ID: <804094ae-bb76-4165-9e07-46b775b4b46e@suse.com>
Date: Mon, 11 Aug 2025 15:01:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm: drop assertion from page_is_ram_type()
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

Its uses in offline_page() and query_page_offline() make it reachable on
Arm, as long as XEN_SYSCTL_page_offline_op doesn't have any Arm-specific
code added. It being reachable was even mentioned in the commit
introducing it, claiming it "clearly shouldn't be called on ARM just
yet".

Fixes: 214c4cd94a80 ("xen: arm: stub page_is_ram_type")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -66,7 +66,6 @@ int steal_page(
 
 int page_is_ram_type(unsigned long mfn, unsigned long mem_type)
 {
-    ASSERT_UNREACHABLE();
     return 0;
 }
 


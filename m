Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE26A7DC3D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 13:28:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939722.1339713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1keK-0003ZP-FA; Mon, 07 Apr 2025 11:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939722.1339713; Mon, 07 Apr 2025 11:28:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1keK-0003XV-CB; Mon, 07 Apr 2025 11:28:20 +0000
Received: by outflank-mailman (input) for mailman id 939722;
 Mon, 07 Apr 2025 11:28:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u1keJ-0003XN-Am
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 11:28:19 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 667541ee-13a3-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 13:28:17 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43d0782d787so29131175e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 04:28:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c30226ecdsm12274194f8f.99.2025.04.07.04.28.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 04:28:16 -0700 (PDT)
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
X-Inumbo-ID: 667541ee-13a3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744025296; x=1744630096; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zJMnaTe7KA8HRPsBczfCVAMH2wJrxOTuP8r+JNshAs=;
        b=X1uwf/46wPIeeHqQlTx08d7SLpWKiAN+TpnnQjxpxf4gh2YuRorJI+SSlQ+Itk3K/p
         5MIDbnnL/XkRDHegawvgTiw59tGDUXKDPabIYAUmcW48pTE4xNTRj4afaP4M5j3+AzOT
         yt5ipSHrwCg0mD5QxY/7DZ7lgg57D3rjwq9oAZEbqsVmK4MqkLQ/l+lzfHfD/0c7zuNe
         HWgCew0JrSJ0JNMT4s90NIW24fHJJzpC/n7XE1IuAZMjABBpLCRjYxsM6jCqukLjAKl/
         yQZ7bOugxuq2MrVBiDGux6gst46BwmxrCMpVDGbH2Z45mRnxezLmVXCZW/eJ8MWEXYzm
         77EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744025296; x=1744630096;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5zJMnaTe7KA8HRPsBczfCVAMH2wJrxOTuP8r+JNshAs=;
        b=VI/LxgGZYj0MI7oFbv73MRUvPP+xu6SE0SCZx+ZvQPaAmuQuFFXJByWEUtF+F0dC15
         YbawxNTQZlmBMWcQmTnoPB9YolAY73uhex4c6vEohX3QUc/BE/LlyLR+Ml0wAkbIL8Ik
         rVf2jzygMJ4sKSA3+LOBFNAFxV9c3DCuh8DQMkf15/g3aPnht7VgmCxS4QnlFlAcp2Zy
         EA6N25xM008fw8RDJNK/Ec2z5jX+mvVaHCUMpOVjk4u9rljnpbIuwqyAbDOOpHUcEpSU
         Nj4gFoDxjIQg2UmOrxGBH9WuyMnBhDxcnWWT/jZkGzwDqRyAlDTbKfNJMnMWY8JUgMp2
         +ynw==
X-Gm-Message-State: AOJu0YyeQ6Y+jIJJFpPfgJInyAyixNomobT2efD/SGU3XtUXML+Y3xke
	USV91Ut1Fdn3BbDjfvozjlG18qdgKArO8FBVqg8W+18NdWfg6eMVUDc8tEt4fDXi7jmCu+iC9yk
	=
X-Gm-Gg: ASbGncva86Xz8z43RhmBiLDR06Ui1UlR9tyyz59OP/uYu58zBbwOT8o3vZdCTuQbXIc
	yZyZz46n18HzdPbgMVDQUO+nliq07qP4/I4v5DOCnLUXtuzvEvmi+MckHUH0zNQQ0Wl5tXOm+ne
	EEg2kfBx8dQRpsiWGapJK8o2rB6vDP/RBtPoLtK5NY2g6/fuH80nRRtDjAhhd1Ph911tfczBBck
	Dj4BB54YCQgJnkK02oApRL6z69w4X7UAQmYq5oZqxPUjtC408Gdr7/Nw/L3SbjyTGhUPiZHU1gZ
	EHx8QYjsT24J+oKuPhKupUoD/OQWzYMoHguBVS50ZRdSVsDhtwkx8pq5bLyKzP2hqG52cNIN1XS
	g3yelhgs4Cjt3a9MAOxvla18zo8u4mCvM0Fr+niSB
X-Google-Smtp-Source: AGHT+IGaANFiZGM91BR7xvByJYm6s4E+ZdTKbSODbjHtv9l3bmDj0JthQfamXYuAy71s4EVqLH/Dcg==
X-Received: by 2002:a05:600c:3484:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-43ed0b80b30mr118536185e9.2.1744025296346;
        Mon, 07 Apr 2025 04:28:16 -0700 (PDT)
Message-ID: <55d1c198-79a8-4011-93b0-b36580e23c24@suse.com>
Date: Mon, 7 Apr 2025 13:28:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/MTRR: make hold_mtrr_updates_on_aps static and bool
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

It's not used outside of the CU defining it, and it is clearly of
boolean nature.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mtrr/main.c
+++ b/xen/arch/x86/cpu/mtrr/main.c
@@ -118,7 +118,7 @@ struct set_mtrr_data {
  * After all the cpus have came up, then mtrr_aps_sync_end() synchronizes all 
  * the cpus and updates mtrrs on all of them. Then this flag is turned off.
  */
-int hold_mtrr_updates_on_aps;
+static bool hold_mtrr_updates_on_aps;
 
 static void cf_check ipi_handler(void *info)
 /*  [SUMMARY] Synchronisation handler. Executed by "other" CPUs.
@@ -600,14 +600,14 @@ void mtrr_save_state(void)
 
 void mtrr_aps_sync_begin(void)
 {
-	hold_mtrr_updates_on_aps = 1;
+	hold_mtrr_updates_on_aps = true;
 }
 
 void mtrr_aps_sync_end(void)
 {
 	if (mtrr_if)
 		set_mtrr(~0U, 0, 0, 0);
-	hold_mtrr_updates_on_aps = 0;
+	hold_mtrr_updates_on_aps = false;
 }
 
 void asmlinkage mtrr_bp_restore(void)
--- a/xen/arch/x86/include/asm/mtrr.h
+++ b/xen/arch/x86/include/asm/mtrr.h
@@ -63,7 +63,6 @@ extern uint32_t get_pat_flags(struct vcp
                               paddr_t gpaddr, paddr_t spaddr,
                               uint8_t gmtrr_mtype);
 extern uint8_t pat_type_2_pte_flags(uint8_t pat_type);
-extern int hold_mtrr_updates_on_aps;
 extern void mtrr_aps_sync_begin(void);
 extern void mtrr_aps_sync_end(void);
 


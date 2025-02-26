Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 835FFA45DC1
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 12:52:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896446.1305156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnFy5-00075I-LS; Wed, 26 Feb 2025 11:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896446.1305156; Wed, 26 Feb 2025 11:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnFy5-000727-IN; Wed, 26 Feb 2025 11:52:49 +0000
Received: by outflank-mailman (input) for mailman id 896446;
 Wed, 26 Feb 2025 11:52:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnFy3-0006xM-FB
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 11:52:47 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3206f476-f438-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 12:52:46 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43995b907cfso42149855e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 03:52:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba58717esm18582625e9.33.2025.02.26.03.52.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 03:52:45 -0800 (PST)
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
X-Inumbo-ID: 3206f476-f438-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740570766; x=1741175566; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B5K3ghHFEUKY+Sz/+pAKS3KKwzSv5cNIOym7K1d3bOs=;
        b=VRZArgkDJEKoSgJBzRlDSTsPOxf44Bu4WLFfn/CCBw01KUtfictj5gmXK6BkWTRpzs
         UPW+ltGgwbyW6Vzi4VdEQXAqYG2mGg6dVEmGqN7P/YrgyzokUHuiVRKbfShlsNddcDNT
         7r0M+HWC13m6QYg2mWUleB2CwdBcz4S3m+WJj0ACZRXP5fKJF89YH6tBQCSSqprqCRmG
         5JX775t5jqd4OQI5/n3s5ZbNrOIUMxFs8w07lNPqlQbe892qJxlqa4yqsaFN+a9Y9jcR
         LynAn3u9YAQTF5cJ/CRwTAL5PWcPzNl+xqlII2Ey2ZBoby/lNE99KrLSa6mYTzay83oQ
         rojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740570766; x=1741175566;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5K3ghHFEUKY+Sz/+pAKS3KKwzSv5cNIOym7K1d3bOs=;
        b=pXFg+403KFDwwtKe04Kb2IijJsIgI9iYMnswztdY4DGM576UPZz8ssVrxVWGhMn7rj
         bp2G3rh9P6wQt/I+ItNdp2STSLQyD9b8p7hhMhIyMYPUjUNUhPcs3DaF0YiK5pU9py1O
         3DAtPF481QHZo8qxvkZFke1TX9H+1fEwYeAfpwfb9TlyFAwJtaP8MuhwmkQsygWTtQXx
         v6PddB/Yty8l4J2tKUujJUuKizBqDOG6bR8S2g98Ylte2LJicl+uvBNMsyl8Q7RvQAS0
         QOvPIa040xPNtlhbL5Ibfx1a3VyjPuqex0WFA8xC/xMGWaw7ZJcH7nGZfYABlbuwLKH2
         Z7rw==
X-Gm-Message-State: AOJu0Yzd/bq1rYVlCwgcHYJQsowA/ntxUqmafldb9AzO4D+5rMZtPI8Q
	uaZJqWNUyZVRVl17JLLU6+WpPT/Uu7HRVUgKIgudyyDLrdHtCkA1XPwGPo1dt4rThwkWg6ziN2U
	=
X-Gm-Gg: ASbGnctaOLA3csd+n/VDOC/I5s+aNrCpjIvKa236tZ4odh3DaUvawj0NhM/LlgpFv84
	nvL3cnDqB2C7BOixv3wPxezoGeUuv5wAf3jJyTqpOtrh7Tjw6VX5pWH+bDURScCWWH6R110Azx3
	FtdRvn+smfhOLDJ4WM7Kdvs/j/XTFEM8lMgWo1iYLC5oGgV+D5Hcxb148ZD4pKGVwjzjkikwdVo
	gp7M2bAbf3ajgerSFdeV1b5wI1GfwBEkrmd3630mZEfe7EyFNeW3L4LJ6b+EKKUJRa/OtvlUXhu
	QybIudN6iGFIU2KewQSVcqIEnsxnU0avkNK+66All3jqm81DdRwjNtdfG/bGTxU55S7xW+rv293
	YHzelCT96PIQ=
X-Google-Smtp-Source: AGHT+IFTuewJz5fhC4vpqLMOtQdq/QdU6EVL5Gara2b45wJ1k4losOmf7IZxfAqfCyOdRM6qO9nlFA==
X-Received: by 2002:adf:ffc8:0:b0:38f:4d91:c123 with SMTP id ffacd0b85a97d-390cc60cf53mr4504063f8f.32.1740570766214;
        Wed, 26 Feb 2025 03:52:46 -0800 (PST)
Message-ID: <b9f829c3-dc7d-4023-b58a-49527742a5f0@suse.com>
Date: Wed, 26 Feb 2025 12:52:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/3] x86/P2M: correct old entry checking in p2m_remove_entry()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <7363b2ee-f297-4b0b-9c4d-bdebe08d514b@suse.com>
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
In-Reply-To: <7363b2ee-f297-4b0b-9c4d-bdebe08d514b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Using p2m_is_valid() isn't quite right here. It expanding to RAM+MMIO,
the subsequent p2m_mmio_direct check effectively reduces its use to
RAM+MMIO_DM. Yet MMIO_DM entries, which are never marked present in the
page tables, won't pass the mfn_valid() check. It is, however, quite
plausible (and supported by the rest of the function) to permit
"removing" hole entries, i.e. in particular to convert MMIO_DM to
INVALID. Which leaves the original check to be against RAM (plus MFN
validity), while HOLE then instead wants INVALID_MFN to be passed in.

Further more grant and foreign entries (together with RAM becoming
ANY_RAM) as well as BROKEN want the MFN checking, too.

All other types (i.e. MMIO_DIRECT and POD) want rejecting here rather
than skipping, for needing handling / accounting elsewhere.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Paging/sharing types likely need further customization here. Paths
leading here differ in their handling (e.g. guest_remove_page() special-
casing paging types vs XENMEM_remove_from_physmap not doing so), so it's
not even clear what the intentions are for those types.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -531,9 +531,9 @@ p2m_remove_entry(struct p2m_domain *p2m,
         mfn_t mfn_return = p2m->get_entry(p2m, gfn_add(gfn, i), &t, &a, 0,
                                           &cur_order, NULL);
 
-        if ( p2m_is_valid(t) &&
-             (!mfn_valid(mfn) || t == p2m_mmio_direct ||
-              !mfn_eq(mfn_add(mfn, i), mfn_return)) )
+        if ( p2m_is_any_ram(t) || p2m_is_broken(t)
+             ? !mfn_valid(mfn) || !mfn_eq(mfn_add(mfn, i), mfn_return)
+             : !p2m_is_hole(t) || !mfn_eq(mfn, INVALID_MFN) )
             return -EILSEQ;
 
         i += (1UL << cur_order) -



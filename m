Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC1E867C3F
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 17:42:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685637.1066663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ree3L-0006gr-Fx; Mon, 26 Feb 2024 16:42:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685637.1066663; Mon, 26 Feb 2024 16:42:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ree3L-0006ek-CK; Mon, 26 Feb 2024 16:42:07 +0000
Received: by outflank-mailman (input) for mailman id 685637;
 Mon, 26 Feb 2024 16:42:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ree3J-0006ea-GP
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 16:42:05 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8c9f634-d4c5-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 17:42:04 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-563c595f968so4333920a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 08:42:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d18-20020a056402401200b005640022af58sm2509237eda.83.2024.02.26.08.42.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 08:42:03 -0800 (PST)
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
X-Inumbo-ID: f8c9f634-d4c5-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708965724; x=1709570524; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6L5GGffCzRNgfzqvhyjL4MWez5VsJpAVC5R921GjUEE=;
        b=VVRBB1ynWbQeqlOy1mDrFYTUkp3QbwS2QrBa/75swhRLf5d5E78PYQXk8ZPiisxfcp
         UuGSLMK696rfC32SBH7FbGEQ8msGXU3WUed4s5/L1JmKhHnTZgDStqWnIvCXe/iH1vEG
         RGZl9sifExS5Mbh5JjHy0F0fIxrHahh0qbUpMbfhnUy4lAsDhEqtCThJVdxl3BeUEFD4
         u5W54zxWGn2mnRZEI7dSEY80dhfC32UgLW7VE7VfrgytZyw+Om7JU3EphngrjnUIBYnY
         iaoguAcIY06MeoLLatgAr1N3ecTvthkNf9ylDDN9DOWw4hHNmnEkeZGhh1E8Q5kUqe07
         aVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708965724; x=1709570524;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6L5GGffCzRNgfzqvhyjL4MWez5VsJpAVC5R921GjUEE=;
        b=qfiaO91j6/bERuGWoPDanph0UmDguDTQQowU4thqntOR7o3671QGnKq3BEx+ea+UeJ
         c0/tmZdY91+BvVuWCoistE+sn2uHe2qSTYX7ez//WuYmYTfBPwP2rJZFSPDCyx3fennM
         oqSJIl3MDuEHc+GdfDOTPSCcc8kGLBqpKa9Z5HnDMvOjWiw/XgUd2rwM9gHN/bQRQGFp
         F6SWpAW6bmpx3OXZt7a+G1RAH8L7zi9TNEGfROzhzlxJB922W86mcudV6d+JtiNACJi6
         mLAyV/4/w4M6yPKegKf4ofUzvMK8X66aNyPNHlaXqWI9N6urgdqNqA0RMlxGX6CaQRjV
         mULA==
X-Gm-Message-State: AOJu0Yz4XfqJDoxkyVVUeDvdNHEfGoe0rBTRlViLvtBb0EgNxKhPoAn+
	Jvod4cvdbDErMGBRvPEpvHQTL8OjywLYR0LkHkLgnj8wcFuetNM+yL+NbPtIpASgWviMFo+POQ4
	=
X-Google-Smtp-Source: AGHT+IFObpng2g0iR1LdcIGU+8vI61RJHJXBCIcZv6BTvuxx+tYrdIce4ZzeYalYq38YVjeDbHqyEA==
X-Received: by 2002:aa7:cb13:0:b0:566:2a1c:9c0f with SMTP id s19-20020aa7cb13000000b005662a1c9c0fmr187597edt.16.1708965723871;
        Mon, 26 Feb 2024 08:42:03 -0800 (PST)
Message-ID: <21e6cbec-dc29-452f-b6a2-6926245a8beb@suse.com>
Date: Mon, 26 Feb 2024 17:42:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 01/12] VMX: don't run with CR4.VMXE set when VMX could not
 be enabled
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <293e5aef-8843-461c-bc96-709a605b2680@suse.com>
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
In-Reply-To: <293e5aef-8843-461c-bc96-709a605b2680@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

While generally benign, doing so is still at best misleading.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Using set_in_cr4() seems favorable over updating mmu_cr4_features
despite the resulting redundant CR4 update. But I certainly could be
talked into going the alternative route.
---
v2: Actually clear CR4.VMXE for the BSP on the error path.

--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2961,14 +2961,18 @@ static bool __init has_if_pschange_mc(vo
 
 const struct hvm_function_table * __init start_vmx(void)
 {
-    set_in_cr4(X86_CR4_VMXE);
+    write_cr4(read_cr4() | X86_CR4_VMXE);
 
     if ( vmx_vmcs_init() )
     {
+        write_cr4(read_cr4() & ~X86_CR4_VMXE);
         printk("VMX: failed to initialise.\n");
         return NULL;
     }
 
+    /* Arrange for APs to have CR4.VMXE set early on. */
+    set_in_cr4(X86_CR4_VMXE);
+
     vmx_function_table.singlestep_supported = cpu_has_monitor_trap_flag;
 
     if ( cpu_has_vmx_dt_exiting )



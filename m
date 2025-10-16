Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15755BE1F15
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 09:36:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144233.1477702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9IWx-0002di-NY; Thu, 16 Oct 2025 07:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144233.1477702; Thu, 16 Oct 2025 07:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9IWx-0002b3-Fr; Thu, 16 Oct 2025 07:36:11 +0000
Received: by outflank-mailman (input) for mailman id 1144233;
 Thu, 16 Oct 2025 07:36:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CbFY=4Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9IUE-0006T6-ER
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 07:33:22 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63b400eb-aa62-11f0-980a-7dc792cee155;
 Thu, 16 Oct 2025 09:33:20 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-46e5980471eso3091175e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 00:33:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711443e7a1sm10273965e9.9.2025.10.16.00.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 00:33:19 -0700 (PDT)
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
X-Inumbo-ID: 63b400eb-aa62-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760600000; x=1761204800; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DyPWaqTpFS+PT2iQyoC17l4zqE2wp5XM9kX62K6X0fU=;
        b=GpPmzteL5jJf0LsG2sux4jxZw6Wuw2H5aqM0shGa4MYZnlHaFgRhz7/SVZ5NqhUQjq
         2keJ6qQ2TKLCHeZlMDzTNM/1qdtXrziJxRcYoU0y7Vm1jUYjPNoYVKRTxU9YWpZFvLXk
         V2s+JfkcjYsF1KbJq1UzUWQHqugUAZ1DLacpttHg6PHWXE1zaEoL17xv2vjhkVHgxId6
         oedG6XpD38Z5mvFxt+oGyGYWYiQM58B3XFKeIvSQfZpUhnisADcevLh6vvMvOwsLdIao
         QWx00Fh6M8Yn3TqwgRqCupQH42Yy9XYVJ4JiTuDt99MmQVN6S5A75xhSoQqaBsvy3pGz
         6vKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760600000; x=1761204800;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DyPWaqTpFS+PT2iQyoC17l4zqE2wp5XM9kX62K6X0fU=;
        b=em6jqTQOCSMPDftRzTX4t1zgtbdSVUaf+LFrDao39htwUfIN9edVvWJP3ce1c30k8H
         ukQyfR5NFNoyMwwe+NUp1VlAEtzBeJqfjNwUyGSy3AxTO2nG28wR92OQ/OXr0wCgzlE0
         lBm+10nhfFyM20I7NwUQa5O1cuHI92D/Ajl/FKj3HG9oAgw1kK+66s4aPIbUM+NqyS0x
         W6VeM9Iy4bdZ0+oyNN6N/SSr3q0Op47DiJvPsYgGF6CRa7C0/hvjeMJcwPppDX+cGtCs
         9fLzC7uoSq2ch3pSR0pQlevoEc+HCoRhv36vsBgW1stgq3aa4x0V1aNs4Gelp/jRTrX5
         WOPA==
X-Gm-Message-State: AOJu0YwSd90Wrv12yVRC397iBLPTSzDYVDKBJOlXNmXEe8LAvMknhnFe
	Ugfl+iLP+/AJwoYTvBvTif4ZxPB5tVPTVRD1tDglWT1a28uRBuu5zYM7lyCoxySZ+jGJuov89rM
	ZDfs=
X-Gm-Gg: ASbGncvFjPlLPOQKHL7kiyLZ18SVaY6cc9H3F5s8Gb9vIrpe9oo5wJ/1tMI+TgG0dz3
	2fdXnOziSxbW6dflL84915/xXxcBd9LKkyAijfH3QzRh/9uo5QTJAwoppIY3+uLY+4wd00oksbk
	MxrYa4A5ptDHcgjFuG2/hDHqTViHbJvANmYwciGKpDQ6UU994fHfNtQLYM+s//NCipXaP1PUKW1
	VwNxweUWU2hsJB/Kuq8QvCvtGCr5Bu4nRGCejA1rgriHSARNPEjQMy3GE4ofmcMCohP1EbjoJHS
	70kPcDlwZSW3f0cY6FDB5AXcc9Ss4QTBLLFinG0O6CFG2+uuGYte5W4QVYngFauJ45NLT67ZxdZ
	0poHr86yNsTSOGYA03+kxxjJyH6djTime4G+cJWMSQKS56RRvOSHxuDWeaVuQidoO869XUUWMFZ
	l8/we/z0dMc+Rv0UtIgDB3Vq2oBJxhWJ34Bsbgp4CH7a/CzffwvAkYF7y+c/lIG1NUNa8F6TU=
X-Google-Smtp-Source: AGHT+IGCtFNKhxO/bhZnIHIW7ocS/VJleQZIqqdE+mZVDKih7CdU2VGscyOM6b9O7Ht1vSPnVx53PA==
X-Received: by 2002:a05:600c:1e87:b0:46e:345d:dfde with SMTP id 5b1f17b1804b1-46fa9a9f051mr212045395e9.16.1760600000026;
        Thu, 16 Oct 2025 00:33:20 -0700 (PDT)
Message-ID: <870dc766-5f29-4837-999f-93fe094ed857@suse.com>
Date: Thu, 16 Oct 2025 09:33:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 06/10] x86/HPET: make another channel flags update atomic
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
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
In-Reply-To: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Unlike the setting of HPET_EVT_LEGACY in hpet_broadcast_init(), the
setting of HPET_EVT_DISABLE in hpet_disable_legacy_broadcast() isn't init-
only and hence can race other flag manipulation (not all of which occur
while holding the channel's lock). While possibly any such updates would
only ever occur when HPET_EVT_LEGACY isn't set in the first place, this
doesn't look straightforward to prove, so better be on the safe side.

Fixes: d09486dba36a ("cpuidle: Enable hpet broadcast by default")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -709,7 +709,7 @@ void hpet_disable_legacy_broadcast(void)
 
     spin_lock_irqsave(&hpet_events->lock, flags);
 
-    hpet_events->flags |= HPET_EVT_DISABLE;
+    set_bit(HPET_EVT_DISABLE_BIT, &hpet_events->flags);
 
     /* disable HPET T0 */
     cfg = hpet_read32(HPET_Tn_CFG(0));



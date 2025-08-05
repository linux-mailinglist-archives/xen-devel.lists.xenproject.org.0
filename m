Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2B9B1AFE9
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 09:58:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070083.1433739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujCZ5-0004vo-BQ; Tue, 05 Aug 2025 07:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070083.1433739; Tue, 05 Aug 2025 07:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujCZ5-0004tz-7l; Tue, 05 Aug 2025 07:58:31 +0000
Received: by outflank-mailman (input) for mailman id 1070083;
 Tue, 05 Aug 2025 07:58:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujCZ3-0004ej-LS
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 07:58:29 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8f4ef2c-71d1-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 09:58:28 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-af967835d0aso310496466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 00:58:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c0e7sm862177966b.114.2025.08.05.00.58.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 00:58:28 -0700 (PDT)
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
X-Inumbo-ID: f8f4ef2c-71d1-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754380708; x=1754985508; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zk8ARQLxEnVZagtjLCkEYukRPf4eTmdGxwGH7j4lTGc=;
        b=bNaNRjhgt0e6XGbfCEoaKmg6KGAolQUbiPnTJzXdrWBkfKmKllHaxSZopIfXFrQP3F
         iceHo3vsutWe8nfRl3dP1nYlyUfjM+NJnu2BVRxox1IZ+qwDaYqpqnOx7AN9ok3EtTRF
         w6K3wUTuwdcXB5rGbj7wiULt4hCFqJ2EOBXTEoTZ21wURuBoYfVCTe+NDqC7elJZaDl3
         wvGY2uM8vmeQZDv2wFazojhG98d+av3IRxUdufe9/jWMEHT7FgQn4Fr1w8Ti+4qipdrW
         xjKu7R8IMwaUMnoNV0fR4eVhyg068knitBiOiZgMHilA45n0rcBdFuBUZBOpzeq5flBC
         C03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754380708; x=1754985508;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zk8ARQLxEnVZagtjLCkEYukRPf4eTmdGxwGH7j4lTGc=;
        b=pMosYoudmrmsu9MGUUqAtHm3GplZgWki2JNHrAcaiHLInV8VuldNzHs5ePmfbqI2Fn
         RSICfWqf47c/3ARYZnAlfE6Vaxfb9cKD42soI65r0rbTZ8JSU/ImknX7Q6WCJTy++182
         6hTmZIw2PrxYr4zSvFtALxCY+4wpWE7zfloVZGbe5RMCfYHyB60K3jCM/SufPZVZNbPV
         RtAQ8br8/imWXcThjI95oyEkYG3mrOyRpik/JkP12qwDuJmlJao4uwHM0bKzTnLm6ccY
         r5EkAsg7VM6EvKV7OZx3ztlGD9raae2URMZGbrREpiY/8aUNIZTWgUnuWKuIsi0txdE6
         5gBw==
X-Gm-Message-State: AOJu0YzA8nBSnGxZdlhh4+GbaX/h2jsP5keAwbMoi/Hhlckvwp+pgG/Z
	c1LhYHxfnP5hexi3U0xkJTPxot/tDhk1yefkyFs2Hb5MToaKN2jwg1KFASf61tg1lAQ/+x7ovS5
	g9ck=
X-Gm-Gg: ASbGncuae2G2OdhKey32zwUBHpcCOSTAiwnGX7kVRRlvBB6qZRxfA/e5XAiowpoquPK
	braYL0Gl5XQMJi20Lq/1ILbF/5frgLtwPjPD62jQJft82sa8Pze9CK7pW1ew/ry2dHx9PcFxZAV
	TzX7bHZP/Z9fvMYMoYoco/G/hjus+attpwRfIiUQdFOaL8TgvF9O5ipHJInmfpAm2VtVTF1SBlz
	Y0/e3Ryi9S6EgYoFwOpUJ9G6SM44ZOpoFqaM6KQ0JLqEgzfn33zhEw//O8bXkSy18oTXFCYXhCF
	haEHxGRVcpH/aRtIC8eJGn6rl4vgAsGsQih3nR+5sZ9zyFGo7B4QIpTOFpAebe9ycsFL2FeewjI
	wHCs3/m2b/fKdbNEIzF6g6bd3TWZ/rbFJT/drqmbi4cfDuUXHuI/LFhnOrw21q9RztJJVVI0d9d
	ci8rfCviBH5xiS5oE6HA==
X-Google-Smtp-Source: AGHT+IHrh6RWKmfuaIlBXu9xt3EqUmQYyQKIlJvef21/qMD6Jcd0zL1ygxI2tqPUlH7X8z0nVPyotQ==
X-Received: by 2002:a17:907:86a0:b0:ae3:f2a0:459f with SMTP id a640c23a62f3a-af9402225damr1292618166b.54.1754380708362;
        Tue, 05 Aug 2025 00:58:28 -0700 (PDT)
Message-ID: <0c75ef27-7584-4e56-9ead-6bb0274ce3eb@suse.com>
Date: Tue, 5 Aug 2025 09:58:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] x86/mm: drop paging_get_mode()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Penny Zheng <Penny.Zheng@amd.com>
References: <c506f225-0993-4ef3-9e7e-60b8f17c872e@suse.com>
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
In-Reply-To: <c506f225-0993-4ef3-9e7e-60b8f17c872e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The function was introduced without any caller, and never gained any.
Thus it has always been violating Misra rule 2.1 (unreachable code).

Fixes: dd6de3ab9985 ("Implement Nested-on-Nested")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -225,7 +225,6 @@ int paging_enable(struct domain *d, u32
 
 #define paging_get_hostmode(v)		((v)->arch.paging.mode)
 #define paging_get_nestedmode(v)	((v)->arch.paging.nestedmode)
-const struct paging_mode *paging_get_mode(struct vcpu *v);
 void paging_update_nestedmode(struct vcpu *v);
 
 /* Page fault handler
--- unstable.orig/xen/arch/x86/mm/paging.c	2025-08-05 08:59:15.512131147 +0200
+++ unstable/xen/arch/x86/mm/paging.c	2025-08-05 09:00:24.160657794 +0200
@@ -946,14 +946,6 @@ void paging_dump_vcpu_info(struct vcpu *
     }
 }
 
-const struct paging_mode *paging_get_mode(struct vcpu *v)
-{
-    if (!nestedhvm_is_n2(v))
-        return paging_get_hostmode(v);
-
-    return paging_get_nestedmode(v);
-}
-
 #ifdef CONFIG_HVM
 void paging_update_nestedmode(struct vcpu *v)
 {



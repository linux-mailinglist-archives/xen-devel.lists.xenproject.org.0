Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D47E39622DF
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 11:01:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784553.1193923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjEXa-0000wC-Q1; Wed, 28 Aug 2024 09:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784553.1193923; Wed, 28 Aug 2024 09:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjEXa-0000tg-N1; Wed, 28 Aug 2024 09:00:34 +0000
Received: by outflank-mailman (input) for mailman id 784553;
 Wed, 28 Aug 2024 09:00:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRYu=P3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjEXZ-0000ta-Np
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 09:00:33 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fab0c2d2-651b-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 11:00:31 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a868d7f92feso822691166b.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 02:00:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e594a545sm212828166b.205.2024.08.28.02.00.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 02:00:30 -0700 (PDT)
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
X-Inumbo-ID: fab0c2d2-651b-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724835631; x=1725440431; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IDlXVI4tN1z7T+KNMK8D/vgvXHZ0aqeWrPhpeNr3oGI=;
        b=ah7AC7Zl23ipu5eq4c5/0ncSewAz+AsIDt7RpttT3A00tHTu/fHT0JtshmAyazk1wi
         TEACT8x4qyL+UZcFaTKz+fsLg5Bvsjt/M5/I9dxPcUpuhhX3RvrKqCHl1LTSd0I3kDDM
         kdffRlIwqzb+w8RFQn+Z4BkE3P53bHrpDx0/RLDUrHfiusm75uD0wK8aOZzn1ogObsto
         mWDk9YF4vxKtEq3K10cFICk/HpOlaEOyqM7aCR0HgsYKyRFIQ3ORtaiaSr8u4G91GP9u
         gCeOCCTl/YsAVQFMwNEAR5ryzpJ+9TzfJOemV24CId6BYDInZwAh9t6Zmt+b5cxD4f1g
         w6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724835631; x=1725440431;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IDlXVI4tN1z7T+KNMK8D/vgvXHZ0aqeWrPhpeNr3oGI=;
        b=h/2Vu/CjeGouE5OLRyyHnbGwNNc0QcUHXxHYwvHus+Ippv7eRfHxsfWuzpJqSei4Eo
         jkOndh5f68n8umhU2e+EV/drU7W5n27Bm+WCRGaYRYrl+G86N6YyeR+WLZQMs8KlFnuJ
         wCnXS/TW6qZV0baiKsTNSsJ38WZHckH6B6rb4807KvDivWugmY4lzob9YAjCmxk5yTh4
         oLlDWyycU29E45x0jzmL+eWowE7XBJb+31zxtRsnXxkZ8ssAZ6VmqmWs2Aa6bo3oPPSf
         LVZzBmBFS+G2lxGpOxml4Of0ke4Fz3eDMfbnZwJ6XNoxETfWKV9hsRrpKtQkdFRbezRV
         70IQ==
X-Gm-Message-State: AOJu0Yy9Pb/YplcrwRFAs+651+xvtwJ1RBCDgYJs78HWOL1NwgrRM60U
	wPs1pgG0X7p2eRWxvx/s1VJJx3kG95oNl2an+0eyHoT6jyZOSPAwND9NFyphzg7j8emrGfaLB4g
	=
X-Google-Smtp-Source: AGHT+IGHpx7Xudff8ARLDevvbz3QNV7fJG1J76Ibn5Mnv56P9WECyyj73XMjM7T7Gsm5H0pq4MV8+w==
X-Received: by 2002:a17:907:9724:b0:a86:95ff:f3a0 with SMTP id a640c23a62f3a-a86a5188d5fmr1133283866b.3.1724835631012;
        Wed, 28 Aug 2024 02:00:31 -0700 (PDT)
Message-ID: <da785047-0bee-4d16-a6ae-d1727bd8317a@suse.com>
Date: Wed, 28 Aug 2024 11:00:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: correct partial HPET_STATUS write emulation
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

For partial writes the non-written parts of registers are folded into
the full 64-bit value from what they're presently set to. That's wrong
to do though when the behavior is write-1-to-clear: Writes not
including to low 3 bits would unconditionally clear all ISR bits which
are presently set. Re-calculate the value to use.

Fixes: be07023be115 ("x86/vhpet: add support for level triggered interrupts")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Alternatively we could also suppress the folding in of read bits, but
that looked to me to end up in a more intrusive change.

--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -404,7 +404,8 @@ static int cf_check hpet_write(
         break;
 
     case HPET_STATUS:
-        /* write 1 to clear. */
+        /* Write 1 to clear. Therefore don't use new_val directly here. */
+        new_val = val << ((addr & 7) * 8);
         while ( new_val )
         {
             bool active;


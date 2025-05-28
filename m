Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD18FAC67F4
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 13:00:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999327.1380009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKEWQ-000114-7p; Wed, 28 May 2025 11:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999327.1380009; Wed, 28 May 2025 11:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKEWQ-0000zd-50; Wed, 28 May 2025 11:00:34 +0000
Received: by outflank-mailman (input) for mailman id 999327;
 Wed, 28 May 2025 11:00:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kwEP=YM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uKEWO-0000zJ-FY
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 11:00:32 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f39f36ac-3bb2-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 13:00:22 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-604533a2f62so6895182a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 May 2025 04:00:22 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6051d60757dsm614036a12.33.2025.05.28.04.00.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 May 2025 04:00:21 -0700 (PDT)
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
X-Inumbo-ID: f39f36ac-3bb2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748430022; x=1749034822; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrIui1xyOj3oWDyzMJJM17bDTYJKTOACDfiBDPls5Cs=;
        b=gl+WsSRjJETGDxK+wXea/WD/LhNwrthcMPnrYCrl3KUZgT3WeZ2WhgaRe0+aE5k+j0
         dCdaZF5BuPxIPs+4pFWi6HvbTxtnvmO8ShcJKwq/z45nHGf29j6iX4BXX2Iv1L9bAO+R
         lqdWq/SE+lgZoCjPZAf8FNId2WMvqO4FWeHb51cDd3UtpVQsbFZ+cWnR+3uhVOuYoQD0
         usI3+E3zmz7r8Lc1x5YLUJabMJlX7rhEaJUH3P+N+a45Spi5LGYOnt4YUQz/B4J/bWqo
         c/bqADj52MQx57HaJvH6uaUjLW1mXeI0LLY6BwTbuPNz03Ibr+oT/HoCOU3PBb2LVZdn
         4QXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748430022; x=1749034822;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zrIui1xyOj3oWDyzMJJM17bDTYJKTOACDfiBDPls5Cs=;
        b=Q4djKwKpgc4hjQyD1ZTqE5k0n8ARy719+PGkRYyhJ6/5MhFUGvd+5Xg0vSrk08Dlmw
         9hx5YNs+62O6cC6Tz94T2EoUWn7VWpThsbRud0zp2W+x9eTAGYOvIgRF8dwjjeplq0A0
         DCvicHFN0lN5odDXEm41TrMMpJD0KExT0oRQjdbAfFqHXyTEIOwztJD8tLYVGeaJOwDD
         rbGda+RZz4A9xsnprvdkC/K/HelCRdTmEunlHO6QO2789RKJappMtiXjKdXExroT5XxT
         nJyLKZtJmR5S8yzUxkOIsFaa3+VhOd+lGABYXoMJJw6KO0kin28g4HfaUaJlYzjtNmqz
         Nzfw==
X-Forwarded-Encrypted: i=1; AJvYcCUeUnXgk4+DXpgSguBbeRUuq6YL4mYDAHkd8UVLQWAuS8mR5dV5A9ilIMHE9gmIzDHofrDCEGPWA7I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIA2MbB2oM38vv/r4hF+L97pKskIOpbTIPcBX12RVyBbgJabTG
	e4K8QAiDeD39fLQ0prxLxPqJnB0opkgcGt5MN//97jy6S2xWtf/s3ARh
X-Gm-Gg: ASbGncvwxmxbTkXkXZKEhwAiD3UF0OJl/JVT3cSeyILacZxeXvfWFvLbw3MUk0EZsEe
	N78AdSxcm2k7tNxXjeeR4wLYTTJIAeEnOsZIhqtvn4zkE84hcZMigKediYaQYZwybLgH0XKa+ZP
	toIL6xl6ZNhXIwL8i1x0RfzC2vjPg8WxlGK5L1qXID06YatbjYoZEkou8dRwsAgxZ8XoiVHAqGP
	29IuAyYl7OB2Orq80gEPBZ2ogwQAmgP8Rfbv5EpfoNc1nDmSFhb6EgO46SBfx90a1y8rahL8nN8
	jAsryy5tBcjd5pCTXASfJlAhvRudj4TPAMjhnbhLziKHhima/v0SGtxuYKlI4xI+iKFbFvZqzQL
	8rpmFCiGJUs7tk30TpjB1DAjB
X-Google-Smtp-Source: AGHT+IFj/IC6PdCL2eW9+vTEGUGDPwKWZ+35bHQ+9ap2wYSAyoN4F6it1clVaplAsl8JvDQCXppM2Q==
X-Received: by 2002:a05:6402:27ca:b0:604:e33f:e5cd with SMTP id 4fb4d7f45d1cf-604e33fe8c6mr7137358a12.19.1748430021808;
        Wed, 28 May 2025 04:00:21 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------IMmpqwr2iqJljvYIfrvMUm4s"
Message-ID: <d198631b-2c2f-40e1-93e8-032c5e144166@gmail.com>
Date: Wed, 28 May 2025 13:00:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/14] xen/riscv: implementation of aplic and imsic
 operations
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
 <33f0952f0d05e4fe8fff926df31987e006c6eacf.1747843009.git.oleksii.kurochko@gmail.com>
 <26893680-4467-4e42-89e5-b9020529f03d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <26893680-4467-4e42-89e5-b9020529f03d@suse.com>

This is a multi-part message in MIME format.
--------------IMmpqwr2iqJljvYIfrvMUm4s
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/22/25 5:55 PM, Jan Beulich wrote:
> On 21.05.2025 18:03, Oleksii Kurochko wrote:
>> +static void aplic_set_irq_affinity(struct irq_desc *desc, const cpumask_t *mask)
>> +{
>> +    unsigned int cpu;
>> +    uint64_t group_index, base_ppn;
>> +    uint32_t hhxw, lhxw ,hhxs, value;
> Nit: Comma vs blank placement.
>
>> +    const struct imsic_config *imsic = aplic.imsic_cfg;
>> +
>> +    /*
>> +     * TODO: Currently, APLIC is supported only with MSI interrupts.
>> +     *       If APLIC without MSI interrupts is required in the future,
>> +     *       this function will need to be updated accordingly.
>> +     */
>> +    ASSERT(readl(&aplic.regs->domaincfg) & APLIC_DOMAINCFG_DM);
>> +
>> +    ASSERT(!cpumask_empty(mask));
>> +
>> +    ASSERT(spin_is_locked(&desc->lock));
>> +
>> +    cpu = cpuid_to_hartid(aplic_get_cpu_from_mask(mask));
>> +    hhxw = imsic->group_index_bits;
>> +    lhxw = imsic->hart_index_bits;
>> +    hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
>> +    base_ppn = imsic->msi[cpu].base_addr >> IMSIC_MMIO_PAGE_SHIFT;
>> +
>> +    /* Update hart and EEID in the target register */
>> +    group_index = (base_ppn >> (hhxs + IMSIC_MMIO_PAGE_SHIFT)) & (BIT(hhxw, UL) - 1);
> Nit: Line length.
>
> I'm also puzzled by the various uses of IMSIC_MMIO_PAGE_SHIFT. Why do you
> subtract double the value when calculating hhxs, just to add the value
> back in here? There's no other usee of the variable afaics.

To follow AIA spec:
   MSI_address = ((Base_PPN | (group_index << (HHXS + 12)) | (hart_index << LHXS) | guest_index) << 12)
   Represented in the terms of Section 3.6, HHXW = j, LHXW = k, HHXS = E - 24, LHXS = D - 12, Base PPN = B >> 12.

Specifically, in this case it is possible to calculate as hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT,
and then drop "+ IMSIC_MMIO_PAGE_SHIFT" in (hhxs + IMSIC_MMIO_PAGE_SHIFT), but then it could be harder to
understand a formula when you look into AIA spec and then what is in code.

Also, possible one day hhxs will be used somewhere else, for example, to verify target base physical PPN as Linux
kernel does:
	tppn = msg_addr >> APLIC_xMSICFGADDR_PPN_SHIFT;

	/* Compute target HART Base PPN */
	tbppn = tppn;
	tbppn &= ~APLIC_xMSICFGADDR_PPN_HART(mc->lhxs);
	tbppn &= ~APLIC_xMSICFGADDR_PPN_LHX(mc->lhxw, mc->lhxs);
	tbppn &= ~APLIC_xMSICFGADDR_PPN_HHX(mc->hhxw, mc->hhxs);
	WARN_ON(tbppn != mc->base_ppn);

	/* Compute target group and hart indexes */
	group_index = (tppn >> APLIC_xMSICFGADDR_PPN_HHX_SHIFT(mc->hhxs)) &
		     APLIC_xMSICFGADDR_PPN_HHX_MASK(mc->hhxw);
         ...

At the moment, I can add the comment above hhxs (and/or group_index) that it is calculated in this way and
isn't simplified to "hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2" to follow a formula
from AIA spec.

~ Oleksii

--------------IMmpqwr2iqJljvYIfrvMUm4s
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/22/25 5:55 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:26893680-4467-4e42-89e5-b9020529f03d@suse.com">
      <pre class="moz-quote-pre" wrap=""><pre wrap=""
      class="moz-quote-pre">On 21.05.2025 18:03, Oleksii Kurochko wrote:
</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">+static void aplic_set_irq_affinity(struct irq_desc *desc, const cpumask_t *mask)
+{
+    unsigned int cpu;
+    uint64_t group_index, base_ppn;
+    uint32_t hhxw, lhxw ,hhxs, value;
</pre></blockquote><pre wrap="" class="moz-quote-pre">Nit: Comma vs blank placement.

</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">+    const struct imsic_config *imsic = aplic.imsic_cfg;
+
+    /*
+     * TODO: Currently, APLIC is supported only with MSI interrupts.
+     *       If APLIC without MSI interrupts is required in the future,
+     *       this function will need to be updated accordingly.
+     */
+    ASSERT(readl(&amp;aplic.regs-&gt;domaincfg) &amp; APLIC_DOMAINCFG_DM);
+
+    ASSERT(!cpumask_empty(mask));
+
+    ASSERT(spin_is_locked(&amp;desc-&gt;lock));
+
+    cpu = cpuid_to_hartid(aplic_get_cpu_from_mask(mask));
+    hhxw = imsic-&gt;group_index_bits;
+    lhxw = imsic-&gt;hart_index_bits;
+    hhxs = imsic-&gt;group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
+    base_ppn = imsic-&gt;msi[cpu].base_addr &gt;&gt; IMSIC_MMIO_PAGE_SHIFT;
+
+    /* Update hart and EEID in the target register */
+    group_index = (base_ppn &gt;&gt; (hhxs + IMSIC_MMIO_PAGE_SHIFT)) &amp; (BIT(hhxw, UL) - 1);
</pre></blockquote><pre wrap="" class="moz-quote-pre">Nit: Line length.

I'm also puzzled by the various uses of IMSIC_MMIO_PAGE_SHIFT. Why do you
subtract double the value when calculating hhxs, just to add the value
back in here? There's no other usee of the variable afaics.</pre></pre>
    </blockquote>
    <pre>To follow AIA spec:
  MSI_address = ((Base_PPN | (group_index &lt;&lt; (HHXS + 12)) | (hart_index &lt;&lt; LHXS) | guest_index) &lt;&lt; 12)
  Represented in the terms of Section 3.6, HHXW = j, LHXW = k, HHXS = E - 24, LHXS = D - 12, Base PPN = B &gt;&gt; 12.

Specifically, in this case it is possible to calculate as hhxs = imsic-&gt;group_index_shift - IMSIC_MMIO_PAGE_SHIFT,
and then drop "+ IMSIC_MMIO_PAGE_SHIFT" in (hhxs + IMSIC_MMIO_PAGE_SHIFT), but then it could be harder to
understand a formula when you look into AIA spec and then what is in code.

Also, possible one day hhxs will be used somewhere else, for example, to verify target base physical PPN as Linux
kernel does:
	tppn = msg_addr &gt;&gt; APLIC_xMSICFGADDR_PPN_SHIFT;

	/* Compute target HART Base PPN */
	tbppn = tppn;
	tbppn &amp;= ~APLIC_xMSICFGADDR_PPN_HART(mc-&gt;lhxs);
	tbppn &amp;= ~APLIC_xMSICFGADDR_PPN_LHX(mc-&gt;lhxw, mc-&gt;lhxs);
	tbppn &amp;= ~APLIC_xMSICFGADDR_PPN_HHX(mc-&gt;hhxw, mc-&gt;hhxs);
	WARN_ON(tbppn != mc-&gt;base_ppn);

	/* Compute target group and hart indexes */
	group_index = (tppn &gt;&gt; APLIC_xMSICFGADDR_PPN_HHX_SHIFT(mc-&gt;hhxs)) &amp;
		     APLIC_xMSICFGADDR_PPN_HHX_MASK(mc-&gt;hhxw);
        ...

At the moment, I can add the comment above hhxs (and/or group_index) that it is calculated in this way and
isn't simplified to "hhxs = imsic-&gt;group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2" to follow a formula
from AIA spec.

~ Oleksii

</pre>
  </body>
</html>

--------------IMmpqwr2iqJljvYIfrvMUm4s--


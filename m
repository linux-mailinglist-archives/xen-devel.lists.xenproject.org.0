Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC5690EA19
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 13:53:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743703.1150655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJtsX-000669-OP; Wed, 19 Jun 2024 11:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743703.1150655; Wed, 19 Jun 2024 11:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJtsX-00063U-Kv; Wed, 19 Jun 2024 11:53:29 +0000
Received: by outflank-mailman (input) for mailman id 743703;
 Wed, 19 Jun 2024 11:53:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJtsW-00063N-6T
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 11:53:28 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a1d236e-2e32-11ef-90a3-e314d9c70b13;
 Wed, 19 Jun 2024 13:53:27 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ebed33cb65so72898821fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 04:53:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855e6dfb7sm114587185ad.64.2024.06.19.04.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 04:53:26 -0700 (PDT)
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
X-Inumbo-ID: 8a1d236e-2e32-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718798007; x=1719402807; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6bJEvoC3DUAVTtWayZw28l8y94R8V/LKRoLGpWRNzeA=;
        b=MASs2Iffy1ZeVNhhh72L9Tj6zWcrKmDbsMpKfHZ38kJ+k+Y5gtS3MBr51BXw+ERpqG
         bs5xrer4gSPuyEorxurVczjhwL86F4E1/XWa4sVlAsCnXK9qCve4CDOpgDw/BBHhprGT
         p8rgk3MYo1VpBJeTRwh4U+Xs0F2/32aVzgdo18TnZ3mc6TapnMOBv4SCq+5eRKXFtQVH
         biqsGW5rggMd7ORpfP/No9bLJN4LNpyKr0OhpMvo8zPlOIBRI+iR4Fqio2j5zHjktN4i
         ubt/UntCEeZdShNlVljazZYN728BjhuIrky3oJ3Vt1aPXZVELKM4mPM/wX1TxJ1kd4jT
         Eb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718798007; x=1719402807;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bJEvoC3DUAVTtWayZw28l8y94R8V/LKRoLGpWRNzeA=;
        b=pYKxBhJKPFOYkj7Q3t5qgXbb5VQADh3duPN+k9WwkTXbN4PIRvGA5shsVa4BLDGzZG
         tcYQ/ftG/Nzpdgvl57r4lUivCWHhlGXsO9DsWe4NX13e9wQAFu1BYWUtl3rZNliAsj4e
         UwpqO6Pa9IIH6WZp8pg6VjOiIh7tN5+uOLkAFZ7Cu6Voi8vI/d9Wr3QSUgQzjP3Ht0mo
         ukS5GuXNtPRjq4CZHRZUgJ/J7hqC62SLO0M608gftQoxC5wWfmUTVci/dTRQ8qpsue6h
         O7f17eodFcyJwbMn6yzEVFY2r4JZ2l1IXvYjaKU4BqLvOkAGJ849V3RQVn2lzvOyucs/
         4bNw==
X-Forwarded-Encrypted: i=1; AJvYcCW3MPfSLE2SdLEuJFMh7+IW3PKcpvSbYJTQwIbMfse4W8oPUxQ6qMVE6dFp11ImlZ8WggAdbYiRkB9wehj9I1mUJwANxTQmhFgjuoLzq/c=
X-Gm-Message-State: AOJu0YzXOOjRKJ00aHg3Uq6Ri9vHUo0iyib9KX2SN3IkRtDdZZ0Q2Erd
	SpndFgVrkliyejRd6eT1HcL2fFt52tD7YqK5N1u8nKbCwQF6/N0K90YJlDRAQA==
X-Google-Smtp-Source: AGHT+IGL0COs6RQQ7wQ2cAUQqSAKCZ5B+3aE45wZ88NCw/R5cgUeCb0rLRtHiJhvvG7wo3zIzK0GEA==
X-Received: by 2002:a2e:9c99:0:b0:2ea:df2e:428c with SMTP id 38308e7fff4ca-2ec3cffc542mr15692731fa.49.1718798006769;
        Wed, 19 Jun 2024 04:53:26 -0700 (PDT)
Message-ID: <0b54d032-a473-4f3e-8284-b9fe63cbf26a@suse.com>
Date: Wed, 19 Jun 2024 13:53:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 v4] x86/irq: forward pending interrupts to new
 destination in fixup_irqs()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <20240619095833.76271-1-roger.pau@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <20240619095833.76271-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.06.2024 11:58, Roger Pau Monne wrote:
> fixup_irqs() is used to evacuate interrupts from to be offlined CPUs.  Given
> the CPU is to become offline, the normal migration logic used by Xen where the
> vector in the previous target(s) is left configured until the interrupt is
> received on the new destination is not suitable.
> 
> Instead attempt to do as much as possible in order to prevent loosing
> interrupts.  If fixup_irqs() is called from the CPU to be offlined (as is
> currently the case for CPU hot unplug) attempt to forward pending vectors when
> interrupts that target the current CPU are migrated to a different destination.
> 
> Additionally, for interrupts that have already been moved from the current CPU
> prior to the call to fixup_irqs() but that haven't been delivered to the new
> destination (iow: interrupts with move_in_progress set and the current CPU set
> in ->arch.old_cpu_mask) also check whether the previous vector is pending and
> forward it to the new destination.
> 
> This allows us to remove the window with interrupts enabled at the bottom of
> fixup_irqs().  Such window wasn't safe anyway: references to the CPU to become
> offline are removed from interrupts masks, but the per-CPU vector_irq[] array
> is not updated to reflect those changes (as the CPU is going offline anyway).
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>




Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B89A309D9
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 12:24:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885425.1295233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thoMz-00058j-8X; Tue, 11 Feb 2025 11:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885425.1295233; Tue, 11 Feb 2025 11:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thoMz-00056S-5m; Tue, 11 Feb 2025 11:24:01 +0000
Received: by outflank-mailman (input) for mailman id 885425;
 Tue, 11 Feb 2025 11:24:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thoMy-00056M-Jt
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 11:24:00 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afb8238a-e86a-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 12:23:58 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ab7e9254bb6so36901566b.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 03:23:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7c520a3a2sm355586166b.158.2025.02.11.03.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 03:23:57 -0800 (PST)
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
X-Inumbo-ID: afb8238a-e86a-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739273038; x=1739877838; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WAbxDbRvwrExYaBtP87EYTRbvoBDZ1Y0Jhg17boEwYc=;
        b=Qa5HL3BYoczZAzH2M3oyszgkcxHJC1Ne9aOnv4UlI9KR1ay0b3MnsQkz2vJDneMl+e
         Uu/0IS9D8tgYuHNwzDqhyqoFTMl7a4ULPa1n2nHKbjtw/VxfmQ0mxdyNAySiTWIujn3e
         BIcxQSG/217GZkt5dWcwPZjVLyMWD2ACn81YVckd0Dh3noasoEyNu5h9U5vrMTafSVzD
         3KSC1ySM3g5Pdw9QjszARqC1eqjqsqdMptBn4aGJOBtsRbXHYXjRPjG8sfC/T+ytGP07
         a4gc0vO5SXIz7akvunkLQ7hMCE0s7aowv/t+7EfLLSixKTtS3dqwrKNwDCbYgbJJy2HO
         y3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739273038; x=1739877838;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAbxDbRvwrExYaBtP87EYTRbvoBDZ1Y0Jhg17boEwYc=;
        b=wyM07ZA9I6BWQ9cDcKwE/b35qq2ltd2cMkWL8kSAI6m6jD9QY4xetxy0cuGrpge2Z+
         xLapZgby4h5JcrhDz8cvm+Zh4D6FR8vkec1frkS0GzIWVtp/sU6gQlw1/U4EMFHXDtBc
         Cg864CrqUAFPtAZroLdv7aKbysKxgOg5uUlNPpUh+qTTKxy/hk77cXA9NRP9QBEUlcNH
         GZrTUgLwsRNs7QKvK9+B3e8By7KmEo9HKxGr5TSwe+FFR4ZZGQsQbpvoV2KbsNlTG4ZZ
         uRZbnYrWbbH+NfpmqbReNWAM/VKGI4P+YpzjTP7qyR0wzncPBz99f9Sqv2pZl/UtQR09
         Tcew==
X-Forwarded-Encrypted: i=1; AJvYcCXiitleRO/+2EJd27Fl+ksBWQMdw+vEV0TdCQdflTC5J7by5ucxTpVkJjhhSbHyX/UT3Ah18H2xxls=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEoDTcjWaE7UbSBqmvcNxYZoMidGGVAOPsiPD2d/UVSjiGg7WC
	GfQQtAE8pgYh28FD84ar6tYF16jsWftvsJV2enCkx1gZKm7A87e/vbO7/lGSjgA117LItCsR4Pg
	=
X-Gm-Gg: ASbGncuRdAScpTtq+DjPISLD0+Zywk8wtwMMG2XSp6bQEa6Q6sjJWtwLk/V6McRuXAq
	jGx/MdP9ekFgN7JvYmGexsSIEUZtoYu3YXjxIkdBa8ImIpmmgc6uZz0nsmMmNQ66xEDJ1481bW5
	FNz7lhbBa/cHJ3hNTsN0GXBzkfr9B/3n3avDStqVl69QU3q5PnkT9+cIHBMFO7mqq118jVeeO1r
	h93RY9Hqoc7aScMvaWJQnjt0wqcvWHAkeLn7xFiOzAyj5Eg5EIrAYUS9nfu1Kha44IcseKmSRh0
	d6aDYXaFqGzjAZH3G21w31Jds2TQTDGsiVGtfPzotE0oqQpPcJ0bXl5GzeKhgIYSvcrxGw7El+0
	t
X-Google-Smtp-Source: AGHT+IGsFciMtf64JJzIw7UhLKf7RPTG/oh6MyD6FIGuTVbGWPlymxFyuI9NpbNTbPfvDnY7OUSBqQ==
X-Received: by 2002:a17:907:d40f:b0:ab7:dec1:b353 with SMTP id a640c23a62f3a-ab7dec1cf1bmr250221666b.49.1739273037940;
        Tue, 11 Feb 2025 03:23:57 -0800 (PST)
Message-ID: <a0ea8bdb-4168-4b0b-895b-ba0fcf1caf79@suse.com>
Date: Tue, 11 Feb 2025 12:23:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 v3 1/5] x86/shutdown: offline APs with interrupts
 disabled on all CPUs
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250211110209.86974-1-roger.pau@citrix.com>
 <20250211110209.86974-2-roger.pau@citrix.com>
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
In-Reply-To: <20250211110209.86974-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.02.2025 12:02, Roger Pau Monne wrote:
> The current shutdown logic in smp_send_stop() will disable the APs while
> having interrupts enabled on the BSP or possibly other APs. On AMD systems
> this can lead to local APIC errors:
> 
> APIC error on CPU0: 00(08), Receive accept error
> 
> Such error message can be printed in a loop, thus blocking the system from
> rebooting.  I assume this loop is created by the error being triggered by
> the console interrupt, which is further stirred by the ESR handler
> printing to the console.
> 
> Intel SDM states:
> 
> "Receive Accept Error.
> 
> Set when the local APIC detects that the message it received was not
> accepted by any APIC on the APIC bus, including itself. Used only on P6
> family and Pentium processors."
> 
> So the error shouldn't trigger on any Intel CPU supported by Xen.
> 
> However AMD doesn't make such claims, and indeed the error is broadcast to
> all local APICs when an interrupt targets a CPU that's already offline.
> 
> To prevent the error from stalling the shutdown process perform the
> disabling of APs and the BSP local APIC with interrupts disabled on all
> CPUs in the system, so that by the time interrupts are unmasked on the BSP
> the local APIC is already disabled.  This can still lead to a spurious:
> 
> APIC error on CPU0: 00(00)
> 
> As a result of an LVT Error getting injected while interrupts are masked on
> the CPU, and the vector only handled after the local APIC is already
> disabled.  ESR reports 0 because as part of disable_local_APIC() the ESR
> register is cleared.
> 
> Note the NMI crash path doesn't have such issue, because disabling of APs
> and the caller local APIC is already done in the same contiguous region
> with interrupts disabled.  There's a possible window on the NMI crash path
> (nmi_shootdown_cpus()) where some APs might be disabled (and thus
> interrupts targeting them raising "Receive accept error") before others APs
> have interrupts disabled.  However the shutdown NMI will be handled,
> regardless of whether the AP is processing a local APIC error, and hence
> such interrupts will not cause the shutdown process to get stuck.
> 
> Remove the call to fixup_irqs() in smp_send_stop(): it doesn't achieve the
> intended goal of moving all interrupts to the BSP anyway.  The logic in
> fixup_irqs() will move interrupts whose affinity doesn't overlap with the
> passed mask, but the movement of interrupts is done to any CPU set in
> cpu_online_map.  As in the shutdown path fixup_irqs() is called before APs
> are cleared from cpu_online_map this leads to interrupts being shuffled
> around, but not assigned to the BSP exclusively.

Which would have been possible to address by changing to something like

        if ( !cpumask_intersects(mask, desc->affinity) )
        {
            break_affinity = true;
            cpumask_copy(affinity, mask);
        }
        else
            cpumask_and(affinity, mask, desc->affinity);

there, I guess.

> The Fixes tag is more of a guess than a certainty; it's possible the
> previous sleep window in fixup_irqs() allowed any in-flight interrupt to be
> delivered before APs went offline.  However fixup_irqs() was still
> incorrectly used, as it didn't (and still doesn't) move all interrupts to
> target the provided cpu mask.

Plus there's the vector shortage aspect, if everything was moved to the
BSP. I don't think that's possible to get past without doing what you
do.

> Fixes: e2bb28d62158 ('x86/irq: forward pending interrupts to new destination in fixup_irqs()')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


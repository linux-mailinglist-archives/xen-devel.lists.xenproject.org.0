Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA84BAE7CA2
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 11:26:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024526.1400381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUMOC-0000Ul-BE; Wed, 25 Jun 2025 09:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024526.1400381; Wed, 25 Jun 2025 09:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUMOC-0000TI-7S; Wed, 25 Jun 2025 09:25:56 +0000
Received: by outflank-mailman (input) for mailman id 1024526;
 Wed, 25 Jun 2025 09:25:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QoV+=ZI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUMOB-0000TC-4q
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 09:25:55 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63a7c8b1-51a6-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 11:25:52 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a4fea34e07so703927f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 02:25:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f124249bsm10574265a12.38.2025.06.25.02.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 02:25:51 -0700 (PDT)
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
X-Inumbo-ID: 63a7c8b1-51a6-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750843552; x=1751448352; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VKKjVWZ2YRcVdvg2lHk6HnNZ4Bkgleult3V2FPmOFNc=;
        b=dicUydZS7LgxiVPIVki/WJetFF8C+RfojKr223OvFq+cPfbVNiqaoACv9IIpya9J/n
         hHQr1VoNdxZmW+LY8+8bbq3LinlUk/W79p6Zhs4N2nwIyzYOsr1AMixMstboyaufh2r1
         +6R86yExY9gAlgQeGZj0AgWvhj7UXTrjXO5m97tq4Q5I3H38C0dMdIA3epPAdOagOtoz
         sqANOQsxfdGVGzzLZKljQhChghhK2UO8bJyLGEj5Sph8u9Zo4NDYDTtCZhO14K8Llu1z
         6AOsiLUJHsvk7sjUbyp4oyCRkh3a2hfn0wdlnrupyfSe0uIPCkjJCf/brWRSPJfrcX2Y
         eVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843552; x=1751448352;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKKjVWZ2YRcVdvg2lHk6HnNZ4Bkgleult3V2FPmOFNc=;
        b=IzkTABPtWqjFRlS+LS3x2EVqPrQMYKvSV3V2+Eb15NqKxR7Ekx6Di7MXHAhRyfwke5
         rbYk9yPwKRcTieP7gbrIL5arfu2kVrnKnP9HLXEYRx2p1umfimGiTU0xCFWqT2F0Skwe
         Xe8PcH2+GI+MycLhaoEj14UF/xxrAsWMt+46TykkQvSHSfvjBroQYAVYlkXQKT/bOokv
         1scZtqWrLgbKPFyvn9hZlUA3OFkz0Zv/VXZbyWYLdcp89zd0rml1GOlkkBaqfypmw8mQ
         5vkt8/EdcH1CQYmL2t1BiSGr9Oi3ZFSsbNIwIPZhS8Ys7sRCwgClGNssWUtLV/5e+zbS
         v+RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDaLawWT9e62EG8XGF7fBOilisZeSXYQgZAKOOR+oivLXF0Wp30lypbMLeFK0vkGkJ/vSVmeTeCsM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7uQn+pFnv1sxKYUr62oUOuKtizbyXRco3X++c9pvGn0HwV+kG
	2aKm4BpkSuRg5yycapxVpfF7T1lOvOhmfXtw2bg6S1nOQDFFf8qIiPyP/VkY2RGXtg==
X-Gm-Gg: ASbGncsVmi2FzUFZH5QGDL2eUasWAPVZytqRKO1mUhJGUm1TBgyiBlnUgJjK2rMe4Sx
	xGu9kz1XaZIHaNgpCh6T7VO3kkPu1zLPpjaNubY0wB7Sjei20L5H0VWD6LQmp9JyBggxLpmAgNK
	BPtoo7SNF7UIqOTQtQbb5YqwWueLodKYMwQB98sJv6rO5veM81iHm9XhbnYPDCsKOLrrurCRx9A
	EBLRZtXFQ1aantuF1OxBM2ieOx/ddKzmL3pWLDE9EwSTRqjDw83RrlwVnqDqCw9rp0FdAxr96qA
	07bbKTob/WXQBgOF4qGYB9gFXOCjoOAjUidmUyJVtgQYwp7FursBb37otPZDQV8C/wR6f92CI+e
	WoLujyQMNdqcY4WGCId2HuZsV9PM8TrLtIvf21Cnh1BXjYk4=
X-Google-Smtp-Source: AGHT+IE92f1EdVifDWFUowityyhPSFM/8lOsOJo8SSxTTHLSwHHeyMMMbknkJpjUI7/8eumVxeYsrQ==
X-Received: by 2002:a05:6000:2d84:b0:3a4:cfbf:51a0 with SMTP id ffacd0b85a97d-3a6ed6222e9mr1349718f8f.21.1750843552144;
        Wed, 25 Jun 2025 02:25:52 -0700 (PDT)
Message-ID: <f1cc4292-73b9-40f6-9974-3a2260c00d87@suse.com>
Date: Wed, 25 Jun 2025 11:25:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/idle: Remove MFENCEs for CLFLUSH_MONITOR
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250624163951.301743-1-andrew.cooper3@citrix.com>
 <20250624163951.301743-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250624163951.301743-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2025 18:39, Andrew Cooper wrote:
> Commit 48d32458bcd4 ("x86, idle: add barriers to CLFLUSH workaround") was
> inherited from Linux and added MFENCEs around the AAI65 errata fix.
> 
> The SDM now states:
> 
>   Executions of the CLFLUSH instruction are ordered with respect to each
>   other and with respect to writes, locked read-modify-write instructions,
>   and fence instructions[1].
> 
> with footnote 1 reading:
> 
>   Earlier versions of this manual specified that executions of the CLFLUSH
>   instruction were ordered only by the MFENCE instruction.  All processors
>   implementing the CLFLUSH instruction also order it relative to the other
>   operations enumerated above.
> 
> I.e. the MFENCEs came about because of an incorrect statement in the SDM.

And their exact placement even differed between the two sites.

> The Spec Update (no longer available on Intel's website) simply says "issue a
> CLFLUSH", with no mention of MFENCEs.
> 
> As this erratum is specific to Intel, it's fine to remove the the MFENCEs; AMD
> CPUs of a similar vintage do port otherwise-unordered CLFLUSHs.

Nit: DYM "sport"? I think the corresponding Linux commit that I once looked
at has it that way.

> Move the feature bit into the BUG range (rather than FEATURE), and move the
> workaround into monitor() itself.
> 
> The erratum check itself must use setup_force_cpu_cap().  It needs activating
> if any CPU needs it, not if all of them need it.
> 
> Fixes: 48d32458bcd4 ("x86, idle: add barriers to CLFLUSH workaround")
> Fixes: 96d1b237ae9b ("x86/Intel: work around Xeon 7400 series erratum AAI65")
> Link: https://web.archive.org/web/20090219054841/http://download.intel.com/design/xeon/specupdt/32033601.pdf
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



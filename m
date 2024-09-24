Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E08984977
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 18:22:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803093.1213512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8IR-0005Gw-RU; Tue, 24 Sep 2024 16:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803093.1213512; Tue, 24 Sep 2024 16:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8IR-0005FM-Od; Tue, 24 Sep 2024 16:21:51 +0000
Received: by outflank-mailman (input) for mailman id 803093;
 Tue, 24 Sep 2024 16:21:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vfmb=QW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1st8IQ-0005FG-2Y
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 16:21:50 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 196b860b-7a91-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 18:21:48 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c5cc65a8abso1866344a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 09:21:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4c4fd8sm895657a12.69.2024.09.24.09.21.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 09:21:48 -0700 (PDT)
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
X-Inumbo-ID: 196b860b-7a91-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727194908; x=1727799708; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l5VwnyOqj7bf3/PmllkILhOPImzZKKwnyzH/iHKzTAk=;
        b=AmzdudYOMECweUI+JcTlAvTOzGELmEnmD76G8ee69A6+zqmPVJgDRAwitdORlWUsU8
         Ulzni1Mqtn5AyRZj7KvaA4g2/mbGgqh0MkKIR05f0P1njvK6FB4ICgANhFDRmmNoQw3g
         +wlFTVTSKGU8QMZ5a7sDawfkt1jTlQ22EHNP9YCrTj65F7fDaGTPWjRcaoAauEvTKbLV
         XQnukNmHPe7k2FiA33oxF2rGwrBVugDQ27FY3cHfABm4BOmSHTIycjTMipbxNQeviZ9u
         37LQU62t5AWOb/lK+qIO/Hm1pfJGolkpcW4TE+w83+mBtGi1M20/rBx4PsfX2HepbZql
         BUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727194908; x=1727799708;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5VwnyOqj7bf3/PmllkILhOPImzZKKwnyzH/iHKzTAk=;
        b=B3LBvUQzfVWO5QonMSgI1HZ7fHDJ44OdqYz3VfVkj6LhD6pBJm2e2baNgLBzdPkCW1
         zKqWqlYWQeE94DiVEQM+PtMMh6v+OjPrCZ5gpwIL69YJHB915XnEAm6+AOpbRFkT48bn
         OJsyhR21IpQbe/2vff2IRH0yDs6qu+Auus7TyGJEAvINtF4cjsQNx+I+PpAm3W0Va+qw
         TJRHj0tfXTmC9kDtyT5Wt+zt0YbkwyeYhM7NbjDSQC2JP5VwaokK1+mD+MCGqL5j0wOc
         ao1fMRSFI/Y9hekwHHhE4fpEDwg3PecHSvFK2GSXFcTjXRyCmTYFgrSlGa6pBaF3sqAD
         ZvQQ==
X-Gm-Message-State: AOJu0YyFMkpoF50yZGb7G0ujNuSxJFJHXGGhK3gSHcLkD8KEZRyHtTl5
	V01//egwtCBCv5vE2En/gHQTfNWTdtOJrBj4myweZ8OO7x86Q74EjQpEW9NrMg==
X-Google-Smtp-Source: AGHT+IGtOxl2QHzDZLpt5lbNoBE6ksMVG0Nkd2WVSpuuIEYLG2sDTcIphnQhP96yCnyhLmfesZ1Euw==
X-Received: by 2002:a05:6402:51d4:b0:5c5:b9c2:c5bd with SMTP id 4fb4d7f45d1cf-5c5b9c2c5e3mr10019683a12.4.1727194908343;
        Tue, 24 Sep 2024 09:21:48 -0700 (PDT)
Message-ID: <d77b1df7-5b05-4d54-b66e-ed90a296c091@suse.com>
Date: Tue, 24 Sep 2024 18:21:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/APIC: Remove x2APIC pure cluster mode
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Matthew Barnes <matthew.barnes@cloud.com>
References: <e43028a51f8cea02421d0856376faada8ab186d4.1726840133.git.matthew.barnes@cloud.com>
 <ZvLWSEwbdL1kpvC6@macbook.local>
 <4b7a2b84-5c5d-40e2-b20e-5c011eac7b4a@citrix.com>
 <ZvLlYp0L3Ac2O_uG@macbook.local>
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
In-Reply-To: <ZvLlYp0L3Ac2O_uG@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.09.2024 18:14, Roger Pau Monné wrote:
> On Tue, Sep 24, 2024 at 04:27:36PM +0100, Andrew Cooper wrote:
>> On 24/09/2024 4:10 pm, Roger Pau Monné wrote:
>>> On Mon, Sep 23, 2024 at 03:35:59PM +0100, Matthew Barnes wrote:
>>>> With the introduction of mixed x2APIC mode (using cluster addressing for
>>>> IPIs and physical for external interrupts) the use of pure cluster mode
>>>> doesn't have any benefit.
>>>>
>>>> Remove the mode itself, leaving only the code required for logical
>>>> addressing when sending IPIs.
>>>>
>>>> Implements: https://gitlab.com/xen-project/xen/-/issues/189
>>
>> We use the Resolves: tag for this.  Can fix on commit.
>>
>>> There's at least one extra bit which I would also like to see removed,
>>> either in this patch, or as following patch.
>>>
>>> In struct arch_irq_desc we have 3 cpumasks: cpu_mask, old_cpu_mask and
>>> pending_mask.  After dropping cluster mode for external interrupts,
>>> those fields could become integers AFACT, as now interrupts can only
>>> target a single CPU opposed to a logical CPU set.
>>
>> A separate patch for sure, but that sounds like a great improvement.
> 
> Oh, there are quite some fields of struct genapic that are not needed
> anymore, since both implementations set it to the same function.  It
> would be helpful to prune them.

Pruning where possible - yes. But "both" won't cover it, as we have 4
instances of the struct (not just the two x2apic ones).

Jan


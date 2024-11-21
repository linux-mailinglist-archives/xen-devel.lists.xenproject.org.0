Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D81E59D4B66
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 12:14:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841372.1256861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE58q-0004KV-IZ; Thu, 21 Nov 2024 11:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841372.1256861; Thu, 21 Nov 2024 11:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE58q-0004IE-Fs; Thu, 21 Nov 2024 11:14:32 +0000
Received: by outflank-mailman (input) for mailman id 841372;
 Thu, 21 Nov 2024 11:14:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XSdi=SQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tE58p-0004I6-8K
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 11:14:31 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c49e4e02-a7f9-11ef-99a3-01e77a169b0f;
 Thu, 21 Nov 2024 12:14:26 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a9ef275b980so131662666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 03:14:26 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa4f42d31fbsm68394966b.98.2024.11.21.03.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 03:14:25 -0800 (PST)
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
X-Inumbo-ID: c49e4e02-a7f9-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzAiLCJoZWxvIjoibWFpbC1lajEteDYzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM0OWU0ZTAyLWE3ZjktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMTg3NjY2LjEwNTk5MSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732187665; x=1732792465; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vshi0zBKDSnXJmh5OBPnmLtzODhuYoL72uY4hMwlCec=;
        b=hjDCqdwQ+m1bHv1aBhTA6HTWfPQW6D5NKhZWuB/bySmR/t82hcXoSzygqEgUL29d81
         CeeVFY7XNNGyrvJmAsVp1qo8Vdz2tderpjDAWmX3VbDilaocEKbt4YT/INGeQeB0RunM
         WGXK67bmZDwcDCT2wf3JRdTKpKwhAl46pkhFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732187665; x=1732792465;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vshi0zBKDSnXJmh5OBPnmLtzODhuYoL72uY4hMwlCec=;
        b=EJr2BRWMQewJB0QxIihtqWLmUqtlvh+cg57PjvuuIl6FPfPjYpssiMYG1gB34la3DZ
         VgRzD/c1DIZ7yOxgQ4feHPTZ8FU98qu3iG90eIisyV5FMhek7jHTvC2282yObfWjSV03
         0NvXBgowrgQhH2RtxlfUFqybq2xM9FDnUXvxIlSv7A84qc8Dx1dvTD8MtfOtGx+xZSfs
         n4qSx5hGLTy2VH7HPmziuRBrqVoDP0oXzydYwz7YmcSU6qwykziLMniMkoSUUBHlu0TL
         qhV/pi2DLTupE+Rsr2YTYmsQHj4+VYEdCbkMxWsYR4weGdsQiftRv24wCOnLgDMu/OQf
         ySvA==
X-Gm-Message-State: AOJu0Yw9Dyjax7jZqSCBnBsZ2knfDlzzKS8Nk7a5JtrXncgMYDOspTTS
	qY8qXknHdBYr2ivSKw2QEaFJ5DWwLuayo1GEcEv3G1MLbTrw6YhgSL5Kpz8mTF8=
X-Google-Smtp-Source: AGHT+IHwFhkIV3CCOdONAlErrWUbHKTYX88Jw1TxSFhlDDQ/lbRCFc+ZOVwQE8EuL5ESACAhNgbruw==
X-Received: by 2002:a17:906:fd88:b0:a9a:c57f:9666 with SMTP id a640c23a62f3a-aa4dd530d20mr461626566b.2.1732187665549;
        Thu, 21 Nov 2024 03:14:25 -0800 (PST)
Message-ID: <28111c22-e4f6-4714-a112-f07109bb5940@citrix.com>
Date: Thu, 21 Nov 2024 11:14:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/pvh: also print hardware domain pIRQ limit for
 PVH
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <20241120113555.38146-1-roger.pau@citrix.com>
 <20241120113555.38146-3-roger.pau@citrix.com>
 <25fb7dfe-50e0-446a-9057-050fd3c2edb2@suse.com> <Zz8UsJ4nJXyExQ53@macbook>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Zz8UsJ4nJXyExQ53@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/11/2024 11:08 am, Roger Pau Monné wrote:
> On Thu, Nov 21, 2024 at 11:54:49AM +0100, Jan Beulich wrote:
>> On 20.11.2024 12:35, Roger Pau Monne wrote:
>>> Do not return early in the PVH/HVM case, so that the number of pIRQs is also
>>> printed.
>> What you're printing ...
>>
>>> Fixes: 17f6d398f765 ('cmdline: document and enforce "extra_guest_irqs" upper bounds')
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>>  xen/arch/x86/io_apic.c | 12 +++++++-----
>>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
>>> index bd5ad61c85e4..d9db2efc4f58 100644
>>> --- a/xen/arch/x86/io_apic.c
>>> +++ b/xen/arch/x86/io_apic.c
>>> @@ -2754,11 +2754,13 @@ unsigned int __hwdom_init arch_hwdom_irqs(const struct domain *d)
>>>  
>>>      /* PVH (generally: HVM) can't use PHYSDEVOP_pirq_eoi_gmfn_v{1,2}. */
>>>      if ( is_hvm_domain(d) )
>>> -        return nr_irqs;
>>> -
>>> -    if ( !d->domain_id )
>>> -        n = min(n, dom0_max_vcpus());
>>> -    n = min(nr_irqs_gsi + n * NR_DYNAMIC_VECTORS, max_irqs);
>>> +        n = nr_irqs;
>> ... is rather the number of IRQs we picked for the system. That may happen to
>> end up being the upper bound for PVH Dom0, yet not logging this at all was
>> because of the limited use pIRQ-s have there. Granted at the time I was still
>> under the impression they have no use there at all, so this isn't really an
>> objection to the change. I would have been nice though if the description had
>> mentioned why significance pIRQ-s actually have in PVH Dom0.
> Sure, what about adding to the commit message:
>
> "While PVH dom0 doesn't have access to the hypercalls to manage pIRQs
> itself, neither the knowledge to do so, pIRQs are still used by Xen to
> map and bind interrupts to a PVH dom0 behind its back.  Hence the
> pIRQ limit is still relevant for a PVH dom0."

Minor grammar point.  You want "nor" rather than "neither" in this
context, because it's introducing the second of two negative things.

~Andrew


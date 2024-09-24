Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 931CC984ACC
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 20:21:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803296.1213814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stA9Z-0007gX-9z; Tue, 24 Sep 2024 18:20:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803296.1213814; Tue, 24 Sep 2024 18:20:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stA9Z-0007dc-6U; Tue, 24 Sep 2024 18:20:49 +0000
Received: by outflank-mailman (input) for mailman id 803296;
 Tue, 24 Sep 2024 18:20:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4pT6=QW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1stA9Y-0007dW-I1
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 18:20:48 +0000
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [2a00:1450:4864:20::243])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b83003db-7aa1-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 20:20:47 +0200 (CEST)
Received: by mail-lj1-x243.google.com with SMTP id
 38308e7fff4ca-2f754d4a6e4so58714911fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 11:20:47 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f50b26sm115234366b.61.2024.09.24.11.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 11:20:45 -0700 (PDT)
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
X-Inumbo-ID: b83003db-7aa1-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727202046; x=1727806846; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=28UM27WU10UowPozqt+thUqjX0cVVL3NtF4rEFE5HBo=;
        b=DnWK4R/pDsl9PIoroI59AKJR6oKSNXsVWpwMdqHjmyOz7HCFSso5mOZuWSdI4xBwkg
         bcwCwAyVdY+cgIr6U9fZc0wT/RFwjxzQvZzGnxiICIx+3o1WsaFy4SrFXaFIv2uLxSZ3
         rtzR+OavElRT+fTddOT9pUCKEsiMDOrlU+AIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727202046; x=1727806846;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28UM27WU10UowPozqt+thUqjX0cVVL3NtF4rEFE5HBo=;
        b=SjKgGfkN0id//277hnsedHHXhtlcSS7k2fVgyuQxhVdF1BeezBxMLihLjcPgYe5svm
         b8Uyj7GbctXXjL630TL0hAGNZ/W53u0PqbttmofpGsG6DDxlHMCpZYMp2VTxLCQhBFh2
         WvbhCIDvQKm+SV9d1giAy5LFu1MffI1YDgeQFX2F0yjcQI2UpxYaJUcDGfz74CjMvBnT
         SncACQUji+nJFiyurl/bT0MaoGR7ctw1Z4usXpnHi238bKfXWtJ5+Yd/YFq7zsICmMgN
         PUb4fb0JSEnLYep/ZbMNy606TQRy6cMn8FC8bX1DobZQ+HrOkaWj9DNa1olyaoG907Pj
         CPSw==
X-Gm-Message-State: AOJu0YxRHA3ger1W1Ix1auK1ZLAsbkQ719cg0X3rKnG9MHur1o6G8Qj/
	+RiDC9VGUm64kKhQzS4u0VcrUAZW9Vh7G8IpPdOPy/LAKq3ODKEvwnVFPcTmCw4=
X-Google-Smtp-Source: AGHT+IGk58TlZtjbDa1zXiKBZ1t85JXvujZqea3UXZNLPOWNBBXf6xYEYOiDVEpj8Sq8Vv/Cz03w/Q==
X-Received: by 2002:a05:6512:3a94:b0:52e:ff2a:217 with SMTP id 2adb3069b0e04-536ad3eb9a4mr9058317e87.50.1727202046421;
        Tue, 24 Sep 2024 11:20:46 -0700 (PDT)
Message-ID: <22a3542c-7eb4-41fe-8c60-d9a71bd9fa4f@citrix.com>
Date: Tue, 24 Sep 2024 19:20:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/APIC: Remove x2APIC pure cluster mode
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Matthew Barnes <matthew.barnes@cloud.com>
References: <e43028a51f8cea02421d0856376faada8ab186d4.1726840133.git.matthew.barnes@cloud.com>
 <ZvLWSEwbdL1kpvC6@macbook.local>
 <4b7a2b84-5c5d-40e2-b20e-5c011eac7b4a@citrix.com>
 <ZvLlYp0L3Ac2O_uG@macbook.local>
 <d77b1df7-5b05-4d54-b66e-ed90a296c091@suse.com>
 <ZvLyaSqZegiPyv6B@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZvLyaSqZegiPyv6B@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/09/2024 6:10 pm, Roger Pau Monné wrote:
> On Tue, Sep 24, 2024 at 06:21:47PM +0200, Jan Beulich wrote:
>> On 24.09.2024 18:14, Roger Pau Monné wrote:
>>> On Tue, Sep 24, 2024 at 04:27:36PM +0100, Andrew Cooper wrote:
>>>> On 24/09/2024 4:10 pm, Roger Pau Monné wrote:
>>>>> On Mon, Sep 23, 2024 at 03:35:59PM +0100, Matthew Barnes wrote:
>>>>>> With the introduction of mixed x2APIC mode (using cluster addressing for
>>>>>> IPIs and physical for external interrupts) the use of pure cluster mode
>>>>>> doesn't have any benefit.
>>>>>>
>>>>>> Remove the mode itself, leaving only the code required for logical
>>>>>> addressing when sending IPIs.
>>>>>>
>>>>>> Implements: https://gitlab.com/xen-project/xen/-/issues/189
>>>> We use the Resolves: tag for this.  Can fix on commit.
>>>>
>>>>> There's at least one extra bit which I would also like to see removed,
>>>>> either in this patch, or as following patch.
>>>>>
>>>>> In struct arch_irq_desc we have 3 cpumasks: cpu_mask, old_cpu_mask and
>>>>> pending_mask.  After dropping cluster mode for external interrupts,
>>>>> those fields could become integers AFACT, as now interrupts can only
>>>>> target a single CPU opposed to a logical CPU set.
>>>> A separate patch for sure, but that sounds like a great improvement.
>>> Oh, there are quite some fields of struct genapic that are not needed
>>> anymore, since both implementations set it to the same function.  It
>>> would be helpful to prune them.
>> Pruning where possible - yes. But "both" won't cover it, as we have 4
>> instances of the struct (not just the two x2apic ones).
> Yeah, realized that afterwards, we still have the xAPIC flat mode,
> which is using logical delivery mode, but target a single CPU.  So
> getting rid of the cpumask in arch_irq_desc seem possible, however
> there might be nothing to prune in struct genapic.

Logical delivery mode for external interrupts in xAPIC is just as
broken/useless as the code we've just deleted.

If that's the only thing in the way of more cleanup, we delete it too.

~Andrew


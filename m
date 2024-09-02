Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B3F968336
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 11:29:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787689.1197130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl3Mh-0006ny-K9; Mon, 02 Sep 2024 09:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787689.1197130; Mon, 02 Sep 2024 09:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl3Mh-0006mR-Fz; Mon, 02 Sep 2024 09:28:51 +0000
Received: by outflank-mailman (input) for mailman id 787689;
 Mon, 02 Sep 2024 09:28:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uQw9=QA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sl3Mf-0006mJ-L8
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 09:28:49 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2250e01-690d-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 11:28:48 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8692bbec79so448521566b.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 02:28:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891db563sm531519666b.185.2024.09.02.02.28.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 02:28:47 -0700 (PDT)
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
X-Inumbo-ID: c2250e01-690d-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725269328; x=1725874128; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QK8zYTD28QUOjl8I5AAlJSih0tNbGoYepz/T76HatYc=;
        b=W322omtWLhFXHu1/Ndc+6Ksituidl4rsp2/CwnBgtMEMTF4QyjTqrwD7rskK09WqIs
         Yu+rGJr4HWar7VlDiC+lZcgoLiBqria9b2baeFnb++dhLetXmkeeXh9z8xUGhTHBNyRg
         f0qVBruGj+fv8bL+EtOxaaMyulR9u1O06GVnPsB6oV23SNPYP04N2WKS3z9ppiJaUbTB
         izTdQqzBBLzTpKS913NJQXaRTQovFig7ovp+UV9oR1cgkJo9MsGdS+zWOPOGY2soisVO
         gXLXQovXGjyYU5R4DiXl/qCCnrO46N45S1Nu23XNiaiZet2PPxNIYAcijDSYJEaZrFD3
         qoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725269328; x=1725874128;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QK8zYTD28QUOjl8I5AAlJSih0tNbGoYepz/T76HatYc=;
        b=SubVR1GAQjm2YuwTOCpsuJ+n/zyRcwMBu99WwaU50wXPGM72TFQwCqdo95b3BSMSEk
         ZO684Le9ogxvc2jlBaBD2viqFIuMFlBXYc08Ebu4zLgk4jYmDxU8H69KKQwy+aDVpN8v
         VztVLBra/9kBbC2+e2PML2bJJOVoK2gbaMuLKscvC/i9UewfMhciHXzKM8drO1NFS49l
         QaQ/T9AHf0HNbcgSiOOEr+GmNdrovn5o+bYSvIH9Nm+QTi/G7WeD+1G8vTOdPl5xCj+8
         w6qiLNVV2yVTWZHyNmkJpgWaJcJWUnbop1tPHm71WTihma99HSd++m7IyB1TH2muzS0q
         s42Q==
X-Gm-Message-State: AOJu0YxvnbJQ2EFTPieZPrU5zpKUcVeub2iVjivjwdeffH/t7ggLEEyW
	eB6/SBGRFK+AJqTWmo1AAn0dkYfoZnH1bfZxTTSp/2A2zyjohSrEPEBG16Yw1Q==
X-Google-Smtp-Source: AGHT+IF1o+fyyiTfLQD7BYCBjV4CP8h/wKiM/mlMcDKqch7+zV26J2GsINZ/5R3cuefJsXq8sF39IQ==
X-Received: by 2002:a17:906:fd8b:b0:a86:968b:e9c1 with SMTP id a640c23a62f3a-a89a34e4375mr670787966b.5.1725269327822;
        Mon, 02 Sep 2024 02:28:47 -0700 (PDT)
Message-ID: <66fb71e9-c603-4ec9-ab41-9af2a82863f0@suse.com>
Date: Mon, 2 Sep 2024 11:28:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IOREQ completions for MMIO writes
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <f4551fc8-d0c0-492c-8ad3-b045843af381@amd.com>
 <f6bfba53-3a17-4da2-ac45-50b7b2175eb2@citrix.com>
Content-Language: en-US
Cc: Xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <f6bfba53-3a17-4da2-ac45-50b7b2175eb2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.08.2024 19:31, Andrew Cooper wrote:
> On 29/08/2024 5:08 pm, Jason Andryuk wrote:
>> Hi Everyone,
>>
>> I've been looking at ioreq latency and pausing of vCPUs.  Specifically
>> for MMIO (IOREQ_TYPE_COPY) writes, they still need completions:
>>
>> static inline bool ioreq_needs_completion(const ioreq_t *ioreq)
>> {
>>     return ioreq->state == STATE_IOREQ_READY &&
>>            !ioreq->data_is_ptr &&
>>            (ioreq->type != IOREQ_TYPE_PIO || ioreq->dir != IOREQ_WRITE);
>> }
>>
>> state == STATE_IOREQ_READY
>> data_is_ptr == 0
>> type == IOREQ_TYPE_COPY
>> dir == IOREQ_WRITE
>>
>> To a completion is needed.  The vCPU remains paused with
>> _VPF_blocked_in_xen set in paused_flags until the ioreq server
>> notifies of the completion.
>>
>> At least for the case I'm looking, a single write to a mmio register,
>> it doesn't seem like the vCPU needs to be blocked.  The write has been
>> sent and subsequent emulation should not depend on it.
>>
>> I feel like I am missing something, but I can't think of a specific
>> example where a write needs to be blocking.  Maybe it simplifies the
>> implementation, so a subsequent instruction will always have a ioreq
>> slot available?
>>
>> Any insights are appreciated.
> 
> 
> This is a thorny issue.
> 
> In x86, MMIO writes are typically posted, but that doesn't mean that the
> underlying layers can stop tracking the write completely.
> 
> In your scenario, consider what happens when the same vCPU hits a second
> MMIO write a few instructions later.  You've now got two IOREQs worth of
> pending state, only one slot in the "ring", and a wait of an unknown
> period of time for qemu to process the first.
> 
> 
> More generally, by not blocking you're violating memory ordering.
> 
> Consider vCPU0 doing an MMIO write, and vCPU1 doing an MMIO read, and
> qemu happening to process vCPU1 first.
> 
> You now have a case where the VM can observe vCPU0 "completing" before
> vCPU1 starts, yet vCPU1 observing the old value.
> 
> Other scenarios which exist would be e.g. a subsequent IO hitting STDVGA
> buffering and being put into the bufioreq ring.  Or the vCPU being able
> to continue when the "please unplug my emulated disk/network" request is
> still pending.

Or, in generalized terms, any writes having side effects.

> In terms of what to do about latency, this is one area where Xen does
> suffer vs KVM.
> 
> With KVM, this type of emulation is handled synchronously by an entity
> on the same logical processor.  With Xen, one LP says "I'm now blocked,
> schedule something else" without any idea when the IO will even be
> processed.
> 
> 
> One crazy idea I had was to look into not de-scheduling the HVM vCPU,
> and instead going idle by MONITOR-ing the IOREQ slot.
> 
> This way, Qemu can "resume" the HVM vCPU by simply writing the
> completion status (and observing some kind of new "I don't need an
> evtchn" signal).  For a sufficiently quick turnaround, you're also not
> thrashing the cache by scheduling another vCPU in the meantime.
> 
> It's definitely more complicated.  For one, you'd need to double the
> size of an IOREQ slot (currently 32 bytes) to avoid sharing a cacheline
> with an adjacent vCPU.

Iirc we talked about moving to a full page per vCPU anyway, back in Prague.

As to more complicated - I'd be curious how you would mean to avoid abuse.
Even without considering abuse attempts, qemu becoming de-scheduled would
already look to be problematic as to holding up an MWAITing pCPU for too
long. Some sensible heuristic towards some form of timeout would likely be
difficult to come up with (both helping performance and avoiding issues).

Jan


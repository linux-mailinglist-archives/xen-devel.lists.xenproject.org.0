Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ANlKQ1Nk2mi3AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 17:59:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2B5146861
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 17:59:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234440.1537711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs1wT-0001rH-KQ; Mon, 16 Feb 2026 16:59:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234440.1537711; Mon, 16 Feb 2026 16:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs1wT-0001oX-Go; Mon, 16 Feb 2026 16:59:25 +0000
Received: by outflank-mailman (input) for mailman id 1234440;
 Mon, 16 Feb 2026 16:59:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NroF=AU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vs1wT-0001oR-1F
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 16:59:25 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d59734b8-0b58-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 17:59:19 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4836f363ad2so38234515e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 08:59:19 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48370a3eb7asm135273915e9.1.2026.02.16.08.59.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 08:59:18 -0800 (PST)
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
X-Inumbo-ID: d59734b8-0b58-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771261159; x=1771865959; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uKLXzR3NtC17TftTVJuJ/gUwX0BawCtk9Zmv12qDK2k=;
        b=mVZZ5dNl/362e2YP8jrXeF1r94047PCaMnyqHasx74GQc7BCjcYwSqUjRg7phE+PfF
         ge5P1J2NnWx1a0UYMPnBLIdoWtc93ZYsUU+U3HNG3lM9VPuuVqsu6fOns8ObT7U3Rr0U
         VdATH9OyBJ+VPcbuAglQn75RFx0BzlbpeqmSLt45Y7DHSmLECmhMwoEmLJ0rSNvDlXx0
         vDjPpU+MLVADI8YHAS3EK3IhPVMX91j8iexYFMDjlkEw7MNRRTBvtwV6l3JI4LNDMBxq
         myp3+n+qqDYC0hbiwBgdNKpiIGRH8JYb1i/xW67q3l9dwXSRxDnPu0IwF0WPQEzApUpv
         Djlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771261159; x=1771865959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKLXzR3NtC17TftTVJuJ/gUwX0BawCtk9Zmv12qDK2k=;
        b=kh2Vngh+2D9QEfigkbGrtt3JWM+naHxm+KRaYJijeDPkFnOakfBTSKTCiyGjKHFq0y
         cEDSJWgYxIlqU+yBnLjJGitMwTDgvSiHhnvSogLceebMXzWNbzT5szJUO61x7sf2fQ4k
         Avgf5cjnJsw8y0HCVAir7bsmTPKxg8SOb158z/4NWu5BujAsS16aUNNdO+LXfHd9WmlI
         +cN+qiq82tIRs8TrqoUHEuyNao8uEgrwmjT/ytLltq6orgsXxMER+NGfdlK+hANJL/sa
         RWDW+7UqBHWD8x+a0QQrXrzV3bm/wn9W3XWfc11+Nwf2PcoG3yAl9L/UcgzBf1ZEzsQQ
         GQSg==
X-Forwarded-Encrypted: i=1; AJvYcCVQC6hJjzo332hFpEFZ7nxSKslasVSusktWkqLQtI2KmUEcMXeVHGQKsnlZTK7xHCHWT1a8uCUTSQQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPAjxbonHULBgXUm9cQLkjSOHk1gC9SDheD033Xz2i+xepb8LL
	Ysr+ug40JF+2AV8gwfrdeUpC7sXxUkVPZ0Z1Vef9El9qCSUoQJHEPTMl
X-Gm-Gg: AZuq6aIAL6IgT0+gy2ohzKa7znAZ71ZhpvQBWkyeMcS7EIuNiIAzCdK/LS9B9FHVIGw
	T+a5dP+FW0IvhmdmMXVMwj6qGh7VVdcRzBvCqa8DoiA/FCHhuc2Z2/aLyc7JSQNghxRMhnKcKzM
	ZX4gLABFo9zRaNXEqayTIQrKqaQ/8UQJ+5d/T5k3ddWHcKpW/eIgktcjQDoxQZcXL7fyjr7JUoK
	go5k3B97P5mqHAwk0Mf8zRoosSjZ7KYl0cC61IMcRhL3KLokTVR8uXQFDAWm62PDEZzdSNhrbwI
	XbY9mUJYKfUyE2QaLJjEEh1ZBlRezkmz/VJiLEnpXiaaNI3E9rg6vOLOchYCoGGTRmWO0HBWeOy
	//WP70xRoEvJMHGQSMrqEKkNpZYmlO/pQp7NZL3xfG5yMlrgV8bVPSx6+y/piD7PpFAnEwOJ2GB
	4ITzbjcGbHweew7KHzEwBOU6A3XvN7nLxe1QphqjmJpywsC87OxwB1iNGxLEknN4VSuNCuRkZ8K
	/NJhZAIHCk1+g==
X-Received: by 2002:a05:600c:1384:b0:47e:e414:b915 with SMTP id 5b1f17b1804b1-483739ff99bmr163127125e9.2.1771261158777;
        Mon, 16 Feb 2026 08:59:18 -0800 (PST)
Message-ID: <2bab05da-4f19-4fbd-8a06-5113ac4cded8@gmail.com>
Date: Mon, 16 Feb 2026 17:59:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/riscv: add p2m context switch handling for VSATP
 and HGATP
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <be3d3793e78b8cfebfdd02361064bf7321b5f2ef.1770999879.git.oleksii.kurochko@gmail.com>
 <0f7e5a73-a574-4aa2-80c7-b45d08b9d6b0@suse.com>
 <f4400580-65b8-4dc2-a11a-443840bcb162@gmail.com>
 <cf7c146f-ab1c-4574-ab2b-e0d96ea80db4@suse.com>
 <f43f99f6-a9cf-4217-953a-f1f449194e6a@gmail.com>
 <a55d1c35-90fe-4b25-b10d-1ab33d6b8efe@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a55d1c35-90fe-4b25-b10d-1ab33d6b8efe@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0B2B5146861
X-Rspamd-Action: no action


On 2/16/26 5:20 PM, Jan Beulich wrote:
> On 16.02.2026 16:57, Oleksii Kurochko wrote:
>> On 2/16/26 4:45 PM, Jan Beulich wrote:
>>> On 16.02.2026 16:34, Oleksii Kurochko wrote:
>>>> On 2/16/26 12:50 PM, Jan Beulich wrote:
>>>>> On 13.02.2026 17:29, Oleksii Kurochko wrote:
>>>>>> Introduce helpers to manage VS-stage and G-stage translation state during
>>>>>> vCPU context switches.
>>>>>>
>>>>>> As VSATP and HGATP cannot be updated atomically, clear VSATP on context
>>>>>> switch-out to prevent speculative VS-stage translations from being associated
>>>>>> with an incorrect VMID. On context switch-in, restore HGATP and VSATP in the
>>>>>> required order.
>>>>>>
>>>>>> Add p2m_handle_vmenter() to perform VMID management and issue TLB flushes
>>>>>> only when required (e.g. on VMID reuse or generation change).
>>>>>>
>>>>>> This provides the necessary infrastructure for correct p2m context switching
>>>>>> on RISC-V.
>>>>>>
>>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>>> ---
>>>>>> Changes in v3:
>>>>>>     - Add comment above p2m_ctxt_switch_{to, from}().
>>>>> I find these and other speculation related comments problematic: You can't
>>>>> prevent every kind of speculation that way, yet all these comments are
>>>>> written as if that was the case. What I think you mean in all cases is
>>>>> speculation using the wrong set of page tables?
>>>> According to the RISC-V spec:
>>>>      No mechanism is provided to atomically change vsatp and hgatp together. Hence, to
>>>>      prevent speculative execution causing one guest’s VS-stage translations to be cached
>>>>      under another guest’s VMID, world-switch code should zero vsatp, then swap hgatp, then
>>>>      finally write the new vsatp value
>>>>
>>>> Based on that my understand is that the following code could provide an issue:
>>>> (1) csr_write(CSR_SEPC, guest_b->sepc);   ...   (2) csr_write(CSR_VSATP,
>>>> 0);   csr_write(CSR_HATP, guest_b->hgatp);   csr_write(CSR_VSATP,
>>>> guest_b->vsatp); As IIUC speculation could happen between (1) and (2)
>>>> and we could have some VS-stage translations connected to SEPC'c of
>>>> guest B but with address from guest A page tables. So just to be sure
>>>> that such isuse won't happen I wrote a comment that first VSATP, then
>>>> others CSRs then setting hgatp and vsatp for new guest.
>>> This reply doesn't address the point raised above, it also ...
>> Okay, then just answering on a question above directly - yes, it is about the using of
>> the wrong set of page tables.
> Which is what I'm asking to clarify in those comments.
>
>>>>>> --- a/xen/arch/riscv/p2m.c
>>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>>> @@ -1434,3 +1434,82 @@ struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
>>>>>>     
>>>>>>         return get_page(page, p2m->domain) ? page : NULL;
>>>>>>     }
>>>>>> +
>>>>>> +/* Should be called before other CSRs are stored to avoid speculation */
>>>>>> +void p2m_ctxt_switch_from(struct vcpu *p)
>>>>> What interaction with the storing of other CSRs would be problematic?
>>>> Please, look at the reply above.
>>> ... doesn't apply here, but ...
>> Probably then I misunderstood your question.
>>
>> Technically, it wouldn't problematic to write CSRs in any order (even we can ignore
>> setting of VSTAP to 0), but it will (at least, based on example above) lead to that
>> we will want to have TLBs flush.
> Why? Storing the CSRs doesn't alter the values held in those registers.
> Taking your earlier example with EPC, storing it ahead of clearing VSATP
> will leave as wide a window for speculation as will storing it afterwards.
> In both cases the window will close when VSATP is cleared. As per my
> current understanding, that is.

Oh, you are right. It doesn't really matter when clearing of VSATP is happening during
CSR's storing procedure as CSRs aren't changed, so it is just necessary to set VSATP
to 0 before CSR's restoring.

I just confused myself with my own example as it is basically about restoring but
I missed that I am commenting CSR's storing procedure...

Thanks.

~ Oleksii



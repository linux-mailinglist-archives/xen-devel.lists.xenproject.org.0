Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FV3AfX8jWm0+AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:16:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BF912F422
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:16:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229435.1535385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZMv-0002tv-MK; Thu, 12 Feb 2026 16:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229435.1535385; Thu, 12 Feb 2026 16:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZMv-0002rU-Gu; Thu, 12 Feb 2026 16:16:41 +0000
Received: by outflank-mailman (input) for mailman id 1229435;
 Thu, 12 Feb 2026 16:16:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XV9D=AQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqZMt-0002rO-VR
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 16:16:40 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 358fe4b7-082e-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 17:16:38 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48069a48629so191345e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 08:16:38 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835d99497asm194211995e9.6.2026.02.12.08.16.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 08:16:37 -0800 (PST)
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
X-Inumbo-ID: 358fe4b7-082e-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770912998; x=1771517798; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uN40rx4rGlPLwnhhxYNLkE2u+9FnasYUc+/ZaURu7vo=;
        b=LrsfIRQT9ZoAtLFFVaQWShoOTjLRbmGt6tbfJxOgK3sNw5DjnyCv2V+vzpI57LgYSY
         CLNEQQROStnDJe9f5PtPepfPWnKuc5TiZVAR4zBz9NCh8xZqLKdlhCqBkSuWiOdaUAUG
         mOBYcaRsBCF//jX8ajTiTZwzE8NQTe3sDTaKlguz/pgwURwTFBasQCVWKuZjQBPfv4di
         dJ3bICnt+0uc/VwpR9ARX1lqf0CrNj0mRERrUZMs49lEoJmCFdvyJzwV/IP4w4GTRvlC
         hNYDU8K6pCezxJQYqLW/OrqobkcUaw1+TK96GBMXjSudKThD9YzfcNzaL4jeQX+zvDX5
         lHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770912998; x=1771517798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uN40rx4rGlPLwnhhxYNLkE2u+9FnasYUc+/ZaURu7vo=;
        b=stFNNTW15J6j8sFwP803fgNUxWRNS30SjWZormw6H/govTygf8Lq5G5LZRe3rsj5U2
         Pu/qGhLe0V47FfMbbmFx2LZ9jtIYtuf1jIcLUO2HfObBBwMTu9W1Aachu0YtYasIaqLG
         7NQ0xf3RfN/eSY0oQuB1LPC5pp1SdZYroVRronayGQVjuxrgJ3NMH/QVxG0N7m7LHnMe
         wOgq/vYrDG/TdePQ7CukZsd2NgWd0F/I8/YirmrNlvBJX06kXl68ok9YBbJORqDsZ960
         fcyZa2JNSVxkmzxc5K2qJJLMbSA1zJBoCsfo01wUh1gzOq9w9/kfiHH/tutKp1Geg4Mc
         imtg==
X-Forwarded-Encrypted: i=1; AJvYcCXcco45WF54+HJAvtQtfkToM8GhtdJDFY0YthhbM9+4CsAmoXpXj5pbQ1jm8F5UsU9pHZ1ZzE0iz6U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSin23JLVFplH2ECMklSHULpwclkIkfwLejjS7kMoUelJTsmNv
	fg2nCgnuG9XLee86ctCB9OC3YnbMYjpJg9AUDrwEGsGs5Ns2lhvRzvKz
X-Gm-Gg: AZuq6aKroqGdBINrbMSf58qL29lhjTrCtNFHihSLsrWIZNUxeohpiftK5GfAFpEkmq7
	tZBt5ugO5r2B/KwgKXO63r4hQRbFzo6HbvNwgO0xn78K8k+z2EjUQu7bPf4d/tIdFz/opi6+2vl
	/w21FGp+nNJ30hIwc6fzLdLrOXYt3F4Zq58/wfliyEpu4NTqtnXkLp6bwyeWKenG3Y4r2liSjjI
	zBcCE9rikE6vla6V61lW+FXNMLUwIF1yTBP2EZi2mLyUDxfmE9lpYp3JuSEHUPFuAGE9trlgsI+
	s5cZfETdrY2Mh3mCaThURFQ21ZjQaNg3F2X8BuGCpaUPviAoumnw4QxFxDrjt62cxit4yeExwIQ
	5yH1F7F8BsVq0OuzggAIINjFjNmxf1cq2bzh0nxe8QeRdDKbENEzB8Al4zLc/UmLSSI8wXd+lKz
	YMfan2B21LweIrV2NVAk+XirApcXg3FVYhjpPZdq0O36+Dlt9wgRIOtt0z3fFQmSB/1kOqDIazL
	3vARN9wyJqGwA==
X-Received: by 2002:a05:600c:34c5:b0:477:63b5:7148 with SMTP id 5b1f17b1804b1-483656ab45fmr55784205e9.6.1770912997640;
        Thu, 12 Feb 2026 08:16:37 -0800 (PST)
Message-ID: <909969c1-1d75-4f45-a96b-54c1c28839df@gmail.com>
Date: Thu, 12 Feb 2026 17:16:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/riscv: add p2m context switch handling for
 VSATP and HGATP
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770739000.git.oleksii.kurochko@gmail.com>
 <0e6f450d64ce17f504d73c3429c8e8a9ced0cf06.1770739000.git.oleksii.kurochko@gmail.com>
 <7cec918c-bd58-4013-9ec2-d43ff7afcd7c@suse.com>
 <099768df-ec44-454f-8a9e-4897d81309f9@gmail.com>
 <ba48bef0-551e-4ea7-8d9a-fb54b9b85da6@suse.com>
 <4f9953ae-8722-4971-a214-6c40f7f5859a@gmail.com>
 <45e8aa5a-842b-49d0-8744-71295cf0a0b6@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <45e8aa5a-842b-49d0-8744-71295cf0a0b6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 67BF912F422
X-Rspamd-Action: no action


On 2/12/26 4:42 PM, Jan Beulich wrote:
> On 12.02.2026 15:47, Oleksii Kurochko wrote:
>> On 2/12/26 1:56 PM, Jan Beulich wrote:
>>> On 12.02.2026 12:57, Oleksii Kurochko wrote:
>>>> On 2/12/26 11:16 AM, Jan Beulich wrote:
>>>>> On 10.02.2026 17:36, Oleksii Kurochko wrote:
>>>>>> --- a/xen/arch/riscv/p2m.c
>>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>>> @@ -1434,3 +1434,126 @@ struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
>>>>>>     
>>>>>>         return get_page(page, p2m->domain) ? page : NULL;
>>>>>>     }
>>>>>> +
>>>>>> +void p2m_ctxt_switch_from(struct vcpu *p)
>>>>>> +{
>>>>>> +    if ( is_idle_vcpu(p) )
>>>>>> +        return;
>>>>>> +
>>>>>> +    /*
>>>>>> +     * No mechanism is provided to atomically change vsatp and hgatp
>>>>>> +     * together. Hence, to prevent speculative execution causing one
>>>>>> +     * guest’s VS-stage translations to be cached under another guest’s
>>>>>> +     * VMID, world-switch code should zero vsatp, then swap hgatp, then
>>>>>> +     * finally write the new vsatp value what will be done in
>>>>>> +     * p2m_handle_vmenter().
>>>>>> +     */
>>>>>> +    p->arch.vsatp = csr_swap(CSR_VSATP, 0);
>>>>>> +
>>>>>> +    /*
>>>>>> +     * Nothing to do with HGATP as it is constructed each time when
>>>>>> +     * p2m_handle_vmenter() is called.
>>>>>> +     */
>>>>>> +}
>>>>>> +
>>>>>> +void p2m_ctxt_switch_to(struct vcpu *n)
>>>>>> +{
>>>>>> +    if ( is_idle_vcpu(n) )
>>>>>> +        return;
>>>>>> +
>>>>>> +    n->domain->arch.p2m.is_ctxt_switch_finished = false;
>>>>> How can the context switch of a vCPU affect domain-wide state?
>>>> It is wrong to have is_ctxt_switch_finished per domain, it should be
>>>> vCPU field.
>>>>
>>>>>> +    /*
>>>>>> +     * Nothing to do with HGATP or VSATP, they will be set in
>>>>>> +     * p2_handle_vmenter()
>>>>>> +     */
>>>>> Why can this not be done here?
>>>> As VMID should be calculated on VM enter.
>>> And I didn't suggest to calculate a new one here.
>>>
>>>> We can update HGATP and VSATP here with VMID stored before in p2m_ctxt_switch_from(),
>>>> but then it is possible when vmid_handle_vmenter() will be called before VM entry
>>>> VMID could be changed and it will be needed again to update HGATP and VSATP what
>>>> will lead to flushing of VS TLB twice (one in p2m_ctxt_switch_to() and another one
>>>> in p2m_handle_vmenter()).
>>> Is this a concern resulting from particular logic you expect to appear
>>> in the window between context switch and entering the guest, or is this
>>> merely an abstract concern?
>> If we will have VS TLB flush unconditionally in VM entry then it is merely an
>> abstract concern.
> Why would we want to flush unconditionally?

To guarantee that a guest sees a clean switch with no possibilities of 
using a stale entry. For example, if VMID changed between context switch 
and VM entry we want to have flush, but considering your reply here ...

>
>> Otherwise, considering that speculation could happen between
>> context switch and VM entry what could lead to that some entries were added to
>> VS TLB flush with old VMID in the case if then in VM entry vCPU might receive new
>> VMID.
> I don't understand: Context switch leaves vsatp.MODE at zero. Nothing can end
> up in the VS TLB in that case, aiui

... we just have different implementation in mind for p2m_ctxt_switch_to().

I thought that your suggestion is to set both HGATP and VSATP in p2m_ctx_switch_to()
while calculate VMID in p2m_handle_vmenter() (with potential update of HGATP and VSATP
if needed) and with such approach VSATP won't be zero after p2m_ctx_switch_to() and
speculation could happen between context switch and VM entry.

So just to clarify your expectations are:
1. p2m_ctxt_switch_from(p):
       p.vsatp = VSATP
       VSATP = 0

2. p2m_ctxt_swith_to(n):
       HGATP = construct_hgatp(...)

3. p2m_handle_vmenter(n):
       update VMID if necessary
       
       recalculate HGATP if necessary
       
       (c) update VSATP with n.VSATP if we here from context switch
           or with hardware VSATP if it wasn't context switch.
        
       do necessary flushes

And at step (c) we can't base on that if VSATP is zero or not to understand that
it is from context switch as it could that guest at the moment of trap (lets say
some SBI call was requested by guest and Xen just handles it and return back
to guest) also had VSTAP = 0.
So it is needed to distinguish if context switch happened or not to properly deal
with VSATP (and it was one of the reson to have introduced in this patch
is_ctxt_switch_finished).

~ Oleksii



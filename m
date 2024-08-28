Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EEE962F5F
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 20:09:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785060.1194471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjN6F-0004Im-1t; Wed, 28 Aug 2024 18:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785060.1194471; Wed, 28 Aug 2024 18:08:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjN6E-0004GK-V8; Wed, 28 Aug 2024 18:08:54 +0000
Received: by outflank-mailman (input) for mailman id 785060;
 Wed, 28 Aug 2024 18:08:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQTD=P3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjN6D-0004GE-OT
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 18:08:53 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 947d67bf-6568-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 20:08:51 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52f01b8738dso5500132e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 11:08:51 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e588adf2sm274100766b.173.2024.08.28.11.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 11:08:49 -0700 (PDT)
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
X-Inumbo-ID: 947d67bf-6568-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724868531; x=1725473331; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wm/tY85tB+9252myaGjqw12IAnBOLLyIHLhn6OjktJU=;
        b=H4W+lPP/cg88QRa5OK9ZPf96EH05hlIw6wQbIMdjrgzw9UOCg6faRg40EADYsfqq7j
         eKinVUiwIkWC4UFLMDeAy2QabqipxXasXHpau3NQ9wKO8y9XPNDmjZtMZxg6NwfWMdl3
         SuCq9cEIkA80CuxqiN52IKbyy2G+dOKBVcptw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724868531; x=1725473331;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wm/tY85tB+9252myaGjqw12IAnBOLLyIHLhn6OjktJU=;
        b=dU3rBWiW+2R9S0kx1KH8C0wAtu2H63loKGwlqSaUG4VuKVRiZQ0JwOM1ahCAmeZMLu
         D+XfM4/vmnnp+QOVqCqA8HySorA3KXFSkGjyoAImvKU1xJpMaurRoyVMQJkkBHs8u0iz
         IXWbFQRaaeNSk1SDUNcfK4Roz6nXRVzqMgmp1aZi3iG20z0FbdCv2/gOVi6MUpciA+dH
         XGfkoOMQnbUHY5xRFpAOquwdKnURUqCVbclB9tryGkoWPBBEK71p/6ihzBe6v6C1B8N4
         NRjfCZQw0jGCV4BvCPgPuaQ0C7LULfCmA3tUp5TkMXavEleiHysK+Za825gyhNzPUD2i
         3INg==
X-Forwarded-Encrypted: i=1; AJvYcCUrtIPvjXnGKIfKZtP8K8yx7N4qG1uD4LB1+3wXUaqXVa6mMlzHCrVGKphRRpc4JWNUqCe4POQth3c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfTho6MFo3D4RGbvd2gDI32LG0OMwYtM7xFyFwuRs/Bmxutfni
	bD+xR6HJ5qwza2qfOi2B2VRv8P281sZjbmflBkva+tN/YoMX03lXm+rfRJ/Ika0=
X-Google-Smtp-Source: AGHT+IEqpynOAYTmMxcEi81PaTkDZ3ZRIlrZOC+m4kLXO5YTPsqqStCxBcX0P+TidXsP1nnieNboOA==
X-Received: by 2002:a05:6512:baa:b0:52e:9f17:841a with SMTP id 2adb3069b0e04-5353e543272mr84512e87.6.1724868530268;
        Wed, 28 Aug 2024 11:08:50 -0700 (PDT)
Message-ID: <cb2609f0-ed06-40ab-9983-9dad59c589d9@citrix.com>
Date: Wed, 28 Aug 2024 19:08:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] x86/vmx: Rewrite vmx_sync_pir_to_irr() to be more
 efficient
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240827135746.1908070-1-andrew.cooper3@citrix.com>
 <20240827135746.1908070-5-andrew.cooper3@citrix.com>
 <d022a5b1-c0ca-4399-b972-b01d834a95ec@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 xsFNBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABzSlBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPsLBegQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86M7BTQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAcLB
 XwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
In-Reply-To: <d022a5b1-c0ca-4399-b972-b01d834a95ec@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/08/2024 10:19 am, Jan Beulich wrote:
> On 27.08.2024 15:57, Andrew Cooper wrote:
>> There are two issues.  First, pi_test_and_clear_on() pulls the cache-line to
>> the CPU and dirties it even if there's nothing outstanding, but the final
>> for_each_set_bit() is O(256) when O(8) would do,
> Nit: That's bitmap_for_each() now, I think. And again ...
>
>> and would avoid multiple
>> atomic updates to the same IRR word.
>>
>> Rewrite it from scratch, explaining what's going on at each step.
>>
>> Bloat-o-meter reports 177 -> 145 (net -32), but the better aspect is the
>> removal calls to __find_{first,next}_bit() hidden behind for_each_set_bit().
> ... here, and no underscore prefixes on the two find functions.

Yes, and fixed.

>
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -2317,18 +2317,72 @@ static void cf_check vmx_deliver_posted_intr(struct vcpu *v, u8 vector)
>>  
>>  static void cf_check vmx_sync_pir_to_irr(struct vcpu *v)
>>  {
>> -    struct vlapic *vlapic = vcpu_vlapic(v);
>> -    unsigned int group, i;
>> -    DECLARE_BITMAP(pending_intr, X86_NR_VECTORS);
>> +    struct pi_desc *desc = &v->arch.hvm.vmx.pi_desc;
>> +    union {
>> +        uint64_t _64[X86_NR_VECTORS / (sizeof(uint64_t) * 8)];
> Using unsigned long here would imo be better, as that's what matches
> struct pi_desc's DECLARE_BITMAP().

Why?  It was also the primary contribution to particularly-bad code
generation in this function.

>
>> +        uint32_t _32[X86_NR_VECTORS / (sizeof(uint32_t) * 8)];
>> +    } vec;
>> +    uint32_t *irr;
>> +    bool on;
>>  
>> -    if ( !pi_test_and_clear_on(&v->arch.hvm.vmx.pi_desc) )
>> +    /*
>> +     * The PIR is a contended cacheline which bounces between the CPU(s) and
>> +     * IOMMU(s).  An IOMMU updates the entire PIR atomically, but we can't
>> +     * express the same on the CPU side, so care has to be taken.
>> +     *
>> +     * First, do a plain read of ON.  If the PIR hasn't been modified, this
>> +     * will keep the cacheline Shared and not pull it Excusive on the current
>> +     * CPU.
>> +     */
>> +    if ( !pi_test_on(desc) )
>>          return;
>>  
>> -    for ( group = 0; group < ARRAY_SIZE(pending_intr); group++ )
>> -        pending_intr[group] = pi_get_pir(&v->arch.hvm.vmx.pi_desc, group);
>> +    /*
>> +     * Second, if the plain read said that ON was set, we must clear it with
>> +     * an atomic action.  This will bring the cachline to Exclusive on the
> Nit (from my spell checker): cacheline.
>
>> +     * current CPU.
>> +     *
>> +     * This should always succeed because noone else should be playing with
>> +     * the PIR behind our back, but assert so just in case.
>> +     */
>> +    on = pi_test_and_clear_on(desc);
>> +    ASSERT(on);
>> +
>> +    /*
>> +     * The cacheline is now Exclusive on the current CPU, and because ON was
> "is" is pretty ambitious. We can only hope it (still) is.

I can't think of a clearer way of saying this.  "will have become
Exclusive" perhaps, but this is getting into some subtle tense gymnastics.

>> +     * get it back again.
>> +     */
>> +    for ( unsigned int i = 0; i < ARRAY_SIZE(vec._64); ++i )
>> +        vec._64[i] = xchg(&desc->pir[i], 0);
>> +
>> +    /*
>> +     * Finally, merge the pending vectors into IRR.  The IRR register is
>> +     * scattered in memory, so we have to do this 32 bits at a time.
>> +     */
>> +    irr = (uint32_t *)&vcpu_vlapic(v)->regs->data[APIC_IRR];
>> +    for ( unsigned int i = 0; i < ARRAY_SIZE(vec._32); ++i )
>> +    {
>> +        if ( !vec._32[i] )
>> +            continue;
>>  
>> -    bitmap_for_each ( i, pending_intr, X86_NR_VECTORS )
>> -        vlapic_set_vector(i, &vlapic->regs->data[APIC_IRR]);
>> +        asm ( "lock or %[val], %[irr]"
>> +              : [irr] "+m" (irr[i * 0x10])
> This wants to be irr * 4 only, to account for sizeof(*irr) == 4.

Ah, that will be where the AlderLake interrupts are disappearing to.

~Andrew


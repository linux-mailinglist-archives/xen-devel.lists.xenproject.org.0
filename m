Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D609B805130
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 11:53:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647539.1010772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAT32-0002jt-2L; Tue, 05 Dec 2023 10:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647539.1010772; Tue, 05 Dec 2023 10:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAT31-0002hE-Vo; Tue, 05 Dec 2023 10:53:03 +0000
Received: by outflank-mailman (input) for mailman id 647539;
 Tue, 05 Dec 2023 10:53:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmhw=HQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rAT31-0002h8-Bi
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 10:53:03 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75005890-935c-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 11:53:00 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3333fbbeab9so2389472f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 02:53:00 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b14-20020adff90e000000b0033346fe9b9bsm6019558wrr.83.2023.12.05.02.52.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 02:52:59 -0800 (PST)
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
X-Inumbo-ID: 75005890-935c-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701773580; x=1702378380; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gBfyyYHdoaZo+tMVL/3oFuk2m5NmkJejWqjBwhqVL8o=;
        b=MQzsrhF45Ur/8dHUvX9YwU9gTWpmS/D2i7TBcDYABoHXXitDhjYhbGPT3XozCnQD56
         7NkegKvKrwao0zXqQq/Uk0r3AUwoG5UEQM6HMDyg21S0mHOZKouU78Kke0CtqwCEXyd7
         6HBbRFnWSFhsxP1CTnyafu0v0ISYodCgtTyFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701773580; x=1702378380;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gBfyyYHdoaZo+tMVL/3oFuk2m5NmkJejWqjBwhqVL8o=;
        b=I+J7f6Vr7vhIiKl01e0OF2S+vgKAhSly1SuNqzCKR2AhleGSaHWhV3a0Lf+iyk2ROv
         QCnKGowNiRyxlGvCJNOYGgK1CCWWxB+HqM/SocbkfAx+Nyh6F/aS8og7MewOqvvV4Rhr
         kIk/+yT9jbljKsGZDM++al+N2DpTG95Hy7Yb4KXvXel1mmXUrlG0ut6W7OAVibEw/BZH
         gZo61E5o6QFDaLtC3yDq3/ozm99P76qVoRuKL5FhkUx6A6xpdgrLAHYF7+nxJxs49Y9B
         XYM1aPz2FEr1+T+5GbH7o+htjSr5hLr7Cnbj9J04bB9FCOhyy1+jEz347O0E8bEgh85R
         UQPQ==
X-Gm-Message-State: AOJu0YwDhBDcL7HOkQig7IWUPUvqW6LIec/erN4Q4oUFlituKBI7zNYn
	QKQ2KMARTFR9gq16Flo0pnFhmg==
X-Google-Smtp-Source: AGHT+IH0Qeat3251pfRpxMH9Y9xkUL03RLdSnQyUmCH/p10SOMcP92ihW25/W+qiVc2mrCQ8MD+ekw==
X-Received: by 2002:adf:f9d0:0:b0:333:533d:9cf1 with SMTP id w16-20020adff9d0000000b00333533d9cf1mr1061160wrr.103.1701773580005;
        Tue, 05 Dec 2023 02:53:00 -0800 (PST)
Message-ID: <6aaeea8c-cba9-4d3b-85a8-905dfee69e6f@citrix.com>
Date: Tue, 5 Dec 2023 10:52:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH] xen/arm: ffa: reclaim shared memory on guest
 destroy
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "patches@linaro.org" <patches@linaro.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20231204075552.3585875-1-jens.wiklander@linaro.org>
 <232c2496-77d6-4e37-a400-dbefd135ef3c@xen.org>
 <0B35D609-5378-4180-B79E-0CAE69D42165@arm.com>
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
In-Reply-To: <0B35D609-5378-4180-B79E-0CAE69D42165@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/12/2023 8:14 am, Bertrand Marquis wrote:
> Hi Julien,
>
> Thanks a lot for your review and comment, this is very helpful.
>
>> On 4 Dec 2023, at 20:24, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Jens,
>>
>> On 04/12/2023 07:55, Jens Wiklander wrote:
>>>        if ( ctx->rx )
>>>          rxtx_unmap(ctx);
>>>  +
>>> +    list_for_each_entry_safe(shm, tmp, &ctx->shm_list, list)
>>> +    {
>>> +        register_t handle_hi;
>>> +        register_t handle_lo;
>>> +
>>> +        uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
>>> +        res = ffa_mem_reclaim(handle_lo, handle_hi, 0);
>> Is this call expensive? If so, we may need to handle continuation here.
> This call should not be expensive in the normal case as memory is reclaimable
> so there is no processing required in the SP and all is done in the SPMC which
> should basically just return a yes or no depending on a state for the handle.
>
> So I think this is the best trade.
>
> @Jens: One thing to consider is that a Destroy might get a retry or busy answer and we
> will have to issue it again and this is not considered in the current implementation.
>
> After discussing the subject internally we could in fact consider that if an SP cannot release
> some memory shared with the VM destroyed, it should tell it by returning "retry" to the message.
> Here that could simplify things by doing a strategy where:
> - we retry on the VM_DESTROY message if required
> - if some memory is not reclaimable we check if we could park it and make the VM a zombie.
> What do you think ?

This is the cleanup issue discussed at XenSummit, isn't it?

You cannot feasibly implement this cleanup by having
ffa_domain_teardown() return -ERESTART.

Yes, it will probably function - but now you're now bouncing in/out of
Xen as fast as the CPU will allow, rechecking a condition which will
take an unbounded quantity of time.  Meanwhile, you've tied up a
userspace thread (the invocation of `xl destroy`) to do so, and one of
dom0's vCPU for however long the scheduler is willing to schedule the
destroy invocation, which will be 100% of the time as it's always busy
in the hypervisor.

The teardown/kill infrastructure is intended and expected to always make
forward progress.


The closest thing to this patch which will work sanely is this:

Hold a single domain reference for any non-zero amount of magic memory
held.  See domain_adjust_tot_pages() and how it interacts with
{get,put}_domain(), and copy it.  Importantly, this prevents the domain
being freed until the final piece of magic memory has been released.

Have some way (can be early on the teardown/kill path, or a separate
hypercall - assuming the VM can't ever be scheduled again) to kick Xen
into being responsible for trying to reclaim the memory.  (Start a
timer, or reclaim in the idle loop, whatever.)

This way, you can `xl destroy` a VM in an arbitrary state, *and* the
invocation will terminate when Xen has nothing deterministic left to do,
*and* in the case that the secure world or Xen has an issue, the VM will
stay around as a zombie holding minimal resources.

~Andrew


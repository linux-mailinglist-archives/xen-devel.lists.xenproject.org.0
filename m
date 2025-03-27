Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEDFA7358C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 16:24:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929586.1332308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txp55-0000dP-On; Thu, 27 Mar 2025 15:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929586.1332308; Thu, 27 Mar 2025 15:23:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txp55-0000cA-LH; Thu, 27 Mar 2025 15:23:43 +0000
Received: by outflank-mailman (input) for mailman id 929586;
 Thu, 27 Mar 2025 15:23:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4IZU=WO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1txp54-0000c3-CW
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 15:23:42 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7431a17e-0b1f-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 16:23:37 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43d0c18e84eso5370935e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 08:23:37 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8314b5e7sm41768375e9.35.2025.03.27.08.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 08:23:36 -0700 (PDT)
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
X-Inumbo-ID: 7431a17e-0b1f-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743089016; x=1743693816; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5Wzg1QO9xJCKSw04ScSywziBMjOIS249aE70xJIxHsY=;
        b=QB0yhRgsap9F0HLr1p7eXelO39tObNGMUNasTzz5NGXQdwd4+R/ocArHHASqpCnR9/
         QcTOvA6nv0KRLUBFZS1USFUBOgitOBE/dTpYCKavZdxR8k5ktJgmcYu+DRJ1VSnAyc8G
         jOjmmmOoG+8C/Xm9NKYHqDzbrCm7bvi/MQtWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743089016; x=1743693816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Wzg1QO9xJCKSw04ScSywziBMjOIS249aE70xJIxHsY=;
        b=CFibOC9uj9RS5WeC8uFwU/CzCWvhALASDxz9z+K1/8EsevccyTaKhTG2Z0qD2Dq/8/
         iUHpbK8XSbaEpXaEbZgA+Ttt477mz1ASJM1bbKsLA7ywqb/Ww+Jg3PEFax8SOcQfFajw
         MXiARWo6JmIFqgatGjQ6OLPt+xyjX8GQ6IQ0AggD4uJ8iwA9seRmY0ZX5JZPVLAExhQA
         acQdM1G0ZKvF25BvOE5WRcAw6w9RZTOtD3BcF41OcMOdEYtE0a1+EeWCeL8rtLK3A+Pa
         Qb5h31EiGtRxxOK/ClCh2FPd1dFhEB0FNbslGKiawEo3ZwGzMuHegRxJJ5KwUU2/0iZQ
         rUbA==
X-Gm-Message-State: AOJu0YzpD/tOigDlkhc/7T0jkf6ehJYIiPqXkt/RrfPQ45Kz1fGMyDlP
	ClFNaznUZxTyKQY6GgP+LLrymn9L0+GeMdm6hdOtuilDUR0H55ZUoAveDSac8Kg=
X-Gm-Gg: ASbGncswHeLpzmNk85m18j919yHRowdEqo8WlD4rh6rNaZBgSsyig7DfaK8UdPRsqxy
	OSh/6/B7IUGI+kx8epZq6STSYIAYj34YA4qNZAN7qJGuh2mPMwYg3Bd/yfz20+FoIWahevTnulq
	KMU26kZxeuDPACIXQpNumCs5WNcAQAPWumW2ZyyZblk95MVIY/x+iarv3RAqWzWDsSJEvkd9G2u
	4JmGMAMEyjpPIOmuJVruDFse4yxZku8nuKU2wOi/KRz3jQZ6dugK16fxWC0bdPQNMIgth+cjgs3
	el7YQM2q3zRyMD+y9iFyj5wWdSAdnDF1A7LhpIPV1GqN2FYSEjNnL0oj+76sji737cVjXRZhJdF
	4rcfCRxGmiTRxDgqiPeoT
X-Google-Smtp-Source: AGHT+IHdAEK7mB2NbmFAGUNYjEr2NSPrAGhKkw861lk2QYQlCOkW8vP9EsttRZ8+C8ReTeQYFPDaeA==
X-Received: by 2002:a05:600c:1d16:b0:43d:54a:221c with SMTP id 5b1f17b1804b1-43d84fcea9emr43150295e9.18.1743089016496;
        Thu, 27 Mar 2025 08:23:36 -0700 (PDT)
Message-ID: <7bf76e95-5681-45f3-958e-4bd8ed74f790@citrix.com>
Date: Thu, 27 Mar 2025 15:23:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/MTRR: hook mtrr_bp_restore() back up
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <ad8ea1da-dda9-4567-8b15-55b65777e80f@suse.com>
 <Z-U4ozL6p-Unh5Y8@macbook.local>
 <fde64904-343b-48c9-b396-961811cc2adb@suse.com>
 <Z-VJBIbQal-jZAGM@macbook.local>
 <f5669417-43f3-4c63-bb7d-a108f13757cb@suse.com>
 <Z-VcXGhlObVZYhoc@macbook.local>
 <ca0fb29a-96e8-489e-b109-76a684621d18@suse.com>
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
In-Reply-To: <ca0fb29a-96e8-489e-b109-76a684621d18@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/03/2025 2:20 pm, Jan Beulich wrote:
> On 27.03.2025 15:10, Roger Pau Monné wrote:
>> On Thu, Mar 27, 2025 at 02:28:42PM +0100, Jan Beulich wrote:
>>> On 27.03.2025 13:48, Roger Pau Monné wrote:
>>>> On Thu, Mar 27, 2025 at 01:30:44PM +0100, Jan Beulich wrote:
>>>>> On 27.03.2025 12:38, Roger Pau Monné wrote:
>>>>>> On Thu, Mar 27, 2025 at 12:20:47PM +0100, Jan Beulich wrote:
>>>>>>> Unlike stated in the offending commit's description,
>>>>>>> load_system_tables() wasn't the only thing left to retain from the
>>>>>>> earlier restore_rest_processor_state().
>>>>>>>
>>>>>>> While there also do Misra-related tidying for the function itself: The
>>>>>>> function being used from assembly only means it doesn't need to have a
>>>>>>> declaration, but wants to be asmlinkage.
>>>>>> I wonder, maybe the intention was for the MTRR restoring on the BSP to
>>>>>> also be done by the mtrr_aps_sync_end() call in enter_state()?
>>>>>>
>>>>>> AFAICT that will set the MTRRs uniformly on all CPUs, by calling
>>>>>> mtrr_set_all() just like mtrr_bp_restore(), but later in the restore
>>>>>> process.
>>>>> Hmm, yes, that's possible. The comment in set_mtrr() is somewhat misleading
>>>>> then, though, as for the BP the writing then isn't just "okay" but necessary.
>>>>> Question is whether doing this so much later is actually good enough.
>>>> Hm, no idea really.  We do the device restore ahead of the MTRR
>>>> restore, so I wonder whether we could have issues by using unexpected
>>>> effective cache attributes for device memory accesses as a result of
>>>> MTRRs not being initialized?
>>> That's just one of the possible problems. The father the MTRRs we run with
>>> diverged from what firmware puts in place, the bigger the possible trouble.
>>> I think the restoring better is done as being switched to here again. The
>>> absence of any discussion of MTRRs in that earlier change leaves me pretty
>>> certain that the behavioral change there wasn't intended. Andrew is usually
>>> pretty good at spelling out all intended effects.
>> No objection, however for the BSP we now end up restoring the MTRRs
>> twice, as we will also do it in mtrr_aps_sync_end().
>>
>> Might be worth to mention in the commit message that the MTRR state
>> was restored in mtrr_aps_sync_end() for the BSP also, but that it
>> might be too late.
> I've added "Note that MTRR state was still reloaded via mtrr_aps_sync_end(),
> but that happens quite a bit later in the resume process."

Ah yes, you got here too.

Yes, I think I simply missed this part of the discussion from the commit
message.

The MTRR logic is a giant tangle, and lost of it (I'm pretty sure) is
only relevant for early 32bit days.  Also since then, I expect firmware
has gotten better, considering that S3 is ubiquitous on laptops nowadays.

I expect that we don't need to change MTRRs in most cases.  However, if
change to the MTRRs actually need to happen, then they probably want
doing as part of the AP boot, rather than in a rendezvous later.  That
said, it would be a difference between the normal boot and S3 resume paths.

~Andrew


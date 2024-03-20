Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94753881379
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 15:39:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695954.1086333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmx6I-0003kJ-37; Wed, 20 Mar 2024 14:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695954.1086333; Wed, 20 Mar 2024 14:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmx6H-0003id-W3; Wed, 20 Mar 2024 14:39:29 +0000
Received: by outflank-mailman (input) for mailman id 695954;
 Wed, 20 Mar 2024 14:39:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FoSn=K2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmx6G-0003i2-5n
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 14:39:28 +0000
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [2607:f8b0:4864:20::72f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a63846f6-e6c7-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 15:39:26 +0100 (CET)
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-789dbd9a6f1so458939685a.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 07:39:26 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 fq9-20020a056214258900b00690d5310c55sm7898609qvb.114.2024.03.20.07.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 07:39:24 -0700 (PDT)
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
X-Inumbo-ID: a63846f6-e6c7-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710945565; x=1711550365; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ajswfk2sjKRwa/19iHb95k1d/F0Cr7s1YL08KFECNhA=;
        b=nz3+l2oQiUKIzpQXxxdORJzxZb6zrorjkdt15ybLw7+sGC8Y3iCwWQBgRkn0WbOmWK
         XN1qCLCLaSrB8ic1LKVX3xl3LpW62xPN6r0+jeOesOj67ivbcBRkkjYa/VXflXT511g/
         c0lE9QhjW7hMezeybAc8gBtz9dBXgidZEj6SU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710945565; x=1711550365;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ajswfk2sjKRwa/19iHb95k1d/F0Cr7s1YL08KFECNhA=;
        b=FB4Jn4UeXV1k72+DNL+0LtlGfDn6/vhCMYlZMX9j/N6ziInsorp/IRk2kLXF5MiGx5
         RrvKWwl3olL4c+YrLnakJaVeYOeetQZGbMMN2L/rqlQ2D4VFkNpzhciidGVjfxVgO6a3
         6xEvuywCbvmnI/b6FNfyRXQrsfvz2s9e+fu6iJcjxf/IT+wzcvT+yVYxTbq1CCLaALeP
         ADECjUazSAS6WpFGhuLOomIdk2vAVd/FW1iMZtI9d1SIPVyPP+VEG9xvu7Jr9DhRPgdx
         /A51Rh2+hOH4HLmBIqJFgkdOwMalFVzTXasxIaX9IelH8GENYpe+x/wKhX+b8mL2ViTC
         beKQ==
X-Gm-Message-State: AOJu0YwvlivnC5O5tLchWnSlpf3ypN2sQtQM6wb1ojpcSnNw7OdkB57J
	iaNk+5L3anezCnAKaVqGJJ0rsXTlZU65o2L8Y9cnZcQ3tKeul8gkCsJbBqUebHU=
X-Google-Smtp-Source: AGHT+IHG16YNl0P89+u2+PyuZWl7wypLMWZSpuLYeJwgwgBJSA8W6vgxo8RTND/6W+G45RLQqgnTiw==
X-Received: by 2002:a0c:9c8c:0:b0:68f:2b35:5edf with SMTP id i12-20020a0c9c8c000000b0068f2b355edfmr17850085qvf.13.1710945565093;
        Wed, 20 Mar 2024 07:39:25 -0700 (PDT)
Message-ID: <815d5bd4-18af-4f5f-b6a5-6302a1d682a2@citrix.com>
Date: Wed, 20 Mar 2024 14:39:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vcpu: relax VCPUOP_initialise restriction for non-PV
 vCPUs
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20240320135720.68894-1-roger.pau@citrix.com>
 <1304a0d2-ff17-4823-9d31-c32eb7b79f30@citrix.com> <ZfryIBR6RECujayD@macbook>
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
In-Reply-To: <ZfryIBR6RECujayD@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/03/2024 2:26 pm, Roger Pau Monné wrote:
> On Wed, Mar 20, 2024 at 02:06:27PM +0000, Andrew Cooper wrote:
>> On 20/03/2024 1:57 pm, Roger Pau Monne wrote:
>>> There's no reason to force HVM guests to have a valid vcpu_info area when
>>> initializing a vCPU, as the vCPU can also be brought online using the local
>>> APIC, and on that path there's no requirement for vcpu_info to be setup ahead
>>> of the bring up.  Note an HVM vCPU can operate normally without making use of
>>> vcpu_info.
>>>
>>> Restrict the check against dummy_vcpu_info to only apply to PV guests.
>>>
>>> Fixes: 192df6f9122d ('x86: allow HVM guests to use hypercalls to bring up vCPUs')
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> Thanks for looking into this.  But, do we actually need to force this on
>> PV either?
> Possibly, having now taken a look at the users it does seem they could
> cope with unpopulated vcpu_info_area.
>
> Part of my understanding was that this was some kind of courtesy to PV
> guests in order to prevent starting them without a vcpu_info, which
> strictly speaking is not mandatory, but otherwise the guest vCPU won't
> be able to receive interrupts, not even IPIs.

That's more of a stick than a carrot... "you must set up the area of a
CPU before you can bring it online". Except as we've seen, HVM has been
fine all along without it.
>> The only interesting user of dummy_vcpu_info now is vcpu_info_populate()
>> which can cope with any arbitrary vCPU.
>>
>> I have a suspicion that we can (now) delete these two checks, delete the
>> dummy_vcpu_info object, and use a regular NULL pointer in
>> vcpu_info_{populate,reset}(), and in doing so, remove one of the bigger
>> pieces of PV-absurdity from Xen.
> I was expecting this to be something we can backport.  OTOH removing
> the check completely (or even getting rid of dummy_vcpu_info) is not
> something that we would want to backport.
>
> I would rather do the removal of dummy_vcpu_info as followup work.

I was worried about ARM with your patch, because it's spelt HVM there,
rather than PV.

However, I'd forgotten that ARM's do_vcpu_op() filters ops down to just
VCPUOP_register_{vcpu_info,runstate_memory_area} so VCPUOP_initialise
isn't reachable.

Therefore, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

It also means ARM can't use any of the PHYS registration yet...

~Andrew


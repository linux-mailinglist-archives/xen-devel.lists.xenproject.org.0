Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 189A3941A7F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 18:44:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767998.1178709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYpxd-0000uL-P5; Tue, 30 Jul 2024 16:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767998.1178709; Tue, 30 Jul 2024 16:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYpxd-0000sp-Lt; Tue, 30 Jul 2024 16:44:29 +0000
Received: by outflank-mailman (input) for mailman id 767998;
 Tue, 30 Jul 2024 16:44:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3jiA=O6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sYpxb-0000sj-VX
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 16:44:27 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbd20528-4e92-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 18:44:27 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5a10835487fso7151215a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 09:44:27 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad41976sm668445866b.130.2024.07.30.09.44.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 09:44:25 -0700 (PDT)
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
X-Inumbo-ID: fbd20528-4e92-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722357866; x=1722962666; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hM3DsFd38ntSTkDA5L78v6ccx4vFyTizHyByugxhPFo=;
        b=MaTDmAIgdFgp6RlI1C+D781fXRq4UuqvwwEEDaW9vUCpxApLpSrS/ojKWjkXvvn7A8
         Fafhopl/1AMh7ynNlhZxJc5HvJL0oHNBQNacBKUGcYoSguPPvvao3o+N8q1WYgMu39Ng
         +RvMtRZUM+lcdbRyy9dyYYLKDDtHoVduFINVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722357866; x=1722962666;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hM3DsFd38ntSTkDA5L78v6ccx4vFyTizHyByugxhPFo=;
        b=tXB4SXdZjjGsKUUITwpB1EDKkbbUNQ+k3eihaNF697XC3HIsFs7b5Gr8+Bn1G3lFlF
         WCtNJTVG9rMlRFhTJLFV93auXEpNtwb2BXmaS4DjiA2R92v81D1sgAJ6/QUzpIaJXczJ
         nduqERTv+32cjcfhZwdI0jFwHDyjDD0XH4CgdzhHYjVhp0E9KebniCdUqjoSHzNTiHai
         4oTZlVbrHeCGdq3zQPxk1fKcy1mRoCh8gmaQZz43dHeFCJuLXMdfVXYeST3EQSEj44AZ
         KrLJ0LHkYWGpw1INDpga2+rI941ik0BjrrjiK4xZ32u290OASf6ZHB7qKq0x9Nk3+uB8
         Ov3A==
X-Forwarded-Encrypted: i=1; AJvYcCXk2gCVF4n3zsCymfJl6okDkI1bxxK5InzP0f2JrW2guQ90qsI2hUu+cOwRuV39jUz9sHdOJQ9SY3cTZkH+CgXOREPCr5JADravG/qzEhY=
X-Gm-Message-State: AOJu0Yw4PG/8Kq9CkWmLgTIrsLqHZ8cSl0MRmTlvC7d2HXuAilDxbf3H
	yuGT3f8QuxfxBrscErAequk2hOQoYueDm8naY1QWE+yv2Mx95ABhOmgrU9n5aqhNlHHH9PjDZM1
	y
X-Google-Smtp-Source: AGHT+IHnlQF2mBmMRZW4i/5VTTOzrMBo4xhpexWZ8lpd/x7yhXZHWE6Zbiv8Icj0ghpCsxRpGpZU/w==
X-Received: by 2002:a17:907:7d86:b0:a6f:4fc8:2665 with SMTP id a640c23a62f3a-a7d40150b58mr844429066b.50.1722357866301;
        Tue, 30 Jul 2024 09:44:26 -0700 (PDT)
Message-ID: <4b376f89-e56b-4706-a8c8-0b3a4c0f6f73@citrix.com>
Date: Tue, 30 Jul 2024 17:44:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] automation: upgrade Yocto to scarthgap
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 cardoe@cardoe.com
References: <alpine.DEB.2.22.394.2407261639190.4857@ubuntu-linux-20-04-desktop>
 <ZqjuvjUtmNU7Ud8g@mail-itl> <9be4e130-c202-459d-bd58-d589b72af1c2@citrix.com>
 <Zqjzn5eM0z0njNF2@mail-itl>
 <alpine.DEB.2.22.394.2407300851390.4857@ubuntu-linux-20-04-desktop>
 <e9230d77-24f0-42a1-8728-e9d6478a071e@citrix.com>
 <alpine.DEB.2.22.394.2407300941090.4857@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2407300941090.4857@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/07/2024 5:41 pm, Stefano Stabellini wrote:
> On Tue, 30 Jul 2024, Andrew Cooper wrote:
>> On 30/07/2024 4:55 pm, Stefano Stabellini wrote:
>>> On Tue, 30 Jul 2024, Marek Marczykowski-Górecki wrote:
>>>> On Tue, Jul 30, 2024 at 03:01:52PM +0100, Andrew Cooper wrote:
>>>>> On 30/07/2024 2:46 pm, Marek Marczykowski-Górecki wrote:
>>>>>> On Fri, Jul 26, 2024 at 05:19:42PM -0700, Stefano Stabellini wrote:
>>>>>>> Upgrade Yocto to a newer version. Use ext4 as image format for testing
>>>>>>> with QEMU on ARM and ARM64 as the default is WIC and it is not available
>>>>>>> for our xen-image-minimal target.
>>>>>>>
>>>>>>> Also update the tar.bz2 filename for the rootfs.
>>>>>>>
>>>>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>>>> Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>>>>>
>>>>>>> ---
>>>>>>>
>>>>>>> all yocto tests pass:
>>>>>>> https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1390081173
>>>>> That test ran on gitlab-docker-pug, not qubes-ambrosia, so doesn't
>>>>> confirm the fix to the xattr issue.
>>>> There is one on ambrosia too:
>>>> https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/7423043016
>>> Yes indeed: I tested it in a previous run. The last test I let it run
>>> without additional constraints. But as far as I can tell the patch is
>>> 100% tested.
>>>
>>>
>>>>> Seeing as I'm going to need to rebuild the container anyway, I'll see
>>>>> about forcing this and double checking.
>>>> But double-checking is a good idea anyway.
>>> I did update the x86, arm64 and arm32 containers. Feel free to rebuild
>>> any of them.
>>>
>>> I'll commit the patch this afternoon if you don't get to it sooner :-)
>> Just the x86 container rebuild has been going on for the entirety of the
>> MISRA meeting...
>>
>> If you've got one to hand already, please deploy it.
> I deployed the three yocto containers

Ok, I'll include this patch in my commit sweep

~Andrew


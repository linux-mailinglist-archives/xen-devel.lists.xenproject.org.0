Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 481E0B4014D
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 14:52:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106361.1457059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utQUj-000739-BG; Tue, 02 Sep 2025 12:52:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106361.1457059; Tue, 02 Sep 2025 12:52:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utQUj-000711-8h; Tue, 02 Sep 2025 12:52:17 +0000
Received: by outflank-mailman (input) for mailman id 1106361;
 Tue, 02 Sep 2025 12:52:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4ch=3N=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1utQUh-00070v-WF
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 12:52:16 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5d956c1-87fb-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 14:52:13 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45b7c56a987so16896135e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 05:52:13 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b8acbe982sm60528145e9.6.2025.09.02.05.52.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 05:52:11 -0700 (PDT)
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
X-Inumbo-ID: a5d956c1-87fb-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756817533; x=1757422333; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cGTGCvRG/yf0r3dCuUwGQhwhW4jWI2QYZSIJ5mec4Gg=;
        b=rVOcC4ZAUl5JjkS/DS01q6kxfw3MEYCChX2KYSwcHYycwNUXgqvdM6Hwxykh5ev/ja
         p5dv4eCnamVdxcUNIcQ1IxWambe3hxgzamlf1op19U885U4CXdQFsRQYXK7BlKBXRw5d
         t8p5fis9V8ROzcF+0gA2hzYQu8QPsT4Y9IeKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756817533; x=1757422333;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGTGCvRG/yf0r3dCuUwGQhwhW4jWI2QYZSIJ5mec4Gg=;
        b=wMDjc+YJhZivjZEOdSDAqc92R8QAXLRSQuDsvA/hxJJUdo+HyzJ0zBANDrvLSIaUNX
         fZ2jrYHa1X9/u4xBMC6Dj8ZiQnk8oIs9sV4zS3t+nbymYBKqw0YYPLFFR/35OfgQ0Yvx
         CmIISNwntYi+Z+s+aKfoL39v+30NC7vcwSYKkjowRzvdvHfINXRnbQ4267CrFlWDhF0v
         n1bBM285+61eoeJShkcUAnjLkb/f8H3R60AbLCoceWJS0dNVG/Jy0kipowNyxvJWfzyU
         MXOAwiAfiFyHok+6XRgw257KPjg2QBLh8XB6LLwLF9SF/rTfcpXikWOezV4WbWLL9y1v
         Lfgg==
X-Gm-Message-State: AOJu0YzfZtWeP2EGxKxcn1sYWrf6nEo88XHQQVTafbisy8UkrxuC95DP
	MB/B1BiKejV/QFIyJ3nLZb4i7QgbiBjcUlJLWRaK01o7PLL3Vo842iZ4vt4XH2yQbWU=
X-Gm-Gg: ASbGncuwkeoB96+7DWtQfNDomaLwyvcYGMtm3d/yg3+QbanKcYCcAUvpp0d2B2UbMRm
	Dy39P8p4vIRbr9Cy2xaCXIezI7kgoJBuwpmx17XM+Hs/cVU4aXgM1NQhwgNIDvTgQbQuEMgoGBm
	jxA219H+LBlh3WtIe8lv5GB7uasEcil/3XT1Qo7rmhzNJ/h6EFAKwY1p4kvE02P2VaRvVI/W7sV
	QGUfjlA3r8w3x5LunwkClIDXkU4fMZwt+6rvwRxe4ANX4rBph3OUL558Rmwyq8spC5mJ79tnz0Z
	NEAqdShBUv5tS+er5C/MFbMG1I6Rwt742xYUwI4qwWdQrtp7Kjq3TQJ5TTA9UxJjqJwmRwolROE
	uTiAroeKNFxHFdijAZUib8keAD4tMnZjwwNFqBBSaG6vzKN2bTOuffQWXDLPaQq0Sr49j7xCibh
	pjKM8=
X-Google-Smtp-Source: AGHT+IF3qwYZ40MgITa/0zyOZCuF7BfbfcKMFlKrwU0XKBlUHFkO1kv1SKeAclDrtQIgEOx0737IbQ==
X-Received: by 2002:a05:600c:1d1f:b0:45b:8f11:8e00 with SMTP id 5b1f17b1804b1-45c055e1774mr2928605e9.37.1756817532394;
        Tue, 02 Sep 2025 05:52:12 -0700 (PDT)
Message-ID: <50994916-4307-4224-9e48-053459b00a92@citrix.com>
Date: Tue, 2 Sep 2025 13:52:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: issue with dom0_pvh on Xen 4.20
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xenproject.org
References: <aLbEQ7Bav8seazP1@mail.soc.lip6.fr>
 <68988b80-f642-4fcf-a624-49ad9fdd685c@citrix.com>
 <aLbNbiHLntX13E46@mail.soc.lip6.fr>
 <c0ac2079-53eb-4e6f-89a9-b6759f344d03@citrix.com>
 <aLbTxH5q1KpeyTIS@mail.soc.lip6.fr>
 <9a263568-54be-4193-9a4e-cd31268c5ee6@citrix.com>
 <aLbiBb3bWqGdnGQm@mail.soc.lip6.fr>
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
In-Reply-To: <aLbiBb3bWqGdnGQm@mail.soc.lip6.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/09/2025 1:24 pm, Manuel Bouyer wrote:
> On Tue, Sep 02, 2025 at 01:14:29PM +0100, Andrew Cooper wrote:
>> On 02/09/2025 12:23 pm, Manuel Bouyer wrote:
>>> On Tue, Sep 02, 2025 at 12:13:27PM +0100, Andrew Cooper wrote:
>>>> On 02/09/2025 11:56 am, Manuel Bouyer wrote:
>>>>> On Tue, Sep 02, 2025 at 11:44:36AM +0100, Andrew Cooper wrote:
>>>>>> On 02/09/2025 11:17 am, Manuel Bouyer wrote:
>>>>>>> Hello,
>>>>>>> I'm trying to boot a NetBSD PVH dom0 on Xen 4.20.
>>>>>>> The same NetBSD kernel works fine with Xen 4.18
>>>>>>>
>>>>>>> The boot options are:
>>>>>>> menu=Boot netbsd-current PVH Xen420:dev hd0f:;load /netbsd-PVH console=com0 root=wd0f; multiboot /xen420-debug.gz dom0_mem=1024M console=com1 com1=38400,8n1 loglvl=all guest_loglvl=all gnttab_max_nr_frames=64 sync_console=1 dom0=pvh
>>>>>>>
>>>>>>> and the full log from serial console is attached.
>>>>>>>
>>>>>>> With 4.20 the boot fails with:
>>>>>>>
>>>>>>> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
>>>>>>> (XEN) Freed 664kB init memory
>>>>>>> (XEN) d0v0 Triple fault - invoking HVM shutdown action 1
>>>>>>> (XEN) *** Dumping Dom0 vcpu#0 state: ***
>>>>>>> (XEN) ----[ Xen-4.20.2-pre_20250821nb0  x86_64  debug=y  Tainted:   C    ]----
>>>>>>> (XEN) CPU:    7
>>>>>>> (XEN) RIP:    0008:[<000000000020e268>]
>>>>>>> (XEN) RFLAGS: 0000000000010006   CONTEXT: hvm guest (d0v0)
>>>>>>> (XEN) rax: 000000002024c003   rbx: 000000000020e260   rcx: 00000000000dfeb7
>>>>>>> (XEN) rdx: 0000000000100000   rsi: 0000000000103000   rdi: 000000000013e000
>>>>>>> (XEN) rbp: 0000000080000000   rsp: 00000000014002e4   r8:  0000000000000000
>>>>>>> (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
>>>>>>> (XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000000000
>>>>>>> (XEN) r15: 0000000000000000   cr0: 0000000000000011   cr4: 0000000000000000
>>>>>>> (XEN) cr3: 0000000000000000   cr2: 0000000000000000
>>>>>>> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
>>>>>>> (XEN) ds: 0010   es: 0010   fs: 0000   gs: 0000   ss: 0010   cs: 0008
>>>>>>>
>>>>>>> because of the triple fault the RIP above doens't point to the code.
>>>>>>>
>>>>>>> I tracked it down to this code:
>>>>>>>         cmpl    $0,%ecx                 ;       /* zero-sized? */       \
>>>>>>>         je      2f                      ; \
>>>>>>>         pushl   %ebp                    ; \
>>>>>>>         movl    RELOC(nox_flag),%ebp    ; \
>>>>>>> 1:      movl    %ebp,(PDE_SIZE-4)(%ebx) ;       /* upper 32 bits: NX */ \
>>>>>>>         movl    %eax,(%ebx)             ;       /* store phys addr */   \
>>>>>>>         addl    $PDE_SIZE,%ebx          ;       /* next PTE/PDE */      \
>>>>>>>         addl    $PAGE_SIZE,%eax         ;       /* next phys page */    \
>>>>>>>         loop    1b                      ; \
>>>>>>>         popl    %ebp                    ; \
>>>>>>> 2:                                      ;
>>>>>>>
>>>>>>> there are others pushl/popl before so I don't think that's the problem
>>>>>>> (in fact the exact same fragment is called just before with different
>>>>>>> inputs and it doesn't fault). So the culprit it probably the write to (%ebx),
>>>>>>> which would be 0x20e260
>>>>>>> This is in the range:
>>>>>>> (XEN)  [0000000000100000, 0000000040068e77] (usable)
>>>>>>> so I can't see why this would be a problem.
>>>>>>>
>>>>>>> Any idea, including how to debug this further, welcome
>>>>>> Even though triple fault's are aborts, they're generally accurate under
>>>>>> virt, so 0x20e268 is most likely where things die.
>>>>> but that's the RIP of the last fault, not the first one, right ?
>>>>> 0x20e268 isn't in the text segment of the kernel, my guess is that the
>>>>> first fault triggers an exception, but the exeption handler isn't set up yet
>>>>> so we end up jumping to some random value.
>>>> Double and Triple faults occur when trying to deliver an exception
>>>> generates an exception.  So while multiple faults are involved, only one
>>>> instruction typically is.
>>>>
>>>> Is this an Intel or an AMD system?  One thing virt can do is break apart
>>>> a triple fault, but the logic to do so is vendor specific.
>>> it's an old intel system:
>>> cpu0: "Intel(R) Xeon(R) CPU           X5650  @ 2.67GHz"
>>> cpu0: Intel Xeon 36xx & 56xx, i7, i5 and i3 (686-class), 2667.30 MHz
>>> cpu0: family 0x6 model 0x2c stepping 0x2 (id 0x206c2)
>>>
>> Hmm.  Westmere EP.  Are you running with EPT active, or with Shadow Paging?
> How do I know ?
Something like:

HVM: Hardware Assisted Paging (HAP) detected

on boot.

> Note that the same problem shows up on much newer systems: an i9, and a
> Xeon W-2223. Both boots fine with the same NetBSD kernel and Xen 4.18 or 4.15.
>
> I'm using this old Xeon for debug because this one has a serial console.

Sure.  It's just that HAP vs Shadow is also relevant to breaking apart a
triple fault.

~Andrew


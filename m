Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2AEB3FD89
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 13:13:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106137.1456890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utOx8-0002NR-Hq; Tue, 02 Sep 2025 11:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106137.1456890; Tue, 02 Sep 2025 11:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utOx8-0002Lx-Dj; Tue, 02 Sep 2025 11:13:30 +0000
Received: by outflank-mailman (input) for mailman id 1106137;
 Tue, 02 Sep 2025 11:13:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4ch=3N=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1utOx7-0002Lr-V5
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 11:13:29 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da70ef0e-87ed-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 13:13:29 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3cbb3ff70a0so3284830f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 04:13:29 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b814da51esm172282325e9.8.2025.09.02.04.13.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 04:13:27 -0700 (PDT)
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
X-Inumbo-ID: da70ef0e-87ed-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756811608; x=1757416408; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pf842Qo/2ZKmQTuxsH+JCJl+AjkW/F2ljYwdJgSFOms=;
        b=OK0tlKBNN1RfwT7bopVUA6d+5mVhZDSTcXXaefoLSiyxDl9bEErF5xy1Y0WlTXV1Zw
         ZpF0KqoQdgomj+wsrN+BMQVuY03KeO4lf1vd5FMgyw+QHB1Wmy90StgDJ/WVr9o7RUu4
         zNBg/XCqeG8XTZAllxMgbMnD30G2CupHbSkJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756811608; x=1757416408;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pf842Qo/2ZKmQTuxsH+JCJl+AjkW/F2ljYwdJgSFOms=;
        b=hQ/BXbqfzsVmDeMLBUY/gxyluE9pXFv/u/nzhbaD2o5UjHDWcZATfgEQCA8rG5QE7L
         /nVquzEh+F/p1BpFJ25gjDm5cIz0ulx1sGMx3q6Us7cMFMFW0LJ59vZ9CghaZO9I51PN
         4m0cglOOUACmOTvSjFqGP3DoB1H34Wfh39HNsvQPT3W7sX91f1jpfZRRWvqK/vd6DbAS
         fYo152VVyOdHequldvT1ufuvVr7UnOeDXETzrreaemxntpvZpif5eXvLLunP476O9FUG
         JO/tP6Dq3w2gxgQQYOT+VLmZcffSXE/fqEn4lFXYTCS2HJVDYeQJJUVia6YAkQGdpswm
         ZVaA==
X-Gm-Message-State: AOJu0YxElaEebfEIFhDpuv8rItMyG3KgbFPR2ZUjB5/KHz3lxvJlBvJX
	ZnxxOY2u2QS50IunR5Q0TfyfgVSwVSI2Ii5Il9OW9QJmTIRSZHj5tpxQGNp5FcYebXvGU+49SfR
	up13s
X-Gm-Gg: ASbGncuBE4oZGbx78CjkawmNMfnCNdrrU9kHGxGC03N0RjFYatbFyiwc6kVvQVag9Ql
	Qs6TbUyrAUipjuCv+FSiE1yvam/Yg0RgR8FpW4BS9MKT3V5Z+wF5SB7R8roWQrNe1+Xk/+zHAea
	7k803hRmSum7UCQxiDFj9q8ablVOVUD6kPMMWyOMYcm5SSqwEZREl+dR4DQMdY3BHRw5Dp+CIG/
	Xyp8tbuZ3gVnSs2qOtchwE0FrVV2WXvJpPuJ0/pkRdww2XCWhUCezcplMuxvE93YEc0sQbxP2jW
	zM0gV4gwEnNagUj099jzqcOr8C9sFK1KTTdhePhmeWItVF+H621dcjIuY1wEgOKJ4KMkvAiEuek
	GnR1P+MNDhUyVwX+eD9foo9UbxmkkDeFEwQIi/tCxGiWd2Ond/13PAO+xiL6vYYAhAD6c
X-Google-Smtp-Source: AGHT+IH9sCvxRTXI8axQgp3hTDef0vrfMSIAzucSCk23s1rysQuAYH+ic0NKbdmUC2q9jBuIEjkQSg==
X-Received: by 2002:a05:6000:22c8:b0:3d5:a6a9:7d3e with SMTP id ffacd0b85a97d-3d5a6a98bebmr5114958f8f.4.1756811608376;
        Tue, 02 Sep 2025 04:13:28 -0700 (PDT)
Message-ID: <c0ac2079-53eb-4e6f-89a9-b6759f344d03@citrix.com>
Date: Tue, 2 Sep 2025 12:13:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: issue with dom0_pvh on Xen 4.20
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xenproject.org
References: <aLbEQ7Bav8seazP1@mail.soc.lip6.fr>
 <68988b80-f642-4fcf-a624-49ad9fdd685c@citrix.com>
 <aLbNbiHLntX13E46@mail.soc.lip6.fr>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aLbNbiHLntX13E46@mail.soc.lip6.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/09/2025 11:56 am, Manuel Bouyer wrote:
> On Tue, Sep 02, 2025 at 11:44:36AM +0100, Andrew Cooper wrote:
>> On 02/09/2025 11:17 am, Manuel Bouyer wrote:
>>> Hello,
>>> I'm trying to boot a NetBSD PVH dom0 on Xen 4.20.
>>> The same NetBSD kernel works fine with Xen 4.18
>>>
>>> The boot options are:
>>> menu=Boot netbsd-current PVH Xen420:dev hd0f:;load /netbsd-PVH console=com0 root=wd0f; multiboot /xen420-debug.gz dom0_mem=1024M console=com1 com1=38400,8n1 loglvl=all guest_loglvl=all gnttab_max_nr_frames=64 sync_console=1 dom0=pvh
>>>
>>> and the full log from serial console is attached.
>>>
>>> With 4.20 the boot fails with:
>>>
>>> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
>>> (XEN) Freed 664kB init memory
>>> (XEN) d0v0 Triple fault - invoking HVM shutdown action 1
>>> (XEN) *** Dumping Dom0 vcpu#0 state: ***
>>> (XEN) ----[ Xen-4.20.2-pre_20250821nb0  x86_64  debug=y  Tainted:   C    ]----
>>> (XEN) CPU:    7
>>> (XEN) RIP:    0008:[<000000000020e268>]
>>> (XEN) RFLAGS: 0000000000010006   CONTEXT: hvm guest (d0v0)
>>> (XEN) rax: 000000002024c003   rbx: 000000000020e260   rcx: 00000000000dfeb7
>>> (XEN) rdx: 0000000000100000   rsi: 0000000000103000   rdi: 000000000013e000
>>> (XEN) rbp: 0000000080000000   rsp: 00000000014002e4   r8:  0000000000000000
>>> (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
>>> (XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000000000
>>> (XEN) r15: 0000000000000000   cr0: 0000000000000011   cr4: 0000000000000000
>>> (XEN) cr3: 0000000000000000   cr2: 0000000000000000
>>> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
>>> (XEN) ds: 0010   es: 0010   fs: 0000   gs: 0000   ss: 0010   cs: 0008
>>>
>>> because of the triple fault the RIP above doens't point to the code.
>>>
>>> I tracked it down to this code:
>>>         cmpl    $0,%ecx                 ;       /* zero-sized? */       \
>>>         je      2f                      ; \
>>>         pushl   %ebp                    ; \
>>>         movl    RELOC(nox_flag),%ebp    ; \
>>> 1:      movl    %ebp,(PDE_SIZE-4)(%ebx) ;       /* upper 32 bits: NX */ \
>>>         movl    %eax,(%ebx)             ;       /* store phys addr */   \
>>>         addl    $PDE_SIZE,%ebx          ;       /* next PTE/PDE */      \
>>>         addl    $PAGE_SIZE,%eax         ;       /* next phys page */    \
>>>         loop    1b                      ; \
>>>         popl    %ebp                    ; \
>>> 2:                                      ;
>>>
>>> there are others pushl/popl before so I don't think that's the problem
>>> (in fact the exact same fragment is called just before with different
>>> inputs and it doesn't fault). So the culprit it probably the write to (%ebx),
>>> which would be 0x20e260
>>> This is in the range:
>>> (XEN)  [0000000000100000, 0000000040068e77] (usable)
>>> so I can't see why this would be a problem.
>>>
>>> Any idea, including how to debug this further, welcome
>> Even though triple fault's are aborts, they're generally accurate under
>> virt, so 0x20e268 is most likely where things die.
> but that's the RIP of the last fault, not the first one, right ?
> 0x20e268 isn't in the text segment of the kernel, my guess is that the
> first fault triggers an exception, but the exeption handler isn't set up yet
> so we end up jumping to some random value.

Double and Triple faults occur when trying to deliver an exception
generates an exception.  So while multiple faults are involved, only one
instruction typically is.

Is this an Intel or an AMD system?  One thing virt can do is break apart
a triple fault, but the logic to do so is vendor specific.

~Andrew


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B74D7EAB20
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 08:59:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632177.986279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2oJb-0006tG-4N; Tue, 14 Nov 2023 07:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632177.986279; Tue, 14 Nov 2023 07:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2oJb-0006q8-1V; Tue, 14 Nov 2023 07:58:31 +0000
Received: by outflank-mailman (input) for mailman id 632177;
 Tue, 14 Nov 2023 07:58:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2oJZ-0006q2-Ib
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 07:58:29 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97d4720e-82c3-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 08:58:27 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4094301d505so41832635e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 23:58:27 -0800 (PST)
Received: from [192.168.69.100] (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 r18-20020a05600c35d200b0040a487758dcsm10551547wmq.6.2023.11.13.23.58.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 23:58:24 -0800 (PST)
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
X-Inumbo-ID: 97d4720e-82c3-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699948705; x=1700553505; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ocmXiH4qcLkoZdQoaluE8CpB0EXbFAC8scGwpgtKsc=;
        b=aDjl3ezvyjLBRyLAo/LzZ1+snR/xj5bxRF+kPMxfjua2U/brZjzyr9C4fBdN0+tUhy
         aiCJd6dAmjQMN6pLHZCbER6qbCGBGe36e1dSYVaC3reqktgxg3Q9E7MgX2e/pCtGaW+J
         zMAmAlSRcAM1f9n5ULJ9uxyZ4fdaxzqN2ZKc1HDUGbeWCfHTYejJ0R1evgJXuGq2/VJ1
         GSshBtwEHCWLw5RRMI01S0D+h7HgXy+y0JMSprbUSTaMZDSfaxLUbgTpYOjFLI2Fl3S7
         0pV6v7LOiT9ukW8M3kRbyZemcPXihZu6Hx9PygejHQ1rR/0WV7YeITMl6hbed0YnfQ3Y
         jwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699948705; x=1700553505;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ocmXiH4qcLkoZdQoaluE8CpB0EXbFAC8scGwpgtKsc=;
        b=BtzdhqzDhYAOsWPUbGNAe/Hf5E9bSbbYs7mVy25Tk29WEdg2Yn2FdQLvy7uTisuhX/
         3d7F1c3CDw1AhpJ2WW36900e4wIEpqtvcTiVf6i/568UTxNUZo2Blo9OlsMWHFNUNqTg
         y/d1Dj6tf+j+gCX26e0l2R30G54JgOyng4yAl3Dg7G8RrHS1OT/1DaoeNTSObyV/wWlC
         SLUDxfjtRV71DpXE/m/C2VpdDqLqtri54SBFdlIACGVHJMFv1y7W8NBp0H1aQcQ3auPH
         Vvep8bml84BewVaQZbQuxeDJ9pwHw7QBEzMdGZNAaeSw/efXfS5XUUai8PgoSojrliAT
         e0sA==
X-Gm-Message-State: AOJu0Yy6+B9b4ut4Okvj92Cw+rDykY5XJHkRVe2D6qoN9RSG9ziQZ3ex
	eoakGcBHV4gnfiCXd8wuxE7gkA==
X-Google-Smtp-Source: AGHT+IGLnHPxByJUZlv0OHbrwkWB8vQY4zl1JbOsJeysfx3/2KJYr3iDxrCmrQRuOG07AKPgS0e+TQ==
X-Received: by 2002:a05:600c:1c21:b0:407:612b:91fb with SMTP id j33-20020a05600c1c2100b00407612b91fbmr6720884wms.30.1699948704783;
        Mon, 13 Nov 2023 23:58:24 -0800 (PST)
Message-ID: <b7646614-8f5c-4ea6-9ea8-ff81f4a492c9@linaro.org>
Date: Tue, 14 Nov 2023 08:58:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 04/10] hw/xen: Factor xen_arch_align_ioreq_data()
 out of handle_ioreq()
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Paul Durrant <paul@xen.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <f791a822-f6f5-44fa-904b-f67d3f193763@email.android.com>
 <7a66c289-19e1-4690-8c6e-31a9f6344b6f@linaro.org>
 <e892e4eee469b1d1406dcd0844af48d1aaff23ae.camel@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <e892e4eee469b1d1406dcd0844af48d1aaff23ae.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/11/23 18:11, David Woodhouse wrote:
> On Mon, 2023-11-13 at 17:09 +0100, Philippe Mathieu-Daudé wrote:
>> On 13/11/23 16:58, Woodhouse, David wrote:
>>> On 13 Nov 2023 10:22, Philippe Mathieu-Daudé <philmd@linaro.org>
>>> wrote:
>>>
>>>      Per commit f17068c1c7 ("xen-hvm: reorganize xen-hvm and move
>>> common
>>>      function to xen-hvm-common"), handle_ioreq() is expected to be
>>>      target-agnostic. However it uses 'target_ulong', which is a
>>> target
>>>      specific definition.
>>>
>>>      In order to compile this file once for all targets, factor the
>>>      target-specific code out of handle_ioreq() as a per-target
>>> handler
>>>      called xen_arch_align_ioreq_data().
>>>
>>>      Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>      ---
>>>      Should we have a 'unsigned qemu_target_long_bits();' helper
>>>      such qemu_target_page_foo() API and target_words_bigendian()?
>>>
>>>
>>> It can be more fun than that though. What about
>>> qemu_target_alignof_uint64() for example, which differs between
>>> i386 and
>>> x86_64 and causes even structs with *explicitly* sized fields to
>>> differ
>>> because of padding.
>>>
>>> I'd *love* to see this series as a step towards my fantasy of being
>>> able
>>> to support Xen under TCG. After all, without that what's the point
>>> in
>>> being target-agnostic?
>>
>> Another win is we are building all these files once instead of one
>> for
>> each i386/x86_64/aarch64 targets, so we save CI time and Amazon
>> trees.
>>
>>> However, I am mildly concerned that some of these files are
>>> accidentally
>>> using the host ELF ABI, perhaps with explicit management of 32-bit
>>> compatibility, and the target-agnosticity is purely an illusion?
>>>
>>> See the "protocol" handling and the three ABIs for the ring in
>>> xen-block, for example.
>>
>> If so I'd expect build failures or violent runtime assertions.
> 
> Heh, mostly the guest just crashes in the cases I've seen so far.
> 
> See commit a1c1082908d ("hw/xen: use correct default protocol for xen-
> block on x86").
> 
>> Reviewing quickly hw/block/dataplane/xen-block.c, this code doesn't
>> seem target specific at all IMHO. Otherwise I'd really expect it to
>> fail compiling. But I don't know much about Xen, so I'll let block &
>> xen experts to have a look.
> 
> Where it checks dataplane->protocol and does different things for
> BLKIF_PROTOCOL_NATIVE/BLKIF_PROTOCOL_X86_32/BLKIF_PROTOCOL_X86_64, the
> *structures* it uses are intended to be using the correct ABI. I think
> the structs for BLKIF_PROTOCOL_NATIVE may actually be *different*
> according to the target, in theory?

OK I see what you mean, blkif_back_rings_t union in hw/block/xen_blkif.h

These structures shouldn't differ between targets, this is the point of
an ABI :) And if they were, they wouldn't compile as target agnostic.

> I don't know that they are *correct* right now, if the host is
> different from the target. But that's just a bug (that only matters if
> we ever want to support Xen-compatible guests using TCG).
> 
>>> Can we be explicit about what's expected to work here and what's
>>> not in scope?
>>
>> What do you mean? Everything is expected to work like without this
>> series applied :)
> 
> I think that if we ever do support Xen-compatible guests using TCG,
> we'll have to fix that bug and use the right target-specific
> structures... and then perhaps we'll want the affected files to
> actually become target-specfic again?
> 
> I think this series makes it look like target-agnostic support *should*
> work... but it doesn't really?

For testing we have:

aarch64: tests/avocado/boot_xen.py
x86_64: tests/avocado/kvm_xen_guest.py

No combination with i386 is tested,
Xen within aarch64 KVM is not tested (not sure it works).


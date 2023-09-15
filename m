Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 163627A125C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 02:33:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602793.939545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgwls-0007tM-FW; Fri, 15 Sep 2023 00:33:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602793.939545; Fri, 15 Sep 2023 00:33:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgwls-0007qL-Cf; Fri, 15 Sep 2023 00:33:20 +0000
Received: by outflank-mailman (input) for mailman id 602793;
 Fri, 15 Sep 2023 00:33:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=upey=E7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qgwlr-0007q9-5E
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 00:33:19 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7625747f-535f-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 02:33:16 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-52bcd4db4e6so1849727a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 17:33:16 -0700 (PDT)
Received: from [192.168.1.10] (host-92-12-44-130.as13285.net. [92.12.44.130])
 by smtp.gmail.com with ESMTPSA id
 lc3-20020a170906dfe300b00982a352f078sm1657125ejc.124.2023.09.14.17.33.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 17:33:15 -0700 (PDT)
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
X-Inumbo-ID: 7625747f-535f-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694737996; x=1695342796; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qvr3LUTPCnlzdeJGe9jKxP+vA9Fp/a5KVBNv/Iu61xg=;
        b=MRDw8CUkjNVxNS/+PPbYC+zSt+LWRAeJaA0VnV7K7eg5zLE+HoR/jdTZ/tEKub9ekR
         aCn3tatUds3nvQOOOtL9n24vkuaczQKsxldo0Mqy7UzWimNYsQyRkT9qJixO4rbGfPGQ
         Qd+qD72lBWsNrOi+kqiBupUUr+uI+BsWvuGtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694737996; x=1695342796;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qvr3LUTPCnlzdeJGe9jKxP+vA9Fp/a5KVBNv/Iu61xg=;
        b=ijxhHF6vng8xTQ7kPhJsOx8x+IEDdV1jERkiYBf2ldhTx4I7ArkniTGoPr6J61qKx9
         vfnGAYg/JoRkcWOOSTkoeNDBr318WNhtkLKnazrCo6Wxa9DnwyBtBnhIsQe6Cpq0Gvu9
         dP9O9fgubLLYh0hD4DRPk9SA7zV4PAJc+EfAAA7wXJfMw7IsUsPMDLPq3noEJh42/N6s
         Fj/SzW1LM6Q/fMe41I/u41wgTMwURpN6jr3/jMTsCZsmw0tcEYJpFe7n3UBdmIJOpGkH
         umxKTFJXC3jrgMm0fsRR//4Gvs6k5FbAoQwIYns8Xxg7QrLjqIHQTB49HbQh7AJpHGE4
         x9wA==
X-Gm-Message-State: AOJu0YyzVEeGKil2KRtnl23jiOg+q7SOg/2ehnuxe8oMN8zdynNB5L/5
	lHfAKnnGyvCOpbFjFSWq+7s3/g==
X-Google-Smtp-Source: AGHT+IHViSUcArYmWr6MhrGopGlxIfnNZ7LWPvwSUNL0WVRYHkDsfzmJtBUWnPFw5fHbDPHMAHqaLQ==
X-Received: by 2002:a17:906:5392:b0:9a2:23b:db60 with SMTP id g18-20020a170906539200b009a2023bdb60mr16582ejo.54.1694737996072;
        Thu, 14 Sep 2023 17:33:16 -0700 (PDT)
Message-ID: <50e96f85-66f8-2a4f-45c9-a685c757bb28@citrix.com>
Date: Fri, 15 Sep 2023 01:33:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: andrew.cooper3@citrix.com
Subject: Re: [PATCH v10 03/38] x86/msr: Add the WRMSRNS instruction support
Content-Language: en-GB
To: Thomas Gleixner <tglx@linutronix.de>, Xin Li <xin3.li@intel.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, luto@kernel.org, pbonzini@redhat.com,
 seanjc@google.com, peterz@infradead.org, jgross@suse.com,
 ravi.v.shankar@intel.com, mhiramat@kernel.org, jiangshanlai@gmail.com
References: <20230914044805.301390-1-xin3.li@intel.com>
 <20230914044805.301390-4-xin3.li@intel.com>
 <6f5678ff-f8b1-9ada-c8c7-f32cfb77263a@citrix.com> <87y1h81ht4.ffs@tglx>
 <7ba4ae3e-f75d-66a8-7669-b6eb17c1aa1c@citrix.com> <87v8cc1ehe.ffs@tglx>
In-Reply-To: <87v8cc1ehe.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/09/2023 1:12 am, Thomas Gleixner wrote:
> On Fri, Sep 15 2023 at 00:46, andrew wrote:
>> On 15/09/2023 12:00 am, Thomas Gleixner wrote:
>>> So no. I'm fundamentally disagreeing with your recommendation. The way
>>> forward is:
>>>
>>>   1) Provide the native variant for wrmsrns(), i.e. rename the proposed
>>>      wrmsrns() to native_wrmsr_ns() and have the X86_FEATURE_WRMSRNS
>>>      safety net as you pointed out.
>>>
>>>      That function can be used in code which is guaranteed to be not
>>>      affected by the PV_XXL madness.
>>>
>>>   2) Come up with a sensible solution for the PV_XXL horrorshow
>>>
>>>   3) Implement a sane general variant of wrmsr_ns() which handles
>>>      both X86_FEATURE_WRMSRNS and X86_MISFEATURE_PV_XXL
>>>
>>>   4) Convert other code which benefits from the non-serializing variant
>>>      to wrmsr_ns()
>> Well - point 1 is mostly work that needs reverting as part of completing
>> point 3, and point 2 clearly needs doing irrespective of anything else.
> No. #1 has a value on its own independent of the general variant in #3.
>
>>>      That function can be used in code which is guaranteed to be not
>>>      affected by the PV_XXL madness.
> That makes a lot of sense because it's guaranteed to generate better
> code than whatever we come up with for the PV_XXL nonsense.

It's an assumption about what "definitely won't" be paravirt in the future.

XenPV stack handling is almost-FRED-like and has been for the better
part of two decades.

You frequently complain that there's too much black magic holding XenPV
together.  A paravirt-FRED will reduce the differences vs native
substantially.

~Andrew


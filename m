Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F16BD407D46
	for <lists+xen-devel@lfdr.de>; Sun, 12 Sep 2021 14:33:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185238.333938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPOe6-0007vr-2x; Sun, 12 Sep 2021 12:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185238.333938; Sun, 12 Sep 2021 12:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPOe5-0007tC-V3; Sun, 12 Sep 2021 12:31:41 +0000
Received: by outflank-mailman (input) for mailman id 185238;
 Sun, 12 Sep 2021 12:31:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AfbI=OC=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1mPOe4-0007t6-VE
 for xen-devel@lists.xenproject.org; Sun, 12 Sep 2021 12:31:41 +0000
Received: from mail-pf1-x432.google.com (unknown [2607:f8b0:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f738e494-b194-4bae-9350-8ecbb53cc5eb;
 Sun, 12 Sep 2021 12:31:39 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id 18so6239852pfh.9
 for <xen-devel@lists.xenproject.org>; Sun, 12 Sep 2021 05:31:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z9sm3970376pfn.22.2021.09.12.05.31.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 05:31:38 -0700 (PDT)
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
X-Inumbo-ID: f738e494-b194-4bae-9350-8ecbb53cc5eb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=l2bSjNJqTwhQZphEwMAU513EeIhPI7Thg1lJpA7i8fs=;
        b=R66inDcAWt9GQlblcZebPLMwPlHlAnt0L3kyGlH8r3X6FsDI/N/vYwneGzy6f53yoC
         aJSbeJ2HVLZ5IETneJLglbqjOoAzPmPkvYhRyqU7w9yu4eGlZVUBvR4cBjWxsVNMWyQs
         qiLol3oXEuJFHpxM5XDG2HifDgtIlXc6Y+gNn2EVYS2UFBYwOF9tNaPzUqjb6c9xEMKD
         EpbKtmy5jQyQ9JwjSHSZdDyKcuXW75ONjIPM4WmszEr/HJrFRo+qRBybdHwe5FUddKSp
         VhyKUscbCxv1rziWUD7Bm32+mC15T8UjtL/0R3OkiO3/Lb77FRexMdrsOVYoCJhihCLc
         vdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=l2bSjNJqTwhQZphEwMAU513EeIhPI7Thg1lJpA7i8fs=;
        b=sG97wLIrtQNifhcFYEA4qJkAH9NdWe/nzb0Z/raXmv3yMagpV/8TV8fjNCte668fAz
         NLr+CwiP7hvApaJb3K0inkqLtvZ3VESG5H+3+XtClZJJkqampfrved0H+aoAmTKQ2Kyl
         FlOYpW7CFQRDPlUl36OgU25rjWKu3DJc+Px+VTyKPAMJarV4/MumY2VC5CXQglfqSpZi
         zW4JuIvFg+9k2kO4OR4eR9PKHDOYgIwnoHmdYO0lXYgbLNaEd99Wz0cGfPw+Io96ZQ0E
         c5f70f9krxNRRkmYg4OY//xdX3JDWaLZeksWYFqg3TlnzxJ2iZjI7HJeRRUekleXCb8K
         bDww==
X-Gm-Message-State: AOAM531idabQ9nk8t5jveiwy2UJ3GRKMFKr88Lodn5tIH33+JFxeU+wf
	REdJIDnN67X/E1TyH0kDIaMfzQ==
X-Google-Smtp-Source: ABdhPJxYx4l/5Z0anqBV+G7Bghe5EKN+RrvdQIUDU4YrpZdFpP+VKFzDEwt6BtZ6HBag6jIPDdKEog==
X-Received: by 2002:a63:5413:: with SMTP id i19mr6469698pgb.297.1631449898733;
        Sun, 12 Sep 2021 05:31:38 -0700 (PDT)
Subject: Re: [PATCH v3 21/30] target/ppc: Introduce
 PowerPCCPUClass::has_work()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Greg Kurz <groug@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff
 <crwulff@gmail.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marek Vasut <marex@denx.de>, Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Stafford Horne <shorne@gmail.com>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-22-f4bug@amsat.org> <YTFxZb1Vg5pWVW9p@yekko>
 <fd383a02-fb9f-8641-937f-ebe1d8bb065f@linaro.org>
 <fc98e293-f2ba-8ca0-99c8-f07758b79d73@amsat.org>
 <a49e0100-74d1-2974-990f-a05f9f796cc5@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <82c9e627-016a-e834-6ed0-4c5d49b554e6@linaro.org>
Date: Sun, 12 Sep 2021 05:31:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a49e0100-74d1-2974-990f-a05f9f796cc5@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/11/21 3:31 PM, Philippe Mathieu-Daudé wrote:
> On 9/3/21 11:11 PM, Philippe Mathieu-Daudé wrote:
>> On 9/3/21 10:42 PM, Richard Henderson wrote:
>>> On 9/3/21 2:50 AM, David Gibson wrote:
>>>> On Thu, Sep 02, 2021 at 06:15:34PM +0200, Philippe Mathieu-Daudé wrote:
>>>>> Each POWER cpu has its own has_work() implementation. Instead of
>>>>> overloading CPUClass on each PowerPCCPUClass init, register the
>>>>> generic ppc_cpu_has_work() handler, and have it call the POWER
>>>>> specific has_work().
>>>>
>>>> I don't quite see the rationale for introducing a second layer of
>>>> indirection here.  What's wrong with switching the base has_work for
>>>> each cpu variant?
>>>
>>> We're moving the hook from CPUState to TCGCPUOps.
>>> Phil was trying to avoid creating N versions of
>>>
>>> static const struct TCGCPUOps ppc_tcg_ops = {
>>>      ...
>>> };
>>
>> Ah yes this is the reason! Too many context switching so
>> I forgot about it.
>>
>>> A plausible alternative is to remove the const from this struct and
>>> modify it, just as we do for CPUState, on the assumption that we cannot
>>> mix and match ppc cpu types in any one machine.
>>
>> I thought about this case and remembered how it works on the ARM arch,
>> i.e. ZynqMP machine uses both Cortex-R5F and Cortex-A53. Even if no
>> similar PPC machine exists, IMHO we should try to generally allow to
>> possibility to experiment machine with different CPUs. Restricting it
>> on PPC goes the other way around. Thoughts?
> 
> I'm running out of ideas to do avoid the indirection and multiple
> copies of TCGCPUOps. I'm not giving up, I suppose I'm simply not
> seeing it... David, any suggestions?

I think multiple copies of TCGCPUOps is the solution.  Macro-ized, perhaps, so that the 
amount of typing is minimal across the versions.


r~


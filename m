Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CC440074F
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 23:12:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178503.324548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMGTY-000066-3W; Fri, 03 Sep 2021 21:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178503.324548; Fri, 03 Sep 2021 21:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMGTY-0008Vm-0N; Fri, 03 Sep 2021 21:11:52 +0000
Received: by outflank-mailman (input) for mailman id 178503;
 Fri, 03 Sep 2021 21:11:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wQk4=NZ=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1mMGTX-0008Vg-0W
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 21:11:51 +0000
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd593490-6877-4ccb-b84e-dcd243829007;
 Fri, 03 Sep 2021 21:11:50 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id b6so457037wrh.10
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 14:11:50 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id s205sm411532wme.4.2021.09.03.14.11.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 14:11:48 -0700 (PDT)
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
X-Inumbo-ID: bd593490-6877-4ccb-b84e-dcd243829007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jI43SKJbesP12DNmL3/e0Usr50r2XgSNCcYV6kiyq6k=;
        b=XH5LRShQJoZBhky3eh03Pmb9SkQ32XBteRsyogRiPstHFr6orcBCJeqTh6+8uA9Ugj
         hwUHRkbv3Iki29kH6SULZWWaPVeHLm9dOZGMJp/KvL+iV9qeA3IsgO7aPDi6dPOxdM5Q
         ws2BSkCdqzZ3QGSkRU4XFRPZC9C8RO5eAPwO0xHZyZ51hswyi5ZlgnIK0hazE40GI5Vy
         pDzx5Z2/NQxO+YOF01K7Wot3MRs8tFcfTdIvEFWt3PL9aHwjDLKgNplb2i8xQwHyzDKi
         JVFun0OPCzM5tItFSKRVH8Yfw5eizrEfOkYRFD8WnJK9txMG72i4kstdXmKL8/qxt3TH
         7oMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jI43SKJbesP12DNmL3/e0Usr50r2XgSNCcYV6kiyq6k=;
        b=QaLqBsoiTZipwKiltx1WkeslU9Yq6UFpgzyQKEmB+fEoCphbc271rGkjP2E4uNqdTo
         vSfOiEFzaBOTrc31aM/n66Q7+Nmu68ezfX9SoK0IPnovXrs8h/5o7D2GA87TBNTmXP+f
         1Npht6E1mnD0c0PNNzGtg0WeWcMT/NSLFiEpM6QRw4FXFvmNhBB2lBS5yekOaTKOTOzH
         LwAdxNCs1Lj1L5Bv6O59FfKGU7byDaUkfvBPehqZz+VxmHbgZc+WycBzBi8RVXgFmGZm
         RSWfh0RZKj0swin51jmJQCrUzs62UghacP4hicwY4Fg2wXnh1fVgaWGL67wJkRLD33kI
         y11w==
X-Gm-Message-State: AOAM5314DauI7bUhWK3I/wPgPN1hoDv7LxLkE0kxhgHIw3bxLbLARYPF
	8jv5tukkhhtsr6fsF9sthfU=
X-Google-Smtp-Source: ABdhPJx9z+1i4IwrqpeoM/m67lAEAeVLF6XhWOMCvs9W+7ge742xu6/mLFLJYvAuNvjtGUuedCA5Yg==
X-Received: by 2002:a5d:40d1:: with SMTP id b17mr974069wrq.47.1630703509319;
        Fri, 03 Sep 2021 14:11:49 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v3 21/30] target/ppc: Introduce
 PowerPCCPUClass::has_work()
To: Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Greg Kurz <groug@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Stafford Horne <shorne@gmail.com>, Marek Vasut <marex@denx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Greg Kurz <groug@kaod.org>, Cameron Esfahani <dirty@apple.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-22-f4bug@amsat.org> <YTFxZb1Vg5pWVW9p@yekko>
 <fd383a02-fb9f-8641-937f-ebe1d8bb065f@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fc98e293-f2ba-8ca0-99c8-f07758b79d73@amsat.org>
Date: Fri, 3 Sep 2021 23:11:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fd383a02-fb9f-8641-937f-ebe1d8bb065f@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/3/21 10:42 PM, Richard Henderson wrote:
> On 9/3/21 2:50 AM, David Gibson wrote:
>> On Thu, Sep 02, 2021 at 06:15:34PM +0200, Philippe Mathieu-Daudé wrote:
>>> Each POWER cpu has its own has_work() implementation. Instead of
>>> overloading CPUClass on each PowerPCCPUClass init, register the
>>> generic ppc_cpu_has_work() handler, and have it call the POWER
>>> specific has_work().
>>
>> I don't quite see the rationale for introducing a second layer of
>> indirection here.  What's wrong with switching the base has_work for
>> each cpu variant?
> 
> We're moving the hook from CPUState to TCGCPUOps.
> Phil was trying to avoid creating N versions of
> 
> static const struct TCGCPUOps ppc_tcg_ops = {
>     ...
> };

Ah yes this is the reason! Too many context switching so
I forgot about it.

> A plausible alternative is to remove the const from this struct and
> modify it, just as we do for CPUState, on the assumption that we cannot
> mix and match ppc cpu types in any one machine.

I thought about this case and remembered how it works on the ARM arch,
i.e. ZynqMP machine uses both Cortex-R5F and Cortex-A53. Even if no
similar PPC machine exists, IMHO we should try to generally allow to
possibility to experiment machine with different CPUs. Restricting it
on PPC goes the other way around. Thoughts?


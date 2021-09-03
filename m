Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 125264006BB
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 22:38:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178450.324459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFwv-0007qp-Fx; Fri, 03 Sep 2021 20:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178450.324459; Fri, 03 Sep 2021 20:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFwv-0007o7-Ct; Fri, 03 Sep 2021 20:38:09 +0000
Received: by outflank-mailman (input) for mailman id 178450;
 Fri, 03 Sep 2021 20:38:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wQk4=NZ=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1mMFwu-0007o1-HC
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 20:38:08 +0000
Received: from mail-wr1-x42e.google.com (unknown [2a00:1450:4864:20::42e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6addfb9-5549-498b-b27b-2b8be1ab465b;
 Fri, 03 Sep 2021 20:38:07 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id b10so429128wru.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 13:38:07 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id d8sm283071wrv.20.2021.09.03.13.38.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:38:06 -0700 (PDT)
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
X-Inumbo-ID: d6addfb9-5549-498b-b27b-2b8be1ab465b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fNIhsoAMPvZrQEmEvDEa/ofLQCAFlDFx6OPwYJbakLA=;
        b=OL7bcNknLzAqSVlHwkuNrFgmHEdJJTT0ywZpM33E+WzKRYLTjn/SmGnREPXGBif/IU
         PqPcK3SjLG5eogScB3jtfBXh29opHuqZSJGeNZd9Ke+t/AT5Cr5VwhVWY6Gtra5FS44y
         zIqcsHP71yoBrqPd/tqJ/b53dF7tqywgJ6KeJPrt2jdTFotMdIWIPMYLMJAvvMhlNjSQ
         H2ILUDze/pO7mpdvET5jz2pXK4k5IhHgCgzK6c3TFxwQ/zgNvWS7KYfj6KO8XO/AjwPO
         FYIYxhtgYZeXyzLZ3F3EqMh3ogFwJ5iW7yzCb/zV+nhXKNxtMozTPxiBRByP9xmArzZh
         7eKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fNIhsoAMPvZrQEmEvDEa/ofLQCAFlDFx6OPwYJbakLA=;
        b=cxEMaYPnkonMt3PmJ7YXDzxmVYiP6gVk7XPAa/XOWjX9Kio7bKVs6D4daS3tCm17ti
         M2urxuU7iXlRVK0KP351lKoXvuQ9YeaO49bYsSQH0+4Xy/IjbKKyVEe74A+W463c5U/M
         ozf2lYiF6MOqP+CvOalPBsbVdbaeBLdPy5iz+AiDXV00Es0RIvj40HUzOkw6Fzx6k9xj
         ujcGqcVyMeoZMgE5DeopaCkAgHKXOBsPmprTZu3hHiDV/e3vd9ZOuJax/PgN1zig3sv3
         hjLMg1gIXixJvRDquv9RPowK/kWdSxa1wWhhs1Flc0uvDi4X4XdRzJPo1sZTewk5W+9r
         JDlg==
X-Gm-Message-State: AOAM531ppCrPIIweoaqsr7bxac7SuZ+szL0o/6OEmxJgb4oO0E9kWJW+
	g5lzCcx3GYs8nd7sebufCDA=
X-Google-Smtp-Source: ABdhPJz6x+pWgErAspkEq96cAfi2JjZZYOWbgKHTQiSSXfqb5WO1BMDSjMrLjiY2+IXe9aaRofWxVQ==
X-Received: by 2002:adf:80e5:: with SMTP id 92mr881885wrl.300.1630701486851;
        Fri, 03 Sep 2021 13:38:06 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v3 21/30] target/ppc: Introduce
 PowerPCCPUClass::has_work()
To: David Gibson <david@gibson.dropbear.id.au>
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
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, Cameron Esfahani <dirty@apple.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-22-f4bug@amsat.org> <YTFxZb1Vg5pWVW9p@yekko>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1d8ea9ea-dda0-bf0e-a2c8-13d36c891d9c@amsat.org>
Date: Fri, 3 Sep 2021 22:38:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTFxZb1Vg5pWVW9p@yekko>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/3/21 2:50 AM, David Gibson wrote:
> On Thu, Sep 02, 2021 at 06:15:34PM +0200, Philippe Mathieu-Daudé wrote:
>> Each POWER cpu has its own has_work() implementation. Instead of
>> overloading CPUClass on each PowerPCCPUClass init, register the
>> generic ppc_cpu_has_work() handler, and have it call the POWER
>> specific has_work().
> 
> I don't quite see the rationale for introducing a second layer of
> indirection here.  What's wrong with switching the base has_work for
> each cpu variant?
> 
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  target/ppc/cpu-qom.h  |  3 +++
>>  target/ppc/cpu_init.c | 26 ++++++++++++++++++--------
>>  2 files changed, 21 insertions(+), 8 deletions(-)

>> @@ -8796,6 +8800,12 @@ static bool ppc_cpu_has_work(CPUState *cs)
>>      PowerPCCPU *cpu = POWERPC_CPU(cs);
>>      CPUPPCState *env = &cpu->env;
>>  
>> +    if (cs->halted) {
>> +        PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);

Maybe I should have kept the 'if (cs->halted)' for the next patch,
simply dispatch here, then in the next patch the code simplification
is more apparent. I thought this approach would involve less #ifdef'ry
but haven't checked the other way around. Will do now.

>> +        return pcc->has_work(cs);
>> +    }
>> +
>>      return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
>>  }
>>  #endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
> 


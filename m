Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9AE4006B2
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 22:34:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178444.324449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFtV-0007Ay-1r; Fri, 03 Sep 2021 20:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178444.324449; Fri, 03 Sep 2021 20:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFtU-00078R-U7; Fri, 03 Sep 2021 20:34:36 +0000
Received: by outflank-mailman (input) for mailman id 178444;
 Fri, 03 Sep 2021 20:34:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wQk4=NZ=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1mMFtS-00078L-Or
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 20:34:34 +0000
Received: from mail-wr1-x42e.google.com (unknown [2a00:1450:4864:20::42e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34b6fe07-1500-404c-8bd7-17c66be5d3a3;
 Fri, 03 Sep 2021 20:34:34 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id u9so356496wrg.8
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 13:34:33 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id d7sm258631wrs.39.2021.09.03.13.34.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:34:32 -0700 (PDT)
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
X-Inumbo-ID: 34b6fe07-1500-404c-8bd7-17c66be5d3a3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LFeEcrxPmiQ0y9mkjFms4J4GrCvxgbbAZyrEPk3foT8=;
        b=blhwVscSGxsnvMX9mpwF1WKnN0xyca3wo+jPJrvx7iJfDyuaVBJ0KE2ZZYoLwyB4Qb
         4ovLs/5Mxxmi9wMRp2vY8kz61AoNMdOvCCJQ1ezWt/9nx9cQ0hjn+MeBnxsE8IfF+HWm
         MRXjSCyRODB4tHb2j9tg9SRHAw9DJhbv0/cKEArMyfVM1qOCRF3s4YzT2Dln7MMoqaZq
         y6iKsF7H+hxlB36Mu4fKWpUJ5EAdcOvfMVCI3XguqcRlT/JRvp5sK6I5Rgfg+ycwLNfj
         b/WnJWkRX3vTttRdmBA7xpv8BARViFg/xzi1CERUqrSWq87BIGBc2CT5TLVm4/NdQPul
         vUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LFeEcrxPmiQ0y9mkjFms4J4GrCvxgbbAZyrEPk3foT8=;
        b=Pg/bU+MXW2o8zWwj3yGcyIdnzQQ8i5zPWyxRRKE23dMRuwTVI3ZWtHqtk2XsF/yHqq
         4WYpG3mT/I9G3/llBmkMBsaSNqmRUAGUdTRSGmlLRdVnPyH87XXUbq4/BZpqhmnh2rUe
         mLn40IKquLmJOmSgmuUfWi+qlfDQI7bZFP0xLBCgapPMvh0VSsffWB3apiaIKhUzWd8k
         COtMXbG1P9WHRHKK4AM2HwS2vzFt3fVnF7HL5VQ/gO83g3TJWzLvMVByVYTBexKabtnu
         F5Od49oYqPE/wBczIXlE6LAguGS+jA3G5l7TPqrCKE0FoiSUjWWpMGFvESyC+fWs+GFp
         33vA==
X-Gm-Message-State: AOAM533TKda7709aZDLiRQy4AdGngZTqIbkWIyAkm/nnW9KLBo7Z74Qb
	FIWnuq58DHT8g5o23+rk2VA=
X-Google-Smtp-Source: ABdhPJzlEMbpTMPYknNobW93n1KQ+VYIJEKgvJhtzWFM57YHy480w/4A7Y7tiGaFvSIUZksLBnn7iw==
X-Received: by 2002:adf:804a:: with SMTP id 68mr886849wrk.236.1630701273190;
        Fri, 03 Sep 2021 13:34:33 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v3 08/30] target/alpha: Restrict has_work() handler to
 sysemu and TCG
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Marek Vasut <marex@denx.de>, Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Claudio Fontana <cfontana@suse.de>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Greg Kurz <groug@kaod.org>, Cameron Esfahani <dirty@apple.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-9-f4bug@amsat.org>
 <3cd48aba-a1a1-cde3-3175-e9c462fcb220@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <740a2e5c-3dad-fc7d-b54a-0c405faa605e@amsat.org>
Date: Fri, 3 Sep 2021 22:34:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3cd48aba-a1a1-cde3-3175-e9c462fcb220@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/3/21 10:18 PM, Richard Henderson wrote:
> On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
>> Restrict has_work() to TCG sysemu.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   target/alpha/cpu.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
>> index 93e16a2ffb4..32cf5a2ea9f 100644
>> --- a/target/alpha/cpu.c
>> +++ b/target/alpha/cpu.c
>> @@ -33,6 +33,7 @@ static void alpha_cpu_set_pc(CPUState *cs, vaddr value)
>>       cpu->env.pc = value;
>>   }
>>   +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>>   static bool alpha_cpu_has_work(CPUState *cs)
> 
> Drop CONFIG_TCG for alpha; it's always true.

What is the rational? "Old" architectures (with no active /
official hw development) are unlikely to add hardware
acceleration, so TCG is the single one possible? Thus no
need to clutter the code with obvious #ifdef'ry?

> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> r~
> 


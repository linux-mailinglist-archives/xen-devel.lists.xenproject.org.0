Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 483B54006C0
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 22:39:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178454.324472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFxa-0008P6-Rs; Fri, 03 Sep 2021 20:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178454.324472; Fri, 03 Sep 2021 20:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFxa-0008MX-NX; Fri, 03 Sep 2021 20:38:50 +0000
Received: by outflank-mailman (input) for mailman id 178454;
 Fri, 03 Sep 2021 20:38:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lnve=NZ=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1mMFxZ-0008ML-9W
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 20:38:49 +0000
Received: from mail-wm1-x333.google.com (unknown [2a00:1450:4864:20::333])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc088393-fe84-4f62-bef7-11e0480e6a94;
 Fri, 03 Sep 2021 20:38:48 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id g138so98139wmg.4
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 13:38:48 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id w9sm286608wrs.7.2021.09.03.13.38.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:38:47 -0700 (PDT)
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
X-Inumbo-ID: bc088393-fe84-4f62-bef7-11e0480e6a94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GL9M66YPePviEeJIanaWkTBsfl1Vxvfhn+ruVwm7BCY=;
        b=M/vaAbEmKAIlbeJ47KCqDEuoW1fU8OLbdaCXy0Pvl+0fPEdToeVM22GDpxEzsjWt9v
         WbAqalwQ/WT+6kAtmN1B0nIOitKaIhJ157SyDHY79vxDGA3ucdaq3AJgPv1Ovs1Fv/aB
         1lSLTga+m6SS4hdqpDGzD3Th0/yrB0aZiBPiOV1Y9NoKc6DtcGD50FEYbqTQdUvsRoIH
         T4tRlzq2k7HSirKjelg2CrSPUYVuJ22AUaoX7n0jXoOTIEfbt+eiTX7puG0QvsvjemoW
         Tfwd8Zr/L/8FyDF1XuV7Wb/Ws8ZaMEPMWJ3/JlWVrBtMcJoHyoGb+mo3WTtGcH+kKg2w
         oQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GL9M66YPePviEeJIanaWkTBsfl1Vxvfhn+ruVwm7BCY=;
        b=qKhVfiRINwUR4SOv/yzH2Z5s8oTD+UQbZOcUBILm+Ggn9srTEzYNXaTPv72fhfmujn
         +R20a5MNP7NATCtlI4IR+rCn7wQa5pZi1gJQBC/Ulz79In4B0WRZODTtvDXd6rzexRaB
         5B12Hoa/dlCAwk2n8BuS1vTPB1Gu6VAjjGG5sVVU4YqnqMzipdhGoskDvZMIRlVlB2SQ
         wbvX9/+Cm5GWFpgLtB9fB+VA0ihdN72HigNg5bY04eb6dfG6fHvnZTZllaqM9D0it3Cm
         /Eh3dX3EilkqkaAKMgbLEHrp2hPoqZ9D+lMJ19qkLcBL3uTQnNgnFcCfALh+E2ElqOLE
         Gfww==
X-Gm-Message-State: AOAM5302iAA3z3G09/oMnf/b4ouYV6nBjN9rOp/F96B2qz/3NoVjWrmN
	ga0P0XM3A/u0jkNQU4zlgyBvAg==
X-Google-Smtp-Source: ABdhPJyQ/VEZImP2sey8PyCscUHWehgMFHJDN9IuQ3kxtIigmhduRyDKYPM4Bvm1IEM1SgOYGjMY+A==
X-Received: by 2002:a1c:2547:: with SMTP id l68mr468593wml.23.1630701527658;
        Fri, 03 Sep 2021 13:38:47 -0700 (PDT)
Subject: Re: [PATCH v3 08/30] target/alpha: Restrict has_work() handler to
 sysemu and TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
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
 <740a2e5c-3dad-fc7d-b54a-0c405faa605e@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8c70c273-cb11-c6da-a456-c906df86326b@linaro.org>
Date: Fri, 3 Sep 2021 22:38:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <740a2e5c-3dad-fc7d-b54a-0c405faa605e@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/3/21 10:34 PM, Philippe Mathieu-Daudé wrote:
>> Drop CONFIG_TCG for alpha; it's always true.
> 
> What is the rational? "Old" architectures (with no active /
> official hw development) are unlikely to add hardware
> acceleration, so TCG is the single one possible? Thus no
> need to clutter the code with obvious #ifdef'ry?

Correct.  Broadly, if git grep CONFIG_TCG is empty in a subdirectory, don't add the first 
instance.


r~


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EBE1EA02C
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 10:34:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jffsw-0006NC-Nb; Mon, 01 Jun 2020 08:33:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+AG4=7O=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jffsv-0006N7-BM
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 08:33:29 +0000
X-Inumbo-ID: 912979b8-a3e2-11ea-81bc-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 912979b8-a3e2-11ea-81bc-bc764e2007e4;
 Mon, 01 Jun 2020 08:33:28 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f185so10462543wmf.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 01:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Wb302sgiYxfPaOUVMNPVZTgMDWXAbDEM/6w0YEYyXVI=;
 b=qpAUJ/XnT4mWsnqFMatowAbLLFJq43367/cBpfL/d3ZzTAp/DFEljArpThGY9+x18V
 mEWL8q9LN1y/Kzo+yPVP9NuX/kfEdhcwtUoUfgf7soF39oOD56i779EDikiWNdymrWiX
 iGGtrBcC2jcRqrRl9ppZVn/1WCbmq4vVN9DSxtAyiWa1+q4pxj6qRzoay8n+SQrsR0yw
 xppjqFmvZcRSAqBhzHi3l+z0IJbui5cI7X5kxEJ1zcyLOImgzgUXu2H10/7ZMwXcJ4zi
 f2UOMruKHQPpVSt0R+Z8WeJyW7oZywqw1PT6JFEm2PiEbYoqydIw6Ah5rnt5mxbRKRnd
 TU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wb302sgiYxfPaOUVMNPVZTgMDWXAbDEM/6w0YEYyXVI=;
 b=lzE6NX2A4E5oJ42/NqQMTgUzeZX3rt0qS8QuNkykSPpaSuweR59yaoDpQcx/tgTuMC
 e3CaCwzcCm9E2qmos9AlAhCRVhAMpVQPCv8t3jyKTQ4ZwwUfetO0zP9kAwmgoIgj2hhN
 EpjermF4+LcpaY8uJeCX3LI3E2YHBvH/aSYw0HZPxWiY9yuu779fTTA21bLxM6nwg8So
 Lprxue3SDsBC1/jW5AUjC/6JzWaVdCk6k70PwBzH6FqKIqhU7X1dRaBI/nskEF1zO0vy
 cMQz/tveFrYfOU3OOGIv/PsZwPJ4Hjsq5OgWAr7v1YfGBAZdp93cy+msoPfSjfhiDVpY
 r2Kw==
X-Gm-Message-State: AOAM532E8dDAnJu6eX8dUEY0xyX717Ihte6FwSZR3yVFAVmfQapEu+JF
 PlECVcVjcQd09euJwTzrnuU=
X-Google-Smtp-Source: ABdhPJxCUGyTLCx6nC4rkNK06m7YbI0ofoKV10ACf5rgyiIrixi/EROQbo/YLaDXpnfOfoBnf+b5TA==
X-Received: by 2002:a1c:62d6:: with SMTP id w205mr19510946wmb.97.1591000407855; 
 Mon, 01 Jun 2020 01:33:27 -0700 (PDT)
Received: from [192.168.1.34] (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id l17sm11837037wmi.16.2020.06.01.01.33.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 01:33:27 -0700 (PDT)
Subject: Re: [PATCH 7/8] hw/i386/xen/xen-hvm: Use the IEC binary prefix
 definitions
To: paul@xen.org, qemu-devel@nongnu.org
References: <20200531173814.8734-1-f4bug@amsat.org>
 <20200531173814.8734-8-f4bug@amsat.org>
 <000001d637e5$f0c4b4f0$d24e1ed0$@xen.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <63327be6-10c1-6a8c-b4ed-cbbd085a35a8@amsat.org>
Date: Mon, 1 Jun 2020 10:33:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <000001d637e5$f0c4b4f0$d24e1ed0$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: 'Peter Maydell' <peter.maydell@linaro.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Eduardo Habkost' <ehabkost@redhat.com>,
 "'Michael S. Tsirkin'" <mst@redhat.com>, 'Andrew Jeffery' <andrew@aj.id.au>,
 'Helge Deller' <deller@gmx.de>, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?=27Herv=c3=a9_Poussineau=27?= <hpoussin@reactos.org>,
 'Joel Stanley' <joel@jms.id.au>,
 'Marcel Apfelbaum' <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, 'Anthony Perard' <anthony.perard@citrix.com>,
 'Paolo Bonzini' <pbonzini@redhat.com>, 'Richard Henderson' <rth@twiddle.net>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?=27C=c3=a9dric_Le_Goater=27?= <clg@kaod.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 6/1/20 9:26 AM, Paul Durrant wrote:
>> -----Original Message-----
>> From: Philippe Mathieu-Daudé <philippe.mathieu.daude@gmail.com> On Behalf Of Philippe Mathieu-Daudé
>> Sent: 31 May 2020 18:38
>> To: qemu-devel@nongnu.org
>> Cc: Andrew Jeffery <andrew@aj.id.au>; Helge Deller <deller@gmx.de>; Peter Maydell
>> <peter.maydell@linaro.org>; Richard Henderson <rth@twiddle.net>; Eduardo Habkost
>> <ehabkost@redhat.com>; Paul Durrant <paul@xen.org>; Hervé Poussineau <hpoussin@reactos.org>; Marcel
>> Apfelbaum <marcel.apfelbaum@gmail.com>; xen-devel@lists.xenproject.org; Paolo Bonzini
>> <pbonzini@redhat.com>; Stefano Stabellini <sstabellini@kernel.org>; Cédric Le Goater <clg@kaod.org>;
>> qemu-trivial@nongnu.org; Joel Stanley <joel@jms.id.au>; qemu-arm@nongnu.org; Michael S. Tsirkin
>> <mst@redhat.com>; Anthony Perard <anthony.perard@citrix.com>; qemu-ppc@nongnu.org; Philippe Mathieu-
>> Daudé <f4bug@amsat.org>
>> Subject: [PATCH 7/8] hw/i386/xen/xen-hvm: Use the IEC binary prefix definitions
>>
>> IEC binary prefixes ease code review: the unit is explicit.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/i386/xen/xen-hvm.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
>> index 82ece6b9e7..679d74e6a3 100644
>> --- a/hw/i386/xen/xen-hvm.c
>> +++ b/hw/i386/xen/xen-hvm.c
>> @@ -9,6 +9,7 @@
>>   */
>>
>>  #include "qemu/osdep.h"
>> +#include "qemu/units.h"
>>
>>  #include "cpu.h"
>>  #include "hw/pci/pci.h"
>> @@ -230,7 +231,7 @@ static void xen_ram_init(PCMachineState *pcms,
>>           * Xen does not allocate the memory continuously, it keeps a
>>           * hole of the size computed above or passed in.
>>           */
>> -        block_len = (1ULL << 32) + x86ms->above_4g_mem_size;
>> +        block_len = 4 * GiB + x86ms->above_4g_mem_size;
> 
> Not strictly necessary but could we retain the brackets please?

Sure.

Laurent, if this can go via your trivial@ tree, can you do the change or
you rather I resend the whole series?

> 
>   Paul
> 
>>      }
>>      memory_region_init_ram(&ram_memory, NULL, "xen.ram", block_len,
>>                             &error_fatal);
>> --
>> 2.21.3
> 
> 
> 


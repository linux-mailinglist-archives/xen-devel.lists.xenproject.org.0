Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E932147DA
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 20:08:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrmZU-0006nz-LX; Sat, 04 Jul 2020 18:07:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrmZT-0006nu-ST
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 18:07:27 +0000
X-Inumbo-ID: 37b8f670-be21-11ea-bb8b-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37b8f670-be21-11ea-bb8b-bc764e2007e4;
 Sat, 04 Jul 2020 18:07:27 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id j18so35045066wmi.3
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 11:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mZdfCBg4VmKOePgd4ZgEELl6kuOuKz4YZpkDO2WK/mg=;
 b=F2Xn7TA1uzAW8ytlKaIyS4FH6AXRlqhnEh7Gf8jIRWpe90/Agn2zEndE5uWg9TPPh2
 Pd+k1nFdIKd+lXbzlYVKgulsRPdNpaouObDppl6bLj9NDRrdIRhocgN+39xEMxQ98cMf
 27x2Ptfr6Coh+Aigug48khlW9MFKrzmZuNnBRyDt7CNNbUZomH0+JTZEgQ/b5OKydcQx
 824lfbGdQS3XigbBcy4nRTe0/gidZZnSa6IlBmoXqY9JM760s1WPVoc9nWLewNsAzsUx
 kH6yf1LuXqBVqa54YPW0eSuyYOLMVB6E2FDl83IBeGRwUHx9Z+eo3n9GLk3WoxviLU5+
 W1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mZdfCBg4VmKOePgd4ZgEELl6kuOuKz4YZpkDO2WK/mg=;
 b=cAFzKw5CeETBpvb1gPN0EQVzoDUilC1nhhcY6PPweC2fPNS5rb7hq64vzoNId8+phI
 MRxP82C3eE/zKoOM86+KhA5wvzGZP95ebVZJJkHlrp2h+Khivd7w7p2rXSWL3ENj8zCZ
 0mkKhIjyQqrKMw0BHBOA6kLwBo+QzEL0ZiXJcmmXH8tmUYsBbUjKYZvQQcjV1cm1yXKC
 2wWRSrs++HqmWWaO4eBtppN5Y+tXTNH3W3AVsKCC+xvn/MM/0fadfIQk67dWvw/kOVWw
 pGHo51Km45ednCu2t7y+DgJEBklkqxoHX0m7NseWquKxhHiml6LmOLrcCiioku88qomY
 jFmQ==
X-Gm-Message-State: AOAM533SGIxWIv49+a8lhMp1tDQchEneYe2FoBNBtVYeSdwiL7xH7GWw
 8j9esrvt4oQ8B4lBNNt1ItQ=
X-Google-Smtp-Source: ABdhPJzZWrQ0HgNVFoE6cODEZmoDzuftK1C6O0pwc+VU4hGUi2ilcK4PyTG4adTP9B6gXrmR2BdtTw==
X-Received: by 2002:a1c:3546:: with SMTP id c67mr42349957wma.102.1593886046288; 
 Sat, 04 Jul 2020 11:07:26 -0700 (PDT)
Received: from [192.168.1.39] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id h14sm18374863wrt.36.2020.07.04.11.07.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Jul 2020 11:07:25 -0700 (PDT)
Subject: Re: [PATCH 25/26] hw/usb/usb-hcd: Use XHCI type definitions
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-26-f4bug@amsat.org>
 <alpine.BSF.2.22.395.2007041918320.92265@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5520c5eb-b80f-4a44-8aa5-7512048482d1@amsat.org>
Date: Sat, 4 Jul 2020 20:07:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.BSF.2.22.395.2007041918320.92265@zero.eik.bme.hu>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Leif Lindholm <leif@nuviainc.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 7/4/20 7:19 PM, BALATON Zoltan wrote:
> On Sat, 4 Jul 2020, Philippe Mathieu-Daudé wrote:
>> Various machine/board/soc models create XHCI device instances
>> with the generic QDEV API, and don't need to access USB internals.
>>
>> Simplify header inclusions by moving the QOM type names into a
>> simple header, with no need to include other "hw/usb" headers.
>>
>> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> hw/usb/hcd-xhci.h        | 2 +-
>> include/hw/usb/usb-hcd.h | 3 +++
>> hw/ppc/spapr.c           | 2 +-
>> 3 files changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
>> index f9a3aaceec..b6c54e38a6 100644
>> --- a/hw/usb/hcd-xhci.h
>> +++ b/hw/usb/hcd-xhci.h
>> @@ -23,9 +23,9 @@
>> #define HW_USB_HCD_XHCI_H
>>
>> #include "usb-internal.h"
>> +#include "hw/usb/usb-hcd.h"
>>
>> #define TYPE_XHCI "base-xhci"
>> -#define TYPE_NEC_XHCI "nec-usb-xhci"
>> #define TYPE_QEMU_XHCI "qemu-xhci"
> 
> Why is qemu-xhci left here? Should that be moved to public header too?
> (Maybe no machine adds it but that's a public type too I think.)

I don't know because I never used it, but I guess you are right.

> 
> Regards.
> BALATON Zoltan
> 
>> #define XHCI(obj) \
>> diff --git a/include/hw/usb/usb-hcd.h b/include/hw/usb/usb-hcd.h
>> index c9d0a88984..56107fca62 100644
>> --- a/include/hw/usb/usb-hcd.h
>> +++ b/include/hw/usb/usb-hcd.h
>> @@ -30,4 +30,7 @@
>> #define TYPE_VT82C686B_USB_UHCI     "vt82c686b-usb-uhci"
>> #define TYPE_ICH9_USB_UHCI(n)       "ich9-usb-uhci" #n
>>
>> +/* XHCI */
>> +#define TYPE_NEC_XHCI "nec-usb-xhci"
>> +
>> #endif
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index db1706a66c..d8b3978f24 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -2961,7 +2961,7 @@ static void spapr_machine_init(MachineState
>> *machine)
>>         if (smc->use_ohci_by_default) {
>>             pci_create_simple(phb->bus, -1, TYPE_PCI_OHCI);
>>         } else {
>> -            pci_create_simple(phb->bus, -1, "nec-usb-xhci");
>> +            pci_create_simple(phb->bus, -1, TYPE_NEC_XHCI);
>>         }
>>
>>         if (spapr->has_graphics) {
>>


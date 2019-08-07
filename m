Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 935728510A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 18:25:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvOj3-000546-HX; Wed, 07 Aug 2019 16:23:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mnz/=WD=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1hvOj2-000541-4S
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 16:23:44 +0000
X-Inumbo-ID: b913429b-b92f-11e9-8980-bc764e045a96
Received: from mail-pl1-x632.google.com (unknown [2607:f8b0:4864:20::632])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b913429b-b92f-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 16:23:43 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id w24so41554898plp.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 09:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4apiCbiHeuX0AenKySgOMQa0zMkcp3aC9oI0N5dnMd0=;
 b=fSGMVc3CoPP+9MOYEXHyAwcORIXCCmaq7Nv6zcjo7HCIoK9K5iXXo+aVsOLWsfAE63
 kxNtr2NbOaya47/3XOLszH+MtxslXA6ls+xJcJTAd8kgM10Aof4+kB0N8rd7Jky78pTX
 HXhKVXiH6fLv841k26QbqIfg37n4iX1yfuNbu/2R6YSEzZAd18uOTawnvnSMe+dQEEzE
 2WT+b7XLe9VSEDwMZXM250ASOtxmEKs8q746H9gWQlgNXv9pqNItEhJtRMHZaEL04Tfk
 VJNrU4jXaJpGUZnBE+pY8Kt3VcZA5MPmNrXfb/PprwGqWrd/BOMWXua3bLTFF5FOiomg
 xDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4apiCbiHeuX0AenKySgOMQa0zMkcp3aC9oI0N5dnMd0=;
 b=ja+7Qj598yDdYw2eJVcu5/PusEV2fk4KZUnhSgAoFZvhpHr1CppYwZrmiunmmD9ih3
 r/lEIOzctAjcBv2ESSyEhX/B5HoDw97L2Jg74tUjWSFNN9jIzpSxFyksBkWFzqOEXDfI
 /DclnLhIdW9MZrLKebNNeNfmMlV7BCHAHkUH7zcYplLj/YBaJXkHytVj6zjMzcQ3hNaa
 XRJpLaGAEWrwZge7BDyRZV7uwCyHafiSAyZTiZ6E/u5eumsp/QXGkEvZNld+SzLQZctz
 aNt1nucqAklxu7Qn4aE53VVQ6dEUZXOWhLZSntYRU52LpkCzK8IDj3zbb7d8bj8i1sUR
 SAug==
X-Gm-Message-State: APjAAAWFqVc1v2E6kV16bE3PAGlLb8M1/acG5QuwSYERxAEtPp1kIgah
 C1X9bUWXwcB4akz+x9t5e3cu+g==
X-Google-Smtp-Source: APXvYqwDnK8/bYyxH+UVEZz17ysgwghpMF9hOWob3p6ybRQ0JVOaW65tPejEu01/JP+CoD/QM4ciOQ==
X-Received: by 2002:a63:f94c:: with SMTP id q12mr8342553pgk.10.1565195022628; 
 Wed, 07 Aug 2019 09:23:42 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id i124sm171005832pfe.61.2019.08.07.09.23.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 09:23:41 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166709139.77390@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3de18435-b9fd-24d1-1352-d1086ea224a1@linaro.org>
Date: Wed, 7 Aug 2019 09:23:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166709139.77390@bt.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v6 17/26] exec: Replace
 device_endian with MemOp
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, imammedo@redhat.com, sagark@eecs.berkeley.edu,
 david@redhat.com, jasowang@redhat.com, palmer@sifive.com,
 mark.cave-ayland@ilande.co.uk, laurent@vivier.eu, keith.busch@intel.com,
 jcmvbkbc@gmail.com, frederic.konrad@adacore.com, pbonzini@redhat.com,
 kraxel@redhat.com, edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn,
 pburton@wavecomp.com, marex@denx.de, robh@kernel.org, hare@suse.com,
 sstabellini@kernel.org, berto@igalia.com, proljc@gmail.com,
 qemu-block@nongnu.org, arikalo@wavecomp.com, jslaby@suse.cz, deller@gmx.de,
 mst@redhat.com, magnus.damm@gmail.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, mreitz@redhat.com, hpoussin@reactos.org,
 joel@jms.id.au, anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 rth@twiddle.net, philmd@redhat.com, green@moxielogic.com, atar4qemu@gmail.com,
 antonynpavlov@gmail.com, jiri@resnulli.us, ehabkost@redhat.com,
 minyard@acm.org, sw@weilnetz.de, alistair@alistair23.me, chouteau@adacore.com,
 b.galvani@gmail.com, eric.auger@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, peter.chubb@nicta.com.au, yuval.shaia@oracle.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, shorne@gmail.com,
 sundeep.lkml@gmail.com, jsnow@redhat.com, david@gibson.dropbear.id.au,
 kwolf@redhat.com, crwulff@gmail.com, qemu-riscv@nongnu.org,
 xiaoguangrong.eric@gmail.com, i.mitsyanko@gmail.com, lersek@redhat.com,
 cohuck@redhat.com, alex.williamson@redhat.com, Andrew.Baumann@microsoft.com,
 jcd@tribudubois.net, andrew@aj.id.au, michael@walle.cc,
 paul.durrant@citrix.com, qemu-ppc@nongnu.org, huth@tuxfamily.org,
 amarkovic@wavecomp.com, kbastian@mail.uni-paderborn.de, jan.kiszka@web.de,
 stefanb@linux.ibm.com, andrew.smirnov@gmail.com, aurelien@aurel32.net,
 clg@kaod.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC83LzE5IDE6MzEgQU0sIHRvbnkubmd1eWVuQGJ0LmNvbSB3cm90ZToKPiBTaW1wbGlmeSBl
bmRpYW5uZXNzIGNvbXBhcmlzb25zIHdpdGggY29uc2lzdGVudCB1c2Ugb2YgdGhlIG1vcmUKPiBl
eHByZXNzaXZlIE1lbU9wLgo+IAo+IFN1Z2dlc3RlZC1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJp
Y2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogVG9ueSBOZ3V5ZW4g
PHRvbnkubmd1eWVuQGJ0LmNvbQo+IC0tLQoKUmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29u
IDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPgoKCnJ+CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

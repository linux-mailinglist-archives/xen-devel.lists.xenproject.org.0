Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD34285048
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 17:50:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvOAX-0008HK-8I; Wed, 07 Aug 2019 15:48:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mnz/=WD=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1hvOAU-0008HA-W7
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 15:48:03 +0000
X-Inumbo-ID: bc6d2940-b92a-11e9-8980-bc764e045a96
Received: from mail-pl1-x642.google.com (unknown [2607:f8b0:4864:20::642])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bc6d2940-b92a-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 15:48:01 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id t14so41390770plr.11
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 08:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VDEsVbbZnitZv/zjndZKRIe4vwOmbwYZIOsMpNk3ebQ=;
 b=RVLg7BWv3CBJVe/avUoZpspK3GJNIJez1Z7w54GHlzZZOmRSlrkq/tPS2PNChBVLr8
 8pjmcInx1bE7xvrAEp6rua26vBSKahPj07l/M3gEk7Zz8G6naD9CYzr8MTTPaLI2awUr
 djak9esVAfjo8Wo1CvikhrDoypacMR0MwiNSDckmKpiQRnxXqRehZgpzONjiT05hUox3
 BuCUI/nMdt1d9U4kCpWnMkHG94zlXmngtUNmPasvKOFudsVEh4gDlM4y2AF84Xtx612H
 5+pQz31asGe+NRyn7AIyc36mAbRO4Q1W16i4pFdAEGekwTm4skbMmxer2GRt0xQGGUfY
 SADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VDEsVbbZnitZv/zjndZKRIe4vwOmbwYZIOsMpNk3ebQ=;
 b=ekW/qKpKltLJgsJa1KmPNWKwQtIYNFgt4BSOZ+zr2qpIZn/hwG+VR5UXPxrQAkKCB6
 wI6HNkpMH7D04xfJczDKto/cAQP41t6a6B5vBrHXNxmdxCiWJbNxRu4cydEtAI3cKcP5
 lM8hssF+LrxXfDVtAOA/pvI5SVJPjiDRXN9cSS8pBbAyvrGL+h+E2zPsw2dXLmREb7lD
 o2Y46+W/cCN+n/ODy0j5jmL/ptJfbNyb0mfc9fzUOtmjCyf8KkPWhJIzsxdOSVTSz78b
 v7tBdVQnD5dSxajMPFLWVJK7pFqOlGdQNlre2ozmV0j4Taans7qSYtn6kzGyhDfF2tVs
 TJ7g==
X-Gm-Message-State: APjAAAVhH5nfIS+PZUD2C7C6W/JXKW3UkbH3/3cJBX51Giy85e/+oQyS
 K2/cU56pBN8StqEK7rMiaWVEkQ==
X-Google-Smtp-Source: APXvYqybocu4flPeVmJWnkfdg+h4qK9Xs4NK5mlXbh8VvAvaeF0v60yuh9bLWnxQJYUgpDIh08u1Ow==
X-Received: by 2002:aa7:8383:: with SMTP id u3mr9983779pfm.175.1565192880884; 
 Wed, 07 Aug 2019 08:48:00 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id a6sm91814707pfa.162.2019.08.07.08.47.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 08:47:59 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166627824.57868@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <febf733f-d671-9c0e-8adc-7578254b9a6c@linaro.org>
Date: Wed, 7 Aug 2019 08:47:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166627824.57868@bt.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v6 13/26] target/mips: Hard
 code size with MO_{8|16|32|64}
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

T24gOC83LzE5IDE6MzAgQU0sIHRvbnkubmd1eWVuQGJ0LmNvbSB3cm90ZToKPiBUZW1wb3Jhcmls
eSBuby1vcCBzaXplX21lbW9wIHdhcyBpbnRyb2R1Y2VkIHRvIGFpZCB0aGUgY29udmVyc2lvbiBv
Zgo+IG1lbW9yeV9yZWdpb25fZGlzcGF0Y2hfe3JlYWR8d3JpdGV9IG9wZXJhbmQgInVuc2lnbmVk
IHNpemUiIGludG8KPiAiTWVtT3Agb3AiLgo+IAo+IE5vdyBzaXplX21lbW9wIGlzIGltcGxlbWVu
dGVkLCBhZ2FpbiBoYXJkIGNvZGVkIHNpemUgYnV0IHdpdGgKPiBNT197OHwxNnwzMnw2NH0uIFRo
aXMgaXMgbW9yZSBleHByZXNzaXZlIGFuZCBhdm9pZCBzaXplX21lbW9wIGNhbGxzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFRvbnkgTmd1eWVuIDx0b255Lm5ndXllbkBidC5jb20+Cj4gLS0tCj4gIHRh
cmdldC9taXBzL29wX2hlbHBlci5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogUmljaGFyZCBIZW5kZXJzb24g
PHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+CgoKcn4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

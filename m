Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD15085023
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 17:42:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvO1R-0007Jl-8H; Wed, 07 Aug 2019 15:38:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mnz/=WD=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1hvO1P-0007Jb-Qr
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 15:38:39 +0000
X-Inumbo-ID: 6d206983-b929-11e9-8980-bc764e045a96
Received: from mail-pl1-x641.google.com (unknown [2607:f8b0:4864:20::641])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6d206983-b929-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 15:38:39 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id i2so41407823plt.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 08:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PftTEUkCoQGe362ZEZQRYX9sDZAzdQEMj7x8oh2NOcM=;
 b=i93jK2k/eEXh/s5xW1NmBkmQdMpYgRueUNEoEdJA6BS31ztY69Nyq37PzB8JWgF/lB
 N2QggwEh+vXbE8yDZPdhbPCNs0FbqBNCaZg+W6bSfQYwPvAobo5VaiN/W5YbNrMvxcD1
 hv+UI9zNGPrqr5SBmpb9h3Vw2jWsRSwKHReaK94/BuxPBGUg0+4921bA++dX8FzcktRa
 owHMylkON/p9jPIv0+CHmH8QDPZHix4j35wdxNDV6Z4vJAcRX3VANUvcgnh4qsslStCu
 o85HUpzh9lFKIsWqFwfELJx1tnvDB9unjbM51K9ehFFBvtfGg5d+N/pBvBa/srZCdjLH
 u6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PftTEUkCoQGe362ZEZQRYX9sDZAzdQEMj7x8oh2NOcM=;
 b=br/e/bQqJBeHrHuFSgnptzwtwzeBXhBMyylrhvdQR7BU4zFCxNgh+XlF1dcIPfLAdk
 soYzvGLVbJ30jSFoeZQD7Y6FaTgslBp897wyd9kGQWccZL43lJOIVWZwtk+0N8wCB/Sk
 ySWs2QVVJyUZPNACL/i7Tic+eOZqJuPsL2r2yKwNKLaVVofm9UIp8FfK1Am3aI7PJLSC
 RNIZmjYNHBuqH8HZa0Qy6Dy2fwqwLeAP7VDM2ua3JHPLL+NRyEQyB7Mb8s2LV8nUW7Ve
 +lW2pwRRnAIuKUANbMk9V55sLYpqzADY6XlDB4em7YcVq537GzN9MuN82s0wxtGJbBUa
 td6g==
X-Gm-Message-State: APjAAAWP6PoHYq31SGWe55OBTkMmOQdBvFtVtPZ8RmWuf0hlZq4iZ59f
 Aa5+qXq7ahCrnvviXTgRmqWGYA==
X-Google-Smtp-Source: APXvYqxnVZu0/r8eCA+v13Jb+SQhfMD4VTKhziLeLvCX8Oeim2Ryxf4eL+v3g8JSdPwsPbUuCoe+zw==
X-Received: by 2002:a17:902:7894:: with SMTP id
 q20mr2067641pll.339.1565192318272; 
 Wed, 07 Aug 2019 08:38:38 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f88sm316107pjg.5.2019.08.07.08.38.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 08:38:36 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166587275.42474@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <652ad19a-ad54-7854-7d3e-03f1032cba7e@linaro.org>
Date: Wed, 7 Aug 2019 08:38:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166587275.42474@bt.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v6 11/26] memory: Access
 MemoryRegion with MemOp
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

T24gOC83LzE5IDE6MjkgQU0sIHRvbnkubmd1eWVuQGJ0LmNvbSB3cm90ZToKPiBDb252ZXJ0IG1l
bW9yeV9yZWdpb25fZGlzcGF0Y2hfe3JlYWR8d3JpdGV9IG9wZXJhbmQgInVuc2lnbmVkIHNpemUi
Cj4gaW50byBhICJNZW1PcCBvcCIuCj4gCj4gU2lnbmVkLW9mZi1ieTogVG9ueSBOZ3V5ZW4gPHRv
bnkubmd1eWVuQGJ0LmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9leGVjL21lbW9wLmggIHwgMTggKysr
KysrKysrKysrKy0tLS0tCj4gIGluY2x1ZGUvZXhlYy9tZW1vcnkuaCB8ICA5ICsrKysrLS0tLQo+
ICBtZW1vcnkuYyAgICAgICAgICAgICAgfCAgNyArKysrKy0tCj4gIDMgZmlsZXMgY2hhbmdlZCwg
MjMgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogUmljaGFyZCBI
ZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+Cgo+ICsvKiBNZW1PcCB0byBz
aXplIGluIGJ5dGVzLiAgKi8KPiArc3RhdGljIGlubGluZSB1bnNpZ25lZCBtZW1vcF9zaXplKE1l
bU9wIG9wKQo+ICt7Cj4gKyAgICByZXR1cm4gMSA8PCAoKG9wKSAmIE1PX1NJWkUpOwo+ICt9Cgpz
LyhvcCkvb3AvCgpUaGlzIGlzIG5vIGxvbmdlciBhIG1hY3JvIHJlcXVpcmluZyBzdWNoIHRoaW5n
cy4KCgpyfgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

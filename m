Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B4285043
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 17:50:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvOA9-0008Fl-Th; Wed, 07 Aug 2019 15:47:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mnz/=WD=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1hvOA7-0008Fc-VF
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 15:47:40 +0000
X-Inumbo-ID: ae835035-b92a-11e9-8980-bc764e045a96
Received: from mail-pl1-x643.google.com (unknown [2607:f8b0:4864:20::643])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ae835035-b92a-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 15:47:38 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id a93so41354384pla.7
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 08:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N5Bp3ItJAXMZdVduIZ4v6R1Z3VWXw1mBqjlslk24EpM=;
 b=DRHlOVERoqejgaH+XVNqMExp9Yi5VP74jjZRFO+Yd3nUrcgwbzUd2bl4qdA/VhiQRW
 9vqatYvv+CBBoJN6xUFds9wG4DoNUaNYP6c7Z0LC+cNzPDCIg1NxpPZmwuquEFX7axUl
 mDd3RpSio5xbh+nvn/n4kgvn6Kt+bKcsgWsi4Vy7/uJ3uIGCVQRmu48WzLIW7q/N4Mju
 Eddaf93rlbpUI5Xgu/y/Q2LNYx8NuOxjlsbmrISMtcHKS01x/3OxUEN3+0rz4W/tnxRQ
 trSLeuGrIcIA9QloY/1wflMPAseDOM/Dsm43xfJck4jbuYlEjn/nbRu6tx7Ekp0YOkw1
 /6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N5Bp3ItJAXMZdVduIZ4v6R1Z3VWXw1mBqjlslk24EpM=;
 b=q308gSscTxglD/n0MojOiBtVbPB6Kalp2wTUtgT1Vx6FIWnd2b+3OhcCdUJBjKAKwA
 i723Y57fOzmShdKS5qr8ha5LPfPU8k/L1DWgb/mHYC/CdtCJwqgdKCBfto75K9WM1UUQ
 OlQi6M3M8QsWaL7LBzWfT4tYhY67/0jbmk4Axxg70lylnRb2acbzR5XvxEa+z5j7NUjU
 yuiZmP3VabyNVaezQz+JVglpyerJccRkDy9d6NknQUOyAfJqKmQL/m5W4s/P4tgcLrpb
 QjJogYyjviiQ65heS7mB4v5vWDzR6Ge1IpLJUexILx3pVsxzN6f4HGpS3Vgd33oJTkco
 wAdQ==
X-Gm-Message-State: APjAAAVkNsa/w3319AXTFgr7f5tC+5K094YloKvvgH50iPu0m4iEYZHL
 8D1EBa/UZHXdn/nsmI8s5i0gIw==
X-Google-Smtp-Source: APXvYqyy2WcqvpYE99wqqW2WE5wx1J+xpxofJfHqFYLpjpHSmNvDWfUsRgUrJZGdGyfCyhIHXUgQkQ==
X-Received: by 2002:a17:902:8d97:: with SMTP id
 v23mr8562456plo.157.1565192857454; 
 Wed, 07 Aug 2019 08:47:37 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id 64sm93650185pfe.128.2019.08.07.08.47.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 08:47:36 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166604452.72353@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <96720b42-741f-5161-3344-c146fe184de3@linaro.org>
Date: Wed, 7 Aug 2019 08:47:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166604452.72353@bt.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v6 12/26] hw/s390x: Hard code
 size with MO_{8|16|32|64}
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
Z25lZC1vZmYtYnk6IFRvbnkgTmd1eWVuIDx0b255Lm5ndXllbkBidC5jb20+Cj4gLS0tCj4gIGh3
L3MzOTB4L3MzOTAtcGNpLWluc3QuYyB8IDMgKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMiBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8
cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KCgpyfgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs

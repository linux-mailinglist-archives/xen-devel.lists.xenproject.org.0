Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8CB915D7
	for <lists+xen-devel@lfdr.de>; Sun, 18 Aug 2019 11:17:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzHFq-0003Le-BV; Sun, 18 Aug 2019 09:13:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dkRd=WO=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1hzHFo-0003LZ-M4
 for xen-devel@lists.xenproject.org; Sun, 18 Aug 2019 09:13:36 +0000
X-Inumbo-ID: 74fba5d6-c198-11e9-a661-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74fba5d6-c198-11e9-a661-bc764e2007e4;
 Sun, 18 Aug 2019 09:13:35 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id q12so5587467wrj.12
 for <xen-devel@lists.xenproject.org>; Sun, 18 Aug 2019 02:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=08ykHv62/kAXNcraKtHpxP/q/+jI+lbPhBDJ0nAr1BU=;
 b=c4moUhMktTQM2REJR3Kcvd9R3Y3KbtNUkR2Xkmm19hB5a7iUHB9KfzaHvOOwR7fOQ4
 PdCVC/1lHi09tEPQJN52Tj3oxl4vtX6SFjQHt51h5dQQLuNOsivYsti+z4orzwNOUXZe
 T+WEI3E1iPcWB4sOHtD1K7IReWiE3Oc/KfYqFaLuUck5j8jnHRsLcdGXn9/0XoV6K8sD
 9p1wj8n4iSAV+rOGUX5RBK7kMAD/HVgDjrIQRUBc16/ADf2e52ozi9QrVChaun7K/Z15
 7mVZz5iifK7lius9LzxXoBM3OUa1tsFtsyMKjrLbC4CxDliOx8150Jy9eq4+/XEteiFM
 XsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=08ykHv62/kAXNcraKtHpxP/q/+jI+lbPhBDJ0nAr1BU=;
 b=djQulaFfMtXuuC0i4BrG0kQSV2L7K9DOZ4Fb4VgmA7leqDnzr1YbAqy6ynU3zRoAmv
 pdiiSK1xV1lr+5u6IaXXrT2Z5T2w6FXq+iE5aDb1RMRfRca7wwTQH4d3F7pRBzHZ7p7o
 1PJXwug3k6vIUNFaGKwmFbsqqObeyOag1VKEdFHaXICI9PnEx3hLznpP00v0UpzfhQ7P
 hNhGfS5GGLBsJWIl+yzMVhicQudjm6CmSIaPxz/Kb8no80wVnOit0uFyAKWiZH26HNop
 ONdH+MaR+rWV/8BjZBhvjf7ua+HF5DdV92ZrBkfIIzR+sG8hFQ+6+U3YRyxPq6heXyXU
 irxQ==
X-Gm-Message-State: APjAAAXPtwj0I/pQtTMwsMLDrU2kXvXx1yo4DotpW7FoTUkqJpHWv24T
 haQfNqgJAy6O6gPXOZfHPlRnhg==
X-Google-Smtp-Source: APXvYqx8mpO+txpXVJos3FkBAMd7w2U/VbzwDL8sGtDlgK3w1mDE1haj1s2PxyiYa+Ysj6ypriit0Q==
X-Received: by 2002:adf:e2cb:: with SMTP id d11mr20563632wrj.66.1566119614901; 
 Sun, 18 Aug 2019 02:13:34 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:a69:1700:8897:9507:94c2:b98d?
 ([2a02:c7f:a69:1700:8897:9507:94c2:b98d])
 by smtp.gmail.com with ESMTPSA id k9sm9410852wrq.15.2019.08.18.02.13.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 18 Aug 2019 02:13:33 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b53bdb6b-278e-7359-8cfb-48d8d07adc1f@linaro.org>
Date: Sun, 18 Aug 2019 10:13:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v7 00/42] Invert Endian bit in
 SPARCv9 MMU TTE
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
 cohuck@redhat.com, sagark@eecs.berkeley.edu, david@redhat.com,
 jasowang@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 i.mitsyanko@gmail.com, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, dmitry.fleytman@gmail.com, kraxel@redhat.com,
 edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn, pburton@wavecomp.com,
 xiaoguangrong.eric@gmail.com, peter.chubb@nicta.com.au, philmd@redhat.com,
 robh@kernel.org, hare@suse.com, sstabellini@kernel.org, berto@igalia.com,
 chouteau@adacore.com, qemu-block@nongnu.org, arikalo@wavecomp.com,
 jslaby@suse.cz, deller@gmx.de, mst@redhat.com, magnus.damm@gmail.com,
 jcd@tribudubois.net, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 mreitz@redhat.com, hpoussin@reactos.org, joel@jms.id.au,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 david@gibson.dropbear.id.au, lersek@redhat.com, green@moxielogic.com,
 atar4qemu@gmail.com, antonynpavlov@gmail.com, marex@denx.de, jiri@resnulli.us,
 ehabkost@redhat.com, minyard@acm.org, qemu-s390x@nongnu.org, sw@weilnetz.de,
 alistair@alistair23.me, yuval.shaia@oracle.com, b.galvani@gmail.com,
 eric.auger@redhat.com, alex.williamson@redhat.com, qemu-arm@nongnu.org,
 jan.kiszka@web.de, clg@kaod.org, stefanha@redhat.com,
 marcandre.lureau@redhat.com, shorne@gmail.com, jsnow@redhat.com,
 rth@twiddle.net, kwolf@redhat.com, qemu-riscv@nongnu.org, proljc@gmail.com,
 pbonzini@redhat.com, andrew@aj.id.au, claudio.fontana@suse.com,
 crwulff@gmail.com, laurent@vivier.eu, Andrew.Baumann@microsoft.com,
 sundeep.lkml@gmail.com, andrew.smirnov@gmail.com, michael@walle.cc,
 paul.durrant@citrix.com, qemu-ppc@nongnu.org, huth@tuxfamily.org,
 amarkovic@wavecomp.com, kbastian@mail.uni-paderborn.de, imammedo@redhat.com,
 aurelien@aurel32.net, stefanb@linux.ibm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8xNi8xOSA3OjI4IEFNLCB0b255Lm5ndXllbkBidC5jb20gd3JvdGU6Cj4gVG9ueSBOZ3V5
ZW4gKDQyKToKPiAgIGNvbmZpZ3VyZTogRGVmaW5lIFRBUkdFVF9BTElHTkVEX09OTFkgaW4gY29u
ZmlndXJlCj4gICB0Y2c6IFRDR01lbU9wIGlzIG5vdyBhY2NlbGVyYXRvciBpbmRlcGVuZGVudCBN
ZW1PcAo+ICAgbWVtb3J5OiBJbnRyb2R1Y2Ugc2l6ZV9tZW1vcAo+ICAgdGFyZ2V0L21pcHM6IEFj
Y2VzcyBNZW1vcnlSZWdpb24gd2l0aCBNZW1PcAo+ICAgaHcvczM5MHg6IEFjY2VzcyBNZW1vcnlS
ZWdpb24gd2l0aCBNZW1PcAo+ICAgaHcvaW50Yy9hcm12N21fbmljOiBBY2Nlc3MgTWVtb3J5UmVn
aW9uIHdpdGggTWVtT3AKPiAgIGh3L3ZpcnRpbzogQWNjZXNzIE1lbW9yeVJlZ2lvbiB3aXRoIE1l
bU9wCj4gICBody92ZmlvOiBBY2Nlc3MgTWVtb3J5UmVnaW9uIHdpdGggTWVtT3AKPiAgIGV4ZWM6
IEFjY2VzcyBNZW1vcnlSZWdpb24gd2l0aCBNZW1PcAo+ICAgY3B1dGxiOiBBY2Nlc3MgTWVtb3J5
UmVnaW9uIHdpdGggTWVtT3AKPiAgIG1lbW9yeTogQWNjZXNzIE1lbW9yeVJlZ2lvbiB3aXRoIE1l
bU9wCj4gICBody9zMzkweDogSGFyZCBjb2RlIHNpemUgd2l0aCBNT197OHwxNnwzMnw2NH0KPiAg
IHRhcmdldC9taXBzOiBIYXJkIGNvZGUgc2l6ZSB3aXRoIE1PX3s4fDE2fDMyfDY0fQo+ICAgZXhl
YzogSGFyZCBjb2RlIHNpemUgd2l0aCBNT197OHwxNnwzMnw2NH0KCkkgaGF2ZSBxdWV1ZWQgdGhl
c2UgMTQgcGF0Y2hlcyB0byB0Y2ctbmV4dDoKCiAgaHR0cHM6Ly9naXRodWIuY29tL3J0aDc2ODAv
cWVtdS90cmVlL3RjZy1uZXh0CgpJIGFncmVlIHdpdGggdGhlIGRvd250aHJlYWQgY29udmVyc2F0
aW9uIHdpdGggUGhpbCB0aGF0IHRoZSBtaWRkbGUgZGV2aWNlCnBhdGNoZXMgc2hvdWxkIGJlIHNw
bGl0IG91dCB0byBhIGRpZmZlcmVudCBzZXJpZXMuCgpJIGhhdmUgc29tZSBxdWVzdGlvbnMgb24g
c29tZSBvZiB0aGUgbGFzdCBmZXcgcGF0Y2hlcywgYW5kIEkgZG9uJ3Qga25vdyBob3cKdGhleSB3
b3VsZCBpbnRlcmFjdCBjaGVycnktcGlja2luZyBmcm9tIHRob3NlLCBzbyBJJ3ZlIGxlZnQgdGhl
bSBmb3Igbm93LgoKSSBoYWQgc29tZSB0cm91YmxlIGFwcGx5aW5nIHlvdXIgcGF0Y2hlcywgYXMg
dGhleSdyZSBlbmNvZGVkIHF1b3RlZC1wcmludGFibGUsCmFuZCAiZ2l0IGFtIiBkb2Vzbid0IGxp
a2UgdGhhdC4gIElmIHBvc3NpYmxlLCBwbGVhc2UgdXNlICJnaXQgc2VuZC1lbWFpbCIgdG8KcG9z
dCB5b3VyIG5leHQgcGF0Y2ggc2V0LgoKCnJ+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

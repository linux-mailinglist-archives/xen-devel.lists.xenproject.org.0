Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 945F1916AA
	for <lists+xen-devel@lfdr.de>; Sun, 18 Aug 2019 14:49:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzKa6-0002Vz-Ji; Sun, 18 Aug 2019 12:46:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dkRd=WO=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1hzKa4-0002Vu-Ab
 for xen-devel@lists.xenproject.org; Sun, 18 Aug 2019 12:46:44 +0000
X-Inumbo-ID: 3b0e01fc-c1b6-11e9-b90c-bc764e2007e4
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b0e01fc-c1b6-11e9-b90c-bc764e2007e4;
 Sun, 18 Aug 2019 12:46:43 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id j16so5890998wrr.8
 for <xen-devel@lists.xenproject.org>; Sun, 18 Aug 2019 05:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1pPjYBqSfFQg89Ld6dVuKQx+pLvJBdztHR4jr4QNGzI=;
 b=NFdyZjYeAZNqNaLC48b0zxqT4ew0cYYqgiA7yrp97QLfmtvO+ZgMF10JEnSzxPt27n
 2gTEmdztH2Z2nIfQrAkbPMNuVh1fIWw9RCjeFBkdCdquJik5n8PLsyHocdtWCV27JyVQ
 QX9hzgFLel3K5xlO29rrs0/AnLhkf1tkhEiNMcC6IJ+uHdc1AHkK4VAfGxoH270aoFiW
 jhPmktd1panEyPf1lhzi30D5LtUGZkTzN5K9ND0UGMARBYZKgYMda93vbqZyFk62bHGC
 6VyaP9AJ0HTezxkZgWUZ8C1eitZedl/FAJbdS4/uRxX4kDPgbeWwcccZjtnmQKty3WVJ
 PLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1pPjYBqSfFQg89Ld6dVuKQx+pLvJBdztHR4jr4QNGzI=;
 b=dhq9MyWJcId7JDEJybsWKMnjbRl0mmCyPn3X2RQt3kgR6H/Bu1ZuoRUaL71LXDgKKl
 f/R1dw8aO7vjASpHo2ursB7gPP8n+A8DFJbWKHtjKRxUxvUlCbArkBkEP25yonP8PSto
 lL2AJTElM8obmsimsF/lnIBf+H1Z0hJNcXrt4L2XkVWlTwh8UT9YuXkhGdGwUdk45guT
 s8ggJRuA29POOVfsE7C7H5MZbu5P3as3AelAweq1NLaT+xXIyj0TkibB2Fu/ZHVE6SJL
 lN1rTXG/90R9Ps88cH3d7Gvul4atR29XxQ3VeJbBd0NVwvzwzINguZIF9N5bLcoLZSkF
 DCiQ==
X-Gm-Message-State: APjAAAVVpN488F2wy2MciPXZmTN/P7E4xxHQB7x7gpqy6pRAm4Pflx25
 HcgEuDzvvgeZIr+AV1aQfsdLtg==
X-Google-Smtp-Source: APXvYqxRKFMqLQ6mapF4AYE2P66DlsLoG3YnAiriMHGTZEIR3kbgRt+Iz9YK8++iYKEOelm0ymJakA==
X-Received: by 2002:adf:ce05:: with SMTP id p5mr21186547wrn.197.1566132402599; 
 Sun, 18 Aug 2019 05:46:42 -0700 (PDT)
Received: from [172.16.53.135] ([82.3.55.76])
 by smtp.gmail.com with ESMTPSA id o16sm13231720wrp.23.2019.08.18.05.46.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 18 Aug 2019 05:46:41 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <1565941122698.46462@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0a8ecb15-e03d-c6fd-e9bd-38b4abc7b316@linaro.org>
Date: Sun, 18 Aug 2019 13:46:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565941122698.46462@bt.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v7 38/42] memory: Single byte
 swap along the I/O path
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

T24gOC8xNi8xOSA4OjM4IEFNLCB0b255Lm5ndXllbkBidC5jb20gd3JvdGU6Cj4gK3N0YXRpYyB2
b2lkIGFkanVzdF9lbmRpYW5uZXNzKE1lbW9yeVJlZ2lvbiAqbXIsIHVpbnQ2NF90ICpkYXRhLCBN
ZW1PcCBvcCkKPiAgewo+ICsgICAgaWYgKChvcCAmIE1PX0JTV0FQKSAhPSBtci0+b3BzLT5lbmRp
YW5uZXNzKSB7Cj4gKyAgICAgICAgc3dpdGNoIChvcCAmIE1PX1NJWkUpIHsKCllvdSdsbCB3YW50
IHRvIHVzZSBkZXZlbmRfbWVtb3AoKSBoZXJlLCBhcyBwcmV2aW91c2x5IGRpc2N1c3NlZC4KCj4g
QEAgLTIzMzEsNyArMjMyMiw3IEBAIHZvaWQgbWVtb3J5X3JlZ2lvbl9hZGRfZXZlbnRmZChNZW1v
cnlSZWdpb24gKm1yLAo+ICAgICAgfQo+IAo+ICAgICAgaWYgKHNpemUpIHsKPiAtICAgICAgICBh
ZGp1c3RfZW5kaWFubmVzcyhtciwgJm1yZmQuZGF0YSwgc2l6ZSk7Cj4gKyAgICAgICAgYWRqdXN0
X2VuZGlhbm5lc3MobXIsICZtcmZkLmRhdGEsIHNpemVfbWVtb3Aoc2l6ZSkpOwo+ICAgICAgfQo+
ICAgICAgbWVtb3J5X3JlZ2lvbl90cmFuc2FjdGlvbl9iZWdpbigpOwo+ICAgICAgZm9yIChpID0g
MDsgaSA8IG1yLT5pb2V2ZW50ZmRfbmI7ICsraSkgewo+IEBAIC0yMzY2LDcgKzIzNTcsNyBAQCB2
b2lkIG1lbW9yeV9yZWdpb25fZGVsX2V2ZW50ZmQoTWVtb3J5UmVnaW9uICptciwKPiAgICAgIHVu
c2lnbmVkIGk7Cj4gCj4gICAgICBpZiAoc2l6ZSkgewo+IC0gICAgICAgIGFkanVzdF9lbmRpYW5u
ZXNzKG1yLCAmbXJmZC5kYXRhLCBzaXplKTsKPiArICAgICAgICBhZGp1c3RfZW5kaWFubmVzcyht
ciwgJm1yZmQuZGF0YSwgc2l6ZV9tZW1vcChzaXplKSk7Cj4gICAgICB9Cj4gICAgICBtZW1vcnlf
cmVnaW9uX3RyYW5zYWN0aW9uX2JlZ2luKCk7Cj4gICAgICBmb3IgKGkgPSAwOyBpIDwgbXItPmlv
ZXZlbnRmZF9uYjsgKytpKSB7CgpUbyBwcmVzZXJ2ZSBiZWhhdmlvdXIgaXQgd291bGQgYXBwZWFy
IHRoYXQgdGhlc2UgbmVlZCBNT19URS4KCgpyfgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==

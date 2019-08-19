Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C4794CF1
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 20:31:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzmOg-0004Kg-CI; Mon, 19 Aug 2019 18:28:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gzz1=WP=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1hzmOe-0004KW-Tn
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 18:28:48 +0000
X-Inumbo-ID: 2f47207a-c2af-11e9-a661-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f47207a-c2af-11e9-a661-bc764e2007e4;
 Mon, 19 Aug 2019 18:28:48 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 79B78C057EC0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2019 18:28:47 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id k14so5657858wrv.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2019 11:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V4/aFq6DDEPmRVpJY8yCxsJYN8Z3oDBG76SrumSRDN4=;
 b=A+gDVeWHOFkUTk6u+gBAB2O/6P+tn9fYaXE/ffwW49vbCzZoHkKvmHVHYJ+Io5xNSN
 0jq6i5/eO7pBiY5c/9fAr7HH0FVUzywKp03uvfbI/R8Hr/L3dAACCutHfM45IMaFJUfG
 oiHZWGjc2xzk11sFEcZ3enYnzMKCn7NjnYs/hdoe/x4l01lniyhU8cBeZkikUz0jGhP/
 W2fgaNDRvmEpJSn5jW7xbphhdMzr/U1rLkaUdByNWvRAhJj0wz4tCZtyce+z2IPDT21A
 ejVoUDfwc2x8GiwLccu8j89IIwUacXScT1Dhg0WqEaNGUbcwz3HJmT3QoxXS/+ZjCScU
 I8QA==
X-Gm-Message-State: APjAAAXUysbKy1zL+hdbSq22XMy2YBM0w0iEX/GJwrTUUujMGi+CuOUn
 h4XFdJhQH4YD85Zz5ynM8W641gTJOj5Ptyap9sotPzAZKT6HGbk5PxPpzQodH7DG3tHduodK0Lg
 1Tt55HkYMrfPvCQ6fjVMK52ERouM=
X-Received: by 2002:adf:8364:: with SMTP id 91mr29003162wrd.13.1566239325376; 
 Mon, 19 Aug 2019 11:28:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxUtjtGjGnkBVkOZjVo/50Uby5R91gtIkNP9G8lQQx5CBDC3ajHH42W8ebY9hYyiOtnQTbC1A==
X-Received: by 2002:adf:8364:: with SMTP id 91mr29003101wrd.13.1566239325062; 
 Mon, 19 Aug 2019 11:28:45 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:399c:411e:1ccb:f240?
 ([2001:b07:6468:f312:399c:411e:1ccb:f240])
 by smtp.gmail.com with ESMTPSA id f7sm21779124wrf.8.2019.08.19.11.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2019 11:28:44 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <1565941032362.60179@bt.com>
 <1b5f5a92-1b75-f0d9-d7bc-4605094ad8e7@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <8d8b37c9-3daf-d241-df92-1a5467bca451@redhat.com>
Date: Mon, 19 Aug 2019 20:28:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1b5f5a92-1b75-f0d9-d7bc-4605094ad8e7@redhat.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [qemu-s390x] [Qemu-devel] [PATCH v7 33/42] exec:
 Replace device_endian with MemOp
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
Cc: frederic.konrad@adacore.com, berto@igalia.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, pasic@linux.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org, philmd@redhat.com,
 green@moxielogic.com, jiri@resnulli.us, ehabkost@redhat.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 andrew@aj.id.au, claudio.fontana@suse.com, crwulff@gmail.com,
 laurent@vivier.eu, sundeep.lkml@gmail.com, michael@walle.cc,
 qemu-ppc@nongnu.org, kbastian@mail.uni-paderborn.de, imammedo@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, david@redhat.com, palmer@sifive.com,
 balaton@eik.bme.hu, keith.busch@intel.com, jcmvbkbc@gmail.com, hare@suse.com,
 sstabellini@kernel.org, andrew.smirnov@gmail.com, deller@gmx.de,
 magnus.damm@gmail.com, marcel.apfelbaum@gmail.com, atar4qemu@gmail.com,
 minyard@acm.org, sw@weilnetz.de, yuval.shaia@oracle.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, peter.chubb@nicta.com.au, clg@kaod.org, shorne@gmail.com,
 qemu-riscv@nongnu.org, i.mitsyanko@gmail.com, cohuck@redhat.com,
 amarkovic@wavecomp.com, jan.kiszka@web.de, aurelien@aurel32.net,
 pburton@wavecomp.com, sagark@eecs.berkeley.edu, jasowang@redhat.com,
 kraxel@redhat.com, edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn,
 robh@kernel.org, lersek@redhat.com, borntraeger@de.ibm.com, joel@jms.id.au,
 antonynpavlov@gmail.com, chouteau@adacore.com, balrogg@gmail.com,
 Andrew.Baumann@microsoft.com, mreitz@redhat.com, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 jslaby@suse.cz, marex@denx.de, proljc@gmail.com, marcandre.lureau@redhat.com,
 alistair@alistair23.me, paul.durrant@citrix.com, david@gibson.dropbear.id.au,
 xiaoguangrong.eric@gmail.com, huth@tuxfamily.org, jcd@tribudubois.net,
 stefanb@linux.ibm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMDgvMTkgMTI6MTIsIFRob21hcyBIdXRoIHdyb3RlOgo+IFRoaXMgcGF0Y2ggaXMgKmh1
Z2UqLCBtb3JlIHRoYW4gODAwa0IuIEl0IGtlZXBzIGJlaW5nIHN0dWNrIGluIHRoZSB0aGUKPiBm
aWx0ZXIgb2YgdGhlIHFlbXUtczM5MHggbGlzdCBlYWNoIHRpbWUgeW91IHNlbmQgaXQuIFBsZWFz
ZToKPiAKPiAxKSBUcnkgdG8gYnJlYWsgaXQgdXAgaW4gbW9yZSBkaWdlc3RpYmxlIHBpZWNlcywg
ZS5nLiBjaGFuZ2Ugb25seSBvbmUKPiBzdWJzeXN0ZW0gYXQgYSB0aW1lICh0aGlzIGlzIGFsc28g
YmV0dGVyIHJldmlld2FibGUgYnkgcGVvcGxlIHdobyBhcmUKPiBpbnRlcmVzdGVkIGluIG9uZSBh
cmVhKQoKVGhpcyBpcyBub3QgcmVhbGx5IHBvc3NpYmxlLCBzaW5jZSB0aGUgcGF0Y2ggaXMgYmFz
aWNhbGx5IGEKc2VhcmNoLWFuZC1yZXBsYWNlLiAgWW91IGNvdWxkIHBlcmhhcHMgdXNlIHNvbWUg
bWFnaWMKKCJERVZJQ0VfTUVNT1BfRU5ESUFOIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0KSB0byBh
bGxvdyBhIHNwbGl0LCBidXQgaXQKd291bGQgaW50cm9kdWNlIG1vcmUgY29tcGxpY2F0aW9uIHRo
YW4gYW55dGhpbmcgZWxzZS4KCkFncmVlZCBvbiB0aGUgSFRNTCB0aG91Z2guIDopCgpQYW9sbwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

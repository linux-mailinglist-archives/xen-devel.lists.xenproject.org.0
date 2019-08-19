Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBD994F8A
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 23:05:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzomS-000189-0v; Mon, 19 Aug 2019 21:01:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QdtW=WP=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1hzomQ-000184-90
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 21:01:30 +0000
X-Inumbo-ID: 83d41de0-c2c4-11e9-b90c-bc764e2007e4
Received: from mail-pg1-x541.google.com (unknown [2607:f8b0:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83d41de0-c2c4-11e9-b90c-bc764e2007e4;
 Mon, 19 Aug 2019 21:01:29 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id n190so1896008pgn.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2019 14:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vGBzrXO7KGpJ/NUWc/Wz8OhRnfw9xF17a3ctMtsK7KU=;
 b=FxoL/ygNz+Ksftm1RuYm/hG7E+xUwHOeXleAvU5RKlIsyWRQv8RINw3kW0ZJByEwo0
 qguqHCPMGOnOa+JMyt2Xwlv2pqzilmdFTcReSsfN6Ms8DIzBRqW1zByU3jMKV6A8MKUd
 Ey3Co++zv2CtWWhtWKSWRA06PcwxEPwJijUHnQXpmVIriIaWqnF3XwHYCWss8+xa440m
 W+qxDOjbHZpamKwURVa1T4q7BTMqMydWd9i8NzVovYN2blADLG3kJVQBic4LQgyy3vlX
 Z06lyjJsf5W39pmQ8zid0Tq07PX/wgluHJ4U9/nidce7U2v5Uo8AzFvmwrpT/uSsFgmQ
 aH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vGBzrXO7KGpJ/NUWc/Wz8OhRnfw9xF17a3ctMtsK7KU=;
 b=H2/EnBwa8cetcRnFWuiB7cyHGtAiroSuSeiQdmNiZeMCqG/fevF9eCP5jQpwq6fKar
 VZDi5ZrXEw8Ib3hUnbBQP2GRa5MBAZC1n/cFXk4816kCtly23QvZaCx8Ip488KbRtkzY
 ROQPMyU1gVy8HPowzgAT93MqcQ3Ry4BkOM+TkROG/4c7DkTcT0u/ZL+PtLmkegD0ORiD
 jLfHDzdDq3jT0X4hbsC8SjoEbTIIDjPkYE0hDkClMUliS1rLS32gIKYfUho+BbNzofhH
 L4iUJpShquysTEJGqRdoctorrMi+osvpp3/Nr6+MAgDLfRj7sfZNTLk3l3ybLADp1rod
 Jd4A==
X-Gm-Message-State: APjAAAWDx3hO4T9w2XCmt5q3gJdA5krqOg6/xImlmvvYP6KdTs2OlGqO
 WsiJwCBebqm78X00hN+yEmJkBA==
X-Google-Smtp-Source: APXvYqyxYKmwhkk2+hBSFj74Kf7MG7+XWa94OJ2Sw4xj2uOGNS5PTiiDALcNZLOc7wR94aBemA/2WA==
X-Received: by 2002:a65:6104:: with SMTP id z4mr21186266pgu.27.1566248488612; 
 Mon, 19 Aug 2019 14:01:28 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id c2sm7562265pjs.13.2019.08.19.14.01.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Aug 2019 14:01:27 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <1565941032362.60179@bt.com>
 <1b5f5a92-1b75-f0d9-d7bc-4605094ad8e7@redhat.com>
 <8d8b37c9-3daf-d241-df92-1a5467bca451@redhat.com>
 <3b983f77-8503-3fcd-7c42-45d0121845e6@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b79a173d-a682-21da-6e7f-489ce06c8f7a@linaro.org>
Date: Mon, 19 Aug 2019 14:01:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3b983f77-8503-3fcd-7c42-45d0121845e6@redhat.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [qemu-s390x] [PATCH v7 33/42] exec:
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 cohuck@redhat.com, jan.kiszka@web.de, sagark@eecs.berkeley.edu,
 david@redhat.com, green@moxielogic.com, palmer@sifive.com,
 mark.cave-ayland@ilande.co.uk, i.mitsyanko@gmail.com, keith.busch@intel.com,
 jcmvbkbc@gmail.com, frederic.konrad@adacore.com, dmitry.fleytman@gmail.com,
 kraxel@redhat.com, edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn,
 pburton@wavecomp.com, xiaoguangrong.eric@gmail.com, marex@denx.de,
 robh@kernel.org, hare@suse.com, sstabellini@kernel.org, berto@igalia.com,
 chouteau@adacore.com, qemu-block@nongnu.org, arikalo@wavecomp.com,
 jslaby@suse.cz, deller@gmx.de, mst@redhat.com, magnus.damm@gmail.com,
 lersek@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 mreitz@redhat.com, hpoussin@reactos.org, joel@jms.id.au,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 david@gibson.dropbear.id.au, philmd@redhat.com, jasowang@redhat.com,
 atar4qemu@gmail.com, antonynpavlov@gmail.com, jiri@resnulli.us,
 ehabkost@redhat.com, minyard@acm.org, qemu-s390x@nongnu.org, sw@weilnetz.de,
 alistair@alistair23.me, yuval.shaia@oracle.com, b.galvani@gmail.com,
 eric.auger@redhat.com, alex.williamson@redhat.com, qemu-arm@nongnu.org,
 peter.chubb@nicta.com.au, clg@kaod.org, stefanha@redhat.com,
 marcandre.lureau@redhat.com, shorne@gmail.com, jsnow@redhat.com,
 rth@twiddle.net, kwolf@redhat.com, qemu-riscv@nongnu.org, proljc@gmail.com,
 andrew@aj.id.au, claudio.fontana@suse.com, crwulff@gmail.com,
 laurent@vivier.eu, Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com,
 andrew.smirnov@gmail.com, michael@walle.cc, paul.durrant@citrix.com,
 qemu-ppc@nongnu.org, huth@tuxfamily.org, amarkovic@wavecomp.com,
 kbastian@mail.uni-paderborn.de, imammedo@redhat.com, jcd@tribudubois.net,
 aurelien@aurel32.net, stefanb@linux.ibm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8xOS8xOSAxMToyOSBBTSwgUGFvbG8gQm9uemluaSB3cm90ZToKPiBPbiAxOS8wOC8xOSAy
MDoyOCwgUGFvbG8gQm9uemluaSB3cm90ZToKPj4gT24gMTYvMDgvMTkgMTI6MTIsIFRob21hcyBI
dXRoIHdyb3RlOgo+Pj4gVGhpcyBwYXRjaCBpcyAqaHVnZSosIG1vcmUgdGhhbiA4MDBrQi4gSXQg
a2VlcHMgYmVpbmcgc3R1Y2sgaW4gdGhlIHRoZQo+Pj4gZmlsdGVyIG9mIHRoZSBxZW11LXMzOTB4
IGxpc3QgZWFjaCB0aW1lIHlvdSBzZW5kIGl0LiBQbGVhc2U6Cj4+Pgo+Pj4gMSkgVHJ5IHRvIGJy
ZWFrIGl0IHVwIGluIG1vcmUgZGlnZXN0aWJsZSBwaWVjZXMsIGUuZy4gY2hhbmdlIG9ubHkgb25l
Cj4+PiBzdWJzeXN0ZW0gYXQgYSB0aW1lICh0aGlzIGlzIGFsc28gYmV0dGVyIHJldmlld2FibGUg
YnkgcGVvcGxlIHdobyBhcmUKPj4+IGludGVyZXN0ZWQgaW4gb25lIGFyZWEpCj4+Cj4+IFRoaXMg
aXMgbm90IHJlYWxseSBwb3NzaWJsZSwgc2luY2UgdGhlIHBhdGNoIGlzIGJhc2ljYWxseSBhCj4+
IHNlYXJjaC1hbmQtcmVwbGFjZS4gIFlvdSBjb3VsZCBwZXJoYXBzIHVzZSBzb21lIG1hZ2ljCj4+
ICgiREVWSUNFX01FTU9QX0VORElBTiIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdCkgdG8gYWxsb3cg
YSBzcGxpdCwgYnV0IGl0Cj4+IHdvdWxkIGludHJvZHVjZSBtb3JlIGNvbXBsaWNhdGlvbiB0aGFu
IGFueXRoaW5nIGVsc2UuCj4gCj4gSSdtIHN0dXBpZCwgYXQgdGhpcyBwb2ludCBvZiB0aGUgc2Vy
aWVzIGl0IF93b3VsZF8gYmUgcG9zc2libGUgdG8gc3BsaXQKPiB0aGUgcGF0Y2ggYnkgc3Vic3lz
dGVtLiAgU3RpbGwgbm90IHN1cmUgaXQgd291bGQgYmUgYWN0dWFsbHkgYW4gYWR2YW50YWdlLgoK
SXQgbWlnaHQgYmUgZWFzaWVyIHRvIHJldmlldyBpZiB3ZSBzcGxpdCBieSBzeW1ib2wsIG9uZSBy
ZW5hbWUgcGVyIHBhdGNoIG92ZXIKdGhlIGVudGlyZSBjb2RlIGJhc2UuCgoKcn4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

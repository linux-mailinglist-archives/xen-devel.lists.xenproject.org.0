Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB0185066
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 17:57:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvOHc-00010D-Dv; Wed, 07 Aug 2019 15:55:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mnz/=WD=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1hvOHb-000106-3Z
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 15:55:23 +0000
X-Inumbo-ID: c2cfeb2e-b92b-11e9-8980-bc764e045a96
Received: from mail-pl1-x641.google.com (unknown [2607:f8b0:4864:20::641])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c2cfeb2e-b92b-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 15:55:21 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id m9so41296216pls.8
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 08:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=prLuYlCIjqqGCnuy16UMao/whYuieT5vCsOk/Uu8Jfs=;
 b=rjJA277UKjGXhHdTw07ZfW3C5Mn6ZbEDCyfEzYhzyY5Fa6hqywzzPHsfVqhjmsY1xd
 swUGLSFFlIfDfAfMlqMngfwVZO6uXvboimYFhSbZ2cmSQSMK6PClDl/OID2BpXOt13Pd
 U2cOUPTWvLOpP7nh5Xeo9afmgoeSdlhfEFRUqA71QsbwvshALi+Qzfk0g/enc95E4z7h
 i5tdWDwKeM4+P1UwQwPHD2IUFy4X6tQQB312FSE/2X0v0sHI0VNQdcTK41kBrmdl49eh
 MulrE+5MtbI4z8k+ssVC20xJJ9kiczTOLWOvAXbhyjkgBmI8VDQ9JuzBl/kEiyyUub+i
 HQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=prLuYlCIjqqGCnuy16UMao/whYuieT5vCsOk/Uu8Jfs=;
 b=AaoucVzTbm4S9ihJ2miIoFvqTmhU5iSbJNhfGumLeV8ANvIyUPjAfltq0eQf0cQfS9
 OQfUJJgjbpltULvqVqzVAYtYNUR+E5Y5yOOt6WwlaeNFoeuvxIPszlS/O6ylWBjKffe5
 sG9Pym4MlrwQaAaaeBaPRSgG1m8gA1kp8BQbxP/90sos/K3ZbYAqvCzD31Fg2apofBjU
 Lx/RIsylen3n92Ju+ByolohHFxwT3QtRiacdUxC5pqhIQtr+KETEsnpkEv8DC/YrmAca
 zTvdP6b7RowJHD0R4YkPANHCq4y0xkO6/M95bqrmcXgEs4z0Fm6TO5jRRJON+nYFST3g
 kf4w==
X-Gm-Message-State: APjAAAU8I1tPzFOnNjM01YhfaG8yZ2ezghjLnns2hC4WmnwJeByQhHbS
 l0dxpfeZ8WqNTCOAsrKm97A8hw==
X-Google-Smtp-Source: APXvYqwIO3zpV1oWn1WTT9oo13fQBavOvrIiC2GODyL0n0Zg2Nz8i5QgHeaYS7+9K7WlPGsK/Ms0Lw==
X-Received: by 2002:a17:902:8d92:: with SMTP id
 v18mr8949359plo.211.1565193321031; 
 Wed, 07 Aug 2019 08:55:21 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id i3sm98279530pfo.138.2019.08.07.08.55.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 08:55:20 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166687895.25037@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <28cf72ed-7a4e-668f-40ca-71a2c7fbeca5@linaro.org>
Date: Wed, 7 Aug 2019 08:55:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166687895.25037@bt.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v6 16/26] exec: Map
 device_endian onto MemOp
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

T24gOC83LzE5IDE6MzEgQU0sIHRvbnkubmd1eWVuQGJ0LmNvbSB3cm90ZToKPiBQcmVwYXJhdGlv
biB0byByZXBsYWNlIGRldmljZV9lbmRpYW4gd2l0aCBNZW1PcC4KPiAKPiBNYXBwaW5nIGRldmlj
ZV9lbmRpYW4gb250byBNZW1PcCBsaW1pdHMgYmVoYXZpb3VyIGNoYW5nZXMgdG8gdGhpcwo+IHJl
bGF0aXZlbHkgc21hbGxlciBwYXRjaC4KPiAKPiBUaGUgbmV4dCBwYXRjaCB3aWxsIHJlcGxhY2Ug
YWxsIGRldmljZV9lbmRpYW4gdXNhZ2VzIHdpdGggdGhlCj4gZXF1aXZhbGVudCBNZW1PcC4gVGhh
dCBwYXRjaCB3aWxsIGJlIGxhcmdlIGJ1dCBoYXZlIG5vIGJlaGF2aW91cgo+IGNoYW5nZXMuCj4g
Cj4gQSBzdWJzZXF1ZW50IHBhdGNoIHdpbGwgdGhlbiBkZWxldGUgdW51c2VkIGRldmljZV9lbmRp
YW4uCj4gCj4gU2lnbmVkLW9mZi1ieTogVG9ueSBOZ3V5ZW4gPHRvbnkubmd1eWVuQGJ0LmNvbT4K
PiAtLS0KPiAgaHcvY2hhci9zZXJpYWwuYyAgICAgICAgICB8IDE4ICsrKysrKy0tLS0tLS0tLS0t
LQo+ICBpbmNsdWRlL2V4ZWMvY3B1LWNvbW1vbi5oIHwgMTAgKysrKysrKy0tLQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6
IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPgoKCnJ+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

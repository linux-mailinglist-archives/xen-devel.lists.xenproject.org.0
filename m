Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 703C685245
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 19:41:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvPth-0002kY-L3; Wed, 07 Aug 2019 17:38:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mnz/=WD=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1hvPtg-0002kT-EA
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 17:38:48 +0000
X-Inumbo-ID: 354492f1-b93a-11e9-8980-bc764e045a96
Received: from mail-pl1-x642.google.com (unknown [2607:f8b0:4864:20::642])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 354492f1-b93a-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 17:38:46 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id m9so41700309pls.8
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 10:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EA88qvAzozVrUA6CGxNTtnZOOxPhbdBbqz6cQni2U8I=;
 b=qKntDSdMHrPkk+J4UwBLYb43bMqF9cNsmBdbtO0FK8JganyV7uyTQ8or9BAogOmaro
 pga5jjzH1qGtSpHdpxvq2oB7RYGMiyslKp9kHAEBGErVqDVqocpyhVv2Nod0voV8ff84
 SY6MT11IbZ8/SpjtnTg2+3ZNywYLl3+vIRChQpDQBiw06QLyYmw/eC896UH9umWOpX6y
 oEFGMIHkr8kBjvr8aD9hoV2T/yCNdY5AEwcNv4DO/tnu+C9k8jy9YydwN/nL1Vd9Is8g
 qg1v7NJsMJGWr4eOTVKqHjvcZvF/04lucLcGFb9Oc8o1N84TJxpua/YiYrAU54tVwKKk
 majA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EA88qvAzozVrUA6CGxNTtnZOOxPhbdBbqz6cQni2U8I=;
 b=DtzV5fWhpWPyCPLvrNnoegpsZB7tgqf/yVeZd7OV7nPxJwh15o9/eEkdOAR1oBwk33
 EuwFlSGLVL382vNI45pXxqePo/5vDKG0Ne+uC5SNRP0cAM3WtDZCvGNhhu/f70blQnGQ
 vA8g/2N/xepLUeMJP7+o/wShwWnB/mZK746rK8stIkrssqz80BZKXOqI00soe75aSfUI
 jQC675/mCBXqRZreuWx3VpMTEVAd0akJkysvHKDPbQEksNKPaeNIyVfeUbrVL8G6FTDN
 KeEu3vdfocsYa6x4hu+UsAbQV09jNyUKymsoWCZY/KTyeGvAiXnLGIRzwWvkVZdXLnbo
 bF7Q==
X-Gm-Message-State: APjAAAXlHXHfadEp7gPJiIXB/YQqiIgYFYZ6ZYyityO7GOpd5yz+ATqE
 q7vp+Q+yemZwPl0Tgs/4qeE2uw==
X-Google-Smtp-Source: APXvYqwqmCPo/smyD47WHlQMbe+H96vmsz+ljj5kBopE78f/Xl5o/xo4bT3nHsJiUOP7TbKuiz8wIw==
X-Received: by 2002:aa7:8555:: with SMTP id y21mr10575549pfn.104.1565199525861; 
 Wed, 07 Aug 2019 10:38:45 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id q7sm105394539pff.2.2019.08.07.10.38.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 10:38:44 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166819111.14515@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d2f24c92-d210-7e0e-b787-3986123824d4@linaro.org>
Date: Wed, 7 Aug 2019 10:38:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166819111.14515@bt.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v6 21/26] cputlb: Replace size
 and endian operands for MemOp
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

T24gOC83LzE5IDE6MzMgQU0sIHRvbnkubmd1eWVuQGJ0LmNvbSB3cm90ZToKPiBAQCAtMTI0Niw3
ICsxMjQ2LDcgQEAgdHlwZWRlZiB1aW50NjRfdCBGdWxsTG9hZEhlbHBlcihDUFVBcmNoU3RhdGUg
KmVudiwgdGFyZ2V0X3Vsb25nIGFkZHIsCj4gCj4gIHN0YXRpYyBpbmxpbmUgdWludDY0X3QgX19h
dHRyaWJ1dGVfXygoYWx3YXlzX2lubGluZSkpCj4gIGxvYWRfaGVscGVyKENQVUFyY2hTdGF0ZSAq
ZW52LCB0YXJnZXRfdWxvbmcgYWRkciwgVENHTWVtT3BJZHggb2ksCj4gLSAgICAgICAgICAgIHVp
bnRwdHJfdCByZXRhZGRyLCBzaXplX3Qgc2l6ZSwgYm9vbCBiaWdfZW5kaWFuLCBib29sIGNvZGVf
cmVhZCwKPiArICAgICAgICAgICAgdWludHB0cl90IHJldGFkZHIsIE1lbU9wIG9wLCBib29sIGNv
ZGVfcmVhZCwKCkkgYXNzdW1lIHRoZSBjb2RlIGdlbmVyYXRpb24gaXMgdGhlIHNhbWUsIG9yIG5l
YXJseSBzbywgZm9yIHRoZXNlIGZ1bmN0aW9ucz8KSXQgc2VlbXMgbGlrZSBpdCBzaG91bGQgYmUs
IHNpbmNlIHdlJ3JlIHJlcGxhY2luZyBvbmUgc2V0IG9mIGNvbnN0YW50IGFyZ3VtZW50cwp3aXRo
IGFub3RoZXIsIGFuZCB0aGUgY29tcGlsZXIgc2hvdWxkIGJlIGFibGUgdG8gZm9sZCBhd2F5IHRo
ZSBzYW1lIHNldCBvZiB0ZXN0cy4KCkJ1dCB3ZSBzaG91bGQgYXQgbGVhc3QgaGF2ZSBhIGxvb2su
Li4KCj4gKyAgICBzd2l0Y2ggKG9wKSB7Cj4gKyAgICBjYXNlIE1PXzg6Cj4gICAgICAgICAgcmVz
ID0gbGR1Yl9wKGhhZGRyKTsKPiAgICAgICAgICBicmVhazsKPiArICAgIGNhc2UgTU9fQkVVVzoK
PiArICAgICAgICByZXMgPSBsZHV3X2JlX3AoaGFkZHIpOwoKSSBkb24ndCBsaWtlIG1peGluZyBh
IGJhcmUgc2l6ZSB3aXRoIHNpemUrc2lnbitlbmRpYW4uCkkgdGhpbmsgeW91IHNob3VsZCBnbyBh
aGVhZCBhbmQgcGFzcyBNT19VQi4KCj4gQEAgLTE2MDUsMzAgKzE2MDUsMjcgQEAgc3RvcmVfaGVs
cGVyKENQVUFyY2hTdGF0ZSAqZW52LCB0YXJnZXRfdWxvbmcgYWRkciwgdWludDY0X3QgdmFsLAo+
IAo+ICAgZG9fYWxpZ25lZF9hY2Nlc3M6Cj4gICAgICBoYWRkciA9ICh2b2lkICopKCh1aW50cHRy
X3QpYWRkciArIGVudHJ5LT5hZGRlbmQpOwo+IC0gICAgc3dpdGNoIChzaXplKSB7Cj4gLSAgICBj
YXNlIDE6Cj4gKyAgICBzd2l0Y2ggKG9wKSB7Cj4gKyAgICBjYXNlIE1PXzg6CgpMaWtld2lzZS4K
CgpyfgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

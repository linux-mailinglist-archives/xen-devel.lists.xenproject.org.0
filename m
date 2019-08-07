Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD00284FFE
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 17:35:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvNvx-0006oh-GH; Wed, 07 Aug 2019 15:33:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mnz/=WD=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1hvNvv-0006oV-J5
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 15:32:59 +0000
X-Inumbo-ID: a20ca079-b928-11e9-8980-bc764e045a96
Received: from mail-pl1-x642.google.com (unknown [2607:f8b0:4864:20::642])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a20ca079-b928-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 15:32:58 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id m9so41210056pls.8
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 08:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YOHdOx7/Stz8Tdbo6EdPl4datS5Q3j4t5VdIxcMP+xM=;
 b=Pm0ASyo6gkiTF1odBo/wLrQ9b3UHH+oZYk7XYC9NpzMYsKNFRl52Mu4JBUmbB+BDUC
 kugOta70MyufphqLT2e2rAFQlAMXXx/T62QwK4Lw14rDNpI1qgpWJDlfCh16Bp6y9Xel
 mJXUOrkRGAipCUzXVV/qLiOQXqU0vb99giE+3bio6CSDCZhWKUAVmaCeI0UxJJKXjC+4
 vzIDp/gid/yWVx5jKdm6f4cv+zKGh7V2mpFEm3RFp89koj4WSK+bjzIPfZPscO8D7spO
 Im60t3LUpqFn9Bs+C2BATyFHuRB00RprI8qgwMoyfcTuEdki6RVRyD9HwdrAJ5I1yEZ+
 ZO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YOHdOx7/Stz8Tdbo6EdPl4datS5Q3j4t5VdIxcMP+xM=;
 b=eXAUxr6iMAgGBlXBHfwAbvtih9g55mBJYydtldU1dQYnstfSDEWIrZcZAfzKQewlBT
 3XZ1Buo38J4f6FeNkWSggFJBaG57aD2P6Ea3xeBvVjZwYP2S2v5iVlJANzd0iK6bbF3w
 WPlP/B0CWgZ31mNzoJsqqPdt/MihbL0P9cmvMWptsCETXJjmHKfTTEVfaZECGMK6QE4N
 TqGQxNMGiU6u9EP8PeiyxvwpLvOHsJzYctO8j7JiiE3lK48cufoCAUnn/BV24rFAcpCq
 KLKzBSaAnAsAHbcPkDQWkqNi9ethkrLQ+NQVj3ZxyDBtgBSclOlhpJAEOM8UJ9JK3+/m
 B1oQ==
X-Gm-Message-State: APjAAAUq6VzXz0mQE/Ll75YtiDoNSmCPtuFDwMZVx6WgL3HxEBNqaXWW
 4JwXsEgZwQ74JK8q/C//LPFRdg==
X-Google-Smtp-Source: APXvYqxZDmuQ1/uBp64/WjLXtTgxvrI6W4xVriZ8CSJVCoy0a/msLNTPxIMU/toN0D9wtJfEhe90IA==
X-Received: by 2002:a62:64d4:: with SMTP id y203mr9807270pfb.91.1565191977649; 
 Wed, 07 Aug 2019 08:32:57 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id 131sm112852110pfx.57.2019.08.07.08.32.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 08:32:56 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166562774.65589@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b1ac6757-94aa-2358-2802-4cb3a3aef1d2@linaro.org>
Date: Wed, 7 Aug 2019 08:32:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166562774.65589@bt.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v6 10/26] cputlb: Access
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

T24gOC83LzE5IDE6MjkgQU0sIHRvbnkubmd1eWVuQGJ0LmNvbSB3cm90ZToKPiBUaGUgbWVtb3J5
X3JlZ2lvbl9kaXNwYXRjaF97cmVhZHx3cml0ZX0gb3BlcmFuZCAidW5zaWduZWQgc2l6ZSIgaXMK
PiBiZWluZyBjb252ZXJ0ZWQgaW50byBhICJNZW1PcCBvcCIuCj4gCj4gQ29udmVydCBpbnRlcmZh
Y2VzIGJ5IHVzaW5nIG5vLW9wIHNpemVfbWVtb3AuCj4gCj4gQWZ0ZXIgYWxsIGludGVyZmFjZXMg
YXJlIGNvbnZlcnRlZCwgc2l6ZV9tZW1vcCB3aWxsIGJlIGltcGxlbWVudGVkCj4gYW5kIHRoZSBt
ZW1vcnlfcmVnaW9uX2Rpc3BhdGNoX3tyZWFkfHdyaXRlfSBvcGVyYW5kICJ1bnNpZ25lZCBzaXpl
Igo+IHdpbGwgYmUgY29udmVydGVkIGludG8gYSAiTWVtT3Agb3AiLgo+IAo+IEFzIHNpemVfbWVt
b3AgaXMgYSBuby1vcCwgdGhpcyBwYXRjaCBkb2VzIG5vdCBjaGFuZ2UgYW55IGJlaGF2aW91ci4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBUb255IE5ndXllbiA8dG9ueS5uZ3V5ZW5AYnQuY29tPgo+IC0t
LQo+ICBhY2NlbC90Y2cvY3B1dGxiLmMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogUmljaGFyZCBIZW5k
ZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+CgoKcn4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

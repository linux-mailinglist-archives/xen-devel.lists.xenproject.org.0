Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB5A916A0
	for <lists+xen-devel@lfdr.de>; Sun, 18 Aug 2019 14:41:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzKRk-0001i8-ND; Sun, 18 Aug 2019 12:38:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dkRd=WO=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1hzKRj-0001i3-00
 for xen-devel@lists.xenproject.org; Sun, 18 Aug 2019 12:38:07 +0000
X-Inumbo-ID: 06a8455e-c1b5-11e9-b90c-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06a8455e-c1b5-11e9-b90c-bc764e2007e4;
 Sun, 18 Aug 2019 12:38:06 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s18so5901761wrn.1
 for <xen-devel@lists.xenproject.org>; Sun, 18 Aug 2019 05:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q2CECf3Z0VZS2vsykoHMilxYJWnJFnixOycIv/0VdAc=;
 b=vH3nKXklQ3D6J2/DUV/Muhm5EQqjnOi1dOFDnoYkoWbFdHGdCTt0Q8H/PEx3US8HVr
 BvUvT45unuUHziXG9CABuehFsnGiy92O9yPs6EM1DOjtOQOUOf5aNmusmYAtenEpKhZU
 Pu6WIhMrgQs6oTjcv5/b9mcugffLmrQy+Ga3LvHGe4Cbic6u7Zp2AlmUwB1zher+kYK6
 3yBCSezj6lVnUja0g2Vxd3RILIf1CcZ6VnwhbaSkueQsZrX7Limpesb3ZKhlOXNae2KW
 7sCJeCoUVb6HYQGT38JuljsiR4FUcloY4PuupNMx8KAHk526GfDKtMT4X6DaoSdbTrHc
 yG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q2CECf3Z0VZS2vsykoHMilxYJWnJFnixOycIv/0VdAc=;
 b=XlkEurhU4EtcYPvZuHcGFTCgauA86dvJU/o9KXOQiVdGcmX3Ip58xhNsSlW01Lo6XF
 yeHXw2eVqlNWeFl8Ou+KhnfdtYj5JSCn//aP9gYTSnWCoe97TvH1z5N0673FJnQvP9a8
 rNQlU7Ij8ZJhTBm3qu/WjPgh0mdx1jRoONkM9fX8m7VKrSwdEKl6ob2DZ8Z29jjmF1Tx
 AeaWUPzqRs+R2y9dtvkALRtZb+O8OaWavg0VKiKScbEAcrG2r5JeIeBY5Di/6CLDf1Vp
 qIjc5fRlFpvUkF1TkKfmn182UMEgEFzTfcKFtUgRo0gTxjIVCmFSu92pMZNyvm4z/vEt
 XFNw==
X-Gm-Message-State: APjAAAVV9CFt5wyiuAS3msG0viqcJLU/+EqxGlMN0DZPd4o/7LeTEcHy
 Kr0Q9338FfFnT9HYgHBMK89v1g==
X-Google-Smtp-Source: APXvYqy8+V4wmFtUbhYj8pIGMMLehGXowLZiVAQJJkcV7DuCTxUQaFYSL+0IQlwYdqSdVJrbjHii/Q==
X-Received: by 2002:adf:f710:: with SMTP id r16mr22248357wrp.81.1566131885195; 
 Sun, 18 Aug 2019 05:38:05 -0700 (PDT)
Received: from [172.16.53.135] ([82.3.55.76])
 by smtp.gmail.com with ESMTPSA id r190sm12495818wmf.0.2019.08.18.05.37.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 18 Aug 2019 05:38:04 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <1565941103483.3364@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <078b4e19-2b1e-bc21-f419-1064e45e5173@linaro.org>
Date: Sun, 18 Aug 2019 13:37:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565941103483.3364@bt.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v7 37/42] cputlb: Replace size
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

T24gOC8xNi8xOSA4OjM4IEFNLCB0b255Lm5ndXllbkBidC5jb20gd3JvdGU6Cj4gIHN0YXRpYyB1
aW50NjRfdCBmdWxsX2xkdWJfbW11KENQVUFyY2hTdGF0ZSAqZW52LCB0YXJnZXRfdWxvbmcgYWRk
ciwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVENHTWVtT3BJZHggb2ksIHVpbnRw
dHJfdCByZXRhZGRyKQo+ICB7Cj4gLSAgICByZXR1cm4gbG9hZF9oZWxwZXIoZW52LCBhZGRyLCBv
aSwgcmV0YWRkciwgMSwgZmFsc2UsIGZhbHNlLAo+IC0gICAgICAgICAgICAgICAgICAgICAgIGZ1
bGxfbGR1Yl9tbXUpOwo+ICsgICAgcmV0dXJuIGxvYWRfaGVscGVyKGVudiwgYWRkciwgb2ksIHJl
dGFkZHIsIE1PXzgsIGZhbHNlLCBmdWxsX2xkdWJfbW11KTsKLi4uCj4gIHZvaWQgaGVscGVyX3Jl
dF9zdGJfbW11KENQVUFyY2hTdGF0ZSAqZW52LCB0YXJnZXRfdWxvbmcgYWRkciwgdWludDhfdCB2
YWwsCj4gICAgICAgICAgICAgICAgICAgICAgICAgIFRDR01lbU9wSWR4IG9pLCB1aW50cHRyX3Qg
cmV0YWRkcikKPiAgewo+IC0gICAgc3RvcmVfaGVscGVyKGVudiwgYWRkciwgdmFsLCBvaSwgcmV0
YWRkciwgMSwgZmFsc2UpOwo+ICsgICAgc3RvcmVfaGVscGVyKGVudiwgYWRkciwgdmFsLCBvaSwg
cmV0YWRkciwgTU9fOCk7Cj4gIH0KCk1PX1VCLgoKT3RoZXJ3aXNlLApSZXZpZXdlZC1ieTogUmlj
aGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+CgoKcn4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

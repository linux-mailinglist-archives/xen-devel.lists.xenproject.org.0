Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 427D0BE22F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 18:16:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9w4-0006J4-RX; Wed, 25 Sep 2019 16:14:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lLTF=XU=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iD9w2-0006Iz-KQ
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 16:14:34 +0000
X-Inumbo-ID: 8f931ea8-dfaf-11e9-b588-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by localhost (Halon) with ESMTPS
 id 8f931ea8-dfaf-11e9-b588-bc764e2007e4;
 Wed, 25 Sep 2019 16:14:33 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id u28so4663832lfc.5
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2019 09:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=dixaIC9t3OrvoLk1mSTVozyFE2lVFat4gU9fyXFuErw=;
 b=KfnJ2ji032EaJwdBXnGS+Nk8rSYDgRfG/aGYQaHkkR210yEUbO5PrD73Q38Y/f97sE
 B+bxg1X4Dx+Xkw/BQ07iWCWt25o2S09SX+58/txwUPsJNV98RvPsan7hBVIrvinHG4sh
 k44c/4yH5idSp3/5NLVFVZql2JDZOqIa1Jm2EEtUH3P7R4x8ajhxpP+L7iRaC3m5S+7u
 6QXPDDWF5kdKrKA9sTPSpCkuLru/BqCO5xxWUR3lXvmTvot8dGxmfib8XB8ZafPM9LpX
 8/Je0wTw2YwTVCHE8fGJqrnw/Yf7yszSzVjqmxbDi39/yCRvF1LzwmqJ7xe7MSNjIzuL
 EVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=dixaIC9t3OrvoLk1mSTVozyFE2lVFat4gU9fyXFuErw=;
 b=svk6S1bdReAaSQ3thBPi09Qq5EeBnrWBPq8daaD+cFuxTDAKE9eUyZGbdD1ONsBoN3
 mKYV8bNpcjEW2YglTmSiockD37cyG/Z19BUGNXUhP7lcV3QsJQKOVAUD4gLq4wgou/ZF
 uDWbH3mX5OTEanb06a50wspBUuQ1w7Ms2zpLrUz22h43lnF/8fLG+oKfXJaLQXs//+Fo
 c9L/aIrHVQRvTtu40AcWOnG6DWSfd2zExpU8RnNGSfFxBtGiEbI6kGvoUnz9g/AILQFi
 uHBXXJOjZOVbvFwUJRFc4bo7ndxHdIZKwISY8ER6THwr+EPsItRHbnCJeVkoVP5/9m0n
 T2mQ==
X-Gm-Message-State: APjAAAVyeAINmlu1oZk8ZtVbIC+esNL40+bWW0eHxR+aAtGa+WUFnv3t
 nJZcEpIskm1aimORBW5cxwM=
X-Google-Smtp-Source: APXvYqxDaQxmQDbITha/zkkPa/QVpli5CxoKnCUpqr12oWk+ZyU1WNh7QDNiIE0RNlBYt2GXxiFA3w==
X-Received: by 2002:ac2:5326:: with SMTP id f6mr6832892lfh.33.1569428072751;
 Wed, 25 Sep 2019 09:14:32 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id m17sm1587415lje.0.2019.09.25.09.14.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Sep 2019 09:14:32 -0700 (PDT)
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
References: <20190918104113.3294-1-paul.durrant@citrix.com>
 <013c45a9490e413cb97abb02cef960bc@AMSPEX02CL03.citrite.net>
 <dcfdf2ab-8c64-ee63-637f-b0517087e8b5@suse.com>
 <23dec58404634921a595653f8a5ea504@AMSPEX02CL03.citrite.net>
 <7d50ae35-2642-7fe5-89c7-c4ee09f263d0@gmail.com>
 <89a30cb9c1374a5e884804196498400d@AMSPEX02CL03.citrite.net>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <7985fd54-bafd-3739-665e-fa16d627eb60@gmail.com>
Date: Wed, 25 Sep 2019 19:14:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <89a30cb9c1374a5e884804196498400d@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v13 0/4] add per-domain IOMMU control
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, David Scott <dave@recoil.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDI1LjA5LjE5IDE5OjAzLCBQYXVsIER1cnJhbnQgd3JvdGU6CgpIaSwgUGF1bAoKPj4gU3Vi
amVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2MTMgMC80XSBhZGQgcGVyLWRvbWFpbiBJT01N
VSBjb250cm9sCj4+Cj4+Cj4+IFtDQyBKdWxpZW5dCj4+Cj4+Cj4+IEhpIFBhdWwKPj4KPj4gSSBt
YXkgbWlzdGFrZSwgYnV0IGxvb2tzIGxpa2UKPj4KPj4gODBmZjNkMzM4ZGM5MzI2MGI0MWZmZWVl
YmIwZjg1MmMyZWRlZjljZSBpb21tdTogdGlkeSB1cAo+PiBpb21tdV91c2VfaGFwX3B0KCkgYW5k
IG5lZWRfaW9tbXVfcHRfc3luYygpIG1hY3Jvcwo+Pgo+PiB0cmlnZ2VycyBBU1NFUlRfVU5SRUFD
SEFCTEUgb24gQXJtIGlmIG5vIElPTU1VIGhhcyBiZWVuIGZvdW5kIChJIGJ1aWx0Cj4+IHdpdGgg
bXkgcGxhdGZvcm0ncyBJT01NVSBkcml2ZXIgZGlzYWJsZWQ6ICMgQ09ORklHX0lQTU1VX1ZNU0Eg
aXMgbm90IHNldCkgLgo+Pgo+PiBTbywgaW9tbXVfc2V0dXAoKSBjYWxscyBjbGVhcl9pb21tdV9o
YXBfcHRfc2hhcmUoKSB3aXRoCj4+IGlvbW11X2hhcF9wdF9zaGFyZSBiZWluZyBzZXQgKENPTkZJ
R19JT01NVV9GT1JDRV9QVF9TSEFSRT15KSB3aGljaCwKPj4gYWN0dWFsbHksIHRyaWdnZXJzIEFT
U0VSVC4KPiBCVFcsIEkgYXNzdW1lIGRpc2FibGluZyB0aGUgaW9tbXUgb24gdGhlIHhlbiBjb21t
YW5kIGxpa2Ugd2lsbCB3b3JrIHJvdW5kIHRoZSBpc3N1ZT8KCk5vLiBEaXNhYmxpbmcgdGhlIGlv
bW11IHdpbGwgbGVhZCB0byBBU1NFUlQgaW4gYWxsIGNhc2VzLgoKLS0gClJlZ2FyZHMsCgpPbGVr
c2FuZHIgVHlzaGNoZW5rbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=

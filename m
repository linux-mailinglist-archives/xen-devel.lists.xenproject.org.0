Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47246BB5A3
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 15:44:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCOaj-0002Uj-AT; Mon, 23 Sep 2019 13:41:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FsY0=XS=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iCOai-0002Ua-95
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 13:41:24 +0000
X-Inumbo-ID: d4dcb554-de07-11e9-b299-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4dcb554-de07-11e9-b299-bc764e2007e4;
 Mon, 23 Sep 2019 13:41:23 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id a22so13792389ljd.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2019 06:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ZopYy3tPV5fEgSKMYwFmn0yO8BeqdUp2DMrKHWGM0iU=;
 b=YAxCj4M1nMha40CZuzoj8k8Om9hsxEaGJyV/nbVunTSohYc4pbirR3W6vNzesybkC+
 KPULr4cSDfpVEbXLBk7ymU8V59FpFUvlkMnHLPRdRV6Z/2xQCj0r3TMKdA82PJuVk6GI
 peuzyMvV8kqNPWuqXJMXCn3jQ3AS0SsTqMftj7lYcBbQgh175cI5AszbQumgeHDkw1Dd
 ZbkjalPeColQFunJzkvzuP0X77XK8F9QrYYXPhnUHYu1pYP70T8zxtp4fsEHxop7qn0u
 lrTYx16XRGze2ZMVfmOcXmt5V4qaDRUMGgVPhU0yyf9WlNQs4Z+DSYrGcBp1XaYkI/xH
 xDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ZopYy3tPV5fEgSKMYwFmn0yO8BeqdUp2DMrKHWGM0iU=;
 b=pkNIEVI3Xq55Ez4W3gBE/9OBlklGQPeAykVXs+nudx1h+Idz/zJzzXM1X4ctjED/fA
 SHWjFdFKE6HwUpObubmcP00QN8nPF4SGr48SaOSSMO35c4O1iu7sgaYObPBTh8huAabo
 fEprnRZO/aWQ3hO7oqiCupXhZ97S3Cm9Nlnxd63AyDodRxqI2AENFwiiQym+GOGG9G9I
 GGvGFiDrA/UoGs+6BKlfe9noMWIGsSEZegVhH01Giy141/HODn3K/hXXsSaiAL6Sra91
 NJfdNaeE8rNiOo3fidJeiBV9mX7r+X4ZwZ3PNaBgecvIAbeNp+waHpBJkKCVOaNOb03E
 uJNg==
X-Gm-Message-State: APjAAAV5NBLlyOfx5neoC/9IpmnrCiFMSKw6dQ+SHerm8iogRRcz6WSi
 d20G3bbT4a5xYBEcSzxzVX0=
X-Google-Smtp-Source: APXvYqxtO/ILoHeZCzRPDpG+OwfB4mBqu8z7zHl9mhoL0P84Yn7PQGMnObT6RXcC0JjqaC4iy4aN/w==
X-Received: by 2002:a2e:8616:: with SMTP id a22mr4722776lji.6.1569246082350;
 Mon, 23 Sep 2019 06:41:22 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id g3sm2312911ljj.59.2019.09.23.06.41.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 23 Sep 2019 06:41:21 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-5-git-send-email-olekstysh@gmail.com>
 <81c2099d-ee08-2e0a-134c-0a9889748ac8@suse.com>
 <0021c5ab-457e-7cbf-a5c7-7d8676503116@gmail.com>
 <93811967-b49d-7a86-6d19-647cd0e8d1dd@suse.com>
 <4c2b6cca-5471-7430-0b29-fbd97c031074@gmail.com>
 <f890aba2-44d7-cdbd-5226-1705fedfd508@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <c24bb057-b938-85d9-a47d-e0187f31f8ea@gmail.com>
Date: Mon, 23 Sep 2019 16:41:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f890aba2-44d7-cdbd-5226-1705fedfd508@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 4/8] xen/common: Introduce _xrealloc
 function
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
Cc: sstabellini@kernel.org, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDIzLjA5LjE5IDE2OjMxLCBKYW4gQmV1bGljaCB3cm90ZToKCkhpLCBKYW4KCj4KPj4gKwo+
PiArwqDCoMKgIGlmICggcHRyID09IE5VTEwgfHwgcHRyID09IFpFUk9fQkxPQ0tfUFRSICkKPj4g
K8KgwqDCoMKgwqDCoMKgIHJldHVybiBfeG1hbGxvYyhzaXplLCBhbGlnbik7Cj4+ICsKPj4gK8Kg
wqDCoCBBU1NFUlQoKGFsaWduICYgKGFsaWduIC0gMSkpID09IDApOwo+PiArwqDCoMKgIGlmICgg
YWxpZ24gPCBNRU1fQUxJR04gKQo+PiArwqDCoMKgwqDCoMKgwqAgYWxpZ24gPSBNRU1fQUxJR047
Cj4+ICsKPj4gK8KgwqDCoCB0bXBfc2l6ZSA9IHNpemUgKyBhbGlnbiAtIE1FTV9BTElHTjsKPj4g
Kwo+PiArwqDCoMKgIGlmICggdG1wX3NpemUgPCBQQUdFX1NJWkUgKQo+PiArwqDCoMKgwqDCoMKg
wqAgdG1wX3NpemUgPSAodG1wX3NpemUgPCBNSU5fQkxPQ0tfU0laRSkgPyBNSU5fQkxPQ0tfU0la
RSA6Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFJPVU5EVVBfU0laRSh0bXBfc2l6ZSk7Cj4+
ICsKPj4gK8KgwqDCoCBpZiAoICEoKHVuc2lnbmVkIGxvbmcpcHRyICYgKFBBR0VfU0laRSAtIDEp
KSApCj4+ICvCoMKgwqAgewo+PiArwqDCoMKgwqDCoMKgwqAgY3Vycl9zaXplID0gKHVuc2lnbmVk
IGxvbmcpUEZOX09SREVSKHZpcnRfdG9fcGFnZShwdHIpKSA8PCBQQUdFX1NISUZUOwo+PiArCj4+
ICvCoMKgwqDCoMKgwqDCoCBpZiAoIHRtcF9zaXplIDw9IGN1cnJfc2l6ZSAmJiAoKHVuc2lnbmVk
IGxvbmcpcHRyICYgKGFsaWduIC0gMSkpID09IDAgKQo+IFlvdSBtZWFuICJzaXplIiBoZXJlIEkg
dGhpbmssIG5vdCAidG1wX3NpemUiLiBTZWUgaG93IHhtYWxsb2Nfd2hvbGVfcGFnZXMoKQo+IGdl
dHMgY2FsbGVkIGZyb20gX3htYWxsb2MoKSB3aXRoIGFuICJhZGp1c3RlZCBiYWNrIiB2YWx1ZS4K
ClllcywgdGhhbmsgeW91IGZvciBwb2ludGluZyB0aGlzLgoKPiBBbmQgYXMgc2FpZCwgcGxlYXNl
IGNsZWFuIHVwIHRoZSBjb2RlIHlvdSBtb3ZlIG9yIGFkZCBhbmV3OiBVc2UgY2FzdHMKPiBvbmx5
IHdoZXJlIHJlYWxseSBuZWVkZWQsIHRyYW5zZm9ybSB0eXBlcyB0byBhcHByb3ByaWF0ZSAibW9k
ZXJuIiBvbmVzLAo+IGV0Yy4KCm9rLCB3aWxsIGRvdWJsZSBjaGVjay4KCgotLSAKUmVnYXJkcywK
Ck9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==

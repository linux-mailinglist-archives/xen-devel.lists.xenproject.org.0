Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EECF71247AA
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 14:07:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihYyh-00030V-KK; Wed, 18 Dec 2019 13:02:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kHBV=2I=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ihYyg-00030Q-GC
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 13:02:58 +0000
X-Inumbo-ID: b18083c4-2196-11ea-88e7-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b18083c4-2196-11ea-88e7-bc764e2007e4;
 Wed, 18 Dec 2019 13:02:50 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a5so1755755wmb.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 05:02:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BgMPeO0OL4nbyXtnXhZQ2oJgMWGkEK/MsA81q/u/Nvk=;
 b=bxJHM0BFvHEDE1nm7k5SjMmwVhUdb8YksmOU6Q/uxFvF/CzLaETeKOb2Q5T+poPmZ3
 zQn+bkr/L6TJ+V3T0uVc8xzmFpaxjxtbbQYmnTItEutPdiWBmuht+BGVohpNGKwQOUeL
 NBpnbX+oCxf3Wi5w7eeC5KARvTxipK/0wPXwbPhU/UZM8vAo5lAmfLP3CfkGETMKg2sv
 Z/r5JM16tdmtoDlbL4MCy7CE4LIcNAFvvyeEdfDXAwOVgidt/VqyFtfXa5zU7mhhx/mt
 dB1vc84TOVALGZpuEbQ68cTztrhSJwsZ7V+uUT813OxMxbp8ms/Vx0FPaWTy9CoBB4fv
 i/Gg==
X-Gm-Message-State: APjAAAWK1Qv2eVu15ZvU//zTFgxDQwCkM5dF1slXoIxeuNFDmp3yj3P1
 RbYA4YP9XazgwOlTZZnAlg4=
X-Google-Smtp-Source: APXvYqyDZBscrMYTSUFzf4POxRBGwVfK6+IycAMhuj6Z+is/jEf4TODzaEo5E4GqnB4Zt44Jaxb4rg==
X-Received: by 2002:a05:600c:214f:: with SMTP id
 v15mr3214376wml.110.1576674169165; 
 Wed, 18 Dec 2019 05:02:49 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id v14sm2539257wrm.28.2019.12.18.05.02.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 05:02:48 -0800 (PST)
To: Roman Shaposhnik <roman@zededa.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <CAMmSBy8Zh00tebTvz=__GDv478++b-2t4248YnkH0W9DVgqKbw@mail.gmail.com>
 <alpine.DEB.2.21.1912161814220.13474@sstabellini-ThinkPad-T480s>
 <CAMmSBy_EG6=20dHde7AHby48Q8aWoRLAX+LFWTTTuKeHi8M+dg@mail.gmail.com>
 <5db3b29a-2f07-c807-1ee2-503d779548f7@xen.org>
 <alpine.DEB.2.21.1912171029300.12921@sstabellini-ThinkPad-T480s>
 <CAMmSBy_EVnfw0yMpevhJ-PqXoKo1GgvojH1SXDMdm4FKGNDQPA@mail.gmail.com>
 <alpine.DEB.2.21.1912171058200.12921@sstabellini-ThinkPad-T480s>
 <CAMmSBy-bdEumC=6s6CVFweJWc50nh2-nkEmQ2jtkXjZzziD2_A@mail.gmail.com>
 <alpine.DEB.2.21.1912171737160.12921@sstabellini-ThinkPad-T480s>
 <CAMmSBy8nMc1xj4Lh4emdkxpnwBrYBWh9wOx_muHAuO2rs1HmmQ@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b3043f9f-3554-d0c1-12cc-a95dbd68fca7@xen.org>
Date: Wed, 18 Dec 2019 13:02:47 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy8nMc1xj4Lh4emdkxpnwBrYBWh9wOx_muHAuO2rs1HmmQ@mail.gmail.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] REGRESSION: Xen 4.13 RC5 fails to bootstrap Dom0 on
 ARM
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
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxOC8xMi8yMDE5IDAyOjU2LCBSb21hbiBTaGFwb3NobmlrIHdyb3RlOgo+IE9uIFR1ZSwg
RGVjIDE3LCAyMDE5IGF0IDU6NTEgUE0gU3RlZmFubyBTdGFiZWxsaW5pCj4gPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4gSW50ZXJlc3RpbmdseSBlbm91Z2gsIFhlbiBib290ZWQs
IGFuZCBjb21wbGFpbmVkIGFib3V0IG9ubHkgMTkyTUIKPj4+IHVuYWxsb2NhdGVkIHRoaXMgdGlt
ZS4KPj4+IFNvLCBJIGRyb3BwZWQgdGhlIHNpemUgb2YgRG9tMCB0byA2NDBNIGFuZCBJIGdvdCBp
dCBib290IGFuZCBoZXJlJ3MKPj4+IHdoYXQgSSdtIHNlZWluZyBhcwo+Pj4gYW4gb3V0cHV0IG9m
IHhsIGluZm86Cj4+PiAgICAgdG90YWxfbWVtb3J5ICAgICAgICAgICA6IDExMjAKPj4+ICAgICBm
cmVlX21lbW9yeSAgICAgICAgICAgIDogMzkwCj4+PiBJdCBzdGlsbCBub3doZXJlIGNsb3NlIHRv
IDJHLgo+Pj4KPj4+IFRoZW4gSSBib290ZWQgdGhlIExpbnV4IGtlcm5lbCB3aXRob3V0IFhlbiBh
bmQgaXQgY29ycmVjdGx5IGlkZW50aWZpZWQKPj4+IGFsbCAyRyB3b3J0aCBvZiBSQU0sIGFuZCBp
biBmYWN0LAo+Pgo+PiBHb29kISBXZSBjYW4gd29yayB3aXRoIHRoYXQuCj4gCj4gU28gdGhhdCBp
cywgaW4gZmFjdCwgbXkgZmlyc3QgcXVlc3Rpb24gLS0gd2h5IGlzIFhlbiBub3Qgc2hvd2luZwo+
IGF2YWlsYWJsZSBtZW1vcnkgaW4geGwgaW5mbz8KCkkgYW0gbm90IGVudGlyZWx5IHN1cmUgd2hh
dCBleGFjdCBpbmZvcm1hdGlvbiB5b3Ugd2FudC4KClRoZSBvdXRwdXQgeW91IGR1bXBlZCBhYm92
ZSBjb250YWluIHRoZSBhdmFpbGFibGUgbWVtb3J5IGZvciB0aGUgbWVtb3J5IAooc2VlICJmcmVl
X21lbW9yeSIpLgoKQXJlIHlvdSBsb29raW5nIGZyb20gc29tZXRoaW5nIGRpZmZlcmVudD8KCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=

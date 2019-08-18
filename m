Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB08919C6
	for <lists+xen-devel@lfdr.de>; Sun, 18 Aug 2019 23:48:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzSyY-0001hL-P5; Sun, 18 Aug 2019 21:44:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/cmT=WO=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1hzSyX-0001hG-8u
 for xen-devel@lists.xenproject.org; Sun, 18 Aug 2019 21:44:33 +0000
X-Inumbo-ID: 5ca438d6-c201-11e9-b90c-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ca438d6-c201-11e9-b90c-bc764e2007e4;
 Sun, 18 Aug 2019 21:44:31 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 221D8EC522
 for <xen-devel@lists.xenproject.org>; Sun, 18 Aug 2019 21:44:31 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id q9so4195325wrc.12
 for <xen-devel@lists.xenproject.org>; Sun, 18 Aug 2019 14:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h2xzjSFZNTWlCffgvGmqesSJuEHPH52iwk5nP49KPQY=;
 b=O2cdwygPUgrjtHt4zdo/oeRLGV992t3g59x2XYlRRMtCwcrCuV564qlWz59PoqwLio
 MMcm120HusjZRnQOgoxtYznPOBeLCbUHGEUJ6XjARWmTbw8oAJosB3inq97T6YqeyN2u
 pKRwOEhoRWphN3sS6J42c3a7UfNG3JeZazR8vvHaMEdNkX1IuOSWee7EpbR1+6Ea4BEh
 +fOoHXXJL+GKVeB/tUkOp4XldZjIjEOjgYaZNpVqxaTYt43t4X9nNCjd4C2lYPdZoluR
 I0QnsSk4Jg94klt6M0KkPcnu25yLetDKMvnTn/TlQ+tnK5fGX9y+3Bfm5DfIi3RpvOeb
 OXwQ==
X-Gm-Message-State: APjAAAX9+YUXL6rluJqofrYHgNALrQv4ozUPIVRkYWf7XgFsjxAMKvcj
 K+OmCTp9dFEDtdhhXYQ61A81wxGEWV40PCIXyp42jotm7k/EJWw3nYdIRk3EsgPev3wIBnjzycH
 /DYBMLmQT//Qr/58OO2hHyd3ZhYU=
X-Received: by 2002:adf:edc9:: with SMTP id v9mr22550655wro.125.1566164669524; 
 Sun, 18 Aug 2019 14:44:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyq1v4DfCMJNoAeYMrQK7nrdjPPaAOfkuNduzjgjCwxae6Z6aJ5i74L3JJILhmb7zElm7rP7A==
X-Received: by 2002:adf:edc9:: with SMTP id v9mr22550609wro.125.1566164669299; 
 Sun, 18 Aug 2019 14:44:29 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id f18sm13122174wrx.85.2019.08.18.14.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Aug 2019 14:44:28 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <1565940633026.69822@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <3872a5ec-ccf1-2978-34b5-b0b5478d2b86@redhat.com>
Date: Sun, 18 Aug 2019 23:44:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1565940633026.69822@bt.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v7 11/42] memory: Access
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
Cc: frederic.konrad@adacore.com, berto@igalia.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, pasic@linux.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org, balrogg@gmail.com,
 jasowang@redhat.com, jiri@resnulli.us, ehabkost@redhat.com,
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
 qemu-arm@nongnu.org, jan.kiszka@web.de, clg@kaod.org, shorne@gmail.com,
 qemu-riscv@nongnu.org, i.mitsyanko@gmail.com, cohuck@redhat.com,
 amarkovic@wavecomp.com, peter.chubb@nicta.com.au, aurelien@aurel32.net,
 pburton@wavecomp.com, sagark@eecs.berkeley.edu, green@moxielogic.com,
 kraxel@redhat.com, edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn,
 robh@kernel.org, borntraeger@de.ibm.com, joel@jms.id.au,
 antonynpavlov@gmail.com, chouteau@adacore.com, lersek@redhat.com,
 Andrew.Baumann@microsoft.com, mreitz@redhat.com, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 jslaby@suse.cz, marex@denx.de, proljc@gmail.com, marcandre.lureau@redhat.com,
 alistair@alistair23.me, paul.durrant@citrix.com, david@gibson.dropbear.id.au,
 xiaoguangrong.eric@gmail.com, huth@tuxfamily.org, jcd@tribudubois.net,
 pbonzini@redhat.com, stefanb@linux.ibm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8xNi8xOSA5OjMwIEFNLCB0b255Lm5ndXllbkBidC5jb20gd3JvdGU6Cj4gQ29udmVydCBt
ZW1vcnlfcmVnaW9uX2Rpc3BhdGNoX3tyZWFkfHdyaXRlfSBvcGVyYW5kICJ1bnNpZ25lZCBzaXpl
Igo+IGludG8gYSAiTWVtT3Agb3AiLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRvbnkgTmd1eWVuIDx0
b255Lm5ndXllbkBidC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNo
YXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPgo+IC0tLQo+IMKgaW5jbHVkZS9leGVjL21lbW9wLmgg
wqB8IDIwICsrKysrKysrKysrKysrLS0tLS0tCj4gwqBpbmNsdWRlL2V4ZWMvbWVtb3J5LmggfCDC
oDkgKysrKystLS0tCj4gwqBtZW1vcnkuYyDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgwqA3ICsrKysr
LS0KPiDCoDMgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZXhlYy9tZW1vcC5oIGIvaW5jbHVkZS9leGVjL21l
bW9wLmgKPiBpbmRleCBkZmQ3NmExLi4wYTYxMGI3IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZXhl
Yy9tZW1vcC5oCj4gKysrIGIvaW5jbHVkZS9leGVjL21lbW9wLmgKPiBAQCAtMTIsNiArMTIsOCBA
QAo+IMKgI2lmbmRlZiBNRU1PUF9ICj4gwqAjZGVmaW5lIE1FTU9QX0gKPiDCoAo+ICsjaW5jbHVk
ZSAicWVtdS9ob3N0LXV0aWxzLmgiCj4gKwo+IMKgdHlwZWRlZiBlbnVtIE1lbU9wIHsKPiDCoCDC
oCDCoE1PXzggwqAgwqAgPSAwLAo+IMKgIMKgIMKgTU9fMTYgwqAgwqA9IDEsCj4gQEAgLTEwNywx
NCArMTA5LDIwIEBAIHR5cGVkZWYgZW51bSBNZW1PcCB7Cj4gwqAgwqAgwqBNT19TU0laRSA9IE1P
X1NJWkUgfCBNT19TSUdOLAo+IMKgfSBNZW1PcDsKPiDCoAo+ICsvKiBNZW1PcCB0byBzaXplIGlu
IGJ5dGVzLiDCoCovCj4gK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgbWVtb3Bfc2l6ZShNZW1PcCBv
cCkKPiArewo+ICsgwqAgwqByZXR1cm4gMSA8PCAob3AgJiBNT19TSVpFKTsKPiArfQo+ICsKPiDC
oC8qIFNpemUgaW4gYnl0ZXMgdG8gTWVtT3AuIMKgKi8KPiAtc3RhdGljIGlubGluZSB1bnNpZ25l
ZCBzaXplX21lbW9wKHVuc2lnbmVkIHNpemUpCj4gK3N0YXRpYyBpbmxpbmUgTWVtT3Agc2l6ZV9t
ZW1vcCh1bnNpZ25lZCBzaXplKQo+IMKgewo+IC0gwqAgwqAvKgo+IC0gwqAgwqAgKiBGSVhNRTog
Tm8tb3AgdG8gYWlkIGNvbnZlcnNpb24gb2YKPiBtZW1vcnlfcmVnaW9uX2Rpc3BhdGNoX3tyZWFk
fHdyaXRlfQo+IC0gwqAgwqAgKiAidW5zaWduZWQgc2l6ZSIgb3BlcmFuZCBpbnRvIGEgIk1lbU9w
IG9wIi4KPiAtIMKgIMKgICovCj4gLSDCoCDCoHJldHVybiBzaXplOwo+ICsjaWZkZWYgQ09ORklH
X0RFQlVHX1RDRwo+ICsgwqAgwqAvKiBQb3dlciBvZiAyIHVwIHRvIDguIMKgKi8KPiArIMKgIMKg
YXNzZXJ0KChzaXplICYgKHNpemUgLSAxKSkgPT0gMCAmJiBzaXplID49IDEgJiYgc2l6ZSA8PSA4
KTsKCkVhc2llciB0byByZXZpZXcgYXM6CgogICAgICAgYXNzZXJ0KGlzX3Bvd2VyX29mXzIoc2l6
ZSkgJiYgc2l6ZSA8PSA4KTsKCihUaGlzIGNhbiBiZSBjbGVhbmVkIGxhdGVyKS4KCj4gKyNlbmRp
Zgo+ICsgwqAgwqByZXR1cm4gY3R6MzIoc2l6ZSk7Cj4gwqB9Cj4gwqAKPiDCoCNlbmRpZgo+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2V4ZWMvbWVtb3J5LmggYi9pbmNsdWRlL2V4ZWMvbWVtb3J5LmgK
PiBpbmRleCBiYjA5NjFkLi45NzViODZhIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZXhlYy9tZW1v
cnkuaAo+ICsrKyBiL2luY2x1ZGUvZXhlYy9tZW1vcnkuaAo+IEBAIC0xOSw2ICsxOSw3IEBACj4g
wqAjaW5jbHVkZSAiZXhlYy9jcHUtY29tbW9uLmgiCj4gwqAjaW5jbHVkZSAiZXhlYy9od2FkZHIu
aCIKPiDCoCNpbmNsdWRlICJleGVjL21lbWF0dHJzLmgiCj4gKyNpbmNsdWRlICJleGVjL21lbW9w
LmgiCj4gwqAjaW5jbHVkZSAiZXhlYy9yYW1saXN0LmgiCj4gwqAjaW5jbHVkZSAicWVtdS9xdWV1
ZS5oIgo+IMKgI2luY2x1ZGUgInFlbXUvaW50MTI4LmgiCj4gQEAgLTE3MzEsMTMgKzE3MzIsMTMg
QEAgdm9pZCBtdHJlZV9pbmZvKGJvb2wgZmxhdHZpZXcsIGJvb2wKPiBkaXNwYXRjaF90cmVlLCBi
b29sIG93bmVyKTsKPiDCoCAqIEBtcjogI01lbW9yeVJlZ2lvbiB0byBhY2Nlc3MKPiDCoCAqIEBh
ZGRyOiBhZGRyZXNzIHdpdGhpbiB0aGF0IHJlZ2lvbgo+IMKgICogQHB2YWw6IHBvaW50ZXIgdG8g
dWludDY0X3Qgd2hpY2ggdGhlIGRhdGEgaXMgd3JpdHRlbiB0bwo+IC0gKiBAc2l6ZTogc2l6ZSBv
ZiB0aGUgYWNjZXNzIGluIGJ5dGVzCj4gKyAqIEBvcDogc2l6ZSwgc2lnbiwgYW5kIGVuZGlhbm5l
c3Mgb2YgdGhlIG1lbW9yeSBvcGVyYXRpb24KPiDCoCAqIEBhdHRyczogbWVtb3J5IHRyYW5zYWN0
aW9uIGF0dHJpYnV0ZXMgdG8gdXNlIGZvciB0aGUgYWNjZXNzCj4gwqAgKi8KPiDCoE1lbVR4UmVz
dWx0IG1lbW9yeV9yZWdpb25fZGlzcGF0Y2hfcmVhZChNZW1vcnlSZWdpb24gKm1yLAo+IMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
aHdhZGRyIGFkZHIsCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB1aW50NjRfdCAqcHZhbCwKPiAtIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdW5zaWduZWQgc2l6ZSwK
PiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgTWVtT3Agb3AsCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBNZW1UeEF0dHJzIGF0dHJzKTsKPiDCoC8qKgo+IMKgICog
bWVtb3J5X3JlZ2lvbl9kaXNwYXRjaF93cml0ZTogcGVyZm9ybSBhIHdyaXRlIGRpcmVjdGx5IHRv
IHRoZSBzcGVjaWZpZWQKPiBAQCAtMTc0NiwxMyArMTc0NywxMyBAQCBNZW1UeFJlc3VsdAo+IG1l
bW9yeV9yZWdpb25fZGlzcGF0Y2hfcmVhZChNZW1vcnlSZWdpb24gKm1yLAo+IMKgICogQG1yOiAj
TWVtb3J5UmVnaW9uIHRvIGFjY2Vzcwo+IMKgICogQGFkZHI6IGFkZHJlc3Mgd2l0aGluIHRoYXQg
cmVnaW9uCj4gwqAgKiBAZGF0YTogZGF0YSB0byB3cml0ZQo+IC0gKiBAc2l6ZTogc2l6ZSBvZiB0
aGUgYWNjZXNzIGluIGJ5dGVzCj4gKyAqIEBvcDogc2l6ZSwgc2lnbiwgYW5kIGVuZGlhbm5lc3Mg
b2YgdGhlIG1lbW9yeSBvcGVyYXRpb24KPiDCoCAqIEBhdHRyczogbWVtb3J5IHRyYW5zYWN0aW9u
IGF0dHJpYnV0ZXMgdG8gdXNlIGZvciB0aGUgYWNjZXNzCj4gwqAgKi8KPiDCoE1lbVR4UmVzdWx0
IG1lbW9yeV9yZWdpb25fZGlzcGF0Y2hfd3JpdGUoTWVtb3J5UmVnaW9uICptciwKPiDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBo
d2FkZHIgYWRkciwKPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCB1aW50NjRfdCBkYXRhLAo+IC0gwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdW5zaWduZWQgc2l6ZSwK
PiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIE1lbU9wIG9wLAo+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIE1lbVR4QXR0cnMgYXR0cnMpOwo+IMKgCj4gwqAvKioK
PiBkaWZmIC0tZ2l0IGEvbWVtb3J5LmMgYi9tZW1vcnkuYwo+IGluZGV4IDVkOGM5YTkuLjg5ZWE0
ZmIgMTAwNjQ0Cj4gLS0tIGEvbWVtb3J5LmMKPiArKysgYi9tZW1vcnkuYwo+IEBAIC0xNDM5LDkg
KzE0MzksMTAgQEAgc3RhdGljIE1lbVR4UmVzdWx0Cj4gbWVtb3J5X3JlZ2lvbl9kaXNwYXRjaF9y
ZWFkMShNZW1vcnlSZWdpb24gKm1yLAo+IMKgTWVtVHhSZXN1bHQgbWVtb3J5X3JlZ2lvbl9kaXNw
YXRjaF9yZWFkKE1lbW9yeVJlZ2lvbiAqbXIsCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBod2FkZHIgYWRkciwKPiDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVp
bnQ2NF90ICpwdmFsLAo+IC0gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB1bnNpZ25lZCBzaXplLAo+ICsgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBNZW1PcCBvcCwKPiDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oE1lbVR4QXR0cnMgYXR0cnMpCj4gwqB7Cj4gKyDCoCDCoHVuc2lnbmVkIHNpemUgPSBtZW1vcF9z
aXplKG9wKTsKPiDCoCDCoCDCoE1lbVR4UmVzdWx0IHI7Cj4gwqAKPiDCoCDCoCDCoGlmICghbWVt
b3J5X3JlZ2lvbl9hY2Nlc3NfdmFsaWQobXIsIGFkZHIsIHNpemUsIGZhbHNlLCBhdHRycykpIHsK
PiBAQCAtMTQ4Myw5ICsxNDg0LDExIEBAIHN0YXRpYyBib29sCj4gbWVtb3J5X3JlZ2lvbl9kaXNw
YXRjaF93cml0ZV9ldmVudGZkcyhNZW1vcnlSZWdpb24gKm1yLAo+IMKgTWVtVHhSZXN1bHQgbWVt
b3J5X3JlZ2lvbl9kaXNwYXRjaF93cml0ZShNZW1vcnlSZWdpb24gKm1yLAo+IMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGh3YWRk
ciBhZGRyLAo+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHVpbnQ2NF90IGRhdGEsCj4gLSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB1bnNpZ25lZCBzaXplLAo+ICsg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgTWVtT3Agb3AsCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgTWVtVHhBdHRycyBhdHRycykKPiDCoHsKPiArIMKgIMKgdW5z
aWduZWQgc2l6ZSA9IG1lbW9wX3NpemUob3ApOwo+ICsKPiDCoCDCoCDCoGlmICghbWVtb3J5X3Jl
Z2lvbl9hY2Nlc3NfdmFsaWQobXIsIGFkZHIsIHNpemUsIHRydWUsIGF0dHJzKSkgewo+IMKgIMKg
IMKgIMKgIMKgdW5hc3NpZ25lZF9tZW1fd3JpdGUobXIsIGFkZHIsIGRhdGEsIHNpemUpOwo+IMKg
IMKgIMKgIMKgIMKgcmV0dXJuIE1FTVRYX0RFQ09ERV9FUlJPUjsKPiAtLcKgCj4gMS44LjMuMQo+
IAo+IOKAiwo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==

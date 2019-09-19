Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CECB78D1
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 14:01:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAv4y-0006cr-5L; Thu, 19 Sep 2019 11:58:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C8m3=XO=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iAv4w-0006cQ-M4
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 11:58:30 +0000
X-Inumbo-ID: cb1d32f4-dad4-11e9-a337-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb1d32f4-dad4-11e9-a337-bc764e2007e4;
 Thu, 19 Sep 2019 11:58:29 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id u3so2131927lfl.10
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2019 04:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=q4K70qfPmbAL6qf/du5rRnls1Hd554HwmZrgX2Ay7rU=;
 b=CEEgm+r1xuTkuENWK1k+wc5sVEdcgwYx9szvB3Q3CL2CXWzEIKJsyI3DfN5pWaaE/Q
 vHJhZ8UI+DM28j9/6vMsM1jomWsNjYbPTHJP7xnZFxE956+CoKYdnSrcr6iOWaxykDnw
 SKzXhhc0GYJraHthpZr/x517JfxClneq3Tm4OtK8ACm7gaYLGS6B6pUgcNHGnco4QXfx
 TQVl7rf8MFw9XFqao/AxO0E4mr+IegmDkBUDDJHUUW/poj6PBNBcdMDuBFSdX1rUXXuG
 SP/17cE3ArwMjS3Qrjuybf9UOUSSERmqpKnHT/Fk5FMrRXrZ7SnvPlTgNkP/UbDj/QH3
 e2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=q4K70qfPmbAL6qf/du5rRnls1Hd554HwmZrgX2Ay7rU=;
 b=hpAVOwEyiSQcT56ubYVYsg9lnt3TGB/YGKt7fnmb0Sb2WowbqYqfjwE/HAeqwfC2Sw
 GksFZmhKY5SXkJFjg+mwoDRC4IA2TGfkkasMkRr5ReoHevJLNDMKvHk3m1x3RIUOs3sX
 37sX4EejCabKpEI87HrdYBGoH+ClMkWkGGOjDTb4Z2VBl4qpqLgzgc8YEN0wRwjISt1/
 fibpq+gCzsVWPtClH1pxwoanWExiDVEpbCon5jfdR0wix4XHrfpcYicxr4Si9zWwB/JL
 oYe6/CbqyJ/lmzSrKJclbJfPUcrq3LAELaSNBTi9O7N+C0zySMmPT578iC4yL1f6+FbD
 4UIQ==
X-Gm-Message-State: APjAAAWtFCN8vi9Hsad+1U8n8iS1IgJY9nZV1dCLQsAK9M2WqQBA9AP2
 TbPMPavItg3hyv4EbvkfDBE=
X-Google-Smtp-Source: APXvYqw0aFJKnV7pOmicDiHlMQjkQ1hK6iCBoWunIbDnxlrxc2qf++gRUw0+3RAJ3oeIFnLZMR3WbQ==
X-Received: by 2002:a19:7715:: with SMTP id s21mr4725821lfc.98.1568894308193; 
 Thu, 19 Sep 2019 04:58:28 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id i6sm1517640lfc.37.2019.09.19.04.58.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Sep 2019 04:58:27 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-9-git-send-email-olekstysh@gmail.com>
 <fd0e0580-2796-40c8-1f53-642e56d2c98e@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <5adb3723-8252-1aca-3f63-86a232d68004@gmail.com>
Date: Thu, 19 Sep 2019 14:58:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fd0e0580-2796-40c8-1f53-642e56d2c98e@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 8/8] iommu/arm: Add Renesas IPMMU-VMSA
 support
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, sstabellini@kernel.org,
 Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDE5LjA5LjE5IDE0OjQ1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgT2xla3NhbmRyLAoK
CkhpIEp1bGllbgoKCj4KPiBPbiAxMy8wOS8yMDE5IDE2OjM1LCBPbGVrc2FuZHIgVHlzaGNoZW5r
byB3cm90ZToKPj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hl
bmtvQGVwYW0uY29tPgo+Pgo+PiBUaGUgSVBNTVUtVk1TQSBpcyBWTVNBLWNvbXBhdGlibGUgSS9P
IE1lbW9yeSBNYW5hZ2VtZW50IFVuaXQgKElPTU1VKQo+PiB3aGljaCBwcm92aWRlcyBhZGRyZXNz
IHRyYW5zbGF0aW9uIGFuZCBhY2Nlc3MgcHJvdGVjdGlvbiBmdW5jdGlvbmFsaXRpZXMKPj4gdG8g
cHJvY2Vzc2luZyB1bml0cyBhbmQgaW50ZXJjb25uZWN0IG5ldHdvcmtzLgo+Pgo+PiBQbGVhc2Ug
bm90ZSwgY3VycmVudCBkcml2ZXIgaXMgc3VwcG9zZWQgdG8gd29yayBvbmx5IHdpdGggbmV3ZXN0
Cj4+IFItQ2FyIEdlbjMgU29DcyByZXZpc2lvbnMgd2hpY2ggSVBNTVUgaGFyZHdhcmUgc3VwcG9y
dHMgc3RhZ2UgMiAKPj4gdHJhbnNsYXRpb24KPj4gdGFibGUgZm9ybWF0IGFuZCBpcyBhYmxlIHRv
IHVzZSBDUFUncyBQMk0gdGFibGUgYXMgaXMgaWYgb25lIGlzCj4+IDMtbGV2ZWwgcGFnZSB0YWJs
ZSAodXAgdG8gNDAgYml0IElQQSkuCj4+Cj4+IFRoZSBtYWpvciBkaWZmZXJlbmNlcyBjb21wYXJl
IHRvIHRoZSBMaW51eCBkcml2ZXIgYXJlOgo+Pgo+PiAxLiBTdGFnZSAxL1N0YWdlIDIgdHJhbnNs
YXRpb24uIExpbnV4IGRyaXZlciBzdXBwb3J0cyBTdGFnZSAxCj4+IHRyYW5zbGF0aW9uIG9ubHkg
KHdpdGggU3RhZ2UgMSB0cmFuc2xhdGlvbiB0YWJsZSBmb3JtYXQpLiBJdCBtYW5hZ2VzCj4+IHBh
Z2UgdGFibGUgYnkgaXRzZWxmLiBCdXQgWGVuIGRyaXZlciBzdXBwb3J0cyBTdGFnZSAyIHRyYW5z
bGF0aW9uCj4+ICh3aXRoIFN0YWdlIDIgdHJhbnNsYXRpb24gdGFibGUgZm9ybWF0KSB0byBiZSBh
YmxlIHRvIHNoYXJlIHRoZSBQMk0KPj4gd2l0aCB0aGUgQ1BVLiBTdGFnZSAxIHRyYW5zbGF0aW9u
IGlzIGFsd2F5cyBieXBhc3NlZCBpbiBYZW4gZHJpdmVyLgo+Pgo+PiBTbywgWGVuIGRyaXZlciBp
cyBzdXBwb3NlZCB0byBiZSB1c2VkIHdpdGggbmV3ZXN0IFItQ2FyIEdlbjMgU29DIAo+PiByZXZp
c2lvbnMKPj4gb25seSAoSDMgRVMzLjAsIE0zLVcrLCBldGMuKSB3aGljaCBJUE1NVSBIL1cgc3Vw
cG9ydHMgc3RhZ2UgMiAKPj4gdHJhbnNsYXRpb24KPj4gdGFibGUgZm9ybWF0Lgo+Pgo+PiAyLiBB
QXJjaDY0IHN1cHBvcnQuIExpbnV4IGRyaXZlciB1c2VzIFZNU0F2OC0zMiBtb2RlLCB3aGlsZSBY
ZW4gZHJpdmVyCj4+IGVuYWJsZXMgQXJtdjggVk1TQXY4LTY0IG1vZGUgdG8gY292ZXIgdXAgdG8g
NDAgYml0IGlucHV0IGFkZHJlc3MuCj4+Cj4+IDMuIENvbnRleHQgYmFuayAoc2V0cyBvZiBwYWdl
IHRhYmxlKSB1c2FnZS4gSW4gWGVuLCBlYWNoIGNvbnRleHQgYmFuayBpcwo+PiBtYXBwZWQgdG8g
b25lIFhlbiBkb21haW4uIFNvLCBhbGwgZGV2aWNlcyBiZWluZyBwYXNzIHRocm91Z2hlZCB0byB0
aGUKPj4gc2FtZSBYZW4gZG9tYWluIHNoYXJlIHRoZSBzYW1lIGNvbnRleHQgYmFuay4KPj4KPj4g
NC4gSVBNTVUgZGV2aWNlIHRyYWNraW5nLiBJbiBYZW4sIGFsbCBJT01NVSBkZXZpY2VzIGFyZSBt
YW5hZ2VkCj4+IGJ5IHNpbmdsZSBkcml2ZXIgaW5zdGFuY2UuIFNvLCBkcml2ZXIgdXNlcyBnbG9i
YWwgbGlzdCB0byBrZWVwIHRyYWNrCj4+IG9mIHJlZ2lzdGVyZWQgSVBNTVUgZGV2aWNlcy4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hl
bmtvQGVwYW0uY29tPgo+PiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
Pj4gQ0M6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNv
bT4KPgo+IFRoZSBYZW4gc3BlY2lmaWMgYml0cyBsb29rcyBnb29kIG5vdy4gQXNzdW1pbmcgWW9z
aGloaXJvIHdpbGwgZ2l2ZSBoaXMgCj4gcmV2aWV3ZWQtYnkvYWNrZWQtYnk6Cj4KPiBBY2tlZC1i
eTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClRoYW5rIHlvdSEKCgpPbmUg
bm90ZSwgaXQgdHVybmVkIG91dCBbMV0gdGhhdCAiYXJncyIgcGFyYW1ldGVyIGluICJkdF94bGF0
ZSIgY2FsbGJhY2sgCm5lZWRzICJjb25zdCIgYWRkZWQgKGl0IGlzIG5vdCBhc3N1bWVkIHRvIG1v
ZGlmeSBpdCBpbnNpZGUgdGhlIGNhbGxiYWNrKS4KClRoaXMgbGVhZHMgdG8gYWRkaXRpb25hbCBj
aGFuZ2VzIHRvIHRoZSBJUE1NVSBkcml2ZXIuIElmIHlvdSBoYXBweSB3aXRoIAp0aGUgY2hhbmdl
cyBiZWxvdywgSSB3aWxsIHJldGFpbiB5b3VyIEEtYi4KCgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvYXJtL2lwbW11LXZtc2EuYyAKYi94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9hcm0vaXBtbXUtdm1zYS5jCmluZGV4IGI1YzE4YzIuLjQzZTRhODQgMTAwNjQ0Ci0tLSBhL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pcG1tdS12bXNhLmMKKysrIGIveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvYXJtL2lwbW11LXZtc2EuYwpAQCAtNjk2LDcgKzY5Niw3IEBAIHN0YXRpYyB2
b2lkIGlwbW11X2RldGFjaF9kZXZpY2Uoc3RydWN0IAppcG1tdV92bXNhX2RvbWFpbiAqZG9tYWlu
LAogwqB9CgogwqBzdGF0aWMgaW50IGlwbW11X2luaXRfcGxhdGZvcm1fZGV2aWNlKHN0cnVjdCBk
ZXZpY2UgKmRldiwKLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkdF9waGFuZGxlX2FyZ3MgKmFy
Z3MpCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgZHRfcGhhbmRsZV9hcmdzICphcmdz
KQogwqB7CiDCoMKgwqDCoCBzdHJ1Y3QgaW9tbXVfZndzcGVjICpmd3NwZWMgPSBkZXZfaW9tbXVf
ZndzcGVjX2dldChkZXYpOwogwqDCoMKgwqAgc3RydWN0IGlwbW11X3Ztc2FfZGV2aWNlICptbXU7
CkBAIC0xMTc0LDcgKzExNzQsOCBAQCBzdGF0aWMgaW50IGlwbW11X3JlYXNzaWduX2RldmljZShz
dHJ1Y3QgZG9tYWluICpzLCAKc3RydWN0IGRvbWFpbiAqdCwKIMKgwqDCoMKgIHJldHVybiAwOwog
wqB9Cgotc3RhdGljIGludCBpcG1tdV9kdF94bGF0ZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVj
dCBkdF9waGFuZGxlX2FyZ3MgKnNwZWMpCitzdGF0aWMgaW50IGlwbW11X2R0X3hsYXRlKHN0cnVj
dCBkZXZpY2UgKmRldiwKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBkdF9waGFuZGxlX2FyZ3MgKnNwZWMpCiDCoHsKIMKgwqDC
oMKgIGludCByZXQ7CgpAQCAtMTE4Nyw3ICsxMTg4LDcgQEAgc3RhdGljIGludCBpcG1tdV9kdF94
bGF0ZShzdHJ1Y3QgZGV2aWNlICpkZXYsIApzdHJ1Y3QgZHRfcGhhbmRsZV9hcmdzICpzcGVjKQog
wqDCoMKgwqAgaWYgKCBzcGVjLT5hcmdzX2NvdW50ICE9IDEgfHwgc3BlYy0+YXJnc1swXSA+PSBJ
UE1NVV9VVExCX01BWCApCiDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwoKLcKgwqDC
oCByZXQgPSBpb21tdV9md3NwZWNfYWRkX2lkcyhkZXYsIHNwZWMtPmFyZ3MsIDEpOworwqDCoMKg
IHJldCA9IGlvbW11X2Z3c3BlY19hZGRfaWRzKGRldiwgKHVpbnQzMl90ICopc3BlYy0+YXJncywg
MSk7CiDCoMKgwqDCoCBpZiAoIHJldCApCiDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7CgoK
WzFdIApodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVs
LzIwMTktMDkvbXNnMDE0NDMuaHRtbAoKCi0tIApSZWdhcmRzLAoKT2xla3NhbmRyIFR5c2hjaGVu
a28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B9691A340
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 11:58:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749919.1158165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMltP-00015H-CP; Thu, 27 Jun 2024 09:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749919.1158165; Thu, 27 Jun 2024 09:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMltP-00013q-8t; Thu, 27 Jun 2024 09:58:15 +0000
Received: by outflank-mailman (input) for mailman id 749919;
 Thu, 27 Jun 2024 09:58:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1631=N5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sMltN-00013k-W9
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 09:58:13 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3505255-346b-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 11:58:12 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a724a8097deso603187566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 02:58:12 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a729d71f515sm43530066b.51.2024.06.27.02.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 02:58:10 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: c3505255-346b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719482291; x=1720087091; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sHZosWfAog9FFoUMqCVZSYKIUVzOgM5RXUlu794ZtRk=;
        b=eneKq3i+UVqcGtBS+d5yMUtfwZD9HzoogHEaDIC+l4t2xQw8QM6z+CaFFHUeREa1Sq
         FG5hYrnmavVyYrFc4bzLV2jI1NhWHTy9lNnDD5RBx5IOuLp+TzrQv6x1ZGYZwXc6OsMJ
         5QB7Kab3cZ01sU8FucRM7KHsFrDJ1AzG9Utf6Yw9pr0l5M34P09LOmR1J2cxPAxAxGem
         DxYNn8VqLmTdFRo9HNMZ72YfT8rhMlxKC45Ue9xS6zhHhPzfEpIrWbtMOaewf6RZ5+Do
         dHx4XXJ2V+Smpn0MVzdEs7ZY6aJlcmSCXJm+9PS4YbsJQF0dzoJNsbzsSjqqxoa+S+MY
         C07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719482291; x=1720087091;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sHZosWfAog9FFoUMqCVZSYKIUVzOgM5RXUlu794ZtRk=;
        b=GbijUexk/o52wtl1TKEToXI2fS+9f3jsFNfOdx4YSr8Q8xRNK0UUiIEEouIVD+77CQ
         fSS2LIrcU2O6mVoru7ADUdnNxQHlbEYP0+YQBawZcyAmrf4GXjeUvr88q1U0+HnmieF4
         tcWhfC43+yxJ149S5/TPf2eFxXZ5dLb8nTQdk65LxpMMWFTTIjZSHJW8QjS36j7nDO8U
         34H6TB4OWi0ZRTRjJyJDOJp3wchcTZNM6uYj60x6GAXLbBY+Y3oCcN0IxP8xzCSVoZRg
         aLydZ7lxn2Q0Q1nHVbTn/5ifSU4Zqfl3gj8sR3LdxdgOUPK+agL7I4E0GIEu5B3Wo593
         rX+A==
X-Forwarded-Encrypted: i=1; AJvYcCXa4wcZwW1OpZP1keEfPH3Sw4mskHBBwkxmAC8EQAlL9jKB0pSLqBv+F08iBGgO+JGqvOLenwLMeTJfEnDL5bcKjP1mhAkKn5BSBUqhnAs=
X-Gm-Message-State: AOJu0Yy35mqKTFScSjJvcIWYyUajQ8m6NiGluBuWReIdq0BnGDkqOf3h
	axwO8jSr7gKoa4m9n0O+pTbd0Ni6EY8ENZE8eFTBSi43q3vvug9h
X-Google-Smtp-Source: AGHT+IH4P2cPJCVu4DkqJq8nZfDvI5X7dfezYxuMJ0f1uFNOJ69CKieHIMm5kTRDp/HgpiDieHpnvg==
X-Received: by 2002:a17:907:c085:b0:a72:7f22:5f9e with SMTP id a640c23a62f3a-a727f84870bmr389640366b.57.1719482290636;
        Thu, 27 Jun 2024 02:58:10 -0700 (PDT)
Message-ID: <f4f3a1550b4809a3cb8b27eb5e7248abf27b3944.camel@gmail.com>
Subject: Re: [PATCH v13 02/10] xen/riscv: introduce bitops.h
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 27 Jun 2024 11:58:09 +0200
In-Reply-To: <e2d82c37-da44-4a8f-a1f8-76d5ff05b104@suse.com>
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
	 <0e4441eee82b0545e59099e2f62e3a01fa198d08.1719319093.git.oleksii.kurochko@gmail.com>
	 <bb103587-546d-4613-bcb8-df10f5d05388@suse.com>
	 <4c15dd072f08b1161d170608a096dc0851ced588.camel@gmail.com>
	 <e2d82c37-da44-4a8f-a1f8-76d5ff05b104@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

T24gVGh1LCAyMDI0LTA2LTI3IGF0IDA5OjU5ICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAyNi4wNi4yMDI0IDE5OjI3LCBvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbcKgd3JvdGU6Cj4g
PiBPbiBXZWQsIDIwMjQtMDYtMjYgYXQgMTA6MzEgKzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+
ID4gPiBPbiAyNS4wNi4yMDI0IDE1OjUxLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gPiA+
IC0tLSAvZGV2L251bGwKPiA+ID4gPiArKysgYi94ZW4vYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9i
aXRvcHMuaAo+ID4gPiA+IEBAIC0wLDAgKzEsMTM3IEBACj4gPiA+ID4gKy8qIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCj4gPiA+ID4gKy8qIENvcHlyaWdodCAoQykgMjAxMiBS
ZWdlbnRzIG9mIHRoZSBVbml2ZXJzaXR5IG9mIENhbGlmb3JuaWEKPiA+ID4gPiAqLwo+ID4gPiA+
ICsKPiA+ID4gPiArI2lmbmRlZiBfQVNNX1JJU0NWX0JJVE9QU19ICj4gPiA+ID4gKyNkZWZpbmUg
X0FTTV9SSVNDVl9CSVRPUFNfSAo+ID4gPiA+ICsKPiA+ID4gPiArI2luY2x1ZGUgPGFzbS9zeXN0
ZW0uaD4KPiA+ID4gPiArCj4gPiA+ID4gKyNpZiBCSVRPUF9CSVRTX1BFUl9XT1JEID09IDY0Cj4g
PiA+ID4gKyNkZWZpbmUgX19BTU8ob3ApwqDCoCAiYW1vIiAjb3AgIi5kIgo+ID4gPiA+ICsjZWxp
ZiBCSVRPUF9CSVRTX1BFUl9XT1JEID09IDMyCj4gPiA+ID4gKyNkZWZpbmUgX19BTU8ob3ApwqDC
oCAiYW1vIiAjb3AgIi53Igo+ID4gPiA+ICsjZWxzZQo+ID4gPiA+ICsjZXJyb3IgIlVuZXhwZWN0
ZWQgQklUT1BfQklUU19QRVJfV09SRCIKPiA+ID4gPiArI2VuZGlmCj4gPiA+ID4gKwo+ID4gPiA+
ICsvKiBCYXNlZCBvbiBsaW51eC9hcmNoL2luY2x1ZGUvYXNtL2JpdG9wcy5oICovCj4gPiA+ID4g
Kwo+ID4gPiA+ICsvKgo+ID4gPiA+ICsgKiBOb24tYXRvbWljIGJpdCBtYW5pcHVsYXRpb24uCj4g
PiA+ID4gKyAqCj4gPiA+ID4gKyAqIEltcGxlbWVudGVkIHVzaW5nIGF0b21pY3MgdG8gYmUgaW50
ZXJydXB0IHNhZmUuIENvdWxkCj4gPiA+ID4gYWx0ZXJuYXRpdmVseQo+ID4gPiA+ICsgKiBpbXBs
ZW1lbnQgd2l0aCBsb2NhbCBpbnRlcnJ1cHQgbWFza2luZy4KPiA+ID4gPiArICovCj4gPiA+ID4g
KyNkZWZpbmUgX19zZXRfYml0KG4sIHApwqDCoMKgwqDCoCBzZXRfYml0KG4sIHApCj4gPiA+ID4g
KyNkZWZpbmUgX19jbGVhcl9iaXQobiwgcCnCoMKgwqAgY2xlYXJfYml0KG4sIHApCj4gPiA+ID4g
Kwo+ID4gPiA+ICsjZGVmaW5lIHRlc3RfYW5kX29wX2JpdF9vcmQob3AsIG1vZCwgbnIsIGFkZHIs
IG9yZCnCoMKgwqDCoCBcCj4gPiA+ID4gKyh7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiA+ID4gK8KgwqDCoCBiaXRvcF91aW50X3QgcmVzLCBt
YXNrO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFwKPiA+ID4gPiArwqDCoMKgIG1hc2sgPSBCSVRPUF9NQVNLKG5yKTvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ID4gPiAr
wqDCoMKgIGFzbSB2b2xhdGlsZSAowqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gPiA+ICvCoMKgwqDC
oMKgwqDCoCBfX0FNTyhvcCkgI29yZCAiICUwLCAlMiwgJTEiwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCA6ICI9ciIgKHJlcyks
ICIrQSIgKGFkZHJbQklUT1BfV09SRChucildKcKgwqDCoMKgwqDCoCBcCj4gPiA+ID4gK8KgwqDC
oMKgwqDCoMKgIDogInIiIChtb2QobWFzaykpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAg
OiAibWVtb3J5Iik7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiA+ID4gK8KgwqDCoCAoKHJlcyAmIG1hc2sp
ICE9IDApO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFwKPiA+ID4gPiArfSkKPiA+ID4gPiArCj4gPiA+ID4gKyNkZWZpbmUgb3Bf
Yml0X29yZChvcCwgbW9kLCBuciwgYWRkciwgb3JkKcKgwqDCoMKgwqAgXAo+ID4gPiA+ICvCoMKg
wqAgYXNtIHZvbGF0aWxlICjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAgX19BTU8ob3ApICNv
cmQgIiB6ZXJvLCAlMSwgJTAiwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ID4gPiArwqDCoMKgwqDC
oMKgwqAgOiAiK0EiIChhZGRyW0JJVE9QX1dPUkQobnIpXSnCoMKgwqDCoMKgwqDCoMKgwqDCoCBc
Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgIDogInIiIChtb2QoQklUT1BfTUFTSyhucikpKcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgIDogIm1lbW9yeSIp
Owo+ID4gPiA+ICsKPiA+ID4gPiArI2RlZmluZSB0ZXN0X2FuZF9vcF9iaXQob3AsIG1vZCwgbnIs
IGFkZHIpwqDCoMKgIFwKPiA+ID4gPiArwqDCoMKgIHRlc3RfYW5kX29wX2JpdF9vcmQob3AsIG1v
ZCwgbnIsIGFkZHIsIC5hcXJsKQo+ID4gPiA+ICsjZGVmaW5lIG9wX2JpdChvcCwgbW9kLCBuciwg
YWRkcikgXAo+ID4gPiA+ICvCoMKgwqAgb3BfYml0X29yZChvcCwgbW9kLCBuciwgYWRkciwgKQo+
ID4gPiA+ICsKPiA+ID4gPiArLyogQml0bWFzayBtb2RpZmllcnMgKi8KPiA+ID4gPiArI2RlZmlu
ZSBOT1AoeCnCoMKgwqAgKHgpCj4gPiA+ID4gKyNkZWZpbmUgTk9UKHgpwqDCoMKgICh+KHgpKQo+
ID4gPiAKPiA+ID4gU2luY2UgZWxzZXdoZXJlIHlvdSBzYWlkIHdlIHdvdWxkIHVzZSBaYmIgaW4g
Yml0b3BzLCBJIHdhbnRlZCB0bwo+ID4gPiBjb21lCj4gPiA+IGJhY2sKPiA+ID4gb24gdGhhdDog
VXAgdG8gaGVyZSBhbGwgd2UgdXNlIGlzIEFNTy4KPiA+ID4gCj4gPiA+IEFuZCBmdXJ0aGVyIGRv
d24gdGhlcmUncyBubyBhc20oKSBhbnltb3JlLiBXaGF0IHdlcmUgeW91Cj4gPiA+IHJlZmVycmlu
Zwo+ID4gPiB0bz8KPiA+IFJJU0MtViBkb2Vzbid0IGhhdmUgYSBDTFogaW5zdHJ1Y3Rpb24gaW4g
dGhlIGJhc2UKPiA+IElTQS7CoCBBcyBhIGNvbnNlcXVlbmNlLCBfX2J1aWx0aW5fZmZzKCkgZW1p
dHMgYSBsaWJyYXJ5IGNhbGwgdG8KPiA+IGZmcygpCj4gPiBvbiBHQ0MsCj4gCj4gT2gsIHNvIHdl
J2QgbmVlZCB0byBpbXBsZW1lbnQgdGhhdCBsaWJnY2MgZnVuY3Rpb24sIGFsb25nIHRoZSBsaW5l
cwo+IG9mCj4gQXJtMzIgaW1wbGVtZW50aW5nIHF1aXRlIGEgZmV3IG9mIHRoZW0gdG8gc3VwcG9y
dCBzaGlmdHMgb24gNjQtYml0Cj4gcXVhbnRpdGllcyBhcyB3ZWxsIGFzIGRpdmlzaW9uIGFuZCBt
b2R1bG8uCldoeSB3ZSBjYW4ndCBqdXN0IGxpdmUgd2l0aCBaYmIgZXh0ZW5zaW9uPyBaYmIgZXh0
ZW5zaW9uIGlzIHByZXNlbnRlZApvbiBldmVyeSBwbGF0Zm9ybSBJIGhhdmUgaW4gYWNjZXNzIHdp
dGggaHlwZXJ2aXNvciBleHRlbnNpb24gc3VwcG9ydC4KCn4gT2xla3NpaQoKPiAKPiBKYW4KPiAK
PiA+IG9yIGEgZGUgQnJ1aWpuIHNlcXVlbmNlIG9uIENsYW5nLgo+ID4gCj4gPiBUaGUgb3B0aW9u
YWwgWmJiIGV4dGVuc2lvbiBhZGRzIGEgQ0xaIGluc3RydWN0aW9uLCBhZnRlciB3aGljaAo+ID4g
X19idWlsdGluX2ZmcygpIGVtaXRzIGEgdmVyeSBzaW1wbGUgc2VxdWVuY2UuCj4gPiAKPiA+IH4g
T2xla3NpaQo+IAoK



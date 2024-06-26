Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5579C918A15
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 19:28:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749384.1157457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMWQP-0006dO-Vq; Wed, 26 Jun 2024 17:27:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749384.1157457; Wed, 26 Jun 2024 17:27:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMWQP-0006au-T3; Wed, 26 Jun 2024 17:27:17 +0000
Received: by outflank-mailman (input) for mailman id 749384;
 Wed, 26 Jun 2024 17:27:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=evFT=N4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sMWQO-0006ao-RG
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 17:27:16 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54da9bb3-33e1-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 19:27:15 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a725ea1a385so415124666b.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 10:27:15 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72691fe146sm206193566b.1.2024.06.26.10.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 10:27:14 -0700 (PDT)
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
X-Inumbo-ID: 54da9bb3-33e1-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719422835; x=1720027635; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b/mYrX+LFwO1keoNlHptLRaX3DfMNiwUnW9cpuZv18E=;
        b=FGR4/JT5jMj67Qkkuc7QkLwDQzkhaAz8Y4KcJjJqWSUvDFFnMKsTMEphuSIr7IMlyX
         Qgx02taVvgZ2ZEbhU+xNydxpfC37gHwfiqfDuy0PIF6hpjK1JwXTuD1c2lyMBmr4APLI
         m9xX6UryeY88Hn3tNtItm9NAnOQcNlJuqrXCnn9aK0HZQh6UQgXZpxcBUDJzXeDOktCm
         rz7oSgRwY9f2CcDjeCIL+0Cg1+LWKk2qRdYcnwOzqEuU/q3UsYpBPZD64EBemqAql5Sp
         EbU5UmswwTiZKXJMfNsUnKQTeVrUCpYkPfpta/0YXiKTGekC79nEt7RMQM6G4eodPYOU
         FTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719422835; x=1720027635;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b/mYrX+LFwO1keoNlHptLRaX3DfMNiwUnW9cpuZv18E=;
        b=B3qvhbEiwnWEKZJgb41dnHpxOfxuktN9npYv27Em9jh4nra/AtCHjO3YShQxtff/CI
         wj8joYCZygnLZqG0Rd+cArRIWOMBiakfXqz3r7JTp8XZy76zpZd+K7ArZ1p43jI7D6i4
         4+gjGJkv4+4IeOH8m99PDWhB8o2tD4ebIS/uagTvbpWQ/RGQ12EU2Mo3AbMqkc9t+WUY
         XSQaXDUF4toFC3dpqQJH3Ke5+jKG3DqwYiJI1PkXnrqmy0RgwUaY3tFPdxl/OW4NWnC/
         o6FRWnck7O5ZIrQNGAMYN2rEWMe7DugEdDXlJXbsCIBVxV5hCVcRzzuitGNfbVfsgJ6S
         HsJg==
X-Forwarded-Encrypted: i=1; AJvYcCVMLSVIdtSGqbDmZKHp5yVv9p3NYJSkcoXNS3Np+IJOLovHjqMwqONSlIGXQrF+wAACI2j/czQtsQHK40IyF+BiWL4i74Fc5oSiBH91Du0=
X-Gm-Message-State: AOJu0Yy9fOcJc4t80vBR2jfeDchKmB46ODdDZAlwzhkbihqOuHk9Lm4Y
	TvyNHg3MdeAknd9J9QzZSvL5FtoSOJrVrUvdNMcZSQaPMU9ViX32
X-Google-Smtp-Source: AGHT+IGt6CndDs9e1g8CTUJHx82owA1R8dmFIDmiL7Em/qdN6STADDcXmRSRq0wrUYEYO/y0SGtDZg==
X-Received: by 2002:a17:907:a605:b0:a72:4bf2:e1a with SMTP id a640c23a62f3a-a724bf20e88mr741997466b.20.1719422834958;
        Wed, 26 Jun 2024 10:27:14 -0700 (PDT)
Message-ID: <4c15dd072f08b1161d170608a096dc0851ced588.camel@gmail.com>
Subject: Re: [PATCH v13 02/10] xen/riscv: introduce bitops.h
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 26 Jun 2024 19:27:13 +0200
In-Reply-To: <bb103587-546d-4613-bcb8-df10f5d05388@suse.com>
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
	 <0e4441eee82b0545e59099e2f62e3a01fa198d08.1719319093.git.oleksii.kurochko@gmail.com>
	 <bb103587-546d-4613-bcb8-df10f5d05388@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

T24gV2VkLCAyMDI0LTA2LTI2IGF0IDEwOjMxICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAyNS4wNi4yMDI0IDE1OjUxLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gLS0tIC9kZXYv
bnVsbAo+ID4gKysrIGIveGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYml0b3BzLmgKPiA+IEBA
IC0wLDAgKzEsMTM3IEBACj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAg
Ki8KPiA+ICsvKiBDb3B5cmlnaHQgKEMpIDIwMTIgUmVnZW50cyBvZiB0aGUgVW5pdmVyc2l0eSBv
ZiBDYWxpZm9ybmlhICovCj4gPiArCj4gPiArI2lmbmRlZiBfQVNNX1JJU0NWX0JJVE9QU19ICj4g
PiArI2RlZmluZSBfQVNNX1JJU0NWX0JJVE9QU19ICj4gPiArCj4gPiArI2luY2x1ZGUgPGFzbS9z
eXN0ZW0uaD4KPiA+ICsKPiA+ICsjaWYgQklUT1BfQklUU19QRVJfV09SRCA9PSA2NAo+ID4gKyNk
ZWZpbmUgX19BTU8ob3ApwqDCoCAiYW1vIiAjb3AgIi5kIgo+ID4gKyNlbGlmIEJJVE9QX0JJVFNf
UEVSX1dPUkQgPT0gMzIKPiA+ICsjZGVmaW5lIF9fQU1PKG9wKcKgwqAgImFtbyIgI29wICIudyIK
PiA+ICsjZWxzZQo+ID4gKyNlcnJvciAiVW5leHBlY3RlZCBCSVRPUF9CSVRTX1BFUl9XT1JEIgo+
ID4gKyNlbmRpZgo+ID4gKwo+ID4gKy8qIEJhc2VkIG9uIGxpbnV4L2FyY2gvaW5jbHVkZS9hc20v
Yml0b3BzLmggKi8KPiA+ICsKPiA+ICsvKgo+ID4gKyAqIE5vbi1hdG9taWMgYml0IG1hbmlwdWxh
dGlvbi4KPiA+ICsgKgo+ID4gKyAqIEltcGxlbWVudGVkIHVzaW5nIGF0b21pY3MgdG8gYmUgaW50
ZXJydXB0IHNhZmUuIENvdWxkCj4gPiBhbHRlcm5hdGl2ZWx5Cj4gPiArICogaW1wbGVtZW50IHdp
dGggbG9jYWwgaW50ZXJydXB0IG1hc2tpbmcuCj4gPiArICovCj4gPiArI2RlZmluZSBfX3NldF9i
aXQobiwgcCnCoMKgwqDCoMKgIHNldF9iaXQobiwgcCkKPiA+ICsjZGVmaW5lIF9fY2xlYXJfYml0
KG4sIHApwqDCoMKgIGNsZWFyX2JpdChuLCBwKQo+ID4gKwo+ID4gKyNkZWZpbmUgdGVzdF9hbmRf
b3BfYml0X29yZChvcCwgbW9kLCBuciwgYWRkciwgb3JkKcKgwqDCoMKgIFwKPiA+ICsoe8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDC
oCBiaXRvcF91aW50X3QgcmVzLCBtYXNrO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKgwqAgbWFzayA9IEJJVE9QX01BU0so
bnIpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgXAo+ID4gK8KgwqDCoCBhc20gdm9sYXRpbGUgKMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+
ICvCoMKgwqDCoMKgwqDCoCBfX0FNTyhvcCkgI29yZCAiICUwLCAlMiwgJTEiwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoMKgwqDCoMKgIDogIj1yIiAo
cmVzKSwgIitBIiAoYWRkcltCSVRPUF9XT1JEKG5yKV0pwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKg
wqDCoMKgwqDCoCA6ICJyIiAobW9kKG1hc2spKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArwqDCoMKgwqDCoMKgwqAgOiAi
bWVtb3J5Iik7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArwqDCoMKgICgocmVzICYgbWFzaykgIT0gMCk7
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgXAo+ID4gK30pCj4gPiArCj4gPiArI2RlZmluZSBvcF9iaXRfb3JkKG9wLCBtb2QsIG5y
LCBhZGRyLCBvcmQpwqDCoMKgwqDCoCBcCj4gPiArwqDCoMKgIGFzbSB2b2xhdGlsZSAowqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4g
PiArwqDCoMKgwqDCoMKgwqAgX19BTU8ob3ApICNvcmQgIiB6ZXJvLCAlMSwgJTAiwqDCoMKgwqDC
oMKgwqDCoMKgIFwKPiA+ICvCoMKgwqDCoMKgwqDCoCA6ICIrQSIgKGFkZHJbQklUT1BfV09SRChu
cildKcKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKgwqDCoMKgwqDCoCA6ICJyIiAobW9k
KEJJVE9QX01BU0sobnIpKSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoMKg
wqDCoMKgIDogIm1lbW9yeSIpOwo+ID4gKwo+ID4gKyNkZWZpbmUgdGVzdF9hbmRfb3BfYml0KG9w
LCBtb2QsIG5yLCBhZGRyKcKgwqDCoCBcCj4gPiArwqDCoMKgIHRlc3RfYW5kX29wX2JpdF9vcmQo
b3AsIG1vZCwgbnIsIGFkZHIsIC5hcXJsKQo+ID4gKyNkZWZpbmUgb3BfYml0KG9wLCBtb2QsIG5y
LCBhZGRyKSBcCj4gPiArwqDCoMKgIG9wX2JpdF9vcmQob3AsIG1vZCwgbnIsIGFkZHIsICkKPiA+
ICsKPiA+ICsvKiBCaXRtYXNrIG1vZGlmaWVycyAqLwo+ID4gKyNkZWZpbmUgTk9QKHgpwqDCoMKg
ICh4KQo+ID4gKyNkZWZpbmUgTk9UKHgpwqDCoMKgICh+KHgpKQo+IAo+IFNpbmNlIGVsc2V3aGVy
ZSB5b3Ugc2FpZCB3ZSB3b3VsZCB1c2UgWmJiIGluIGJpdG9wcywgSSB3YW50ZWQgdG8gY29tZQo+
IGJhY2sKPiBvbiB0aGF0OiBVcCB0byBoZXJlIGFsbCB3ZSB1c2UgaXMgQU1PLgo+IAo+IEFuZCBm
dXJ0aGVyIGRvd24gdGhlcmUncyBubyBhc20oKSBhbnltb3JlLiBXaGF0IHdlcmUgeW91IHJlZmVy
cmluZwo+IHRvPwpSSVNDLVYgZG9lc24ndCBoYXZlIGEgQ0xaIGluc3RydWN0aW9uIGluIHRoZSBi
YXNlCklTQS4gIEFzIGEgY29uc2VxdWVuY2UsIF9fYnVpbHRpbl9mZnMoKSBlbWl0cyBhIGxpYnJh
cnkgY2FsbCB0byBmZnMoKQpvbiBHQ0MsIG9yIGEgZGUgQnJ1aWpuIHNlcXVlbmNlIG9uIENsYW5n
LgoKVGhlIG9wdGlvbmFsIFpiYiBleHRlbnNpb24gYWRkcyBhIENMWiBpbnN0cnVjdGlvbiwgYWZ0
ZXIgd2hpY2gKX19idWlsdGluX2ZmcygpIGVtaXRzIGEgdmVyeSBzaW1wbGUgc2VxdWVuY2UuCgp+
IE9sZWtzaWkK



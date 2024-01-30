Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDC0842755
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 15:58:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673527.1047865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpYa-0007V0-21; Tue, 30 Jan 2024 14:57:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673527.1047865; Tue, 30 Jan 2024 14:57:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpYZ-0007SU-UR; Tue, 30 Jan 2024 14:57:47 +0000
Received: by outflank-mailman (input) for mailman id 673527;
 Tue, 30 Jan 2024 14:57:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xawb=JI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rUpYY-0007FH-Kq
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 14:57:46 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed64b76e-bf7f-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 15:57:46 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a3122b70439so547765466b.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 06:57:46 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 cu2-20020a170906ba8200b00a35757cbd9esm3331613ejd.4.2024.01.30.06.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 06:57:45 -0800 (PST)
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
X-Inumbo-ID: ed64b76e-bf7f-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706626665; x=1707231465; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3/7JW6L2cOCYfZhizXaaaEuBXeXUt8b1aV6vYrwFjG0=;
        b=cNo2fvxQllZQolyjI21l9rkbCWz4genWxuG5YS/jmvDd0OoyElPDnP+IoX/FScaZLd
         U4XUHL8Ff//irwkyN9aDHe4IeGrZhtw6SaXHjF7tmsah6Q+kXjxcS7/71CnXP7POg0yY
         Gfd5F0dzpOkWJ4DdMUmP8+k30IVtSCdAeYlqqHtE8HhsZ3+mLPzwqdZUNfp1vMAQKqH0
         Hgz6d8TBxgrElehZYn0Tpszy6DZtUsQzWQEVA52IO5SJXGDquhEziM+yV5zNJp5ENCyj
         e698AUT92FZT+Lw3wUNwML5acppmjLVrDykgfZr3hibXKCeaHs0rjRy7MZhEVRQRWn0E
         apZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706626665; x=1707231465;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3/7JW6L2cOCYfZhizXaaaEuBXeXUt8b1aV6vYrwFjG0=;
        b=GD5zxXGoPwCEaPW8ToPCaSVLcH0uFKcanXFMowfToudWmV0EdM84v6Gpjj2o/HNO0Z
         sA3yj7OLMuGKnmH+fjew1QcwaO3mgSQxpMUkoFn81Nm81hRb7J0GYIYXlB5Japse98Py
         EOejbW8z+sU/ORAFAGhyU9Sf/J3E+1n+EZWB/wZgGITr1O4HdUFQhVwaD+DtS5q3Gy/c
         Chxvrhe02q8zLqW+itJZlELAQ98ZjWJdV73FyRYzuEsjyVpMEgKJsqdPqEkDzh0x6Wl2
         EkohRKqbxLp9gR23/PmtxpmWFp9tS9V8JgKgua7Bi35wy1VmOwlvgdvbKC9IC9iIYTtY
         RxPw==
X-Gm-Message-State: AOJu0YxfGrO+TbYmzA2iSYYv+ZJMSae2n+JwwSJVuQrxR+J3mRTMUp8K
	vtukpqIC1sz/gj0WE4S53CNNKwERnlH9TX+PGDnXua0EMZATopgc
X-Google-Smtp-Source: AGHT+IGlEO7X+RDZJa4IXzxoTTBftIvievzZTEAax6QUoq2b02G1gOm0CrtRj31sxQqiAURnCQ+SPw==
X-Received: by 2002:a17:906:3642:b0:a31:2119:90d7 with SMTP id r2-20020a170906364200b00a31211990d7mr7395736ejb.38.1706626665364;
        Tue, 30 Jan 2024 06:57:45 -0800 (PST)
Message-ID: <848bcb2d7e5357ca6d3672bef52ac57c5b1f7f95.camel@gmail.com>
Subject: Re: [PATCH v3 13/34] xen/riscv: introduce cmpxchg.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 30 Jan 2024 16:57:43 +0200
In-Reply-To: <8ee35a76-f3ef-4143-93ef-8e6089f82a80@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <214bfd61c8ccf2a5b2c640b815ebfa6a705f6234.1703255175.git.oleksii.kurochko@gmail.com>
	 <8ee35a76-f3ef-4143-93ef-8e6089f82a80@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

T24gTW9uLCAyMDI0LTAxLTIyIGF0IDE3OjI3ICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+
ICsjZGVmaW5lIF9feGNoZ19hY3F1aXJlKHB0ciwgbmV3LCBzaXplKSBcCj4gPiArKHsgXAo+ID4g
K8KgwqDCoCBfX3R5cGVvZl9fKHB0cikgcHRyX18gPSAocHRyKTsgXAo+ID4gK8KgwqDCoCBfX3R5
cGVvZl9fKG5ldykgbmV3X18gPSAobmV3KTsgXAo+ID4gK8KgwqDCoCBfX3R5cGVvZl9fKCoocHRy
KSkgcmV0X187IFwKPiA+ICvCoMKgwqAgc3dpdGNoIChzaXplKSBcCj4gPiArCXsgXAo+ID4gK8Kg
wqDCoCBjYXNlIDQ6IFwKPiA+ICvCoMKgwqDCoMKgwqDCoCBhc20gdm9sYXRpbGUoIFwKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICIJYW1vc3dhcC53ICUwLCAlMiwgJTFcbiIgXAo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgUklTQ1ZfQUNRVUlSRV9CQVJSSUVSIFwKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIDogIj1yIiAocmV0X18pLCAiK0EiICgqcHRyX18pIFwKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDogInIiIChuZXdfXykgXAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgOiAibWVtb3J5IiApOyBcCj4gPiArwqDCoMKgwqDCoMKgwqAgYnJlYWs7IFwKPiA+ICvC
oMKgwqAgY2FzZSA4OiBcCj4gPiArwqDCoMKgwqDCoMKgwqAgYXNtIHZvbGF0aWxlKCBcCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiCWFtb3N3YXAuZCAlMCwgJTIsICUxXG4iIFwKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFJJU0NWX0FDUVVJUkVfQkFSUklFUiBcCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCA6ICI9ciIgKHJldF9fKSwgIitBIiAoKnB0cl9fKSBcCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCA6ICJyIiAobmV3X18pIFwKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDogIm1lbW9yeSIgKTsgXAo+ID4gK8KgwqDCoMKgwqDCoMKgIGJyZWFrOyBcCj4gPiAr
wqDCoMKgIGRlZmF1bHQ6IFwKPiA+ICvCoMKgwqDCoMKgwqDCoCBBU1NFUlRfVU5SRUFDSEFCTEUo
KTsgXAo+ID4gK8KgwqDCoCB9IFwKPiA+ICvCoMKgwqAgcmV0X187IFwKPiA+ICt9KQo+IAo+IElm
IEknbSBub3QgbWlzdGFrZW4gdGhpcyBkaWZmZXJzIGZyb20gX194Y2hnX3JlbGF4ZWQoKSBvbmx5
IGluIHRoZQo+IHVzZQo+IG9mIFJJU0NWX0FDUVVJUkVfQkFSUklFUiwgYW5kIC4uLgo+IAo+ID4g
KyNkZWZpbmUgeGNoZ19hY3F1aXJlKHB0ciwgeCkgXAo+ID4gKyh7IFwKPiA+ICvCoMKgwqAgX190
eXBlb2ZfXygqKHB0cikpIHhfID0gKHgpOyBcCj4gPiArwqDCoMKgIChfX3R5cGVvZl9fKCoocHRy
KSkpIF9feGNoZ19hY3F1aXJlKChwdHIpLCB4XywKPiA+IHNpemVvZigqKHB0cikpKTsgXAo+ID4g
K30pCj4gPiArCj4gPiArI2RlZmluZSBfX3hjaGdfcmVsZWFzZShwdHIsIG5ldywgc2l6ZSkgXAo+
ID4gKyh7IFwKPiA+ICvCoMKgwqAgX190eXBlb2ZfXyhwdHIpIHB0cl9fID0gKHB0cik7IFwKPiA+
ICvCoMKgwqAgX190eXBlb2ZfXyhuZXcpIG5ld19fID0gKG5ldyk7IFwKPiA+ICvCoMKgwqAgX190
eXBlb2ZfXygqKHB0cikpIHJldF9fOyBcCj4gPiArwqDCoMKgIHN3aXRjaCAoc2l6ZSkgXAo+ID4g
Kwl7IFwKPiA+ICvCoMKgwqAgY2FzZSA0OiBcCj4gPiArwqDCoMKgwqDCoMKgwqAgYXNtIHZvbGF0
aWxlICggXAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUklTQ1ZfUkVMRUFTRV9CQVJSSUVS
IFwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICIJYW1vc3dhcC53ICUwLCAlMiwgJTFcbiIg
XAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOiAiPXIiIChyZXRfXyksICIrQSIgKCpwdHJf
XykgXAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOiAiciIgKG5ld19fKSBcCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCA6ICJtZW1vcnkiKTsgXAo+ID4gK8KgwqDCoMKgwqDCoMKgIGJy
ZWFrOyBcCj4gPiArwqDCoMKgIGNhc2UgODogXAo+ID4gK8KgwqDCoMKgwqDCoMKgIGFzbSB2b2xh
dGlsZSAoIFwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFJJU0NWX1JFTEVBU0VfQkFSUklF
UiBcCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiCWFtb3N3YXAuZCAlMCwgJTIsICUxXG4i
IFwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDogIj1yIiAocmV0X18pLCAiK0EiICgqcHRy
X18pIFwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDogInIiIChuZXdfXykgXAo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgOiAibWVtb3J5Iik7IFwKPiA+ICvCoMKgwqDCoMKgwqDCoCBi
cmVhazsgXAo+ID4gK8KgwqDCoCBkZWZhdWx0OiBcCj4gPiArwqDCoMKgwqDCoMKgwqAgQVNTRVJU
X1VOUkVBQ0hBQkxFKCk7IFwKPiA+ICvCoMKgwqAgfSBcCj4gPiArwqDCoMKgIHJldF9fOyBcCj4g
PiArfSkKPiAKPiB0aGlzIG9ubHkgaW4gdGhlIHVzZSBvZiBSSVNDVl9SRUxFQVNFX0JBUlJJRVIu
IElmIHNvIHRoZXkgbGlrZWx5IHdhbnQKPiBmb2xkaW5nLCB0byBsaW1pdCByZWR1bmRhbmN5IGFu
ZCBtYWtlIGV2ZW50dWFsIHVwZGF0aW5nIGVhc2llci4gKFNhbWUKPiBmb3IgdGhlIGNtcHhjaGcg
aGVscGVyIGZ1cnRoZXIgZG93biwgYXMgaXQgc2VlbXMuKQpBbHNvIHRoZSBkaWZmZXJlbmNlIGlz
IGluIHdoZXJlIHRvIHBsYWNlIGJhcnJpZXIgYmVmb3JlIG9yIGFmdGVyIGF0b21pYwppbnN0cnVj
dGlvbi4gSSBhbSBub3Qgc3VyZSB0aGF0IHdlIGNhbiBlYXNpbHkgZm9sZGVkIHRoaXMgbWFjcm9z
LgoKfiBPbGVrc2lpCg==



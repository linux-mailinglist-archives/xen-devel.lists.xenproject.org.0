Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 432AC13C47A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 14:59:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irjA6-00076G-5B; Wed, 15 Jan 2020 13:56:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t5IT=3E=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1irjA4-00076B-EC
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 13:56:44 +0000
X-Inumbo-ID: d7a84384-379e-11ea-b89f-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7a84384-379e-11ea-b89f-bc764e2007e4;
 Wed, 15 Jan 2020 13:56:35 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c14so15830841wrn.7
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2020 05:56:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UVc+vS25sl77DRieZ7fqDsmqFprVJrI4fDKBKV1QbSs=;
 b=O1fCXegC4IxSwSDKurobkFViN+IFM9FmbipQskGvCXHe7lvoxyDmjQIcfh7ALfjf7I
 mOCVOuVKfUNnW/ssbtxS7UPhkYir58QZcvqx9E7lJC9FHaLpH+j6OSgOT105WprknzGE
 cUGOoLKntA+e4C6uXqy2XF1hcwX8i4uaB44WTfaSb26vJ51P0LRdseY1+iC4qQt1sRmP
 2yI7xsIYZVHPKIxMm+1IAUnqJpOk10gHdswd6KZbMJKWVJoLMhjfA9qPEeYYTNPVTUWE
 5kuAJDhrhPyE97Kd+kAAlUpj6FW/EAhL0gXgi6cudPTLwKNPF5oU9MncTAM76joZELs5
 qdGQ==
X-Gm-Message-State: APjAAAUE8htwLbZ4vkyFMjiACiQneCH9CzeLbB8A/fvqyZ5qjIZZhd+C
 vxaVUaOqGhBCYWbtkE8/VbQ=
X-Google-Smtp-Source: APXvYqyXYe4s0+Dcy7oHJR4GBgwa+hNOEdtdbuIIeeHe/ERVxkCyU9BEoy570XvbPj01KdjYPiKSMQ==
X-Received: by 2002:adf:df90:: with SMTP id z16mr33198153wrl.273.1579096594676; 
 Wed, 15 Jan 2020 05:56:34 -0800 (PST)
Received: from debian (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id r6sm25367610wrq.92.2020.01.15.05.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 05:56:33 -0800 (PST)
Date: Wed, 15 Jan 2020 13:56:31 +0000
From: Wei Liu <wei.liu@kernel.org>
To: madhuparnabhowmik04@gmail.com
Message-ID: <20200115135631.edr2nrfkycppxcku@debian>
References: <20200115124129.5684-1-madhuparnabhowmik04@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115124129.5684-1-madhuparnabhowmik04@gmail.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] net: xen-netbank: hash.c: Use built-in RCU
 list checking
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
Cc: wei.liu@kernel.org, paulmck@kernel.org, paul@xen.org,
 netdev@vger.kernel.org, frextrite@gmail.com, linux-kernel@vger.kernel.org,
 joel@joelfernandes.org, xen-devel@lists.xenproject.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhhbmtzIGZvciB0aGUgcGF0Y2guCgpUaGVyZSBpcyBhIHR5cG8gaW4gdGhlIHN1YmplY3QgbGlu
ZS4gSXQgc2hvdWxkIHNheSB4ZW4tbmV0YmFjaywgbm90Cnhlbi1uZXRiYW5rLgoKT24gV2VkLCBK
YW4gMTUsIDIwMjAgYXQgMDY6MTE6MjhQTSArMDUzMCwgbWFkaHVwYXJuYWJob3dtaWswNEBnbWFp
bC5jb20gd3JvdGU6Cj4gRnJvbTogTWFkaHVwYXJuYSBCaG93bWlrIDxtYWRodXBhcm5hYmhvd21p
azA0QGdtYWlsLmNvbT4KPiAKPiBsaXN0X2Zvcl9lYWNoX2VudHJ5X3JjdSBoYXMgYnVpbHQtaW4g
UkNVIGFuZCBsb2NrIGNoZWNraW5nLgo+IFBhc3MgY29uZCBhcmd1bWVudCB0byBsaXN0X2Zvcl9l
YWNoX2VudHJ5X3JjdS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYWRodXBhcm5hIEJob3dtaWsgPG1h
ZGh1cGFybmFiaG93bWlrMDRAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL25ldC94ZW4tbmV0
YmFjay9oYXNoLmMgfCA2ICsrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC94ZW4tbmV0YmFj
ay9oYXNoLmMgYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9oYXNoLmMKPiBpbmRleCAxMGQ1ODBj
M2RlYTMuLjMwNzA5YmM5ZDE3MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC94ZW4tbmV0YmFj
ay9oYXNoLmMKPiArKysgYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9oYXNoLmMKPiBAQCAtNTEs
NyArNTEsOCBAQCBzdGF0aWMgdm9pZCB4ZW52aWZfYWRkX2hhc2goc3RydWN0IHhlbnZpZiAqdmlm
LCBjb25zdCB1OCAqdGFnLAo+ICAKPiAgCWZvdW5kID0gZmFsc2U7Cj4gIAlvbGRlc3QgPSBOVUxM
Owo+IC0JbGlzdF9mb3JfZWFjaF9lbnRyeV9yY3UoZW50cnksICZ2aWYtPmhhc2guY2FjaGUubGlz
dCwgbGluaykgewo+ICsJbGlzdF9mb3JfZWFjaF9lbnRyeV9yY3UoZW50cnksICZ2aWYtPmhhc2gu
Y2FjaGUubGlzdCwgbGluaywKPiArCQkJCQkJCWxvY2tkZXBfaXNfaGVsZCgmdmlmLT5oYXNoLmNh
Y2hlLmxvY2spKSB7CgpUaGVyZSBhcmUgcHJvYmFibHkgdG9vIG1hbnkgdGFicyBoZXJlLiBJbmRl
bnRhdGlvbiBsb29rcyB3cm9uZy4KClRoZSBzdXJyb3VuZGluZyBjb2RlIG1ha2VzIGl0IHByZXR0
eSBjbGVhciB0aGF0IHRoZSBsb2NrIGlzIGFscmVhZHkgaGVsZApieSB0aGUgdGltZSBsaXN0X2Zv
cl9lYWNoX2VudHJ5X3JjdSBpcyBjYWxsZWQsIHlldCB0aGUgY2hlY2tpbmcgaW52b2x2ZWQKaW4g
bG9ja2RlcF9pc19oZWxkIGlzIG5vdCB0cml2aWFsLCBzbyBJJ20gYWZyYWlkIEkgZG9uJ3QgY29u
c2lkZXIgdGhpcyBhCnN0cmljdCBpbXByb3ZlbWVudCBvdmVyIHRoZSBleGlzdGluZyBjb2RlLgoK
SWYgdGhlcmUgaXMgc29tZXRoaW5nIEkgbWlzdW5kZXJzdG9vZCwgbGV0IG1lIGtub3cuCgpXZWku
Cgo+ICAJCS8qIE1ha2Ugc3VyZSB3ZSBkb24ndCBhZGQgZHVwbGljYXRlIGVudHJpZXMgKi8KPiAg
CQlpZiAoZW50cnktPmxlbiA9PSBsZW4gJiYKPiAgCQkgICAgbWVtY21wKGVudHJ5LT50YWcsIHRh
ZywgbGVuKSA9PSAwKQo+IEBAIC0xMDIsNyArMTAzLDggQEAgc3RhdGljIHZvaWQgeGVudmlmX2Zs
dXNoX2hhc2goc3RydWN0IHhlbnZpZiAqdmlmKQo+ICAKPiAgCXNwaW5fbG9ja19pcnFzYXZlKCZ2
aWYtPmhhc2guY2FjaGUubG9jaywgZmxhZ3MpOwo+ICAKPiAtCWxpc3RfZm9yX2VhY2hfZW50cnlf
cmN1KGVudHJ5LCAmdmlmLT5oYXNoLmNhY2hlLmxpc3QsIGxpbmspIHsKPiArCWxpc3RfZm9yX2Vh
Y2hfZW50cnlfcmN1KGVudHJ5LCAmdmlmLT5oYXNoLmNhY2hlLmxpc3QsIGxpbmssCj4gKwkJCQkJ
CQlsb2NrZGVwX2lzX2hlbGQoJnZpZi0+aGFzaC5jYWNoZS5sb2NrKSkgewo+ICAJCWxpc3RfZGVs
X3JjdSgmZW50cnktPmxpbmspOwo+ICAJCXZpZi0+aGFzaC5jYWNoZS5jb3VudC0tOwo+ICAJCWtm
cmVlX3JjdShlbnRyeSwgcmN1KTsKPiAtLSAKPiAyLjE3LjEKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

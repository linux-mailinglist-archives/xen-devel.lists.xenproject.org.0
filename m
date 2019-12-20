Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC0C12818A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 18:40:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiMDQ-0000RJ-MA; Fri, 20 Dec 2019 17:37:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ROLc=2K=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1iiMDO-0000RE-RA
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 17:37:26 +0000
X-Inumbo-ID: 62f556ac-234f-11ea-88e7-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62f556ac-234f-11ea-88e7-bc764e2007e4;
 Fri, 20 Dec 2019 17:37:26 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id b19so9737479wmj.4
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2019 09:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BNdRYcgW4rbPVdpa6+Wi8vxRw/X2cE9EYe3swVoJaqI=;
 b=FYYHkW0qWsmImDwU+caTMSoGdqNyVD9UKl2LI8npYZGdKkZ3RPeQpicSXEwjhxiAa7
 d+4Sygm0MVJS6nDIaYd9TLqOpA2333Bnu0riDBfgzx8L5ynqegkGJQIw5GSaoMhiomTD
 tq2JamG9I1zLWxG/esC7gzJ7NtSdNSFqnUMuQCQpTd/dKzI4v/+AVJwnvp2WEeuPwuQT
 TpXahRhVU184JvIb+wDvV1tJCAv5C/pNRnn+wEA13I7RWxsiaxU+t1CEXM898vEOeF0P
 zsdZVYK+85vHg6GdX9kqGV8otUoOasczSqeW0F/Bz4yhA45k0nsCjkmrBnPja79kickj
 tw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BNdRYcgW4rbPVdpa6+Wi8vxRw/X2cE9EYe3swVoJaqI=;
 b=HbC9LLCtifT1S/Yf81yQ0TRarqazDDkfSm7wwWhzGgns1zpyJ+D4/zjZnOosVaqIa3
 3qUhXIfDsHqidZDmB1YGuodAQL72xfL5Efwf6gqujX6mAh3X3CUlcn0AErNy7ebEEGgQ
 byNYtSWDscuVZFD96h/dCsD2GOWIGtxtSwJvqFKftpeNuxf9pXBm39/JtaFehTsy9ryD
 OUqwbUrL2Q1lPG+oKV9muCv2C332EhG0ztL7cnM8U4pIsavFAY+MQquHwVz0Jr6TUb7f
 XOJFGSiapStfv+tJswXn9B95Na8HxKey3Hb7/U14d4sPBM7L0eGUWZClI4RgST0v9W+C
 9lZA==
X-Gm-Message-State: APjAAAXnQs+8qaq8XCPdPQu0NefE6txA04NUlD1dTMhuhANo3DNxv4up
 SQQALVdTXAwHmoN5AyIOE+bM9nZbQGSUn2ZDyow=
X-Google-Smtp-Source: APXvYqyhK1bgEbSKUla9OiUrePNs+aBSOPwfwiFZ9zYNZRaP2BVjJCLeqIl0+vSP989LxP2NzBeBo0MGvhY+PZv8JLQ=
X-Received: by 2002:a1c:640a:: with SMTP id y10mr18140990wmb.14.1576863445295; 
 Fri, 20 Dec 2019 09:37:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <0987641ced136706961cf419eb5ed83d1302357b.1576697796.git.tamas.lengyel@intel.com>
 <ba37b587-6a4a-ecd8-3e2f-400e2755b24d@suse.com>
 <CABfawhmGQz8cAQWv-pkTXTNNXS-ML6wDcCon5ONAUZr_VP8WUA@mail.gmail.com>
 <530c2a0e-c79a-b540-8d6a-9d50e22bff41@citrix.com>
In-Reply-To: <530c2a0e-c79a-b540-8d6a-9d50e22bff41@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 20 Dec 2019 10:36:48 -0700
Message-ID: <CABfawh=Si977UzkWKbYHoYEW+daLFQNLvOF8YvznxmmeM_BDaA@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 01/20] x86: make hvm_{get/set}_param
 accessible
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMjAsIDIwMTkgYXQgMTA6MzIgQU0gQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAyMC8xMi8yMDE5IDE3OjI3LCBUYW1hcyBL
IExlbmd5ZWwgd3JvdGU6Cj4gPiBPbiBGcmksIERlYyAyMCwgMjAxOSBhdCA5OjQ3IEFNIEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPj4gT24gMTguMTIuMjAxOSAyMDo0
MCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4+PiBDdXJyZW50bHkgdGhlIGh2bSBwYXJhbWV0
ZXJzIGFyZSBvbmx5IGFjY2Vzc2libGUgdmlhIHRoZSBIVk1PUCBoeXBlcmNhbGxzLiBCeQo+ID4+
PiBleHBvc2luZyBodm1fe2dldC9zZXR9X3BhcmFtIGl0IHdpbGwgYmUgcG9zc2libGUgZm9yIFZN
IGZvcmtpbmcgdG8gY29weSB0aGUKPiA+Pj4gcGFyYW1ldGVycyBkaXJlY3RseSBpbnRvIHRoZSBj
bG9uZSBkb21haW4uCj4gPj4gSGF2aW5nIHBlZWtlZCBhaGVhZCBhdCBwYXRjaCAxNywgd2hlcmUg
dGhpcyBnZXRzIHVzZWQsIEkgd29uZGVyIHdoeQo+ID4+IHlvdSB3YW50IGEgcGFpciBvZiBvbmUt
Ynktb25lIGZ1bmN0aW9ucywgcmF0aGVyIHRoYW4gYSBjb3B5LWFsbCBvbmUuCj4gPj4gVGhpcyB0
aGVuIHdvdWxkbid0IHJlcXVpcmUgZXhwb3N1cmUgb2YgdGhlIGZ1bmN0aW9ucyB5b3UgdG91Y2gg
aGVyZS4KPiA+IFdlbGwsIHByb3ZpZGVkIHRoZXJlIGlzIG5vIHN1Y2ggZnVuY3Rpb24gaW4gZXhp
c3RlbmNlIHRvZGF5IGl0IHdhcwo+ID4ganVzdCBlYXNpZXIgdG8gdXNlIHdoYXQncyBhbHJlYWR5
IGF2YWlsYWJsZS4gSSBzdGlsbCB3b3VsZG4ndCB3YW50IHRvCj4gPiBpbXBsZW1lbnQgYSBvbmUt
c2hvdCBmdW5jdGlvbiBsaWtlIHRoYXQgYmVjYXVzZSB0aGlzIHNhbWUgY29kZS1wYXRoIGlzCj4g
PiBzaGFyZWQgYnkgdGhlIHNhdmUtcmVzdG9yZSBvcGVyYXRpb25zIG9uIHRoZSB0b29sc3RhY2sg
c2lkZSwgc28gYXQKPiA+IGxlYXN0IEkgaGF2ZSBhIHJlYXNvbmFibGUgYXNzdW1wdGlvbiB0aGF0
IGl0IHdvbid0IGJyZWFrIG9uIG1lIGluIHRoZQo+ID4gZnV0dXJlLgo+Cj4gSW4gcGFydGljdWxh
ciwgYSBudW1iZXIgb2YgdGhlIHNldCBvcGVyYXRpb25zIGFyZSBkaXN0aW5jdGx5Cj4gbm9uLXRy
aXZpYWwuICAoT1RPSCwgdGhvc2UgYXJlIG5vdCBsb25nIGZvciB0aGlzIHdvcmxkLCBhbmQgc2hv
dWxkIGJlCj4gY3JlYXRpb24gWDg2X0VNVV8qIGNvbnN0YW50cyBpbnN0ZWFkKS4KPgoKSSBhY3R1
YWxseSB3YW50ZWQgdG8gYXNrIGFib3V0IHRoYXQuIEluCmh0dHBzOi8veGVuYml0cy54ZW4ub3Jn
L2dpdHdlYi8/cD14ZW4uZ2l0O2E9YmxvYjtmPXRvb2xzL2xpYnhjL3hjX3NyX3NhdmVfeDg2X2h2
bS5jO2g9OTdhOGM0OTgwN2YxOTJjNDcyMDk1MjVmNTFlNGQ3OWE1MGM2NmNlYztoYj1IRUFEI2w2
MQp0aGUgdG9vbHN0YWNrIG9ubHkgc2VsZWN0cyBjZXJ0YWluIEhWTSBwYXJhbXMgdG8gYmUgc2F2
ZWQgKGFuZApyZXN0b3JlZCBsYXRlcikuIEkgb3JpZ2luYWxseSBmb2xsb3dlZCB0aGUgc2FtZSBs
b2dpYyBpbiB0aGUgZm9yawpjb2RlLXBhdGggYnV0IGFmdGVyIGEgbG90IG9mIGV4cGVyaW1lbnRz
IGl0IGxvb2tzIGxpa2UgaXQncyBhY3R1YWxseQpPSyB0byBncmFiIGFsbCBwYXJhbXMgYnV0IG9u
bHkgY2FsbCBzZXRfcGFyYW0gb24gdGhlIG9uZXMgdGhhdCBoYXZlIGEKbm9uLXplcm8gdmFsdWUu
IFNvIHNldHRpbmcgc29tZSBwYXJhbXMgd2l0aCBhIHplcm8gdmFsdWUgaGFzIGNlcnRhaW5seQps
ZWFkIHRvIGNyYXNoZXMsIGJ1dCBvdGhlcndpc2UgaXQgc2VlbXMgdG8gImp1c3Qgd29yayIgdG8g
Y29weSBhbGwgdGhlCnJlc3QuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==

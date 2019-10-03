Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9503DCAB80
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 19:34:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iG4vX-0005lM-S0; Thu, 03 Oct 2019 17:30:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KLgg=X4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iG4vW-0005el-EV
 for xen-devel@lists.xen.org; Thu, 03 Oct 2019 17:30:06 +0000
X-Inumbo-ID: 704016be-e603-11e9-972e-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 704016be-e603-11e9-972e-12813bfff9fa;
 Thu, 03 Oct 2019 17:30:05 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8CE03215EA;
 Thu,  3 Oct 2019 17:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570123804;
 bh=VNfCk4ou2COXiB6AxEAnSn3RZE6M8g95VR9amZFB878=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=0p4/ppm1hMEEieZnThVUa28cJoFoGMgo4X//6r4IkbudQZUd001Si8Hs5qXhvAIyz
 FIm/SdcY2QfbqdiidVIZb9U9syZkGP6XMHWsE/O1KVb74bywZgLUQhAaRrU37/Z10+
 OW+mRtJFQKtSXB3Yp5+RSrJOPt9wnmk6seq9ypGE=
Date: Thu, 3 Oct 2019 10:30:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <fce98dfd-9a8b-e615-3799-ff368d4c6527@arm.com>
Message-ID: <alpine.DEB.2.21.1910031028310.30844@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1910021833180.2691@sstabellini-ThinkPad-T480s>
 <20191003013526.30768-5-sstabellini@kernel.org>
 <fce98dfd-9a8b-e615-3799-ff368d4c6527@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v8 5/8] xen/arm: assign devices to boot
 domains
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 Achin.Gupta@arm.com, xen-devel@lists.xen.org, Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAzIE9jdCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgU3RlZmFubywKPiAK
PiBBIGNvdXBsZSBvZiBjb21tZW50cyBiZWxvdywgbW9zdGx5IGJlY2F1c2UgSSB3YXNuJ3QgY2xl
YXIgZW5vdWdoIG9uIHRoZQo+IHByZXZpb3VzIHZlcnNpb24uIEkgYW0gbm90IHN1cmUgaWYgaXQg
aXMgd29ydGggcmVzZW5kaW5nIHRoZSBzZXJpZXMsIG1heWJlCj4ganVzdCByZXNlbmRpbmcgdGhp
cyBvbmUgd291bGQgYmUgc3VmZmljaWVudD8KPiAKPiBPbiAwMy8xMC8yMDE5IDAyOjM1LCBTdGVm
YW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFp
bl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gPiBpbmRleCA4NGI2NWI4
ZjI1Li5iOTA5MDJhZDk3IDEwMDY0NAo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWls
ZC5jCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiA+IEBAIC0xNzE0LDYg
KzE3MTQsODggQEAgc3RhdGljIGludCBfX2luaXQgbWFrZV92cGwwMTFfdWFydF9ub2RlKHN0cnVj
dAo+ID4ga2VybmVsX2luZm8gKmtpbmZvKQo+ID4gICB9Cj4gPiAgICNlbmRpZgo+ID4gICArLyoK
PiA+ICsgKiBTY2FuIGRldmljZSB0cmVlIHByb3BlcnRpZXMgZm9yIHBhc3N0aHJvdWdoIHNwZWNp
ZmljIGluZm9ybWF0aW9uLgo+ID4gKyAqIFJldHVybnMgPCAwIG9uIGVycm9yCj4gPiArICogICAg
ICAgICAwIG9uIHN1Y2Nlc3MKPiA+ICsgKi8KPiA+ICtzdGF0aWMgaW50IF9faW5pdCBoYW5kbGVf
cGFzc3Rocm91Z2hfcHJvcChzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBmZHRfcHJvcGVy
dHkKPiA+ICp4ZW5fcmVnLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnN0IHN0cnVjdCBmZHRfcHJvcGVydHkKPiA+ICp4ZW5fcGF0aCwKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIHhlbl9mb3JjZSwKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBhZGRy
ZXNzX2NlbGxzLCB1aW50MzJfdAo+ID4gc2l6ZV9jZWxscykKPiA+ICt7Cj4gPiArICAgIGNvbnN0
IF9fYmUzMiAqY2VsbDsKPiA+ICsgICAgdW5zaWduZWQgaW50IGksIGxlbjsKPiA+ICsgICAgc3Ry
dWN0IGR0X2RldmljZV9ub2RlICpub2RlOwo+ID4gKyAgICBpbnQgcmVzOwo+ID4gKyAgICBwYWRk
cl90IG1zdGFydCwgc2l6ZSwgZ3N0YXJ0Owo+ID4gKwo+ID4gKyAgICAvKiB4ZW4scmVnIHNwZWNp
ZmllcyB3aGVyZSB0byBtYXAgdGhlIE1NSU8gcmVnaW9uICovCj4gPiArICAgIGNlbGwgPSAoY29u
c3QgX19iZTMyICopeGVuX3JlZy0+ZGF0YTsKPiA+ICsgICAgbGVuID0gZmR0MzJfdG9fY3B1KHhl
bl9yZWctPmxlbikgLyAoKGFkZHJlc3NfY2VsbHMgKiAyICsgc2l6ZV9jZWxscykgKgo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YodWludDMyX3QpKTsK
PiAKPiBBcG9sb2dpZXMgZm9yIHRoaXMsIEkgbWlzcmVhZCB5b3UgcHJldmlvdXMgY29kZS4gSSBh
bSBoYXBweSB3aXRoIHRoaXMgdmVyc2lvbgo+IG9yIHRoZSBwcmV2aW91cyBvbmUuCj4gCj4gWy4u
Ll0KPiAKPiA+ICsgICAgLyoKPiA+ICsgICAgICogT25seSBoYW5kbGUgcGFzc3Rocm91Z2ggcHJv
cGVydGllcyBpZiBib3RoIHhlbixyZWcgYW5kIHhlbixwYXRoCj4gPiArICAgICAqIGFyZSBwcmVz
ZW50LCBvciBpZiB4ZW4sZm9yY2UtYXNzaWduLXdpdGhvdXQtaW9tbXUgaXMgc3BlY2lmaWVkLgo+
ID4gKyAgICAgKi8KPiA+ICsgICAgaWYgKCB4ZW5fcmVnICE9IE5VTEwgJiYgKHhlbl9wYXRoICE9
IE5VTEwgfHwgeGVuX2ZvcmNlKSApCj4gPiArICAgIHsKPiA+ICsgICAgICAgIHJlcyA9IGhhbmRs
ZV9wYXNzdGhyb3VnaF9wcm9wKGtpbmZvLCB4ZW5fcmVnLCB4ZW5fcGF0aCwgeGVuX2ZvcmNlLAo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWRkcmVzc19jZWxscywg
c2l6ZV9jZWxscyk7Cj4gPiArICAgICAgICBpZiAoIHJlcyA8IDAgKQo+ID4gKyAgICAgICAgewo+
ID4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICJGYWlsZWQgdG8gYXNzaWduIGRldmlj
ZSB0byAlcGRcbiIsCj4gPiBraW5mby0+ZCk7Cj4gCj4gVGhpcyBpcyBub3QgdGhlIGVycm9yIHBh
dGggSSBtZWFudC4KPiAKPiBUaGUgb25lIEkgd2FzIHJlZmVycmluZyBpcyB0aGUgY2FzZSB3aGVy
ZSB4ZW4scGF0aCBpcyBwcmVzZW50IGJ1dCBub3QgeGVuLHJlZy4KPiBBdCB0aGUgbW9tZW50IHlv
dSB3aWxsIGNvbnRpbnVlIHdpdGhvdXQgdGVsbGluZyB0aGUgdXNlci4gV2Ugc2hvdWxkIGF0IGxl
YXN0Cj4gcHJpbnQgYSB3YXJuaW5nIGFuZCBwcm9iYWJseSByZXR1cm4gYW4gZXJyb3IgYXMgc29t
ZW9uZSBzcGVjaWZ5aW5nICJ4ZW4scGF0aCIKPiBtYXkgZXhwZWN0IHRvIGFzc2lnbiB0aGUgZGV2
aWNlLgoKQXJlIHlvdSBPSyB3aXRoIG1lIGFkZGluZyB0aGUgZm9sbG93aW5nOgoKICAgIGVsc2Ug
aWYgKCAoeGVuX3BhdGggJiYgIXhlbl9yZWcpIHx8ICh4ZW5fcmVnICYmICF4ZW5fcGF0aCAmJiAh
eGVuX2ZvcmNlKSApCiAgICB7CiAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgInhlbixyZWcgb3Ig
eGVuLHBhdGggbWlzc2luZyBmb3IgJXBkXG4iLAogICAgICAgICAgICAgICBraW5mby0+ZCk7CiAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7CiAgICB9CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 199A412F925
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 15:23:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inNoH-00034j-TR; Fri, 03 Jan 2020 14:20:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fV2H=2Y=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1inNoG-00034e-6K
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 14:20:16 +0000
X-Inumbo-ID: 245badca-2e34-11ea-88e7-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 245badca-2e34-11ea-88e7-bc764e2007e4;
 Fri, 03 Jan 2020 14:20:07 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y11so42570414wrt.6
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 06:20:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hSKKzsXPrCRLSJSP65mxDmAaRrFUXXYll5BZqJvR+5s=;
 b=cW1PuB8PKTyKZI1PKqTjs7uxMVmd4SLdlw4LAwyRRL+6f3tS+gR47Zmdv6Sq5gF8vB
 jFvohzGo16oPGjneL986WAwLtkpMKGtToVMXS2/VYPn8qklp67Egx7EsWoOEeJ7flh8Y
 kkny2nTghP2M7cEzflzCKf5DFzlVDKlX2kqfOIORDbHb1abN+GO/cI7gkXLz760o4LR9
 M/ArR0Lecmgx0PSThJgTcFWKjC+OQiD8PrDdf3fEfulFmUgc1SMZAyG7hFxwHCXVSAxX
 dKLPWY1MR7YLUkpuI/cYTUK5UuNHxYbzG+I4hgZxqD5lUTjjz3UOuqZvFaneiP1YdRTf
 RxtA==
X-Gm-Message-State: APjAAAXUS3pq8xpJFchKFf3RDVMRt9Oi5S7GZ8cZYkaQP0r3vVT8eLRV
 4BNUj4i7RJVscTGQjb/E0N0=
X-Google-Smtp-Source: APXvYqz2iTnGvrWihiXVvs2HdoECc2NQlMu17GieqXzvLk0dtyFFEFsHV9NbUf1AINyV7A4BxhfYxw==
X-Received: by 2002:adf:f28c:: with SMTP id k12mr86757486wro.360.1578061206815; 
 Fri, 03 Jan 2020 06:20:06 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id g9sm62113419wro.67.2020.01.03.06.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 06:20:06 -0800 (PST)
Date: Fri, 3 Jan 2020 14:20:04 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <pdurrant@gmail.com>
Message-ID: <20200103142004.bzbpuc4pfq7iwxdi@debian>
References: <20191229183341.14877-1-liuwe@microsoft.com>
 <20191229183341.14877-8-liuwe@microsoft.com>
 <CACCGGhD3qSsyGUikfY_urtk7=MrN_k0ZYO_8NiiFf72uWvtJyA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACCGGhD3qSsyGUikfY_urtk7=MrN_k0ZYO_8NiiFf72uWvtJyA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 7/8] x86/hyperv: retrieve vp_index from
 Hyper-V
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMDMsIDIwMjAgYXQgMTE6MTE6MzlBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IE9uIFN1biwgMjkgRGVjIDIwMTkgYXQgMTg6MzUsIFdlaSBMaXUgPHdsQHhlbi5vcmc+
IHdyb3RlOgo+ID4KPiA+IFRoaXMgd2lsbCBiZSB1c2VmdWwgd2hlbiBpbnZva2luZyBoeXBlcmNh
bGwgdGhhdCB0YXJnZXRzIHNwZWNpZmljCj4gPiB2Y3B1KHMpLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Cj4gPiAtLS0KPiA+ICB4ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jIHwgMTIgKysrKysrKysrKysrCj4gPiAgeGVuL2luY2x1
ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaCB8ICAxICsKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5
cGVydi9oeXBlcnYuYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiA+IGlu
ZGV4IDY3NjY3OTM2ZTkuLmRhM2E4Y2Q4NWQgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYv
Z3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2
L2h5cGVydi5jCj4gPiBAQCAtMjksNiArMjksNyBAQCBzdHJ1Y3QgbXNfaHlwZXJ2X2luZm8gX19y
ZWFkX21vc3RseSBtc19oeXBlcnY7Cj4gPiAgdm9pZCAqaHZfaHlwZXJjYWxsOwo+ID4gIHN0YXRp
YyBzdHJ1Y3QgcGFnZV9pbmZvICpodl9oeXBlcmNhbGxfcGFnZTsKPiA+ICBERUZJTkVfUEVSX0NQ
VV9SRUFEX01PU1RMWShzdHJ1Y3QgaHlwZXJ2X3BjcHVfcGFnZSwgaHZfcGNwdV9pbnB1dF9hcmcp
Owo+ID4gK0RFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHVuc2lnbmVkIGludCwgaHZfdnBfaW5k
ZXgpOwo+ID4KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzIG9wczsKPiA+
ICBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgKl9faW5pdCBoeXBlcnZfcHJvYmUodm9pZCkK
PiA+IEBAIC0xMTUsMTUgKzExNiwyNiBAQCBzdGF0aWMgdm9pZCBzZXR1cF9oeXBlcmNhbGxfcGNw
dV9hcmcodm9pZCkKPiA+ICAgICAgdGhpc19jcHUoaHZfcGNwdV9pbnB1dF9hcmcpLm1hcHBpbmcg
PSBtYXBwaW5nOwo+ID4gIH0KPiA+Cj4gPiArc3RhdGljIHZvaWQgc2V0dXBfdnBfaW5kZXgodm9p
ZCkKPiA+ICt7Cj4gPiArICAgIHVpbnQ2NF90IHZwX2luZGV4X21zcjsKPiA+ICsKPiA+ICsgICAg
cmRtc3JsKEhWX1g2NF9NU1JfVlBfSU5ERVgsIHZwX2luZGV4X21zcik7Cj4gPiArCj4gPiArICAg
IHRoaXNfY3B1KGh2X3ZwX2luZGV4KSA9IHZwX2luZGV4X21zcjsKPiA+ICt9Cj4gCj4gSXMgaXQg
d29ydGggYSBzZXBhcmF0ZSBmdW5jdGlvbiB2cy4gYnVuZGxpbmcgdGhpcyBpbnRvCj4gc2V0dXBf
aHlwZXJjYWxsX3BjcHVfYXJnKCk/CgpNeSB0aGlua2luZyBpcyB0aGlzIG1heSBiZSBjYWxsZWQg
aW4gdGhlIHJlc3VtZSBwYXRoOyB3aGlsZQpzZXR1cF9oeXBlcmNhbGxfcGNwdV9hcmcgZG9lc24n
dCAoYmVjYXVzZSB0aGV5IGp1c3Qgc2V0IGFzaWRlIGEgYnVuY2ggb2YKZ3Vlc3QgcGFnZXMpLgoK
VGhhdCBpcyBqdXN0IGEgcHJlY2F1dGlvbi4gSSBoYXZlbid0IGZvdW5kIGFueSB0ZXh0IGluIFRM
RlMgdGhhdCB2cAppbmRleCB3aWxsIC8gY2FuIGNoYW5nZSBhZnRlciByZXN1bWUuIFRoaXMgZnVu
Y3Rpb24gY2FuIGNlcnRhaW5seSBiZQpmb2xkZWQgaW50byB0aGUgb3RoZXIgaWYgdGhhdCdzIHBy
ZWZlcnJlZC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=

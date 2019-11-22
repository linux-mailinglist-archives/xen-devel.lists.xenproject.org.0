Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB201105DC4
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 01:37:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXwuH-0001lq-BV; Fri, 22 Nov 2019 00:34:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sEnY=ZO=armlinux.org.uk=linux+xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1iXwuF-0001ll-Bk
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 00:34:39 +0000
X-Inumbo-ID: db9be0c2-0cbf-11ea-9631-bc764e2007e4
Received: from pandora.armlinux.org.uk (unknown
 [2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db9be0c2-0cbf-11ea-9631-bc764e2007e4;
 Fri, 22 Nov 2019 00:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YL9UjrFzkCb8yeKfLOoIaW9TGt9+B8/y4tvJ5xKe8SE=; b=BLzrPF7JJVK/eQcSltF4pPT2H
 PNsjDKHbMyIPQt75OFD/xgt3Tran+t5t0JIl5n6NN5YV+rxoah/hQUcmbGwTcSHpVcL8gAB0ZqiSR
 3LqM+kxQu/0Oku48ZcpF17NSbkzCJmq5Vwcd8iGwI8tAxol1gULqUV8XJ1m924k97RK9bv/kGXFqb
 uKWRfp0mFUtW70cmQpzJSn8pqHW+NhtKzsSeMGZ1Qkwjc8tEbfYH6pv6aE+rZdLv8Io+sskEYleRZ
 rXGierSb3mbTZWA/k+2Mr4QKfJSorBdj9NjjUl56cMpEgCbwNXsOh0MU7deZIV5PBv7LQKlaozHFA
 ADu5Y77EA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42888)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iXwth-0001eL-2J; Fri, 22 Nov 2019 00:34:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iXwtf-0003CX-5J; Fri, 22 Nov 2019 00:34:03 +0000
Date: Fri, 22 Nov 2019 00:34:03 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Pavel Tatashin <pasha.tatashin@soleen.com>
Message-ID: <20191122003403.GG25745@shell.armlinux.org.uk>
References: <20191121184805.414758-1-pasha.tatashin@soleen.com>
 <20191121184805.414758-2-pasha.tatashin@soleen.com>
 <20191122002258.GD25745@shell.armlinux.org.uk>
 <CA+CK2bDtADA2eVwJAUEPhpic8vXWegh8yLjo6Q6WmXZDxAfJpA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+CK2bDtADA2eVwJAUEPhpic8vXWegh8yLjo6Q6WmXZDxAfJpA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH 1/3] arm/arm64/xen: use C inlines for
 privcmd_call
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, stefan@agner.ch,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Will Deacon <will@kernel.org>,
 boris.ostrovsky@oracle.com, Sasha Levin <sashal@kernel.org>,
 sstabellini@kernel.org, James Morris <jmorris@namei.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 xen-devel@lists.xenproject.org, Vladimir Murzin <vladimir.murzin@arm.com>,
 Marc Zyngier <marc.zyngier@arm.com>, alexios.zavras@intel.com,
 Thomas Gleixner <tglx@linutronix.de>, allison@lohutok.net, jgross@suse.com,
 steve.capper@arm.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, James Morse <james.morse@arm.com>,
 info@metux.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMDc6MzA6NDFQTSAtMDUwMCwgUGF2ZWwgVGF0YXNoaW4g
d3JvdGU6Cj4gPiA+ICsjaWZkZWYgQ09ORklHX0NQVV9TV19ET01BSU5fUEFOCj4gPiA+ICtzdGF0
aWMgX19hbHdheXNfaW5saW5lIHZvaWQgdWFjY2Vzc19lbmFibGUodm9pZCkKPiA+ID4gK3sKPiA+
ID4gKyAgICAgdW5zaWduZWQgbG9uZyB2YWwgPSBEQUNSX1VBQ0NFU1NfRU5BQkxFOwo+ID4gPiAr
Cj4gPiA+ICsgICAgIGFzbSB2b2xhdGlsZSgibWNyIHAxNSwgMCwgJTAsIGMzLCBjMCwgMCIgOiA6
ICJyIiAodmFsKSk7Cj4gPiA+ICsgICAgIGlzYigpOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICtz
dGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgdWFjY2Vzc19kaXNhYmxlKHZvaWQpCj4gPiA+ICt7
Cj4gPiA+ICsgICAgIHVuc2lnbmVkIGxvbmcgdmFsID0gREFDUl9VQUNDRVNTX0VOQUJMRTsKPiAK
PiBPb3BzLCBzaG91bGQgYmUgREFDUl9VQUNDRVNTX0RJU0FCTEUuCj4gCj4gPiA+ICsKPiA+ID4g
KyAgICAgYXNtIHZvbGF0aWxlKCJtY3IgcDE1LCAwLCAlMCwgYzMsIGMwLCAwIiA6IDogInIiICh2
YWwpKTsKPiA+ID4gKyAgICAgaXNiKCk7Cj4gPiA+ICt9Cj4gPgo+ID4gUmF0aGVyIHRoYW4gaW52
ZW50aW5nIHRoZXNlLCB3aHkgbm90IHVzZSB1YWNjZXNzX3NhdmVfYW5kX2VuYWJsZSgpLi4KPiA+
IHVhY2Nlc3NfcmVzdG9yZSgpIGFyb3VuZCB0aGUgWGVuIGNhbGw/Cj4gCj4gVGhhbmsgeW91IGZv
ciBzdWdnZXN0aW9uOiB1YWNjZXNzX2VuYWJsZSgpIGFuZCB1YWNjZXNzX2Rpc2FibGUoKSBhcmUK
PiBjb21tb24gY2FsbHMgd2l0aCBhcm02NCwgc28gSSB3aWxsIG5lZWQgdGhlbSwgYnV0IEkgdGhp
bmsgSSBjYW4gdXNlCj4gc2V0X2RvbWFpbigpIHdpdGggREFDUl9VQUNDRVNTX0RJU0FCTEUgL0RB
Q1JfVUFDQ0VTU19FTkFCTEUgaW5zaWRlCj4gdGhlc2UgaW5saW5lcy4KClRoYXQgbWF5IGJlLCBi
dXQgYmUgdmVyeSBjYXJlZnVsIHRoYXQgeW91IG9ubHkgdXNlIHRoZW0gaW4gQVJNdjctb25seQpj
b2RlLiAgVXNpbmcgdGhlbSBlbHNld2hlcmUgaXMgdW5zYWZlIGFzIHRoZSBkb21haW4gcmVnaXN0
ZXIgaXMgdXNlZApmb3Igb3RoZXIgcHVycG9zZXMsIGFuZCBtZXJlbHkgYmxhdHRpbmcgb3ZlciBp
dCAoYXMgeW91cgp1YWNjZXNzX2VuYWJsZSBhbmQgdWFjY2Vzc19kaXNhYmxlIGZ1bmN0aW9ucyBk
bykgaXMgdW5zYWZlLgoKLS0gClJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGlu
dXgub3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLwpGVFRDIGJyb2FkYmFuZCBmb3IgMC44bWlsZSBs
aW5lIGluIHN1YnVyYmlhOiBzeW5jIGF0IDEyLjFNYnBzIGRvd24gNjIya2JwcyB1cApBY2NvcmRp
bmcgdG8gc3BlZWR0ZXN0Lm5ldDogMTEuOU1icHMgZG93biA1MDBrYnBzIHVwCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

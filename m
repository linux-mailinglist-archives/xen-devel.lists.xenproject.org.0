Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9F416AD59
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 18:28:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6HTn-0001hi-Ke; Mon, 24 Feb 2020 17:25:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gH7p=4M=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j6HTl-0001hd-Da
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 17:25:13 +0000
X-Inumbo-ID: 9d00750c-572a-11ea-8fc3-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d00750c-572a-11ea-8fc3-bc764e2007e4;
 Mon, 24 Feb 2020 17:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582565113;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=HTYH5l+T5Td+6AmxGYgHqp7S9jfdG1gaO5dk9e4IGBc=;
 b=DLm1OSsRVo6BTduu57P9HFprid9y3I1U1i9x1a40n8eqK6P762dTAHXj
 2KMAkwnc+oktfgI5/iOVpGFFJTLumfOOEi8BWJbwD6Rg0JaLVrI6mWc70
 7xKb+DxeKYZMHBMPdGP//qj4pJDHKVMu6gX0aV2ErhOWFJafAK8se850x c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tFyfknoqGbwz5IgerUUN/c5d6qe5c4R2acMWK6dzGx0sTDTlTB9+uKaB/AShLyzcQxynjZKKlx
 qVF1Tl4kHHdEJxUaFzVnj2n87KDZeihO4NJZm7CRpGhqOZ7d+sALizXRmxhFnaXTjA6C4e+qne
 qyF8+bHEZZZ9CTl1KXGhCYALjRmzWB8vXi77edtDBS2KHms7MuIN2j5D27LAAdltO2A1YM9W2T
 aoD/waKCQHutt00a9XplhDazGAY6povVaFwxYweg+5AC2v1ZhjCzIrcOInADnTYeSW+eYA0cMH
 ltw=
X-SBRS: 2.7
X-MesageID: 12903000
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,480,1574139600"; d="scan'208";a="12903000"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24148.1780.909250.638385@mariner.uk.xensource.com>
Date: Mon, 24 Feb 2020 17:25:08 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20200127143444.25538-4-andrew.cooper3@citrix.com>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
 <20200127143444.25538-4-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 03/17] tools/migration: Drop IHDR_VERSION
 constant from libxc and python
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
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggdjIgMDMvMTddIHRvb2xzL21pZ3JhdGlvbjog
RHJvcCBJSERSX1ZFUlNJT04gY29uc3RhbnQgZnJvbSBsaWJ4YyBhbmQgcHl0aG9uIik6Cj4gTWln
cmF0aW9uIHYzIGlzIGluIHRoZSBwcm9jZXNzIG9mIGJlaW5nIGludHJvZHVjZWQsIG1lYW5pbmcg
dGhhdCB0aGUgY29kZSBoYXMKPiB0byBjb3BlIHdpdGggYm90aCB2ZXJzaW9ucy4gIFVzZSBhbiBl
eHBsaWNpdCAyIGZvciBub3cuCj4gCj4gRm9yIHRoZSB2ZXJpZnktc3RyZWFtLXYyIGFuZCBjb252
ZXJ0LWxlZ2FjeS1zdHJlYW0gc2NyaXB0cywgdXBkYXRlCj4gdGV4dCB0byBzYXkgInYyIChvciBs
YXRlcikiLiAgV2hhdCBtYXR0ZXJzIGlzIHRoZSBkaXN0aW5jdGlvbiB2cwo+IGxlZ2FjeSBzdHJl
YW1zLgoKQ2FuIEkgcmVxdWVzdCB0aGF0IHlvdSB1c2UgYSBtYW5pZmVzdCBjb25zdGFudCBmb3Ig
YDInLCByYXRoZXIgdGhhbgpzcHJpbmtsaW5nIGxpdGVyYWwgYDIncyBldmVyeXdoZXJlID8gIFNv
bWV0aGluZyBsaWtlIElIRFJfVkVSU0lPTl8yID8KVGhpcyBtYXkgc2VlbSBwb2ludGxlc3MsIGJ1
dCBpdCB3aWxsIG1lYW4gdGhhdCBpdCBpcyBwb3NzaWJsZSB0byBncmVwCnRoZSBjb2RlIG11Y2gg
bW9yZSBlYXNpbHkgZm9yIHRoaW5ncyB3aGljaCBhcmUgcmVsZXZhbnQgdG8gdjIgb3IgdjMgb3IK
d2hhdGV2ZXIuCgooSSBkb24ndCBpdCdzIG5lY2Vzc2FyeSB0byBnbyB0byBhbnkgZ3JlYXQgbGVu
Z3RocyB0byBzdWJzdGl0dXRlIHRoZQp2YWx1ZSBvZiBJSERSX1ZFUlNJT05fMiBpbnRvIGVycm9y
IG1lc3NhZ2VzOyBhIGxpdGVyYWwgMiBpbiB0aGUgc3RyaW5nCmlzIE9LIEkgdGhpbmsuKQoKVGhh
bmtzLApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

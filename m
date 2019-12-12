Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC4311D1C9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 17:04:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifQug-0002f4-9E; Thu, 12 Dec 2019 16:02:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uBeP=2C=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ifQue-0002ex-Rg
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 16:02:00 +0000
X-Inumbo-ID: ba77937a-1cf8-11ea-8da5-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba77937a-1cf8-11ea-8da5-12813bfff9fa;
 Thu, 12 Dec 2019 16:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576166521;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=ppGagdLXhCrlbsLMQioRxrS0osqE/Itf9/okTGjwFRU=;
 b=dC2KCFEGyIeMJ2GMtbVIqK/V3FN2SZGrISHlqWepBZNTGuEL5Sgx2nmY
 4QMWFvKOwXtoRSCW4YFliP2sPqjgzJeiw5G7WtURsBrg1FKdlwZpMbxyF
 UmiVn3Lh+vABcF0KgfgYMAZ93ozy9fgom3qo9aE906PYRCjHxOhLjft79 Y=;
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
IronPort-SDR: YgSMOyO/GJgqgYZgbMfeRvGyLDUrnz0qx6a1GVFoDaEqtWAyEI+ISbqSVPg/UbDE7LqTFakjQZ
 xExjp0I9zQefZ5r7xw0JRqUcRF8KvpC8EoiOIBLB28fkuz+y5A6rGsCGHaC5L4eiYQDEQbmB0T
 84C9q4OVvarDjevm9MGs2j4bqYd11f91CoWbqvbtBxawg3Os0cOwg49+fJFKvbpoDNaFTBQhCS
 yEfWidWM3Tgs5IVLSjO5MoODg5iNrOFRulDboM4Vo/2GNo2J8TrWO5ow8WPM5c3vc30TRUSnQ6
 F04=
X-SBRS: 2.7
X-MesageID: 9591033
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,306,1571716800"; 
   d="scan'208";a="9591033"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24050.25716.339742.836725@mariner.uk.xensource.com>
Date: Thu, 12 Dec 2019 16:01:56 +0000
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Jan Beulich
 <jbeulich@suse.com>
In-Reply-To: <6ae910a6-933b-0b6a-6371-7cc6a09097b3@suse.com>,
 <90371b30-7f3b-eec8-b93b-833d7f591780@suse.com>
References: <osstest-144726-mainreport@xen.org>
 <24050.24437.97024.719788@mariner.uk.xensource.com>
 <6ae910a6-933b-0b6a-6371-7cc6a09097b3@suse.com>
 <90371b30-7f3b-eec8-b93b-833d7f591780@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-4.8-testing test] 144726: regressions -
 trouble: fail/pass/starved [and 1 more messages]
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFt4ZW4tNC44LXRlc3RpbmcgdGVzdF0gMTQ0NzI2OiBy
ZWdyZXNzaW9ucyAtIHRyb3VibGU6IGZhaWwvcGFzcy9zdGFydmVkIik6Cj4gT24gMTIuMTIuMjAx
OSAxNjo0MCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gPiBJZiBKYW4gYXBwcm92ZXMgd2lsbCBmb3Jj
ZSBwdXNoIDQuOC10ZXN0aW5nLgo+IAo+IEkgZG8uIFRoYW5rcy4KCkRvbmUuCgo+ID4gRnJvbSBK
dWVyZ2VuIEkgd291bGQgbGlrZSBhIHJlbGVhc2UtYWNrIGZvciB0aGUgb3NzdGVzdCBjb21taXQg
dG8KPiA+ICJhbGxvdyIgaXQgZm9yIHRoZSBmdXR1cmUuCj4gCj4gSXMgdGhpcyByZWFsbHkgd29y
dGggaXQ/IFRoZSA0LjggdHJlZSBpcyBkZWFkIG5vdzsgc3RyaWN0bHkgc3BlYWtpbmcKPiBldmVu
IHRoZSBsYXN0IGJhdGNoIG9mIFhTQXMgc2hvdWxkbid0IGhhdmUgZ29uZSB0aGVyZSBhbnltb3Jl
LCBidXQKPiB3ZSBkaWQgc28gdG8gYmUgZnJpZW5kbHkgdG8gY2VydGFpbiBkaXN0cm9zLCBhcyBp
dCB3YXMganVzdCBiYXJlbHkKPiBwYXN0IHRoZSBleHBpcnkgZGF0ZS4KClRoaXMgaXMgcGF0dGVy
biBsaWtlbHkgdG8gb2NjdXIgYWdhaW4gaW4gdGhlIGZ1dHVyZSB3aXRoIG5ld2VyCnVuc3VwcG9y
dGVkIGJ1dCBzZWN1cml0eS1zdXBwb3J0ZWQgYnJhbmNoZXMuCgpIYXZpbmcgZ29uZSB0byB0aGUg
dHJvdWJsZSBvZiBmaWd1cmluZyBvdXQgd2hhdCBpcyBnb2luZyBvbiBJIHRob3VnaHQKSSB3b3Vs
ZCB3cml0ZSBpdCB1cCBhbmQgcHJvZHVjZSBhIGNvbW1pdCBpbiBvc3N0ZXN0LmdpdCB0aGF0IHNl
cnZlcyBhcwphbiBleGFtcGxlIG9mIGhvdyB0byBmaXggaXQuCgpKw7xyZ2VuIEdyb8OfIHdyaXRl
cyAoIlJlOiBbeGVuLTQuOC10ZXN0aW5nIHRlc3RdIDE0NDcyNjogcmVncmVzc2lvbnMgLSB0cm91
YmxlOiBmYWlsL3Bhc3Mvc3RhcnZlZCIpOgo+IEF0IGxlYXN0IEkgcmVhbGx5IGRvbid0IG1pbmQs
IGFzIEkgY2FuJ3Qgc2VlIGFueSByaXNrIGZvciA0LjEzLgo+IAo+IFJlbGVhc2UtYWNrZWQtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KClRoYW5rcy4KCklhbi4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

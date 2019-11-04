Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F63EDDCD
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 12:41:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRai2-0003S4-Tk; Mon, 04 Nov 2019 11:39:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v6/C=Y4=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iRai1-0003Rz-OV
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 11:39:45 +0000
X-Inumbo-ID: cb66ef1b-fef7-11e9-a177-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb66ef1b-fef7-11e9-a177-12813bfff9fa;
 Mon, 04 Nov 2019 11:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572867586;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=PS3oYHLjXyW/eUyprwqQielevJV1ubcBm8XH6vkM5YA=;
 b=Vt0yzW9iqDo5He5ebN+v7vrtg5BRxJs+aqVow8DH/df6yQ4EiIFtfUZZ
 bUagnrCXUhNzAYh7xQjQqtDQF0Z+T/SLU4tQOvCuVTT7yXLVmW76u6M03
 dJaZAr/nDjokYz0s0DsFkEuixo2QBlusGGeqtEvbHkfE0Ce6a6K6EG/+B Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ls0DfvoVxnTJ7sPtD7l9DZij0fFfaBR4OJTplsvNt4Rqt6ukaFBBbbFaZ+zucEltIWHq+tYhAs
 uLpEJoOTaMfx/bBSWeGkJILC0UJjTtbCWIe/2Eu4aCeFKkWkIsLKFR9aewniH/wZNoAJzRWigw
 cXn6Tcs6eUoab9k/rzbEtFahR5uCC5hf+8P/J3lIcgPizA5NOZivKb4hJhr94N6W9k9JIbRKc6
 Hy7L5fJmR0hhPdBnGTKyLGRCsUPHEWCIwxqJJp5bmeQt41/ppajrzLXPc5fW3UrcIvsx10NzKw
 blI=
X-SBRS: 2.7
X-MesageID: 7797557
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,267,1569297600"; 
   d="scan'208";a="7797557"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24000.3580.708080.144106@mariner.uk.xensource.com>
Date: Mon, 4 Nov 2019 11:39:40 +0000
To: <xen-devel@lists.xenproject.org>
In-Reply-To: <osstest-143493-mainreport@xen.org>
References: <osstest-143493-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [osstest test] 143493: regressions - FAIL
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
Cc: Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIltvc3N0ZXN0IHRlc3RdIDE0MzQ5MzogcmVn
cmVzc2lvbnMgLSBGQUlMIik6Cj4gZmxpZ2h0IDE0MzQ5MyBvc3N0ZXN0IHJlYWwgW3JlYWxdCj4g
aHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0MzQ5My8K
PiAKPiBSZWdyZXNzaW9ucyA6LSgKPiAKPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5k
IGFyZSBibG9ja2luZywKPiBpbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoK
PiAgdGVzdC1hbWQ2NC1hbWQ2NC1wYWlyICAgICAgICAxMCB4ZW4tYm9vdC9zcmNfaG9zdCAgICAg
ICAgZmFpbCBSRUdSLiB2cy4gMTQzMzkyCgpJIGRvbid0IGtub3cgd2hhdCB0aGlzIGlzLiAgTGlu
dXggZmFpbHMgdG8gYm9vdCB1bmRlciBYZW4uICBUaGUgbGFzdAptZXNzYWdlIGlzCiAgcmFuZG9t
OiBjcm5nIGluaXQgZG9uZQpCdXQgaXQgZG9lc24ndCBzZWVtIGF0IGFsbCBwcm9iYWJsZSB0aGF0
IHRoaXMgaXMgYW55dGhpbmcgdG8gZG8Kd2l0aCBvc3N0ZXN0LgoKPiAgdGVzdC1hbWQ2NC1hbWQ2
NC14bC1wdnNoaW0gICAxOCBndWVzdC1sb2NhbG1pZ3JhdGUveDEwICAgZmFpbCBSRUdSLiB2cy4g
MTQzMzkyCgpUaGlzIGlzIHRoZSBrbm93biBwdnNoaW0gdGltZWtlZXBpbmcgcHJvYmxlbS4KCiA8
cm95Z2VyPiB0aGVyZSdzIGEgdGltZSBqdW1wIGluIHRoZSBwdnNoaW0sIHdoaWNoIGxpa2VseQog
dHJpZ2dlcnMgdGhlIHdhdGNoZG9nOgogICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0
Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQzNDkzL3Rlc3QtYW1kNjQtYW1kNjQteGwtcHZzaGltL3Bpbm90
MS0tLXZhci1sb2cteGVuLWNvbnNvbGUtZ3Vlc3QtZGViaWFuLmd1ZXN0Lm9zc3Rlc3QtLWluY29t
aW5nLmxvZwogICAgICAgICAgICAgICAKU28gZm9sbG93aW5nIGlyYyBkaXNjdXNzaW9uIEkgaGF2
ZSBmb3JjZSBwdXNoZWQgdGhpcy4gIEkgaGF2ZSBhbHNvCnB1c2hlZCB0aGUgYm9vdGxvYWRlciBj
b25zb2xlIGNoYW5nZSAoZm9yIHRoZSBiZW5lZml0IG9mIGFybSkgdG8Kb3NzdGVzdCBwcmV0ZXN0
LCBidXQgaW4gdGhlIG1lYW50aW1lIHdoZW4gd2UgaGF2ZSBmbGlnaHRzIHdoZXJlIHRoYXQncwp0
aGUgb25seSBwcm9ibGVtIHdlIGNhbiBmb3JjZSBwdXNoIHRoZSByZWxldmFudCBicmFuY2guCgpJ
YW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

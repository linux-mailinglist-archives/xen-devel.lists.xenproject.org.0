Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E648C16A9F7
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 16:23:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6FXZ-0004y3-HG; Mon, 24 Feb 2020 15:21:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6FXY-0004xy-HB
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 15:21:00 +0000
X-Inumbo-ID: 42415304-5719-11ea-920e-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42415304-5719-11ea-920e-12813bfff9fa;
 Mon, 24 Feb 2020 15:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582557659;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1+IMqvSLUleczcOTXHZYnqn5qVn3fQJMjZ0Dy8piASU=;
 b=ifQ3N1L6kQqzsV5B80sy4e6eNtvv3sCOcHGGf1oHZ2rV/GBZy7ztqijN
 chTrLdpSOoMUxXOVtE0zozvjrIw81Kf2Hdr5CN6eQpNC5kp8DXpEqeMnG
 tj2j0/2w2qe/sXawvXMrlKug5MbpVqBcvMqNEIBKYEazDsPDq9qH165ql E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: P+/gN5j+uwQnOuIIeSDcMV7gpvQxkIQ4VcZ4tKeE+iDVlr113EgVtP8tNeAJQ/kt5Ut+tDP6/U
 Mp1/Ikbwxqm8t1wLHNl8ZTUlaUWPjH7syVNc9Aa1FGorF8oSKSp9qwdwdFpUirMkaNO31Lvizt
 EXoFTL+HQSLdsaNHFO+/L94SD51lzzokTLjdb0CN47TcqgKVNSE51LbEx/oYteJwNSJnhHzU0e
 B6aJzQpvZu3a3hr3e7IIbvw6r1JJH0Xn34SOO6tyKQVFiaj1nDWVcDb7ov+JVb9eNdtTW3Yypx
 KSw=
X-SBRS: 2.7
X-MesageID: 12894968
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,480,1574139600"; d="scan'208";a="12894968"
Date: Mon, 24 Feb 2020 16:20:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Message-ID: <20200224152051.GS4679@Air-de-Roger>
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <8ccfd49088b2c811415f0c09886133a936e460d2.1582310142.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8ccfd49088b2c811415f0c09886133a936e460d2.1582310142.git.tamas.lengyel@intel.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v9 1/5] xen/x86: Make hap_get_allocation
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMTA6NDk6MTlBTSAtMDgwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IER1cmluZyBWTSBmb3JraW5nIHdlJ2xsIGNvcHkgdGhlIHBhcmVudCBkb21haW4n
cyBwYXJhbWV0ZXJzIHRvIHRoZSBjbGllbnQsCj4gaW5jbHVkaW5nIHRoZSBIQVAgc2hhZG93IG1l
bW9yeSBzZXR0aW5nIHRoYXQgaXMgdXNlZCBmb3Igc3RvcmluZyB0aGUgZG9tYWluJ3MKPiBFUFQu
IFdlJ2xsIGNvcHkgdGhpcyBpbiB0aGUgaHlwZXJ2aXNvciBpbnN0ZWFkIGRvaW5nIGl0IGR1cmlu
ZyB0b29sc3RhY2sgbGF1bmNoCj4gdG8gYWxsb3cgdGhlIGRvbWFpbiB0byBzdGFydCBleGVjdXRp
bmcgYW5kIHVuc2hhcmluZyBtZW1vcnkgYmVmb3JlIChvcgo+IGV2ZW4gY29tcGxldGVseSB3aXRo
b3V0KSB0aGUgdG9vbHN0YWNrLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8
dGFtYXMubGVuZ3llbEBpbnRlbC5jb20+CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+CgpJIHdvdWxkIGFsc28gYmUgZmluZSB3aXRoIHRoaXMgbWVy
Z2VkIGludG8gdGhlIHJlc3BlY3RpdmUgcGF0Y2ggd2hlcmUKaGFwX2dldF9hbGxvY2F0aW9uIGdl
dHMgY2FsbGVkLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=

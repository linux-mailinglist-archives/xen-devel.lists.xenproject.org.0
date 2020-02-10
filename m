Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5F415743D
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 13:12:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j17tD-00006n-68; Mon, 10 Feb 2020 12:10:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rnvo=36=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j17tB-00006c-G5
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 12:10:09 +0000
X-Inumbo-ID: 4714cf76-4bfe-11ea-852a-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4714cf76-4bfe-11ea-852a-bc764e2007e4;
 Mon, 10 Feb 2020 12:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581336608;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=P11912+/3HLt4VVhq53sFMej9v6KQvgGZLNsb4JKoOY=;
 b=HF5jLaYlGpv1PmFVNoPs6xc6GVSlg3d5YIA5JbtxdjMiKw9gjmNwpHEg
 VOytovkwbC87L7Ay2c0PLZwLsmiz/T8sMpXJYZ+fKIrPisqb0Zn6DyvX4
 A8Q9YO3Po2ptUBeLW25MlM7KsMe0frP41/nAAvhWkNqVIIHbcV3NqD2gW M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xbTejl4JBp2foj/8YfRCsIs6bv+wFqKN37+DEwsDM//zwwQb23wJqnviw7DHYNSGVvQPPf3fbl
 KEmoLVU78kodwEYzQdD+TRwOYmJm6aRrCUn9dwj6i1WkGPaq5iQYHZUp642ebTdDeV47yKSKK0
 sMGmCPg4zyiA3Qe5Mv8RHf5ULcGyIXSJnz5AVv30Yt//ZdbQrkC9qfQVJDs741SvSnTF7JgKaA
 TjdARcz2CkFuVL0tE2VTFhUCEKv02OCxgmOn+si2jT+TusQJdvfZsxMvHiflUgzqTie39oUAvo
 y5w=
X-SBRS: 2.7
X-MesageID: 12203660
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,424,1574139600"; d="scan'208";a="12203660"
Date: Mon, 10 Feb 2020 13:09:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200210120956.GH4679@Air-de-Roger>
References: <20200210114206.17115-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210114206.17115-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/svm: Reduce vmentry latency
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMTAsIDIwMjAgYXQgMTE6NDI6MDZBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBXcml0aW5nIHRvIHRoZSBzdGFjayBwb2ludGVyIGluIHRoZSBtaWRkbGUgb2YgYSBs
aW5lIG9mIHBvcCBvcGVyYXRpb25zIGlzCj4gc3BlY2lmaWNhbGx5IHJlY29tbWVuZGVkIGFnYWlu
c3QgYnkgdGhlIG9wdGltaXNhdGlvbiBndWlkZSwgYW5kIGlzIGEgdGVjaG5pcXVlCj4gdXNlZCBi
eSBTcGVjdWxhdGl2ZSBMb2FkIEhhcmRlbmluZyB0byBjb21iYXQgU3BlY3RyZVJTQi4KPiAKPiBJ
biBwcmFjdGljZSwgaXQgY2F1c2VzIGFsbCBmdXJ0aGVyIHN0YWNrLXJlbGF0aXZlIGFjY2Vzc2Vz
IHRvIGJsb2NrIHVudGlsIHRoZQo+IHdyaXRlIHRvIHRoZSBzdGFjayBwb2ludGVyIHJldGlyZXMs
IHNvIHRoZSBzdGFjayBlbmdpbmUgY2FuIGdldCBiYWNrIGluIHN5bmMuCj4gCj4gUG9wIGludG8g
YW55IGRlYWQgcmVnaXN0ZXIgdG8gZGlzY2FyZCAlcmF4J3MgdmFsdWUgd2l0aG91dCBjbG9iYmVy
aW5nIHRoZQo+IHN0YWNrIGVuZ2luZS4gIFNtYWxsZXIgY29tcGlsZWQgY29kZSwgYW5kIHJ1bnMg
ZmFzdGVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+CgpUaGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs

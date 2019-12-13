Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F50E11E307
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 12:53:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifjTE-0005M4-UP; Fri, 13 Dec 2019 11:50:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kzvv=2D=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ifjTD-0005Lx-BT
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 11:50:55 +0000
X-Inumbo-ID: d14707b0-1d9e-11ea-8ee9-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d14707b0-1d9e-11ea-8ee9-12813bfff9fa;
 Fri, 13 Dec 2019 11:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576237854;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=Ggk9jaONKLIcQfweYD21zKqr5+qjPAjFLfGRvRRWrvM=;
 b=DfcShPDtSy2GIJfBKL2+Pn4zkPjezdC+dWxPmOvpImy+5bba8LXBVJYz
 p9MqcssopjoKXar1JBG4fY+uvbSEkRteZ2tFIfvv7zViuoVEjrvEVrtO5
 2y4Pk4+P2yhCjUF5xpdfCHvWf1662QAVmit6AkbOfZ/rvtDTgDJecRZ7v Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cjO5C0dCgbUSh6EKsp5pDs1USDaJ+O7m0xEnQW34Trc25DBuGAof/CHSbscIAzycOpUPDfdH6X
 BHIlHrP/RCW1B+iMPxEcvP5yf1oYBrdmDZ/wLHFPnkWqrUXLLs4KExg1z5H9fCizBIwRYAAKCR
 gKWm4M98HeuW6893r7U62iIkjl/QOnakb4zlwtuNJJygwXSQkcoOTp+sYW0kxj5OzsrviQ1wHk
 9bRtF3YqRL/84pjTcUSVqyCfIfcrsAvFkr3igIWTKV8xG8mWHXp7Ef+YvAEA3HXpfrqQGLqVm7
 aa4=
X-SBRS: 2.7
X-MesageID: 9772501
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; 
   d="scan'208";a="9772501"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24051.31515.75906.954822@mariner.uk.xensource.com>
Date: Fri, 13 Dec 2019 11:50:51 +0000
To: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <80d621c6-5a32-3b49-2dee-b8e39151c391@suse.com>
References: <osstest-144723-mainreport@xen.org>
 <24050.30284.331109.130374@mariner.uk.xensource.com>
 <80d621c6-5a32-3b49-2dee-b8e39151c391@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-4.9-testing test] 144723: regressions -
 trouble: fail/pass/starved
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFt4ZW4tNC45LXRlc3RpbmcgdGVzdF0gMTQ0NzIzOiBy
ZWdyZXNzaW9ucyAtIHRyb3VibGU6IGZhaWwvcGFzcy9zdGFydmVkIik6Cj4gT24gMTIuMTIuMjAx
OSAxODoxOCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gPiBvc3N0ZXN0IHNlcnZpY2Ugb3duZXIgd3Jp
dGVzICgiW3hlbi00LjktdGVzdGluZyB0ZXN0XSAxNDQ3MjM6IHJlZ3Jlc3Npb25zIC0gdHJvdWJs
ZTogZmFpbC9wYXNzL3N0YXJ2ZWQiKToKPiA+PiBmbGlnaHQgMTQ0NzIzIHhlbi00LjktdGVzdGlu
ZyByZWFsIFtyZWFsXQo+ID4+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29z
c3Rlc3QvbG9ncy8xNDQ3MjMvCj4gPj4KPiA+PiBSZWdyZXNzaW9ucyA6LSgKPiA+Pgo+ID4+IFRl
c3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAo+ID4+IGluY2x1ZGlu
ZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgo+ID4+ICB0ZXN0LWFtZDY0LWkzODYteGwt
cWVtdXQtd2luNy1hbWQ2NCAxNSBndWVzdC1zYXZlcmVzdG9yZS4yIGZhaWwgUkVHUi4gdnMuIDE0
NDU0NQo+ID4+ICB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV0LXdzMTYtYW1kNjQgMTYgZ3Vlc3Qt
bG9jYWxtaWdyYXRlL3gxMCBmYWlsIFJFR1IuIHZzLiAxNDQ1NDUKPiA+IAo+ID4gVGhlc2UgdGVz
dHMgaGF2ZSBiZWVuIGZsYWt5IGZvciBhIGxvbmcgdGltZS4gIEdpdmVuIHRoZSA0LjEzIHJlbGVh
c2UKPiA+IHNob3VsZCBnZXQgcHJpb3JpdHkgSSBwcm9wb3NlIHRvIGZvcmNlIHB1c2ggdGhpcyBy
YXRoZXIgdGhhbiB3YWl0aW5nCj4gPiBmb3IgdGhlIHJldGVzdCB0byBjb21wbGV0ZS4gIEkgd2ls
bCB0aGVuIGtpbGwgdGhlIHJldGVzdCBmbGlnaHQsIHNpbmNlCj4gPiBzdGFibGUtNC45IHdpbGwg
dGhlbiBiZSA9PSBzdGFnaW5nLTQuOS4KPiAKPiBXZWxsLCBvbmUgb2YgdGhlIHR3byBoYXMgc3Vj
Y2VlZGVkIGluIHRoZSBuZXh0IGZsaWdodCAodG8gYmFsYW5jZQo+IHRoaW5ncywgdHdvIG90aGVy
cyBoYXZlIGZhaWxlZCB0aGVyZSkuIElmIHlvdSdyZSBjb252aW5jZWQgdGhlc2UKPiBoYXZlIGJl
ZW4gcmFuZG9tbHkgZmFpbGluZyBhbnl3YXkgaW4gdGhlIHBhc3QsIEknbSBmaW5lIHdpdGggeW91
Cj4gZG9pbmcgYSBmb3JjZSBwdXNoLCBmd2l3LgoKRG9uZS4KClRoYW5rcywKSWFuLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7670140B8D
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 14:49:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isRx6-0005tL-0k; Fri, 17 Jan 2020 13:46:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zPxh=3G=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1isRx3-0005tG-Nk
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 13:46:17 +0000
X-Inumbo-ID: b9ee78d0-392f-11ea-b52d-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9ee78d0-392f-11ea-b52d-12813bfff9fa;
 Fri, 17 Jan 2020 13:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579268773;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=88IuGxCfaFaxtq8SZw8f2U7A+4/aTLOJviAX7A9k53M=;
 b=PIy93VzzFfUdFPg2IdivvfS8Hf6hNKqVwmcnVMYaeguU4t2Rtczk23MX
 irMhx9WNN9wGghtP32wPaeGzCn96rEuBg6BKYnunTGe1JvSRQkKMl1MT1
 cGCrmbdWoH9TT1iu3Frh8BCSvSpbvzn+272FICEPtF8yniu9pZ5lkziDm c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: l/JEyqYUkFjieGl3AzLjtwOYZru+mAMAQmSnHYaCmCKCPcKBRsdoQCTXmAdROSxilZiSfw2E74
 f/cweSbIr5BXLr0qtUPJXioB6gwtiMtdUDnS+o7JCXNlYKPAijlLEMn2XR+w75GGt1PMyG49U4
 Sll2rlO+cdCAzYeesy8B70t2em3irXCtSxnb2RRr+2Az6YBTqHwY4tNLZ+9zSrUDaO7ttYy/Aq
 z3vdVs3om2R0wukz7wFVOZpNGau9FHk2ypXjAAL6B5hqjmCTmTQGC0+YoHh1vwqoGb1+L1IZ4t
 zac=
X-SBRS: 2.7
X-MesageID: 11666288
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11666288"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24097.47778.709088.919725@mariner.uk.xensource.com>
Date: Fri, 17 Jan 2020 13:46:10 +0000
To: George Dunlap <george.dunlap@citrix.com>
In-Reply-To: <fb68b456-8ce4-3a07-cfd3-1672ab9b55fc@citrix.com>
References: <20200113170843.21332-1-ian.jackson@eu.citrix.com>
 <20200113170843.21332-6-ian.jackson@eu.citrix.com>
 <fb68b456-8ce4-3a07-cfd3-1672ab9b55fc@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 05/10] libxl: event: Make
 libxl__poller_wakeup take a gc, not an egc
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

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJSZTogW1BBVENIIHYyIDA1LzEwXSBsaWJ4bDogZXZlbnQ6
IE1ha2UgbGlieGxfX3BvbGxlcl93YWtldXAgdGFrZSBhIGdjLCBub3QgYW4gZWdjIik6Cj4gT24g
MS8xMy8yMCA1OjA4IFBNLCBJYW4gSmFja3NvbiB3cm90ZToKPiA+IFdlIGFyZSBnb2luZyB0byB3
YW50IHRvIGNhbGwgdGhpcyBpbiB0aGUgZm9sbG93aW5nIHNpdHVhdGlvbjoKPiA+IAo+ID4gICog
V2UgaGF2ZSBqdXN0IHNldCB1cCBhbiBhbywgd2hpY2ggaXMgdG8gY2FsbCBiYWNrIC0gc28gYQo+
ID4gICAgbm9uLXN5bmNocm9ub3VzIG9uZS4gIEl0IG91Z2h0IG5vdCB0byBjYWxsIHRoZSBhcHBs
aWNhdGlvbgo+ID4gICAgYmFjayByaWdodCBhd2F5LCBzbyBubyBlZ2MuCj4gPiAKPiA+ICAqIFRo
ZXJlIGlzIGEgbGlieGwgdGhyZWFkIGJsb2NraW5nIHNvbWV3aGVyZSBidXQgaXQgaXMgdXNpbmcK
PiA+ICAgIHVzaW5nIGFuIG91dCBvZiBkYXRlIGZkIG9yIHRpbWVvdXQgc2V0LCB3aGljaCBkb2Vz
IG5vdCB0YWtlIGludG8KPiA+ICAgIGFjY291bnQgdGhlIGFvIHdlIGhhdmUganVzdCBzdGFydGVk
Lgo+ID4gCj4gPiAgKiBXZSB0cnkgdG8gd2FrZSB0aGF0IHRocmVhZCB1cCwgYnV0IGxpYnhsX19w
b2xsZXJfd2FrZXVwIGZhaWxzLgo+IAo+IFNvIHRoZSBpZGVhIGJlZm9yZSB3YXMgdGhhdCB0aGVz
ZSB0d28gZnVuY3Rpb25zIHRha2UgYW4gZWdjLCBub3Qgc28gbXVjaAo+IGJlY2F1c2UgaXQgYWN0
dWFsbHkgdXNlcyB0aGUgZWdjLCBidXQgdG8gbWFrZSBzdXJlIGl0J3Mgb25seSBjYWxsZWQgaW4g
YQo+IHJlc3RyaWN0ZWQgc2V0IG9mIGNvbmRpdGlvbnM7IGFuZCBub3cgd2UncmUgcmVsYXhpbmcg
dGhvc2UgY29uZGl0aW9ucz8KClllcy4gIFNwZWNpZmljYWxseSwgd2UgbmVlZCB0byBtYWtlIG9u
ZSBleGNlcHRpb24sIHJlbGF0aW5nIHRvIGFvJ3MuCgpJbiB0aGUgc2l0dWF0aW9uIGRlc2NyaWJl
ZCBhYm92ZSwgdGhlcmUgaXMgbm8gZWdjLCBidXQgd2UgbmVlZCB0byBjYWxsCmxpYnhsX19wb2xs
ZXJfd2FrZXVwLiAgSW50cm9kdWNpbmcgYW4gZWdjIGlzIHdyb25nIGJlY2F1c2UgdGhhdCB3b3Vs
ZAppbXBseSB0aGF0IHRoaXMgc2l0dWF0aW9uIG1pZ2h0IHJlc3VsdCBpbiBhcHBsaWNhdGlvbiBj
YWxsYmFja3MsIGJ1dAppdCBzaG91bGRuJ3QgKGFuZCBub3QgaGF2aW5nIGFuIGVnYyBwcmV2ZW50
cyB0aGF0KS4KCmxpYnhsX19wb2xsZXJfd2FrZXVwIGFuZCBMSUJYTF9fRVZFTlRfRElTQVNURVIg
b25seSB0YWtlIGFuIGVnYyBmb3IKZm9ybSdzIHNha2U7IHRoZXkgZG9uJ3QgdXNlIGFueSBwYXJ0
IG9mIGl0IG90aGVyIHRoYW4gdGhlIGdjLiAgVGhlCiJmb3JtJ3Mgc2FrZSIgaXMgdG8gc3RvcCB0
aGVtIGJlaW5nIGNhbGxlZCBmcm9tIGxpYnhsIGVudHJ5cG9pbnRzIHRoYXQKYXJlIG5vdCBpbnZv
bHZlZCBpbiBldmVudCBnZW5lcmF0aW9uLgoKQmVmb3JlIHRoaXMgcGF0Y2ggdGhpcyBpcyBlbmZv
cmNlZCBieSB0aGUgdHlwZXM6IHlvdSBjYW4ndCBjYWxsIGl0IGluCnRoZSB3cm9uZyBwbGFjZSBi
ZWNhdXNlIGl0IHdhbnRzIGFuIGVnYyB3aGljaCB5b3UgZG9uJ3QgaGF2ZS4KCkFmdGVyIHRoaXMg
cGF0Y2ggdGhpcyBpcyBubyBsb25nZXIgZW5mb3JjZWQuICBCdXQgdGhlIG1pc3Rha2UKKHByaW5j
aXBhbGx5LCBjYWxsaW5nIF9ESVNBU1RFUikgc2VlbXMgdW5saWtlbHkuICBUaGUgdHlwZSBlbmZv
cmNlbWVudApJIG1lbnRpb24gYWJvdmUgd2FzIGRvbmUgYmVjYXVzZSBpdCB3YXMgcG9zc2libGUg
YW5kIGVhc3ksIG5vdCBiZWNhdXNlCml0IHdhcyBpbXBvcnRhbnQuCgpEb2VzIG1vcmUgb2YgdGhp
cyB3YW50IHRvIGJlIGluIHRoZSBjb21taXQgbWVzc2FnZSA/CgpUaGFua3MsCklhbi4KKG11Y2gg
dGV4dCBvZiB0aGlzIG1haWwgZmlyc3Qgd3JpdHRlbiBvbiBpcmMpCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

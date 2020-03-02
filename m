Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F381759BA
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 12:51:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8jZ7-00080N-9V; Mon, 02 Mar 2020 11:48:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1vPy=4T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j8jZ5-00080I-6K
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 11:48:51 +0000
X-Inumbo-ID: c88091ac-5c7b-11ea-b122-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c88091ac-5c7b-11ea-b122-bc764e2007e4;
 Mon, 02 Mar 2020 11:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583149730;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/TSRUDS9lfP+ZiZoI/4gEyTWEqAJxOyjX34PeYG65xs=;
 b=REtm+Arw6LD6WQttMxQOIqX4z/tk4zUhYhAwFUpeEnOekzgeo4Kv80s3
 EtiSxcYyIrGjc5aNC7o3MSg/ikf11T4ZpjVSX+K3iiCilD3QudyEBuIh4
 PC122fXdCEWiK5+DHhE+EsrKGJ3qzCBV9J23TXwJu60WekG4fLmeCBvtc w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TvRj8kQaWP7SDA4CieQBXuLeNilfxOG78NzUSBv76PN6B/VnOjJRudA3MZQFySH+PaoSaToB16
 cO8pEHdS1M3IyE0qUWcbCn+uXd4hhBV5kWLWkNSMHSuGcSnC8zi7JxH4YttSx+G63jbSHe/TKd
 qvCWkClfviAm0e/s64hTC4HMSJGzkiPsx4fUdSqCB/yOS5IJfuBQtnVWNxdlCCClEfAhyHSRoh
 r6MkO3v3obg+Ov3gz22rELP5DJIAYmObDn5obCLW2wN5fELpSJ9wvH6wo2Qlsz1GDq0NR7kgIY
 jXw=
X-SBRS: 2.7
X-MesageID: 13692174
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,507,1574139600"; d="scan'208";a="13692174"
Date: Mon, 2 Mar 2020 12:48:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200302114843.GK24458@Air-de-Roger.citrite.net>
References: <20200219174354.84726-1-roger.pau@citrix.com>
 <20200219174354.84726-7-roger.pau@citrix.com>
 <616f1cd4-e660-97a5-b326-12ca001bfb7d@suse.com>
 <20200228165238.GF24458@Air-de-Roger.citrite.net>
 <37448a41-57d0-9ae6-bd6a-f4546d83efb2@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <37448a41-57d0-9ae6-bd6a-f4546d83efb2@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v5 6/7] xen/guest: prepare hypervisor ops to
 use alternative calls
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>, Wei
 Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXIgMDIsIDIwMjAgYXQgMTE6NDM6MTRBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjguMDIuMjAyMCAxNzo1MiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IEZyaSwgRmViIDI4LCAyMDIwIGF0IDA1OjI5OjMyUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDE5LjAyLjIwMjAgMTg6NDMsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+Pj4g
LS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+ID4+PiArKysgYi94ZW4v
YXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gPj4+IEBAIC0xOTksNyArMTk5LDcgQEAg
c3RhdGljIHZvaWQgX19pbml0IGU4MjBfZml4dXAoc3RydWN0IGU4MjBtYXAgKmU4MjApCj4gPj4+
ICAgICAgICAgIHBhbmljKCJVbmFibGUgdG8gcmVzZXJ2ZSBIeXBlci1WIGh5cGVyY2FsbCByYW5n
ZVxuIik7Cj4gPj4+ICB9Cj4gPj4+ICAKPiA+Pj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgaHlwZXJ2
aXNvcl9vcHMgb3BzID0gewo+ID4+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29w
cyBfX2luaXRkYXRhIG9wcyA9IHsKPiA+Pgo+ID4+IFRoaXMgbmVlZHMgdG8gYmUgX19pbml0Y29u
c3RyZWwgaW4gb3JkZXIgdG8gYXZvaWQgdHJpZ2dlcmluZwo+ID4+IChwb3NzaWJseSBvbmx5IGlu
IHRoZSBmdXR1cmUpIHNlY3Rpb24gbWlzbWF0Y2ggd2FybmluZ3Mgd2l0aAo+ID4+IGF0IGxlYXN0
IHNvbWUgZ2NjIHZlcnNpb25zLiBXaXRoIHRoaXMgYW5kIHRoZSBvdGhlciBpbnN0YW5jZQo+ID4+
IGFkanVzdGVkCj4gPiAKPiA+IEkgY2FuIGRvIHRoYXQgd2hlbiBwb3N0aW5nIGEgbmV3IHZlcnNp
b24sIHVubGVzcyB5b3Ugd2FudCB0byBwaWNrIHRoaXMKPiA+IGVhcmxpZXIgYW5kIGFkanVzdCBv
biBjb21taXQuCj4gCj4gSXMgdGhpcyB0byBtZWFuIHRoYXQgdGhpcyAybmQgdG8gbGFzdCBwYXRj
aCBpbiB0aGUgc2VyaWVzIGlzCj4gZnVsbHkgaW5kZXBlbmRlbnQgb2YgdGhlIGVhcmxpZXIgZml2
ZSAoYWxzbyBjb250ZXh0dWFsbHkpPwoKUmlnaHQsIHBhdGNoZXMgNSB0byA3IHNob3VsZCBiZSBj
b21wbGV0ZWx5IGluZGVwZW5kZW50LCBhcyB0aGV5IG9ubHkKbW9kaWZ5IGNvZGUgcmVsYXRlZCB0
byBYZW4gcnVubmluZyBhcyBhIGd1ZXN0LgoKPiBUaGVuIG9mIGNvdXJzZSBJJ2QgYmUgZmluZSB0
byBtYWtlIHRoZSBhZGp1c3RtZW50cyBhbmQgY29tbWl0Lgo+IFBsZWFzZSBjb25maXJtIGlmIHNv
LgoKWWVzIHBsZWFzZSwgZG8gdGhlIGFkanVzdG1lbnRzIG9uIGNvbW1pdCBpZiB5b3UgZG9uJ3Qg
bWluZC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs

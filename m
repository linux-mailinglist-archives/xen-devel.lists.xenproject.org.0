Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DB71B902
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 16:48:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQCCp-0003qn-RG; Mon, 13 May 2019 14:45:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KEM8=TN=citrix.com=prvs=029c3005f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hQCCo-0003qi-7U
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:45:30 +0000
X-Inumbo-ID: bf5969bc-758d-11e9-8bf7-8fc6c0f7bbc1
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf5969bc-758d-11e9-8bf7-8fc6c0f7bbc1;
 Mon, 13 May 2019 14:45:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="89709283"
Date: Mon, 13 May 2019 16:45:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190513144518.lrijyr232hjchrvj@Air-de-Roger>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
 <5CD2D563020000780022CD40@prv1-mh.provo.novell.com>
 <20190513134821.pomwew6vmtibxvem@Air-de-Roger>
 <5CD97CD8020000780022E2AA@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CD97CD8020000780022E2AA@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 07/12] x86/IRQ: fix locking around vector
 management
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDg6MTk6MDRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEzLjA1LjE5IGF0IDE1OjQ4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDc6MTA6NTlBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11
LmMKPiA+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwo+ID4+IEBA
IC0yMTM0LDExICsyMTM0LDE2IEBAIHN0YXRpYyB2b2lkIGFkanVzdF9pcnFfYWZmaW5pdHkoc3Ry
dWN0IGEKPiA+PiAgICAgIHVuc2lnbmVkIGludCBub2RlID0gcmhzYSA/IHB4bV90b19ub2RlKHJo
c2EtPnByb3hpbWl0eV9kb21haW4pCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
OiBOVU1BX05PX05PREU7Cj4gPj4gICAgICBjb25zdCBjcHVtYXNrX3QgKmNwdW1hc2sgPSAmY3B1
X29ubGluZV9tYXA7Cj4gPj4gKyAgICBzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2M7Cj4gPj4gIAo+ID4+
ICAgICAgaWYgKCBub2RlIDwgTUFYX05VTU5PREVTICYmIG5vZGVfb25saW5lKG5vZGUpICYmCj4g
Pj4gICAgICAgICAgIGNwdW1hc2tfaW50ZXJzZWN0cygmbm9kZV90b19jcHVtYXNrKG5vZGUpLCBj
cHVtYXNrKSApCj4gPj4gICAgICAgICAgY3B1bWFzayA9ICZub2RlX3RvX2NwdW1hc2sobm9kZSk7
Cj4gPj4gLSAgICBkbWFfbXNpX3NldF9hZmZpbml0eShpcnFfdG9fZGVzYyhkcmhkLT5pb21tdS0+
bXNpLmlycSksIGNwdW1hc2spOwo+ID4+ICsKPiA+PiArICAgIGRlc2MgPSBpcnFfdG9fZGVzYyhk
cmhkLT5pb21tdS0+bXNpLmlycSk7Cj4gPj4gKyAgICBzcGluX2xvY2tfaXJxKCZkZXNjLT5sb2Nr
KTsKPiA+IAo+ID4gSSB3b3VsZCB1c2UgdGhlIGlycXNhdmUvaXJxcmVzdG9yZSB2YXJpYW50cyBo
ZXJlIGZvciBleHRyYSBzYWZldHkuCj4gCj4gSG1tLCBtYXliZS4gQnV0IEkgdGhpbmsgd2UncmUg
aW4gYmlnZ2VyIHRyb3VibGUgaWYgSVJRcyBpbmRlZWQKPiBlbmRlZCB1cCBlbmFibGVkIGF0IGFu
eSBvZiB0aGUgdHdvIHBvaW50cyB3aGVyZSB0aGlzIGZ1bmN0aW9uCj4gZ2V0cyBjYWxsZWQuCgpJ
IHRoaW5rIEknbSBtaXNyZWFkaW5nIHRoZSBhYm92ZSwgYnV0IGlmIHlvdSBleHBlY3QKYWRqdXN0
X2lycV9hZmZpbml0eSB0byBhbHdheXMgYmUgY2FsbGVkIHdpdGggaW50ZXJydXB0cyBkaXNhYmxl
ZCB1c2luZwpzcGluX3VubG9ja19pcnEgaXMgd3JvbmcgYXMgaXQgdW5jb25kaXRpb25hbGx5IGVu
YWJsZXMgaW50ZXJydXB0cy4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==

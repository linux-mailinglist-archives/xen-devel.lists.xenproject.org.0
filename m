Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 607946A513
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 11:41:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnJuk-00038k-Sw; Tue, 16 Jul 2019 09:38:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DxGA=VN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hnJuj-00038f-TB
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 09:38:25 +0000
X-Inumbo-ID: 74a0f5b9-a7ad-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 74a0f5b9-a7ad-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 09:38:24 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NLOE9/R9w0OvSDpxKDldIrIEiJALiGCN32fBiWoq+nae7CHsZUQ40w5c+qLNepvMCWDQOTT5A9
 KehA638278OYax2Tm+l0Mz3xQqoh5Llwig4HFCj/xRhD/UtRBR/MD6MOYh/97AQL34jEvkXlIC
 /G4dnia4JGFijlBE661yirOxnH9kT5P0v76VvPT/dxhk7Kv3ozhg9PukH6480torvjGuoDwxrq
 fPbvywDlVKJCCQSh+08D8kj+R2FW7oMDmiSHYopvDidj0heDS+XG9Q/y0+smho4FbCnSpVSiBE
 Z9k=
X-SBRS: 2.7
X-MesageID: 3066703
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,497,1557201600"; 
   d="scan'208";a="3066703"
Date: Tue, 16 Jul 2019 11:38:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Varad Gautam <vrd@amazon.de>
Message-ID: <20190716093812.sp5do22d4jjhdiub@Air-de-Roger.citrite.net>
References: <1562165173-31383-1-git-send-email-vrd@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1562165173-31383-1-git-send-email-vrd@amazon.de>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86: irq: Do not BUG_ON multiple unbind
 calls for shared pirqs
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Amit Shah <aams@amazon.de>, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDQ6NDY6MTNQTSArMDIwMCwgVmFyYWQgR2F1dGFtIHdy
b3RlOgo+IEl0IGlzIHBvc3NpYmxlIHRvIHJlY2VpdmUgbXVsdGlwbGUgX19waXJxX2d1ZXN0X3Vu
YmluZCBjYWxscyBmb3IgdGhlIHNhbWUgcGlycQo+IGlmIHRoZSBwaXJxIGhhcyBub3QgeWV0IGJl
ZW4gcmVtb3ZlZCBmcm9tIHRoZSBkb21haW4ncyBwaXJxX3RyZWUuIEZvciBhIHNoYXJlZAo+IHBp
cnEgKG5yX2d1ZXN0cyA+IDEpLCB0aGUgZmlyc3QgY2FsbCB6YXBzIHRoZSBjdXJyZW50IGRvbWFp
biBmcm9tIHRoZSBwaXJxJ3MKPiBndWVzdHNbXSBsaXN0LCBidXQgdGhlIGFjdGlvbiBoYW5kbGVy
IGlzIG5ldmVyIGZyZWVkIGFzIHRoZXJlIGFyZSBvdGhlciBndWVzdHMKPiB1c2luZyB0aGlzIHBp
cnEuIEFzIGEgcmVzdWx0LCBvbiB0aGUgc2Vjb25kIGNhbGwsIF9fcGlycV9ndWVzdF91bmJpbmQg
dHJpZXMKPiBzZWFyY2ggZm9yIHRoZSBjdXJyZW50IGRvbWFpbiB3aGljaCBoYXMgYmVlbiByZW1v
dmVkIGZyb20gdGhlIGd1ZXN0c1tdIGxpc3QsCj4gYW5kIGhpdHMgYSBCVUdfT04uCgpUaGFua3Mg
Zm9yIGRpZ2dpbmcgaW50byB0aGlzLCB0aGUgcGFzc3Rocm91Z2ggY29kZSBpcyBxdWl0ZSBjb21w
bGV4CmFuZCBub3QgZWFzeSB0byBkZWJ1Zy4KCkFzIHJhaXNlZCBieSBKYW4sIEknbSBub3Qgc3Vy
ZSBJIHNlZSBob3cgdGhlIGFib3ZlIGNhbiBoYXBwZW4uIEZvcgpQSVJRcyBib3VuZCB0byBldmVu
dCBjaGFubmVscyB0aGUgZnJlZWluZyBjYW4gb25seSBoYXBwZW4gb25jZSwgYXMKdGhlIGV2ZW50
IGNoYW5uZWwgaXMgYWZ0ZXJ3YXJkcyBjbG9zZWQgYW5kIGZ1cnRoZXIgY2FsbHMgd29uJ3QgbWFr
ZQpwcm9ncmVzcyAocmVnYXJkbGVzcyBvZiB3aGV0aGVyIHRoZSB1bmRlcmx5aW5nIFBJUlEgaXMg
c2hhcmVkIG9yIG5vdCkuCgpTbyBJIGFzc3VtZSB0aGlzIGlzIHNvbWV0aGluZyB0aGF0IHlvdSBo
YXZlIHNlZW4gd2l0aCBIVk0gZ3Vlc3RzIGFuZApkcGNpPwoKR2V0dGluZyB0aGUgZnVsbCB0cmFj
ZSB0aGF0IGxlYWRzIHRvIHRoZSBCVUdfT04gd291bGQgYmUgdmVyeQpoZWxwZnVsLCBiZWNhdXNl
IGFzIHBvaW50ZWQgb3V0IHRoaXMgaXMgbGlrZWx5IHNvbWV0aGluZyB0aGF0IHdhbnRzCnRvIGJl
IGZpeGVkIGluIHRoZSBjYWxsZXIgb2YgcGlycV9ndWVzdF91bmJpbmQuCgpEbyB5b3UgaGF2ZSBh
IHJlbGlhYmxlIHdheSB0byByZXByb2R1Y2U/Cgo+IEFsbG93IHhlbiB0byBjb250aW51ZSBpZiBh
IHNoYXJlZCBwaXJxIGhhcyBhbHJlYWR5IGJlZW4gdW5ib3VuZCBmcm9tIHRoaXMgZ3Vlc3QuCj4g
SXQgd2lsbCBiZSBjbGVhbmVkIHVwIGZyb20gdGhlIGRvbWFpbidzIHBpcnFfdHJlZSBkdXJpbmcg
dGhlIGRlc3RydWN0aW9uIGluCj4gY29tcGxldGVfZG9tYWluX2Rlc3Ryb3kuCj4gCj4gU2lnbmVk
LW9mZi1ieTogVmFyYWQgR2F1dGFtIDx2cmRAYW1hem9uLmRlPgo+IAo+IC0tLQo+IAo+IFRvIGFw
cGx5IHN0YWJsZS00LjExIG9ud2FyZHMuCgpEbyB5b3UgYWxzbyBoYXZlIGEgYmlzZWN0aW9uIG9m
IHdoZW4gdGhlIGlzc3VlIHdhcyBpbnRyb2R1Y2VkPwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

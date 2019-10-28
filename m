Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC8FE7006
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 11:54:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP2cU-0001pD-J9; Mon, 28 Oct 2019 10:51:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=datn=YV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iP2cT-0001p8-9S
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 10:51:29 +0000
X-Inumbo-ID: e3fe497e-f970-11e9-bbab-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3fe497e-f970-11e9-bbab-bc764e2007e4;
 Mon, 28 Oct 2019 10:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572259887;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=AxJ/BiBrZ6gXu9ZcGu+uLs8oMSBLonCa5ZyEgPfxnnM=;
 b=cIEYPzMQ+sE4TlRsv88iIWVcjubJOEZTTdYC0coyeIpSJ89LG9kQ7bQm
 cU9eH6BW+aC2vIP5Y7qcL8lsbkgAuwehk1w/za/50AsQKUwC4aQcaVcoE
 OHgAoEYThdJW+w+GRqRY8s82yF0+O5DH68cwXp9LDo9rDpx/vudT9iEUg 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VUBm9N1loSbaUhftDBiEGaujyegK897FaNS7zwEtWxsMFEd8q9y7c2r9p/6HJnRZBWxoTP+0lM
 nrJ/vCx5njWnE24NgFf+vANT+Ec8IaYpPHiFcsaPOboKSMbKNdMwhD6Cnn+ZSmXadjiZRVX9j6
 9fZKusyoEnRe12gZUSXfLKPxNoUvRPIM0o6B+2jqlAyL2JjUbzLFkbSKNILCqOPm5I8qJvIMnF
 3zokd9ALxVisBI2rUZjwaIiTdZgVvwnux/cjaj9QdWdsTzyKuUJddFEKEvQibdDAHD06Dgm8bE
 ioI=
X-SBRS: 2.7
X-MesageID: 7857242
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,239,1569297600"; 
   d="scan'208";a="7857242"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23990.51238.873917.651649@mariner.uk.xensource.com>
Date: Mon, 28 Oct 2019 10:51:18 +0000
To: Juergen Gross <jgross@suse.com>
In-Reply-To: <osstest-143234-mainreport@xen.org>
References: <osstest-143234-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [osstest test] 143234: regressions - FAIL
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIltvc3N0ZXN0IHRlc3RdIDE0MzIzNDogcmVn
cmVzc2lvbnMgLSBGQUlMIik6Cj4gZmxpZ2h0IDE0MzIzNCBvc3N0ZXN0IHJlYWwgW3JlYWxdCj4g
aHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0MzIzNC8K
PiAKPiBSZWdyZXNzaW9ucyA6LSgKPiAKPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5k
IGFyZSBibG9ja2luZywKPiBpbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoK
PiAgYnVpbGQtYXJtNjQteHNtICAgICAgICAgICAgIDxqb2Igc3RhdHVzPiAgICAgICAgICAgICAg
ICAgYnJva2VuICBpbiAxNDMwMTAKPiAgYnVpbGQtYXJtNjQteHNtICAgICAgICA0IGhvc3QtaW5z
dGFsbCg0KSBicm9rZW4gaW4gMTQzMDEwIFJFR1IuIHZzLiAxNDIyMTgKPiAgYnVpbGQtYXJtNjQg
ICAgICAgICAgICAgICAgIDxqb2Igc3RhdHVzPiAgICAgICAgICAgICAgICAgYnJva2VuICBpbiAx
NDMwMzEKPiAgYnVpbGQtYXJtNjQgICAgICAgICAgICA0IGhvc3QtaW5zdGFsbCg0KSBicm9rZW4g
aW4gMTQzMDMxIFJFR1IuIHZzLiAxNDIyMTgKPiAgdGVzdC1hbWQ2NC1hbWQ2NC14bC1xY293MiAg
IDE5IGd1ZXN0LXN0YXJ0L2RlYmlhbi5yZXBlYXQgZmFpbCBSRUdSLiB2cy4gMTQyMjE4Cj4gIHRl
c3QtYW1kNjQtYW1kNjQtbGlidmlydC12aGQgMTcgZ3Vlc3Qtc3RhcnQvZGViaWFuLnJlcGVhdCBm
YWlsIFJFR1IuIHZzLiAxNDIyMTgKPiAgdGVzdC1hbWQ2NC1pMzg2LXhsLXJhdyAgICAgIDE5IGd1
ZXN0LXN0YXJ0L2RlYmlhbi5yZXBlYXQgZmFpbCBSRUdSLiB2cy4gMTQyMjE4Cj4gIHRlc3QtYXJt
aGYtYXJtaGYteGwtdmhkICAgICAxNSBndWVzdC1zdGFydC9kZWJpYW4ucmVwZWF0IGZhaWwgUkVH
Ui4gdnMuIDE0MjIxOAo+ICB0ZXN0LWFybWhmLWFybWhmLWxpYnZpcnQtcmF3IDE1IGd1ZXN0LXN0
YXJ0L2RlYmlhbi5yZXBlYXQgZmFpbCBSRUdSLiB2cy4gMTQyMjE4Cj4gCj4gVGVzdHMgd2hpY2gg
YXJlIGZhaWxpbmcgaW50ZXJtaXR0ZW50bHkgKG5vdCBibG9ja2luZyk6Cj4gIHRlc3QtYW1kNjQt
YW1kNjQtcWVtdXUtbmVzdGVkLWludGVsICA3IHhlbi1ib290ICBmYWlsIGluIDE0MzAxMCBwYXNz
IGluIDE0MzIzNAo+ICB0ZXN0LWFtZDY0LWkzODYtcWVtdXUtcmhlbDZodm0taW50ZWwgMTIgZ3Vl
c3Qtc3RhcnQvcmVkaGF0LnJlcGVhdCBmYWlsIGluIDE0MzAxMCBwYXNzIGluIDE0MzIzNAo+ICB0
ZXN0LWFtZDY0LWFtZDY0LXhsLXJ0ZHMgICAgIDE4IGd1ZXN0LWxvY2FsbWlncmF0ZS94MTAgICAg
IGZhaWwgcGFzcyBpbiAxNDMwMTAKPiAgdGVzdC1hcm1oZi1hcm1oZi14bC1ydGRzICAgICAxNiBn
dWVzdC1zdGFydC9kZWJpYW4ucmVwZWF0ICBmYWlsIHBhc3MgaW4gMTQzMDMxCj4gIHRlc3QtYW1k
NjQtYW1kNjQteGwtcHZzaGltICAgMTggZ3Vlc3QtbG9jYWxtaWdyYXRlL3gxMCAgICAgZmFpbCBw
YXNzIGluIDE0MzE2MAoKSSdtIHByZXR0eSBzdXJlIHRoaXMgaXMgdGhlIHVuZGVybHlpbmcgaGVp
c2VuYnVnIHdlIGN1cnJlbnRseSBoYXZlIGluCi11bnN0YWJsZS4gIEl0IGNlcnRhaW5seSBpc24n
dCBhbnl0aGluZyB0byBkbyB3aXRoCiBmODM3OTNjMiAgb3JpZ2luL3ByZXRlc3QgVG9vbHN0YWNr
L3hsOiBXcmFwIGEgbG9uZyBjb21tYW5kCiBlYTY2MjZmNyAgZ3Vlc3RfcHJlcGFyZV9kaXNrOiBP
bmx5IGRvIHRoZSB1bW91bnQgaWYgd2Ugc2V0IGFuIGVudiB2YXIKIGZjNGJiM2QwICBjcy1hZGp1
c3QtZmxpZ2h0OiBQcm92aWRlIHJ1bnZhci1zZXQtZGVmYXVsdApzbyBJIGFtIGdvaW5nIHRvIGZv
cmNlIHB1c2ggdGhpcyBzbyBJIGNhbiBzZW5kIHRoZSBuZXh0IGJhdGNoLgoKSWFuLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

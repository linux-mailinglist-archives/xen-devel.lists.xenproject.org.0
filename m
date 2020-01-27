Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0149814A7D5
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 17:12:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw6wm-0004UW-M3; Mon, 27 Jan 2020 16:09:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ksAf=3Q=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iw6wl-0004UR-II
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 16:09:07 +0000
X-Inumbo-ID: 57186b4c-411f-11ea-856f-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57186b4c-411f-11ea-856f-12813bfff9fa;
 Mon, 27 Jan 2020 16:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580141346;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=NwpfwlRawRHFdcw/i9/ZqqrHL6w2KLfIqA5o1jqyWvI=;
 b=My+e+/DyFpaGVdr4dn/FbBcFLrskIj3XKkdNZHT8eStvq03GF6Q0q1yV
 JRbTFyldsw2MrwtPK/N7heteStyYE2iodZpaOYBDfV7EIZC3KXWQszHWm
 OR53hfi1rNZKujchyy+sIsATeVqZxFJjotjDm2L+xapLteODX56EsUZO3 w=;
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
IronPort-SDR: al9YnNMsdZxG5VUAfnwhczOsecNgnDA/dCCUvtkDKDEwpw4Vtks5/W103b/i65DcMalaw3QbIC
 Vk/K6lrH2uhugmAgSGmegLNmWEcTCaEn2KqtzcFGVX9eTqX0fPnrxYE3EQ7UZWWPWhUToaIjgH
 HU8sJU4UnKZF69Y49YQwvN1PNG+36a7I1RcXsZKNdy1V6kJVBHZ9i5FYgcxw79UjTYd33sB8hh
 63LX/8x5Bu97pFh5+G0ftDU5Xa7GMa5sdhk9THI1Rj/r9RQLur8nm7MU6OWl0N3JAR98KMvsvu
 xg8=
X-SBRS: 2.7
X-MesageID: 11672138
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="11672138"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24111.2845.840174.397490@mariner.uk.xensource.com>
Date: Mon, 27 Jan 2020 16:09:01 +0000
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "George
 Dunlap" <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>, Anthony Perard
 <anthony.perard@citrix.com>
In-Reply-To: <20200117144726.582-1-ian.jackson@eu.citrix.com>
References: <20200117144726.582-1-ian.jackson@eu.citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v3 00/10] libxl: event: Fix hang for some
 applications
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gd3JpdGVzICgiW1BBVENIIHYzIDAwLzEwXSBsaWJ4bDogZXZlbnQ6IEZpeCBo
YW5nIGZvciBzb21lIGFwcGxpY2F0aW9ucyIpOgo+IFRoZSBtZWF0IGhlcmUsIGluY2x1ZGluZyBh
IGRlc2NyaXB0aW9uIG9mIHRoZSBidWcsIGlzIGluOgo+ICAgbGlieGw6IGV2ZW50OiBGaXggaGFu
ZyB3aGVuIG1peGluZyBibG9ja2luZyBhbmQgZXZlbnR5IGNhbGxzCj4gCj4gVGhpcyBpcyBhbGwg
bm93IFJldmlld2VkLWJ5IGFuZCBUZXN0ZWQtYnkgR2VvcmdlLCBzbyBpdCBpcyByZWFkeSB0byBi
ZQo+IGNvbW1pdHRlZC4gIEJ1dCBJIHdpbGwgYmUgYXdheSBmb3IgYSBiaXQgc29vbiBhbmQgcmV2
ZXJ0aW5nIHNvbWV0aGluZwo+IG9mIHRoaXMgZm9ybSBpcyBwcm9iYWJseSB1bmRlc2lyYWJsZS4g
IFNvIEkgd2lsbCBjb21taXQgdGhpcyBpbgo+IHNvbWV0aGluZyBvdmVyIGEgd2VlayAoYXNzdW1p
bmcgbm8gZnVydGhlciBjb21tZW50cyBhcmlzZSkuCj4gCj4gVGhlIGNoYW5nZXMgaGVyZSBmcm9t
IHYyIGFyZSBvbmx5IHRvIHR3byBvZiB0aGUgY29tbWl0IG1lc3NhZ2VzCj4gKG1hcmtlZCBtIGlu
IHRoZSBsaXN0IGJlbG93KS4KPiAKPiBJIGFtIG5vdCBzdXJlIHdoZXRoZXIgdGhpcyBzZXJpZXMg
aXMgYSBiYWNrcG9ydCBjYW5kaWRhdGUuICBJdCBpcyBub3QKPiBpbXBvc3NpYmxlIHRoYXQgdGhl
IGJ1ZyB3ZSBhcmUgZml4aW5nIGhlcmUgaXMgYWZmZWN0aW5nIChzYXkpIGxpYnZpcnQuCj4gQnV0
IGlmIHNvIHByZXN1bWFibHkgbm90IGluIGEgc2lnbmlmaWNhbnQgd2F5IGFzIHdlIGhhdmVuJ3Qg
c2Vlbgo+IHJlcG9ydHMuICBTbyBldmVuIHRob3VnaCB0aGlzIGlzIGEgYnVnZml4LCBJJ20gc2Nl
cHRpY2FsLgoKSSBoYXZlIHB1c2hlZCB0aGlzIG5vdy4KCklhbi4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BCAC2375
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 16:37:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEwkU-0003A2-RG; Mon, 30 Sep 2019 14:34:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QDh0=XZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iEwkT-00039x-Ed
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 14:34:01 +0000
X-Inumbo-ID: 57029b03-e38f-11e9-96d5-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id 57029b03-e38f-11e9-96d5-12813bfff9fa;
 Mon, 30 Sep 2019 14:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569854039;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4mtZz+PDRcdnDSGAXMVrFAHhS6GlsQRRBUVcaoLSniU=;
 b=QAuUIuZBYrgAYXvVrZG9kYHFynTvMYYgI/Z2ylKqHdjB0lwzE9090DZ0
 Jvm3vndSbsoqbVeW8NKoA3z79cbDsODc3wvtDO9hwIlnlAHx/IM7MHeQd
 7CVhOuGWfWU5+uEsHPK4vhvMBPMzD7KtY1qqrK6EAG2cER+eRezkVyjUR 0=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: O5UUVarxANJWJBRFzp9dUAMBkYK6U65QrLYZC5mkM8H6W8bX2B/HFdKMLyDG9+z+q9NXVOcfB8
 GKbKdabOJ9IOa4FXK5DRQMSAMWeZcmYvh+t+S/SuxSybJtf79kjNIXd+26UciTQ4uCaM9l+39H
 ELaeFq+CQCDp4pskwMNNUW1s4x4DsRVjpfaO7svUZkHfPa9eR4QN2mATRg1YY1lf9kpB0tEMr/
 YaEkG8o/gdMf34bVc0x+hS2UOcx6tD0VABq69PF9GUDc6JXId39rYu3B+k+tLOJABqo6cOiqc3
 lK8=
X-SBRS: 2.7
X-MesageID: 6543053
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,567,1559534400"; 
   d="scan'208";a="6543053"
Date: Mon, 30 Sep 2019 15:33:56 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <20190930143356.GD1163@perard.uk.xensource.com>
References: <cover.ab9be47e05c2dc2aa047d0a810c29ecd14bfe463.1569680095.git-series.marmarek@invisiblethingslab.com>
 <9a61b361c46b5b1082ef47ac6aa25f8b5db7646b.1569680095.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9a61b361c46b5b1082ef47ac6aa25f8b5db7646b.1569680095.git-series.marmarek@invisiblethingslab.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [PATCH v8 1/4] libxl: fix cold plugged PCI device
 with stubdomain
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCBTZXAgMjgsIDIwMTkgYXQgMDQ6MjA6MzRQTSArMDIwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IFdoZW4gbGlieGxfX2RldmljZV9wY2lfYWRkKCkgaXMgY2Fs
bGVkLCBzdHViZG9tYWluIGlzIGFscmVhZHkgcnVubmluZywKPiBldmVuIHdoZW4gc3RpbGwgY29u
c3RydWN0aW5nIHRoZSB0YXJnZXQgZG9tYWluLiBQcmV2aW91c2x5LCBkb19wY2lfYWRkKCkKPiB3
YXMgY2FsbGVkIHdpdGggJ3N0YXJ0aW5nJyBoYXJkY29kZWQgdG8gZmFsc2UsIGJ1dCBub3cgZG9f
cGNpX2FkZCgpIHNoYXJlcwo+ICdzdGFydGluZycgZmxhZyBpbiBwY2lfYWRkX3N0YXRlIGZvciBi
b3RoIHRhcmdldCBkb21haW4gYW5kIHN0dWJkb21haW4uCj4gCj4gRml4IHRoaXMgYnkgcmVzZXR0
aW5nIChsb2NhbCkgJ3N0YXJ0aW5nJyB0byBmYWxzZSBpbiBwY2lfYWRkX2RtX2RvbmUoKQo+IChw
cmV2aW91c2x5IHBhcnQgb2YgZG9fcGNpX2FkZCgpKSB3aGVuIGhhbmRsaW5nIHN0dWJkb21haW4s
IHJlZ2FyZGxlc3MKPiBvZiBwYXMtPnN0YXJ0aW5nIHZhbHVlLgo+IAo+IEZpeGVzOiAxMWRiNTZm
OWE2IChsaWJ4bF9wY2k6IFVzZSBsaWJ4bF9fYW9fZGV2aWNlIHdpdGggbGlieGxfX2RldmljZV9w
Y2lfYWRkKQo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFy
bWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KClJldmlld2VkLWJ5OiBBbnRob255IFBFUkFS
RCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KClRoYW5rcywKCi0tIApBbnRob255IFBFUkFS
RAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

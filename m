Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA0C166471
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 18:23:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4pU5-0005eR-W8; Thu, 20 Feb 2020 17:19:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FovI=4I=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j4pU4-0005eM-IB
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 17:19:32 +0000
X-Inumbo-ID: 27dd9ade-5405-11ea-8568-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27dd9ade-5405-11ea-8568-12813bfff9fa;
 Thu, 20 Feb 2020 17:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582219171;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=p6YJcJNss1vSFQhON/LA8GoXYEW/sz2MVkU9rJQwIyM=;
 b=akmn8vx+pOGIcs9jZin07On011QIwaegRKLdxB0MHtpMlgjDcfgMLH5Y
 HZRU8GKMhIRF5IxbBki1D2GfEtl8BUVLkU7eYn39uqiyOQNjW9l03PuzN
 CpC+CUAmuaoQuWJsYlzKuDxTfxogGWcV4bJKaUWJID9nHZCbPmwZyqjQQ I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: idwC/mej1Pm7m44WXdrMSINZXRgZAOronwTqAskDh5GuCJoeLQFrclE4O/kN66TFhFI5KlGpLE
 tFC8pgBhxIg2bQMv8RDCX5AlgaB5f9gMJzJI4I0woo9SGs3hlaVCTWJjDHfcKxK2IE/4DLZ+N1
 W8hQ6yY56ayAg42Xf4CCwMulPUkRVq1OJzDuCIYLTxhh3zAULOtq9g1mu8K4vwUjJUPQ4kGDUO
 95P3BupEzmVPBwGBuZZtx14sX/7uXSHA0WVxnG+MjoDphPy8cXWJ9UtlsiYkIvkJB6Obo2m1BQ
 u0I=
X-SBRS: 2.7
X-MesageID: 13127504
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,465,1574139600"; d="scan'208";a="13127504"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24142.49055.940548.14260@mariner.uk.xensource.com>
Date: Thu, 20 Feb 2020 17:19:27 +0000
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
In-Reply-To: <5dfcf708db764fd1bb970cae54321c9a@EX13D32EUC003.ant.amazon.com>
References: <20200219093754.2924-1-pdurrant@amazon.com>
 <20200219093754.2924-2-pdurrant@amazon.com>
 <24142.45469.349140.521462@mariner.uk.xensource.com>
 <46a3c93352de4e07b33263c9fb7f37bf@EX13D32EUC003.ant.amazon.com>
 <24142.47029.435605.456811@mariner.uk.xensource.com>
 <5dfcf708db764fd1bb970cae54321c9a@EX13D32EUC003.ant.amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v6 1/6] libxl: add infrastructure to track
 and query 'recent' domids
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVycmFudCwgUGF1bCB3cml0ZXMgKCJSRTogW1BBVENIIHY2IDEvNl0gbGlieGw6IGFkZCBpbmZy
YXN0cnVjdHVyZSB0byB0cmFjayBhbmQgcXVlcnkgJ3JlY2VudCcgZG9taWRzIik6Cj4gTm90IGJl
aW5nIGNvLWxvY2F0ZWQgbWFrZXMgdGhpcyBzb21ld2hhdCB0cmlja3k7IEkgdGhpbmsgaXQgd2ls
bCBiYXNpY2FsbHkgc3RpbGwgY29tZSBkb3duIHRvIG1lIHdyaXRpbmcgc29tZSBjb2RlIGFuZCB0
aGVuIHlvdSBzYXlpbmcgd2hldGhlciB0aGF0J3Mgd2hhdCB5b3UgbWVhbnQuLi4gdW5sZXNzIHlv
dSBjYW4gd3JpdGUgc29tZSAocHNldWRvLSljb2RlIHRvIGlsbHVzdHJhdGU/IEkgdGhpbmssIGZy
b20gd2hhdCB5b3Ugc2F5IGJlbG93LCBJIG1pZ2h0IG5vdyBoYXZlIGEgYmV0dGVyIGlkZWEgb2Yg
d2hhdCB5b3Ugd2FudCBzbyBsZXQncyBoYXZlIG9uZSBtb3JlIGdvLWFyb3VuZCBvZiBtZSB3cml0
aW5nIHRoZSBjb2RlIGZpcnN0IDotKQoKT0suCgo+IFtJYW46XQo+ID4gSSB0aGluayB0aGUgcGF0
aCBuZWVkcyB0byBiZSBwYXNzZWQgaW50byB0aGVzZSBmdW5jdGlvbnMuICBUaGlzIGlzIHdoeQo+
ID4gSSB0aGluayB0aGUgZnVuY3Rpb25zIG5lZWQgdG8gdGFrZSBhIHN0cnVjdCogYXMgYW4gYXJn
dW1lbnQsIGZvciB0aGVpcgo+ID4gc2hhcmVkIHN0YXRlIChpbmNsdWRpbmcgdGhlIHBhdGggYW5k
IHRoZSBvdGhlciBzdHVmZikuCj4gCj4gT2ssIGlmIHRoYXQncyB0aGUgc3R5bGUgeW91IHByZWZl
ciBJJ2xsIHJlLXN0cnVjdHVyZSBpdCB0aGF0IHdheS4KCk15IGJvdHRvbSBsaW5lIG9uIHRoaXMg
YXNwZWN0IG9mIGNvZGUgc3RydWN0dXJlIGlzIHRoYXQgSSB3YW50IGVhY2gKdGhpbmcgdG8gYmUg
d3JpdHRlbiBvbmx5IG9uY2UuCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=

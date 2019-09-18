Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23285B6609
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 16:26:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAas2-0000vX-TJ; Wed, 18 Sep 2019 14:23:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XtMR=XN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iAas1-0000vS-71
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 14:23:49 +0000
X-Inumbo-ID: edbbc7d6-da1f-11e9-978d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id edbbc7d6-da1f-11e9-978d-bc764e2007e4;
 Wed, 18 Sep 2019 14:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568816629;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=clMg3QpaUvlFXjbYyxlbF/o1yqDUmkLAebMJfXqHizw=;
 b=PrPiEQ89LGsClSCjLKXhjfZ1Ka9SUsz4dUfPiteZ73GvHfWNfZiOAFnf
 yCMJWxgxzr8xoKWTEvBliX+Jx3SQMpjcaQxQNpCQKQDxfFAUvxonnBDCO
 mGh8duXMsXBGuFV2PvkCpS5aHXCWJl4R8XXdIxo8g4ASEHVxIu2l/faDb g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: f77m+y6PaAQtn7yVI3Ti5XBEkNCF42bksoekbanIfqNwEQirFlF1A/z3/3qztYRDggDcuhaZil
 Nd+gIfdRm/vcyQe4mSXYn4q9sEw8s+F4kjVvRbxwB5b/xs3vIL+TLQPjNQCYGgXn+ARvDqg417
 Au9GVIUGo9f5BhnqWDFv9Iv8lhJfNlewYcz5JRhDicmPNIPoWCY6STtCiQzBLcKlXPQ3/SZiMM
 2Rb6JD32oKMio4rVrxGtF2YrcgKyh3FP3JxppOdo4ehYCL32bdB+Q30FfDk7qvWd20y/0xerUH
 Td0=
X-SBRS: 2.7
X-MesageID: 5789485
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,520,1559534400"; 
   d="scan'208";a="5789485"
Date: Wed, 18 Sep 2019 15:23:45 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190918142345.GN1308@perard.uk.xensource.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-29-anthony.perard@citrix.com>
 <23937.5522.999447.418653@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23937.5522.999447.418653@mariner.uk.xensource.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH 28/35] libxl_pci: Use ev_qmp in do_pci_add
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMDY6MTk6MTRQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDI4LzM1XSBsaWJ4bF9wY2k6IFVz
ZSBldl9xbXAgaW4gZG9fcGNpX2FkZCIpOgo+ID4gVGhpcyBwYXRjaCBhbHNvIHJlcGxhY2VzIHRo
ZSB1c2Ugb2YKPiA+IGxpYnhsX193YWl0X2Zvcl9kZXZpY2VfbW9kZWxfZGVwcmVjYXRlZCgpIGJ5
IGl0cyBlcXVpdmFsZW50Cj4gPiB3aXRob3V0IHRoZSBuZWVkIGZvciBhIHRocmVhZC4KPiAKPiBB
Z2Fpbiwgd291bGQgaXQgYmUgZWFzeSB0byBhZGQgYSBwcmUtcGF0Y2ggc28gSSBjYW4gc2VlIHRo
ZSBjb2RlCj4gY2hhbmdlcyA/ICBJZiBub3QgSSB3aWxsIGNvbXBhcmUgbGluZS1ieS1saW5lIGJ5
IGhhbmQuCgpJdCBkb2Vzbid0IGxvb2sgdG8gaGFyZCwgSSBnaXZlIGl0IGEgdHJ5LgoKLS0gCkFu
dGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E616FBF6D9
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 18:40:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDWl6-0007ov-OC; Thu, 26 Sep 2019 16:36:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1cs6=XV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iDWl5-0007oq-Ef
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 16:36:47 +0000
X-Inumbo-ID: d45385ec-e07b-11e9-bf31-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id d45385ec-e07b-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 16:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569515806;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Bs3o101iWqySTkEz7SFuLt1LBjFTPR665iFTVUcl6og=;
 b=UR5MnhLfCxZBhqliReDnaelRCsk9LVq8JEE3yrc/JjNBordHrvzSOKfU
 +PclwdyLoaw/VtvOylKECf+lJ+F4x4XVndqSYDf07LsHZA4QDcF1YrOfT
 xn9wJ4YKOwJL1HyjvWm4+/+DgMs5Tn0llh841fB6i1je9cbhCwHepLOg/ s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: h+moHF3hmZQRFPInzXb2ifjLZslv0JCynmRWg/48eUGTya3ND9JY+nRQdX7MMelo4U1Py4oDrd
 n4sb1lkYH+F3m5Vfl6UpSLVXHA+SN/z17Le+Zl9VVrMpKVLcJkCnUYF07YOZnuHZi9GlvwE3Go
 RP3sWKy9ksvdSW+yeGfgRE4WDUJBaz1WR/7lXPfCwvDxavlYeO2yA8BcAgP4BKCXR+2Jsl1smR
 So7ivk8o9ca8l2mbk6UajtSXuycW8GB8DAvAq+qMlovkUiD3ZIp/afdBgCiZ7PT5DJjkAQnuPT
 rUA=
X-SBRS: 2.7
X-MesageID: 6198116
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,552,1559534400"; 
   d="scan'208";a="6198116"
Date: Thu, 26 Sep 2019 18:36:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190926163623.mk5t6s2xe7ahvvvy@Air-de-Roger>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-7-roger.pau@citrix.com>
 <d82bc404-c417-591d-d436-461b8100c44d@suse.com>
 <20190926111404.co5krpzvbf5k5oq3@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190926111404.co5krpzvbf5k5oq3@Air-de-Roger>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 06/11] ioreq: allow dispatching ioreqs to
 internal servers
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul.durrant@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMDE6MTQ6MDRQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBGcmksIFNlcCAyMCwgMjAxOSBhdCAwMTozNToxM1BNICswMjAwLCBKYW4g
QmV1bGljaCB3cm90ZToKPiA+IE9uIDAzLjA5LjIwMTkgMTg6MTQsIFJvZ2VyIFBhdSBNb25uZSB3
cm90ZToKPiA+IEEgcG9zc2libGUgY29uc2VxdWVuY2Ugb2YgdGhlIGFuc3dlcnMgdG8gdGhpcyBt
aWdodCBiZSBmb3IKPiA+IHRoZSBob29rJ3MgbWlkZGxlIHBhcmFtZXRlciB0byBiZSBjb25zdGlm
aWVkIChpbiBwYXRjaCA0KS4KPiAKPiBZZXMsIEkgdGhpbmsgaXQgY2FuIGJlIGNvbnN0aWZpZWQu
CgpObywgaXQgY2FuJ3QgYmUgY29uc3RpZmllZCBiZWNhdXNlIHRoZSBoYW5kbGVyIG5lZWRzIHRv
IGZpbGwKaW9yZXEtPmRhdGEgZm9yIHJlYWQgcmVxdWVzdHMuCgpSb2dlci4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

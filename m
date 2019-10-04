Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 501BECC1BC
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 19:29:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGRLC-0007BU-3K; Fri, 04 Oct 2019 17:26:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UhcM=X5=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iGRL9-0007BH-Ul
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 17:26:03 +0000
X-Inumbo-ID: 09d7bd0e-e6cc-11e9-9bee-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09d7bd0e-e6cc-11e9-9bee-bc764e2007e4;
 Fri, 04 Oct 2019 17:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570209964;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CuKH6DKLVyVlBFgQqNXO/ukLR2TJBsHcyK2zSU/4Frk=;
 b=f33p+fGgtyAQaU0gXEqqgxVJHZyQ5GvacXIPrfwZDuGu9uDKs5P5KkSh
 3zEYLv33duuTuiNikgn5zzw44BZQ5/xRLAljBBq7LGenTNMQJmUCgkqz9
 O8WdGjfpXM8/WH55qnXnyrA9ETHYsahtxMgXpQka3l0sGLEmowPODgzlH Q=;
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
IronPort-SDR: uqc2XZ/W9yM/TYIDK4b5FV4QZmI4QS4nZMtLsPyZ2wOT/h8YsE7qz9PHp84NUldKOTGO7ZkJWz
 a3A+fajKH1NkS1bHzwYs0dvO7GEsKENQR52zY38qv9ZDiuNvsPP4aPuH3RWBXtzlTxUaLYRnQ/
 KnzMxgKnOgSYilyuAoS+1JI1uCVpdZINELL67lTM9lno+JlX+NxVVSbQO2DVZDQNzAKz6HKAGg
 /n1SNm91fUupCz/kWIBtr7I0G/BbIpRwvMzqiQC3HkSRUqUKwSgDUv+/aRp1GFQw/2wyRl/rBs
 Bec=
X-SBRS: 2.7
X-MesageID: 6559098
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,257,1566878400"; 
   d="scan'208";a="6559098"
Date: Fri, 4 Oct 2019 18:25:59 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20191004172559.GQ1163@perard.uk.xensource.com>
References: <20191004151707.24844-1-ian.jackson@eu.citrix.com>
 <20191004151707.24844-4-ian.jackson@eu.citrix.com>
 <20191004155349.GM1163@perard.uk.xensource.com>
 <23959.28043.718413.994044@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23959.28043.718413.994044@mariner.uk.xensource.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 3/6] libxl:
 libxl__domain_config_setdefault: New function
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMDU6MDQ6MjdQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtYRU4gUEFUQ0ggZm9yLTQuMTMgMy82
XSBsaWJ4bDogbGlieGxfX2RvbWFpbl9jb25maWdfc2V0ZGVmYXVsdDogTmV3IGZ1bmN0aW9uIik6
Cj4gPiBPbiBGcmksIE9jdCAwNCwgMjAxOSBhdCAwNDoxNzowNFBNICswMTAwLCBJYW4gSmFja3Nv
biB3cm90ZToKPiA+ID4gKyAgICBsaWJ4bF9fZG9tYWluX2NvbmZpZ19zZXRkZWZhdWx0KGdjLGRf
Y29uZmlnLGRvbWlkKTsKPiA+IAo+ID4gU2hvdWxkbid0IHlvdSBjaGVjayBmb3IgZXJyb3IgPwo+
IAo+IEJsaW1leSwgeWVzISAgVGhhbmtzIQoKV2l0aCB0aGF0IGZpeGVkOgpSZXZpZXdlZC1ieTog
QW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgotLSAKQW50aG9ueSBQ
RVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

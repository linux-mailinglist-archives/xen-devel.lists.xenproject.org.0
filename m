Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C895FCDE92
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 12:00:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHPlV-0003K9-SL; Mon, 07 Oct 2019 09:57:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RuAa=YA=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iHPlT-0003Jk-OW
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 09:57:15 +0000
X-Inumbo-ID: d6a174ec-e8e8-11e9-97aa-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6a174ec-e8e8-11e9-97aa-12813bfff9fa;
 Mon, 07 Oct 2019 09:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570442234;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=fOFpHgnsBONbgKdfwHYF6h8Ks5FI1ZzdLb86UAgXtkU=;
 b=EU9qUIQqZT70zHAaJ7FIOQdbBb8mYAhOMAM6GWVOZzqK85jqdkVQmeMO
 eEdqr1tjpdhj3u/TAC3utk/1lzPQGLd1uqjPlmUfRpQET+AOp3NpwOrbK
 ZYZVDKxAPGITv7VNXDpfnbheExlSzuLoah8oUb5mycqXJwyPJP1rZ6BQE s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 58RvtfRB12YT20sruT0CffFyDfQF7RZ2/vjjOqZvn5xHlod++ilOgRxkrp0Qwx8UmFsJ3bUShu
 vlQVwrkBiwti9NOsWhCP8Q69okcuXxKAgMY1wxXHl3aIGcitJev13VSr12mFrv7X5P8BHBQ+X7
 DKFRIPqCK2zaSPpTZY/1e2pCf/35TGzpZvyrCsbLBPSWw+Oa/9sCOfg7595kVz7FcjUAvXxixR
 0LJSmFgrXAe92gUHlZYGuvJUyZEpxd2BvQP7eZnboQyjWmwqph/k0vd4ECCezSJN5EzZMBvLly
 g3w=
X-SBRS: 2.7
X-MesageID: 6542992
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,267,1566878400"; 
   d="scan'208";a="6542992"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23963.3063.218048.849785@mariner.uk.xensource.com>
Date: Mon, 7 Oct 2019 10:57:11 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191004172559.GQ1163@perard.uk.xensource.com>
References: <20191004151707.24844-1-ian.jackson@eu.citrix.com>
 <20191004151707.24844-4-ian.jackson@eu.citrix.com>
 <20191004155349.GM1163@perard.uk.xensource.com>
 <23959.28043.718413.994044@mariner.uk.xensource.com>
 <20191004172559.GQ1163@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtYRU4gUEFUQ0ggZm9yLTQuMTMgMy82XSBsaWJ4
bDogbGlieGxfX2RvbWFpbl9jb25maWdfc2V0ZGVmYXVsdDogTmV3IGZ1bmN0aW9uIik6Cj4gT24g
RnJpLCBPY3QgMDQsIDIwMTkgYXQgMDU6MDQ6MjdQTSArMDEwMCwgSWFuIEphY2tzb24gd3JvdGU6
Cj4gPiBBbnRob255IFBFUkFSRCB3cml0ZXMgKCJSZTogW1hFTiBQQVRDSCBmb3ItNC4xMyAzLzZd
IGxpYnhsOiBsaWJ4bF9fZG9tYWluX2NvbmZpZ19zZXRkZWZhdWx0OiBOZXcgZnVuY3Rpb24iKToK
PiA+ID4gU2hvdWxkbid0IHlvdSBjaGVjayBmb3IgZXJyb3IgPwo+ID4gCj4gPiBCbGltZXksIHll
cyEgIFRoYW5rcyEKPiAKPiBXaXRoIHRoYXQgZml4ZWQ6Cj4gUmV2aWV3ZWQtYnk6IEFudGhvbnkg
UEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKVGhhbmtzLgoKSSB0aGluayB0aGUg
dGhpbmdzIHlvdSBzcG90dGVkIGluIHRoaXMgcmV2aWV3IG1lYW5zIEkgc2hvdWxkIGdvCnRocm91
Z2ggdGhpcyBzZXJpZXMgYWdhaW4sIGFuZCB0cnkgdG8gdGVzdCBpdCBzb21laG93LiAgSSB3aWxs
IGRvIHRoYXQKYW5kIHRoZW4gc2VuZCBhIHYyLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

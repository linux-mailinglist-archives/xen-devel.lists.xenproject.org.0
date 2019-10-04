Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EF9CC019
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 18:05:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGQ3X-0007Uo-RT; Fri, 04 Oct 2019 16:03:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lQ+Z=X5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iGQ3W-0007Uh-H4
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 16:03:46 +0000
X-Inumbo-ID: 8b1be608-e6c0-11e9-8c93-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b1be608-e6c0-11e9-8c93-bc764e2007e4;
 Fri, 04 Oct 2019 16:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570205025;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=f8JGZ2z6xTjEUZgH8RbWrZ/1L0tiP5fQ6SQtAJzNw/I=;
 b=Mz5sgbSgo4ySB1eZKPvOAxBs2gIyScfrXNmoaZ2Bw9Jj3a3N7E65WThO
 bcRhPtQ2G1aDnpX5bNk7Ng2HD6sHQ5+/qMKaxrcziuHZYNdeEhpUJnoxc
 kq0KS6jxBP1ZuD/uBIR1vmakeSshrpBHfcTsZS2G7ArfDKHjnfkcueC6U 0=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pgVFfauHrLcgs0fvp9ODP6SSxDae9vmVLAJb7xZrQuxeSpSYG0vipe4S2+IVZURsKXqt8x1lNI
 1z/6utr6l8cofvUHGhQEpM29y59feTG4kgzrUR1o333hKjaEvqzd9oJi0J7k6l7r7j0wUnpkK2
 v9fERXUPgFuQ/U3ijyt/+DefHtnx5kcaPMSkXBtZuHl5btLGa/26jg+AcKkj1mjz2nVXILObTd
 FiW92sGoS+Pr59yD/qZjEGkimbeaCYDE0PahCtH0AncIJj6PgDbd+R0JHjkRh5QBOnVSse+03P
 pYE=
X-SBRS: 2.7
X-MesageID: 6782061
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,256,1566878400"; 
   d="scan'208";a="6782061"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23959.27998.556618.462793@mariner.uk.xensource.com>
Date: Fri, 4 Oct 2019 17:03:42 +0100
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
In-Reply-To: <ad3306d7-6567-a8f1-7cb5-c408fba20934@suse.com>
References: <cover.ab9be47e05c2dc2aa047d0a810c29ecd14bfe463.1569680095.git-series.marmarek@invisiblethingslab.com>
 <9a61b361c46b5b1082ef47ac6aa25f8b5db7646b.1569680095.git-series.marmarek@invisiblethingslab.com>
 <23956.50605.996440.673345@mariner.uk.xensource.com>
 <ad3306d7-6567-a8f1-7cb5-c408fba20934@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SsO8cmdlbiBHcm/DnyB3cml0ZXMgKCJSZTogW1BBVENIIHY4IDEvNF0gbGlieGw6IGZpeCBjb2xk
IHBsdWdnZWQgUENJIGRldmljZSB3aXRoIHN0dWJkb21haW4iKToKPiBPbiAwMi4xMC4xOSAxNzo0
MywgSWFuIEphY2tzb24gd3JvdGU6Cj4gPiBIaSBKdWVyZ2VuLiAgVGhpcyBzZXJpZXMKPiA+ICAg
IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAx
OS0wOS9tc2cwMzA3Mi5odG1sCj4gPiBuZWVkcyB5b3VyIHJlbGVhc2UgcmV2aWV3Lgo+IAo+IEZp
ciB0aGUgc2VyaWVzOgo+IAo+IFJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KClRoYW5rcy4gIEkgaGF2ZSBwdXNoZWQgdGhpcyAoYW5kIGFkZGVkIGEgY291
cGxlIG9mIGFja3Mgb2YgbXkgb3duKS4KCj4gZXZlbiBpZiBJIGRvbid0IHNlZSB3aHkgaXQgaXMg
bmVjZXNzYXJ5OiB0aGUgc2VyaWVzIHdhcyBwb3N0ZWQgZmlyc3Qgd2F5Cj4gYmVmb3JlIGxhc3Qg
cG9zdGluZyBkYXRlLgoKSSB0aGluayBJIG1heSBoYXZlIGJlZW4gY29uZnVzZWQuCgpUaGFua3Ms
Cklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 577EC106FC9
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 12:18:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY6vA-0002ly-Nc; Fri, 22 Nov 2019 11:16:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mZ44=ZO=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iY6v8-0002lp-Vp
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 11:16:15 +0000
X-Inumbo-ID: 7e775110-0d19-11ea-a34c-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e775110-0d19-11ea-a34c-12813bfff9fa;
 Fri, 22 Nov 2019 11:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574421374;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=hihKP+pDIrDeCB7tMbbLw7cHTkS2xbZs8fJrK+D1/3w=;
 b=LcfKsLPCHPQ2YzrjgqO6cC/Kpt93eH6ZdAYWH/Fh0SmQzu8T+olSNTDa
 p/uMcSEiZVynbkU9rwoTNdcPwPTgOcaX0DUOCQGJa4zwahLQNpgLe1POp
 7ZPn1E1GcDCbYCEUzC2snkE+rLGlOGgwWphlBEXbzT1uYiND3gO2a8UYZ Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ccKTeIbm85sMiRFFCGns/fUHmJ5odjKEW2iI6ZVCr/AsdIZD3HmLFMCZvLkhkIaHdgFvRGLyzc
 20vweClB80oKIFvYeJsOhvSJ6PDNdaXEQenx2Hq5bDzqFzcMFP+Ji+8D30WTabivbpgCi/3oQJ
 LjmO5gvc2OfnqOImEj9ActLWBjvY9oxPTY2/M6FHcSMzrVflJWB68QFmSY105kae6z0oWyP9cY
 TZHc31ECCAd2sR03QPmUQ2aZ2HrmMk9u49vv1Ks1sLs1oqUoKfxSKOxj7eiQw5bohINNE4rvD/
 +oE=
X-SBRS: 2.7
X-MesageID: 8710091
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,229,1571716800"; 
   d="scan'208";a="8710091"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24023.50042.515583.849808@mariner.uk.xensource.com>
Date: Fri, 22 Nov 2019 11:16:10 +0000
To: Oleksandr Grytsov <al1img@gmail.com>
In-Reply-To: <20191121181300.6497-4-al1img@gmail.com>
References: <20191121181300.6497-1-al1img@gmail.com>
 <20191121181300.6497-4-al1img@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 3/3] libxl: make default path to
 add/remove all PV devices
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
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>, "wl@xen.org" <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T2xla3NhbmRyIEdyeXRzb3Ygd3JpdGVzICgiW1BBVENIIHYyIDMvM10gbGlieGw6IG1ha2UgZGVm
YXVsdCBwYXRoIHRvIGFkZC9yZW1vdmUgYWxsIFBWIGRldmljZXMiKToKPiBGcm9tOiBPbGVrc2Fu
ZHIgR3J5dHNvdiA8b2xla3NhbmRyX2dyeXRzb3ZAZXBhbS5jb20+Cj4gCj4gQWRkaW5nL3JlbW92
aW5nIGRldmljZSBpcyBoYW5kbGVkIGZvciBzcGVjaWZpYyBkZXZpY2VzIG9ubHk6IFZCRCwgVklG
LAo+IFFESVNLLiBUaGlzIGNvbW1pdCBhZGRzIGRlZmF1bHQgY2FzZSB0byBoYW5kbGUgYWRkaW5n
L3JlbW92aW5nIGZvciBhbGwgUFYKPiBkZXZpY2VzIGJ5IGRlZmF1bHQsIGV4Y2VwdCBRRElTSyBk
ZXZpY2UsIHdoaWNoIHJlcXVpcmVzIHNwZWNpYWwgaGFuZGxpbmcuCj4gSWYgYW55IG90aGVyIGRl
dmljZSBpcyByZXF1aXJlZCBhIHNwZWNpYWwgaGFuZGxpbmcgaXQgc2hvdWxkIGJlIGRvbmUgYnkK
PiBpbXBsZW1lbnRpbmcgc2VwYXJhdGUgY2FzZSAoc2ltaWxhciB0byBRRElTSyBkZXZpY2UpLiBU
aGUgZGVmYXVsdAo+IGJlaGF2aW91ciBmb3IgYWRkaW5nIGRldmljZSBpcyB0byB3YWl0IHdoZW4g
dGhlIGJhY2tlbmQgZ29lcyB0bwo+IFhlbmJ1c1N0YXRlSW5pdFdhaXQgYW5kIHRoZSBkZWZhdWx0
IGJlaGF2aW91ciBvbiByZW1vdmluZyBkZXZpY2UgaXMgdG8KPiBzdGFydCBnZW5lcmljIGRldmlj
ZSByZW1vdmUgcHJvY2VkdXJlLgo+IAo+IEFsc28gdGhpcyBjb21taXQgZml4ZXMgcmVtb3Zpbmcg
Z3Vlc3QgZnVuY3Rpb246IGJlZm9yZSB0aGUgZ3Vlc3Qgd2FzCj4gcmVtb3ZlZCB3aGVuIGFsbCBW
SUYgYW5kIFZCRCBkZXZpY2VzIGFyZSByZW1vdmVkLiBUaGUgZml4IHJlbW92ZXMKPiBndWVzdCB3
aGVuIGFsbCBjcmVhdGVkIGRldmljZXMgYXJlIHJlbW92ZWQuIFRoaXMgaXMgZG9uZSBieSBjaGVj
a2luZyB0aGUKPiBndWVzdCBkZXZpY2UgbGlzdCBpbnN0ZWFkIG9mIGNoZWNraW5nIG51bV92aWZz
IGFuZCBudW1fdmJkcy4gbnVtX3ZpZnMgYW5kCj4gbnVtX3ZiZHMgdmFyaWFibGVzIGFyZSByZW1v
dmVkIGFzIHJlZHVuZGFudCBpbiB0aGlzIGNhc2UuCgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs

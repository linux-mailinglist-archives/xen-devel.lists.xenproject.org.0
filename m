Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E021070EA
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 12:25:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY71m-0003iK-1Q; Fri, 22 Nov 2019 11:23:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mZ44=ZO=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iY71k-0003i9-Hh
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 11:23:04 +0000
X-Inumbo-ID: 72a7cd50-0d1a-11ea-a34c-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 72a7cd50-0d1a-11ea-a34c-12813bfff9fa;
 Fri, 22 Nov 2019 11:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574421783;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=Otmrby9Qxp/XV7DY2X/Mx5ku20mOOAGdJ6H/ueOBKH8=;
 b=QAkOjJVpz4ILKyD6qvkFcNf4j+tUREsm85RIX0rb7Y9aZlWEQ1juC+ZV
 sIrPHnQOiKxVv6zhXyJamlo+0GjB98S0pG7yICH2fkXMLFcNaFbKWRq/c
 ANbx7iXE9BOmcdAHRms4ExQoRwsjPz+02YLHm1O76nmwicnR8Hba8c1af A=;
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
IronPort-SDR: rWxGJGxCFp2TOGMppOmUyqGkbLpX+T2leYZ1aCmXS2PskeNdPLGQEf6dvTsSiPo/X7u0J5Yuwp
 LIOCog5Q19Hxmt87GIuezE4Ay9tGPNTgA3B9oCOA3uskVxw7yMfBed6N9MqbILnwfHG1LoJfOD
 eXRJckncPuvhh8oH5QD0bASa0fzH5CeJQKApylGXY2Gw+ykkoMEiDPqX0ooj6Ku5y/3QBr0DuQ
 T+c5z001EYwEoZ02mO28NCZrDsCClXlFFbQ3rD/DRpzimrR3ta0vTaDprbjtcw0Wo+faocYPoe
 iNE=
X-SBRS: 2.7
X-MesageID: 9063732
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,229,1571716800"; 
   d="scan'208";a="9063732"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24023.50452.287145.491578@mariner.uk.xensource.com>
Date: Fri, 22 Nov 2019 11:23:00 +0000
To: Oleksandr Grytsov <al1img@gmail.com>, Juergen Gross <jgross@suse.com>
In-Reply-To: <20191121181300.6497-1-al1img@gmail.com>
References: <20191121181300.6497-1-al1img@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH for-4.13 v2 0/3] Remove backend xen store
 entry on domain destroy
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

T2xla3NhbmRyIEdyeXRzb3Ygd3JpdGVzICgiW1BBVENIIHYyIDAvM10gUmVtb3ZlIGJhY2tlbmQg
eGVuIHN0b3JlIGVudHJ5IG9uIGRvbWFpbiBkZXN0cm95Iik6Cj4gRnJvbTogT2xla3NhbmRyIEdy
eXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVwYW0uY29tPgo+IAo+IENoYW5nZXMgc2luY2UgdjE6
Cj4gCj4gKiBhZGQgY29tbWl0IHRvIHJlbmFtZSBWS0IgYmFja2VuZCB0eXBlICJsaW51eCIgdG8g
InB2IjsKPiAqIGFkZCBkZWZhdWx0IGNhc2UgdG8gaGFuZGxlIGFkZGluZy9yZW1vdmluZyBQViBk
ZXZpY2VzIGluIGFkZF9kZXZpY2UsCj4gICByZW1vdmVfZGV2aWNlIGZ1bmN0aW9ucyAobGlieGxf
ZGV2aWNlLmMpOwo+ICogYWRkIGNvbW1lbnQgYWJvdXQgcmVtb3ZpbmcgbnVtX3ZpZnMsIG51bV92
YmRzIGludG8gY29tbWl0IG1lc3NhZ2UuCgpUaGFuayB5b3UgZm9yIHRoaXMuICBBcyB5b3Ugc2Vl
LCBJIGFwcHJvdmUuICBXZSBuZWVkIGFuIGFjayBmcm9tIHRoZQpSZWxlYXNlIE1hbmFnZXIsIHNv
IEkgaGF2ZSBhZGRyZXNlZCBKdWVyZ2VuIChhbmQgYWxzbyBhZGRlZCB0aGUKbWlzc2luZyBgZm9y
LTQuMTMnIHRhZyB0byB0aGUgc3ViamVjdCkuCgpHaXZlbiB3aGVyZSB3ZSBhcmUgaW4gdGhlIHJl
bGVhc2UgY3ljbGUgd2l0aCB0aGlzICh3aGljaCBJIHN0cmVzcyBpcwpub3QgcmVhbGx5IE9sZWtz
YW5kcidzIGZhdWx0KSBJIHRoaW5rIEkgd291bGQgbGlrZSB0byBnZXQgYSAybmQgcmV2aWV3CmZy
b20gYW5vdGhlciBsaWJ4bCBtYWludGFpbmVyLiAgQW50aG9ueSwgb3IgV2VpLCB3b3VsZCB5b3Ug
bGlrZSB0bwp0YWtlIGEgbG9vayA/CgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

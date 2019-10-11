Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A19D43DF
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 17:10:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIwVh-0002ra-EX; Fri, 11 Oct 2019 15:07:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fsnF=YE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iIwVg-0002rV-5a
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 15:07:16 +0000
X-Inumbo-ID: cf1c442e-ec38-11e9-bbab-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf1c442e-ec38-11e9-bbab-bc764e2007e4;
 Fri, 11 Oct 2019 15:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570806435;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=ij5ni6qDXPctY3A/W1YNjmcyN3/h8YQfSVH1OskzHH8=;
 b=Hem1o9jLvH+MYzx5nAvLcQ9yCe4bJSobiQRH290SE6l8wp+Mdu23Fd5+
 I5Xjg90WRCYW9f0jS/voQJIgwuiW6K9Vnm6HNeRjOhjz9x2YKum7N0d/T
 IFFlfNUFSrc/Ob9nS6Z56Anr9msro/fuqffXnyq0SjuRju8hcn97IQ1gn A=;
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
IronPort-SDR: t8O3+ZvQk5FPJ99nslo29OjFmSCNG/nKj8FD8yjH/pH3UuOBZPOI9T0VRI0rsp7U89ot3BGCzG
 xPSjqeUkWdTpWTSYQwVrBWBZmqj0jA5EfSe9fV+YiSXZ5BAX9e9Q/65LabVpOe6jkg9BbMVmyL
 Sm82XE/YPAfSCPeJUQZHdt+fcDKd1Md195Cz9bVrOAKqHfTQNxJ3ra7xtLjzzixXjeT2wmOncr
 lv4Vu0Z7kurra8NHlYodaH/zGMyYAmaHzlQkz5cXqOm2RkP0FUf64XgLPATpBmEH1WRPDJqbhn
 LjY=
X-SBRS: 2.7
X-MesageID: 6771145
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,284,1566878400"; 
   d="scan'208";a="6771145"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23968.39583.655591.751635@mariner.uk.xensource.com>
Date: Fri, 11 Oct 2019 16:07:11 +0100
To: Oleksandr Grytsov <al1img@gmail.com>, Roger Pau Monne
 <roger.pau@citrix.com>
In-Reply-To: <20191008141024.10885-3-al1img@gmail.com>
References: <20191008141024.10885-1-al1img@gmail.com>
 <20191008141024.10885-3-al1img@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v1 2/2] libxl: add removing XS backend path
 for PV devices on domain destroy
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
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>, "wl@xen.org" <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T2xla3NhbmRyIEdyeXRzb3Ygd3JpdGVzICgiW1BBVENIIHYxIDIvMl0gbGlieGw6IGFkZCByZW1v
dmluZyBYUyBiYWNrZW5kIHBhdGggZm9yIFBWIGRldmljZXMgb24gZG9tYWluIGRlc3Ryb3kiKToK
PiBGcm9tOiBPbGVrc2FuZHIgR3J5dHNvdiA8b2xla3NhbmRyX2dyeXRzb3ZAZXBhbS5jb20+Cj4g
Cj4gQ3VycmVudGx5IGJhY2tlbmQgcGF0aCBpcyByZW1vdmUgZm9yIHNwZWNpZmljIGRldmljZXM6
IFZCRCwgVklGLCBRRElTSy4KPiBUaGlzIGNvbW1pdCBhZGRzIHJlbW92aW5nIGJhY2tlbmQgcGF0
aCBmb3I6IFZESVNQTCwgVlNORCwgVklOUFVULgoKVGhhbmtzIGZvciB0aGlzIGFuZCB5b3VyIHBy
ZXZpb3VzIHBhdGNoLgoKVGhpcyBvbmUgbG9va3MgdG8gbWUgbGlrZSBpdCBpcyBwcm9iYWJseSBj
b3JyZWN0LiAgQnV0IEkgaGF2ZSBub3QgYmVlbgphYmxlIHRvIHVuZGVyc3RhbmQgd2h5IHRoaXMg
Y29kZSB3YXMgbGltaXRlZCB0byB2YmRzIGFuZCB2aWZzIGJlZm9yZQpzbyBJIGFtIGhlc2l0YW50
LgoKU2VhcmNoaW5nIHRoZSBnaXQgaGlzdG9yeSwgSSB0aGluayB0aGlzIGhhcyBiZWVuIGxpa2Ug
dGhpcyBzaW5jZQphMGVhYTg2ZTc1MzcKICJsaWJ4bDogYWRkIGRldmljZSBiYWNrZW5kIGxpc3Rl
bmVyIGluIG9yZGVyIHRvIGxhdW5jaCBiYWNrZW5kcyIKYW5kIHN1YnNlcXVlbnQgY29tbWl0cyBo
YXZlIGp1c3QgcmVvcmdhbmlzZWQgdGhpbmdzIGJ1dCBub3QKZnVuZGFtZW50YWxseSBjaGFuZ2Vk
IHRoZW0uICBJJ3ZlIENDJ2QgUm9nZXIgd2hvIHdyb3RlIHRoaXMgY29kZS4KCkkgdGhpbms6Cgo+
ICAgICAgc3dpdGNoKGRkZXYtPmRldi0+YmFja2VuZF9raW5kKSB7Cj4gKyAgICBjYXNlIExJQlhM
X19ERVZJQ0VfS0lORF9WRElTUEw6Cj4gKyAgICBjYXNlIExJQlhMX19ERVZJQ0VfS0lORF9WU05E
Ogo+ICsgICAgY2FzZSBMSUJYTF9fREVWSUNFX0tJTkRfVklOUFVUOgo+ICAgICAgY2FzZSBMSUJY
TF9fREVWSUNFX0tJTkRfVkJEOgo+ICAgICAgY2FzZSBMSUJYTF9fREVWSUNFX0tJTkRfVklGOgoK
SWYgd2UgZG8gd2FudCB0aGlzIHRvIGhhbmRsZSAqYWxsKiBraW5kcyBvZiBkZXZpY2UsIG1heWJl
IGl0IHNob3VsZApoYXZlIGEgZmFsbGJhY2sgdGhhdCBhYm9ydHMsIG9yIHNvbWV0aGluZyA/ICAo
SSBkb24ndCB0aGluayBpdCBpcwplYXN5IHRvIG1ha2UgaXQgYSBjb21waWxlIGVycm9yIHRvIGZv
cmdldCB0byBhZGQgYW4gZW50cnkgaGVyZSBidXQgaWYKd2UgY291bGQgZG8gdGhhdCBpdCB3b3Vs
ZCBwcm9iYWJseSBiZSBiZXN0LikKCkFsbCBvZiB0aGF0IGFzc3VtaW5nIHRoYXQgdGhlIGJhc2lj
IGlkZWEgaXMgcmlnaHQsIHdoaWNoIEkgd291bGQgbGlrZQpSb2dlcidzIG9waW5pb24gYWJvdXQu
CgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=

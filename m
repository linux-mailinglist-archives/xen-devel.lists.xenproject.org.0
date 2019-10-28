Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8733EE76CF
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 17:42:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP837-00081y-Fm; Mon, 28 Oct 2019 16:39:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=datn=YV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iP835-00081d-GI
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 16:39:19 +0000
X-Inumbo-ID: 7c05b81c-f9a1-11e9-bbab-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c05b81c-f9a1-11e9-bbab-bc764e2007e4;
 Mon, 28 Oct 2019 16:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572280759;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=08lWoiRbgbF5zgfDW6DCBgz9ykEFiW0wtaodac1XSbc=;
 b=EbToKz51jBZNp9MZfhrhKi95CUqwZxLtG4MwF82LpHakEBoBy9xVSRTJ
 fIVfHjdiVdRvVhrE4J19llEpLhCEhoATZ5wWMZ3dfVutEC1jCyUtEW+zd
 dcgneH86ynDFXrN1+iOYGq1tIDoeZJ0yF8YL+1kWHIhvcFBncO4F9jpcy 0=;
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
IronPort-SDR: Cvu08XQkrV96qe+aCaJewDBHi0Z9VEvm/xl+1pGje7BXs0o8uqsOcJkDtHxVrTVyes2iRCPFYz
 7BgcwXTnpZMrGY8ZJA2NIxJwFnzPshb/s5OrBDYdxN799L7unrPCFwC4622QxR0jNB9r89+Ozs
 7rxJsQPUan2uN1qxgNzakVjcjKERFgzxnW22CJLd8bVmSdPhSUhXen23ECiqms0pQCWPy6coHS
 zOe7GhcTYE/DnPkdN4BmGVJH2Zf3PQ8kXmPFpdhUnCtj7gc3ur0EQM7uNeHFlAeuWQTfcNV6a7
 Y0E=
X-SBRS: 2.7
X-MesageID: 7512757
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,240,1569297600"; 
   d="scan'208";a="7512757"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23991.6563.989303.472184@mariner.uk.xensource.com>
Date: Mon, 28 Oct 2019 16:38:59 +0000
To: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
In-Reply-To: <30a4fb6bb023348af867a253f6ff1e80efc7e232.1572038720.git.m.a.young@durham.ac.uk>
References: <cover.1572038720.git.m.a.young@durham.ac.uk>
 <30a4fb6bb023348af867a253f6ff1e80efc7e232.1572038720.git.m.a.young@durham.ac.uk>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH 1/3] set default kernel from grubenv
 next_entry or saved_entry
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

WU9VTkcsIE1JQ0hBRUwgQS4gd3JpdGVzICgiW1hFTiBQQVRDSCAxLzNdIHNldCBkZWZhdWx0IGtl
cm5lbCBmcm9tIGdydWJlbnYgbmV4dF9lbnRyeSBvciBzYXZlZF9lbnRyeSIpOgo+IFRoaXMgcGF0
Y2ggcmVhZHMgdGhlIGNvbnRlbnRzIG9mIGEgZ3J1YmVudiBmaWxlIGlmIGF2YWlsYWJsZSwgYW5k
Cj4gdXNlcyB0aGUgdmFsdWUgb2YgbmV4dF9lbnRyeSAoaW4gcHJlZmVyZW5jZSkgb3Igb2Ygc2F2
ZWRfZW50cnkgdG8KPiBzZXQgdGhlIGRlZmF1bHQga2VybmVsIGlmIHRoZXJlIGlzIGEgbWF0Y2hp
bmcgdGl0bGUgb3IgaWYgaXQgaXMgYQo+IG51bWJlci4gIElmIGVpdGhlciBuZXh0X2VudHJ5IG9y
IHNhdmVkX2VudHJ5IGlzIHNldCBhbmQgbmVpdGhlciBpcwo+IHVzZWQgdGhlbiB0aGUgZGVmYXVs
dCBpcyBzZXQgdG8gMC4KCkFyZSB5b3Ugc3VyZSB0aGUgZ3J1YmVudiBmaWxlIGhhcyBhIGNvbXBh
dGlibGUgZW5vdWdoIHN5bnRheCB3aXRoIHRoZQpncnViLmNmZyBmaWxlID8gIEkgaGFkIGEgbG9v
ayBhdCBncnViX3NwbGl0IGFuZCBBRklBQ1QgZnJvbSB0aGUKY29uZnVzaW5nIHdheSBpdCBpcyBl
eHByZXNzZWQsIGl0IHNwbGl0cyBvbiB0aGUgZWFybGllc3Qgb2YgPSAnICcgJ1x0Jwp3aGljaCBJ
IGd1ZXNzIGlzIHJpZ2h0IC4uLgoKSXMgaXQgZGVsaWJlcmF0ZSB0aGF0IHlvdXIgaW1wbGVtZW50
YXRpb24gc3RyYXRlZ3kgd291bGQgaG9ub3VyCmBuZXh0X2VudHJ5JyBhbmQgYHNhdmVkX2VudHJ5
JyBjb21tYW5kcyBpbiBncnViLmNmZyA/CgpBcmUgeW91IHN1cmUgaXQgaXMgY29ycmVjdCB0aGF0
IHlvdXIgaW1wbGVtZW50YXRpb24gc3RyYXRlZ3kgd291bGQKaG9ub3VyIGB0aXRsZScgZXRjLiBp
ZiBpdCBvY2N1cnJlZCBpbiBncnViZW52ID8gIE15IHJlYWRpbmcgb2YgdGhlCmRvY3VtZW50YXRp
b24gaXMgdGhhdCBncnViZW52IG1heSBiZSBsZXNzIHRydXN0ZWQuCgpEZXNwaXRlIHRoZXNlIG1p
c2dpdmluZ3MsIEkgdGhpbmsgdGhpcyBwYXRjaCBpcyBwcm9iYWJseSBiZXR0ZXIgdGhhbgpub3Ro
aW5nLgoKU286CiAgQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXgu
Y29tPgoKQnV0IEkgdGhpbmsgZGVwZW5kaW5nIG9uIHRoZSBhbnN3ZXIgdG8gbXkgcXVlc3Rpb25z
IGFib3ZlIHdlIG1heSB3YW50CmEgaGVhbHRoIHdhcm5pbmcgb2Ygc29tZSBraW5kIGluIHRoZSBy
ZWxlYXNlIG5vdGVzLCBvciBhIGZvbGxvd3VwLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

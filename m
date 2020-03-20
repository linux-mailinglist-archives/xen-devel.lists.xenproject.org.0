Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D54E318CFCB
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 15:15:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFIOJ-000709-Ct; Fri, 20 Mar 2020 14:12:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WMS9=5F=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jFIOI-000700-3V
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 14:12:50 +0000
X-Inumbo-ID: e0e9c53c-6ab4-11ea-92cf-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0e9c53c-6ab4-11ea-92cf-bc764e2007e4;
 Fri, 20 Mar 2020 14:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584713569;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=B/DVVMsg1Nivs2bQfP4g6GKlnT3Tr6m6WGMzZCYtKs0=;
 b=OVVQKY0BPm+WqoMyeu3kB3WEv8TODQrGhK9qWlWUZfocqYD5IzkfJJRO
 YItj00zUvDCwclG4nZLF9JvO/XCHPAMqfcP/DRobO9tg860lq+Rl9gwnM
 MPYefK1580VfoaZJBDlTZLUdCVQHLkiFmetAlFI3eYqJymYfsOZdNn0SZ 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6/9y0FFSnykkdOcbYu81YW7YYvkuaY5qdhoc68g/MsRq55aHKRBIGeMojcN9Qc+GBDVTGT51r6
 D57D3sjRziL0yaQyWi9Q3MGb6vPdHBVQYj0pL5KPpiKl9IwKdLt8yWsPky+e9cL3dBxgQe7DKb
 W3a6dTnYdEY1qwy4uf3GYFIiRmUHkAMnCBmV590dlDAx2D3Va/HgEULIvVcDF5PB2O0jK0Liga
 EhF7Vz5hXLlOcLIzSsG8txTbZD8mg6TfGYJrJ2wHTNULKJOoi6NFZxtpFTOSlkdkkFgyee7YeE
 s1c=
X-SBRS: 2.7
X-MesageID: 14998196
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,284,1580792400"; d="scan'208";a="14998196"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24180.53085.835170.696701@mariner.uk.xensource.com>
Date: Fri, 20 Mar 2020 14:12:45 +0000
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
In-Reply-To: <336e14a1-2c8b-8257-de40-3c6305a4ffcb@suse.com>
References: <20200319204025.2649661-1-dwmw2@infradead.org>
 <6ff2589e-3cb9-a8a3-ea22-0798b0574eb0@suse.com>
 <b9535ad9a1cc8a7c3a9aeb2fc5e7ea7560966ebb.camel@infradead.org>
 <336e14a1-2c8b-8257-de40-3c6305a4ffcb@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 1/2] tools/xenstore: Do not abort
 xenstore-ls if a node disappears while iterating
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
 David Woodhouse <dwmw2@infradead.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SsO8cmdlbiBHcm/DnyB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENIIDEvMl0gdG9vbHMv
eGVuc3RvcmU6IERvIG5vdCBhYm9ydCB4ZW5zdG9yZS1scyBpZiBhIG5vZGUgZGlzYXBwZWFycyB3
aGlsZSBpdGVyYXRpbmciKToKPiBObywgeW91IGp1c3QgZG9uJ3QgY2FyZSBmb3IgdGhlIHRyYW5z
YWN0aW9uIHRvIHN1Y2NlZWQgb3IgZmFpbCAoSU1PIGl0Cj4gc2hvdWxkIG5ldmVyIGZhaWwgYXMg
eW91IGFyZSByZWFkaW5nIG9ubHkpLgo+IAo+IFNvIGp1c3Qgd3JhcCBldmVyeXRoaW5nIGludG8g
YSB0cmFuc2FjdGlvbi4KClllcy4gIHhlbnN0b3JlZCB3aWxsIGRvIHRoZSBuZWVkZWQgYnVmZmVy
aW5nLgoKSSB0aGluayBpbiBwcmluY2lwbGUgdGhlcmUgaXMgYSByaXNrIGhlcmUgdGhhdCB0aGUg
dHJhbnNhY3Rpb24gbWlnaHQKcnVuIGZvciBhIGxvbmcgdGltZSwgaWYgdGhlIG91dHB1dCBmcm9t
IHhlbnN0b3JlLWxzIGdvZXMgdG8gc29tZXRoaW5nCnRoYXQgYmxvY2tzIChlZyBhIHBhZ2VyKSBh
bmQgY2FuJ3QgYmUgd3JpdHRlbiBhbGwgYXQgb25jZS4KCkJ1dCBpZiB0aGlzIGlzIGEgcHJvYmxl
bSBpdCBpcyBhIHByb2JsZW0gYWZmbGljdGluZyB4ZW5zdG9yZWQsIG5vdAp4ZW5zdG9yZS1scy4K
Cklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

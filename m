Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DB2161204
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 13:29:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3fTi-00067O-Du; Mon, 17 Feb 2020 12:26:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VaN/=4F=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j3fTh-00067G-BL
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 12:26:21 +0000
X-Inumbo-ID: b3a45346-5180-11ea-bc8e-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3a45346-5180-11ea-bc8e-bc764e2007e4;
 Mon, 17 Feb 2020 12:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581942380;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ObOSs+zMNn0Tahfx+82yKiLvMfNTw0H98ODMidEDt5s=;
 b=GbAfqqktHx8dvLdvGN/KNqkm3OUWr34S1tc92gedi+Sch1SF9hh1R6VH
 qXO78tRRHfKJrAKmBRGuj/ER7baDWMSHQwUHxTIdbMqPBu1LFUFt3n/Ot
 7pnqWXPrWRo6b8z3I3kHpbYX/d+hCwF4NGZy1toU4jivztSS/pyUgW3KL M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: dIY27a7uqaUaY2lh531bjkgZV6yFQVzD04KcMTCnr9fzfHYBfCaSFFlT9G/ua0JAldvJWwwdOk
 BkkFXZ0oAmn2nWsNCq1I2+MLNUoIK5tdXY15CYUNO7HsYwx+1OSDfUs/SyeazTTZZ1HCgHWdQA
 SLP3ND9hHxR10aJBzLend2nOWpgHLjT0laU8gfQsXax/3WIZgMBvvhf4JmEsVbEOhA+cDUQamZ
 n6BY/ezEQNYSf0muAmuCjjByaRYYuzK6m/pWTxrhHRDisjE9VM2bBCVRvBL1g6tzKQNF6AtiKU
 RRQ=
X-SBRS: 2.7
X-MesageID: 12552527
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,452,1574139600"; d="scan'208";a="12552527"
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20200217072006.20211-1-jgross@suse.com>
 <20200217072006.20211-3-jgross@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <3f1b46dc-ba1d-301a-3a7b-f3480338f379@citrix.com>
Date: Mon, 17 Feb 2020 12:26:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200217072006.20211-3-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen/rcu: don't use stop_machine_run()
 for rcu_barrier()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcvMDIvMjAyMCAwNzoyMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBUb2RheSByY3VfYmFy
cmllcigpIGlzIGNhbGxpbmcgc3RvcF9tYWNoaW5lX3J1bigpIHRvIHN5bmNocm9uaXplIGFsbAo+
IHBoeXNpY2FsIGNwdXMgaW4gb3JkZXIgdG8gZW5zdXJlIGFsbCBwZW5kaW5nIHJjdSBjYWxscyBo
YXZlIGZpbmlzaGVkCj4gd2hlbiByZXR1cm5pbmcuCj4gCj4gQXMgc3RvcF9tYWNoaW5lX3J1bigp
IGlzIHVzaW5nIHRhc2tsZXRzIHRoaXMgcmVxdWlyZXMgc2NoZWR1bGluZyBvZgo+IGlkbGUgdmNw
dXMgb24gYWxsIGNwdXMgaW1wb3NpbmcgdGhlIG5lZWQgdG8gY2FsbCByY3VfYmFycmllcigpIG9u
IGlkbGUKPiBjcHVzIG9ubHkgaW4gY2FzZSBvZiBjb3JlIHNjaGVkdWxpbmcgYmVpbmcgYWN0aXZl
LCBhcyBvdGhlcndpc2UgYQo+IHNjaGVkdWxpbmcgZGVhZGxvY2sgd291bGQgb2NjdXIuCj4gCj4g
VGhlcmUgaXMgbm8gbmVlZCBhdCBhbGwgdG8gZG8gdGhlIHN5bmNpbmcgb2YgdGhlIGNwdXMgaW4g
dGFza2xldHMsIGFzCj4gcmN1IGFjdGl2aXR5IGlzIHN0YXJ0ZWQgaW4gX19kb19zb2Z0aXJxKCkg
Y2FsbGVkIHdoZW5ldmVyIHNvZnRpcnEKPiBhY3Rpdml0eSBpcyBhbGxvd2VkLiBTbyByY3VfYmFy
cmllcigpIGNhbiBlYXNpbHkgYmUgbW9kaWZpZWQgdG8gdXNlCj4gc29mdGlycSBmb3Igc3luY2hy
b25pemF0aW9uIG9mIHRoZSBjcHVzIG5vIGxvbmdlciByZXF1aXJpbmcgYW55Cj4gc2NoZWR1bGlu
ZyBhY3Rpdml0eS4KPiAKPiBBcyB0aGVyZSBhbHJlYWR5IGlzIGEgcmN1IHNvZnRpcnEgcmV1c2Ug
dGhhdCBmb3IgdGhlIHN5bmNocm9uaXphdGlvbi4KPiAKPiBGaW5hbGx5IHN3aXRjaCByY3VfYmFy
cmllcigpIHRvIHJldHVybiB2b2lkIGFzIGl0IG5vdyBjYW4gbmV2ZXIgZmFpbC4KPiAKCldvdWxk
IHRoaXMgaW1wbGVtZW50YXRpb24gZ3VhcmFudGVlIHByb2dyZXNzIGFzIHByZXZpb3VzIGltcGxl
bWVudGF0aW9uCmd1YXJhbnRlZWQ/CgpJZ29yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==

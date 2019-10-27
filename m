Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3F2E6299
	for <lists+xen-devel@lfdr.de>; Sun, 27 Oct 2019 14:11:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOiGz-0005lx-Vi; Sun, 27 Oct 2019 13:07:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aIno=YU=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1iOiGx-0005lq-Jg
 for xen-devel@lists.xenproject.org; Sun, 27 Oct 2019 13:07:56 +0000
X-Inumbo-ID: c7095a04-f8ba-11e9-bbab-bc764e2007e4
Received: from mail.crc.id.au (unknown [203.56.246.92])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7095a04-f8ba-11e9-bbab-bc764e2007e4;
 Sun, 27 Oct 2019 13:07:51 +0000 (UTC)
Received: from wopr.lan.crc.id.au (unknown
 [IPv6:2407:e400:b000:200:bd38:8202:2c2b:cd7a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 8E8FB20010D;
 Mon, 28 Oct 2019 00:07:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1572181667; bh=djBYA2WAolqW40Xn7vwci+T9bfcJ+TdOLmum79JHTvE=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=hLlYKF9X34UkLSy63uMwqiay1a/IlTOydehWJGZzO3PBoo2wU3QHEhBWilaIFc5HE
 sfO0L+SMHT1ovRnsGNDPrOfg3C8oF1LCABquqqUNAxw6y6Kg+brs81VE0D/gdkjNsj
 6YO8Ray/CZlcIQbMF+wLC9U6R9bZrwttH3PaNaBs=
Date: Mon, 28 Oct 2019 00:07:46 +1100
From: Steven Haigh <netwiz@crc.id.au>
To: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
Message-Id: <1572181666.2783.0@crc.id.au>
In-Reply-To: <alpine.LFD.2.21.1910261644150.2712@austen3.home>
References: <cover.1572038720.git.m.a.young@durham.ac.uk>
 <1572089916.2390.0@crc.id.au>
 <alpine.LFD.2.21.1910261644150.2712@austen3.home>
X-Mailer: geary/3.34.1
MIME-Version: 1.0
Subject: Re: [Xen-devel] [XEN PATCH 0/3] read grubenv and set default from it
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXdlc29tZSAtIHRoYW5rcyBNaWNoYWVsLgoKSSdsbCB0cnkgYW5kIHRlc3QgdGhpcyBvdXQgdG9t
b3Jyb3cuClN0ZXZlbiBIYWlnaAoK8J+TpyBuZXR3aXpAY3JjLmlkLmF1ICAgICDwn5K7IGh0dHBz
Oi8vd3d3LmNyYy5pZC5hdQrwn5OeICs2MTMgOTAwMSA2MDkwICAgICAgIPCfk7EgKzYxNCAxMjkz
IDU4OTcKCgpPbiBTYXQsIE9jdCAyNiwgMjAxOSBhdCAxNjowMCwgIllPVU5HLCBNSUNIQUVMIEEu
IiAKPG0uYS55b3VuZ0BkdXJoYW0uYWMudWs+IHdyb3RlOgo+IE9uIFNhdCwgMjYgT2N0IDIwMTks
IFN0ZXZlbiBIYWlnaCB3cm90ZToKPiAKPj4gIElmIC8gd2hlbiBweWdydWIgaXMgYWJsZSB0byBw
cm9wZXJseSByZWFkIGFuZCBib290IGZyb20gQkxTIGJhc2VkCj4+ICBjb25maWd1cmF0aW9ucyAo
SSdtIG5vdCBzdXJlIGlmIHRoaXMgcGF0Y2hzZXQgbWFrZXMgcHlncnViIEJMUyAKPj4gY29tcGF0
aWJsZSwgb3IKPj4gIGp1c3QgZml4ZXMgdGhlIGV4aXN0aW5nIGlzc3VlcykgLSBidXQgd2UgY2Fu
IGxvb2sgYXQgcmV2aXNpdGluZyAKPj4gcmVtb3ZpbmcKPj4gIHRoZXNlIHdvcmthcm91bmRzIGZy
b20gYW5hY29uZGEgLyBncnViMiBwYWNrYWdlcyBpbiBGMzAgLyBGMzEgLyAKPj4gUmF3aGlkZS4K
PiAKPiBUaGUgcGF0Y2hzZXQgZG9lc24ndCBhZGQgQkxTIGNvbXBhdGliaWxpdHkgYnV0IHNob3Vs
ZCBiZSB1c2VmdWwgZm9yIAo+IHdoYXQgSQo+IGV4cGVjdCBCTFMgc3VwcG9ydCB0byBsb29rIGxp
a2UgKEkgaGF2ZSBhIGlkZWEgb2Ygd2hhdCB3b3VsZCBiZSAKPiByZXF1aXJlZAo+IHRob3VnaCBJ
IGhhdmVuJ3Qgd29ya2VkIG91dCB0aGUgZGV0YWlscyB5ZXQpLgo+IAo+ICAJTWljaGFlbCBZb3Vu
Zwo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
WGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+
IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwK
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

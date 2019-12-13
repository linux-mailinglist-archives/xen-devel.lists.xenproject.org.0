Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3FA11DC80
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 04:12:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifbLR-0002tQ-M5; Fri, 13 Dec 2019 03:10:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xLeZ=2D=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1ifbLP-0002tL-KC
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 03:10:19 +0000
X-Inumbo-ID: 165703da-1d56-11ea-88e7-bc764e2007e4
Received: from mail.crc.id.au (unknown [2407:e400:b000:200::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 165703da-1d56-11ea-88e7-bc764e2007e4;
 Fri, 13 Dec 2019 03:10:18 +0000 (UTC)
Received: from ws19.umd.com.au (2407-e400-b000-202-0-0-0-3-cpe.spintel.net.au
 [IPv6:2407:e400:b000:202::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 671832000F1;
 Fri, 13 Dec 2019 14:04:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1576206278; bh=vNGQySjKvuBLJWku9HpTWST278MCLIjwd51tAvFVW2U=;
 h=From:To:Cc:Subject:Date;
 b=IwDbDldFc86/umzF8Il07kyvxlFD0uAaXk37QXBT+tf4/2iYZLZMdV1rMUH/+Jozh
 hXO0RTlpRUVjzy+OVVvMZmQglPI0crWnEDN1uXyfkX/XQALtZeYzd9By/s8pp6DEHs
 Dlh8MHgj9NAWI2tBDs/Im2YtpTJVV6KtOkL09KvE=
From: Steven Haigh <netwiz@crc.id.au>
To: netwiz@crc.id.au,
	xen-devel@lists.xenproject.org
Date: Fri, 13 Dec 2019 14:04:32 +1100
Message-Id: <coverv2.1576204748.git.netwiz@crc.id.au>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/2] [PATCH-for-4.13] Work towards removing
 brctl
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3RhcnQgdXBkYXRpbmcgc2NyaXB0cyBmb3IgbmV0d29yayBmdW5jdGlvbmFsaXR5CgpUaGUgc2Ny
aXB0cyBmb3IgbmV0d29ya2luZyBpbiBYZW4gaGF2ZSBhIG1peHR1cmUgb2YgZm9ybWF0dGluZywK
dGFiIHNwYWNpbmcsIHNwYWNlIHNwYWNpbmcgaW5jb25zaXN0ZW5jaWVzLgoKV2UgYWxzbyBoYXZl
IGlzc3VlcyB3aGVyZSBDZW50T1MgOCBkb2VzIG5vdCBoYXZlIGJyY3RsIC0gYmVpbmcKcmVwbGFj
ZWQgd2l0aCBpcCAvIGJyaWRnZSBjb21tYW5kcy4KClRoaXMgc2VyaWVzIHN0YXJ0cyBjbGVhbmlu
ZyB1cCB3aGl0ZXNwYWNlIGFuZCBmb3JtYXR0aW5nLCBhcyB3ZWxsCmFzIHN0YXJ0cyBhZGRpbmcg
Y29uZGl0aW9uYWxzIGZvciB1c2luZyBicmN0bCAoaWYgcHJlc2VudCkgYnV0IHVzaW5nCmlwIGlm
IC91c3Ivc2Jpbi9icmN0bCBpcyBub3QgaW5zdGFsbGVkLgoKQ2hhbmdlcyBzaW5jZSB2MQogICog
Rml4ZWQgcmVmZXJlbmNlIHRvIC91c3IvYmluL2JyY3RsIGluc3RlYWQgb2YgL3Vzci9zYmluL2Jy
Y3RsCgpTdGV2ZW4gSGFpZ2ggKDIpOgogIFRpZHkgdXAgd2hpdGVzcGFjZSBhbmQgZm9ybWF0dGlu
ZyBpbiBmaWxlIHRvIGJlIGNvbnNpc3RlbnQuCiAgVXNlIGlwIGZvciBicmlkZ2UgcmVsYXRlZCBm
dW5jdGlvbnMgd2hlcmUgYnJjdGwgaXMgbm90IHByZXNlbnQKCiB0b29scy9ob3RwbHVnL0xpbnV4
L2NvbG8tcHJveHktc2V0dXAgICAgICB8ICAzMCArKystLQogdG9vbHMvaG90cGx1Zy9MaW51eC92
aWYtYnJpZGdlICAgICAgICAgICAgfCAgMTkgKystCiB0b29scy9ob3RwbHVnL0xpbnV4L3ZpZjIg
ICAgICAgICAgICAgICAgICB8ICAxMiArLQogdG9vbHMvaG90cGx1Zy9MaW51eC94ZW4tbmV0d29y
ay1jb21tb24uc2ggfCAxNTEgKysrKysrKysrKystLS0tLS0tLS0tLQogNCBmaWxlcyBjaGFuZ2Vk
LCAxMjEgaW5zZXJ0aW9ucygrKSwgOTEgZGVsZXRpb25zKC0pCgotLSAKMi4yNC4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

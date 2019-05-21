Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C932225257
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 16:41:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT5t6-00010M-SO; Tue, 21 May 2019 14:37:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3mDO=TV=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hT5t5-00010H-MF
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 14:37:07 +0000
X-Inumbo-ID: e7dda396-7bd5-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e7dda396-7bd5-11e9-8980-bc764e045a96;
 Tue, 21 May 2019 14:37:06 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=Pass smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: wtwLly0oORr/PtdCasg31y+aISfZ+IGtZlMsaOJE/Z1KYliR8UeQYmgaCpW5KkOM8ey1Fen1M3
 nRiNbuV1Hej4T9iL3TlW7zLle6ajy0EvFeLtvAbdNSj06gmWwL9nsdORnjgoZdPOGcIuzyFyV/
 WiWVrWzdKebc0QOQdSoy/Ub+PTYU4T7x6FwhNam4LU2RbcmEBxYHBMefiOSKjaKvbf/pAhB34H
 rJsx7NL4+MyIAtfP0XB5HfAO9zPmq1HEh3kdzee6D5516onch2tLIJ/PecMuduK65KD4syAifJ
 Sa4=
X-SBRS: 2.7
X-MesageID: 712595
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,495,1549947600"; 
   d="scan'208";a="712595"
Date: Tue, 21 May 2019 15:37:02 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190521143702.GH1846@zion.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: [Xen-devel] Unhandle NONE type device model broke QDISK backend
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xhZgoKSXQgYXBwZWFycyB0aGVyZSBpcyBhdCBsZWFzdCBvbmUgaW5zdGFuY2UgdGhhdCdz
IG5vdCBwcm9wZXJseSBoYW5kbGVkLgoKU2VlIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2pl
Y3Qub3JnL29zc3Rlc3QvbG9ncy8xMzY0NDAvdGVzdC1hbWQ2NC1hbWQ2NC14bC1xY293Mi8xMC50
cy1kZWJpYW4tZGktaW5zdGFsbC5sb2cKCmJ4bDogZGVidWc6IGxpYnhsX2RldmljZS5jOjM4MDps
aWJ4bF9fZGV2aWNlX2Rpc2tfc2V0X2JhY2tlbmQ6IERpc2sgdmRldj14dmRhIHNwZWMuYmFja2Vu
ZD1xZGlzawpsaWJ4bDogZGVidWc6IGxpYnhsX2xpbnV4LmM6MjM1OmxpYnhsX19nZXRfaG90cGx1
Z19zY3JpcHRfaW5mbzogRG9tYWluIDE6YmFja2VuZF9raW5kIDMsIG5vIG5lZWQgdG8gZXhlY3V0
ZSBzY3JpcHRzCmxpYnhsOiBkZWJ1ZzogbGlieGxfZGV2aWNlLmM6MTE3NDpkZXZpY2VfaG90cGx1
ZzogRG9tYWluIDE6Tm8gaG90cGx1ZyBzY3JpcHQgdG8gZXhlY3V0ZQpsaWJ4bDogZGVidWc6IGxp
YnhsX2V2ZW50LmM6Njg5OmxpYnhsX19ldl94c3dhdGNoX2RlcmVnaXN0ZXI6IHdhdGNoIHc9MHg1
NTZiZTYxNTMzNzA6IGRlcmVnaXN0ZXIgdW5yZWdpc3RlcmVkCmxpYnhsOiBlcnJvcjogbGlieGxf
ZG0uYzozMjY6bGlieGxfX2RvbWFpbl9kZXZpY2VfbW9kZWw6IGludmFsaWQgZGV2aWNlIG1vZGVs
IHZlcnNpb24gMwpsaWJ4bDogZXJyb3I6IGxpYnhsX2RtLmM6Mjc0NzpkZXZpY2VfbW9kZWxfc3Bh
d25fb3V0Y29tZTogRG9tYWluIDE6KG51bGwpOiBzcGF3biBmYWlsZWQgKHJjPS0zKQoKVGhlIHNh
bWUgdGhpbmcgc2hvd2VkIHVwIGluIHRoZSB2aGQgdGVzdC4gQm90aCB0ZXN0IGNhc2VzIHVzZSBR
RElTSwpiYWNrZW5kLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==

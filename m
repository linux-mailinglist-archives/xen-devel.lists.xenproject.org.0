Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B025DE2185
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 19:13:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNK9n-0002ep-TA; Wed, 23 Oct 2019 17:10:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TICx=YQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iNK9m-0002dv-Iz
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 17:10:46 +0000
X-Inumbo-ID: 0940da92-f5b8-11e9-beca-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0940da92-f5b8-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 17:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571850639;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fSwD/FC99n3T96nVJdnlbsnR9cdA3q+GxDc4nqoWIYY=;
 b=eNerlisI0iOTbh4Bv+lqgtUQCEQJnZofwYgOxYQ9Z+vGY2s3erxd71eU
 oEqO14P551r73JAlubRufUY6yLqxBTIAzlganpvLDNgS4jMNMWOZiFnC7
 6dC8GTGrpo/aeWT/gXVmh1PEN5HFyX1yJUPsdAQu5JZ0RyBJRXKL3kP5q 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vYPmbaGETsa2/vNDU6CMB7KIkioEIKqz7CvhUlnsU8NCakD2pTUFQAv3BEwOO+0IGTPKFHjRiT
 IfdK3+htnDHndDt4zSINwEJSgkYgPuUx4aBUcFYVYPZQS3xFO17WOuOf/PJyVnY467kdZirp5z
 /B3teKp7Uy4/N8eZwPcKIvfdZ+CplGJvtFDB3SOfFNvqmfZa5lq9Rz75/D7bvYNl8x5ht5BS/l
 nzrZPDyb7CQA1TRntSE15YsFOy5qttN3m4n0nrHHeym1B9dHhUevmHzEdwo5FeH4hxFgrEh9Y8
 A7g=
X-SBRS: 2.7
X-MesageID: 7642020
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7642020"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 17:48:28 +0100
Message-ID: <20191023164837.2700240-15-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023164837.2700240-1-anthony.perard@citrix.com>
References: <20191023164837.2700240-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC XEN PATCH 14/23] convert common/libfdt to kbuild
 makefile
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
Cc: Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VU5URVNURUQKLS0tCiB4ZW4vY29tbW9uL2xpYmZkdC9NYWtlZmlsZSB8IDE0ICsrKysrKysrLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3hlbi9jb21tb24vbGliZmR0L01ha2VmaWxlIGIveGVuL2NvbW1vbi9saWJmZHQv
TWFrZWZpbGUKaW5kZXggOWVhNWM2OTZkNTJhLi5hMjMzZDgyYjE1ZWUgMTAwNjQ0Ci0tLSBhL3hl
bi9jb21tb24vbGliZmR0L01ha2VmaWxlCisrKyBiL3hlbi9jb21tb24vbGliZmR0L01ha2VmaWxl
CkBAIC0xLDE0ICsxLDE2IEBACi1pbmNsdWRlIE1ha2VmaWxlLmxpYmZkdAoraW5jbHVkZSAkKHNy
Y3RyZWUpLyQoc3JjKS9NYWtlZmlsZS5saWJmZHQKIAogU0VDVElPTlMgOj0gdGV4dCBkYXRhICQo
U1BFQ0lBTF9EQVRBX1NFQ1RJT05TKQogCiBvYmoteSArPSBsaWJmZHQubwogbm9jb3YteSArPSBs
aWJmZHQubwogCi1jY2ZsYWdzLXkgKz0gLUkkKEJBU0VESVIpL2luY2x1ZGUveGVuL2xpYmZkdC8K
K2NjZmxhZ3MteSArPSAtSSQoc3JjdHJlZSkvaW5jbHVkZS94ZW4vbGliZmR0LworbGRmbGFncy15
ICs9IC1yCitPQkpDT1BZRkxBR1MgKz0gJChmb3JlYWNoIHMsJChTRUNUSU9OUyksLS1yZW5hbWUt
c2VjdGlvbiAuJChzKT0uaW5pdC4kKHMpKQogCi1saWJmZHQubzogbGliZmR0LXRlbXAubyBNYWtl
ZmlsZQotCSQoT0JKQ09QWSkgJChmb3JlYWNoIHMsJChTRUNUSU9OUyksLS1yZW5hbWUtc2VjdGlv
biAuJChzKT0uaW5pdC4kKHMpKSAkPCAkQAorJChvYmopL2xpYmZkdC5vOiAkKG9iaikvbGliZmR0
LXRlbXAubyBGT1JDRQorCSQoY2FsbCBpZl9jaGFuZ2VkLG9iamNvcHkpCiAKLWxpYmZkdC10ZW1w
Lm86ICQoTElCRkRUX09CSlMpCi0JJChMRCkgJChMREZMQUdTKSAtciAtbyAkQCAkXgorJChvYmop
L2xpYmZkdC10ZW1wLm86ICQoYWRkcHJlZml4ICQob2JqKS8sJChMSUJGRFRfT0JKUykpIEZPUkNF
CisJJChjYWxsIGlmX2NoYW5nZWQsbGQpCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

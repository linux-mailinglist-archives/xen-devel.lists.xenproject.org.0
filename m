Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1EEE7537
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 16:33:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP6y7-0001D3-D0; Mon, 28 Oct 2019 15:30:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=datn=YV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iP6y6-000164-B5
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 15:30:06 +0000
X-Inumbo-ID: cd0884a6-f997-11e9-94fa-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd0884a6-f997-11e9-94fa-12813bfff9fa;
 Mon, 28 Oct 2019 15:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572276598;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Qx9xDnGqNZ8MCivv8Fqlkuw4UnJRhakhNkpO4dVWJDg=;
 b=edEOkwtpIZg+01+agw/Bx5A7Gw7wjX6TGTjHhKpArAyzNZ7w09zWQxO6
 A+hlWYua3r9eTmWjEyI1E/H8hIz+QMHV8EXdU3Y6TCVj9sFR8dmh7MxUa
 8g9beziipcKvfGvQ5CypyCRE/6xT8ag4TBKOMtyYJq3k54JqGqwUvTYjJ I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
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
IronPort-SDR: J3F8GhgwcZ/Sqk4LTIJkjIH84mkyuLWqJwMmDHQ7Ji6N/NdNqWUE3YfgVN8ED/cD6us9JZUlJ1
 /eS4TqAAFw0vZe7oilS8MApOuobiCLZlm0pe5pUPub3J3R2K6TutPP/L1zr+JKblSZ/ZGi1nUF
 80L91CniPm3LXZSkXVl9XroVhkQ7RxcQtUlU8iLiiBGNGyiVHUYMpI1gb1K77I9Vnbfl+eHn07
 uFjS/QgOnxXpx2jDA95793HX8ZOvRgWHlqJdbpzqL60shqq3T/x22/OlTcvP2JDjTxR9LXxVun
 SdM=
X-SBRS: 2.7
X-MesageID: 7826421
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,240,1569297600"; 
   d="scan'208";a="7826421"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 28 Oct 2019 15:29:46 +0000
Message-ID: <20191028152948.11900-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191028152948.11900-1-ian.jackson@eu.citrix.com>
References: <20191028152948.11900-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 1/3] libxl:
 domain_config_setdefault: Document use of domid
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgYXJlIGdvaW5nIHRvIHdhbnQgdG8gY2FsbCB0aGlzIGZyb20gYSBzaXRlIHdoaWNoIGhhcyBh
IGRvbWlkIHdoaWNoCmlzIGdvb2QgZm9yIGxvZ2dpbmcgYnV0IG5vdCB0aGUgZG9taWQgb2YgdGhl
IGRvbWFpbiB3ZSBhcmUgY3JlYXRpbmcKKG5hbWVseSwgdGhlIHN0dWIgZGV2aWNlIGRvbWFpbiku
CgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4K
Q0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4
bF9jcmVhdGUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jIGIvdG9vbHMv
bGlieGwvbGlieGxfY3JlYXRlLmMKaW5kZXggZDU5YWMyYWIwNS4uMzJkNDVkY2VmMCAxMDA2NDQK
LS0tIGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxf
Y3JlYXRlLmMKQEAgLTg5MSw3ICs4OTEsNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBsaWJ4bF9f
Z2V0X3JlcXVpcmVkX2lvbW11X21lbW9yeSh1bnNpZ25lZCBsb25nIG1heG1lbV9rYikKIAogaW50
IGxpYnhsX19kb21haW5fY29uZmlnX3NldGRlZmF1bHQobGlieGxfX2djICpnYywKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2RvbWFpbl9jb25maWcgKmRfY29uZmln
LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgZG9taWQpCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBkb21pZCAvKiBmb3Ig
bG9nZ2luZywgb25seSAqLykKIHsKICAgICBsaWJ4bF9jdHggKmN0eCA9IGxpYnhsX19nY19vd25l
cihnYyk7CiAgICAgaW50IHJldDsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=

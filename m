Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3B6E1BBA
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 15:04:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNGFZ-0005tx-8q; Wed, 23 Oct 2019 13:00:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l49O=YQ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iNGFX-0005tn-V4
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 13:00:27 +0000
X-Inumbo-ID: 13138a10-f595-11e9-bbab-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13138a10-f595-11e9-bbab-bc764e2007e4;
 Wed, 23 Oct 2019 13:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571835623;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=mcnHNnuobJVIoAVNjV2dKd+l7QxXNdod66g53zaBt+0=;
 b=bGRLboC2IxcwSnRoS8VlnmqQMbF7a0WlnT5Inpv/gOHBB52IlZL106r3
 UqW0DgnF+DSqblPA1JTgOYqgYAOvY7+rj7RBcEtrEwYOJRp7royeX/RN1
 addPag7hJWGbxVqSxZXt8znAclr1zLU2Ume6AmFQ82Fug9mx6Wq5Q/7EZ M=;
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
IronPort-SDR: Tn4clvFqwy5xE3PwXhdSLlYqL2VnWGALOprmeSCLfgDZYuWLAakamTXtuHJONMrDIEr1TOt7Uz
 qwdQx+3jecdisdJboleU+kghHug7i8yH2xBv6JXTa1TtS0zJGWycalPTjZwL9+WdUJkOGMJgHc
 1um/rL0HdbcKACV/o2pTYPXJOaaj9UNTGdWRTuAb7550Rb6E1eCrVAQaX1emIl1IP9lb0SELq9
 SYyIyunzN94elbgmezgUknqv3htPp54g9oxsbqdXgIC9Hhf5Oe9RaoDaiVNqgcEYA/3IowSEGh
 +go=
X-SBRS: 2.7
X-MesageID: 7623493
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,220,1569297600"; 
   d="scan'208";a="7623493"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 14:00:06 +0100
Message-ID: <20191023130013.32382-5-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
References: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v7 04/11] libxl:
 libxl_domain_need_memory: Make it take a domain_config
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

VGhpcyBzaG91bGQgY2FsY3VsYXRlIHRoZSBleHRyYSBtZW1vcnkgbmVlZGVkIGZvciBzaGFkb3cg
YW5kIGlvbW11LAp0aGUgZGVmYXVsdHMgZm9yIHdoaWNoIGRlcGVuZCBvbiB2YWx1ZXMgaW4gY19p
bmZvLiAgU28gd2UgbmVlZCB0aGlzIHRvCmhhdmUgdGhlIGNvbXBsZXRlIGRvbWFpbiBjb25maWcg
YXZhaWxhYmxlLgoKQW5kIHRoZSBkZWZhdWx0cyBzaG91bGQgYWN0dWFsbHkgYmUgdXBkYXRlZCBh
bmQgc3RvcmVkLiAgU28gbWFrZSBpdApub24tY29uc3QuCgpXZSBwcm92aWRlIHRoZSB1c3VhbCBr
aW5kIG9mIGNvbXBhdGliaWxpdHkgZnVuY3Rpb24gZm9yIGNhbGxlcnMKZXhwZWN0aW5nIDQuMTIg
YW5kIGVhcmxpZXIuICBUaGlzIGZ1bmN0aW9uIGJlY29tZXMgcmVzcG9uc2libGUgZm9yIHRoZQpj
bG9uZS1hbmQtbW9kaWZ5IG9mIHRoZSBiX2luZm8uCgpObyBvdmVyYWxsIGZ1bmN0aW9uYWwgY2hh
bmdlIGZvciBleHRlcm5hbCBsaWJ4bCBjYWxsZXJzIHdoaWNoIHVzZSB0aGUKQVBJIHZlcnNpb24g
c3lzdGVtIHRvIHJlcXVlc3QgYSBwYXJ0aWN1bGFyIEFQSSB2ZXJzaW9uLgoKT3RoZXIgZXh0ZXJu
YWwgbGlieGwgY2FsbGVycyB3aWxsIG5lZWQgdG8gdXBkYXRlIHRoZWlyIGNhbGxpbmcgY29kZSwK
YW5kIHdpbGwgdGhlbiBmaW5kIHRoYXQgdGhlIG5ldyB2ZXJzaW9uIG9mIHRoaXMgZnVuY3Rpb24g
ZmlsbHMgaW4gbW9zdApvZiB0aGUgZGVmYXVsdHMgaW4gZF9jb25maWcuICBCZWNhdXNlIGxpYnhs
X19kb21haW5fY29uZmlnX3NldGRlZmF1bHQKZG9lc24ndCBxdWl0ZSBkbyBhbGwgb2YgdGhlIGRl
ZmF1bHRzLCB0aGF0J3Mgb25seSBwYXJ0aWFsLiAgRm9yCnByZXNlbnQgcHVycG9zZXMgdGhhdCBk
b2Vzbid0IG1hdHRlciBiZWNhdXNlIG5vbmUgb2YgdGhlIG1pc3NpbmcKc2V0dGluZ3MgYXJlIHVz
ZWQgYnkgdGhlIG1lbW9yeSBjYWxjdWxhdGlvbnMuICBJdCBkb2VzIG1lYW4gd2UgbmVlZCB0bwpk
b2N1bWVudCBpbiB0aGUgQVBJIHNwZWMgdGhhdCB0aGUgZGVmYXVsdGluZyBpcyBvbmx5IHBhcnRp
YWwuCgpUaGlzIGxhY2sgb2YgZnVuY3Rpb25hbCBjaGFuZ2UgaXMgZGVzcGl0ZSB0aGUgZmFjdCB0
aGF0Cm51bWFfcGxhY2VfZG9tYWluIG5vdyBubyBsb25nZXIgY2FsbHMKbGlieGxfX2RvbWFpbl9i
dWlsZF9pbmZvX3NldGRlZmF1bHQgKHZpYSBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnkpLgpUaGF0
IGlzIE9LIGJlY2F1c2UgaXQncyBpZGVtcG90ZW50IGFuZCBudW1hX3BsYWNlX2RvbWFpbidzIG9u
ZSBjYWxsCnNpdGUgaXMgbGlieGxfX2J1aWxkX3ByZSB3aGljaCBpcyBjYWxsZWQgZnJvbSBsaWJ4
bF9fZG9tYWluX2J1aWxkCndoaWNoIGlzIGNhbGxlZCBmcm9tIGRvbWNyZWF0ZV9ib290bG9hZGVy
X2RvbmUsIHdlbGwgYWZ0ZXIgdGhlCmRlZmF1bHRzIGFyZSBzZXQgYnkgaW5pdGlhdGVfZG9tYWlu
X2NyZWF0ZS4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRy
aXguY29tPgpSZXZpZXdlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJp
eC5jb20+Ci0tLQp2MjogRHJvcCBub3ctZXJyb25lb3VzIEdDX0ZSRUUgYXMgd2VsbCBhcyB0aGUg
Y29ycmVzcG9uZGluZyBHQ19JTklULgotLS0KIHRvb2xzL2xpYnhsL2xpYnhsLmggICAgICAgICAg
fCAyMyArKysrKysrKysrKysrKystCiB0b29scy9saWJ4bC9saWJ4bF9kb20uYyAgICAgIHwgIDcg
KysrLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggfCAgNCArKysKIHRvb2xzL2xpYnhs
L2xpYnhsX21lbS5jICAgICAgfCA2NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLQogdG9vbHMveGwveGxfdm1jb250cm9sLmMgICAgICB8ICAyICstCiA1IGZpbGVz
IGNoYW5nZWQsIDgzIGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3Rvb2xzL2xpYnhsL2xpYnhsLmggYi90b29scy9saWJ4bC9saWJ4bC5oCmluZGV4IDUxOGZjOWU0
N2YuLjQ5YjU2ZmExYTMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsLmgKKysrIGIvdG9v
bHMvbGlieGwvbGlieGwuaApAQCAtMTI0NSw2ICsxMjQ1LDIwIEBAIHZvaWQgbGlieGxfbWFjX2Nv
cHkobGlieGxfY3R4ICpjdHgsIGxpYnhsX21hYyAqZHN0LCBjb25zdCBsaWJ4bF9tYWMgKnNyYyk7
CiAgKi8KICNkZWZpbmUgTElCWExfSEFWRV9GTl9VU0lOR19RTVBfQVNZTkMgMQogCisvKgorICog
TElCWExfSEFWRV9ET01BSU5fTkVFRF9NRU1PUllfQ09ORklHCisgKgorICogSWYgdGhpcyBpcyBz
ZXQsIGxpYnhsX2RvbWFpbl9uZWVkX21lbW9yeSB0YWtlcyBhCisgKiBsaWJ4bF9kb21haW5fY29u
ZmlnKiAobm9uLWNvbnN0KSBhbmQgdWludDMyX3QgZG9taWRfZm9yX2xvZ2dpbmcKKyAqIChpbnN0
ZWFkIG9mIGEgY29uc3QgbGlieGxfZG9tYWluX2J1aWxkX2luZm8qKS4KKyAqCisgKiBJZiB0aGlz
IGlzIHNldCwgdGhlcmUgaXMgbm8gbmVlZCB0byBjYWxsCisgKiBsaWJ4bF9nZXRfcmVxdWlyZWRf
c2hhZG93X21lbW9yeSBhbmQgaW5zdGVhZCB0aGUgY2FsbGVyIHNob3VsZAorICogc2ltcGx5IGxl
YXZlIHNoYWRvd19tZW1rYiBzZXQgdG8gTElCWExfTUVNS0JfREVGQVVMVCBhbmQgYWxsb3cKKyAq
IGxpYnhsIHRvIGZpbGwgaW4gYSBzdWl0YWJsZSBkZWZhdWx0IGluIHRoZSB1c3VhbCB3YXkuCisg
Ki8KKyNkZWZpbmUgTElCWExfSEFWRV9ET01BSU5fTkVFRF9NRU1PUllfQ09ORklHCisKIHR5cGVk
ZWYgY2hhciAqKmxpYnhsX3N0cmluZ19saXN0Owogdm9pZCBsaWJ4bF9zdHJpbmdfbGlzdF9kaXNw
b3NlKGxpYnhsX3N0cmluZ19saXN0ICpzbCk7CiBpbnQgbGlieGxfc3RyaW5nX2xpc3RfbGVuZ3Ro
KGNvbnN0IGxpYnhsX3N0cmluZ19saXN0ICpzbCk7CkBAIC0xNzIzLDggKzE3MzcsMTMgQEAgaW50
IGxpYnhsX2dldF9tZW1vcnlfdGFyZ2V0XzB4MDQwNzAwKGxpYnhsX2N0eCAqY3R4LCB1aW50MzJf
dCBkb21pZCwKICAqLwogLyogaG93IG11Y2ggZnJlZSBtZW1vcnkgaW4gdGhlIHN5c3RlbSBhIGRv
bWFpbiBuZWVkcyB0byBiZSBidWlsdCAqLwogaW50IGxpYnhsX2RvbWFpbl9uZWVkX21lbW9yeShs
aWJ4bF9jdHggKmN0eCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgbGlieGxf
ZG9tYWluX2J1aWxkX2luZm8gKmJfaW5mb19pbiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbGlieGxfZG9tYWluX2NvbmZpZyAqY29uZmlnCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC8qIF4gd2lsbCBiZSBwYXJ0aWFsbHkgZGVmYXVsdGVkICovLAorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1aW50MzJfdCBkb21pZF9mb3JfbG9nZ2luZyAvKiBJTlZBTElEX0RPTUlE
IG9rICovLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCAqbmVlZF9tZW1r
Yik7CitpbnQgbGlieGxfZG9tYWluX25lZWRfbWVtb3J5XzB4MDQxMjAwKGxpYnhsX2N0eCAqY3R4
LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBsaWJ4bF9kb21h
aW5fYnVpbGRfaW5mbyAqYl9pbmZvX2luLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1aW50NjRfdCAqbmVlZF9tZW1rYik7CiBpbnQgbGlieGxfZG9tYWluX25lZWRfbWVt
b3J5XzB4MDQwNzAwKGxpYnhsX2N0eCAqY3R4LAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb25zdCBsaWJ4bF9kb21haW5fYnVpbGRfaW5mbyAqYl9pbmZvX2luLAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCAqbmVlZF9tZW1rYikK
QEAgLTE3NTQsNiArMTc3Myw4IEBAIGludCBsaWJ4bF93YWl0X2Zvcl9tZW1vcnlfdGFyZ2V0KGxp
YnhsX2N0eCAqY3R4LCB1aW50MzJfdCBkb21pZCwgaW50IHdhaXRfc2Vjcyk7CiAjZGVmaW5lIGxp
YnhsX2dldF9tZW1vcnlfdGFyZ2V0IGxpYnhsX2dldF9tZW1vcnlfdGFyZ2V0XzB4MDQwNzAwCiAj
ZGVmaW5lIGxpYnhsX2RvbWFpbl9uZWVkX21lbW9yeSBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnlf
MHgwNDA3MDAKICNkZWZpbmUgbGlieGxfZ2V0X2ZyZWVfbWVtb3J5IGxpYnhsX2dldF9mcmVlX21l
bW9yeV8weDA0MDcwMAorI2VsaWYgZGVmaW5lZChMSUJYTF9BUElfVkVSU0lPTikgJiYgTElCWExf
QVBJX1ZFUlNJT04gPCAweDA0MTMwMAorI2RlZmluZSBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnkg
bGlieGxfZG9tYWluX25lZWRfbWVtb3J5XzB4MDQxMjAwCiAjZW5kaWYKIAogaW50IGxpYnhsX3Zu
Y3ZpZXdlcl9leGVjKGxpYnhsX2N0eCAqY3R4LCB1aW50MzJfdCBkb21pZCwgaW50IGF1dG9wYXNz
KTsKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbS5jIGIvdG9vbHMvbGlieGwvbGli
eGxfZG9tLmMKaW5kZXggYzU2ODViMDYxYy4uY2RiMjk0YWI4ZCAxMDA2NDQKLS0tIGEvdG9vbHMv
bGlieGwvbGlieGxfZG9tLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfZG9tLmMKQEAgLTE0MCw4
ICsxNDAsOSBAQCBzdGF0aWMgaW50IG51bWFfY21wZihjb25zdCBsaWJ4bF9fbnVtYV9jYW5kaWRh
dGUgKmMxLAogCiAvKiBUaGUgYWN0dWFsIGF1dG9tYXRpYyBOVU1BIHBsYWNlbWVudCByb3V0aW5l
ICovCiBzdGF0aWMgaW50IG51bWFfcGxhY2VfZG9tYWluKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90
IGRvbWlkLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9kb21haW5fYnVpbGRf
aW5mbyAqaW5mbykKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfZG9tYWluX2Nv
bmZpZyAqZF9jb25maWcpCiB7CisgICAgbGlieGxfZG9tYWluX2J1aWxkX2luZm8gKmluZm8gPSAm
ZF9jb25maWctPmJfaW5mbzsKICAgICBpbnQgZm91bmQ7CiAgICAgbGlieGxfX251bWFfY2FuZGlk
YXRlIGNhbmRpZGF0ZTsKICAgICBsaWJ4bF9iaXRtYXAgY3B1bWFwLCBjcHVwb29sX25vZGVtYXAs
ICptYXA7CkBAIC0xOTUsNyArMTk2LDcgQEAgc3RhdGljIGludCBudW1hX3BsYWNlX2RvbWFpbihs
aWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCwKICAgICAgICAgfQogICAgIH0KIAotICAgIHJj
ID0gbGlieGxfZG9tYWluX25lZWRfbWVtb3J5KENUWCwgaW5mbywgJm1lbWtiKTsKKyAgICByYyA9
IGxpYnhsX19kb21haW5fbmVlZF9tZW1vcnlfY2FsY3VsYXRlKGdjLCBpbmZvLCAmbWVta2IpOwog
ICAgIGlmIChyYykKICAgICAgICAgZ290byBvdXQ7CiAgICAgaWYgKGxpYnhsX25vZGVfYml0bWFw
X2FsbG9jKENUWCwgJmNwdXBvb2xfbm9kZW1hcCwgMCkpIHsKQEAgLTQzMiw3ICs0MzMsNyBAQCBp
bnQgbGlieGxfX2J1aWxkX3ByZShsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCwKICAgICAg
ICAgICAgIGlmIChyYykKICAgICAgICAgICAgICAgICByZXR1cm4gcmM7CiAKLSAgICAgICAgICAg
IHJjID0gbnVtYV9wbGFjZV9kb21haW4oZ2MsIGRvbWlkLCBpbmZvKTsKKyAgICAgICAgICAgIHJj
ID0gbnVtYV9wbGFjZV9kb21haW4oZ2MsIGRvbWlkLCBkX2NvbmZpZyk7CiAgICAgICAgICAgICBp
ZiAocmMpIHsKICAgICAgICAgICAgICAgICBsaWJ4bF9iaXRtYXBfZGlzcG9zZSgmY3B1bWFwX3Nv
ZnQpOwogICAgICAgICAgICAgICAgIHJldHVybiByYzsKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhs
L2xpYnhsX2ludGVybmFsLmggYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCmluZGV4IDUw
YWM3YjY0ZWQuLjAxZGU1NTc2ZDkgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVy
bmFsLmgKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaApAQCAtMTQ1MCw2ICsxNDUw
LDEwIEBAIF9oaWRkZW4gaW50IGxpYnhsX19kb21haW5fYnVpbGRfaW5mb19zZXRkZWZhdWx0KGxp
YnhsX19nYyAqZ2MsCiBfaGlkZGVuIHZvaWQgbGlieGxfX3JkbV9zZXRkZWZhdWx0KGxpYnhsX19n
YyAqZ2MsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2RvbWFpbl9i
dWlsZF9pbmZvICpiX2luZm8pOwogCitfaGlkZGVuIGludCBsaWJ4bF9fZG9tYWluX25lZWRfbWVt
b3J5X2NhbGN1bGF0ZShsaWJ4bF9fZ2MgKmdjLAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBsaWJ4bF9kb21haW5fYnVpbGRfaW5mbyAqYl9pbmZvLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCAqbmVlZF9tZW1rYik7CisKIF9oaWRk
ZW4gY29uc3QgY2hhciAqbGlieGxfX2RldmljZV9uaWNfZGV2bmFtZShsaWJ4bF9fZ2MgKmdjLAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGRv
bWlkLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQz
Ml90IGRldmlkLApkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfbWVtLmMgYi90b29scy9s
aWJ4bC9saWJ4bF9tZW0uYwppbmRleCBmZDZmMzMzMTJlLi42MDQyMjk5MzkzIDEwMDY0NAotLS0g
YS90b29scy9saWJ4bC9saWJ4bF9tZW0uYworKysgYi90b29scy9saWJ4bC9saWJ4bF9tZW0uYwpA
QCAtNDQ2LDIwICs0NDYsMTIgQEAgaW50IGxpYnhsX2dldF9tZW1vcnlfdGFyZ2V0XzB4MDQwNzAw
KAogICAgIHJldHVybiBsaWJ4bF9fbWVta2JfNjR0bzMyKGN0eCwgcmMsIG15X291dF90YXJnZXQs
IG91dF90YXJnZXQpOwogfQogCi1pbnQgbGlieGxfZG9tYWluX25lZWRfbWVtb3J5KGxpYnhsX2N0
eCAqY3R4LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBsaWJ4bF9kb21haW5f
YnVpbGRfaW5mbyAqYl9pbmZvX2luLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50
NjRfdCAqbmVlZF9tZW1rYikKK2ludCBsaWJ4bF9fZG9tYWluX25lZWRfbWVtb3J5X2NhbGN1bGF0
ZShsaWJ4bF9fZ2MgKmdjLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfZG9t
YWluX2J1aWxkX2luZm8gKmJfaW5mbywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVp
bnQ2NF90ICpuZWVkX21lbWtiKQogewotICAgIEdDX0lOSVQoY3R4KTsKLSAgICBsaWJ4bF9kb21h
aW5fYnVpbGRfaW5mbyBiX2luZm9bMV07CiAgICAgaW50IHJjOwogCi0gICAgbGlieGxfZG9tYWlu
X2J1aWxkX2luZm9faW5pdChiX2luZm8pOwotICAgIGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvX2Nv
cHkoY3R4LCBiX2luZm8sIGJfaW5mb19pbik7Ci0KLSAgICByYyA9IGxpYnhsX19kb21haW5fYnVp
bGRfaW5mb19zZXRkZWZhdWx0KGdjLCBiX2luZm8pOwotICAgIGlmIChyYykgZ290byBvdXQ7Ci0K
ICAgICAqbmVlZF9tZW1rYiA9IGJfaW5mby0+dGFyZ2V0X21lbWtiOwogICAgICpuZWVkX21lbWti
ICs9IGJfaW5mby0+c2hhZG93X21lbWtiICsgYl9pbmZvLT5pb21tdV9tZW1rYjsKIApAQCAtNDgx
LDEwICs0NzMsNTcgQEAgaW50IGxpYnhsX2RvbWFpbl9uZWVkX21lbW9yeShsaWJ4bF9jdHggKmN0
eCwKICAgICAgICAgKm5lZWRfbWVta2IgKz0gKDIgKiAxMDI0KSAtICgqbmVlZF9tZW1rYiAlICgy
ICogMTAyNCkpOwogICAgIHJjID0gMDsKIG91dDoKKyAgICByZXR1cm4gcmM7Cit9CisKK2ludCBs
aWJ4bF9kb21haW5fbmVlZF9tZW1vcnkobGlieGxfY3R4ICpjdHgsCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGxpYnhsX2RvbWFpbl9jb25maWcgKmRfY29uZmlnLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1aW50MzJfdCBkb21pZF9mb3JfbG9nZ2luZywKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdWludDY0X3QgKm5lZWRfbWVta2IpCit7CisgICAgR0NfSU5JVChj
dHgpOworICAgIGludCByYzsKKworICAgIHJjID0gbGlieGxfX2RvbWFpbl9jb25maWdfc2V0ZGVm
YXVsdChnYywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZF9jb25m
aWcsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRvbWlkX2Zvcl9s
b2dnaW5nKTsKKyAgICBpZiAocmMpIGdvdG8gb3V0OworCisgICAgcmMgPSBsaWJ4bF9fZG9tYWlu
X25lZWRfbWVtb3J5X2NhbGN1bGF0ZShnYywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgJmRfY29uZmlnLT5iX2luZm8sCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG5lZWRfbWVta2IpOworICAgIGlmIChyYykgZ290byBvdXQ7CisKKyAgICByYyA9IDA7Cisg
b3V0OgogICAgIEdDX0ZSRUU7Ci0gICAgbGlieGxfZG9tYWluX2J1aWxkX2luZm9fZGlzcG9zZShi
X2luZm8pOwogICAgIHJldHVybiByYzsKK30KKworaW50IGxpYnhsX2RvbWFpbl9uZWVkX21lbW9y
eV8weDA0MTIwMChsaWJ4bF9jdHggKmN0eCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29uc3QgbGlieGxfZG9tYWluX2J1aWxkX2luZm8gKmJfaW5mb19pbiwKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDY0X3QgKm5lZWRfbWVta2IpCit7
CisgICAgR0NfSU5JVChjdHgpOworICAgIGludCByYzsKKworICAgIGxpYnhsX2RvbWFpbl9idWls
ZF9pbmZvIGJfaW5mb1sxXTsKKyAgICBsaWJ4bF9kb21haW5fYnVpbGRfaW5mb19pbml0KGJfaW5m
byk7CisgICAgbGlieGxfZG9tYWluX2J1aWxkX2luZm9fY29weShjdHgsIGJfaW5mbywgYl9pbmZv
X2luKTsKKworICAgIHJjID0gbGlieGxfX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQoZ2Ms
IGJfaW5mbyk7CisgICAgaWYgKHJjKSBnb3RvIG91dDsKIAorICAgIHJjID0gbGlieGxfX2RvbWFp
bl9uZWVkX21lbW9yeV9jYWxjdWxhdGUoZ2MsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGJfaW5mbywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbmVlZF9t
ZW1rYik7CisgICAgaWYgKHJjKSBnb3RvIG91dDsKKworICAgIHJjID0gMDsKKyBvdXQ6CisgICAg
bGlieGxfZG9tYWluX2J1aWxkX2luZm9fZGlzcG9zZShiX2luZm8pOworICAgIEdDX0ZSRUU7Cisg
ICAgcmV0dXJuIHJjOwogfQogCiBpbnQgbGlieGxfZG9tYWluX25lZWRfbWVtb3J5XzB4MDQwNzAw
KGxpYnhsX2N0eCAqY3R4LApAQCAtNDk0LDcgKzUzMyw3IEBAIGludCBsaWJ4bF9kb21haW5fbmVl
ZF9tZW1vcnlfMHgwNDA3MDAobGlieGxfY3R4ICpjdHgsCiAgICAgdWludDY0X3QgbXlfbmVlZF9t
ZW1rYjsKICAgICBpbnQgcmM7CiAKLSAgICByYyA9IGxpYnhsX2RvbWFpbl9uZWVkX21lbW9yeShj
dHgsIGJfaW5mb19pbiwgJm15X25lZWRfbWVta2IpOworICAgIHJjID0gbGlieGxfZG9tYWluX25l
ZWRfbWVtb3J5XzB4MDQxMjAwKGN0eCwgYl9pbmZvX2luLCAmbXlfbmVlZF9tZW1rYik7CiAgICAg
cmV0dXJuIGxpYnhsX19tZW1rYl82NHRvMzIoY3R4LCByYywgbXlfbmVlZF9tZW1rYiwgbmVlZF9t
ZW1rYik7CiB9CiAKZGlmZiAtLWdpdCBhL3Rvb2xzL3hsL3hsX3ZtY29udHJvbC5jIGIvdG9vbHMv
eGwveGxfdm1jb250cm9sLmMKaW5kZXggZDMzYzZiMzhjOS4uZTUyMGIxZGE3OSAxMDA2NDQKLS0t
IGEvdG9vbHMveGwveGxfdm1jb250cm9sLmMKKysrIGIvdG9vbHMveGwveGxfdm1jb250cm9sLmMK
QEAgLTMyMiw3ICszMjIsNyBAQCBzdGF0aWMgYm9vbCBmcmVlbWVtKHVpbnQzMl90IGRvbWlkLCBs
aWJ4bF9kb21haW5fY29uZmlnICpkX2NvbmZpZykKICAgICBpZiAoIWF1dG9iYWxsb29uKQogICAg
ICAgICByZXR1cm4gdHJ1ZTsKIAotICAgIHJjID0gbGlieGxfZG9tYWluX25lZWRfbWVtb3J5KGN0
eCwgJmRfY29uZmlnLT5iX2luZm8sICZuZWVkX21lbWtiKTsKKyAgICByYyA9IGxpYnhsX2RvbWFp
bl9uZWVkX21lbW9yeShjdHgsIGRfY29uZmlnLCBkb21pZCwgJm5lZWRfbWVta2IpOwogICAgIGlm
IChyYyA8IDApCiAgICAgICAgIHJldHVybiBmYWxzZTsKIAotLSAKMi4xMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5319EA30D
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 19:10:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPsNV-0003aO-KN; Wed, 30 Oct 2019 18:07:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jdra=YX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iPsNU-0003a0-Hn
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 18:07:28 +0000
X-Inumbo-ID: 17681b5c-fb40-11e9-9534-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17681b5c-fb40-11e9-9534-12813bfff9fa;
 Wed, 30 Oct 2019 18:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572458830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0dWefj4/+b8rbkVlOsUUbwQY0QNVR+1RMsxu4gErpjo=;
 b=OHP3O1JILDZ71whQAJBS5zY8a17Er7H/l0UMI/83SnCWduSRmOrwzq/L
 KEUyhbF96/xB9oxTekSLltBxyMjMyrFW7HceAFS9+KA9c7mt0NVDIzK41
 og2EBewK6P2Uu3Fd2WHybFXZ+dn9/kZ+XppGyVh9VJ6WhSylnv0I1tLr6 Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FCq58AD39Og94oeVKwynXkjn320R/1xN0wWMWqAEsKQynlsRmxuqvu2B9jHTa1pLgZxxphBYU1
 PW2ilTGqZccnMDI4j5sVD5WjfJhvo7H2r7w7bvEfLTMMf8yYGnoOGsD/ZODzFAgzpWS5/dIyao
 75gpWrw+LFC91KYfZaCVOrdq23PthYQem8H17GrqYdDUlqqWGGswWGx0VF+7RK6pdN8B8pDWa3
 Z/48HIvpe7UHQT8WXy+VS8SUN3yBochqg97ng+A/vHe+XoKIh5zrD7ZWpi9F7IAb8hLNaW+TvT
 MDs=
X-SBRS: 2.7
X-MesageID: 7739502
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,248,1569297600"; 
   d="scan'208";a="7739502"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 30 Oct 2019 18:07:01 +0000
Message-ID: <20191030180704.261320-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030180704.261320-1-anthony.perard@citrix.com>
References: <20191030180704.261320-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v2 3/6] libxl: Rename ev_devlock to
 ev_slowlock
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
 =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgYXJlIGdvaW5nIHRvIGludHJvZHVjZSBhIGRpZmZlcmVudCBsb2NrIGJhc2VkIG9uIHRoZSBz
YW1lCmltcGxlbWVudGF0aW9uIGFzIHRoZSBldl9kZXZsb2NrIGJ1dCB3aXRoIGEgZGlmZmVyZW50
IHBhdGguIFRoZQpkaWZmZXJlbnQgc2xvd2xvY2sgd2lsbCBiZSBkaWZmZXJlbnRpYXRlZCBieSBj
YWxsaW5nIGRpZmZlcmVudCBfaW5pdCgpCmZ1bmN0aW9ucy4KClNvIHdlIHJlbmFtZSBsaWJ4bF9f
ZXZfZGV2bG9jayB0byBsaWJfX2V2X3Nsb3dsb2NrLCBidXQga2VlcApsaWJ4bF9fZXZfZGV2bG9j
a19pbml0KCkuCgpTb21lIGxvZyBtZXNzYWdlcyBwcm9kdWNlZCBldl9zbG93bG9jayBhcmUgY2hh
bmdlZCB0byBwcmludCB0aGUKbmFtZSBvZiB0aGUgbG9jayBmaWxlICh1c2VyZGF0YV91c2VyaWQp
LgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5j
b20+Ci0tLQoKTm90ZXM6CiAgICBOZXcgcGF0Y2ggaW4gdjIuCiAgICAgICAgSW5zdGVhZCBvZiBp
bnRyb2R1Y2luZyBtYW55IGxpYnhsX19ldl9xbXBsb2NrKi4KCiB0b29scy9saWJ4bC9saWJ4bF9k
aXNrLmMgICAgIHwgMTAgKysrKystLS0tLQogdG9vbHMvbGlieGwvbGlieGxfZG9tYWluLmMgICB8
IDEwICsrKysrLS0tLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmMgfCAzMCArKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggfCAz
MyArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgNDYg
aW5zZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwv
bGlieGxfZGlzay5jIGIvdG9vbHMvbGlieGwvbGlieGxfZGlzay5jCmluZGV4IDczM2FkMjg0Yzg2
Ni4uNzdhZTNhNTliZmI2IDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9kaXNrLmMKKysr
IGIvdG9vbHMvbGlieGwvbGlieGxfZGlzay5jCkBAIC02NDgsMTMgKzY0OCwxMyBAQCB0eXBlZGVm
IHN0cnVjdCB7CiAgICAgbGlieGxfZG9taWQgZG9taWQ7CiAgICAgbGlieGxfZGV2aWNlX2Rpc2sg
KmRpc2s7CiAgICAgbGlieGxfZGV2aWNlX2Rpc2sgZGlza19zYXZlZDsKLSAgICBsaWJ4bF9fZXZf
ZGV2bG9jayBxbXBfbG9jazsKKyAgICBsaWJ4bF9fZXZfc2xvd2xvY2sgcW1wX2xvY2s7CiAgICAg
aW50IGRtX3ZlcjsKICAgICBsaWJ4bF9fZXZfdGltZSB0aW1lOwogICAgIGxpYnhsX19ldl9xbXAg
cW1wOwogfSBsaWJ4bF9fY2Ryb21faW5zZXJ0X3N0YXRlOwogCi1zdGF0aWMgdm9pZCBjZHJvbV9p
bnNlcnRfbG9ja19hY3F1aXJlZChsaWJ4bF9fZWdjICosIGxpYnhsX19ldl9kZXZsb2NrICosCitz
dGF0aWMgdm9pZCBjZHJvbV9pbnNlcnRfbG9ja19hY3F1aXJlZChsaWJ4bF9fZWdjICosIGxpYnhs
X19ldl9zbG93bG9jayAqLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aW50IHJjKTsKIHN0YXRpYyB2b2lkIGNkcm9tX2luc2VydF9lamVjdGVkKGxpYnhsX19lZ2MgKmVn
YywgbGlieGxfX2V2X3FtcCAqLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3QgbGlieGxfX2pzb25fb2JqZWN0ICosIGludCByYyk7CkBAIC03NDYsMTMgKzc0NiwxMyBAQCBp
bnQgbGlieGxfY2Ryb21faW5zZXJ0KGxpYnhsX2N0eCAqY3R4LCB1aW50MzJfdCBkb21pZCwgbGli
eGxfZGV2aWNlX2Rpc2sgKmRpc2ssCiAgICAgICAgIGNkcm9tX2luc2VydF9kb25lKGVnYywgY2lz
LCByYyk7IC8qIG11c3QgYmUgbGFzdCAqLwogICAgIH0gZWxzZSB7CiAgICAgICAgIGNpcy0+cW1w
X2xvY2suY2FsbGJhY2sgPSBjZHJvbV9pbnNlcnRfbG9ja19hY3F1aXJlZDsKLSAgICAgICAgbGli
eGxfX2V2X2RldmxvY2tfbG9jayhlZ2MsICZjaXMtPnFtcF9sb2NrKTsgLyogbXVzdCBiZSBsYXN0
ICovCisgICAgICAgIGxpYnhsX19ldl9zbG93bG9ja19sb2NrKGVnYywgJmNpcy0+cW1wX2xvY2sp
OyAvKiBtdXN0IGJlIGxhc3QgKi8KICAgICB9CiAgICAgcmV0dXJuIEFPX0lOUFJPR1JFU1M7CiB9
CiAKIHN0YXRpYyB2b2lkIGNkcm9tX2luc2VydF9sb2NrX2FjcXVpcmVkKGxpYnhsX19lZ2MgKmVn
YywKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX19ldl9kZXZs
b2NrICpsb2NrLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxf
X2V2X3Nsb3dsb2NrICpsb2NrLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaW50IHJjKQogewogICAgIGxpYnhsX19jZHJvbV9pbnNlcnRfc3RhdGUgKmNpcyA9IENPTlRB
SU5FUl9PRihsb2NrLCAqY2lzLCBxbXBfbG9jayk7CkBAIC0xMDUyLDcgKzEwNTIsNyBAQCBzdGF0
aWMgdm9pZCBjZHJvbV9pbnNlcnRfZG9uZShsaWJ4bF9fZWdjICplZ2MsCiAgICAgbGlieGxfX2V2
X3RpbWVfZGVyZWdpc3RlcihnYywgJmNpcy0+dGltZSk7CiAgICAgbGlieGxfX2V2X3FtcF9kaXNw
b3NlKGdjLCAmY2lzLT5xbXApOwogICAgIGlmIChjaXMtPnFtcC5wYXlsb2FkX2ZkID49IDApIGNs
b3NlKGNpcy0+cW1wLnBheWxvYWRfZmQpOwotICAgIGxpYnhsX19ldl9kZXZsb2NrX3VubG9jayhn
YywgJmNpcy0+cW1wX2xvY2spOworICAgIGxpYnhsX19ldl9zbG93bG9ja191bmxvY2soZ2MsICZj
aXMtPnFtcF9sb2NrKTsKICAgICBsaWJ4bF9kZXZpY2VfZGlza19kaXNwb3NlKCZjaXMtPmRpc2tf
c2F2ZWQpOwogICAgIGxpYnhsX19hb19jb21wbGV0ZShlZ2MsIGNpcy0+YW8sIHJjKTsKIH0KZGlm
ZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jIGIvdG9vbHMvbGlieGwvbGlieGxf
ZG9tYWluLmMKaW5kZXggOWQwZWI1YWVkMTFkLi44NGViZmNjZWI4M2UgMTAwNjQ0Ci0tLSBhL3Rv
b2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5j
CkBAIC0xODc0LDEyICsxODc0LDEyIEBAIHR5cGVkZWYgc3RydWN0IHsKICAgICBsaWJ4bF9fZXZf
cW1wIHFtcDsKICAgICBsaWJ4bF9fZXZfdGltZSB0aW1lb3V0OwogICAgIGxpYnhsX2RvbWFpbl9j
b25maWcgKmRfY29uZmlnOyAvKiB1c2VyIHBvaW50ZXIgKi8KLSAgICBsaWJ4bF9fZXZfZGV2bG9j
ayBkZXZsb2NrOworICAgIGxpYnhsX19ldl9zbG93bG9jayBkZXZsb2NrOwogICAgIGxpYnhsX2Jp
dG1hcCBxZW11dV9jcHVzOwogfSByZXRyaWV2ZV9kb21haW5fY29uZmlndXJhdGlvbl9zdGF0ZTsK
IAogc3RhdGljIHZvaWQgcmV0cmlldmVfZG9tYWluX2NvbmZpZ3VyYXRpb25fbG9ja19hY3F1aXJl
ZCgKLSAgICBsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19ldl9kZXZsb2NrICosIGludCByYyk7Cisg
ICAgbGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9fZXZfc2xvd2xvY2sgKiwgaW50IHJjKTsKIHN0YXRp
YyB2b2lkIHJldHJpZXZlX2RvbWFpbl9jb25maWd1cmF0aW9uX2NwdV9xdWVyaWVkKAogICAgIGxp
YnhsX19lZ2MgKmVnYywgbGlieGxfX2V2X3FtcCAqcW1wLAogICAgIGNvbnN0IGxpYnhsX19qc29u
X29iamVjdCAqcmVzcG9uc2UsIGludCByYyk7CkBAIC0xOTA3LDEyICsxOTA3LDEyIEBAIGludCBs
aWJ4bF9yZXRyaWV2ZV9kb21haW5fY29uZmlndXJhdGlvbihsaWJ4bF9jdHggKmN0eCwgdWludDMy
X3QgZG9taWQsCiAgICAgcmRjcy0+ZGV2bG9jay5hbyA9IGFvOwogICAgIHJkY3MtPmRldmxvY2su
ZG9taWQgPSBkb21pZDsKICAgICByZGNzLT5kZXZsb2NrLmNhbGxiYWNrID0gcmV0cmlldmVfZG9t
YWluX2NvbmZpZ3VyYXRpb25fbG9ja19hY3F1aXJlZDsKLSAgICBsaWJ4bF9fZXZfZGV2bG9ja19s
b2NrKGVnYywgJnJkY3MtPmRldmxvY2spOworICAgIGxpYnhsX19ldl9zbG93bG9ja19sb2NrKGVn
YywgJnJkY3MtPmRldmxvY2spOwogICAgIHJldHVybiBBT19JTlBST0dSRVNTOwogfQogCiBzdGF0
aWMgdm9pZCByZXRyaWV2ZV9kb21haW5fY29uZmlndXJhdGlvbl9sb2NrX2FjcXVpcmVkKAotICAg
IGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX2V2X2RldmxvY2sgKmRldmxvY2ssIGludCByYykKKyAg
ICBsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19ldl9zbG93bG9jayAqZGV2bG9jaywgaW50IHJjKQog
ewogICAgIHJldHJpZXZlX2RvbWFpbl9jb25maWd1cmF0aW9uX3N0YXRlICpyZGNzID0KICAgICAg
ICAgQ09OVEFJTkVSX09GKGRldmxvY2ssICpyZGNzLCBkZXZsb2NrKTsKQEAgLTIyMDIsNyArMjIw
Miw3IEBAIHN0YXRpYyB2b2lkIHJldHJpZXZlX2RvbWFpbl9jb25maWd1cmF0aW9uX2VuZChsaWJ4
bF9fZWdjICplZ2MsCiAgICAgfQogCiBvdXQ6Ci0gICAgbGlieGxfX2V2X2RldmxvY2tfdW5sb2Nr
KGdjLCAmcmRjcy0+ZGV2bG9jayk7CisgICAgbGlieGxfX2V2X3Nsb3dsb2NrX3VubG9jayhnYywg
JnJkY3MtPmRldmxvY2spOwogICAgIGlmIChsb2NrKSBsaWJ4bF9fdW5sb2NrX2RvbWFpbl91c2Vy
ZGF0YShsb2NrKTsKICAgICBsaWJ4bF9iaXRtYXBfZGlzcG9zZSgmcmRjcy0+cWVtdXVfY3B1cyk7
CiAgICAgbGlieGxfX2V2X3FtcF9kaXNwb3NlKGdjLCAmcmRjcy0+cW1wKTsKZGlmZiAtLWdpdCBh
L3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmMgYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5h
bC5jCmluZGV4IDA3NTBiNjljYmE2MS4uOTUyMGFjMzYxNDllIDEwMDY0NAotLS0gYS90b29scy9s
aWJ4bC9saWJ4bF9pbnRlcm5hbC5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmMK
QEAgLTU3NSwyNSArNTc1LDMyIEBAIHZvaWQgbGlieGxfX3VwZGF0ZV9kb21haW5fY29uZmlndXJh
dGlvbihsaWJ4bF9fZ2MgKmdjLAogICAgIGRzdC0+Yl9pbmZvLnZpZGVvX21lbWtiID0gc3JjLT5i
X2luZm8udmlkZW9fbWVta2I7CiB9CiAKLXZvaWQgbGlieGxfX2V2X2RldmxvY2tfaW5pdChsaWJ4
bF9fZXZfZGV2bG9jayAqbG9jaykKK3N0YXRpYyB2b2lkIGV2X3Nsb3dsb2NrX2luaXRfaW50ZXJu
YWwobGlieGxfX2V2X3Nsb3dsb2NrICpsb2NrLAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb25zdCBjaGFyICp1c2VyZGF0YV91c2VyaWQpCiB7CiAgICAgbGlieGxfX2V2
X2NoaWxkX2luaXQoJmxvY2stPmNoaWxkKTsKKyAgICBsb2NrLT51c2VyZGF0YV91c2VyaWQgPSB1
c2VyZGF0YV91c2VyaWQ7CiAgICAgbG9jay0+cGF0aCA9IE5VTEw7CiAgICAgbG9jay0+ZmQgPSAt
MTsKICAgICBsb2NrLT5oZWxkID0gZmFsc2U7CiB9CiAKLXN0YXRpYyB2b2lkIGV2X2xvY2tfcHJl
cGFyZV9mb3JrKGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX2V2X2RldmxvY2sgKmxvY2spOwordm9p
ZCBsaWJ4bF9fZXZfZGV2bG9ja19pbml0KGxpYnhsX19ldl9zbG93bG9jayAqbG9jaykKK3sKKyAg
ICBldl9zbG93bG9ja19pbml0X2ludGVybmFsKGxvY2ssICJsaWJ4bC1kZXZpY2UtY2hhbmdlcy1s
b2NrIik7Cit9CisKK3N0YXRpYyB2b2lkIGV2X2xvY2tfcHJlcGFyZV9mb3JrKGxpYnhsX19lZ2Mg
KmVnYywgbGlieGxfX2V2X3Nsb3dsb2NrICpsb2NrKTsKIHN0YXRpYyB2b2lkIGV2X2xvY2tfY2hp
bGRfY2FsbGJhY2sobGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9fZXZfY2hpbGQgKmNoaWxkLAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwaWRfdCBwaWQsIGludCBzdGF0dXMpOwog
Ci12b2lkIGxpYnhsX19ldl9kZXZsb2NrX2xvY2sobGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9fZXZf
ZGV2bG9jayAqbG9jaykKK3ZvaWQgbGlieGxfX2V2X3Nsb3dsb2NrX2xvY2sobGlieGxfX2VnYyAq
ZWdjLCBsaWJ4bF9fZXZfc2xvd2xvY2sgKmxvY2spCiB7CiAgICAgU1RBVEVfQU9fR0MobG9jay0+
YW8pOwogICAgIGNvbnN0IGNoYXIgKmxvY2tmaWxlOwogCiAgICAgbG9ja2ZpbGUgPSBsaWJ4bF9f
dXNlcmRhdGFfcGF0aChnYywgbG9jay0+ZG9taWQsCi0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAibGlieGwtZGV2aWNlLWNoYW5nZXMtbG9jayIsICJsIik7CisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBsb2NrLT51c2VyZGF0YV91c2VyaWQsICJsIik7CiAg
ICAgaWYgKCFsb2NrZmlsZSkgZ290byBvdXQ7CiAgICAgbG9jay0+cGF0aCA9IGxpYnhsX19zdHJk
dXAoTk9HQywgbG9ja2ZpbGUpOwogCkBAIC02MDMsNyArNjEwLDcgQEAgdm9pZCBsaWJ4bF9fZXZf
ZGV2bG9ja19sb2NrKGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX2V2X2RldmxvY2sgKmxvY2spCiAg
ICAgbG9jay0+Y2FsbGJhY2soZWdjLCBsb2NrLCBFUlJPUl9MT0NLX0ZBSUwpOwogfQogCi1zdGF0
aWMgdm9pZCBldl9sb2NrX3ByZXBhcmVfZm9yayhsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19ldl9k
ZXZsb2NrICpsb2NrKQorc3RhdGljIHZvaWQgZXZfbG9ja19wcmVwYXJlX2ZvcmsobGlieGxfX2Vn
YyAqZWdjLCBsaWJ4bF9fZXZfc2xvd2xvY2sgKmxvY2spCiB7CiAgICAgU1RBVEVfQU9fR0MobG9j
ay0+YW8pOwogICAgIHBpZF90IHBpZDsKQEAgLTY3MCw3ICs2NzcsNyBAQCBzdGF0aWMgdm9pZCBl
dl9sb2NrX3ByZXBhcmVfZm9yayhsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19ldl9kZXZsb2NrICps
b2NrKQogICAgIGxpYnhsX2ZkX3NldF9jbG9leGVjKENUWCwgZmQsIDEpOwogICAgIHJldHVybjsK
IG91dDoKLSAgICBsaWJ4bF9fZXZfZGV2bG9ja191bmxvY2soZ2MsIGxvY2spOworICAgIGxpYnhs
X19ldl9zbG93bG9ja191bmxvY2soZ2MsIGxvY2spOwogICAgIGxvY2stPmNhbGxiYWNrKGVnYywg
bG9jaywgRVJST1JfTE9DS19GQUlMKTsKIH0KIApAQCAtNjc4LDcgKzY4NSw3IEBAIHN0YXRpYyB2
b2lkIGV2X2xvY2tfY2hpbGRfY2FsbGJhY2sobGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9fZXZfY2hp
bGQgKmNoaWxkLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwaWRfdCBwaWQs
IGludCBzdGF0dXMpCiB7CiAgICAgRUdDX0dDOwotICAgIGxpYnhsX19ldl9kZXZsb2NrICpsb2Nr
ID0gQ09OVEFJTkVSX09GKGNoaWxkLCAqbG9jaywgY2hpbGQpOworICAgIGxpYnhsX19ldl9zbG93
bG9jayAqbG9jayA9IENPTlRBSU5FUl9PRihjaGlsZCwgKmxvY2ssIGNoaWxkKTsKICAgICBzdHJ1
Y3Qgc3RhdCBzdGFiLCBmc3RhYjsKICAgICBpbnQgcmMgPSBFUlJPUl9MT0NLX0ZBSUw7CiAKQEAg
LTcyNiwxMyArNzMzLDE0IEBAIHN0YXRpYyB2b2lkIGV2X2xvY2tfY2hpbGRfY2FsbGJhY2sobGli
eGxfX2VnYyAqZWdjLCBsaWJ4bF9fZXZfY2hpbGQgKmNoaWxkLAogICAgICAgICAgICAgcmMgPSBF
UlJPUl9MT0NLX0ZBSUw7CiAgICAgfQogICAgIGlmIChyYykgewotICAgICAgICBMT0dEKEVSUk9S
LCBkb21pZCwgIkZhaWxlZCB0byBncmFiIHFtcC1sb2NrIik7Ci0gICAgICAgIGxpYnhsX19ldl9k
ZXZsb2NrX3VubG9jayhnYywgbG9jayk7CisgICAgICAgIExPR0QoRVJST1IsIGRvbWlkLCAiRmFp
bGVkIHRvIGdyYWIgbG9jayBmb3IgJXMiLAorICAgICAgICAgICAgIGxvY2stPnVzZXJkYXRhX3Vz
ZXJpZCk7CisgICAgICAgIGxpYnhsX19ldl9zbG93bG9ja191bmxvY2soZ2MsIGxvY2spOwogICAg
IH0KICAgICBsb2NrLT5jYWxsYmFjayhlZ2MsIGxvY2ssIHJjKTsKIH0KIAotdm9pZCBsaWJ4bF9f
ZXZfZGV2bG9ja191bmxvY2sobGlieGxfX2djICpnYywgbGlieGxfX2V2X2RldmxvY2sgKmxvY2sp
Cit2b2lkIGxpYnhsX19ldl9zbG93bG9ja191bmxvY2sobGlieGxfX2djICpnYywgbGlieGxfX2V2
X3Nsb3dsb2NrICpsb2NrKQogewogICAgIGludCByOwogCkBAIC03NTQsNyArNzYyLDcgQEAgdm9p
ZCBsaWJ4bF9fZXZfZGV2bG9ja191bmxvY2sobGlieGxfX2djICpnYywgbGlieGxfX2V2X2Rldmxv
Y2sgKmxvY2spCiAgICAgICAgIGNsb3NlKGxvY2stPmZkKTsKICAgICB9CiAgICAgZnJlZShsb2Nr
LT5wYXRoKTsKLSAgICBsaWJ4bF9fZXZfZGV2bG9ja19pbml0KGxvY2spOworICAgIGV2X3Nsb3ds
b2NrX2luaXRfaW50ZXJuYWwobG9jaywgbG9jay0+dXNlcmRhdGFfdXNlcmlkKTsKIH0KIAogLyoK
ZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggYi90b29scy9saWJ4bC9s
aWJ4bF9pbnRlcm5hbC5oCmluZGV4IDY5ZDU3MmMxODY2YS4uYTBmOTkyNTJjMzljIDEwMDY0NAot
LS0gYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhs
X2ludGVybmFsLmgKQEAgLTE5Niw3ICsxOTYsNyBAQCB0eXBlZGVmIHN0cnVjdCBsaWJ4bF9fb3Nl
dmVudF9ob29rX25leGkgbGlieGxfX29zZXZlbnRfaG9va19uZXhpOwogdHlwZWRlZiBzdHJ1Y3Qg
bGlieGxfX2RldmljZV90eXBlIGxpYnhsX19kZXZpY2VfdHlwZTsKIHR5cGVkZWYgc3RydWN0IGxp
YnhsX19qc29uX29iamVjdCBsaWJ4bF9fanNvbl9vYmplY3Q7CiB0eXBlZGVmIHN0cnVjdCBsaWJ4
bF9fY2FyZWZkIGxpYnhsX19jYXJlZmQ7Ci10eXBlZGVmIHN0cnVjdCBsaWJ4bF9fZXZfZGV2bG9j
ayBsaWJ4bF9fZXZfZGV2bG9jazsKK3R5cGVkZWYgc3RydWN0IGxpYnhsX19ldl9zbG93bG9jayBs
aWJ4bF9fZXZfc2xvd2xvY2s7CiB0eXBlZGVmIHN0cnVjdCBsaWJ4bF9fZG1fcmVzdW1lX3N0YXRl
IGxpYnhsX19kbV9yZXN1bWVfc3RhdGU7CiB0eXBlZGVmIHN0cnVjdCBsaWJ4bF9fYW9fZGV2aWNl
IGxpYnhsX19hb19kZXZpY2U7CiB0eXBlZGVmIHN0cnVjdCBsaWJ4bF9fbXVsdGlkZXYgbGlieGxf
X211bHRpZGV2OwpAQCAtMzY2LDcgKzM2Niw3IEBAIHN0cnVjdCBsaWJ4bF9fZXZfY2hpbGQgewog
LyoKICAqIExvY2sgZm9yIGRldmljZSBob3RwbHVnLCBxbXBfbG9jay4KICAqCi0gKiBsaWJ4bF9f
ZXZfZGV2bG9jayBpbXBsZW1lbnQgYSBsb2NrIHRoYXQgaXMgb3V0c2lkZSBvZiBDVFhfTE9DSyBp
biB0aGUKKyAqIGxpYnhsX19ldl9zbG93bG9jayBpbXBsZW1lbnQgYSBsb2NrIHRoYXQgaXMgb3V0
c2lkZSBvZiBDVFhfTE9DSyBpbiB0aGUKICAqIGxvY2sgaGllcmFyY2h5LiBJdCBjYW4gYmUgdXNl
ZCB3aGVuIG9uZSB3YW50IHRvIG1ha2UgUU1QIGNhbGxzIHRvIFFFTVUsCiAgKiB3aGljaCBtYXkg
dGFrZSBhIHNpZ25pZmljYW50IGFtb3VudCB0aW1lLgogICogSXQgaXMgdG8gYmUgYWNxdWlyZWQg
YnkgYW4gYW8gZXZlbnQgY2FsbGJhY2suCkBAIC0zNzQsNDIgKzM3NCw0MyBAQCBzdHJ1Y3QgbGli
eGxfX2V2X2NoaWxkIHsKICAqIEl0IGlzIHRvIGJlIGFjcXVpcmVkIHdoZW4gYWRkaW5nL3JlbW92
aW5nIGRldmljZXMgb3IgbWFraW5nIGNoYW5nZXMKICAqIHRvIHRoZW0gd2hlbiB0aGlzIGlzIGEg
c2xvdyBvcGVyYXRpb24gYW5kIGpzb25fbG9jayBpc24ndCBhcHByb3ByaWF0ZS4KICAqCi0gKiBQ
b3NzaWJsZSBzdGF0ZXMgb2YgbGlieGxfX2V2X2RldmxvY2s6CisgKiBQb3NzaWJsZSBzdGF0ZXMg
b2YgbGlieGxfX2V2X3Nsb3dsb2NrOgogICogICBVbmRlZmluZWQKICAqICAgIE1pZ2h0IGNvbnRh
aW4gYW55dGhpbmcuCiAgKiAgSWRsZQogICogICAgU3RydWN0IGNvbnRlbnRzIGFyZSBkZWZpbmVk
IGVub3VnaCB0byBwYXNzIHRvIGFueQotICogICAgbGlieGxfX2V2X2RldmxvY2tfKiBmdW5jdGlv
bi4KKyAqICAgIGxpYnhsX19ldl9zbG93bG9ja18qIGZ1bmN0aW9uLgogICogICAgVGhlIHN0cnVj
dCBkb2VzIG5vdCBjb250YWluIHJlZmVyZW5jZXMgdG8gYW55IGFsbG9jYXRlZCBwcml2YXRlCiAg
KiAgICByZXNvdXJjZXMgc28gY2FuIGJlIHRocm93biBhd2F5LgogICogIEFjdGl2ZQogICogICAg
V2FpdGluZyB0byBnZXQgYSBsb2NrLgogICogICAgTmVlZHMgdG8gd2FpdCB1bnRpbCB0aGUgY2Fs
bGJhY2sgaXMgY2FsbGVkLgogICogIExvY2tBY3F1aXJlZAotICogICAgbGlieGxfX2V2X2Rldmxv
Y2tfdW5sb2NrIHdpbGwgbmVlZCB0byBiZSBjYWxsZWQgdG8gcmVsZWFzZSB0aGUgbG9jawotICog
ICAgYW5kIHRoZSByZXNvdXJjZXMgb2YgbGlieGxfX2V2X2RldmxvY2suCisgKiAgICBsaWJ4bF9f
ZXZfc2xvd2xvY2tfdW5sb2NrIHdpbGwgbmVlZCB0byBiZSBjYWxsZWQgdG8gcmVsZWFzZSB0aGUg
bG9jaworICogICAgYW5kIHRoZSByZXNvdXJjZXMgb2YgbGlieGxfX2V2X3Nsb3dsb2NrLgogICoK
LSAqICBsaWJ4bF9fZXZfZGV2bG9ja19pbml0OiBVbmRlZmluZWQvSWRsZSAtPiBJZGxlCi0gKiAg
bGlieGxfX2V2X2RldmxvY2tfbG9jazogSWRsZSAtPiBBY3RpdmUKKyAqICBsaWJ4bF9fZXZfKmxv
Y2tfaW5pdDogVW5kZWZpbmVkL0lkbGUgLT4gSWRsZQorICogIGxpYnhsX19ldl9zbG93bG9ja19s
b2NrOiBJZGxlIC0+IEFjdGl2ZQogICogICAgTWF5IGNhbGwgY2FsbGJhY2sgc3luY2hyb25vdXNs
eS4KLSAqICBsaWJ4bF9fZXZfZGV2bG9ja191bmxvY2s6IExvY2tBY3F1aXJlZC9JZGxlIC0+IElk
bGUKKyAqICBsaWJ4bF9fZXZfc2xvd2xvY2tfdW5sb2NrOiBMb2NrQWNxdWlyZWQvSWRsZSAtPiBJ
ZGxlCiAgKiAgY2FsbGJhY2s6ICAgICBXaGVuIGNhbGxlZDogQWN0aXZlIC0+IExvY2tBY3F1aXJl
ZCAob24gZXJyb3I6IElkbGUpCiAgKiAgICBUaGUgY2FsbGJhY2sgaXMgb25seSBjYWxsZWQgb25j
ZS4KICAqLwotc3RydWN0IGxpYnhsX19ldl9kZXZsb2NrIHsKK3N0cnVjdCBsaWJ4bF9fZXZfc2xv
d2xvY2sgewogICAgIC8qIGZpbGxlZCBieSB1c2VyICovCiAgICAgbGlieGxfX2FvICphbzsKICAg
ICBsaWJ4bF9kb21pZCBkb21pZDsKLSAgICB2b2lkICgqY2FsbGJhY2spKGxpYnhsX19lZ2MgKiwg
bGlieGxfX2V2X2RldmxvY2sgKiwgaW50IHJjKTsKLSAgICAvKiBwcml2YXRlIHRvIGxpYnhsX19l
dl9kZXZsb2NrKiAqLworICAgIHZvaWQgKCpjYWxsYmFjaykobGlieGxfX2VnYyAqLCBsaWJ4bF9f
ZXZfc2xvd2xvY2sgKiwgaW50IHJjKTsKKyAgICAvKiBwcml2YXRlIHRvIGxpYnhsX19ldl9zbG93
bG9jayogKi8KICAgICBsaWJ4bF9fZXZfY2hpbGQgY2hpbGQ7CisgICAgY29uc3QgY2hhciAqdXNl
cmRhdGFfdXNlcmlkOwogICAgIGNoYXIgKnBhdGg7IC8qIHBhdGggb2YgdGhlIGxvY2sgZmlsZSBp
dHNlbGYgKi8KICAgICBpbnQgZmQ7CiAgICAgYm9vbCBoZWxkOwogfTsKLV9oaWRkZW4gdm9pZCBs
aWJ4bF9fZXZfZGV2bG9ja19pbml0KGxpYnhsX19ldl9kZXZsb2NrICopOwotX2hpZGRlbiB2b2lk
IGxpYnhsX19ldl9kZXZsb2NrX2xvY2sobGlieGxfX2VnYyAqLCBsaWJ4bF9fZXZfZGV2bG9jayAq
KTsKLV9oaWRkZW4gdm9pZCBsaWJ4bF9fZXZfZGV2bG9ja191bmxvY2sobGlieGxfX2djICosIGxp
YnhsX19ldl9kZXZsb2NrICopOworX2hpZGRlbiB2b2lkIGxpYnhsX19ldl9kZXZsb2NrX2luaXQo
bGlieGxfX2V2X3Nsb3dsb2NrICopOworX2hpZGRlbiB2b2lkIGxpYnhsX19ldl9zbG93bG9ja19s
b2NrKGxpYnhsX19lZ2MgKiwgbGlieGxfX2V2X3Nsb3dsb2NrICopOworX2hpZGRlbiB2b2lkIGxp
YnhsX19ldl9zbG93bG9ja191bmxvY2sobGlieGxfX2djICosIGxpYnhsX19ldl9zbG93bG9jayAq
KTsKIAogLyoKICAqIFFNUCBhc3luY2hyb25vdXMgY2FsbHMKQEAgLTI4NTMsNyArMjg1NCw3IEBA
IHN0cnVjdCBsaWJ4bF9fbXVsdGlkZXYgewogICogICB1bmxvY2sganNvbiBjb25maWcKICAqCiAg
KiBPciBpbiBjYXNlIFFFTVUgaXMgdGhlIHByaW1hcnkgY29uZmlnLCB0aGlzIHBhdHRlcm4gY2Fu
IGJlIHVzZToKLSAqICAgcW1wX2xvY2sgKGxpYnhsX19ldl9kZXZsb2NrKQorICogICBxbXBfbG9j
ayAobGlieGxfX2V2X2RldmxvY2tfaW5pdCkKICAqICAgICAgbG9jayBqc29uIGNvbmZpZyAoanNv
bl9sb2NrKQogICogICAgICAgICAgcmVhZCBqc29uIGNvbmZpZwogICogICAgICAgICAgdXBkYXRl
IGluLW1lbW9yeSBqc29uIGNvbmZpZyB3aXRoIG5ldyBlbnRyeSwgcmVwbGFjaW5nCi0tIApBbnRo
b255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

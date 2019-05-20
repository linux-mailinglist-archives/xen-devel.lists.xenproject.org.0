Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DABC923C7A
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 17:45:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSkRJ-0006l7-02; Mon, 20 May 2019 15:43:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=26W0=TU=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hSkRH-0006kn-6v
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 15:42:59 +0000
X-Inumbo-ID: f0a09087-7b15-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f0a09087-7b15-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 15:42:57 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: +KVTCyCkECIuWTU6n6t5Gs8tvQjNCsrW2HdxnTYVkD5DCsCXt1GWdQnCd+OumYGjr50P/c4eAr
 JfLxKSpA+x31gyjGCrcO2RhABYlu83J9RSmBeWk1zgHFMufUAZDirIG/MuQPTEBI0csY8rX9G7
 yOu3zprjsC3ENNwOOFflys4GNdJDD/D93wcVNcFBw7MVqqYM/OsXYqxbGfx6yI7VAZmnfN3YYk
 UVRacvfM642tfi/AQfdoiM+n8+9iklcTY8QWLtqq2C3819aGfVZUepFqC0d5iZ+bryKFZFF6fZ
 aJw=
X-SBRS: 2.7
X-MesageID: 661820
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="661820"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 20 May 2019 16:41:45 +0100
Message-ID: <20190520154147.30675-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190520154147.30675-1-ian.jackson@eu.citrix.com>
References: <20190520154147.30675-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 2/4] mg-transient-task: New utility
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2lsbCBiZSB1c2VmdWwgaW4gY29tYmluYXRpb24gd2l0aCBuZXcgbW9kZShzKSBvZiBtZy1yZXBy
by1zZXR1cC4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRy
aXguY29tPgotLS0KIG1nLXRyYW5zaWVudC10YXNrIHwgMzIgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9k
ZSAxMDA3NTUgbWctdHJhbnNpZW50LXRhc2sKCmRpZmYgLS1naXQgYS9tZy10cmFuc2llbnQtdGFz
ayBiL21nLXRyYW5zaWVudC10YXNrCm5ldyBmaWxlIG1vZGUgMTAwNzU1CmluZGV4IDAwMDAwMDAw
Li4yYjNiMzE1ZQotLS0gL2Rldi9udWxsCisrKyBiL21nLXRyYW5zaWVudC10YXNrCkBAIC0wLDAg
KzEsMzIgQEAKKyMhL3Vzci9iaW4vdGNsc2g4LjUKKyMgLSotIFRjbCAtKi0gCisjIHVzYWdlOiAu
L21nLXRyYW5zaWVudC10YXNrIFBST0dSQU0gW0FSR1MuLi5dCisKKyMgVGhpcyBpcyBwYXJ0IG9m
ICJvc3N0ZXN0IiwgYW4gYXV0b21hdGVkIHRlc3RpbmcgZnJhbWV3b3JrIGZvciBYZW4uCisjIENv
cHlyaWdodCAoQykgMjAwOS0yMDE5IENpdHJpeCBJbmMuCisjIAorIyBUaGlzIHByb2dyYW0gaXMg
ZnJlZSBzb2Z0d2FyZTogeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQorIyBp
dCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBBZmZlcm8gR2VuZXJhbCBQdWJsaWMgTGljZW5z
ZSBhcyBwdWJsaXNoZWQgYnkKKyMgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgZWl0aGVy
IHZlcnNpb24gMyBvZiB0aGUgTGljZW5zZSwgb3IKKyMgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0
ZXIgdmVyc2lvbi4KKyMgCisjIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9w
ZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorIyBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdp
dGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgorIyBNRVJDSEFOVEFCSUxJVFkgb3Ig
RklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCisjIEdOVSBBZmZlcm8g
R2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorIyAKKyMgWW91IHNob3Vs
ZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEFmZmVybyBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlCisjIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtLiAgSWYgbm90LCBzZWUgPGh0dHA6Ly93
d3cuZ251Lm9yZy9saWNlbnNlcy8+LgorCitwYWNrYWdlIHJlcXVpcmUgVGNseAorCitzb3VyY2Ug
Li90Y2wvZGFlbW9ubGliLnRjbAorCitqb2JkYjo6YmVjb21lLXRhc2sgW3N0cmluZyByYW5nZSAi
JGFyZ3YiIDAgNTBdCitleGVjIDI+QCBzdGRlcnIgcGVybCAtSS4gLWUgeworICAgICAgICB1c2Ug
T3NzdGVzdDsKKyAgICAgICAgdXNlIE9zc3Rlc3Q6OkV4ZWN1dGl2ZTsKKyAgICAgICAgY3NyZWFk
Y29uZmlnKCk7CisgICAgICAgIGZpbmR0YXNrKCkKK30KK2V4ZWNsIFtsaW5kZXggJGFyZ3YgMF0g
W2xyYW5nZSAkYXJndiAxIGVuZF0KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=

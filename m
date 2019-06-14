Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B9B45B67
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 13:28:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbkKJ-0007SN-SJ; Fri, 14 Jun 2019 11:24:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y8Mf=UN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hbkKI-0007Rs-1o
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 11:24:58 +0000
X-Inumbo-ID: 083ddd76-8e97-11e9-bcb6-c71690691944
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 083ddd76-8e97-11e9-bcb6-c71690691944;
 Fri, 14 Jun 2019 11:24:54 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cIw7zh1P+Og1z/F7b764TOe+7i8Ycs8T3/dXt2wEgffCYNauiWg8ruWNyB8WGa9ktH08WbPC0V
 J7Bl3IBg8W5XRZ7PLQXGeiDd47n6tKEOJgDj4090fvg7sesqJnNg731ftfXr7k+uLyPsNRRdNA
 0g0t0UtTwzntmjCgufhsvOqsx58emsS2PdBtyv8heQwVUIS0aqfOciCbA36nlVhRfgkcmXhJG9
 Iki9eEFErKPwaB485piGY04YHfGj08W+vjWAOa/38rwSreUcgsPdvmqQOYnpKHJ0QDIHjQdB0Z
 pdM=
X-SBRS: 2.7
X-MesageID: 1737468
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,373,1557201600"; 
   d="scan'208";a="1737468"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 14 Jun 2019 12:24:36 +0100
Message-ID: <20190614112444.29980-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190614112444.29980-1-anthony.perard@citrix.com>
References: <20190614112444.29980-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 07/15] libxl_dm: Fix initialisation of
 libxl__stub_dm_spawn_state
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
Cc: Anthony
 PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

c2Rzcy0+cHZxZW11IHdhc24ndCBpbml0aWFsaWFzZWQgYW5kIGRpc3Bvc2VkIG9mIHByb3Blcmx5
LgpBbHNvLCBtb3ZlIHRoZSBpbml0aWFsaXNhdGlvbiBvZiBzZHNzLT54c3dhaXQgd2l0aCB0aGUg
cmVzdCBvZiB0aGUKaW5pdGlhbGlzYXRpb24gb2Ygc2Rzcy4KClNpZ25lZC1vZmYtYnk6IEFudGhv
bnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhsL2xp
YnhsX2RtLmMgfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9kbS5jIGIvdG9vbHMv
bGlieGwvbGlieGxfZG0uYwppbmRleCAzNDhjM2ZkZGY1Li41OTQyZTcwYzE2IDEwMDY0NAotLS0g
YS90b29scy9saWJ4bC9saWJ4bF9kbS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKQEAg
LTIxMDUsOCArMjEwNSwxMSBAQCB2b2lkIGxpYnhsX19zcGF3bl9zdHViX2RtKGxpYnhsX19lZ2Mg
KmVnYywgbGlieGxfX3N0dWJfZG1fc3Bhd25fc3RhdGUgKnNkc3MpCiAgICAgbGlieGxfX2RvbWFp
bl9idWlsZF9zdGF0ZSAqY29uc3QgZF9zdGF0ZSA9IHNkc3MtPmRtLmJ1aWxkX3N0YXRlOwogICAg
IGxpYnhsX19kb21haW5fYnVpbGRfc3RhdGUgKmNvbnN0IHN0dWJkb21fc3RhdGUgPSAmc2Rzcy0+
ZG1fc3RhdGU7CiAKKyAgICAvKiBJbml0aWFsaXNlIHByaXZhdGUgcGFydCBvZiBzZHNzICovCiAg
ICAgbGlieGxfX2RvbWFpbl9idWlsZF9zdGF0ZV9pbml0KHN0dWJkb21fc3RhdGUpOwogICAgIGRt
c3NfaW5pdCgmc2Rzcy0+ZG0pOworICAgIGRtc3NfaW5pdCgmc2Rzcy0+cHZxZW11KTsKKyAgICBs
aWJ4bF9feHN3YWl0X2luaXQoJnNkc3MtPnhzd2FpdCk7CiAKICAgICBpZiAoZ3Vlc3RfY29uZmln
LT5iX2luZm8uZGV2aWNlX21vZGVsX3ZlcnNpb24gIT0KICAgICAgICAgTElCWExfREVWSUNFX01P
REVMX1ZFUlNJT05fUUVNVV9YRU5fVFJBRElUSU9OQUwpIHsKQEAgLTIzOTEsOCArMjM5NCw2IEBA
IHN0YXRpYyB2b2lkIHN0dWJkb21fcHZxZW11X2NiKGxpYnhsX19lZ2MgKmVnYywKICAgICBTVEFU
RV9BT19HQyhzZHNzLT5kbS5zcGF3bi5hbyk7CiAgICAgdWludDMyX3QgZG1fZG9taWQgPSBzZHNz
LT5wdnFlbXUuZ3Vlc3RfZG9taWQ7CiAKLSAgICBsaWJ4bF9feHN3YWl0X2luaXQoJnNkc3MtPnhz
d2FpdCk7Ci0KICAgICBpZiAocmMpIHsKICAgICAgICAgTE9HRUQoRVJST1IsIHNkc3MtPmRtLmd1
ZXN0X2RvbWlkLAogICAgICAgICAgICAgICAiZXJyb3IgY29ubmVjdGluZyBuaWNzIGRldmljZXMi
KTsKQEAgLTI0MzksNiArMjQ0MCw3IEBAIHN0YXRpYyB2b2lkIHN0dWJkb21feHN3YWl0X2NiKGxp
YnhsX19lZ2MgKmVnYywgbGlieGxfX3hzd2FpdF9zdGF0ZSAqeHN3YWl0LAogICAgIGxpYnhsX19k
b21haW5fYnVpbGRfc3RhdGVfZGlzcG9zZSgmc2Rzcy0+ZG1fc3RhdGUpOwogICAgIGxpYnhsX194
c3dhaXRfc3RvcChnYywgeHN3YWl0KTsKICAgICBkbXNzX2Rpc3Bvc2UoZ2MsICZzZHNzLT5kbSk7
CisgICAgZG1zc19kaXNwb3NlKGdjLCAmc2Rzcy0+cHZxZW11KTsKICAgICBzZHNzLT5jYWxsYmFj
ayhlZ2MsICZzZHNzLT5kbSwgcmMpOwogfQogCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

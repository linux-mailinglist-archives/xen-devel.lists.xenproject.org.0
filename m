Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE337FDFD
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 18:01:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZwM-0005ob-2E; Fri, 02 Aug 2019 15:57:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qji5=V6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1htZwK-0005np-7m
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:57:56 +0000
X-Inumbo-ID: 4a78d4cb-b53e-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4a78d4cb-b53e-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 15:57:55 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /6TKK2qH5S5YElF3zwnOvD2vnWV1w9jTvnBMmkqf6FdWRB3RbWyPhDQewOhv3aOm5aPBzYLn18
 OUBiWVNZWGoEz2PNbcK5ghH4Asmumgr18kd561LBb2VC1n796qMdA59gtzFFn/Qb25fceMy4ma
 Uuli3t5sNVOpGn8Ew04nwY5CfzGDGBf/o+kiPHVns+5UsuYy7b+xth58/nerb9VNxBZ6ql5m2H
 BLbajjkuveB+cYsfe7qMizwR7gDkErvwzEAvFQZ4MQO2uVMl7co+hTJQ7SB+Ud/9H5OIAohWLi
 41o=
X-SBRS: 2.7
X-MesageID: 3931659
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,338,1559534400"; 
   d="scan'208";a="3931659"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 2 Aug 2019 16:36:06 +0100
Message-ID: <20190802153606.32061-36-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802153606.32061-1-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 35/35] libxl: libxl_qemu_monitor_command now
 uses ev_qmp
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfcW1wLmMgfCA1MiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMgYi90b29s
cy9saWJ4bC9saWJ4bF9xbXAuYwppbmRleCA5NjM5ZDQ5MWQ5Li45YWFiYWQ3NGZhIDEwMDY0NAot
LS0gYS90b29scy9saWJ4bC9saWJ4bF9xbXAuYworKysgYi90b29scy9saWJ4bC9saWJ4bF9xbXAu
YwpAQCAtODkyLDE5ICs4OTIsNjcgQEAgaW50IGxpYnhsX19xbXBfaG1wKGxpYnhsX19nYyAqZ2Ms
IGludCBkb21pZCwgY29uc3QgY2hhciAqY29tbWFuZF9saW5lLAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaG1wX2NhbGxiYWNrLCBvdXRwdXQpOwogfQogCisKK3R5cGVkZWYgc3RydWN0IHsK
KyAgICBsaWJ4bF9fZXZfcW1wIHFtcDsKKyAgICBjaGFyICoqb3V0cHV0OyAvKiB1c2VyIHBvaW50
ZXIgKi8KK30gcWVtdV9tb25pdG9yX2NvbW1hbmRfc3RhdGU7CisKK3N0YXRpYyB2b2lkIHFlbXVf
bW9uaXRvcl9jb21tYW5kX2RvbmUobGlieGxfX2VnYyAqLCBsaWJ4bF9fZXZfcW1wICosCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGxpYnhsX19qc29uX29iamVj
dCAqcmVzcG9uc2UsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBy
Yyk7CisKIGludCBsaWJ4bF9xZW11X21vbml0b3JfY29tbWFuZChsaWJ4bF9jdHggKmN0eCwgdWlu
dDMyX3QgZG9taWQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAq
Y29tbWFuZF9saW5lLCBjaGFyICoqb3V0cHV0LAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnN0IGxpYnhsX2FzeW5jb3BfaG93ICphb19ob3cpCiB7CiAgICAgQU9fQ1JFQVRFKGN0
eCwgZG9taWQsIGFvX2hvdyk7CisgICAgcWVtdV9tb25pdG9yX2NvbW1hbmRfc3RhdGUgKnFtY3M7
CisgICAgbGlieGxfX2pzb25fb2JqZWN0ICphcmdzID0gTlVMTDsKICAgICBpbnQgcmM7CiAKLSAg
ICByYyA9IGxpYnhsX19xbXBfaG1wKGdjLCBkb21pZCwgY29tbWFuZF9saW5lLCBvdXRwdXQpOwor
ICAgIGlmICghb3V0cHV0KSB7CisgICAgICAgIHJjID0gRVJST1JfSU5WQUw7CisgICAgICAgIGdv
dG8gb3V0OworICAgIH0KIAotICAgIGxpYnhsX19hb19jb21wbGV0ZShlZ2MsIGFvLCByYyk7Cisg
ICAgR0NORVcocW1jcyk7CisgICAgbGlieGxfX2V2X3FtcF9pbml0KCZxbWNzLT5xbXApOworICAg
IHFtY3MtPnFtcC5hbyA9IGFvOworICAgIHFtY3MtPnFtcC5kb21pZCA9IGRvbWlkOworICAgIHFt
Y3MtPnFtcC5wYXlsb2FkX2ZkID0gLTE7CisgICAgcW1jcy0+cW1wLmNhbGxiYWNrID0gcWVtdV9t
b25pdG9yX2NvbW1hbmRfZG9uZTsKKyAgICBxbWNzLT5vdXRwdXQgPSBvdXRwdXQ7CisgICAgbGli
eGxfX3FtcF9wYXJhbV9hZGRfc3RyaW5nKGdjLCAmYXJncywgImNvbW1hbmQtbGluZSIsIGNvbW1h
bmRfbGluZSk7CisgICAgcmMgPSBsaWJ4bF9fZXZfcW1wX3NlbmQoZ2MsICZxbWNzLT5xbXAsICJo
dW1hbi1tb25pdG9yLWNvbW1hbmQiLCBhcmdzKTsKK291dDoKKyAgICBpZiAocmMpIHJldHVybiBB
T19DUkVBVEVfRkFJTChyYyk7CiAgICAgcmV0dXJuIEFPX0lOUFJPR1JFU1M7CiB9CiAKK3N0YXRp
YyB2b2lkIHFlbXVfbW9uaXRvcl9jb21tYW5kX2RvbmUobGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9f
ZXZfcW1wICpxbXAsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0
IGxpYnhsX19qc29uX29iamVjdCAqcmVzcG9uc2UsCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGludCByYykKK3sKKyAgICBTVEFURV9BT19HQyhxbXAtPmFvKTsKKyAgICBx
ZW11X21vbml0b3JfY29tbWFuZF9zdGF0ZSAqcW1jcyA9IENPTlRBSU5FUl9PRihxbXAsICpxbWNz
LCBxbXApOworCisgICAgaWYgKHJjKSBnb3RvIG91dDsKKworICAgIGlmICghbGlieGxfX2pzb25f
b2JqZWN0X2lzX3N0cmluZyhyZXNwb25zZSkpIHsKKyAgICAgICAgcmMgPSBFUlJPUl9RRU1VX0FQ
STsKKyAgICAgICAgTE9HRChFUlJPUiwgcW1wLT5kb21pZCwgIlJlc3BvbnNlIGhhcyB1bmV4cGVj
dGVkIGZvcm1hdCIpOworICAgICAgICBnb3RvIG91dDsKKyAgICB9CisKKyAgICAqKHFtY3MtPm91
dHB1dCkgPQorICAgICAgICBsaWJ4bF9fc3RyZHVwKE5PR0MsIGxpYnhsX19qc29uX29iamVjdF9n
ZXRfc3RyaW5nKHJlc3BvbnNlKSk7CisgICAgcmMgPSAwOworCitvdXQ6CisgICAgbGlieGxfX2V2
X3FtcF9kaXNwb3NlKGdjLCBxbXApOworICAgIGxpYnhsX19hb19jb21wbGV0ZShlZ2MsIGFvLCBy
Yyk7Cit9CiAKIC8qCiAgKiBGdW5jdGlvbnMgdXNpbmcgbGlieGxfX2V2X3FtcAotLSAKQW50aG9u
eSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

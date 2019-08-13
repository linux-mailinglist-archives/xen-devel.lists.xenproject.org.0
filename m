Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 330E58BB76
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 16:26:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxXgC-00010U-Pz; Tue, 13 Aug 2019 14:21:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8rFE=WJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hxXgA-00010P-UM
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 14:21:38 +0000
X-Inumbo-ID: a8aeecce-bdd5-11e9-aafe-fb24cb3e9b9f
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8aeecce-bdd5-11e9-aafe-fb24cb3e9b9f;
 Tue, 13 Aug 2019 14:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565706097;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=t5/h+6Ej+TC8Zr6OBX3eJkOkppP45klkWsjKMFGsuOg=;
 b=CCyZ4V12kHoYL8LaYNT/IYrsu0HAfbxokwXinzQ8Sdc/OJBlg2cC6S0H
 ZSfXYd1TxuV018hI6z2IynUn+SE0cPwaCY6He818SvdX5wBY/nEP0Pc4N
 TpQIHgo2kMvZiMtW4VN4yXUotRFxDkICtpDEzKG68t4Ls6BCpvt0WGvEl M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: C/s2QiV6b5tHjj+MLy7u+4Gy74glFwMsn0dP5CnSgrBlBDAyvREkt2PfnWpQYXYITRunK2Tvsq
 SwazN5AzKq/f7UE2RUv6vImsXXOrbe+BS3ym4dQFEiq/honI3XpNcG0zaD12AgPyME6ojwmcDf
 vJN71kQkUagAEb6oIoV5M1Oos32U7MB45jiBOfxvoVpX+JaqAAOi30lLUb4VCk7UTjGJ8B0w42
 wGwmaxO5mgwQ0RtKPZsJ4x5FasTPQTQtrIQbBPiC4TD2yvN1to+5QjtNAa7Qn1z8eRELhOr7Ro
 glw=
X-SBRS: 2.7
X-MesageID: 4218879
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,381,1559534400"; 
   d="scan'208";a="4218879"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 13 Aug 2019 15:21:28 +0100
Message-ID: <20190813142128.18551-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190813135211.13668-1-andrew.cooper3@citrix.com>
References: <20190813135211.13668-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/1] toos/xenstat: Fix -Wunused-function issue
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBjb21waWxpbmcgeGVuc3RhdCB3aXRoIC1XZXJyb3IsIENsYW5nIGNvbXBsYWluczoKCiAg
c3JjL3hlbnN0YXQuYzoxMzQ6MzQ6IGVycm9yOiB1bnVzZWQgZnVuY3Rpb24gJ3BhcnNlJyBbLVdl
cnJvciwtV3VudXNlZC1mdW5jdGlvbl0KICBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgbG9u
ZyBwYXJzZShjaGFyICpzLCBjaGFyICptYXRjaCkKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBeCiAgMSBlcnJvciBnZW5lcmF0ZWQuCgpEcm9wIHRoZSBmdW5jdGlvbi4gIEl0IHJl
YWxseSBpcyB1bnVzZWQuCgpTcG90dGVkIGJ5IFRyYXZpcy1DSS4KClNpZ25lZC1vZmYtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSWFuIEphY2tz
b24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLS0K
IHRvb2xzL3hlbnN0YXQvbGlieGVuc3RhdC9zcmMveGVuc3RhdC5jIHwgMTQgLS0tLS0tLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy94
ZW5zdGF0L2xpYnhlbnN0YXQvc3JjL3hlbnN0YXQuYyBiL3Rvb2xzL3hlbnN0YXQvbGlieGVuc3Rh
dC9zcmMveGVuc3RhdC5jCmluZGV4IGJiYTE0M2ViNTMuLjZmOTNkNGU5ODIgMTAwNjQ0Ci0tLSBh
L3Rvb2xzL3hlbnN0YXQvbGlieGVuc3RhdC9zcmMveGVuc3RhdC5jCisrKyBiL3Rvb2xzL3hlbnN0
YXQvbGlieGVuc3RhdC9zcmMveGVuc3RhdC5jCkBAIC0xMzEsMjAgKzEzMSw2IEBAIHZvaWQgeGVu
c3RhdF91bmluaXQoeGVuc3RhdF9oYW5kbGUgKiBoYW5kbGUpCiAJfQogfQogCi1zdGF0aWMgaW5s
aW5lIHVuc2lnbmVkIGxvbmcgbG9uZyBwYXJzZShjaGFyICpzLCBjaGFyICptYXRjaCkKLXsKLQlj
aGFyICpzMSA9IHN0cnN0cihzLG1hdGNoKTsKLQl1bnNpZ25lZCBsb25nIGxvbmcgcmV0OwotCi0J
aWYgKCBzMSA9PSBOVUxMICkKLQkJcmV0dXJuIDBMTDsKLQlzMSArPSAyOwotCWlmICggKnMxKysg
IT0gJzonICkKLQkJcmV0dXJuIDBMTDsKLQlzc2NhbmYoczEsIiVsbHUiLCZyZXQpOwotCXJldHVy
biByZXQ7Ci19Ci0KIHhlbnN0YXRfbm9kZSAqeGVuc3RhdF9nZXRfbm9kZSh4ZW5zdGF0X2hhbmRs
ZSAqIGhhbmRsZSwgdW5zaWduZWQgaW50IGZsYWdzKQogewogI2RlZmluZSBET01BSU5fQ0hVTktf
U0laRSAyNTYKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=

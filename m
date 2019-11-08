Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A769CF53CE
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 19:52:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT9LL-00086j-EQ; Fri, 08 Nov 2019 18:50:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4xER=ZA=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iT9LK-00085b-6F
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 18:50:46 +0000
X-Inumbo-ID: 9e6198a8-0258-11ea-a1d6-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e6198a8-0258-11ea-a1d6-12813bfff9fa;
 Fri, 08 Nov 2019 18:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573239023;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=nI+8Vz43Y3pq0RgBdu5EoYZFGXDykGRVZpkx0C/orc8=;
 b=CdJBDOQS3t4Ytmeb4CydPp8jztEu/D4Gd6XKZMb+82mbI/u7WEc63DpO
 D20Ez/12T6WLAEOv+abNsnErG6/pwziS4xgP8scieLoYXQq51fXbJxkSS
 568EOVHPkiHKCWmffRwmufTAwcPGFubNIzCjlBW/d6x+ywnPW/a6TFf1l Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rXdRlxyQw5Gw9fS4Z91h2bGnWjpFqXqmurblOHNSIELQSeotXa6PchhOKagpMgymF1K2S15lMJ
 480I5PGkX/Sfo1nqYtHS3HJdf5GqCglnqWaQMXtX6gJ+oif/qIBLTrmoQTOmijisvxK7tUa/gA
 bSsVZMsk8sE+EeoaJxKdXIeb9EfyBPikf9ihRS5IPYDKiK6O5aOCFltgqnur0AQcKfezy+vvBi
 3UvprpQG8E/4bUDYA1pbrlhHauV+j4yJY+CyyQPQmRNNTwtO8Na80KOMqLmebY5h9W6cbPhoWY
 t1s=
X-SBRS: 2.7
X-MesageID: 8076647
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,282,1569297600"; 
   d="scan'208";a="8076647"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 8 Nov 2019 18:49:53 +0000
Message-ID: <20191108185001.3319-6-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
References: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 05/13] sg-report-host-history: Get job
 status from mainquery
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

V2UgYXJlIGdvaW5nIHRvIG5lZWQgdGhpcyBhcyBwYXJ0IG9mIG91ciBkYXRhIHJldXNlIGNhY2hl
IGtleSwgc28gd2UKbmVlZCBpdCB0aGlzIGVhcmx5LiAgVGhpcyBjaGFuZ2UgaGFyZGx5IHNsb3dz
IHRoZSBxdWVyeSBkb3duLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29u
QGV1LmNpdHJpeC5jb20+Ci0tLQogc2ctcmVwb3J0LWhvc3QtaGlzdG9yeSB8IDggKysrKy0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvc2ctcmVwb3J0LWhvc3QtaGlzdG9yeSBiL3NnLXJlcG9ydC1ob3N0LWhpc3RvcnkKaW5k
ZXggZDQ3Nzg0ZDkuLjgxYTdhOGQ4IDEwMDc1NQotLS0gYS9zZy1yZXBvcnQtaG9zdC1oaXN0b3J5
CisrKyBiL3NnLXJlcG9ydC1ob3N0LWhpc3RvcnkKQEAgLTEyMiw4ICsxMjIsOSBAQCBzdWIgbWFp
bnF1ZXJ5ICgpIHsKICAgICBvdXIgQHBhcmFtcyA9IGtleXMgJWhvc3RzOwogCiAgICAgb3VyICRy
dW52YXJxIC8vPSBkYl9wcmVwYXJlKDw8RU5EKTsKLQlTRUxFQ1QgZmxpZ2h0LCBqb2IsIG5hbWUs
IHZhbAorCVNFTEVDVCBmbGlnaHQsIGpvYiwgbmFtZSwgdmFsLCBzdGF0dXMKIAkgIEZST00gcnVu
dmFycworICAgICAgICAgIEpPSU4gam9icyBVU0lORyAoZmxpZ2h0LCBqb2IpCiAJIFdIRVJFICRu
YW1lY29uZAogCSAgIEFORCAoJHZhbGNvbmQpCiAJICAgQU5EICRmbGlnaHRjb25kCkBAIC0xODYs
MTAgKzE4Nyw5IEBAIHN1YiByZXBvcnRob3N0ICgkKSB7CiBFTkQKIAogICAgIG91ciAkaW5mb3Eg
Ly89IGRiX3ByZXBhcmUoPDxFTkQpOwotCVNFTEVDVCBibGVzc2luZywgYnJhbmNoLCBpbnRlbmRl
ZCwgc3RhdHVzCisJU0VMRUNUIGJsZXNzaW5nLCBicmFuY2gsIGludGVuZGVkCiAJICBGUk9NIGZs
aWdodHMKLQkgIEpPSU4gam9icyBVU0lORyAoZmxpZ2h0KQotCSBXSEVSRSBmbGlnaHQ9PyBBTkQg
am9iPT8KKwkgV0hFUkUgZmxpZ2h0PT8gQU5EID8hPSdYJwogRU5ECiAKICAgICBvdXIgJGFsbG9j
ZHEgLy89IGRiX3ByZXBhcmUoPDxFTkQpOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

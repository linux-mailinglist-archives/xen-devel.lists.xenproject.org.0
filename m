Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EEBF53CB
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 19:52:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT9L7-0007te-5I; Fri, 08 Nov 2019 18:50:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4xER=ZA=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iT9L5-0007t1-Gj
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 18:50:31 +0000
X-Inumbo-ID: 991afdc6-0258-11ea-adbe-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 991afdc6-0258-11ea-adbe-bc764e2007e4;
 Fri, 08 Nov 2019 18:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573239014;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=we813oPFbAHMWoLOXJcILHqG4Rb7F2LP2ldJTV+GRyk=;
 b=AGpD1GHSiVG7/rjbmLco93ExnXVpDG7VQjSUJgbqqWPtaxK+urpzRvHs
 bPr3UuxX60+QJKTeUG7EQvVKb3/dbFRJizIF9Cm652wB4uI3Ea5JFF6yw
 nPRfx+e5JupKFHtQsKFfCwaip+QXR8huAtzPh92Bc6qKgjr+vkg0F9WcP k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TzV/KDgc/MTv7kI0UD84OUZYWQruKmhlsZKptU5grWir+NgmBWgEQZB6wztfYpIr5NbMijShJV
 s1jnZBnGTzKswPIqTOFVZ09y4vh4EzMQ0YjgacEvlnXky65DVdtDaFb5sjfxy3hlO14LBj4fbr
 0/vGeLgB2CYbcQLOzVCR4VsA4EMSjYMvaZv1Kkxse2hY7EkxAbsAhBt/YHAOQPgDk1dSuPeDxH
 sUR9gfB4J05dkBDHI2Dt55n02efuM3BUJ1oWcDIX5R7wGOckv4WahWp9fWm93wx/cV+lIGE75L
 xFY=
X-SBRS: 2.7
X-MesageID: 8185733
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,282,1569297600"; 
   d="scan'208";a="8185733"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 8 Nov 2019 18:50:01 +0000
Message-ID: <20191108185001.3319-14-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
References: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 13/13] Revert "sg-report-host-history:
 Reduce limit from 2000 to 200"
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

VGhpcyByZXZlcnRzIGNvbW1pdCAwZmE3MmIxM2Y1YWYwYTU0NGM0MTdmYzNjNjRjZGExZWE4Njlh
MGFjLgoKTm93IHdlIGhhdmUgdGhlIGNhY2hlaW5nIHdlIGNhbiBwdXQgdGhpcyBiYWNrIGFuZCBo
YXZlIHVzZWZ1bCBob3N0Cmhpc3RvcmllcyBhZ2Fpbi4KClNvbWUgcGVyZm9ybWFuY2UgZmlndXJl
cyAoaW5kaXZpZHVhbCBtZWFzdXJlbWVudHMpOgoKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBsaW1pdD0yMDAgICAgIGxpbWl0PTIwMDAKICBiZWZvcmUgdGhpcyBzZXJpZXMgICAg
ICAgICAgICAgICAgIDNtMzIgICAgICAgICAgc29tZSB2ZXJ5IGxvbmcgdGltZXMKICB3aXRoIHRo
aXMgc2VyaWVzLCAtLXJlZ2VuZXJhdGUgICAgIDNtMDYgICAgICAgICAgMTNtNTYgMjltMDUKICB3
aXRoIHRoaXMgc2VyaWVzLCByZXVzaW5nIGNhY2hlICAgIDJtMjIgMW00OSAgICAgIDNtMTAgIDNt
MzYKClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
PgotLS0KIHNnLXJlcG9ydC1ob3N0LWhpc3RvcnkgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9zZy1yZXBvcnQtaG9zdC1o
aXN0b3J5IGIvc2ctcmVwb3J0LWhvc3QtaGlzdG9yeQppbmRleCBhMTFiMDBhMC4uNTQ3MzhlNjgg
MTAwNzU1Ci0tLSBhL3NnLXJlcG9ydC1ob3N0LWhpc3RvcnkKKysrIGIvc2ctcmVwb3J0LWhvc3Qt
aGlzdG9yeQpAQCAtMjgsNyArMjgsNyBAQCB1c2UgUE9TSVg7CiAKIHVzZSBPc3N0ZXN0OjpFeGVj
dXRpdmUgcXcoOkRFRkFVTFQgOmNvbG91cnMpOwogCi1vdXIgJGxpbWl0PSAyMDA7CitvdXIgJGxp
bWl0PSAyMDAwOwogb3VyICRmbGlnaHRsaW1pdDsKIG91ciAkaHRtbG91dCA9ICIuIjsKIG91ciAk
cmVhZF9leGlzdGluZz0xOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==

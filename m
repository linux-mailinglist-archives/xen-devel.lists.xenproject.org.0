Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B67F53CD
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 19:52:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT9LG-00081o-O9; Fri, 08 Nov 2019 18:50:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4xER=ZA=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iT9LF-00080l-6I
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 18:50:41 +0000
X-Inumbo-ID: 97d92b90-0258-11ea-a1d6-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97d92b90-0258-11ea-a1d6-12813bfff9fa;
 Fri, 08 Nov 2019 18:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573239012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=P3Z8VMI+icST3yAdSjUhdxH7tSRxS6c72r762JBG3Tk=;
 b=J/CXcPNmmYkXGipgHDFgRFowou8Va7rYJUhcwHSU6dZMHVoRukgWDcij
 P0JNA1kGgG1hdWvJKPnLRzPEVtnaVE2XcS8MJloHN4/igogeUbTKHqsld
 ENgCPcUKxqEKeXD864HtZV0QSY2sUWRYVvsK7db68k2x8CBgA1ck57Gsh c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6jzBjl6l+FJO/3D7FV/XvqJUdnOGvfUJRNRCwxoSEXHqzRbh0T86uz7J+WzMj9VLirU7Pm/Cq7
 tj2NVZ5UKGIjojWxclJK8tnl+cIOiJ3/wpidSJXDVA/fj1bRA6htrToOxQg1dCkUOBwHROy9rZ
 VjluPZdx9kics4x39L6qItReexPc5i6G7z2khnnNXaL13utqWC95zv1yrSK0FQn0KjTvE2E1BV
 fGDelmpun35kr4AoYzjUaBMmyI8ysSJUELlFxZUg6hTcbcV1tiOvQ0z5b3mCGBaSXGrkZaf1zP
 ALs=
X-SBRS: 2.7
X-MesageID: 8482904
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,282,1569297600"; 
   d="scan'208";a="8482904"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 8 Nov 2019 18:49:55 +0000
Message-ID: <20191108185001.3319-8-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
References: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 07/13] sg-report-host-history: Store
 per-job query results in %$jr
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

am9icXVlcnkgbm93IGxvb2tzIGZvciB0aGUgc3VicXVlcnkgcmVzdWx0cyBpbiAlJGpyLCB1bmRl
ciB0aGUKY2FjaGVrZXksIGFuZCBvbmx5IHJ1bnMgdGhlIHF1ZXJ5IGlmIGl0J3Mgbm90IGZvdW5k
LiAgSXQgdGhlbiBzdG9yZXMKdGhlIHZhbHVlLgoKV2UgYXJlIGdvaW5nIHRvIHBlcnNpc3QgdGhl
IGNvbnRlbnRzIG9mICUkanIgYWNyb3NzIHJ1bnMsIGFuZCB0aGVuCnRoaXMgd2lsbCBhdm9pZCBy
ZXJ1bm5pbmcgcXVlcmllcyBuZWVkbGVzc2x5LgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UgeWV0LgoK
U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogc2ctcmVwb3J0LWhvc3QtaGlzdG9yeSB8IDI0ICsrKysrKysrKysrKysrKysrKysrKy0tLQog
MSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvc2ctcmVwb3J0LWhvc3QtaGlzdG9yeSBiL3NnLXJlcG9ydC1ob3N0LWhpc3RvcnkKaW5k
ZXggNGM0MGNiZWMuLjg3NjdiMjVkIDEwMDc1NQotLS0gYS9zZy1yZXBvcnQtaG9zdC1oaXN0b3J5
CisrKyBiL3NnLXJlcG9ydC1ob3N0LWhpc3RvcnkKQEAgLTEwOSwxMSArMTA5LDIxIEBAIEVORAog
ICAgIHByaW50IERFQlVHICJNSU5GTElHSFQgJG1pbmZsaWdodFxuIjsKIH0KIAorb3VyICRqcWNh
Y2hlbWlzc2VzID0gMDsKK291ciAkanF0b3RhbCA9IDA7CisKIHN1YiBqb2JxdWVyeSAoJCQkKSB7
CiAgICAgbXkgKCRxLCAkanIsICRjYWNoZWtleSkgPSBAXzsKLSAgICBteSAoJHEsICRqcikgPSBA
XzsKLSAgICAkcS0+ZXhlY3V0ZSgkanItPntmbGlnaHR9LCAkanItPntqb2J9KTsKLSAgICByZXR1
cm4gJHEtPmZldGNocm93X2hhc2hyZWYoKTsKKyAgICAkanF0b3RhbCsrOworICAgICRjYWNoZWtl
eSA9ICclJy4kY2FjaGVrZXk7CisgICAgbXkgJGNhY2hlZCA9ICRqci0+eyRjYWNoZWtleX07Cisg
ICAgaWYgKCEkY2FjaGVkKSB7CisJJGpxY2FjaGVtaXNzZXMrKzsKKwkkcS0+ZXhlY3V0ZSgkanIt
PntmbGlnaHR9LCAkanItPntqb2J9KTsKKwkkY2FjaGVkID0gJHEtPmZldGNocm93X2hhc2hyZWYo
KTsKKwkkanItPnskY2FjaGVrZXl9ID0gJGNhY2hlZDsKKyAgICB9CisgICAgcmV0dXJuICRjYWNo
ZWQ7CiB9CiAKIG91ciAlaG9zdHM7CkBAIC0yMTUsNiArMjI1LDEyIEBAIEVORAogICAgIG15ICRp
bnJvd3MgPSAkaG9zdHN7JGhvc3RuYW1lfTsKICAgICBwcmludCBERUJVRyAiRk9VTkQgIiwgKHNj
YWxhciBAJGlucm93cyksICIgUk9XUyBmb3IgJGhvc3RuYW1lXG4iOwogCisgICAgIyBFYWNoIGVu
dHJ5IGluIEAkaW5yb3dzIGlzIGEgJGpyLCB3aGljaCBpcyBhIGhhc2gKKyAgICAjIEl0IGhhcyBr
ZXlzIGZvciB0aGUgcmVzdWx0IGNvbHVtbnMgaW4gbWFpbnF1ZXJ5CisgICAgIyBJdCBhbHNvIGhh
cyBrZXlzICclPGxldHRlcj4nICh5ZXMsIHdpdGggYSBsaXRlcmFsICclJykKKyAgICAjIHdoaWNo
IGFyZSB0aGUgcmVzdWx0cyBvZiBwZXItam9iIHF1ZXJpZXMuCisgICAgIyBUaGUgY29udGVudHMg
b2YgJGpyIGZvciBlYWNoIGpvYiBpcyBjYWNoZWQgYWNyb3NzIHJ1bnMuIChUT0RPKQorCiAgICAg
bXkgQHJvd3M7CiAgICAgZm9yZWFjaCBteSAkanIgKEAkaW5yb3dzKSB7CiAJcHJpbnQgREVCVUcg
IkpPQiAkanItPntmbGlnaHR9LiRqci0+e2pvYn0gIjsKQEAgLTM3NywzICszOTMsNSBAQCBmb3Jl
YWNoIG15ICRob3N0IChzb3J0IGtleXMgJWhvc3RzKSB7CiAJcmVwb3J0aG9zdCAkaG9zdDsKICAg
ICB9KTsKIH0KKworcHJpbnQgREVCVUcgIkpRIENBQ0hFICIuKCRqcXRvdGFsLSRqcWNhY2hlbWlz
c2VzKS4iIC8gJGpxdG90YWxcbiI7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BABF53D6
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 19:53:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT9L7-0007tv-HE; Fri, 08 Nov 2019 18:50:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4xER=ZA=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iT9L6-0007tI-05
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 18:50:32 +0000
X-Inumbo-ID: 971b90e5-0258-11ea-a1d6-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 971b90e5-0258-11ea-a1d6-12813bfff9fa;
 Fri, 08 Nov 2019 18:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573239011;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=aO0bCTPy7260kSyFsrFfUbuxe2ickWqS2zgdE01NmfE=;
 b=YkY+lQ8EJFiPwQ7X/T0Rl0HiXNqQA6JGN/pAyBFOguSQexIYq7LlSI/E
 OQJX0YJO96pXdXcqMqwzlWu17jKpRRpYrdE1Fi+22MJnv9yLG4+DWfvr9
 Ekc8w73oRX+gXb65lhOnxSVTzJaEqJ6Nr4/T9h3x/yQqjNhM2sgJ4IQXt M=;
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
IronPort-SDR: ELIpcErRlch3McRR9I/nUi9S1PEKrKbXPz+4m/NycwmwwDM0lb+9DTUc6QxHiYgD9+SzXUx+W0
 TEDFxuZnhS/e/tAvFwGBlSfkUHPa/LSByGMDthprGTf8GjWjSGqHFyQ3aFoNkyCmjHGwRssEts
 LMY1YP9fo6hUNWEp1l5tIXRl8oSg8Uq/7vWdaowbv5oMTyW81BWpkXR8LuiHImXj4LOGQEgILJ
 2AOxkAAJO/J2dfUNA739oxBMvdzR4DcuOyXbEknjh0i0gzh8fDFZh9jflvqgXlM7BUAXvZdNjs
 dyk=
X-SBRS: 2.7
X-MesageID: 8076644
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,282,1569297600"; 
   d="scan'208";a="8076644"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 8 Nov 2019 18:49:51 +0000
Message-ID: <20191108185001.3319-4-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
References: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 03/13] sg-report-host-history: Move
 `computeflightsrange' after hosts
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

VGhpcyB3aWxsIGFsbG93IHRoZSBmbGlnaHRzIHJhbmdlIGNvbXB1dGF0aW9uIHRvIGRlcGVuZCBv
biB0aGUgaG9zdHMKd2UgYXJlIGludGVyZXN0ZWQgaW4uCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBzZy1yZXBvcnQtaG9zdC1oaXN0
b3J5IHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zZy1yZXBvcnQtaG9zdC1oaXN0b3J5IGIvc2ctcmVwb3J0
LWhvc3QtaGlzdG9yeQppbmRleCBjOWY0YWFhNi4uZmM1MTA3NGQgMTAwNzU1Ci0tLSBhL3NnLXJl
cG9ydC1ob3N0LWhpc3RvcnkKKysrIGIvc2ctcmVwb3J0LWhvc3QtaGlzdG9yeQpAQCAtMzI5LDEw
ICszMjksNiBAQCBFTkQKICAgICAgICAgaWYgJGRvaW5zdGFsbDsKIH0KIAotZGJfcmV0cnkoJGRi
aF90ZXN0cywgW10sIHN1YiB7Ci0gICAgY29tcHV0ZWZsaWdodHNyYW5nZSgpOwotfSk7Ci0KIGZv
cmVhY2ggbXkgJGhvc3QgKEBBUkdWKSB7CiAgICAgaWYgKCRob3N0ID1+IG0vXmZsaWdodDovKSB7
CiAJbXkgJGZsaWdodD0kJzsgIyc7CkBAIC0zNjUsNiArMzYxLDEwIEBAIEVORAogZXhpdCAwIHVu
bGVzcyAlaG9zdHM7CiAKIGRiX3JldHJ5KCRkYmhfdGVzdHMsIFtdLCBzdWIgeworICAgIGNvbXB1
dGVmbGlnaHRzcmFuZ2UoKTsKK30pOworCitkYl9yZXRyeSgkZGJoX3Rlc3RzLCBbXSwgc3ViIHsK
ICAgICBtYWlucXVlcnkoKTsKIH0pOwogCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs

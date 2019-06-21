Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 268984EA8E
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 16:27:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heKT9-0008QS-OR; Fri, 21 Jun 2019 14:24:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7rzm=UU=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1heKT7-0008Pv-Ie
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 14:24:45 +0000
X-Inumbo-ID: 4e9b7488-9430-11e9-b65b-870970f44dc4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e9b7488-9430-11e9-b65b-870970f44dc4;
 Fri, 21 Jun 2019 14:24:41 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4sA+h8HnP3Bp2wXp1S1rVvacZFFtWA20S8KlWGu5gJmNZWhmCvgMW+EWjpZLMccHIgnBCrpTza
 iugsPkPM56lQyUpFdnLZJF88OvCmne67p6Rn50sF6YjltwLSA0h/8LPeXf/+QtFqX1GkaiDcw0
 HJWEykJpcV7Alg1f+46Dp3TfRR3L57fsjnXQNuyq1UHHqsOEkLn7wX3cNrNXRiTGVWn7b7K8VG
 uhli73lrvvcXOqiXQ4snTkZC/ypcV7orkZ7gMvVKNxG2ncAHX0V4k2zFU5U2K7UxrdHuYc6i4U
 OAI=
X-SBRS: 2.7
X-MesageID: 2062244
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,400,1557201600"; 
   d="scan'208";a="2062244"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 21 Jun 2019 15:22:54 +0100
Message-ID: <20190621142258.1543-5-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190621142258.1543-1-ian.jackson@eu.citrix.com>
References: <20190621142258.1543-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH v2 4/8] mg-repro-setup: Do not imply
 that a --rebuild needs a +TREE
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

VGhlICtUUkVFcyBhbmQgb3RoZXIgc3BlY2lmaWNhdGlvbnMgYXJlIGNvbnZvbHZlZC4KClNpZ25l
ZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIG1n
LXJlcHJvLXNldHVwIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZy1yZXByby1zZXR1cCBiL21nLXJlcHJvLXNl
dHVwCmluZGV4IDVhNTJlNjE3Li45YTgxYzU2NSAxMDA3NTUKLS0tIGEvbWctcmVwcm8tc2V0dXAK
KysrIGIvbWctcmVwcm8tc2V0dXAKQEAgLTQ1LDggKzQ1LDcgQEAgdXNhZ2UgKCkgeyBjYXQgPDxF
TkQKIAogIFJFQlVJTEQgaXMKICAgIC0tcmVidWlsZCBbLUI8Ymxlc3Npbmc+XSBbLXIuLi5dCi0g
ICAgICAgICAgICAgWy5CVUlMREpPQiB8ID1CVUlMREpPQlJVTlZBUi4uLl0KLSAgICAgICAgICAg
ICArVFJFRT1VUkwjUkVWSVNJT04uLi4KKyAgICAgICAgICAgICBbLkJVSUxESk9CIHwgPUJVSUxE
Sk9CUlVOVkFSIHwgK1RSRUU9VVJMI1JFVklTSU9OIC4uLl0KICAgICAgICBBbHNvIHVzZSBhIGRp
ZmZlcmVudCBidWlsZC4gIFNwZWNpZmljYWxseSwgdXNlIFVSTCBhbmQgUkVWSVNJT04KICAgICAg
ICBmb3IgY2VydGFpbiBidWlsZHMgd2hpY2ggbWVudGlvbiBUUkVFIGFuZCB3aGljaCBhcmUgcmVm
ZXJlbmNlZCAKICAgICAgICAoZGlyZWN0bHkpIGluIHRoZSBqb2IgSk9CIGluIEVYQU1QTEUtRkxJ
R0hULiAgVGhlIGFmZmVjdGVkIGJ1aWxkcwpAQCAtNTUsNyArNTQsNyBAQCB1c2FnZSAoKSB7IGNh
dCA8PEVORAogICAgICAgIG5hbWUgaXMgYW55IG9mIHRoZSBCVUlMREpPQiAoaW4gd2hpY2ggY2Fz
ZSBhbGwgcmVmZXJlbmNlcyB0byB0aGF0CiAgICAgICAgam9iIGFyZSBhZGp1c3RlZCkuICBJZiBu
byAuQlVJTERKT0IgYW5kIG5vID1CVUlMREpPQlJVTlZBUiBhcmUKICAgICAgICBzcGVjaWZpZWQs
IHRoZW4gYWxsIGpvYnMgcmVmZXJyZWQgdG8gZnJvbSB0aGUgZXhhbXBsZSBKT0IKLSAgICAgICB3
aGljaCBtZW50aW9uIFRSRUUgYXJlIGFmZmVjdGVkLgorICAgICAgIHdoaWNoIG1lbnRpb24gYSBU
UkVFIGFyZSBhZmZlY3RlZC4KIAogICAgICAgIEZvciBleGFtcGxlLAogICAgICAgICAgICAtLXJl
YnVpbGQgPXhlbmJ1aWxkam9iIFwKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=

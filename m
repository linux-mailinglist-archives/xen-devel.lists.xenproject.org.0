Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2263BE5074
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 17:50:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO1pQ-0000Zl-KX; Fri, 25 Oct 2019 15:48:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6Phy=YS=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iO1pP-0000ZT-CP
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 15:48:39 +0000
X-Inumbo-ID: e3c8375a-f73e-11e9-8aca-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3c8375a-f73e-11e9-8aca-bc764e2007e4;
 Fri, 25 Oct 2019 15:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572018510;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wrp5bjJW+O7vAarVzt4YP4q4RiasipgURvJNg1jwI5g=;
 b=GLtT7SQBben3A8CtuRR2xLY96uC0gnfX253INWTdb5+1TRY37izYqgZC
 Its3aFskOGmNQ3KdpfH5GWcBraNG9t27c4WaNRmegEFBw4j/Eg9TRmu2n
 KxEonuskraKAVIS2t01mOwvXdC3fxcX0jIcLKecio9vrjqPbJQ8IiIAin A=;
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
IronPort-SDR: LhJlfiHaeqSiW1JpHj0dPuu4S9nQ9ZY7jPUwfBRBFdG6mC9ZmlbNTvlzzZKn6mQhcHedcaxhCR
 oDJC6ngsO1ywCw3+H3DL2pqubglPkyhRxSgD3k4vcGABGyna+P4wundE7FB8fNPgJIvM57fKSf
 kjXeEuCNEn1UXPEry4+1okWiGgM7iMdW7DEL+u62frKrRn2TXY5zXHnwI+4A7oZgZhqKLL7Vq+
 CnYjF5HxUQ4AcOA0nRnarsnxJ1KUufrs2x34ZGSMurJo9i5pKDJlBsfd8GUHSPlfhXMt7xouFr
 rkU=
X-SBRS: 2.7
X-MesageID: 7439067
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,229,1569297600"; 
   d="scan'208";a="7439067"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 25 Oct 2019 16:48:19 +0100
Message-ID: <20191025154819.26593-5-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191025154819.26593-1-ian.jackson@eu.citrix.com>
References: <20191025154819.26593-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 5/5] other_revision_job_suffix:
 disregard recursive FreeBSD builds
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
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <royger@FreeBSD.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgYXJlbid0IGFjdHVhbGx5IGludGVyZXN0ZWQgaW4gYmlzZWN0aW5nIHRoZSBGcmVlQlNECnZl
cnNpb24gKHVzdWFsbHksIHRoZSBhbm9pbnRlZCB2ZXJzaW9uKSB3aGljaCB3YXMgdXNlZCBhcyB0
aGUgcGxhdGZvcm0KZm9yIHRoZSBmYWlsZWQgYnVpbGRzLiAgV2UgYXJlIHRoZXJlYnkgbWFraW5n
IHRoZSBhc3N1bXB0aW9uIHRoYXQgYW55CmJ1aWxkIGZhaWx1cmUgKG9yIGluZGVlZCB0ZXN0IGZh
aWx1cmUpIGlzIHRoZSByZXN1bHQgaW4gY2hhbmdlcyB0byB0aGUKcmVjZW50IEZyZWVCU0QgYmVp
bmcgYWN0dWFsbHkgYnVpbHQgb3IgdXNlZCwgbm90IHRoZSB2ZXJzaW9uIGJlaW5nCnVzZWQgYXMg
YSBidWlsZCBob3N0LgoKQWNoaWV2ZSBpZ25vcmluZyB0aGlzIGJ5IGhhdmluZyBvdGhlcl9yZXZp
c2lvbl9qb2Jfc3VmZml4IHJldHVybiBhIG5ldwptYWdpYyBuZXcgdmFsdWUgRElTQ0FSRCwgd2hp
Y2ggYWxsIGNhbGxlcnMgbXVzdCBrbm93IG1lYW5zIGBza2lwCnRoaXMgb25lJy4gIFRoZXJlIGFy
ZSB0aHJlZSBjYWxsIHNpdGVzOgoKSW4gY3MtYmlzZWN0aW9uLXN0ZXA6ZmxpZ2h0X3JtYXAsIHdl
IHNraXAgdGhvc2Ugcm93cyBpbiB0aGUgUGVybApsb29wLiAgKFdlIGNhbid0IHNraXAgdGhlbSBj
b252ZW5pZW50bHkgaW4gdGhlIFNRTCBiZWNhdXNlIHdlIGNhbid0CnJlZmVyIHRvIHRoZSBjb2x1
bW4gYG90aHJldic7IHdlJ2QgaGF2ZSB0byBkdXBsaWNhdGUgdGhlIGV4cHJlc3Npb24sCm9yIGhh
dmUgYSBzdWJxdWVyeS4gIFRoaXMgZG9lc24ndCBzZWVtIGxpa2VseSB0byBtYXR0ZXIgbXVjaC4p
CgpJbiBjcy1iaXNlY3Rpb24tc3RlcDpwcmVwYXJlam9iLCB3ZSBhbHdheXMgY29tcGFyZSB0aGUg
cmV0dXJuZWQgc3VmZml4CndpdGggYSBmaXhlZCB2YWx1ZSAod2hpY2ggZXZlbnR1YWxseSBjYW1l
IGZyb20gdGhlIHByZXZpb3VzIGNhbGwpLiAgU28KRElTQ0FSRCB3aWxsIG5ldmVyIG1hdGNoLiAg
Tm8gY2hhbmdlIGlzIG5lZWRlZCBoZXJlLgoKSW4gT3NzdGVzdC5wbTptYWluX3JldmlzaW9uX2pv
Yl9jb25kLCB3ZSBjb21wYXJlIHRoZSByZXR1cm5lZCBzdWZmaXgKd2l0aCAnJy4gIEFnYWluLCBp
dCB3aWxsIG5ldmVyIG1hdGNoIGFuZCBubyBjaGFuZ2UgaXMgbmVlZGVkLgoKSSBoYXZlIGNoZWNr
ZWQgdGhhdCBub3cgYSBjcy1iaXNlY3Rpb24tc3RlcCBydW4gY2hvb3NlcyBhIHNpbmdsZQpGcmVl
QlNEIG1hc3RlciBjb21taXQgdG8gdHJ5IHRvIGJ1aWxkLgoKQ0M6IFJvZ2VyIFBhdSBNb25uw6kg
PHJveWdlckBGcmVlQlNELm9yZz4KU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+Ci0tLQogT3NzdGVzdC5wbSAgICAgICAgfCAyICstCiBjcy1iaXNl
Y3Rpb24tc3RlcCB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0LnBtIGIvT3NzdGVzdC5wbQppbmRleCBkNmMx
YjcwOS4uMjcxMzZiYzkgMTAwNjQ0Ci0tLSBhL09zc3Rlc3QucG0KKysrIGIvT3NzdGVzdC5wbQpA
QCAtMzgwLDcgKzM4MCw3IEBAIHN1YiBvdGhlcl9yZXZpc2lvbl9qb2Jfc3VmZml4ICgkJCQpIHsK
ICAgICAgIChDQVNFCiAgICAgICAgV0hFTiAoJGpvYmZpZWxkKSBMSUtFICdidWlsZC0lLXByZXYn
IFRIRU4gJyR7c2VwYXJhdG9yfXByZXYnCiAgICAgICAgV0hFTiAoKCRqb2JmaWVsZCkgTElLRSAn
YnVpbGQtJS1mcmVlYnNkJyAKLSAgICAgICAgICAgICBBTkQgJHJlZnJ1bnZhciA9ICdmcmVlYnNk
YnVpbGRqb2InKSBUSEVOICcke3NlcGFyYXRvcn1yZWN1cnNlJworICAgICAgICAgICAgIEFORCAk
cmVmcnVudmFyID0gJ2ZyZWVic2RidWlsZGpvYicpIFRIRU4gJ0RJU0NBUkQnCiAgICAgICAgRUxT
RSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJycKICAgICAgICBFTkQpCiBF
TkQKZGlmZiAtLWdpdCBhL2NzLWJpc2VjdGlvbi1zdGVwIGIvY3MtYmlzZWN0aW9uLXN0ZXAKaW5k
ZXggNDgyMDhlNDYuLjE2MjI3MjM0IDEwMDc1NQotLS0gYS9jcy1iaXNlY3Rpb24tc3RlcAorKysg
Yi9jcy1iaXNlY3Rpb24tc3RlcApAQCAtMjU0LDYgKzI1NCw3IEBAIEVORAogICAgIG15ICRtaXhl
ZD0wOwogICAgIG15IChAdHRyZWVuYW1lcywgQHR0cmVldXJscywgQHRyZXZpc2lvbnMpOwogICAg
IHdoaWxlICgkcm93PSAkc3RoLT5mZXRjaHJvd19oYXNocmVmKCkpIHsKKyAgICAgICAgbmV4dCBp
ZiAkcm93LT57b3RocmV2fSBlcSAnRElTQ0FSRCc7CiAgICAgICAgICRyb3ctPntsb25nbmFtZX0g
PX4gbS9edHJlZV8vIG9yIGRpZSAiJHJvdy0+e2xvbmduYW1lfSA/IjsKICAgICAgICAgbXkgJG5h
bWU9ICQnOyAjJwogICAgICAgICBwcmludCBERUJVRyAiICRmbGlnaHQuJHJvdy0+e2pvYn0gdXZh
bD0kcm93LT57dXZhbH0iLgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==

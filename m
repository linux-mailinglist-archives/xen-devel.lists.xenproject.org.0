Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F7AC23D3
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 17:00:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEx77-00052p-6b; Mon, 30 Sep 2019 14:57:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jhqc=XZ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iEx75-00052g-Qv
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 14:57:23 +0000
X-Inumbo-ID: 98b91bb8-e392-11e9-b588-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id 98b91bb8-e392-11e9-b588-bc764e2007e4;
 Mon, 30 Sep 2019 14:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569855438;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=VNh2fTbi/lOPcHkAK6ndBh8KjbwDHZcQeGK0Q9x+U84=;
 b=FobrKcn5GEDVt27qVzCfs2RjUl+PcHxK7JkgscAcYNEazn3f6sEUsYwD
 3ZQSdy/ztGA50FR9swI/HHJ3HsGMAw+2AOOMFqYV6FRA3URKMLvjniz/K
 UJ6B/UaMf0EbbNuZQlio/N2q1i60oXcDHfbIEu09Y7OGvUeJsZk/lJm3l 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: L+jj0GUDBDQwJqinpkJM3jD+k33CMUV0q7C7tKSWUryg+cRncV8ZeHP17R0PH59tQL6tclBVB9
 o4zkp+N0RPblLUEpOOgvo7OppTIrG73YzKfyxksVHgqrWvz2oxwfIDhITnk+Rda22Jt6kOZJG3
 CzeDDMYBGnATXbRmE3aXL/iOsbhXyVUoqME8aKGSbjwfOrjfvPR8Bsr/0a/r2fqUs2VvtPwRYd
 JDnHDZIqiUbXNPLX9mIUQgdtXi0BRbErOJDveTp5SX3BXYYZaia42sa2ARV1Po3bEg1Yzoa2el
 Qqw=
X-SBRS: 2.7
X-MesageID: 6262188
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,567,1559534400"; 
   d="scan'208";a="6262188"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 15:57:11 +0100
Message-ID: <20190930145712.31389-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 1/2] other_revision_job_suffix: Take and
 pass referring runvar name
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgYXJlIGdvaW5nIHRvIG5lZWQgdGhpcyB0byBzb3J0IG91dCBiaXNlY3Rpb24gZm9yIGZyZWVi
c2QncwpyZWN1cnNpdmUgYnVpbGRzLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5q
YWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogT3NzdGVzdC5wbSAgICAgICAgfCAgNiArKystLS0K
IGNzLWJpc2VjdGlvbi1zdGVwIHwgMTcgKysrKysrKysrLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvT3NzdGVz
dC5wbSBiL09zc3Rlc3QucG0KaW5kZXggN2NlNTNmY2IuLjU2MWQ1ODRjIDEwMDY0NAotLS0gYS9P
c3N0ZXN0LnBtCisrKyBiL09zc3Rlc3QucG0KQEAgLTM3NCw4ICszNzQsOCBAQCBzdWIgZmxpZ2h0
X290aGVyam9iICgkJCkgewogICAgICAgICAgICBjb25mZXNzICIkb3RoZXJmbGlnaHRqb2IgPyI7
CiB9CiAKLXN1YiBvdGhlcl9yZXZpc2lvbl9qb2Jfc3VmZml4ICgkJCkgewotICAgIG15ICgkam9i
ZmllbGQsICRzZXBhcmF0b3IpID0gQF87CitzdWIgb3RoZXJfcmV2aXNpb25fam9iX3N1ZmZpeCAo
JCQkKSB7CisgICAgbXkgKCRqb2JmaWVsZCwgJHJlZnJ1bnZhciwgJHNlcGFyYXRvcikgPSBAXzsK
ICAgICByZXR1cm4gPDxFTkQKICAgICAgIChDQVNFCiAgICAgICAgV0hFTiAoJGpvYmZpZWxkKSBM
SUtFICdidWlsZC0lLXByZXYnIFRIRU4gJyR7c2VwYXJhdG9yfXByZXYnCkBAIC0zODYsNyArMzg2
LDcgQEAgRU5ECiAKIHN1YiBtYWluX3JldmlzaW9uX2pvYl9jb25kICgkKSB7CiAgICAgbXkgKCRq
b2JmaWVsZCkgPSBAXzsKLSAgICByZXR1cm4gIigke1wgb3RoZXJfcmV2aXNpb25fam9iX3N1ZmZp
eCgkam9iZmllbGQsJ3gnKSB9ID0gJycpIjsKKyAgICByZXR1cm4gIigke1wgb3RoZXJfcmV2aXNp
b25fam9iX3N1ZmZpeCgkam9iZmllbGQsJ3gnLCd4JykgfSA9ICcnKSI7CiB9CiAKIHN1YiBnZXRf
aGFybmVzc19yZXYgKCkgewpkaWZmIC0tZ2l0IGEvY3MtYmlzZWN0aW9uLXN0ZXAgYi9jcy1iaXNl
Y3Rpb24tc3RlcAppbmRleCAwNWJmYWEwYS4uNDgyMDhlNDYgMTAwNzU1Ci0tLSBhL2NzLWJpc2Vj
dGlvbi1zdGVwCisrKyBiL2NzLWJpc2VjdGlvbi1zdGVwCkBAIC0yMzIsNyArMjMyLDcgQEAgRU5E
CiAgICAgICAgIFNFTEVDVCB1cmwudmFsIEFTIHV2YWwsCiAJICAgICAgIHJldi52YWwgQVMgcnZh
bCwKIAkgICAgICAgdXJsLmpvYiBBUyBqb2IsCi0gICAgICAgICAgICAgICAke1wgb3RoZXJfcmV2
aXNpb25fam9iX3N1ZmZpeCgndXJsLmpvYicsJyAnKSB9IEFTIG90aHJldiwKKyAgICAgICR7XCBv
dGhlcl9yZXZpc2lvbl9qb2Jfc3VmZml4KCd1cmwuam9iJywndXJsLnVzZScsJyAnKSB9IEFTIG90
aHJldiwKIAkgICAgICAgdXJsLm5hbWUgQVMgbG9uZ25hbWUKIAogCSAgICBGUk9NIHRtcF9idWls
ZF9pbmZvIEFTIHJldgpAQCAtMTEzNSw5ICsxMTM1LDkgQEAgb3VyICVqb2JzX2NyZWF0ZWQ7CiBv
dXIgJWJ1aWxkc19pbnZlc3RpZ2F0ZWQ7ICMgJGJ1aWxkc19pbnZlc3RpZ2F0ZWR7JHBvcGpvYn0g
PSAwLCBvciB7Li5yb3cuLn0KIG91ciAlcmVjdXJzaW9uX3RyYWNrOwogCi1zdWIgcHJlcGFyZWpv
YiAoJCQkKTsKLXN1YiBwcmVwYXJlam9iICgkJCQpIHsKLSAgICBteSAoJHBvcGpvYiwgJGNvcHlm
bGlnaHQsICRjYWNoZW9rKSA9IEBfOworc3ViIHByZXBhcmVqb2IgKCQkJCQpOworc3ViIHByZXBh
cmVqb2IgKCQkJCQpIHsKKyAgICBteSAoJHBvcGpvYiwgJGNvcHlmbGlnaHQsICRyZWZydW52YXIs
ICRjYWNoZW9rKSA9IEBfOwogICAgICMgcnVucyBpbiBkYl9yZXRyeSBxdyhmbGlnaHRzKQogCiAg
ICAgaWYgKGV4aXN0cyAkam9ic19jcmVhdGVkeyRwb3Bqb2J9KSB7CkBAIC0xMTY4LDEzICsxMTY4
LDEzIEBAIEVORAogICAgICAgICBTRUxFQ1QgbmFtZSBGUk9NIHJ1bnZhcnMKICAgICAgICAgICBX
SEVSRSAgZmxpZ2h0PT8gQU5EIGpvYj0/CiAgICAgICAgICAgICBBTkQgIG5hbWUgPSA/Ci0gICAg
ICAgICAgICBBTkQgICR7XCBvdGhlcl9yZXZpc2lvbl9qb2Jfc3VmZml4KCdqb2InLCcgJykgfSA9
ID8KKyAgICAgICAgICAgIEFORCAgJHtcIG90aGVyX3JldmlzaW9uX2pvYl9zdWZmaXgoJ2pvYics
Jz8nLCcgJykgfSA9ID8KIEVORAogICAgIGZvcmVhY2ggKG15ICRpPTA7ICRpPEB0cmVlaW5mb3M7
ICRpKyspIHsKICAgICAgICAgbXkgJG5hbWU9ICR0cmVlaW5mb3NbJGlde05hbWV9OwogCW15ICRv
dGhyZXYgPSAkbmFtZSA9fiBzeyAoLispJH17fSA/ICQxIDogJyc7CiAgICAgICAgIG15ICR0cmVl
dmFyPSAndHJlZV8nLiRuYW1lOwotICAgICAgICAkdHJlZXEtPmV4ZWN1dGUoJGNvcHlmbGlnaHQs
ICRwb3Bqb2IsICR0cmVldmFyLCAkb3RocmV2KTsKKyAgICAgICAgJHRyZWVxLT5leGVjdXRlKCRj
b3B5ZmxpZ2h0LCAkcG9wam9iLCAkdHJlZXZhciwgJHJlZnJ1bnZhciwgJG90aHJldik7CiAgICAg
ICAgIG15ICgkdHJlZXJvdykgPSAkdHJlZXEtPmZldGNocm93X2FycmF5KCk7CiAgICAgICAgICR0
cmVlcS0+ZmluaXNoKCk7CiAgICAgICAgIG5leHQgdW5sZXNzIGRlZmluZWQgJHRyZWVyb3c7CkBA
IC0xMzEyLDcgKzEzMTIsOCBAQCBFTkQKICAgICAgICAgICAgIHByaW50IFNUREVSUiAiUmV1c2lu
ZyAkdGFyZ2V0IGZvciAkc3Viam9iLT57bmFtZX0iLgogICAgICAgICAgICAgICAgICIgaW4gJHBv
cGZsaWdodC4kcG9wam9iXG4iOwogICAgICAgICB9IGVsc2UgewotICAgICAgICAgICAgJHRhcmdl
dD0gcHJlcGFyZWpvYigkc3Viam9iLT57am9ifSwgJHN1YmpvYi0+e29yZ2ZsaWdodH0sIDEpOwor
ICAgICAgICAgICAgJHRhcmdldD0gcHJlcGFyZWpvYigkc3Viam9iLT57am9ifSwgJHN1YmpvYi0+
e29yZ2ZsaWdodH0sCisJCQkJJHN1YmpvYi0+e25hbWV9LCAxKTsKICAgICAgICAgfQogICAgICAg
ICAkam9ic2V0cS0+ZXhlY3V0ZSgkdGFyZ2V0LCAkcG9wZmxpZ2h0LCAkcG9wam9iLCAkc3Viam9i
LT57bmFtZX0pOwogICAgIH0KQEAgLTEzMzksNyArMTM0MCw3IEBAIEVORAogICAgIGRiX3JldHJ5
KCRwb3BmbGlnaHQsJ2NvbnN0cnVjdGluZycsICRkYmhfdGVzdHMsW3F3KGZsaWdodHMpXSwgc3Vi
IHsKICAgICAgICAgcHJpbnQgU1RERVJSICJQb3B1bGF0aW5nICRwb3BmbGlnaHQuLi5cbiI7CiAJ
dW5kZWYgJWpvYnNfY3JlYXRlZDsKLSAgICAgICAgcHJlcGFyZWpvYigkam9iLCAkbGF0ZXN0X2Zs
aWdodCwgMCk7CisgICAgICAgIHByZXBhcmVqb2IoJGpvYiwgJGxhdGVzdF9mbGlnaHQsICcnLCAw
KTsKICAgICAgICAgZm9yZWFjaCBteSAkaG9zdHNwZWMgKHNwbGl0IC8sLywgJGhvc3RzKSB7ICMg
LwogICAgICAgICAgICAgJGhvc3RzcGVjID1+IG0vPS87CiAgICAgICAgICAgICAkYWRkdmFyLT5l
eGVjdXRlKCRwb3BmbGlnaHQsICRqb2IsICRgLCAkJyk7ICMgJwotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

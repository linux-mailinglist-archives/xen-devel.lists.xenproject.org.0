Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FB4E2182
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 19:13:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNKAI-000354-P6; Wed, 23 Oct 2019 17:11:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TICx=YQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iNKAG-00033T-KA
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 17:11:16 +0000
X-Inumbo-ID: 1a3f5e22-f5b8-11e9-bbab-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a3f5e22-f5b8-11e9-bbab-bc764e2007e4;
 Wed, 23 Oct 2019 17:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571850668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CBfQ6dPGVZL/Q6VVNFGebn4qUfglC7w9/n2BUG61lEo=;
 b=AzohAkO6YQJz84wyStVsjZhR3e8dTnwKxXpqiE5+a2gEixxavNy4KF3s
 cpp4JeftL5au7nbM7VEVYFTQlgHbsDnJMl2DsGeOHaUESRmR96UOjEizh
 uTgIIUW6z+25uJs6HpKqaQLdbJsFgZd/A/hxKILs+1S9qEMS0v1qUe158 E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7wzMBaLYNteM0K8ie8ehDUssS+qgOPyeJz+XfBM8aIPFPSG90GU/a9dQWNJYWKTYzahwcm2Hlm
 CpUU6VWFN0m+lmA0SCEbBjBwJxkNAtcDIfD2nqB+DuAkYzhRNhVDxIomhr3lbnRbXCeZzDHIbt
 TsEfJA0VAHTRHWciGcKWOY86lNT+XrDXkMb3UVpTIA+bjOWNpsKlio3/cj+4GfVJ4M972fBJz9
 mnO+8W97nHlp1XtdxCfTSWc+DVE0O/JWiEN5/z452x1o1MHbQjeH1DGy9b5WPQxmzJz6YQagzl
 V1A=
X-SBRS: 2.7
X-MesageID: 7429246
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7429246"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 17:48:34 +0100
Message-ID: <20191023164837.2700240-21-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023164837.2700240-1-anthony.perard@citrix.com>
References: <20191023164837.2700240-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC XEN PATCH 20/23] update arch/Makefile
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
Cc: Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

YXJjaHByZXBhcmUgdGFyZ2V0Cm1ha2UgYXNtLW9mZnNldHMuaAptYWtlIGFzbS1tYWNyb3MuW2lo
XQotLS0KIHhlbi9LYnVpbGQgICAgICAgICAgICB8IDEwICsrKysrKysrCiB4ZW4vYXJjaC94ODYv
TWFrZWZpbGUgfCA1NCArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CiAyIGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IHhlbi9LYnVpbGQKCmRpZmYgLS1naXQgYS94ZW4vS2J1aWxkIGIveGVu
L0tidWlsZApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjNiMzZkNjcy
MjZkNgotLS0gL2Rldi9udWxsCisrKyBiL3hlbi9LYnVpbGQKQEAgLTAsMCArMSwxMCBAQAorIyMj
IyMKKyMgR2VuZXJhdGUgYXNtLW9mZnNldHMuaAorCitvZmZzZXRzLWZpbGUgOj0gaW5jbHVkZS9h
c20tJChTUkNBUkNIKS9hc20tb2Zmc2V0cy5oCisKK2Fsd2F5cyAgKz0gJChvZmZzZXRzLWZpbGUp
CisKKyQob2Zmc2V0cy1maWxlKTogYXJjaC8kKFNSQ0FSQ0gpL2FzbS1vZmZzZXRzLnMgRk9SQ0UK
KwkkKGNhbGwgZmlsZWNoayxvZmZzZXRzLF9fQVNNX09GRlNFVFNfSF9fKQorCmRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvTWFrZWZpbGUgYi94ZW4vYXJjaC94ODYvTWFrZWZpbGUKaW5kZXggNDE0
ODZjNTEyZjEwLi45YTZhMGE1OTU5NzUgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9NYWtlZmls
ZQorKysgYi94ZW4vYXJjaC94ODYvTWFrZWZpbGUKQEAgLTY0LDExICs2NCwxNyBAQCBMREZMQUdT
X2VtdWxhdGlvbl9PcGVuQlNEIDo9IF9vYnNkCiBMREZMQUdTX2VtdWxhdGlvbl9GcmVlQlNEIDo9
IF9mYnNkCiBLQlVJTERfTERGTEFHUyArPSAtbWVsZl94ODZfNjQkKExERkxBR1NfZW11bGF0aW9u
XyQoWEVOX09TKSkKIAorYXJjaGhlYWRlcnM6ICQob2JqdHJlZSkvaW5jbHVkZS9hc20teDg2L2Fz
bS1tYWNyb3MuaAorCithcmNocHJlcGFyZToKKwkkKFEpJChNQUtFKSAkKGJ1aWxkKT1hcmNoLyQo
U1JDQVJDSCkgYXJjaC8kKFNSQ0FSQ0gpL2FzbS1vZmZzZXRzLnMKKwogZWZpLXkgOj0gJChzaGVs
bCBpZiBbICEgLXIgJChCQVNFRElSKS9pbmNsdWRlL3hlbi9jb21waWxlLmggLW8gXAogICAgICAg
ICAgICAgICAgICAgICAgIC1PICQoQkFTRURJUikvaW5jbHVkZS94ZW4vY29tcGlsZS5oIF07IHRo
ZW4gXAogICAgICAgICAgICAgICAgICAgICAgICAgIGVjaG8gJyQoVEFSR0VUKS5lZmknOyBmaSkK
IAotQUxMX09CSlMgOj0gJChCQVNFRElSKS9hcmNoL3g4Ni9ib290L2J1aWx0X2luLm8gJChCQVNF
RElSKS9hcmNoL3g4Ni9lZmkvYnVpbHRfaW4ubyAkKEFMTF9PQkpTKQoraGVhZC15IDo9IGFyY2gv
eDg2L2Jvb3QvCitoZWFkLXkgKz0gYXJjaC94ODYvZWZpLwogCiBpZmVxICgkKENPTkZJR19MVE8p
LHkpCiAjIEdhdGhlciBhbGwgTFRPIG9iamVjdHMgdG9nZXRoZXIKQEAgLTEwNCw3ICsxMTAsMTAg
QEAgRUZJX0xERkxBR1MgKz0gLS1tYWpvci1vcy12ZXJzaW9uPTIgLS1taW5vci1vcy12ZXJzaW9u
PTAKIEVGSV9MREZMQUdTICs9IC0tbWFqb3Itc3Vic3lzdGVtLXZlcnNpb249MiAtLW1pbm9yLXN1
YnN5c3RlbS12ZXJzaW9uPTAKIAogIyBDaGVjayBpZiB0aGUgY29tcGlsZXIgc3VwcG9ydHMgdGhl
IE1TIEFCSS4KLWV4cG9ydCBYRU5fQlVJTERfRUZJIDo9ICQoc2hlbGwgJChDQykgJChmaWx0ZXIt
b3V0ICQoQ0ZMQUdTLXkpIC4lLmQsJChDRkxBR1MpKSAtYyBlZmkvY2hlY2suYyAtbyBlZmkvY2hl
Y2subyAyPi9kZXYvbnVsbCAmJiBlY2hvIHkpCisjZXhwb3J0IFhFTl9CVUlMRF9FRkkgOj0gJChz
aGVsbCAkKENDKSAkKGZpbHRlci1vdXQgJChDRkxBR1MteSkgLiUuZCwkKENGTEFHUykpIC1jIGVm
aS9jaGVjay5jIC1vIGVmaS9jaGVjay5vIDI+L2Rldi9udWxsICYmIGVjaG8geSkKKyMgWFhYIEZJ
WE1FOiBUaGUgc3ViZGlyIGVmaS8gZGVwZW5kcyBvbiBzeW1ib2xpYyBsaW5rcyBvZiBmaWxlcyBp
biBjb21tb24vZWZpLworIyBYWFggRGlzYWJsZSBFRkkgYnVpbGQgZm9yIG5vdy4KK292ZXJyaWRl
IFhFTl9CVUlMRF9FRkkgOj0KICMgQ2hlY2sgaWYgdGhlIGxpbmtlciBzdXBwb3J0cyBQRS4KIFhF
Tl9CVUlMRF9QRSA6PSAkKGlmICQoWEVOX0JVSUxEX0VGSSksJChzaGVsbCAkKExEKSAtbWkzODZw
ZXAgLS1zdWJzeXN0ZW09MTAgLW8gZWZpL2NoZWNrLmVmaSBlZmkvY2hlY2subyAyPi9kZXYvbnVs
bCAmJiBlY2hvIHkpKQogQ0ZMQUdTLSQoWEVOX0JVSUxEX0VGSSkgKz0gLURYRU5fQlVJTERfRUZJ
CkBAIC0xNTQsMzEgKzE2MywyMiBAQCAkKFRBUkdFVCkuZWZpOiBwcmVsaW5rLWVmaS5vICQobm90
ZV9maWxlKSBlZmkubGRzIGVmaS9yZWxvY3MtZHVtbXkubyBlZmkvbWtyZWxvYwogZWZpL2Jvb3Qu
aW5pdC5vIGVmaS9ydW50aW1lLm8gZWZpL2NvbXBhdC5vIGVmaS9idWlsZGlkLm86ICQoQkFTRURJ
UikvYXJjaC94ODYvZWZpL2J1aWx0X2luLm8KIGVmaS9ib290LmluaXQubyBlZmkvcnVudGltZS5v
IGVmaS9jb21wYXQubyBlZmkvYnVpbGRpZC5vOiA7CiAKLSQoQkFTRURJUikvaW5jbHVkZS9hc20t
eDg2L2FzbS1tYWNyb3MuaDogYXNtLW1hY3Jvcy5pIE1ha2VmaWxlCi0JZWNobyAnI2lmIDAnID4k
QC5uZXcKLQllY2hvICcuaWYgMCcgPj4kQC5uZXcKLQllY2hvICcjZW5kaWYnID4+JEAubmV3Ci0J
ZWNobyAnYXNtICggIi5pbmNsdWRlIFwiJEBcIiIgKTsnID4+JEAubmV3Ci0JZWNobyAnI2lmIDAn
ID4+JEAubmV3Ci0JZWNobyAnLmVuZGlmJyA+PiRALm5ldwotCWNhdCAkPCA+PiRALm5ldwotCWVj
aG8gJyNlbmRpZicgPj4kQC5uZXcKLQkkKGNhbGwgbW92ZS1pZi1jaGFuZ2VkLCRALm5ldywkQCkK
K2RlZmluZSBmaWxlY2hrX2FzbS1tYWNyb3MuaAorCWVjaG8gJyNpZiAwJzsgXAorCWVjaG8gJy5p
ZiAwJzsgXAorCWVjaG8gJyNlbmRpZic7IFwKKwllY2hvICdhc20gKCAiLmluY2x1ZGUgXCIkQFwi
IiApOyc7IFwKKwllY2hvICcjaWYgMCc7IFwKKwllY2hvICcuZW5kaWYnOyBcCisJY2F0ICQ8OyBc
CisJZWNobyAnI2VuZGlmJworZW5kZWYKKworJChvYmp0cmVlKS9hcmNoL3g4Ni9hc20tbWFjcm9z
Lmk6IEZPUkNFCisJJChRKSQoTUFLRSkgJChidWlsZCk9JChARCkgJEAKKworJChvYmp0cmVlKS9p
bmNsdWRlL2FzbS14ODYvYXNtLW1hY3Jvcy5oOiAkKG9ianRyZWUpL2FyY2gveDg2L2FzbS1tYWNy
b3MuaSBNYWtlZmlsZSBGT1JDRQorCSQoY2FsbCBmaWxlY2hrLGFzbS1tYWNyb3MuaCkKIAogZWZp
L21rcmVsb2M6IGVmaS9ta3JlbG9jLmMKIAkkKEhPU1RDQykgJChIT1NUQ0ZMQUdTKSAtZyAtbyAk
QCAkPAotCi0uUEhPTlk6IGNsZWFuCi1jbGVhbjo6Ci0Jcm0gLWYgYXNtLW9mZnNldHMucyAqLmxk
cyBib290LyoubyBib290Lyp+IGJvb3QvY29yZSBib290L21rZWxmMzIKLQlybSAtZiBhc20tbWFj
cm9zLmkgJChCQVNFRElSKS9pbmNsdWRlL2FzbS14ODYvYXNtLW1hY3Jvcy4qCi0Jcm0gLWYgJChC
QVNFRElSKS8ueGVuLXN5bXMuWzAtOV0qIGJvb3QvLiouZCAkKEJBU0VESVIpLy54ZW4uZWxmMzIK
LQlybSAtZiAkKEJBU0VESVIpLy54ZW4uZWZpLlswLTldKiBlZmkvKi5lZmkgZWZpL21rcmVsb2MK
LQlybSAtZiBib290L2NtZGxpbmUuUyBib290L3JlbG9jLlMgYm9vdC8qLmxuayBib290LyouYmlu
Ci0Jcm0gLWYgbm90ZS5vCi0KLSMgU3VwcHJlc3MgbG9hZGluZyBvZiBERVBTIGZpbGVzIGZvciBp
bnRlcm5hbCwgdGVtcG9yYXJ5IHRhcmdldCBmaWxlcy4gIFRoaXMKLSMgdGhlbiBhbHNvIHN1cHBy
ZXNzZXMgcmUtZ2VuZXJhdGlvbiBvZiB0aGUgcmVzcGVjdGl2ZSAuKi5kMiBmaWxlcy4KLWlmZXEg
KCQoZmlsdGVyLW91dCAueGVuJS5vLCQobm90ZGlyICQoTUFLRUNNREdPQUxTKSkpLCkKLURFUFM6
PQotZW5kaWYKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

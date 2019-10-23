Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9C1E2181
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 19:13:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNK9e-0002Yg-4k; Wed, 23 Oct 2019 17:10:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TICx=YQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iNK9c-0002Xv-Ih
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 17:10:36 +0000
X-Inumbo-ID: 070b0d24-f5b8-11e9-bbab-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 070b0d24-f5b8-11e9-bbab-bc764e2007e4;
 Wed, 23 Oct 2019 17:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571850635;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CmM17caS9BcmxVqilv9CV864hCkmygyaAx1dtmUJsKE=;
 b=Aiwjc/L3U591+5AREaFLWNsdA1FoMHTIDNL0t2+q/WytaogoN+4/6FAI
 Nb2bLeSR9EVRhi2S3ReHa7Qj7jT+yWUSDbFEnYaua64GGycWU8GXtPI/X
 OQ8wwOq65GL9Acjo5HKNxSQAJdCqLu306Jq5hp5vc5nfQaDJ+eg9MBq0H g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 96h22YvGU1Hv80EMQPFhAJtz51BiZ2aQCqOdCC1wc36zTwRVO/CuWLE4B8Y/zkiJxhRaEO/MCl
 6JZHwGy+pyX4uu8LSGNlCG/u2tv61WQ0QK2/MQUxJIe+4Hi6pDZgyL4yq0QpbpQzKAILl8qt8Z
 79/z+fzx7Fc3dhI0UXAOXhs4HTJScrsrVmQhJpCYKvHkUmvBu0H0nI9SadSMmyGe95GXbStgJD
 6j14BN5WeuR3Q6F8kZeBf29NIbvfycwBLj94kTDUS3TZsI4surHie5HOdrXaC168VEoCjELkQW
 FfI=
X-SBRS: 2.7
X-MesageID: 7642017
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7642017"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 17:48:33 +0100
Message-ID: <20191023164837.2700240-20-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023164837.2700240-1-anthony.perard@citrix.com>
References: <20191023164837.2700240-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC XEN PATCH 19/23] update *FLAGS for
 arch/x86/Makefile
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

LS0tCiB4ZW4vYXJjaC94ODYvTWFrZWZpbGUgfCA2NSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQpp
bmRleCA0OWI3ZWI5ZmQxMTYuLjQxNDg2YzUxMmYxMCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2
L01ha2VmaWxlCisrKyBiL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQpAQCAtMSwzICsxLDY4IEBACisj
IHNlbGVjdCBkZWZjb25maWcgYmFzZWQgb24gYWN0dWFsIGFyY2hpdGVjdHVyZQorS0JVSUxEX0RF
RkNPTkZJRyA6PSAkKEFSQ0gpX2RlZmNvbmZpZworCitleHBvcnQgWEVOX0lNR19PRkZTRVQgOj0g
MHgyMDAwMDAKKworS0JVSUxEX0NGTEFHUyArPSAtSSQoc3JjdHJlZSkvaW5jbHVkZQorS0JVSUxE
X0NGTEFHUyArPSAtSSQoc3JjdHJlZSkvaW5jbHVkZS9hc20teDg2L21hY2gtZ2VuZXJpYworS0JV
SUxEX0NGTEFHUyArPSAtSSQoc3JjdHJlZSkvaW5jbHVkZS9hc20teDg2L21hY2gtZGVmYXVsdAor
S0JVSUxEX0NGTEFHUyArPSAtRFhFTl9JTUdfT0ZGU0VUPSQoWEVOX0lNR19PRkZTRVQpCisKKyMg
UHJldmVudCBmbG9hdGluZy1wb2ludCB2YXJpYWJsZXMgZnJvbSBjcmVlcGluZyBpbnRvIFhlbi4K
K0tCVUlMRF9DRkxBR1MgKz0gLW1zb2Z0LWZsb2F0CisKK0tCVUlMRF9DRkxBR1MgKz0gJChmb3Jl
YWNoIG8sJChFTUJFRERFRF9FWFRSQV9DRkxBR1MpLCQoY2FsbCBjYy1vcHRpb24sJChvKSkpCitL
QlVJTERfQ0ZMQUdTICs9ICQoY2FsbCBjYy1vcHRpb24sLVduZXN0ZWQtZXh0ZXJucykKK0tCVUlM
RF9DRkxBR1MgKz0gJChjYWxsIGFzLWluc3RyLHZtY2FsbCwtREhBVkVfQVNfVk1YKQorS0JVSUxE
X0NGTEFHUyArPSAkKGNhbGwgYXMtaW5zdHIsY3JjMzIgJWVheCQoY29tbWEpJWVheCwtREhBVkVf
QVNfU1NFNF8yKQorS0JVSUxEX0NGTEFHUyArPSAkKGNhbGwgYXMtaW5zdHIsaW52ZXB0ICglcmF4
KSQoY29tbWEpJXJheCwtREhBVkVfQVNfRVBUKQorS0JVSUxEX0NGTEFHUyArPSAkKGNhbGwgYXMt
aW5zdHIscmRyYW5kICVlYXgsLURIQVZFX0FTX1JEUkFORCkKK0tCVUlMRF9DRkxBR1MgKz0gJChj
YWxsIGFzLWluc3RyLHJkZnNiYXNlICVyYXgsLURIQVZFX0FTX0ZTR1NCQVNFKQorS0JVSUxEX0NG
TEFHUyArPSAkKGNhbGwgYXMtaW5zdHIseHNhdmVvcHQgKCVyYXgpLC1ESEFWRV9BU19YU0FWRU9Q
VCkKK0tCVUlMRF9DRkxBR1MgKz0gJChjYWxsIGFzLWluc3RyLHJkc2VlZCAlZWF4LC1ESEFWRV9B
U19SRFNFRUQpCitLQlVJTERfQ0ZMQUdTICs9ICQoY2FsbCBhcy1pbnN0cixjbHdiICglcmF4KSwt
REhBVkVfQVNfQ0xXQikKK0tCVUlMRF9DRkxBR1MgKz0gJChjYWxsIGFzLWluc3RyLC5lcXUgXCJ4
XCIkKGNvbW1hKTEsLURIQVZFX0FTX1FVT1RFRF9TWU0pCitLQlVJTERfQ0ZMQUdTICs9ICQoY2Fs
bCBhcy1pbnN0cixpbnZwY2lkICglcmF4KSQoY29tbWEpJXJheCwtREhBVkVfQVNfSU5WUENJRCkK
KworIyBHQVMncyBpZGVhIG9mIHRydWUgaXMgLTEuICBDbGFuZydzIGlkZWEgaXMgMQorS0JVSUxE
X0NGTEFHUyArPSAkKGNhbGwgYXMtaW5zdHIsXAorICAgIC5pZiAoKDEgPiAwKSA8IDApOyAuZXJy
b3IgIiI7LmVuZGlmLCwtREhBVkVfQVNfTkVHQVRJVkVfVFJVRSkKKworIyBDaGVjayB0byBzZWUg
d2hldGhlciB0aGUgYXNzbWJsZXIgc3VwcG9ydHMgdGhlIC5ub3AgZGlyZWN0aXZlLgorS0JVSUxE
X0NGTEFHUyArPSAkKGNhbGwgYXMtaW5zdHIsXAorICAgIC5MMTogLkwyOiAubm9wcyAoLkwyIC0g
LkwxKSQoY29tbWEpOSwtREhBVkVfQVNfTk9QU19ESVJFQ1RJVkUpCisKK0tCVUlMRF9DRkxBR1Mg
Kz0gLW1uby1yZWQtem9uZSAtZnBpYyAtZm5vLWFzeW5jaHJvbm91cy11bndpbmQtdGFibGVzCisK
KyMgWGVuIGRvZXNuJ3QgdXNlIFNTRSBpbnRlcmFsbHkuICBJZiB0aGUgY29tcGlsZXIgc3VwcG9y
dHMgaXQsIGFsc28gc2tpcCB0aGUKKyMgU1NFIHNldHVwIGZvciB2YXJpYWRpYyBmdW5jdGlvbiBj
YWxscy4KK0tCVUlMRF9DRkxBR1MgKz0gLW1uby1zc2UgJChjYWxsIGNjLW9wdGlvbiwtbXNraXAt
cmF4LXNldHVwKQorCisjIC1mdmlzaWJpbGl0eT1oaWRkZW4gcmVkdWNlcyAtZnBpYyBjb3N0LCBp
ZiBpdCdzIGF2YWlsYWJsZQoraWZlcSAoJChjYWxsIGNjLW9wdGlvbi15biwtZnZpc2liaWxpdHk9
aGlkZGVuKSx5KQorS0JVSUxEX0NGTEFHUyArPSAtREdDQ19IQVNfVklTSUJJTElUWV9BVFRSSUJV
VEUKK2VuZGlmCisKKyMgQ29tcGlsZSB3aXRoIHRodW5rLWV4dGVybiwgaW5kaXJlY3QtYnJhbmNo
LXJlZ2lzdGVyIGlmIGF2YWlhYmxlLgoraWZlcSAoJChjYWxsIGNjLW9wdGlvbi15biwtbWluZGly
ZWN0LWJyYW5jaC1yZWdpc3RlcikseSkKK0tCVUlMRF9DRkxBR1MgKz0gLW1pbmRpcmVjdC1icmFu
Y2g9dGh1bmstZXh0ZXJuIC1taW5kaXJlY3QtYnJhbmNoLXJlZ2lzdGVyCitLQlVJTERfQ0ZMQUdT
ICs9IC1EQ09ORklHX0lORElSRUNUX1RIVU5LCitLQlVJTERfQ0ZMQUdTICs9IC1mbm8tanVtcC10
YWJsZXMKK2V4cG9ydCBDT05GSUdfSU5ESVJFQ1RfVEhVTks9eQorZW5kaWYKKworIyBJZiBzdXBw
b3J0ZWQgYnkgdGhlIGNvbXBpbGVyLCByZWR1Y2Ugc3RhY2sgYWxpZ25tZW50IHRvIDggYnl0ZXMu
IEJ1dCBhbGxvdworIyB0aGlzIHRvIGJlIG92ZXJyaWRkZW4gZWxzZXdoZXJlLgorIyBYWFggYWRk
aW5nIHRvIGNmbGFncyBpbnN0ZWFkIG9mIENGTEFHUy1zdGFjay1ib3VuZGFyeQorS0JVSUxEX0NG
TEFHUyArPSAkKGNhbGwgY2Mtb3B0aW9uLC1tcHJlZmVycmVkLXN0YWNrLWJvdW5kYXJ5PTMpCisK
KyMgU2V0IHVwIHRoZSBhc3NlbWJsZXIgaW5jbHVkZSBwYXRoIHByb3Blcmx5IGZvciBvbGRlciB0
b29sY2hhaW5zLgorS0JVSUxEX0NGTEFHUyArPSAtV2EsLUkkKHNyY3RyZWUpL2luY2x1ZGUKKwor
IyBYWFggZnJvbSB4ZW4uZ2l0L2NvbmZpZy94ODZfNjQubWsKK0xERkxBR1NfZW11bGF0aW9uX09w
ZW5CU0QgOj0gX29ic2QKK0xERkxBR1NfZW11bGF0aW9uX0ZyZWVCU0QgOj0gX2Zic2QKK0tCVUlM
RF9MREZMQUdTICs9IC1tZWxmX3g4Nl82NCQoTERGTEFHU19lbXVsYXRpb25fJChYRU5fT1MpKQog
CiBlZmkteSA6PSAkKHNoZWxsIGlmIFsgISAtciAkKEJBU0VESVIpL2luY2x1ZGUveGVuL2NvbXBp
bGUuaCAtbyBcCiAgICAgICAgICAgICAgICAgICAgICAgLU8gJChCQVNFRElSKS9pbmNsdWRlL3hl
bi9jb21waWxlLmggXTsgdGhlbiBcCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

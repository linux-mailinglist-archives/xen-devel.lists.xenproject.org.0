Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD3A181F40
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 18:23:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC529-0002zR-JQ; Wed, 11 Mar 2020 17:20:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V419=44=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jC528-0002zI-8g
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 17:20:40 +0000
X-Inumbo-ID: 9e768ca2-63bc-11ea-b027-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e768ca2-63bc-11ea-b027-12813bfff9fa;
 Wed, 11 Mar 2020 17:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583947235;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=30rIw5MKw1vPYrrF3I7Ibt5BjmFr9isaYP68YPRd2m8=;
 b=JkthFbGC1xlJ+9BHw7MnxEiR7DCUeZ0DwW9AAiLsub0dAwacCirk6RJD
 bLAKbX8F/Ap6rh+un0+uS+myTA5HJH08SDNVB/sBJwEylzXviMrxakb6L
 QYFHqO34MKOGoNd3o9zhIhF56Hf8SLL+ovGkkIVc8FHt1cBnSDs3vd2Pg o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nWdRPX177Z7ZMLeLMMpzQXzCeV9M3IJinb9+/bqG+yaJthKbJWVXx0DsTLZ9N8tyegww08p04v
 p3DxfxDD9wAueWsApw3czzGgDuqI8IQZdg28Plsmtdwv91sHR2jpblyD6H1wj1w/kW498+2czm
 ezfoNViGpPW+GX0pxxWNdX1PjgAwVuIVkXeZlbjZrEFlkdEumZRB8ZDTahFXlbGgyFxP5cdxUy
 Y1bems4tXjMowgfOB0gObHJWiHpEsauBA6sOEhzLAsQlrnG7voYouVzmzzB/o2E9NInPtx3el0
 9NQ=
X-SBRS: 2.7
X-MesageID: 13794324
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,541,1574139600"; d="scan'208";a="13794324"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 11 Mar 2020 18:20:06 +0100
Message-ID: <20200311172010.7777-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200311172010.7777-1-roger.pau@citrix.com>
References: <20200311172010.7777-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH OSSTEST v5 2/5] host: introduce a helper to
 modify hostflags
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
Cc: ian.jackson@eu.citrix.com, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGEgZ2VuZXJpYyBmdW5jdGlvbiB0byBwZXJmb3JtIGRhdGFiYXNlIGNoYW5nZXMgcmVsYXRl
ZCB0byBhIGhvc3QKZmxhZyBhbmQgYWRkIGEgd3JhcHBlciB0byBUZXN0U3VwcG9ydC4KClNpZ25l
ZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2hh
bmdlcyBzaW5jZSB2NDoKIC0gTW92ZSBhZGRpdGlvbiBvZiBob3N0ZmxhZ19wdXRhdGl2ZV9yZWNv
cmQgdG8gYSBkaWZmZXJlbnQgcGF0Y2guCiAtIEludHJvZHVjZSBhIHNpbmdsZSBoZWxwZXIgaW4g
VGVzdFN1cHBvcnQ6IG1vZGlmeV9ob3N0X2ZsYWcuCgpDaGFuZ2VzIHNpbmNlIHYzOgogLSBJbnRy
b2R1Y2UgbW9kaWZ5X2ZsYWcgaW5zdGVhZCBvZiB7c2V0L3JlbW92ZX1fZmxhZy4KIC0gSW50cm9k
dWNlIGEgZ2VuZXJpYyBtb2RpZnlfaG9zdCBoZWxwZXIuCiAtIFNwbGl0IGZyb20gcGF0Y2ggMS4K
LS0tClJlcXVlc3RlZCBvbiBJUkM6CjE3OjA4OjU4IERpemlldCByb3lnZXI6IEkgdGhpbmsgeW91
ciB0cy1leGFtaW5lLWhvc3Rwcm9wcy1zYXZlIGh1bmsgaW4gMi8gYmVsb25ncyBpbiAxLyA/ICAo
T3IgaW4KICAgICAgICAgICAgICAgIGEgc2VwYXJhdGUgMS41LyBhbG9uZyB3aXRoIGhvc3RmbGFn
X3B1dGF0aXZlX3JlY29yZC4pCi0tLQogT3NzdGVzdC9Ib3N0REIvRXhlY3V0aXZlLnBtIHwgMTcg
KysrKysrKysrKysrKysrKysKIE9zc3Rlc3QvSG9zdERCL1N0YXRpYy5wbSAgICB8ICA3ICsrKysr
KysKIE9zc3Rlc3QvVGVzdFN1cHBvcnQucG0gICAgICB8ICA4ICsrKysrKystCiAzIGZpbGVzIGNo
YW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Pc3N0
ZXN0L0hvc3REQi9FeGVjdXRpdmUucG0gYi9Pc3N0ZXN0L0hvc3REQi9FeGVjdXRpdmUucG0KaW5k
ZXggZDQwMmJjYWMuLmE2ZGM0NDYyIDEwMDY0NAotLS0gYS9Pc3N0ZXN0L0hvc3REQi9FeGVjdXRp
dmUucG0KKysrIGIvT3NzdGVzdC9Ib3N0REIvRXhlY3V0aXZlLnBtCkBAIC05Niw2ICs5NiwyMyBA
QCBFTkQKICAgICByZXR1cm4gJGZsYWdzOwogfQogCitzdWIgbW9kaWZ5X2ZsYWcgKCQkJCQpIHsK
KyAgICBteSAoJGhkLCAkaG8sICRmbGFnLCAkc2V0KSA9IEBfOworICAgIG15ICRybXEgPSAkZGJo
X3Rlc3RzLT5wcmVwYXJlKDw8RU5EKTsKKyAgICAgICAgREVMRVRFIEZST00gaG9zdGZsYWdzIFdI
RVJFIGhvc3RuYW1lPT8gQU5EIGhvc3RmbGFnPT8KK0VORAorICAgIG15ICRhZGRxID0gJGRiaF90
ZXN0cy0+cHJlcGFyZSg8PEVORCk7CisgICAgICAgIElOU0VSVCBJTlRPIGhvc3RmbGFncyAoaG9z
dG5hbWUsaG9zdGZsYWcpIFZBTFVFUyAoPyw/KQorRU5ECisKKyAgICBtb2RpZnlfaG9zdCgkaGQs
ICRobywgc3ViIHsKKyAgICAgICAgJHJtcS0+ZXhlY3V0ZSgkaG8tPntOYW1lfSwgJGZsYWcpOwor
ICAgICAgICBpZiAoJHNldCkgeworICAgICAgICAgICAgJGFkZHEtPmV4ZWN1dGUoJGhvLT57TmFt
ZX0sICRmbGFnKTsKKyAgICAgICAgfQorICAgIH0pOworfQorCiBzdWIgZ2V0X2FyY2hfcGxhdGZv
cm1zICgkJCQpIHsKICAgICBteSAoJGhkLCAkYmxlc3NpbmcsICRhcmNoLCAkc3VpdGUpID0gQF87
CiAKZGlmZiAtLWdpdCBhL09zc3Rlc3QvSG9zdERCL1N0YXRpYy5wbSBiL09zc3Rlc3QvSG9zdERC
L1N0YXRpYy5wbQppbmRleCAwYzZiZTNlZS4uZDA2NjlmYjIgMTAwNjQ0Ci0tLSBhL09zc3Rlc3Qv
SG9zdERCL1N0YXRpYy5wbQorKysgYi9Pc3N0ZXN0L0hvc3REQi9TdGF0aWMucG0KQEAgLTcyLDYg
KzcyLDEzIEBAIHN1YiBnZXRfZmxhZ3MgKCQkKSB7ICNtZXRob2QKICAgICByZXR1cm4gJGZsYWdz
OwogfQogCitzdWIgbW9kaWZ5X2ZsYWcgKCQkJCQpIHsKKyAgICBteSAoJGhkLCAkaG8sICRmbGFn
LCAkc2V0KSA9IEBfOworCisgICAgZGllCisgICAgIkNhbm5vdCBtb2RpZnkgZmxhZ3MgaW4gc3Rh
bmRhbG9uZSBtb2RlIGZvciAkaG8tPntOYW1lfSAkZmxhZyBzZXQ6ICRzZXRcbiI7Cit9CisKIHN1
YiBnZXRfYXJjaF9wbGF0Zm9ybXMgKCQkJCkgewogICAgIG15ICgkaGQsICRibGVzc2luZywgJGFy
Y2gsICRzdWl0ZSkgPSBAXzsKIApkaWZmIC0tZ2l0IGEvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbSBi
L09zc3Rlc3QvVGVzdFN1cHBvcnQucG0KaW5kZXggZjQ5ZWQ1MjkuLmNlYjZiYjdiIDEwMDY0NAot
LS0gYS9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCisrKyBiL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0K
QEAgLTg0LDcgKzg0LDcgQEAgQkVHSU4gewogICAgICAgICAgICAgICAgICAgICAgIGdldF90YXJn
ZXRfcHJvcGVydHkgZ2V0X2hvc3RfbmF0aXZlX2xpbnV4X2NvbnNvbGUKICAgICAgICAgICAgICAg
ICAgICAgICBob3N0bmFtZXBhdGggaG9zdG5hbWVwYXRoX2xpc3Qgc2V0X3J1bnRpbWVfaG9zdGZs
YWcKICAgICAgICAgICAgICAgICAgICAgICBwb3dlcl9zdGF0ZSBwb3dlcl9jeWNsZSBwb3dlcl9y
ZWJvb3RfYXR0ZW1wdHMKLSAgICAgICAgICAgICAgICAgICAgICBzZXJpYWxfZmV0Y2hfbG9ncyBz
ZXRfaG9zdF9wcm9wZXJ0eQorICAgICAgICAgICAgICAgICAgICAgIHNlcmlhbF9mZXRjaF9sb2dz
IHNldF9ob3N0X3Byb3BlcnR5IG1vZGlmeV9ob3N0X2ZsYWcKICAgICAgICAgICAgICAgICAgICAg
ICBwcm9wbmFtZV9tYXNzYWdlIHByb3BuYW1lX2NoZWNrCiAgICAgICAgICAgICAgICAgICAgICAg
aG9zdHByb3BfcHV0YXRpdmVfcmVjb3JkCiAgICAgICAgICAKQEAgLTE0MTEsNiArMTQxMSwxMiBA
QCBzdWIgaG9zdHByb3BfcHV0YXRpdmVfcmVjb3JkICgkJCQpIHsKICAgICBzdG9yZV9ydW52YXIo
Imhvc3Rwcm9wLyRoby0+e0lkZW50fS8kcHJvcCIsICR2YWwpOwogfQogCitzdWIgbW9kaWZ5X2hv
c3RfZmxhZyAoJCQkKSB7CisgICAgbXkgKCRobywgJGZsYWcsICRzZXQpID0gQF87CisKKyAgICAk
bWhvc3RkYi0+bW9kaWZ5X2ZsYWcoJGhvLCAkZmxhZywgJHNldCk7Cit9CisKIHN1YiBnZXRfdGFy
Z2V0X3Byb3BlcnR5ICgkJDskKTsKIHN1YiBnZXRfdGFyZ2V0X3Byb3BlcnR5ICgkJDskKSB7CiAg
ICAgbXkgKCRobywgJHByb3AsICRkZWZ2YWwpID0gQF87Ci0tIAoyLjI1LjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A274758B0B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 21:45:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgaHR-0000Cr-Gi; Thu, 27 Jun 2019 19:42:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OhEn=U2=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1hgaHQ-0000Cm-7Z
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 19:42:00 +0000
X-Inumbo-ID: a0929926-9913-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a0929926-9913-11e9-8980-bc764e045a96;
 Thu, 27 Jun 2019 19:41:59 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: swjml8zXoLNc4SnsFiM/xeeztZd7kswb7N7wSAUMUkbGJ0/S+IYnJoNrMrtsOcQV2MOSWgv3c2
 ZiBoVEQdctNOA161QgYY8Xd8sT1cZvvOkxyt3bHzy8Exutw89qD4Cs9DNjLowPEa1WHMq1bkRc
 vtUkmmgYdSR9S/xUSgU3ueWMwRYx6cQrG/RqQIySyyUxBWqFmcaukqbNEUD9QcsrAK8N+Fxn4h
 IkRmV/d9x9s+lY6IXYBQLXJnwb+yzuAZduSHbLVl+S+UQ9d8OWo/A2Avh7qFslsGepowe35C9s
 0Kw=
X-SBRS: 2.7
X-MesageID: 2342339
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,424,1557201600"; 
   d="scan'208";a="2342339"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 27 Jun 2019 20:41:54 +0100
Message-ID: <1561664514-3666-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/cpuid: leak OSXSAVE only when XSAVE is not
 clear in policy
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
Cc: andrew.cooper3@citrix.com, Igor Druzhinin <igor.druzhinin@citrix.com>,
 wl@xen.org, jbeulich@suse.com, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBmaXhlcyBib290aW5nIG9mIG9sZCBub24tUFYtT1BTIGtlcm5lbHMgd2hpY2ggaGlzdG9y
aWNhbGx5Cmxvb2tlZCBmb3IgT1NYU0FWRSBpbnN0ZWFkIG9mIFhTQVZFIGJpdCBpbiBDUFVJRCB0
byBjaGVjayB3aGV0aGVyClhTQVZFIGZlYXR1cmUgaXMgZW5hYmxlZC4gSWYgc3VjaCBhIGd1ZXN0
IGFwcGVhcnMgdG8gYmUgc3RhcnRlZCBvbgphbiBYU0FWRSBlbmFibGVkIENQVSBhbmQgdGhlIGZl
YXR1cmUgaXMgZXhwbGljaXRseSBjbGVhcmVkIGluCnBvbGljeSwgbGVha2VkIE9TWFNBVkUgYml0
IGZyb20gWGVuIHdpbGwgbGVhZCB0byBndWVzdCBjcmFzaCBlYXJseSBpbgpib290LgoKU2lnbmVk
LW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Ci0tLQog
eGVuL2FyY2gveDg2L2NwdWlkLmMgfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvY3B1aWQu
YyBiL3hlbi9hcmNoL3g4Ni9jcHVpZC5jCmluZGV4IGFjNzAyNmYuLjUxMGEwMzggMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni9jcHVpZC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9jcHVpZC5jCkBAIC04
MDUsNyArODA1LDggQEAgdm9pZCBndWVzdF9jcHVpZChjb25zdCBzdHJ1Y3QgdmNwdSAqdiwgdWlu
dDMyX3QgbGVhZiwKICAgICAgICAgICAgICAqCiAgICAgICAgICAgICAgKiAtIEVubGlnaHRlbmVk
IENQVUlEIG9yIENQVUlEIGZhdWx0aW5nIGF2YWlsYWJsZToKICAgICAgICAgICAgICAqICAgIFhl
biBjYW4gZnVsbHkgY29udHJvbCB3aGF0IGlzIHNlZW4gaGVyZS4gIEd1ZXN0IGtlcm5lbHMgbmVl
ZAotICAgICAgICAgICAgICogICAgdG8gc2VlIHRoZSBsZWFrZWQgT1NYU0FWRSB2aWEgdGhlIGVu
bGlnaHRlbmVkIHBhdGgsIGJ1dAorICAgICAgICAgICAgICogICAgdG8gc2VlIHRoZSBsZWFrZWQg
T1NYU0FWRSB2aWEgdGhlIGVubGlnaHRlbmVkIHBhdGgKKyAgICAgICAgICAgICAqICAgICh1bmxl
c3MgWFNBVkUgaXMgZXhwbGljaXRseSBjbGVhciBpbiBwb2xpY3kpLCBidXQKICAgICAgICAgICAg
ICAqICAgIGd1ZXN0IHVzZXJzcGFjZSBhbmQgdGhlIG5hdGl2ZSBpcyBnaXZlbiBhcmNoaXRlY3R1
cmFsCiAgICAgICAgICAgICAgKiAgICBiZWhhdmlvdXIuCiAgICAgICAgICAgICAgKgpAQCAtODE0
LDcgKzgxNSw4IEBAIHZvaWQgZ3Vlc3RfY3B1aWQoY29uc3Qgc3RydWN0IHZjcHUgKnYsIHVpbnQz
Ml90IGxlYWYsCiAgICAgICAgICAgICAgKi8KICAgICAgICAgICAgIC8qIE9TWFNBVkUgY2xlYXIg
aW4gcG9saWN5LiAgRmFzdC1mb3J3YXJkIENSNCBiYWNrIGluLiAqLwogICAgICAgICAgICAgaWYg
KCAodi0+YXJjaC5wdi5jdHJscmVnWzRdICYgWDg2X0NSNF9PU1hTQVZFKSB8fAotICAgICAgICAg
ICAgICAgICAocmVncy0+ZW50cnlfdmVjdG9yID09IFRSQVBfaW52YWxpZF9vcCAmJgorICAgICAg
ICAgICAgICAgICAocC0+YmFzaWMueHNhdmUgJiYKKyAgICAgICAgICAgICAgICAgIHJlZ3MtPmVu
dHJ5X3ZlY3RvciA9PSBUUkFQX2ludmFsaWRfb3AgJiYKICAgICAgICAgICAgICAgICAgIGd1ZXN0
X2tlcm5lbF9tb2RlKHYsIHJlZ3MpICYmCiAgICAgICAgICAgICAgICAgICAocmVhZF9jcjQoKSAm
IFg4Nl9DUjRfT1NYU0FWRSkpICkKICAgICAgICAgICAgICAgICByZXMtPmMgfD0gY3B1ZmVhdF9t
YXNrKFg4Nl9GRUFUVVJFX09TWFNBVkUpOwotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs

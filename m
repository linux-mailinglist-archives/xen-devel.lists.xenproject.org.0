Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3AB14126C
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 21:44:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isYS6-00052g-7P; Fri, 17 Jan 2020 20:42:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J6zi=3G=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1isYS4-00052A-TQ
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 20:42:44 +0000
X-Inumbo-ID: e0585094-3969-11ea-b618-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0585094-3969-11ea-b618-12813bfff9fa;
 Fri, 17 Jan 2020 20:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579293749;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lwxbiIIphKzv7M1wucFaTA2yiLn6ylvMeg5ek0OqqtM=;
 b=NzTNjWKymJ77mAeZl/ylvSetxtWr/LYQM5x6LUXZ3uioOhEzCKqkTbkH
 1KB33wZQ1hze/vzfom2yiLMYKTpPBn8iXE7phdbI2fs9J4yllWG4ViQRR
 Nxe/qdHtY3gHLtO+U7X0RYnwFXSJXEfA4jDFKPQyFYZFu63RovAtys9fN k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NLwMu/lyppxgkdJGGTHgvjEoNtuwpwzJF3kL6hqvEbMtp2L0BT4q3QBv4yHjnAm7JBtTyh2SMl
 QmYkEMEkM4oVPN/rhsGTmaFvF2xF8tQn1Ett7VclcRlQE49SJ6BlwWhf14H1TEn/v/2Dkko9DE
 Bt0HKkzoBcGuCvwyVAAzRpxFx+zX0CWmctP6kMysHbkEkZ+0/yxM5lxLWHv2nxTfiJm5MUS8WE
 zUMgdJkl9CDLLwOpiMmg3ztxm58xnOTVeB9OwA4lE0rHDhU5LdbyzzZbK7hSnohzoyX18KX28Q
 PlA=
X-SBRS: 2.7
X-MesageID: 11688716
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,331,1574139600"; d="scan'208";a="11688716"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 20:42:22 +0000
Message-ID: <20200117204223.30076-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200117204223.30076-1-andrew.cooper3@citrix.com>
References: <20200117204223.30076-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 4/5] x86/boot: Simplify pagetable
 manipulation loops
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rm9yIF9fcGFnZV90YWJsZXNfe3N0YXJ0LGVuZH0gYW5kIEwzIGJvb3RtYXAgaW5pdGlhbGlzYXRp
b24sIHRoZSBsb2dpYyBpcwp1bm5lY2Vzc2VyaWx5IGNvbXBsaWNhdGVkIG93aW5nIHRvIGl0cyBh
dHRlbXB0IHRvIHVzZSB0aGUgTE9PUCBpbnN0cnVjdGlvbiwKd2hpY2ggcmVzdWx0cyBpbiBhbiBv
ZmYtYnktOCBtZW1vcnkgYWRkcmVzcyBvd2luZyB0byBMT09QJ3MgdGVybWluYXRpb24KY29uZGl0
aW9uLgoKUmV3cml0ZSBib3RoIGxvb3BzIGZvciBpbXByb3ZlZCBjbGFyaXR5IGFuZCBzcGVlZC4K
Ck1pc2Mgbm90ZXM6CiAqIFRFU1QgJElNTSwgTUVNIGNhbid0IG1hY3JvZnVzZS4gIFRoZSBsb29w
IGhhcyAweDEyMDAgaXRlcmF0aW9ucywgc28gcHVsbAogICB0aGUgJF9QQUdFX1BSRVNFTlQgY29u
c3RhbnQgb3V0IGludG8gYSBzcGFyZSByZWdpc3RlciB0byB0dXJuIHRoZSBURVNUIGludG8KICAg
aXRzICVSRUcsIE1FTSBmb3JtLCB3aGljaCBjYW4gbWFjcm9mdXNlLgogKiBBdm9pZCB0aGUgdXNl
IG9mICVmcy1yZWxhdGl2ZSByZWZlcmVuY2VzLiAgJWVzaS1yZWxhdGl2ZSBpcyB0aGUgbW9yZSBj
b21tb24KICAgZm9ybSBpbiB0aGUgY29kZSwgYW5kIGRvZXNuJ3Qgc3VmZmVyIGFuIGFkZHJlc3Mg
Z2VuZXJhdGlvbiBvdmVyaGVhZC4KICogQXZvaWQgTE9PUC4gIENNUC9KQiBpc24ndCBtaWNyb2Nv
ZGVkIGFuZCBmYXN0ZXIgdG8gZXhlY3V0ZSBpbiBhbGwgY2FzZXMuCiAqIEZvciBhIDQgaW50ZXJh
dGlvbiB0cml2aWFsIGxvb3AsIGV2ZW4gY29tcGlsZXJzIHVucm9sbCB0aGVzZS4gIFRoZQogICBn
ZW5lcmF0ZWQgY29kZSBzaXplIGlzIGEgZnJhY3Rpb24gbGFyZ2VyLCBidXQgdGhpcyBpcyBpbml0
IGFuZCB0aGUgYXNtIGlzCiAgIGZhciBlYXNpZXIgdG8gZm9sbG93LgogKiBSZXBvc2l0aW9uIHRo
ZSBsMj0+bDEgYm9vdG1hcCBjb25zdHJ1Y3Rpb24gc28gdGhlIGFzbSByZWFkcyBpbiBwYWdldGFi
bGUKICAgbGV2ZWwgb3JkZXIuCgpObyBmdW5jdGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJl
dWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9i
b290L2hlYWQuUyB8IDQxICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TIGIveGVuL2FyY2gveDg2L2Jvb3QvaGVh
ZC5TCmluZGV4IDFkZWVhZTJmMmEuLjFhY2FmODE3YmEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni9ib290L2hlYWQuUworKysgYi94ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMKQEAgLTY2MiwxMSAr
NjYyLDE3IEBAIHRyYW1wb2xpbmVfc2V0dXA6CiAgICAgICAgIG1vdiAgICAgJWVkeCxzeW1fZnMo
Ym9vdF90c2Nfc3RhbXApKzQKIAogICAgICAgICAvKiBSZWxvY2F0ZSBwYWdldGFibGVzIHRvIHBv
aW50IGF0IFhlbidzIGN1cnJlbnQgbG9jYXRpb24gaW4gbWVtb3J5LiAqLwotICAgICAgICBtb3Yg
ICAgICQoKF9fcGFnZV90YWJsZXNfZW5kLV9fcGFnZV90YWJsZXNfc3RhcnQpLzgpLCVlY3gKLTE6
ICAgICAgdGVzdGwgICAkX1BBR0VfUFJFU0VOVCxzeW1fZnMoX19wYWdlX3RhYmxlc19zdGFydCkt
OCgsJWVjeCw4KQorICAgICAgICBtb3YgICAgICRfUEFHRV9QUkVTRU5ULCAlZWR4CisgICAgICAg
IGxlYSAgICAgc3ltX2VzaShfX3BhZ2VfdGFibGVzX3N0YXJ0KSwgJWVheAorICAgICAgICBsZWEg
ICAgIHN5bV9lc2koX19wYWdlX3RhYmxlc19lbmQpLCAlZWRpCisKKzE6ICAgICAgdGVzdGIgICAl
ZGwsICglZWF4KSAgLyogaWYgcGFnZSBwcmVzZW50ICovCiAgICAgICAgIGp6ICAgICAgMmYKLSAg
ICAgICAgYWRkICAgICAlZXNpLHN5bV9mcyhfX3BhZ2VfdGFibGVzX3N0YXJ0KS04KCwlZWN4LDgp
Ci0yOiAgICAgIGxvb3AgICAgMWIKKyAgICAgICAgYWRkICAgICAlZXNpLCAoJWVheCkgLyogcHRl
ICs9IGJhc2UgKi8KKzI6ICAgICAgYWRkICAgICAkOCwgJWVheAorCisgICAgICAgIGNtcCAgICAg
JWVkaSwgJWVheAorICAgICAgICBqYiAgICAgIDFiCiAKICAgICAgICAgLyogTWFwIFhlbiBpbnRv
IHRoZSBoaWdoZXIgbWFwcGluZ3MgdXNpbmcgMk0gc3VwZXJwYWdlcy4gKi8KICAgICAgICAgbGVh
ICAgICBfUEFHRV9QU0UgKyBQQUdFX0hZUEVSVklTT1JfUldYICsgc3ltX2VzaShfc3RhcnQpLCAl
ZWF4CkBAIC03MDEsMjIgKzcwNywyNyBAQCB0cmFtcG9saW5lX3NldHVwOgogICAgICAgICBjbXAg
ICAgICVlZHgsICVlY3gKICAgICAgICAgamJlICAgICAxYgogCi0gICAgICAgIC8qIEluaXRpYWxp
emUgTDMgYm9vdC1tYXAgcGFnZSBkaXJlY3RvcnkgZW50cmllcy4gKi8KLSAgICAgICAgbGVhICAg
ICBfX1BBR0VfSFlQRVJWSVNPUisoTDJfUEFHRVRBQkxFX0VOVFJJRVMqOCkqMytzeW1fZXNpKGwy
X2Jvb3RtYXApLCVlYXgKLSAgICAgICAgbW92ICAgICAkNCwlZWN4Ci0xOiAgICAgIG1vdiAgICAg
JWVheCxzeW1fZnMobDNfYm9vdG1hcCktOCgsJWVjeCw4KQotICAgICAgICBzdWIgICAgICQoTDJf
UEFHRVRBQkxFX0VOVFJJRVMqOCksJWVheAotICAgICAgICBsb29wICAgIDFiCi0KLSAgICAgICAg
LyogTWFwIHRoZSBwZXJtYW5lbnQgdHJhbXBvbGluZSBwYWdlIGludG8gbHsxLDJ9X2Jvb3RtYXBb
XS4gKi8KKyAgICAgICAgLyogTWFwIDR4IGwyX2Jvb3RtYXBbXSBpbnRvIGwzX2Jvb3RtYXBbMC4u
LjNdICovCisgICAgICAgIGxlYSAgICAgX19QQUdFX0hZUEVSVklTT1IgKyBzeW1fZXNpKGwyX2Jv
b3RtYXApLCAlZWF4CisgICAgICAgIG1vdiAgICAgJFBBR0VfU0laRSwgJWVkeAorICAgICAgICBt
b3YgICAgICVlYXgsIDAgICsgc3ltX2VzaShsM19ib290bWFwKQorICAgICAgICBhZGQgICAgICVl
ZHgsICVlYXgKKyAgICAgICAgbW92ICAgICAlZWF4LCA4ICArIHN5bV9lc2kobDNfYm9vdG1hcCkK
KyAgICAgICAgYWRkICAgICAlZWR4LCAlZWF4CisgICAgICAgIG1vdiAgICAgJWVheCwgMTYgKyBz
eW1fZXNpKGwzX2Jvb3RtYXApCisgICAgICAgIGFkZCAgICAgJWVkeCwgJWVheAorICAgICAgICBt
b3YgICAgICVlYXgsIDI0ICsgc3ltX2VzaShsM19ib290bWFwKQorCisgICAgICAgIC8qIE1hcCBs
MV9ib290bWFwW10gaW50byBsMl9ib290bWFwWzBdLiAqLworICAgICAgICBsZWEgICAgIF9fUEFH
RV9IWVBFUlZJU09SICsgc3ltX2VzaShsMV9ib290bWFwKSwgJWVheAorICAgICAgICBtb3YgICAg
ICVlYXgsIHN5bV9lc2kobDJfYm9vdG1hcCkKKworICAgICAgICAvKiBNYXAgdGhlIHBlcm1hbmVu
dCB0cmFtcG9saW5lIHBhZ2UgaW50byBsMV9ib290bWFwW10uICovCiAgICAgICAgIG1vdiAgICAg
c3ltX2VzaSh0cmFtcG9saW5lX3BoeXMpLCAlZWN4CiAgICAgICAgIGxlYSAgICAgX19QQUdFX0hZ
UEVSVklTT1JfUlgoJWVjeCksICVlZHggLyogJWVkeCA9IFBURSB0byB3cml0ZSAgKi8KICAgICAg
ICAgc2hyICAgICAkUEFHRV9TSElGVCwgJWVjeCAgICAgICAgICAgICAgICAvKiAlZWN4ID0gU2xv
dCB0byB3cml0ZSAqLwogICAgICAgICBtb3YgICAgICVlZHgsIHN5bV9vZmZzKGwxX2Jvb3RtYXAp
KCVlc2ksICVlY3gsIDgpCiAKLSAgICAgICAgbGVhICAgICBfX1BBR0VfSFlQRVJWSVNPUiArIHN5
bV9lc2kobDFfYm9vdG1hcCksICVlZHgKLSAgICAgICAgbW92ICAgICAlZWR4LCBzeW1fZXNpKGwy
X2Jvb3RtYXApCi0KICAgICAgICAgLyogQXBwbHkgcmVsb2NhdGlvbnMgdG8gYm9vdHN0cmFwIHRy
YW1wb2xpbmUuICovCiAgICAgICAgIG1vdiAgICAgc3ltX2VzaSh0cmFtcG9saW5lX3BoeXMpLCAl
ZWR4CiAgICAgICAgIGxlYSAgICAgc3ltX2VzaShfX3RyYW1wb2xpbmVfcmVsX3N0YXJ0KSwgJWVk
aQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==

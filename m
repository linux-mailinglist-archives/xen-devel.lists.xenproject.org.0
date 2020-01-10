Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA93137268
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 17:07:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipwmB-0008VV-1u; Fri, 10 Jan 2020 16:04:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vEkf=27=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ipwm8-0008V2-Nw
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 16:04:40 +0000
X-Inumbo-ID: e149b272-33c2-11ea-ac27-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e149b272-33c2-11ea-ac27-bc764e2007e4;
 Fri, 10 Jan 2020 16:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578672268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=odR4T7FdyMjtoMTFg7NqDhU7Y+0hx1R2vtuLmii667A=;
 b=VA9PIlOBFaV0Eh4FLtK+MwRLlIC5mHz79x6s6sE3wVGwr6ZG9d2lspkh
 PUhJf/StlvmCc1FRiCHW0X3pYR/3YVeEEwGiE5p6NdXOJaVSPLyJ6+4io
 k8VAZnuz97ZB82+psMDSM+/bKpowl47B0pLKkk7Lp9B6Eq4VYukHb7Tuu M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JGMoYIdgPrgc0P5P+OJOW5EvTjhm9zcc15ZBYKBDI837paWXkPEMTWlJTngcH9BUCgk9AmYby7
 e/rPaYG0WoF7OJmtls47gPPmiFB0h9LCXcSWsRxclKZopoySyvIVUIRjMvZ8ktus1uQg8Vqnbp
 iFQPdbDmf2126T+zB1gBxzUUmBH1Rww0v31YxgBsqH6u6AVTuLTbYRymbKnzMmzn/pUcbN+qZB
 H3n1U5GHwrWmE6YXILGiJ9CSXeVE19UVMEeXdGOTIEkqN9icE/s9u4zLYUgBCX2uUsxoBLqyvZ
 8YM=
X-SBRS: 2.7
X-MesageID: 11183715
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,417,1571716800"; d="scan'208";a="11183715"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 10 Jan 2020 17:04:02 +0100
Message-ID: <20200110160404.15573-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200110160404.15573-1-roger.pau@citrix.com>
References: <20200110160404.15573-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/3] x86/hvm: allow ASID flush when v !=
 current
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
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudCBpbXBsZW1lbnRhdGlvbiBvZiBodm1fYXNpZF9mbHVzaF92Y3B1IGlzIG5vdCBzYWZl
IHRvIHVzZQp1bmxlc3MgdGhlIHRhcmdldCB2Q1BVIGlzIGVpdGhlciBwYXVzZWQgb3IgdGhlIGN1
cnJlbnRseSBydW5uaW5nIG9uZSwKYXMgaXQgbW9kaWZpZXMgdGhlIGdlbmVyYXRpb24gd2l0aG91
dCBhbnkgbG9ja2luZy4KCkZpeCB0aGlzIGJ5IHVzaW5nIGF0b21pYyBvcGVyYXRpb25zIHdoZW4g
YWNjZXNzaW5nIHRoZSBnZW5lcmF0aW9uCmZpZWxkLCBib3RoIGluIGh2bV9hc2lkX2ZsdXNoX3Zj
cHVfYXNpZCBhbmQgb3RoZXIgQVNJRCBmdW5jdGlvbnMuIFRoaXMKYWxsb3dzIHRvIHNhZmVseSBm
bHVzaCB0aGUgY3VycmVudCBBU0lEIGdlbmVyYXRpb24uIE5vdGUgdGhhdCBmb3IgdGhlCmZsdXNo
IHRvIHRha2UgZWZmZWN0IGlmIHRoZSB2Q1BVIGlzIGN1cnJlbnRseSBydW5uaW5nIGEgdm1leGl0
IGlzCnJlcXVpcmVkLgoKTm90ZSB0aGUgc2FtZSBjb3VsZCBiZSBhY2hpZXZlZCBieSBpbnRyb2R1
Y2luZyBhbiBleHRyYSBmaWVsZCB0bwpodm1fdmNwdV9hc2lkIHRoYXQgc2lnbmFscyBodm1fYXNp
ZF9oYW5kbGVfdm1lbnRlciB0aGUgbmVlZCB0byBjYWxsCmh2bV9hc2lkX2ZsdXNoX3ZjcHUgb24g
dGhlIGdpdmVuIHZDUFUgYmVmb3JlIHZtZW50cnksIHRoaXMgaG93ZXZlcgpzZWVtcyB1bm5lY2Vz
c2FyeSBhcyBodm1fYXNpZF9mbHVzaF92Y3B1IGl0c2VsZiBvbmx5IHNldHMgdHdvIHZDUFUKZmll
bGRzIHRvIDAsIHNvIHRoZXJlJ3Mgbm8gbmVlZCB0byBkZWxheSB0aGlzIHRvIHRoZSB2bWVudHJ5
IEFTSUQKaGVscGVyLgoKVGhpcyBpcyBub3QgYSBidWdmaXggYXMgbm8gY2FsbGVycyB0aGF0IHdv
dWxkIHZpb2xhdGUgdGhlIGFzc3VtcHRpb25zCmxpc3RlZCBpbiB0aGUgZmlyc3QgcGFyYWdyYXBo
IGhhdmUgYmVlbiBmb3VuZCwgYnV0IGEgcHJlcGFyYXRvcnkKY2hhbmdlIGluIG9yZGVyIHRvIGFs
bG93IHJlbW90ZSBmbHVzaGluZyBvZiBIVk0gdkNQVXMuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL2Fz
aWQuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vYXNpZC5jIGIveGVuL2FyY2gv
eDg2L2h2bS9hc2lkLmMKaW5kZXggOWQzYzY3MWE1Zi4uODBiNzNkYTg5YiAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L2h2bS9hc2lkLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9hc2lkLmMKQEAg
LTgyLDcgKzgyLDcgQEAgdm9pZCBodm1fYXNpZF9pbml0KGludCBuYXNpZHMpCiAKIHZvaWQgaHZt
X2FzaWRfZmx1c2hfdmNwdV9hc2lkKHN0cnVjdCBodm1fdmNwdV9hc2lkICphc2lkKQogewotICAg
IGFzaWQtPmdlbmVyYXRpb24gPSAwOworICAgIHdyaXRlX2F0b21pYygmYXNpZC0+Z2VuZXJhdGlv
biwgMCk7CiB9CiAKIHZvaWQgaHZtX2FzaWRfZmx1c2hfdmNwdShzdHJ1Y3QgdmNwdSAqdikKQEAg
LTEyMCw3ICsxMjAsNyBAQCBib29sX3QgaHZtX2FzaWRfaGFuZGxlX3ZtZW50ZXIoc3RydWN0IGh2
bV92Y3B1X2FzaWQgKmFzaWQpCiAgICAgICAgIGdvdG8gZGlzYWJsZWQ7CiAKICAgICAvKiBUZXN0
IGlmIFZDUFUgaGFzIHZhbGlkIEFTSUQuICovCi0gICAgaWYgKCBhc2lkLT5nZW5lcmF0aW9uID09
IGRhdGEtPmNvcmVfYXNpZF9nZW5lcmF0aW9uICkKKyAgICBpZiAoIHJlYWRfYXRvbWljKCZhc2lk
LT5nZW5lcmF0aW9uKSA9PSBkYXRhLT5jb3JlX2FzaWRfZ2VuZXJhdGlvbiApCiAgICAgICAgIHJl
dHVybiAwOwogCiAgICAgLyogSWYgdGhlcmUgYXJlIG5vIGZyZWUgQVNJRHMsIG5lZWQgdG8gZ28g
dG8gYSBuZXcgZ2VuZXJhdGlvbiAqLwpAQCAtMTM0LDcgKzEzNCw3IEBAIGJvb2xfdCBodm1fYXNp
ZF9oYW5kbGVfdm1lbnRlcihzdHJ1Y3QgaHZtX3ZjcHVfYXNpZCAqYXNpZCkKIAogICAgIC8qIE5v
dyBndWFyYW50ZWVkIHRvIGJlIGEgZnJlZSBBU0lELiAqLwogICAgIGFzaWQtPmFzaWQgPSBkYXRh
LT5uZXh0X2FzaWQrKzsKLSAgICBhc2lkLT5nZW5lcmF0aW9uID0gZGF0YS0+Y29yZV9hc2lkX2dl
bmVyYXRpb247CisgICAgd3JpdGVfYXRvbWljKCZhc2lkLT5nZW5lcmF0aW9uLCBkYXRhLT5jb3Jl
X2FzaWRfZ2VuZXJhdGlvbik7CiAKICAgICAvKgogICAgICAqIFdoZW4gd2UgYXNzaWduIEFTSUQg
MSwgZmx1c2ggYWxsIFRMQiBlbnRyaWVzIGFzIHdlIGFyZSBzdGFydGluZyBhIG5ldwotLSAKMi4y
NC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

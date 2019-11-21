Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B16C105065
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 11:22:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXjYT-0003wE-Dl; Thu, 21 Nov 2019 10:19:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0uFN=ZN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iXjYR-0003w9-KT
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 10:19:15 +0000
X-Inumbo-ID: 5df31d38-0c48-11ea-b678-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5df31d38-0c48-11ea-b678-bc764e2007e4;
 Thu, 21 Nov 2019 10:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574331555;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x/JGpG39DfpKhBur1pJPt3SqA0ktBe9gMyJSwPG2uBg=;
 b=BxjJX2z+bZrZk5Th/nmXeLiTon3FOp9fWbe0UWwYEtXPNez69i2hR4UK
 eMnMAkwCF91XQDJ/GoZCNVRQNkg/dHlh2guP+EjT/3b4h2MHYImF/a9UJ
 +xnk7BxT1Ntovtis6ckI0D+7V4F/n2LmGYRxOAzdSoLgB194yUh6UYBju E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nXhawkTx5ibZoIqmd6fVMvCywa6TxPaB9oBrKVoKpLU66HACIWQ0gTgb1SPKlndMeNsWg79J2u
 ATK2Edb14G/ETD4cx2JtbMQYIa3X9FZmpYzWvonbC5n+rIRC83afJRAIV2Yw6cc32fjSIstlMO
 nJRFNhG1kf5Is7sodIbMmfl5tigfxGZtcKVqfrq46mMzs65lVxqiHc/4FYnpwDefqhCce2S63F
 n9kuoxmBWe1ljkP1hp8ksLhEzkhUT+E0eoRrVw4r9cQk3hanxSWjhnsJMMQn807/D8a3rfBEqS
 aOQ=
X-SBRS: 2.7
X-MesageID: 8762668
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,224,1571716800"; 
   d="scan'208";a="8762668"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 21 Nov 2019 11:19:04 +0100
Message-ID: <20191121101904.10295-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 v2] x86/vlapic: allow setting
 APIC_SPIV_FOCUS_DISABLED in x2APIC mode
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudCBjb2RlIHVuY29uZGl0aW9uYWxseSBwcmV2ZW50cyBzZXR0aW5nIEFQSUNfU1BJVl9G
T0NVU19ESVNBQkxFRApyZWdhcmRsZXNzIG9mIHRoZSBwcm9jZXNzb3IgbW9kZWwsIHdoaWNoIGlz
IG5vdCBjb3JyZWN0IGFjY29yZGluZyB0bwp0aGUgc3BlY2lmaWNhdGlvbi4KClRoaXMgaXNzdWUg
d2FzIGRpc2NvdmVyZWQgd2hpbGUgdHJ5aW5nIHRvIGJvb3QgYSBwdnNoaW0gd2l0aCB4MkFQSUMK
ZW5hYmxlZC4KCkFsd2F5cyBhbGxvdyBzZXR0aW5nIEFQSUNfU1BJVl9GT0NVU19ESVNBQkxFRDog
dGhlIGxvY2FsIEFQSUMKcHJvdmlkZWQgdG8gZ3Vlc3RzIGlzIGVtdWxhdGVkIGJ5IFhlbiwgYW5k
IGFzIHN1Y2ggZG9lc24ndCBkZXBlbmQgb24KdGhlIGZlYXR1cmVzIGZvdW5kIG9uIHRoZSBoYXJk
d2FyZSBwcm9jZXNzb3IuIE5vdGUgZm9yIGV4YW1wbGUgdGhhdApYZW4gb2ZmZXJzIHgyQVBJQyBz
dXBwb3J0IHRvIGd1ZXN0cyBldmVuIHdoZW4gdGhlIHVuZGVybHlpbmcgaGFyZHdhcmUKZG9lc24n
dCBoYXZlIHN1Y2ggZmVhdHVyZS4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KLS0tCkNoYW5nZXMgc2luY2UgdjE6CiAtIEFsd2F5cyBhbGxvdyBzZXR0aW5nIHRoZSBBUElD
X1NQSVZfRk9DVVNfRElTQUJMRUQgYml0LgotLS0KIHhlbi9hcmNoL3g4Ni9odm0vdmxhcGljLmMg
fCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9odm0vdmxhcGljLmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZsYXBpYy5jCmluZGV4IDk0
NjYyNThkNmYuLmI3OTBiYTZiYmQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdmxhcGlj
LmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS92bGFwaWMuYwpAQCAtOTkzLDYgKzk5Myw3IEBAIGlu
dCBndWVzdF93cm1zcl94MmFwaWMoc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90IG1zciwgdWludDY0
X3QgbXNyX2NvbnRlbnQpCiAKICAgICBjYXNlIEFQSUNfU1BJVjoKICAgICAgICAgaWYgKCBtc3Jf
Y29udGVudCAmIH4oQVBJQ19WRUNUT1JfTUFTSyB8IEFQSUNfU1BJVl9BUElDX0VOQUJMRUQgfAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBUElDX1NQSVZfRk9DVVNfRElTQUJMRUQgfAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoVkxBUElDX1ZFUlNJT04gJiBBUElDX0xWUl9E
SVJFQ1RFRF9FT0kKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID8gQVBJQ19TUElWX0RJ
UkVDVEVEX0VPSSA6IDApKSApCiAgICAgICAgICAgICByZXR1cm4gWDg2RU1VTF9FWENFUFRJT047
Ci0tIAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

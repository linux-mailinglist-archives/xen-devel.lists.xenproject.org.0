Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BE713CC7C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 19:46:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irneT-0001P5-3g; Wed, 15 Jan 2020 18:44:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aRIg=3E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1irneR-0001Ow-NT
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 18:44:23 +0000
X-Inumbo-ID: 0b6dd1fc-37c7-11ea-85e7-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b6dd1fc-37c7-11ea-85e7-12813bfff9fa;
 Wed, 15 Jan 2020 18:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579113862;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r/ggpehdLKgSaftd0qaf+dm4Eaqs1+yXf/zW9P9T9dw=;
 b=LfBPVDVk6+7HqcsTCvc1C8GA6/VGq/ik46SfoLuDrWFFG6kTi0EMKv9s
 6WkskCaW922bnc8ToaFMOUNms5l2X8UVvUmsPSFLFrSd6qFU8lHh/YM3o
 ophSlg10ABdOr+75Ardl5hx0eAwOrQ6ZBc4UVmIT+pnJ9K7wCj8bxHj9Y s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PxPYgF+JdwxJr6bJL5nqPxiDjRsfGp6oDakz4ZvUcTefXlrzzRk3l8FGJVsDNwUKUjjtymvP0l
 +l4r/vNhbp9dM7eo9njyM7u9VQcL0hDvw+zIWGkDO4NerysPdatnaQ0+Wka1JTKMpNpUiuoAI3
 0aQDT0ghvylWDMHsmh6mAra6EZts3rw2OfiRxzdrrABRN/GSyN+gqM7VtHjIvBr2vNjrsHKHoY
 LJWzD9Ip2sASgX0aSUwpRjmLwM1OH4bjduO22Kdk4ymvx7h4XsAIltF10+KKbVuAIa1tybQAbH
 wY0=
X-SBRS: 2.7
X-MesageID: 11393005
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,323,1574139600"; d="scan'208";a="11393005"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 15 Jan 2020 18:44:18 +0000
Message-ID: <20200115184418.21365-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen/vcpu: Improve sanity checks in vcpu_create()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIEJVR19PTigpIGlzIGNvbmZ1c2luZyB0byBmb2xsb3cuICBUaGUgKCFpc19pZGxlX2RvbWFp
bihkKSB8fCB2Y3B1X2lkKSBwYXJ0CmlzIGEgdmVzdGlnaWFsIHJlbW5hbnQgb2YgYXJjaGl0ZWN0
dXJlcyBwb2lzaW9uaW5nIGlkbGVfdmNwdVswXSB3aXRoIG5vbi1OVUxMCnBvaW50ZXJzLgoKTm93
IHRoYXQgaWRsZV92Y3B1WzBdIGlzIE5VTEwgb24gYWxsIGFyY2hpdGVjdHVyZXMsIGFuZCBkLT5t
YXhfdmNwdXMgc3BlY2lmaWVkCmJlZm9yZSB2Y3B1X2NyZWF0ZSgpIGlzIGNhbGxlZCwgd2UgY2Fu
IHByb3Blcmx5IHJhbmdlIGNoZWNrIHRoZSByZXF1ZXN0ZWQKdmNwdV9pZC4KClNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFu
IEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDQzogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW5A
eGVuLm9yZz4KQ0M6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNv
bT4KLS0tCiB4ZW4vY29tbW9uL2RvbWFpbi5jIHwgMTQgKysrKysrKysrKysrKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVu
L2NvbW1vbi9kb21haW4uYyBiL3hlbi9jb21tb24vZG9tYWluLmMKaW5kZXggMGIxMTAzZmRiMi4u
ZWUzZjlmZmQzZSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9kb21haW4uYworKysgYi94ZW4vY29t
bW9uL2RvbWFpbi5jCkBAIC0xMzksNyArMTM5LDE5IEBAIHN0cnVjdCB2Y3B1ICp2Y3B1X2NyZWF0
ZShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgdmNwdV9pZCkKIHsKICAgICBzdHJ1Y3Qg
dmNwdSAqdjsKIAotICAgIEJVR19PTigoIWlzX2lkbGVfZG9tYWluKGQpIHx8IHZjcHVfaWQpICYm
IGQtPnZjcHVbdmNwdV9pZF0pOworICAgIC8qCisgICAgICogU2FuaXR5IGNoZWNrIHNvbWUgaW5w
dXQgZXhwZWN0YXRpb25zOgorICAgICAqIC0gdmNwdV9pZCBzaG91bGQgYmUgYm91bmRlZCBieSBk
LT5tYXhfdmNwdXMsIGFuZCBub3QgcHJldmlvdXNseQorICAgICAqICAgYWxsb2NhdGVkLgorICAg
ICAqIC0gVkNQVXMgc2hvdWxkIGJlIHRpZ2h0bHkgcGFja2VkIGFuZCBhbGxvY2F0ZWQgaW4gYXNj
ZW5kaW5nIG9yZGVyLAorICAgICAqICAgZXhjZXB0IGZvciB0aGUgaWRsZSBkb21haW4gd2hpY2gg
bWF5IHZhcnkgYmFzZWQgb24gUENQVSBudW1iZXJpbmcuCisgICAgICovCisgICAgaWYgKCB2Y3B1
X2lkID49IGQtPm1heF92Y3B1cyB8fCBkLT52Y3B1W3ZjcHVfaWRdIHx8CisgICAgICAgICAoIWlz
X2lkbGVfZG9tYWluKGQpICYmIHZjcHVfaWQgJiYgIWQtPnZjcHVbdmNwdV9pZCAtIDFdKSApCisg
ICAgeworICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKKyAgICAgICAgcmV0dXJuIE5VTEw7
CisgICAgfQogCiAgICAgaWYgKCAodiA9IGFsbG9jX3ZjcHVfc3RydWN0KGQpKSA9PSBOVUxMICkK
ICAgICAgICAgcmV0dXJuIE5VTEw7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs

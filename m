Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 695D0269A5
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 20:13:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTVhK-0006q3-Vt; Wed, 22 May 2019 18:10:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I7ts=TW=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1hTVhJ-0006py-Eh
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 18:10:41 +0000
X-Inumbo-ID: e7bed797-7cbc-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e7bed797-7cbc-11e9-8980-bc764e045a96;
 Wed, 22 May 2019 18:10:39 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 10a1X91dTv4sCxhQ9Zkez7gVF7HgXlQ9bnUXdNZCEHjXZ2PwZxEA4A8MfGPLD91/AeFXmJgJBZ
 Vil+QCiXppb5ZdXGK02sCaJi88PtLfJG4K7nqo2MrcBCtsvonOKiVjst8zEuLADngwRYXjNw8E
 Ot+dIjP0iVtS+RsrAbKO94/MdKQCoZScy8OAzVW432LqzDYYO9GJLqXDeNrauy8ZxXua/BxBz/
 DWxaZZ0kiB17l2If67kbMxzmH/5ZesfrW6bj1ViRohLLhOwt6TKOLLkngsfHKhG4wy7ZfMss4y
 JrI=
X-SBRS: 2.7
X-MesageID: 786454
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,500,1549947600"; 
   d="scan'208";a="786454"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 22 May 2019 19:10:34 +0100
Message-ID: <1558548634-25154-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] libacpi: report PCI slots as enabled only for
 hotpluggable devices
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
Cc: andrew.cooper3@citrix.com, wei.liu2@citrix.com, ian.jackson@eu.citrix.com,
 jbeulich@suse.com, Igor Druzhinin <igor.druzhinin@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RFNEVCBmb3IgcWVtdS14ZW4gbGFja3MgX1NUQSBtZXRob2Qgb2YgUENJIHNsb3Qgb2JqZWN0LiBJ
ZiBfU1RBIG1ldGhvZApkb2Vzbid0IGV4aXN0IHRoZW4gdGhlIHNsb3QgaXMgYXNzdW1lZCB0byBi
ZSBhbHdheXMgcHJlc2VudCBhbmQgYWN0aXZlCndoaWNoIGluIGNvbmp1bmN0aW9uIHdpdGggX0VK
MCBtZXRob2QgbWFrZXMgZXZlcnkgZGV2aWNlIGVqZWN0YWJsZSBmb3IKYW4gT1MgZXZlbiBpZiBp
dCdzIG5vdCB0aGUgY2FzZS4KCnFlbXUta3ZtIGlzIGFibGUgdG8gZHluYW1pY2FsbHkgYWRkIF9F
SjAgbWV0aG9kIG9ubHkgdG8gdGhvc2Ugc2xvdHMKdGhhdCBlaXRoZXIgaGF2ZSBob3RwbHVnZ2Fi
bGUgZGV2aWNlcyBvciBmcmVlIGZvciBQQ0kgcGFzc3Rocm91Z2guCkFzIFhlbiBsYWNrcyB0aGlz
IGNhcGFiaWxpdHkgd2UgY2Fubm90IHVzZSB0aGVpciB3YXkuCgpxZW11LXhlbi10cmFkaXRpb25h
bCBEU0RUIGhhcyBfU1RBIG1ldGhvZCB3aGljaCBvbmx5IHJlcG9ydHMgdGhhdAp0aGUgc2xvdCBp
cyBwcmVzZW50IGlmIHRoZXJlIGlzIGEgUENJIGRldmljZXMgaG90cGx1Z2dlZCB0aGVyZS4KVGhp
cyBpcyBkb25lIHRocm91Z2ggcXVlcnlpbmcgb2YgaXRzIFBDSSBob3RwbHVnIGNvbnRyb2xsZXIu
CnFlbXUteGVuIGhhcyBzaW1pbGFyIGNhcGFiaWxpdHkgdGhhdCByZXBvcnRzIGlmIGRldmljZSBp
cyAiaG90cGx1Z2dhYmxlCm9yIGFic2VudCIgd2hpY2ggd2UgY2FuIHVzZSB0byBhY2hpZXZlIHRo
ZSBzYW1lIHJlc3VsdC4KClNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpo
aW5pbkBjaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYmFjcGkvbWtfZHNkdC5jIHwgOSArKysrKysr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS90b29scy9saWJhY3BpL21rX2RzZHQuYyBiL3Rvb2xzL2xpYmFjcGkvbWtfZHNkdC5j
CmluZGV4IDJkYWYzMmMuLmM1YmE0YzAgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYmFjcGkvbWtfZHNk
dC5jCisrKyBiL3Rvb2xzL2xpYmFjcGkvbWtfZHNkdC5jCkBAIC00MzksOSArNDM5LDEwIEBAIGlu
dCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKICAgICAgICAgICAgIHBvcF9ibG9jaygpOwog
ICAgICAgICB9CiAgICAgfSBlbHNlIHsKLSAgICAgICAgc3RtdCgiT3BlcmF0aW9uUmVnaW9uIiwg
IlNFSiwgU3lzdGVtSU8sIDB4YWUwOCwgMHgwNCIpOworICAgICAgICBzdG10KCJPcGVyYXRpb25S
ZWdpb24iLCAiU0VKLCBTeXN0ZW1JTywgMHhhZTA4LCAweDA4Iik7CiAgICAgICAgIHB1c2hfYmxv
Y2soIkZpZWxkIiwgIlNFSiwgRFdvcmRBY2MsIE5vTG9jaywgV3JpdGVBc1plcm9zIik7CiAgICAg
ICAgIGluZGVudCgpOyBwcmludGYoIkIwRUosIDMyLFxuIik7CisgICAgICAgIGluZGVudCgpOyBw
cmludGYoIkIwUk0sIDMyLFxuIik7CiAgICAgICAgIHBvcF9ibG9jaygpOwogCiAgICAgICAgIC8q
IGhvdHBsdWdfc2xvdCAqLwpAQCAtNDUyLDYgKzQ1MywxMiBAQCBpbnQgbWFpbihpbnQgYXJnYywg
Y2hhciAqKmFyZ3YpCiAgICAgICAgICAgICAgICAgICAgIHN0bXQoIlN0b3JlIiwgIiUjMDEweCwg
QjBFSiIsIDEgPDwgc2xvdCk7CiAgICAgICAgICAgICAgICAgfSBwb3BfYmxvY2soKTsKICAgICAg
ICAgICAgICAgICBzdG10KCJOYW1lIiwgIl9TVU4sICVpIiwgc2xvdCk7CisgICAgICAgICAgICAg
ICAgcHVzaF9ibG9jaygiTWV0aG9kIiwgIl9TVEEsIDAiKTsgeworICAgICAgICAgICAgICAgICAg
ICBwdXNoX2Jsb2NrKCJJZiIsICJBbmQoQjBSTSwgU2hpZnRMZWZ0KDEsICVpKSkiLCBzbG90KTsK
KyAgICAgICAgICAgICAgICAgICAgc3RtdCgiUmV0dXJuIiwgIjB4RiIpOworICAgICAgICAgICAg
ICAgICAgICBwb3BfYmxvY2soKTsKKyAgICAgICAgICAgICAgICAgICAgc3RtdCgiUmV0dXJuIiwg
IjB4MCIpOworICAgICAgICAgICAgICAgIH0gcG9wX2Jsb2NrKCk7CiAgICAgICAgICAgICB9IHBv
cF9ibG9jaygpOwogICAgICAgICB9CiAgICAgfQotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

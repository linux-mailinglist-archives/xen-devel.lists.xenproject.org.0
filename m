Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B0B11EE01
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 23:51:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iftjN-00039E-Tj; Fri, 13 Dec 2019 22:48:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QQqQ=2D=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iftjM-000399-Iz
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 22:48:16 +0000
X-Inumbo-ID: a102b1ce-1dfa-11ea-88e7-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a102b1ce-1dfa-11ea-88e7-bc764e2007e4;
 Fri, 13 Dec 2019 22:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576277287;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=GX702I8OZqsKNNUmmM15VFUTEo0kvpdUVG80vzBllR4=;
 b=QYzOPtNxLMDd8CsDqyNIfnLttvsPTOEV77CBxvLQAuWNnjebw+w8ws6a
 d4ZagbYrDuSBNJ+Ol40MAQT5rLunFuqzVe0YOc3iIiOxw0Y2GXAC/mN7A
 gMmWueop5TLUBRHh7QZYuIOltdOAjOqSVn0ERGs3Zwew+ek2hb2P0fpVZ M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: oUnBs8IymVdq/Rrdsa3GwIW/88IqU6j2RnWbKiKixYhhx1n0xkT2jibsCWZobPxBuPTZX+EDnl
 inet5vdBfsJlMuE3H/nphArVEBC4xifkkMJb3V1anRs5zG+lawpXJlOvyMwPsRjaDvlEFwsyaB
 JnrAFUQ39rtSFEBPVKJQAk1/yxPG8awPXoGd3wMnAYJTxjheyVRDOdy33pxdEus/9VHCCFl7De
 MNASvcynk+uaShnB5NyfjxO77/iJ4vGniR3ShkmF9m/LZxOeZwpRMH7NgYquqOKEpHeoPuwtHz
 vwI=
X-SBRS: 2.7
X-MesageID: 10241744
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,311,1571716800"; d="scan'208";a="10241744"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 13 Dec 2019 22:48:00 +0000
Message-ID: <1576277282-6590-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/2] vTSC performance improvements
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

SW4gb3VyIFBWIHNoaW0gdGVzdGluZyB3ZSd2ZSBub3RpY2VkIGNvbnN0YW50IGxvY2t1cHMgb2Yg
Z3Vlc3RzIHdpdGggaGlnaApudW1iZXIgb2YgdkNQVXMgYXNzaWduZWQgdGhhdCB1c3VhbGx5IGhh
cHBlbmluZyB3aGVuIHRoZXJlIGlzIGFub3RoZXIgZ3Vlc3QKcnVubmluZyBvbiB0aGUgc2FtZSBo
b3N0LiBSZXByb2luZyB0aGUgcHJvYmxlbSBtYW51YWxseSBhbmQgZHVtcGluZyBzaGltCnN0YXRl
IGltbWVkaWF0ZWx5IHNob3dlZCB0aGF0IG1vc3Qgb2YgdGhlIHZDUFVzIGFyZSBsb2NrZWQgb24g
dnRzY19sb2NrLgpBcyBQViBzaGltIGd1ZXN0IGFsd2F5cyBnZXRzIGVtdWxhdGVkIFRTQyBkdWUg
dG8gTDEgWGVuIGl0c2VsZiBub3QgYmVpbmcKcHJvdmlkZWQgd2l0aCBJVFNDIHRoZSBpZGVhbCBz
b2x1dGlvbiB3b3VsZCBiZSB0byB0cnkgZHJvcHBpbmcgdGhlIGxvY2sKZW50aXJlbHkuCgpJZ29y
IERydXpoaW5pbiAoMik6CiAgeDg2L3RpbWU6IGRyb3AgdnRzY197a2Vybix1c2VyfWNvdW50IGRl
YnVnIGNvdW50ZXJzCiAgeDg2L3RpbWU6IHVwZGF0ZSB2dHNjX2xhc3Qgd2l0aCBjbXB4Y2hnIGFu
ZCBkcm9wIHZ0c2NfbG9jawoKIHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICAgfCAgMSAtCiB4
ZW4vYXJjaC94ODYvaHZtL2h2bS5jICAgICAgIHwgMzIgKystLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni90aW1lLmMgICAgICAgICAgfCAyOCArKysrKystLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5oIHwgIDUgLS0tLS0K
IDQgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA1OCBkZWxldGlvbnMoLSkKCi0tIAoy
LjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

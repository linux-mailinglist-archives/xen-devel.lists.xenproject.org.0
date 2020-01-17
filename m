Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 683901406FE
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 10:56:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isOJb-0007w5-6J; Fri, 17 Jan 2020 09:53:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b9RF=3G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1isOJZ-0007w0-69
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 09:53:17 +0000
X-Inumbo-ID: 2d96909a-390f-11ea-8893-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d96909a-390f-11ea-8893-12813bfff9fa;
 Fri, 17 Jan 2020 09:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579254794;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vEKsJUlvawiOuYVikIzunTXqZZDS3NiOE4VMoKrCXag=;
 b=WBmuy4nNK8uJnkx4Yc5ftZ0v5x+KpQdhWB6M+5cZrYydamGqiOG5yP4U
 hrfcva2s6JqVCd2vWh2ghKFltwLS2rWh2QVpgOA7iZ5Z6IQ1ELGndtecE
 N2cQZmnGwATeY6fG1dJ/bG8TRyiiYkT0q94YUzHYfbAu5yJR2JoauND/A k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +a8SzTnZRjPWsdbIik7pSZwBrfe9svV1UId1QR1OC/8sFPvlqUnXnSXJ71XLoCqdicvxTBPYQs
 +5PbF8Da+giYRlbXhOI0+jw/2WL/Gpi/Am4SSpkQTnFhcJyrjl3Xlt5WYUIHIft2uEgAskIste
 I9g1dzRUPDRrSCUiFTJnS2f8kLf7EpM857fZv1i8IRym3h4uENfrwFWEbQDio5suJ3bBfOcYde
 dFtwi+ERC9GK59FhxCI6TcfndDYebBgp7dxg6Yj4cu8oIkJAXAkQKnESowsuYAwFpoGtAS/N7O
 Xuk=
X-SBRS: 2.7
X-MesageID: 11430778
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,329,1574139600"; d="scan'208";a="11430778"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 10:52:49 +0100
Message-ID: <20200117095251.42668-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 0/2] x86/smp: add support for APIC ALLBUT IPI
 shorthand
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

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIHNlbmRpbmcgSVBJ
cyB1c2luZyB0aGUgQUxMQlVUCnNob3J0aGFuZC4gUGF0Y2ggIzEgaXMgY29kZSBtb3ZlbWVudCB3
aGlsZSBwYXRjaCAjMiBhZGRzIHRoZSBhY3R1YWwKdXNhZ2Ugb2YgdGhlIHNob3J0aGFuZC4KClRo
YW5rcywgUm9nZXIuCgpSb2dlciBQYXUgTW9ubmUgKDIpOgogIHg4Ni9zbXA6IG1vdmUgYW5kIGNs
ZWFuIEFQSUMgaGVscGVycwogIHg4Ni9zbXA6IHVzZSBBUElDIEFMTEJVVCBkZXN0aW5hdGlvbiBz
aG9ydGhhbmQgd2hlbiBwb3NzaWJsZQoKIHhlbi9hcmNoL3g4Ni9hY3BpL2Jvb3QuYyAgfCAgIDEg
KwogeGVuL2FyY2gveDg2L21wcGFyc2UuYyAgICB8ICAgNyArKy0KIHhlbi9hcmNoL3g4Ni9zbXAu
YyAgICAgICAgfCAxMTggKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KIHhl
bi9pbmNsdWRlL2FzbS14ODYvc21wLmggfCAgIDMgKwogNCBmaWxlcyBjaGFuZ2VkLCA4MyBpbnNl
cnRpb25zKCspLCA0NiBkZWxldGlvbnMoLSkKCi0tIAoyLjI1LjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

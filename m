Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EDF5D47A
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 18:41:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiLnt-0001iU-Fw; Tue, 02 Jul 2019 16:38:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A/Ug=U7=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hiLnr-0001iG-UO
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 16:38:47 +0000
X-Inumbo-ID: db51afc2-9ce7-11e9-af06-2b7e1ed92731
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db51afc2-9ce7-11e9-af06-2b7e1ed92731;
 Tue, 02 Jul 2019 16:38:44 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xgAvHm1VHRcFWh0hnmK7qRUuntbAJMJApaJZDufPEsATWJmwNF8r4Pc126DroROHjAHTVjh1qX
 qh9oEgZd3A0O+GFQYa/CWkqgvJSOxkqz9gR2ELWBClks8c47vsfA828/KowB/v7lwBFnfhA/RJ
 uO1OFoimiWxLKydTCoHJU7jqBC1hHa1jwzeA/qNvuorzKbAH9QHQk0+mIT5wVOdKowFLMPQw/m
 XpEPne4CMJ52ylqUYs1uG3HSfuOWtND95nAbRTxsyJBay6vqPMz7N7pZszBLyuzkdo+imjx38U
 6/I=
X-SBRS: 2.7
X-MesageID: 2501598
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,443,1557201600"; 
   d="scan'208";a="2501598"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 2 Jul 2019 17:38:37 +0100
Message-ID: <20190702163840.2107-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/3] xmalloc patches
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2UgYXJlIHBhdGNoZXMgdGhhdCBzdGVtIGZyb20gZGVidWdnaW5nIHRoZSBwcm9ibGVtIHRo
YXQgbGVkIHRvIGNvbW1pdAo1NmFkNjI2NSAieDg2L21zaTogZml4IGxvb3AgdGVybWluYXRpb24g
Y29uZGl0aW9uIGluCnBjaV9tc2lfY29uZl93cml0ZV9pbnRlcmNlcHQoKSIuCgpQYXVsIER1cnJh
bnQgKDMpOgogIHhtYWxsb2M6IHN0b3AgdXNpbmcgYSBtYWdpYyAnMScgaW4gYWxpZ25tZW50IHBh
ZGRpbmcKICB4bWFsbG9jOiBkb24ndCBldmFsdWF0ZSBBRERfUkVHSU9OIHdpdGhvdXQgaG9sZGlu
ZyB0aGUgcG9vbCBsb2NrCiAgeG1hbGxvYzogYWRkIGEgS2NvbmZpZyBvcHRpb24gdG8gcG9pc29u
IGZyZWUgcG9vbCBtZW1vcnkKCiB4ZW4vS2NvbmZpZy5kZWJ1ZyAgICAgICAgIHwgIDcgKysrKysr
KwogeGVuL2NvbW1vbi94bWFsbG9jX3Rsc2YuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
Ci0tLQpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEdl
b3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IEtvbnJh
ZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4u
b3JnPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KLS0gCjIuMjAuMS4yLmdiMjFlYmI2NzEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

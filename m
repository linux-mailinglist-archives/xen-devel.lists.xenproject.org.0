Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 732D04C228
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 22:14:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdgvf-0002gk-10; Wed, 19 Jun 2019 20:11:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iLMg=US=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hdgvd-0002gc-4Q
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 20:11:33 +0000
X-Inumbo-ID: 6dd1544f-92ce-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6dd1544f-92ce-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 20:11:31 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: r9Vb/f2EHFTEOjtGKa0cJUCrEMs8mv+4NY9u54plpui+z03nWUoEeLxZJ/S7tRpaiyEIgM0/9N
 Q2ucoG+/IIqe+SAsXXyjReXF7yCTF8VeBIIicvW3XPymhFQ1m1efsJX8kTICFntqa5kJc/+t+3
 GKGOYGfp0MU36cZo2Ni2eKK1wNoiDYZgb9VWAIGWFfqQCY9r/OVKjfXN8oQTdHtRqN7RTWY8v3
 8NsSPYqeaRYM2ctnoSFwP8K1t0HNI7xtq/Q2pLXJyLj02wShv+DpuU+C8AM0V41A9I5IGhwjgD
 r5I=
X-SBRS: 2.7
X-MesageID: 1968177
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,394,1557201600"; 
   d="scan'208";a="1968177"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 19 Jun 2019 21:11:24 +0100
Message-ID: <1560975087-25632-2-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1560975087-25632-1-git-send-email-andrew.cooper3@citrix.com>
References: <1560975087-25632-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/4] xen/link: Cope with .rodata.cst* sections
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

LnJvZGF0YS5jc3QqIHNlY3Rpb25zIGFyZSB1c2VkIGZvciBtZXJnYWJsZSBjb25zdGFudCBkYXRh
LCBhbmQgdGhlIGNsYW5nL2xsdm0KOCB0b29sY2hhaW4gaGFzIGJlZW4gb2JzZXJ2ZWQgdG8gY3Jl
YXRlIC5yb2RhdGEuY3N0OCBpbiBhIGRlZmF1bHQgWGVuIGJ1aWxkLgoKVW5mb3J0dW5hdGVseSwg
dGhpcyBzZWN0aW9uIChhbmQgaXRzIC5pbml0IGNvdW50ZXJwYXJ0KSBhcmVuJ3QgY2FwdHVyZWQg
YnkKWGVuJ3MgbGlua2VyIGdsb2JzLCBhbmQgZW5kIHVwIGFzIG9ycGhhbmVkIHNlY3Rpb25zLgoK
R2VuZXJhbGlzZSB0aGUgZGF0YSBnbG9iYmluZyB0byBwaWNrIHVwIGNzdCBhbmQgZnV0dXJlIHNw
ZWNpYWwgc2VjdGlvbnMuCgpSZXBvcnRlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzog
V2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgpDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpD
QzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0v
eGVuLmxkcy5TIHwgOSArKystLS0tLS0KIHhlbi9hcmNoL3g4Ni94ZW4ubGRzLlMgfCA5ICsrKy0t
LS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMgYi94ZW4vYXJjaC9hcm0veGVuLmxk
cy5TCmluZGV4IGU2NjRjNDQuLjMxZDc0YTggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS94ZW4u
bGRzLlMKKysrIGIveGVuL2FyY2gvYXJtL3hlbi5sZHMuUwpAQCAtOTYsOCArOTYsNyBAQCBTRUNU
SU9OUwogICAgICAgIF9fc3RhcnRfc2NoZWR1bGVyc19hcnJheSA9IC47CiAgICAgICAgKiguZGF0
YS5zY2hlZHVsZXJzKQogICAgICAgIF9fZW5kX3NjaGVkdWxlcnNfYXJyYXkgPSAuOwotICAgICAg
ICooLmRhdGEucmVsKQotICAgICAgICooLmRhdGEucmVsLiopCisgICAgICAgKiguZGF0YS4qKQog
ICAgICAgIENPTlNUUlVDVE9SUwogICB9IDp0ZXh0CiAKQEAgLTE1NCw4ICsxNTMsNyBAQCBTRUNU
SU9OUwogICAuID0gQUxJR04oUEFHRV9TSVpFKTsKICAgLmluaXQuZGF0YSA6IHsKICAgICAgICAq
KC5pbml0LnJvZGF0YSkKLSAgICAgICAqKC5pbml0LnJvZGF0YS5yZWwpCi0gICAgICAgKiguaW5p
dC5yb2RhdGEuc3RyKikKKyAgICAgICAqKC5pbml0LnJvZGF0YS4qKQogCiAgICAgICAgLiA9IEFM
SUdOKFBPSU5URVJfQUxJR04pOwogICAgICAgIF9fc2V0dXBfc3RhcnQgPSAuOwpAQCAtMTc2LDgg
KzE3NCw3IEBAIFNFQ1RJT05TCiAgICAgICAgKiguYWx0aW5zdHJfcmVwbGFjZW1lbnQpCiAKICAg
ICAgICAqKC5pbml0LmRhdGEpCi0gICAgICAgKiguaW5pdC5kYXRhLnJlbCkKLSAgICAgICAqKC5p
bml0LmRhdGEucmVsLiopCisgICAgICAgKiguaW5pdC5kYXRhLiopCiAKICAgICAgICAuID0gQUxJ
R04oOCk7CiAgICAgICAgX19jdG9yc19zdGFydCA9IC47CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYveGVuLmxkcy5TIGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUwppbmRleCBjYjQyZGM4Li5lYzM3
ZDM4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TCisrKyBiL3hlbi9hcmNoL3g4
Ni94ZW4ubGRzLlMKQEAgLTIwNiw4ICsyMDYsNyBAQCBTRUNUSU9OUwogI2VuZGlmCiAKICAgICAg
ICAqKC5pbml0LnJvZGF0YSkKLSAgICAgICAqKC5pbml0LnJvZGF0YS5yZWwpCi0gICAgICAgKigu
aW5pdC5yb2RhdGEuc3RyKikKKyAgICAgICAqKC5pbml0LnJvZGF0YS4qKQogCiAgICAgICAgLiA9
IEFMSUdOKFBPSU5URVJfQUxJR04pOwogICAgICAgIF9fc2V0dXBfc3RhcnQgPSAuOwpAQCAtMjIx
LDggKzIyMCw3IEBAIFNFQ1RJT05TCiAgICAgICAgX19pbml0Y2FsbF9lbmQgPSAuOwogCiAgICAg
ICAgKiguaW5pdC5kYXRhKQotICAgICAgICooLmluaXQuZGF0YS5yZWwpCi0gICAgICAgKiguaW5p
dC5kYXRhLnJlbC4qKQorICAgICAgICooLmluaXQuZGF0YS4qKQogICAgICAgIC4gPSBBTElHTig0
KTsKICAgICAgICBfX3RyYW1wb2xpbmVfcmVsX3N0YXJ0ID0gLjsKICAgICAgICAqKC50cmFtcG9s
aW5lX3JlbCkKQEAgLTI3Miw4ICsyNzAsNyBAQCBTRUNUSU9OUwogICBERUNMX1NFQ1RJT04oLmRh
dGEpIHsKICAgICAgICAqKC5kYXRhLnBhZ2VfYWxpZ25lZCkKICAgICAgICAqKC5kYXRhKQotICAg
ICAgICooLmRhdGEucmVsKQotICAgICAgICooLmRhdGEucmVsLiopCisgICAgICAgKiguZGF0YS4q
KQogICAgICAgIENPTlNUUlVDVE9SUwogICB9IDp0ZXh0CiAKLS0gCjIuMS40CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

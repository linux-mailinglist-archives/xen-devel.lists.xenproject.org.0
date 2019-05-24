Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A9D298F7
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 15:32:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUAGk-0007dk-Va; Fri, 24 May 2019 13:29:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IEXw=TY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hUAGj-0007df-Iw
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 13:29:57 +0000
X-Inumbo-ID: 047f636a-7e28-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 047f636a-7e28-11e9-8980-bc764e045a96;
 Fri, 24 May 2019 13:29:55 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: abTgHiboO0LijqjzNUN0k/kcdz2estFlDdMSc9u8YRKFPN1DVB3BUo6fXFzamLSOLDnQIWv6OP
 JKZyC94WiStEIJd9+5ljt0/nASBr4KbVhc73rww6gLmM0rt301QGzeJCuxo7W53h+D7x094cv+
 JbhjZe3qh/D/06ECtL7PabBjIoiWCP1PL+j1a8hcGGyCsFO0vc3h7m/JJe+bHUkMlAR2nkQfi1
 SB5/Qd7c4fwrWlrI9wOcvSxZob22N2QvTVU/ntjP4IcNG6iKCUo0xnLhT3eQeLvqfOrGyCiNir
 HB8=
X-SBRS: 2.7
X-MesageID: 881362
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,507,1549947600"; 
   d="scan'208";a="881362"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 24 May 2019 14:29:46 +0100
Message-ID: <1558704586-829-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] tests/cpu-policy: Skip building on older
 versions of GCC
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R0NDIDQuNCAoYXMgaW5jbHVkZWQgaW4gQ2VudE9TIDYpIGlzIHRvbyBvbGQgdG8gaGFuZGxlIGRl
c2lnbmF0ZWQgaW5pdGlhbGlzZXJzCmluIGFub255bW91cyB1bmlvbnMuICBBcyB0aGlzIGlzIGp1
c3QgYSBkZXZlbG9wZXIgdG9vbCwgc2tpcCB0aGUgdGVzdCBpbiB0aGlzCmNhc2UsIHJhdGhlciB0
aGFuIHNhY3JhZmljaW5nIHRoZSBsZWdpYmlsaXR5L2V4cHJlc2liaWxpdHkgb2YgdGhlIHRlc3Qg
Y2FzZXMuCgpUaGlzIGZpeGVzIHRoZSBHaXRsYWIgQ0kgdGVzdHMuCgpXaGlsZSBhZGRpbmcgdGhp
cyBsb2dpYyB0byBjcHUtcG9sY3ksIGFkanVzdCB0aGUgZXF1aXZlbGVudCBsb2dpYyBmcm9tCng4
Nl9lbXVsYXRvciBvbiB3aGljaCB0aGlzIHdhcyBiYXNlZC4gIFByaW50aW5nOgoKICBUZXN0IGhh
cm5lc3Mgbm90IGJ1aWx0LCB1c2UgbmV3ZXIgY29tcGlsZXIgdGhhbiAiZ2NjIgoKaXNuJ3QgaGVs
cGZ1bCBmb3IgYW55b25lIHVuZXhwZWN0ZWRseSBlbmNvdW50ZXJpbmcgdGhlIGVycm9yLgoKU2ln
bmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0t
CkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3ZWkubGl1
MkBjaXRyaXguY29tPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
CkNDOiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT4KLS0tCiB0b29scy90ZXN0
cy9jcHUtcG9saWN5L01ha2VmaWxlICAgfCAxNCArKysrKysrKysrKysrLQogdG9vbHMvdGVzdHMv
eDg2X2VtdWxhdG9yL01ha2VmaWxlIHwgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy90ZXN0cy9jcHUtcG9s
aWN5L01ha2VmaWxlIGIvdG9vbHMvdGVzdHMvY3B1LXBvbGljeS9NYWtlZmlsZQppbmRleCBlZWVk
N2YzLi40YjZjYWVjIDEwMDY0NAotLS0gYS90b29scy90ZXN0cy9jcHUtcG9saWN5L01ha2VmaWxl
CisrKyBiL3Rvb2xzL3Rlc3RzL2NwdS1wb2xpY3kvTWFrZWZpbGUKQEAgLTEsOCArMSwyMCBAQAog
WEVOX1JPT1QgPSAkKENVUkRJUikvLi4vLi4vLi4KIGluY2x1ZGUgJChYRU5fUk9PVCkvdG9vbHMv
UnVsZXMubWsKIAorVEFSR0VULXkgOj0gdGVzdC1jcHUtcG9saWN5CisKKyMgRm9yIGJyZXZpdHks
IHRoZXNlIHRlc3RzIG1ha2UgZXh0ZW5zaXZlIHVzZSBvZiBkZXNpZ25hdGVkIGluaXRpYWxpc2Vy
cywgYnV0CisjIEdDQ3Mgb2xkZXIgdGhhbiA0LjYgY2FuJ3QgY29wZS4gIElnbm9yZSB0aGUgdGVz
dCBpbiB0aGlzIGNhc2UuCitpZm5lcSAoJChjbGFuZykseSkKK1RBUkdFVC0kKGNhbGwgY2MtdmVy
LCQoQ0MpLGx0LDB4MDQwNjAwKSA6PQorZW5kaWYKKworaWZlcSAoJChUQVJHRVQteSksKQorJCh3
YXJuaW5nIFRlc3QgaGFybmVzcyBub3QgYnVpbHQsIHVzZSBuZXdlciBjb21waWxlciB0aGFuICQo
Q0MpICQoc2hlbGwgJChDQykgLWR1bXB2ZXJzaW9uKSkKK2VuZGlmCisKIC5QSE9OWTogYWxsCi1h
bGw6IHRlc3QtY3B1LXBvbGljeQorYWxsOiAkKFRBUkdFVC15KQogCiAuUEhPTlk6IGNsZWFuCiBj
bGVhbjoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci9NYWtlZmlsZSBiL3Rv
b2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci9NYWtlZmlsZQppbmRleCA0ZjRjMGY2Li45NzBlYzNlIDEw
MDY0NAotLS0gYS90b29scy90ZXN0cy94ODZfZW11bGF0b3IvTWFrZWZpbGUKKysrIGIvdG9vbHMv
dGVzdHMveDg2X2VtdWxhdG9yL01ha2VmaWxlCkBAIC05Nyw3ICs5Nyw3IEBAICQoZm9yZWFjaCBm
bGF2b3IsJChTSU1EKSAkKEZNQSksJChldmFsICQoY2FsbCBzaW1kLWNoZWNrLWNjLCQoZmxhdm9y
KSkpKQogVEFSR0VULSQoc2hlbGwgZWNobyAnYXNtKCJ7ZXZleH0gdnplcm9hbGwiKTsnIHwgJChD
QykgLXggYyAtYyAtbyAvZGV2L251bGwgLSB8fCBlY2hvIHkpIDo9CiAKIGlmZXEgKCQoVEFSR0VU
LXkpLCkKLSQod2FybmluZyBUZXN0IGhhcm5lc3Mgbm90IGJ1aWx0LCB1c2UgbmV3ZXIgY29tcGls
ZXIgdGhhbiAiJChDQykiKQorJCh3YXJuaW5nIFRlc3QgaGFybmVzcyBub3QgYnVpbHQsIHVzZSBu
ZXdlciBjb21waWxlciB0aGFuICQoQ0MpICQoc2hlbGwgJChDQykgLWR1bXB2ZXJzaW9uKSBhbmQg
YW4gIntldmV4fSIgY2FwYWJsZSBhc3NlbWJsZXIpCiBlbmRpZgogCiBhbGw6ICQoVEFSR0VULXkp
Ci0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

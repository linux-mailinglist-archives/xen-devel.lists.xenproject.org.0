Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BD9B04C5
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 22:10:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i88s5-0003Aw-Bv; Wed, 11 Sep 2019 20:05:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L0xq=XG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i88s3-00039x-57
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 20:05:43 +0000
X-Inumbo-ID: 78f20aab-d4cf-11e9-83dd-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 78f20aab-d4cf-11e9-83dd-12813bfff9fa;
 Wed, 11 Sep 2019 20:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568232317;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8E2CVo26NPzCSTbDgXbci1/oSFuY7QM1zw5qhDruAUE=;
 b=Aogj0XCn6GCgELr5G/2SB12VZsXodnFMrln5JrZ9HDRqCEepNGtrYz/P
 C87DilaiAjf8JK/Q4pU/1PQyHkGkYGmwSj8bJy3YtyiIF/5uguNxHNrlW
 u3wEj2mz2knTJaepfl+mTEH/TexIXdjb20Ol3ZEcH0snfI+cVIn1SgERR Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: K7zLYxo1BPD917lScnLR7MrYM3b0KRTBGmUqq5fgmw4359O7N5tEZQhRR+d3VAXrp8E0WNQD+/
 HooYRBql8mIseaT/cbW9LybzPQvPwO7lnWBKvgopkg1xb3PZz2fLE9gPVyjl4NIZh92vrbeHre
 mTEduGg8cGUpaKtoiaCuavfKQs4IreFQWnXhR3rybUhV5WhAePZAJX1YWmRRzY16SXuqMuF05/
 6aJosKpuwEK92nVMf/LyLtJAL9x/63PCirpjMlajfZ4ZDjq3QvBz78W+4sAAIenZ/c9Vbf9SbS
 +4Y=
X-SBRS: 2.7
X-MesageID: 5506251
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,494,1559534400"; 
   d="scan'208";a="5506251"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 11 Sep 2019 21:04:56 +0100
Message-ID: <20190911200504.5693-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/8] x86/cpuid: Switch to using
 XEN_DOMCTL_set_cpumsr_policy
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyB0aGUgbmV4dCBwYXJ0IG9mIHRoZSBYZW4vVG9vbHN0YWNrIENQVUlEL01TUiB3b3Jr
LiAgV2l0aCBtb3N0IG9mIHRoZQpwaWVjZXMgaW4gcGxhY2UsIGltcGxlbWVudCBYRU5fRE9NQ1RM
X3NldF9jcHVtc3JfcG9saWN5IHRvIG9ic29sZXRlIHRoZQpwcm9ibGVtYXRpYyBYRU5fRE9NQ1RM
X3NldF9jcHVpZC4KCktleSBpbXByb3ZlbWVudHM6CgogIDEpIFRoZSBBUEkgc3VwcG9ydHMgY29u
ZmlndXJpbmcgc3RhdGljIE1TUiBzZXR0aW5ncyBmb3IgdGhlIGRvbWFpbiwgYQogICAgIGNhcGJp
bGl0eSB3aGljaCBYZW4gaGFzIG5ldmVyIGhhZCBiZWZvcmUuCiAgMikgVGhlIGh5cGVyY2FsbCBz
dXBwb3J0cyBzYXlpbmcgbm8gd2hlbiB0aGUgdG9vbHN0YWNrIHRyaWVzIHRvIHBhc3MKICAgICBw
cm9ibGVtYXRpYyBkYXRhLgogIDMpIFRoZSBkb21haW4gYnVpbGRlciBubyBsb25nZXIgdXNlcyBu
YXRpdmUgQ1BVSUQgaW5zdHJ1Y3Rpb25zIGZvcgogICAgIGNvbnN0cnVjdGluZyBndWVzdCBwb2xp
Y2llcywgd2hpY2ggaXMgYW5kIGhhcyBhbHdheXMgYmVlbiBlcnJvbmVvdXMKICAgICBiZWhhdmlv
dXIuCiAgNCkgVmFzdGlseSByZWR1Y2UgdGhlIG51bWJlciBvZiBoeXBlcmNhbGxzIGZvciB0eXBp
Y2FseSBndWVzdCBjb25zdHJ1Y3Rpb24sCiAgICAgYnkgbm90IGlzc3VpbmcgYSBoeXBlcmNhbGwg
cGVyIENQVUlEIGxlYWYuCgpQYXRjaCAzIGhhcyBiZWVuIHBvc3RlZCBiZWZvcmUsIGJ1dCBhIGxv
bmcgdGltZSBhZ28gYW5kIGl0IGhhcyBjaGFuZ2VkCnN1YnN0YW50aWFsbHksIHNvIEkndmUgZGVj
aWRlZCB0byBzdGFydCB0aGUgdmVyc2lvbiBudW1iZXJpbmcgZnJvbSBmcmVzaC4KClRoaXMgc2Vy
aWVzIGNhbiBiZSBmb3VuZCBpbiBnaXQgZnJvbSBmcm9tOgogIGh0dHA6Ly94ZW5iaXRzLnhlbi5v
cmcvZ2l0d2ViLz9wPXBlb3BsZS9hbmRyZXdjb29wL3hlbi5naXQ7YT1zaG9ydGxvZztoPXJlZnMv
aGVhZHMveGVuLWNwdWlkCgpBbmRyZXcgQ29vcGVyICg4KToKICBsaWJ4ODY6IEludHJvZHVjZSB4
ODZfY3B1X3BvbGljaWVzX2FyZV9jb21wYXRpYmxlKCkKICB4ODYvY3B1aWQ6IFNwbGl0IHVwZGF0
ZV9kb21haW5fY3B1aWRfaW5mbygpIGluIGhhbGYKICB4ODYvZG9tY3RsOiBJbXBsZW1lbnQgWEVO
X0RPTUNUTF9zZXRfY3B1bXNyX3BvbGljeQogIHRvb2xzL2xpYnhjOiBQcmUtY2xlYW51cCBmb3Ig
eGNfY3B1aWRfe3NldCxhcHBseV9wb2xpY3l9KCkKICB0b29scy9saWJ4YzogUmV3b3JrIHhjX2Nw
dWlkX3NldCgpIHRvIHVzZSB7Z2V0LHNldH1fY3B1X3BvbGljeSgpCiAgdG9vbHMvbGlieGM6IFJl
d29yayB4Y19jcHVpZF9hcHBseV9wb2xpY3koKSB0byB1c2Uge2dldCxzZXR9X2NwdV9wb2xpY3ko
KQogIHg4Ni9kb21jdGw6IERyb3AgWEVOX0RPTUNUTF9zZXRfY3B1aWQKICB4ODYvY3B1aWQ6IEVu
YWJsZSBDUFVJRCBGYXVsdGluZyBmb3IgdGhlIGNvbnRyb2wgZG9tYWluCgogdG9vbHMvZmxhc2sv
cG9saWN5L21vZHVsZXMvZG9tMC50ZSAgICAgICB8ICAgMiArLQogdG9vbHMvZmxhc2svcG9saWN5
L21vZHVsZXMveGVuLmlmICAgICAgICB8ICAgMiArLQogdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5j
dHJsLmggICAgICAgICAgICB8ICAgNyArLQogdG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMgICAg
ICAgICAgICAgICB8IDkzMSArKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCiB0b29scy90
ZXN0cy9jcHUtcG9saWN5L01ha2VmaWxlICAgICAgICAgIHwgICAyICstCiB0b29scy90ZXN0cy9j
cHUtcG9saWN5L3Rlc3QtY3B1LXBvbGljeS5jIHwgMTExICsrKy0KIHhlbi9hcmNoL3g4Ni9jcHUv
Y29tbW9uLmMgICAgICAgICAgICAgICAgfCAgMTkgKy0KIHhlbi9hcmNoL3g4Ni9kb21jdGwuYyAg
ICAgICAgICAgICAgICAgICAgfCAyNTggKysrKy0tLS0tCiB4ZW4vaW5jbHVkZS9wdWJsaWMvZG9t
Y3RsLmggICAgICAgICAgICAgIHwgIDI2ICstCiB4ZW4vaW5jbHVkZS94ZW4vbGliL3g4Ni9jcHUt
cG9saWN5LmggICAgIHwgIDE5ICsKIHhlbi9pbmNsdWRlL3hlbi9saWIveDg2L2NwdWlkLmggICAg
ICAgICAgfCAgMTEgKy0KIHhlbi9saWIveDg2L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAg
fCAgIDEgKwogeGVuL2xpYi94ODYvcG9saWN5LmMgICAgICAgICAgICAgICAgICAgICB8ICA1MyAr
KwogeGVuL3hzbS9mbGFzay9ob29rcy5jICAgICAgICAgICAgICAgICAgICB8ICAgNCArLQogeGVu
L3hzbS9mbGFzay9wb2xpY3kvYWNjZXNzX3ZlY3RvcnMgICAgICB8ICAgNCArLQogMTUgZmlsZXMg
Y2hhbmdlZCwgNjMyIGluc2VydGlvbnMoKyksIDgxOCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCB4ZW4vbGliL3g4Ni9wb2xpY3kuYwoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

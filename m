Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6B1B260E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 21:30:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8rEq-0006nD-TI; Fri, 13 Sep 2019 19:28:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bj/4=XI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i8rEp-0006n1-7M
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 19:28:11 +0000
X-Inumbo-ID: 9c5bdef6-d65c-11e9-95b9-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c5bdef6-d65c-11e9-95b9-12813bfff9fa;
 Fri, 13 Sep 2019 19:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568402887;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m2p8Gn1mwRPkQfMUFjV1yvWi6lU/ArxV10mfVhnKtt4=;
 b=hqGFe03Fbr926Wodv57YxZ9Ev8nRjvbsE52VXsvNHKqp4DXbOuYz+zlX
 vzJZvADgBMrrQ4wOi4sEQQQLEbGCdmZK3wJVQIsJoWQazFncN6t30oJ9x
 fal2nkxQZRefRSryNQfwvTg9OkcasZTpRwRVmrHodXWlUf2xiSe0owZTc I=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +r7UFfIaLadPzg6rTnPgaZyq30BYHCWlfB/IDddjV9YpwMH81m+UGgO8LgYraewcSU7PWb6QMA
 sm5TLcdZnOLtWMQ0913r9Y6507zUFCUyZY3f8xmGoJo3pul6QSdiCLkXuQbzZAXzWqtp/iOvhm
 Ao4GsObPvn4uFsGnaI71UK0a63iTDiVvrgmwO5RiJol3IKDuNRp3nicoog7/ocJEr/PAjyMCXE
 fi0mU7IEFwqsZdwaLjD85qx/M288gQDsZKtPzo5i+pIVERt+8OghMt8QbBrb7uI0gEa8YcgWsf
 mS0=
X-SBRS: 2.7
X-MesageID: 5553056
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,501,1559534400"; 
   d="scan'208";a="5553056"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 13 Sep 2019 20:27:49 +0100
Message-ID: <20190913192759.10795-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 00/10] x86/cpuid: Switch to using
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
aGVhZHMveGVuLWNwdWlkCgpMYXJnZSBjaGFuZ2VzIGZyb20gdjI6CiAqIFNwbGl0IHNldmVyYWwg
Y2hhbmdlcyBvdXQgaW50byBlYXJsaWVyIHBhdGNoZXMuICBSZWJhc2UgYXJvdW5kLgogKiBJbnRy
b2R1Y2UgZG9tMD1uby1jcHVpZC1mYXVsdGluZyB0byByZXN0b3JlIHByZXZpb3VzIGJlaGF2aW91
ci4KClNlZSBpbmRpdmlkdWFsIHBhdGNoZXMgZm9yIGNoYW5nZXMuCgpBbmRyZXcgQ29vcGVyICgx
MCk6CiAgeDg2L21zcjogT2ZmZXIgQ1BVSUQgRmF1bHRpbmcgdG8gUFZIIGNvbnRyb2wgZG9tYWlu
cwogIGxpYng4NjogUHJvYWN0aXZlbHkgaW5pdGlhbGlzZSBlcnJvciBwb2ludGVycwogIGxpYng4
NjogSW50cm9kdWNlIHg4Nl9jcHVfcG9saWNpZXNfYXJlX2NvbXBhdGlibGUoKQogIHg4Ni9jcHVp
ZDogU3BsaXQgdXBkYXRlX2RvbWFpbl9jcHVpZF9pbmZvKCkgaW4gaGFsZgogIHg4Ni9kb21jdGw6
IEltcGxlbWVudCBYRU5fRE9NQ1RMX3NldF9jcHVtc3JfcG9saWN5CiAgdG9vbHMvbGlieGM6IFBy
ZS1jbGVhbnVwIGZvciB4Y19jcHVpZF97c2V0LGFwcGx5X3BvbGljeX0oKQogIHRvb2xzL2xpYnhj
OiBSZXdvcmsgeGNfY3B1aWRfc2V0KCkgdG8gdXNlIHtnZXQsc2V0fV9jcHVfcG9saWN5KCkKICB0
b29scy9saWJ4YzogUmV3b3JrIHhjX2NwdWlkX2FwcGx5X3BvbGljeSgpIHRvIHVzZSB7Z2V0LHNl
dH1fY3B1X3BvbGljeSgpCiAgeDg2L2RvbWN0bDogRHJvcCBYRU5fRE9NQ1RMX3NldF9jcHVpZAog
IHg4Ni9jcHVpZDogRW5hYmxlIENQVUlEIEZhdWx0aW5nIGZvciBQViBjb250cm9sIGRvbWFpbnMg
YnkgZGVmYXVsdAoKIGRvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyAgICAgICAgfCAg
MTkgKy0KIHRvb2xzL2ZsYXNrL3BvbGljeS9tb2R1bGVzL2RvbTAudGUgICAgICAgfCAgIDIgKy0K
IHRvb2xzL2ZsYXNrL3BvbGljeS9tb2R1bGVzL3hlbi5pZiAgICAgICAgfCAgIDIgKy0KIHRvb2xz
L2xpYnhjL2luY2x1ZGUveGVuY3RybC5oICAgICAgICAgICAgfCAgIDcgKy0KIHRvb2xzL2xpYnhj
L3hjX2NwdWlkX3g4Ni5jICAgICAgICAgICAgICAgfCA5MjggKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0tLS0tLQogdG9vbHMvdGVzdHMvY3B1LXBvbGljeS9NYWtlZmlsZSAgICAgICAgICB8ICAg
MiArLQogdG9vbHMvdGVzdHMvY3B1LXBvbGljeS90ZXN0LWNwdS1wb2xpY3kuYyB8IDExNSArKyst
CiB4ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jICAgICAgICAgICAgICAgIHwgIDI5ICstCiB4ZW4v
YXJjaC94ODYvZG9tMF9idWlsZC5jICAgICAgICAgICAgICAgIHwgICAyICsKIHhlbi9hcmNoL3g4
Ni9kb21jdGwuYyAgICAgICAgICAgICAgICAgICAgfCAyNTggKysrKy0tLS0tCiB4ZW4vYXJjaC94
ODYvbXNyLmMgICAgICAgICAgICAgICAgICAgICAgIHwgICA1ICstCiB4ZW4vaW5jbHVkZS9hc20t
eDg2L3NldHVwLmggICAgICAgICAgICAgIHwgICAxICsKIHhlbi9pbmNsdWRlL3B1YmxpYy9kb21j
dGwuaCAgICAgICAgICAgICAgfCAgMjkgKy0KIHhlbi9pbmNsdWRlL3hlbi9saWIveDg2L2NwdS1w
b2xpY3kuaCAgICAgfCAgMjYgKwogeGVuL2luY2x1ZGUveGVuL2xpYi94ODYvY3B1aWQuaCAgICAg
ICAgICB8ICAxNyArLQogeGVuL2luY2x1ZGUveGVuL2xpYi94ODYvbXNyLmggICAgICAgICAgICB8
ICAgNCArLQogeGVuL2xpYi94ODYvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICB8ICAgMSAr
CiB4ZW4vbGliL3g4Ni9jcHVpZC5jICAgICAgICAgICAgICAgICAgICAgIHwgICA1ICsKIHhlbi9s
aWIveDg2L21zci5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDMgKwogeGVuL2xpYi94ODYv
cG9saWN5LmMgICAgICAgICAgICAgICAgICAgICB8ICA1NCArKwogeGVuL3hzbS9mbGFzay9ob29r
cy5jICAgICAgICAgICAgICAgICAgICB8ICAgNCArLQogeGVuL3hzbS9mbGFzay9wb2xpY3kvYWNj
ZXNzX3ZlY3RvcnMgICAgICB8ICAgNCArLQogMjIgZmlsZXMgY2hhbmdlZCwgNjkyIGluc2VydGlv
bnMoKyksIDgyNSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vbGliL3g4Ni9w
b2xpY3kuYwoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=

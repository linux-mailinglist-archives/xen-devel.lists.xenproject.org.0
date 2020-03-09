Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF6C17E5F6
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 18:47:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBMSo-0001z3-Qr; Mon, 09 Mar 2020 17:45:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EaUg=42=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jBMSm-0001yy-Sf
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 17:45:12 +0000
X-Inumbo-ID: b94fd528-622d-11ea-ac6d-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b94fd528-622d-11ea-ac6d-12813bfff9fa;
 Mon, 09 Mar 2020 17:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583775912;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bMaix+bnOr1wyGGmd6CxRotTkBGUEzK5o/QCQ0Boups=;
 b=dUgLNhcfZY8iy+F46ZFpoyddiLK7ZjBx8EpHAA+jxRsrTn5RgqzLcgPH
 bjvlQ6yY4OfIAAMyRokTFwxNcMHERHauq8RvT1J3ibkkRC1TKGp6wF+zq
 /1zHgE652Zzg46tpeWUcNbp6cWYe/fhdhJZDIAQF7RggqqMMwKwdTpwZG I=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: moxs9g1qwGTmRsDEyTAb70u/Js/NyCJgQJoIUJcjeS8Q1wTk3bkGBwHGPQxMTe5LHyMbDkFv1s
 j/clBb4CIFh3w2QA1qswGTx2AgVqX1XKMCm3q4rCsmEQ2OVXF9Qcnx0l6JW3WcAbSmoezohuZY
 tMoRHCuQrcSOYWc7JiMliFb83Zgzoeb83Sd3fftApFIa/ms6x+/ryQMX/uW3sEj9zMjzKOg1fp
 1V8iWiObsLyySElgcHFZP4QevVIeHD0woAKvOnhMaetDZFunueR7Yiiny30hQzAk5sHCuec8eY
 HbI=
X-SBRS: 2.7
X-MesageID: 13630522
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,534,1574139600"; d="scan'208";a="13630522"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 9 Mar 2020 17:45:03 +0000
Message-ID: <20200309174505.594607-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v3 0/2] xen/arm: Configure early printk via
 Kconfig
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2ggc2VyaWVzIGF2YWlsYWJsZSBpbiB0aGlzIGdpdCBicmFuY2g6Cmh0dHBzOi8veGVuYml0
cy54ZW4ub3JnL2dpdC1odHRwL3Blb3BsZS9hcGVyYXJkL3hlbi11bnN0YWJsZS5naXQgYnIuYXJt
LWVhcmx5LXByaW50ay12MwoKdjM6Ci0gbWFueSBjaGFuZ2VzIGxpc3RlZCBpbiBwYXRjaCBub3Rl
cy4KCkhpLAoKVGhhdCB0d28gcGF0Y2hzIGlzIHRvIHVuYmxvY2sgbXkgd29yayBvbiAieGVuOiBC
dWlsZCBzeXN0ZW0gaW1wcm92ZW1lbnRzIi4KVGhlcmUgaXMgYW4gZWFzaWVyIGZpeCB0byBidWls
ZCB3aXRoIGVhcmx5IHByaW50aywgYnV0IGl0IGlzIGp1c3QgYmV0dGVyIHRvIHVzZQpLY29uZmln
LgoKSXQgaXMgYmFzZSBvbiBlYXJsaWVyIHdvcmsgYnkgSnVsaWVuLCAieGVuL2FybTogQWRkIFNr
ZWxldG9uIGZvciB1c2luZwpjb25maWd1cmluZyBlYXJseSBwcmludGsgdXNpbmcgS2NvbmZpZyIu
CgpUaGUgY2hhbmdlcyB3aGljaCByZW5hbWUgYWxsIG1hY3JvcyBpcyBpbiBhIHNlcGFyYXRlZCBw
YXRjaCwgYXMgU3RlZmFubyB3YW50ZWQuCgpIb3BlIHlvdSBsaWtlIHRoZSBjaGFuZ2VzLgoKKEkg
bWlnaHQgYWRkIHRob3NlIHBhdGNoZXMgdG8gbXkgb3RoZXIgc2VyaWVzIGlmIEkgbmVlZCB0byBy
ZXNlbnQgaXQgYmVmb3JlIHRoZQplYXJseSBwcmludGsgY2hhbmdlcyBhcmUgYXBwbGllZC4pCgpD
aGVlcnMsCgpBbnRob255IFBFUkFSRCAoMik6CiAgeGVuL2FybTogUmVuYW1lIGFsbCBlYXJseSBw
cmludGsgbWFjcm8KICB4ZW4vYXJtOiBDb25maWd1cmUgZWFybHkgcHJpbnRrIHZpYSBLY29uZmln
CgogZG9jcy9taXNjL2FybS9lYXJseS1wcmludGsudHh0ICAgICB8ICA3MSArKystLS0tCiB4ZW4v
S2NvbmZpZy5kZWJ1ZyAgICAgICAgICAgICAgICAgIHwgICAyICsKIHhlbi9hcmNoL2FybS9LY29u
ZmlnLmRlYnVnICAgICAgICAgfCAyODcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHhl
bi9hcmNoL2FybS9NYWtlZmlsZSAgICAgICAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL2FybS9S
dWxlcy5tayAgICAgICAgICAgICAgfCAgNzQgKy0tLS0tLS0KIHhlbi9hcmNoL2FybS9hcm0zMi9N
YWtlZmlsZSAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL2FybS9hcm0zMi9kZWJ1Zy04MjUwLmlu
YyAgfCAgIDIgKy0KIHhlbi9hcmNoL2FybS9hcm0zMi9kZWJ1Zy1wbDAxMS5pbmMgfCAgIDQgKy0K
IHhlbi9hcmNoL2FybS9hcm0zMi9kZWJ1Zy1zY2lmLmluYyAgfCAgIDQgKy0KIHhlbi9hcmNoL2Fy
bS9hcm0zMi9kZWJ1Zy5TICAgICAgICAgfCAgIDQgKy0KIHhlbi9hcmNoL2FybS9hcm0zMi9oZWFk
LlMgICAgICAgICAgfCAgMTAgKy0KIHhlbi9hcmNoL2FybS9hcm02NC9NYWtlZmlsZSAgICAgICAg
fCAgIDIgKy0KIHhlbi9hcmNoL2FybS9hcm02NC9kZWJ1Zy04MjUwLmluYyAgfCAgIDQgKy0KIHhl
bi9hcmNoL2FybS9hcm02NC9kZWJ1Zy1wbDAxMS5pbmMgfCAgIDQgKy0KIHhlbi9hcmNoL2FybS9h
cm02NC9kZWJ1Zy5TICAgICAgICAgfCAgIDQgKy0KIHhlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMg
ICAgICAgICAgfCAgMTAgKy0KIHhlbi9hcmNoL3g4Ni9LY29uZmlnLmRlYnVnICAgICAgICAgfCAg
IDAKIHhlbi9pbmNsdWRlL2FzbS1hcm0vZWFybHlfcHJpbnRrLmggfCAgIDIgKy0KIDE4IGZpbGVz
IGNoYW5nZWQsIDM0MSBpbnNlcnRpb25zKCspLCAxNDcgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgeGVuL2FyY2gvYXJtL0tjb25maWcuZGVidWcKIGNyZWF0ZSBtb2RlIDEwMDY0NCB4
ZW4vYXJjaC94ODYvS2NvbmZpZy5kZWJ1ZwoKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

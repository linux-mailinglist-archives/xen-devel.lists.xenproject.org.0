Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DC514CA90
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 13:14:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwmD3-0007nR-Ro; Wed, 29 Jan 2020 12:12:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wV5r=3S=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iwmD1-0007nH-P2
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 12:12:39 +0000
X-Inumbo-ID: a401681a-4290-11ea-889f-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a401681a-4290-11ea-889f-12813bfff9fa;
 Wed, 29 Jan 2020 12:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580299958;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zyHpr9ix2npi7qtArGsWGAY5zv7ddkC01dZ6h/pkUzU=;
 b=fzZLC1S48TC6CZhoVIg9rXPhrSkGI++w9HU+L2LklDPg8eYlTTUUFuCG
 tN5rAWW8HNrSkHwbddlom9t3XZ/N9lo+TikbNGF+9iMp+mckO9Uj9keH7
 ujTAvcBHdLQ/VsX5LxuN3SSgVho7s0sd3JA0kmoEzDIIEcAb6j60ZAGXS I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6XQbXrOY+iulNnZGQfoTxZyXaO0O5/8aXf3WQddjrTWjNlJo0WMg2NkraqTcqN+YPKnOgS3nNn
 wN4ngMe7Q78rpXTC4ECasU4bhL+w3AwyxHXvu271/pexFhEm8PAzdeVmAji7toNeaXDJQ+Ujvl
 AaFoQOBLBgaODClPh+2uyfhoBH3z7e7hXN8ymdW4Jcu9BNhH39oviaRZIiYidJDLSz44QkQ1S/
 riiQoGUab29AphMa1Ec3FlSRlNQHv1iFGpxHpKRdbe5Z3Jv88drTmi4HqU+R5p1K6kjrObheWT
 UT0=
X-SBRS: 2.7
X-MesageID: 11979656
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,377,1574139600"; d="scan'208";a="11979656"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Wed, 29 Jan 2020 12:12:30 +0000
Message-ID: <20200129121235.1814563-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/5] OvmfXen: Set PcdFSBClock at runtime
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
Cc: Bob Feng <bob.c.feng@intel.com>, Julien Grall <julien@xen.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Liming
 Gao <liming.gao@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Michael D Kinney <michael.d.kinney@intel.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2ggc2VyaWVzIGF2YWlsYWJsZSBpbiB0aGlzIGdpdCBicmFuY2g6CmdpdDovL3hlbmJpdHMu
eGVuLm9yZy9wZW9wbGUvYXBlcmFyZC9vdm1mLmdpdCBici5hcGljLXRpbWVyLWZyZXEtdjEKCkhp
LAoKT3ZtZlhlbiB1c2VzIHRoZSBBUElDIHRpbWVyLCBidXQgd2l0aCBhbiBoYXJkLWNvZGVkIGZy
ZXF1ZW5jeSB0aGF0IG1heSBjaGFuZ2UKYXMgcG9pbnRlZCBvdXQgaGVyZToKICBodHRwczovL2Vk
azIuZ3JvdXBzLmlvL2cvZGV2ZWwvbWVzc2FnZS80NTE4NQogIDwyMDE5MDgwODEzNDQyMy55YnFn
M3FrcHc1dWNmems0QEFpci1kZS1Sb2dlcj4KClRoaXMgc2VyaWVzIGNoYW5nZXMgdGhhdCBzbyB0
aGUgZnJlcXVlbmN5IGlzIGNhbGN1bGF0ZWQgYXQgcnVudGltZS4KClJlZjogaHR0cHM6Ly9idWd6
aWxsYS50aWFub2NvcmUub3JnL3Nob3dfYnVnLmNnaT9pZD0yNDkwCgpUaGVyZSBpcyBhbHNvIG9u
ZSBjbGVhbnVwIHBhdGNoIHRoYXQgaGFzIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgcmVzdC4KCkNo
ZWVycywKCkFudGhvbnkgUEVSQVJEICg1KToKICBPdm1mUGtnL1hlblJlc2V0VmVjdG9yOiBTaWxl
bnQgYSB3YXJuaW5nIGZyb20gbmFzbQogIE1kZVBrZzogQWxsb3cgUGNkRlNCQ2xvY2sgdG8gYnkg
RHluYW1pYwogIE92bWZQa2cvSW5kdXN0cnlTdGFuZGFyZC9YZW46IEFwcGx5IEVESzIgY29kaW5n
IHN0eWxlIHRvCiAgICBYRU5fVkNQVV9USU1FX0lORk8KICBPdm1mUGtnL1hlblBsYXRmb3JtUGVp
OiBDYWxpYnJhdGUgQVBJQyB0aW1lciBmcmVxdWVuY3kKICBPdm1mUGtnL092bWZYZW46IFNldCBQ
Y2RGU0JDbG9jawoKIE1kZVBrZy9NZGVQa2cuZGVjICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgOCArLQogT3ZtZlBrZy9Pdm1mWGVuLmRzYyAgICAgICAgICAgICAgICAgICAgICAgIHwgICA0
ICstCiBPdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlblBsYXRmb3JtUGVpLmluZiAgfCAgIDIgKwog
T3ZtZlBrZy9JbmNsdWRlL0luZHVzdHJ5U3RhbmRhcmQvWGVuL3hlbi5oIHwgIDE3ICstLQogT3Zt
ZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5oICAgICAgICAgIHwgICA1ICsKIE92bWZQa2cv
WGVuUGxhdGZvcm1QZWkvUGxhdGZvcm0uYyAgICAgICAgICB8ICAgMSArCiBPdm1mUGtnL1hlblBs
YXRmb3JtUGVpL1hlbi5jICAgICAgICAgICAgICAgfCAxMjcgKysrKysrKysrKysrKysrKysrKysr
CiBPdm1mUGtnL1hlblJlc2V0VmVjdG9yL0lhMzIvWGVuUFZITWFpbi5hc20gfCAgIDIgKy0KIDgg
ZmlsZXMgY2hhbmdlZCwgMTUwIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKLS0gCkFu
dGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

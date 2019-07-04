Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6D65FA7A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 17:01:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj3By-0006TM-70; Thu, 04 Jul 2019 14:58:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8gU+=VB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hj3Bx-0006SF-3U
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:58:33 +0000
X-Inumbo-ID: 303c52d6-9e6c-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 303c52d6-9e6c-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 14:58:31 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: m8SnQzOlJjzcWQzrDyDl51u/gDADUzG4na/OVqaoD6XeoTZUzUudh39NVqmjA8KSaomIQeKuKk
 OTouPsQUsHbH+NADcfxVHE0zfN8pYpiiN0T+oM8ziM4OaSJ69vZg7ly0w9m7Wfvevg7VTsMbn6
 LlSgXI+SRZqjv+6OtENES2w78ekoiYCplpCkg9K6BIp1wbfZM+iHnIY/fwRIGZlDL+xpGHBGk8
 mnVVPNWYjqhQX3cvMGVGjjfoA/vLop8v/MXIXtM2HLUCvZ0wYex8fxWVdWFfFRCexyunpwAsk/
 KFI=
X-SBRS: 2.7
X-MesageID: 2626071
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2626071"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Thu, 4 Jul 2019 15:42:17 +0100
Message-ID: <20190704144233.27968-20-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704144233.27968-1-anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 19/35] OvmfPkg/XenPlatformPei: Reserve
 hvmloader's memory only when it has run
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVzZXJ2ZSBodm1sb2FkZXIncyBtZW1vcnkgb25seSB3aGVuIGl0IGhhcyBydW4uCgpSZWY6IGh0
dHBzOi8vYnVnemlsbGEudGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTY4OQpTaWduZWQt
b2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KQWNrZWQt
Ynk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+Ci0tLQoKTm90ZXM6CiAgICB2MzoK
ICAgIC0gZml4IGVtcHR5IGNvbW1pdCBtZXNzYWdlIGJvZHkKCiBPdm1mUGtnL1hlblBsYXRmb3Jt
UGVpL1hlbi5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYyBiL092
bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMKaW5kZXggYTkwYmU3YmJlYi4uMzdlOWNmZjRiNCAx
MDA2NDQKLS0tIGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYworKysgYi9Pdm1mUGtnL1hl
blBsYXRmb3JtUGVpL1hlbi5jCkBAIC0yNzIsNyArMjcyLDkgQEAgSW5pdGlhbGl6ZVhlbiAoCiAg
IC8vIFJlc2VydmUgYXdheSBIVk1MT0FERVIgcmVzZXJ2ZWQgbWVtb3J5IFsweEZDMDAwMDAwLDB4
RkQwMDAwMDApLg0KICAgLy8gVGhpcyBuZWVkcyB0byBtYXRjaCBIVk1MT0FERVIgUkVTRVJWRURf
TUVNQkFTRS9SRVNFUlZFRF9NRU1TSVpFLg0KICAgLy8NCi0gIEFkZFJlc2VydmVkTWVtb3J5QmFz
ZVNpemVIb2IgKDB4RkMwMDAwMDAsIDB4MTAwMDAwMCwgRkFMU0UpOw0KKyAgaWYgKFhlbkh2bWxv
YWRlckRldGVjdGVkICgpKSB7DQorICAgIEFkZFJlc2VydmVkTWVtb3J5QmFzZVNpemVIb2IgKDB4
RkMwMDAwMDAsIDB4MTAwMDAwMCwgRkFMU0UpOw0KKyAgfQ0KIA0KICAgUGNkU3RhdHVzID0gUGNk
U2V0Qm9vbFMgKFBjZFBjaURpc2FibGVCdXNFbnVtZXJhdGlvbiwgVFJVRSk7DQogICBBU1NFUlRf
UkVUVVJOX0VSUk9SIChQY2RTdGF0dXMpOw0KLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

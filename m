Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 648199E70E
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 13:53:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2ZxL-0003w6-Ob; Tue, 27 Aug 2019 11:48:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/NSa=WX=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1i2ZxK-0003w1-7a
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 11:48:10 +0000
X-Inumbo-ID: 8a27a0ca-c8c0-11e9-8980-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a27a0ca-c8c0-11e9-8980-bc764e2007e4;
 Tue, 27 Aug 2019 11:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566906489;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=xQF4Doh6NDJnOkoiuhHA2YLyEFMGdmf6f9naygQWoo0=;
 b=cp59d4wWPUk8R/V0enqv2VFm/U/k4kMYzrStefzi3WGB5FeDLht1AJ7o
 fUIZqFYv36swnHNgmvSl5XxmwHRo+LKDTmHtt737sudy+iNf4MAtcT5sc
 5M4zWPrffzubokZ7d5vjf4AWgWkTbRu2Mj+jbnuQwLCxUotJT4ghl7zPZ U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KU0xJV+McsfTR8m5cY3NdW7gnLpK5CX31cJauLxbsQBuS0LeP7LsyJRXK6YJLklPA9ZUMkRP7u
 qn5mIKxbGpBlArfo9V7aiRo0LpsLSl5Nkvib1M7kmb4/5ffOjWvTSGrr2A/WVP8yV8ImWzt74Q
 ELJznKhnYzG4fzKXoW6KetF7EkJW1bNEwCLnvPy7EBwEaqOLhefGjZ1MLWetcTDyWIdrN6782q
 sdnfH2JLLYFUElkQUlWssJ7x2NgDmmM105H74nguGgNmUOafotGCzDBN0Ad+86KhrzRYFJqLAY
 dzw=
X-SBRS: 2.7
X-MesageID: 4944202
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,437,1559534400"; 
   d="scan'208";a="4944202"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 27 Aug 2019 12:48:05 +0100
Message-ID: <1566906485-13731-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/mm: correctly initialize M2P entries on boot
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

U2luY2UgZ3Vlc3QgcmVzb3VyY2UgbWFuYWdlbWVudCB3b3JrIGl0J3Mgbm93IHBvc3NpYmxlIHRv
IGhhdmUgYSBwYWdlCmFzc2lnbmVkIHRvIGEgZG9tYWluIHdpdGhvdXQgYSB2YWxpZCBNMlAgZW50
cnkuIFNvbWUgcGF0aGVzIGluIHRoZSBjb2RlCnJlbHkgb24gdGhlIGZhY3QgYSBHRk4gcmV0dXJu
ZWQgZnJvbSBtZm5fdG9fZ2ZuKCkgZm9yIHN1Y2ggYSBwYWdlCmlzIG5vdCB2YWxpZCBhcyB3ZWxs
LCBpLmUuIHNlZSBhcmNoX2lvbW11X3BvcHVsYXRlX3BhZ2VfdGFibGUoKS4KCkZvciBzeXN0ZW1z
IHdpdGhvdXQgNTEyR0IgY29udGlndW91cyBSQU0gTTJQIGVudHJpZXMgd2VyZSBhbHJlYWR5CmNv
cnJlY3RseSBpbml0aWFsaXplZCBvbiBib290IHdpdGggSU5WQUxJRF9NMlBfRU5UUlkgKH4wVUwp
IGJ1dApvbiBzeXN0ZW1zIHdoZXJlIE0yUCBjb3VsZCBiZSBjb3ZlcmVkIGJ5IGEgc2luZ2xlIDFH
QiBwYWdlIGRpcmVjdG9yeQoweDc3IHBvaXNvbiB3YXMgdXNlZCBpbnN0ZWFkLiBUaGF0IGV2ZW50
dWFsbHkgcmVzdWx0ZWQgaW4gYSBjcmFzaApkdXJpbmcgSU9NTVUgY29uc3RydWN0aW9uIG9uIHN5
c3RlbXMgd2l0aG91dCBzaGFyZWQgUFRzIGVuYWJsZWQuCgpXaGlsZSBoZXJlIGZpeHVwIGNvbXBh
dCBNMlAgZW50cmllcyBhcyB3ZWxsLgoKU2lnbmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGln
b3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIHwg
NiArKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIGIveGVuL2FyY2gveDg2L3g4
Nl82NC9tbS5jCmluZGV4IDE5MTljYWUuLmE3NDFkNGUgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni94ODZfNjQvbW0uYworKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMKQEAgLTU3NCw4ICs1
NzQsOSBAQCB2b2lkIF9faW5pdCBwYWdpbmdfaW5pdCh2b2lkKQogICAgICAgICAgICAgICAgICAg
ICBwYWdlX3RvX21mbihsMV9wZyksCiAgICAgICAgICAgICAgICAgICAgIDFVTCA8PCAoMiAqIFBB
R0VUQUJMRV9PUkRFUiksCiAgICAgICAgICAgICAgICAgICAgIFBBR0VfSFlQRVJWSVNPUik7Cisg
ICAgICAgICAgICAgICAgLyogRmlsbCB3aXRoIElOVkFMSURfTTJQX0VOVFJZLiAqLwogICAgICAg
ICAgICAgICAgIG1lbXNldCgodm9pZCAqKShSRFdSX01QVF9WSVJUX1NUQVJUICsgKGkgPDwgTDJf
UEFHRVRBQkxFX1NISUZUKSksCi0gICAgICAgICAgICAgICAgICAgICAgIDB4NzcsIDFVTCA8PCBM
M19QQUdFVEFCTEVfU0hJRlQpOworICAgICAgICAgICAgICAgICAgICAgICAweEZGLCAxVUwgPDwg
TDNfUEFHRVRBQkxFX1NISUZUKTsKIAogICAgICAgICAgICAgICAgIEFTU0VSVCghbDJfdGFibGVf
b2Zmc2V0KHZhKSk7CiAgICAgICAgICAgICAgICAgLyogTkIuIENhbm5vdCBiZSBHTE9CQUw6IGd1
ZXN0IHVzZXIgbW9kZSBzaG91bGQgbm90IHNlZSBpdC4gKi8KQEAgLTY2Niw5ICs2NjcsMTAgQEAg
dm9pZCBfX2luaXQgcGFnaW5nX2luaXQodm9pZCkKICAgICAgICAgICAgIHBhZ2VfdG9fbWZuKGwx
X3BnKSwKICAgICAgICAgICAgIDFVTCA8PCBQQUdFVEFCTEVfT1JERVIsCiAgICAgICAgICAgICBQ
QUdFX0hZUEVSVklTT1IpOworICAgICAgICAvKiBGaWxsIHdpdGggSU5WQUxJRF9NMlBfRU5UUlku
ICovCiAgICAgICAgIG1lbXNldCgodm9pZCAqKShSRFdSX0NPTVBBVF9NUFRfVklSVF9TVEFSVCAr
CiAgICAgICAgICAgICAgICAgICAgICAgICAoaSA8PCBMMl9QQUdFVEFCTEVfU0hJRlQpKSwKLSAg
ICAgICAgICAgICAgIDB4NTUsCisgICAgICAgICAgICAgICAweEZGLAogICAgICAgICAgICAgICAg
MVVMIDw8IEwyX1BBR0VUQUJMRV9TSElGVCk7CiAgICAgICAgIC8qIE5CLiBDYW5ub3QgYmUgR0xP
QkFMIGFzIHRoZSBwdGVzIGdldCBjb3BpZWQgaW50byBwZXItVk0gc3BhY2UuICovCiAgICAgICAg
IGwyZV93cml0ZShsMl9yb19tcHQsIGwyZV9mcm9tX3BhZ2UobDFfcGcsIF9QQUdFX1BTRXxfUEFH
RV9QUkVTRU5UKSk7Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=

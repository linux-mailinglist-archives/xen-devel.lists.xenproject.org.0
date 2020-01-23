Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97891147079
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 19:08:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iugsN-0008GQ-0v; Thu, 23 Jan 2020 18:06:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AKOf=3M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iugsL-0008GL-4Z
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 18:06:41 +0000
X-Inumbo-ID: 1a8c2324-3e0b-11ea-bea0-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a8c2324-3e0b-11ea-bea0-12813bfff9fa;
 Thu, 23 Jan 2020 18:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579802800;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N4vrgOp16DFTjx1W/REey+pKd/MY+lT5Sipeao96kDQ=;
 b=UQM5VEaVLudHSZOCSanQrvuv8R4dQZY5zFI09GPdarjL6H0hRSDwFCaa
 4lt9LwKytzJOfXGH/Y+DzXAaKjpgAgtL9CEihvQxSls5RJnXuuFqf2qpk
 I9BivhzdOKEhxQU6aKAPsU/IIYxsOq2JnFdH5mHbtYXl+LWUAG5K02Hah c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BX3mD7zqJZq+8UJAOcHTBxMaYfgl8TgppyOLItVHel5wuEevFptgA6NuPGr0SvttjVRXs2l2JM
 5j2ZrZeNCcxd0Mk4MdjGKbvJq37qW192ckFr7IZsNCdxAwoE1+WVGYG7wXcOtLbZcJOlaIiVo/
 LoDfHG2XkaGuPmc6wYmIEH0nQ7/VcteTOlrdG3KNZpeB0P7H1yIVdHijjJgyoKBKYmRrKnNDaC
 Lkld+NHa8t8Hhv6J2FFhAfxpKfl4r85o6Mh3tpMKDMDB4lNDcZ0A4A3LLLQrtrYX1VsoyGrWZU
 Xm4=
X-SBRS: 2.7
X-MesageID: 11783235
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,354,1574139600"; d="scan'208";a="11783235"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 23 Jan 2020 19:06:13 +0100
Message-ID: <20200123180615.69370-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/2] x86/apic: improvements to
 disconnect_bsp_APIC
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
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpUaGUgc2VyaWVzIGNvbnRhaW4gc29tZSBpbXByb3ZlbWVudHMgdG8gZGlzY29ubmVj
dF9ic3BfQVBJQywgd2hpY2gKc3RhcnRlZCBhcyBhIHdheSB0byBmaXggdGhlICJBUElDIGVycm9y
IG9uIENQVTA6IDQwKDAwKSIgZXJyb3IgcHJpbnRlZApieSBzb21lIEludGVsIGJveGVzIG9uIHJl
Ym9vdCBvciBzaHV0ZG93bi4gRmlyc3QgcGF0Y2ggaXMgdGhlIGZpeCBmb3IKdGhlIGVycm9yLCBz
ZWNvbmQgcGF0Y2ggaXMgYSBjbGVhbnVwLgoKUm9nZXIgUGF1IE1vbm5lICgyKToKICB4ODYvYXBp
YzogZml4IGRpc2FibGluZyBMVlQwIGluIGRpc2Nvbm5lY3RfYnNwX0FQSUMKICB4ODYvYXBpYzog
c2ltcGxpZnkgZGlzY29ubmVjdF9ic3BfQVBJQyBzZXR1cCBvZiBMVlR7MC8xfQoKIHhlbi9hcmNo
L3g4Ni9hcGljLmMgfCAyMSArKysrLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKLS0gCjIuMjUuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

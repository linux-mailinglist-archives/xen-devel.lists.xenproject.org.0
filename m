Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ABC12822A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 19:25:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiMvN-00055c-Kb; Fri, 20 Dec 2019 18:22:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ryrQ=2K=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iiMvL-00055X-Rx
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 18:22:51 +0000
X-Inumbo-ID: b65b7abe-2355-11ea-a914-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b65b7abe-2355-11ea-a914-bc764e2007e4;
 Fri, 20 Dec 2019 18:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576866163;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=uyMkEQSFOGHEyJs8xWK0Kdwm+kPXmYNdhjt0E1FwXps=;
 b=KLVQvgWDvxcPM73oSvO8Q6ADBKcv2loqZRTaFLt3HFaLvWVK4DixqgoC
 TC8yGk7XATGo6lP9aOW9wzeuypyaGAoKE/lsNF/Bk0toWp5lJJLqjIjXr
 vQqPeTB/W1sePOa+ezpB8rwvPBJxVHROwvCU/HnW/IuBlie0ZDb7jYcEI 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 22HAJRIXyooKbtIh9b8ofNPlHPZtGz/rnRh7o6g7dAfX3RbUn5doDLDl3QO+FSoM/ZXxFfxqEh
 xiUByfKUSdDmBV7lH325m2zXrY8wNuvnud55Au0ozgVvIZuecc/2X4zs1uN+7pb3k9ipuO3Yb/
 xNcWCmmAbhkFNYnCMBmYJ9MWODpRi29yKwsBKeqmAPyx+W/PUq5G+F5zTH22pd+MCuVGoEoeCH
 m9EFn2E+4QmUNu1u967H4e+0+o3h8qltXtrE6sRpxsKIAwMNjjA1F45PZ0Q/gk2HnUw5x6kS7A
 xd8=
X-SBRS: 2.7
X-MesageID: 10371407
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,336,1571716800"; d="scan'208";a="10371407"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24061.4463.693713.311441@mariner.uk.xensource.com>
Date: Fri, 20 Dec 2019 18:22:39 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20191220172310.27231-1-andrew.cooper3@citrix.com>
References: <20191220172310.27231-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] [PATCH] libxc/restore: Don't duplicate state in
 process_vcpu_basic()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0hdIGxpYnhjL3Jlc3RvcmU6IERvbid0IGR1cGxp
Y2F0ZSBzdGF0ZSBpbiBwcm9jZXNzX3ZjcHVfYmFzaWMoKSIpOgo+IHZjcHVfZ3Vlc3RfY29udGV4
dF9hbnlfdCBpcyBjdXJyZW50bHkgYWxsb2NhdGVkIG9uIHRoZSBzdGFjaywgYW5kIGNvcGllZCBm
cm9tCj4gYSBtdXRhYmxlIGJ1ZmZlciB3aGljaCBpcyBmcmVlZCBpbW1lZGlhdGVseSBhZnRlciBp
dHMgdXNlIGhlcmUuCj4gCj4gTXV0YXRlIHRoZSBidWZmZXIgaW4gcGxhY2UgaW5zdGVhZCBvZiBk
dXBsaWNhdGluZyBpdC4KCkl0IGlzIG5vdCBvYnZpb3VzIHRvIG1lIHRoYXQgbm90aGluZyB1c2Vz
IHRoZSBtb2RpZmllZCBmaWVsZHMgYWZ0ZXIKcHJvY2Vzc192Y3B1X2Jhc2ljIGhhcyBlZGl0ZWQg
dGhpbmdzLiAgVGhlIGN0eCBvZiB3aGljaCB0aGUgdmNwdSBpcwpwYXJ0IGlzIHBhc3NlZCB0byBw
cm9jZXNzX3ZjcHVfPHZhcmlvdXM+IGJ5IHVwZGF0ZV92Y3B1X2NvbnRleHQuCgpXaHkgZG8geW91
IHRoaW5rIHRoaXMgY29weWluZyAod2hpY2ggaXMgZXh0cmEgY29kZSkgd2FzIGludHJvZHVjZWQg
PwoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

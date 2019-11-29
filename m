Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF1210D7A1
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 16:08:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iahow-0006UE-8X; Fri, 29 Nov 2019 15:04:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1wlA=ZV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iahou-0006Tn-RK
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 15:04:32 +0000
X-Inumbo-ID: 8666937d-12b9-11ea-a3e7-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8666937d-12b9-11ea-a3e7-12813bfff9fa;
 Fri, 29 Nov 2019 15:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575039862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=U53hkrkMCIBAzQ+z/bQXn01u1g5CfgcH4Ch1RtgKUFE=;
 b=XV4b1lpGDEK2C+Q/N5BG9thIJ5esMFt0qr8KypNsJdoS+2a6d3JmqCYv
 7X923VNdwQNw6j9vodSNW+Q25Zm9ZtDLXZw9Fd1VFcNDMrWW0mzNl6GZu
 bCuwYigYU9c8KpZqyKupEoyj2hLpyHv7e3Ogy479Qd2aNg12heSsQc2Cs w=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: C3xzN6YK0zXzLcKQ2/sCb8aA7TOph7cMT+2glofQef8KuXg4m7pMmpHD0ji8eyu3j5XYBJVd2d
 cttUIjZDldC5Ld8DhyhCD5nu0NzpEcx3xbtZ/zJvZBTPWlxZRiP8Pt47I7pPfnNVViuK6S1C/0
 PlBhZpzfy55swpSGVCvxtSLqWjEn+jXNSf9CU34U8kKP4fwF3SBBpqCxorqNBNoU0gLsaoOg09
 q0NfE8r44cetBIm39s+OeK31vHH8LrsSOIxnQiw/4rJxD5eVM5+JEcv4QoHSEgf1pISMz74BjI
 l50=
X-SBRS: 2.7
X-MesageID: 8984083
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="8984083"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 29 Nov 2019 15:04:14 +0000
Message-ID: <20191129150416.4944-8-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191129150416.4944-1-ian.jackson@eu.citrix.com>
References: <20191129150416.4944-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 7/9] docs/process: Mention .Z-pre versions
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogZG9jcy9wcm9jZXNzL3JlbGVhc2UtdGVjaG5pY2lhbi1jaGVja2xpc3QudHh0IHwgMiArKwog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RvY3MvcHJvY2Vz
cy9yZWxlYXNlLXRlY2huaWNpYW4tY2hlY2tsaXN0LnR4dCBiL2RvY3MvcHJvY2Vzcy9yZWxlYXNl
LXRlY2huaWNpYW4tY2hlY2tsaXN0LnR4dAppbmRleCA3MmE0YzM2Y2Q2Li41YmNlNWJhNjNkIDEw
MDY0NAotLS0gYS9kb2NzL3Byb2Nlc3MvcmVsZWFzZS10ZWNobmljaWFuLWNoZWNrbGlzdC50eHQK
KysrIGIvZG9jcy9wcm9jZXNzL3JlbGVhc2UtdGVjaG5pY2lhbi1jaGVja2xpc3QudHh0CkBAIC02
NCw2ICs2NCw3IEBAIHQ9UkVMRUFTRS0kcgogIyAgICAgIGAtdW5zdGFibGUkKFhFTl9WRU5ET1JW
RVJTSU9OKScgICB1bnN0YWJsZSBha2EgdW5mcm96ZW4gc3RhZ2luZyAob3IgdW5zdGFibGUgYnJh
bmNoLCBhZnRlciBicmFuY2hpbmcpCiAjICAgICAgYC4wJChYRU5fVkVORE9SVkVSU0lPTiknICAg
ICAgICAgIGFjdHVhbCByZWxlYXNlIG9mIFhlbiBYLlkuMCAoYWthIGZpcnN0IGFjdHVhbCByZWxl
YXNlIG9mIFhlbiBYLlkpCiAjICAgICAgYC5aJChYRU5fVkVORE9SVkVSU0lPTiknICAgICAgICAg
IGFjdHVhbCByZWxlYXNlIG9mIFhlbiBYLlkuWiAoc3RhYmxlIHBvaW50IHJlYWxhc2UpCisjICAg
ICAgYC5aLXByZSQoWEVOX1ZFTkRPUlZFUlNJT04pJyAgICAgIHN0YWJsZSBicmFuY2gsIGFmdGVy
IHJlbGVhc2Ugb2YgWi0xCiAjCiAjICAgIC0gdHVybiBvZmYgZGVidWcgb24gc3RhYmxlIGJyYW5j
aGVzLCBpZiBub3QgYWxyZWFkeSBkb25lCiAjICAgICAgICAgICAtIHRvb2xzL1J1bGVzLm1rCkBA
IC0xNDUsNiArMTQ2LDcgQEAgUkVMRUFTRSBUQVJCQUxMCiAJIyAgIFUgb3NzLXhlbi9yZWxlYXNl
LzQuOC4wLXJjMi94ZW4tNC44LjAtcmMyLnRhci5negogCSMgICBVIG9zcy14ZW4vcmVsZWFzZS80
LjguMC1yYzIveGVuLTQuOC4wLXJjMi50YXIuZ3ouc2lnCiAKK0FmdGVyIGEgLjAgcmVsZWFzZSwg
dXBkYXRlIFhFTl9FWFRSQVZFUlNJT04gYWdhaW4gKHRvIC4xLXByZSwgc2VlIGFib3ZlKS4KIAog
dXBkYXRlIHhlbmJpdHMgZnJvbnQgcGFnZSB0byBjaGFuZ2UgcmVmZXJlbmNlcyB0byBvbGQgc3Rh
YmxlIGJyYW5jaAogIGludG8gcmVmZXJlbmNlcyB0byBuZXcgc3RhYmxlIGJyYW5jaAotLSAKMi4x
MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

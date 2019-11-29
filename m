Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4562410D7A2
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 16:08:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iahom-0006M8-7R; Fri, 29 Nov 2019 15:04:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1wlA=ZV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iahok-0006M2-Ry
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 15:04:22 +0000
X-Inumbo-ID: 85e0e196-12b9-11ea-a3e7-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85e0e196-12b9-11ea-a3e7-12813bfff9fa;
 Fri, 29 Nov 2019 15:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575039862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Xf5PnhK0dQMyPoOjs9G39K3GpXSBEiMjtb4n8jPxaOc=;
 b=f7etb/x1BWpQVJWb08R9vYv6knL8aHebfdnXsO4dCu+UxAuIueFdXgPJ
 wmFtfJQz1qOCvZCoZF+E3SNWMv6NR8ZEGRMNjXqMoSn7P9nq2wpCPJUsw
 iJjP1H5LSdNxWzrbIDajK04+EPV11w77dxbkC1Wgx+sNDZAQIFhoI6qpx 0=;
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
IronPort-SDR: 1u0k4COhucIQDKl6BA0HM8vCsPuMc3kQnFlxSPglZW2AKEr7L0T0EqbodYXuflSYTe7uAFBnmj
 WC+QA+cEwsJB8dK9sufZk/0IrwKG66sn+7cABsrGSy4YaV8sy18oyexAQ+yi3gFbSB+p0ywZf0
 Y69Z7Hv/Y8mEYzy7VPtQBuNLBmUCc327Hi/W9YbWj8e+2RcOR/M93wCsp2l1GBRNG4qHFPKYpq
 NxioPm2UgLta+8CLgXQiXwSV2wstyGxeUzNfWRe8ubtFC1u74fF02is1uEBvf7qsRFilMuJeHx
 i2A=
X-SBRS: 2.7
X-MesageID: 8984082
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="8984082"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 29 Nov 2019 15:04:10 +0000
Message-ID: <20191129150416.4944-4-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191129150416.4944-1-ian.jackson@eu.citrix.com>
References: <20191129150416.4944-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/9] branching checklist: More detailed
 instructions re MAINTAINERS
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

UHJvdmlkZSBhIHJ1bmUsIGZvbGxvd2luZyB3aGljaCBhIG1hZ2l0IHNlbGVjdGl2ZSBnaXQgYWRk
CihvciBnaXQgYWRkIC1wKSBjYW4gYmUgdXNlZCB0byBjb21taXQgdGhlIGFwcHJvcHJpYXRlIGNo
YW5nZXMuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT4KLS0tCiBkb2NzL3Byb2Nlc3MvYnJhbmNoaW5nLWNoZWNrbGlzdC50eHQgfCAyICsrCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZG9jcy9wcm9jZXNz
L2JyYW5jaGluZy1jaGVja2xpc3QudHh0IGIvZG9jcy9wcm9jZXNzL2JyYW5jaGluZy1jaGVja2xp
c3QudHh0CmluZGV4IDg0Mzc3ODc0NDYuLjllNzlmNjQxNTcgMTAwNjQ0Ci0tLSBhL2RvY3MvcHJv
Y2Vzcy9icmFuY2hpbmctY2hlY2tsaXN0LnR4dAorKysgYi9kb2NzL3Byb2Nlc3MvYnJhbmNoaW5n
LWNoZWNrbGlzdC50eHQKQEAgLTg4LDYgKzg4LDggQEAgVXBkYXRlIG5ldyBzdGFibGUgdHJlZSdz
IE1BSU5UQUlORVJTIHRvIGNvbnRhaW4gY29ycmVjdCBpbmZvIGZvciB0aGlzCiBzdGFibGUgYnJh
bmNoOiB1c3VhbGx5LCBjb3B5IHRleHQgZnJvbSBwcmV2aW91cwogc3RhZ2luZy0kb3Y6TUFJTlRB
SU5FUlMgc2VjdGlvbiAiU3RhYmxlIFJlbGVhc2UgTWFpbnRlbmFuY2UiCiBpbnRvIG5ldyBzdGFn
aW5nLSR2LCBkZWxldGluZyB3aGF0J3MgdGhlcmUuCisgIGdpdCBjYXQtZmlsZSBibG9iIG9yaWdp
bi9zdGFnaW5nLSRvdjpNQUlOVEFJTkVSUyA+TUFJTlRBSU5FUlMKK2FuZCByZXZpZXcgdGhlIGNo
YW5nZXMsIGNvbW1pdGluZyBPTkxZIFRIRSBSRUxFVkFOVCBPTkVTCiAKIFNldCBvZmYgYSBtYW51
YWwgb3NzdGVzdCBydW4sIHNpbmNlIHRoZSBvc3N0ZXN0IGNyLWZvci1icmFuY2hlcyBjaGFuZ2UK
IHdpbGwgdGFrZSBhIHdoaWxlIHRvIHRha2UgZWZmZWN0OgotLSAKMi4xMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

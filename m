Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3435510D7A9
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 16:09:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iahp0-0006X5-SY; Fri, 29 Nov 2019 15:04:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1wlA=ZV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iahoz-0006Wj-RL
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 15:04:37 +0000
X-Inumbo-ID: 8666937e-12b9-11ea-a3e7-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8666937e-12b9-11ea-a3e7-12813bfff9fa;
 Fri, 29 Nov 2019 15:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575039862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=O4JsUfzNd3RZB41C06ROm1xU2onh8g54vVXvdFMXeA0=;
 b=Dyl4Vg3h7TVAmDTrut2/buoZ/yWqr72NP7DAlE9Ousevvx9f+vy/kP7t
 GQMnN8ZmdwUNWMkB3tBn4Vytk6eH3HeU7JT3SwUcO7q4dmQ5g/R/VkpdB
 UMOucR/xj4PzVXb/IMBPKV0kQ3iS4w+h2JXyohPHa86NKnCZUN8zSW61O w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ULQoLhCcvuFd2CV+EiW5Z+0qLKUtpH2BRBkQvq1MK7lSxXwwc3jFoYkq4w9pxCDmndJBFto6VE
 91GWKz0vYKusaiHlfT+2kXqU8FNVPznrK8zrI+hICvoeDbOUbmZwWTJ1asmWBBIAnfJghbBoJ7
 Q+ZH9Ew+t1ymxNSX+I2pixKSmWGhwOi7sLb3Wa0vtpxMU9bLhWaKTn2hrtEtjZbXSkE5hUs2qa
 EJqoH2xDDPSLtZTX+eQ1Cd9PJsnGjJQTbXRiIB9WtU5CHMU2JeWYUIYhazN3UCAc8j0fZOo43W
 /YE=
X-SBRS: 2.7
X-MesageID: 9402077
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="9402077"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 29 Nov 2019 15:04:15 +0000
Message-ID: <20191129150416.4944-9-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191129150416.4944-1-ian.jackson@eu.citrix.com>
References: <20191129150416.4944-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 8/9] docs/process: Notify release manager,
 rather than editing website
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHJlbGVhc2UgdGVjaG5pY2lhbiBoYXMgbm90IGJlZW4gcmVzcG9uc2libGUgZm9yIHdlYnNp
dGUgdXBkYXRlcwpmb3Igc29tZSB0aW1lLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogZG9jcy9wcm9jZXNzL3JlbGVhc2UtdGVjaG5p
Y2lhbi1jaGVja2xpc3QudHh0IHwgNSArLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RvY3MvcHJvY2Vzcy9yZWxlYXNlLXRl
Y2huaWNpYW4tY2hlY2tsaXN0LnR4dCBiL2RvY3MvcHJvY2Vzcy9yZWxlYXNlLXRlY2huaWNpYW4t
Y2hlY2tsaXN0LnR4dAppbmRleCA1YmNlNWJhNjNkLi41OWVlOGJkM2QyIDEwMDY0NAotLS0gYS9k
b2NzL3Byb2Nlc3MvcmVsZWFzZS10ZWNobmljaWFuLWNoZWNrbGlzdC50eHQKKysrIGIvZG9jcy9w
cm9jZXNzL3JlbGVhc2UtdGVjaG5pY2lhbi1jaGVja2xpc3QudHh0CkBAIC0xNDgsOCArMTQ4LDUg
QEAgUkVMRUFTRSBUQVJCQUxMCiAKIEFmdGVyIGEgLjAgcmVsZWFzZSwgdXBkYXRlIFhFTl9FWFRS
QVZFUlNJT04gYWdhaW4gKHRvIC4xLXByZSwgc2VlIGFib3ZlKS4KIAotdXBkYXRlIHhlbmJpdHMg
ZnJvbnQgcGFnZSB0byBjaGFuZ2UgcmVmZXJlbmNlcyB0byBvbGQgc3RhYmxlIGJyYW5jaAotIGlu
dG8gcmVmZXJlbmNlcyB0byBuZXcgc3RhYmxlIGJyYW5jaAotCi1FZGl0IHdlYnNpdGUKK05vdGlm
eSByZWxlYXNlIG1hbmFnZXIgb2YgY29tcGxldGlvbgogCi0tIAoyLjExLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

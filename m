Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4292710D7A3
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 16:08:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iahp3-0006YY-7Q; Fri, 29 Nov 2019 15:04:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1wlA=ZV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iahp1-0006Xr-Nw
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 15:04:39 +0000
X-Inumbo-ID: 8664344c-12b9-11ea-b155-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8664344c-12b9-11ea-b155-bc764e2007e4;
 Fri, 29 Nov 2019 15:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575039862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=NDyZJnBBiAL/IuFooXNs2Wng9qtM1/c5LwHKYVc1E1Y=;
 b=KfIvw4QNT45MT0r7GmEMxmoTC+8n1xvgRwh+cO8TLNkQ/WiPrx+sJMNH
 IONXCHMzlFKOZkio681Wl2g4aEOzMzz1bT0wnTKR5rTLuu2VcwfV9hNU9
 zKCKoxlv5ZZ6XggmzWHNyGeVSF20HuPnJBw1ipJDDML7RjWnnelMmBtcU g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: j1KF4BVaI6L4Cd098jV6yQSTeVS3JA0De/ieNpXs84Sh2q22c8UsFDEM8ypAHTZUkQLizjme4x
 U5PDmDB6Jk8ImfM0hIelq7fYZfBXwT/hmZHdiRMzOHVnbhidTaWTrj2JUY17co7PdiYMgchg1R
 Hdc4S+U7wWbQQ/cquyFjL+xdPZjTSw8oAgE2Njq24yAzPj6PvMSzgeJ0NLlFSVD7S/z1vNEc2r
 PmFCR4/TXFm10NA6itni93wienVHgaNtRRHVc+5A+S3e7dZyq3SACB24kVYFZa1YVQLNAo0Z02
 Ufo=
X-SBRS: 2.7
X-MesageID: 9539134
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="9539134"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 29 Nov 2019 15:04:09 +0000
Message-ID: <20191129150416.4944-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191129150416.4944-1-ian.jackson@eu.citrix.com>
References: <20191129150416.4944-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/9] branching checklist: Say perhaps no
 Config.mk changes needed
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

SXQgaXMgb25seSBuZWNlc3NhcnkgdG8gY2hhbmdlIENvbmZpZy5tayBpZiBpdCByZWZlcnMgdG8g
dW5zdGFibGUKYnJhbmNoZXMgYW55d2hlcmUuICBUaGlzIHRpbWUsIGZvciBleGFtcGxlLCBpdCBk
aWRuJ3QuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT4KLS0tCiBkb2NzL3Byb2Nlc3MvYnJhbmNoaW5nLWNoZWNrbGlzdC50eHQgfCAxICsKIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RvY3MvcHJvY2Vzcy9i
cmFuY2hpbmctY2hlY2tsaXN0LnR4dCBiL2RvY3MvcHJvY2Vzcy9icmFuY2hpbmctY2hlY2tsaXN0
LnR4dAppbmRleCA0Y2RhMzM2NTZkLi44NDM3Nzg3NDQ2IDEwMDY0NAotLS0gYS9kb2NzL3Byb2Nl
c3MvYnJhbmNoaW5nLWNoZWNrbGlzdC50eHQKKysrIGIvZG9jcy9wcm9jZXNzL2JyYW5jaGluZy1j
aGVja2xpc3QudHh0CkBAIC03NSw2ICs3NSw3IEBAIEVuc3VyZSByZWZlcmVuY2VzIHRvIHFlbXUg
dHJlZXMgaW4geGVuLmdpdCdzIENvbmZpZy5tayBhcmUgdXBkYXRlZC4KIENoZWNrIHRoaXMgd2l0
aAogICAgICAgICBncmVwIHVuc3RhYmxlIENvbmZpZy5tayAKIHdoaWNoIHNob3VsZCBwcm9kdWNl
IG5vIG91dHB1dC4gIFJlcGxhY2UgYXMgbmVjZXNzYXJ5LgorKFRoZXJlIG1heSB3ZWxsIGJlIG5v
bmUuKQogCiBVcGRhdGUgbmV3bHkgZGl2ZXJnaW5nIHN0YWdpbmcgKHVuc3RhYmxlKSBhY2NvcmRp
bmcgdG8KIHJlbGVhc2UtdGVjaG5pY2lhbi1jaGVja2xpc3QudHh0IHNlY3Rpb24gcmUgUkVBRE1F
IGV0Yy4KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=

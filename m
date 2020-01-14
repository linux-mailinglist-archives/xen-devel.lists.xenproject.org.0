Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE6713B10D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 18:36:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irQ41-0002OU-W7; Tue, 14 Jan 2020 17:33:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QqHR=3D=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1irQ40-0002OM-H7
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 17:33:12 +0000
X-Inumbo-ID: ed770dae-36f3-11ea-8415-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed770dae-36f3-11ea-8415-12813bfff9fa;
 Tue, 14 Jan 2020 17:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579023188;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=OMtQWZJJM+9GgX89tFHbq4RyNGASLycAeBWHKbFA4rI=;
 b=W4lbbs7O/H3W6APYRlCLXZ4zKkrbMvYxHV6M4tKK+ENlVm0sK+3YbrEP
 pzruEXBICFelAjuaI85+nNL7UxBnFm7l7ZP+M1M5zcav6k72f5rgW/izp
 NAnHPIQ7NKA73m9JTmEVNxLn6XHR3fjw/+mTgwo3jfByV2lw3BaIDkS1o 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
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
IronPort-SDR: ZkTHxYmuWBiJT0YfKX9IhpuRwywQugSQ3t0tWH2mwzNUkzjHWkaUS+Mu89+HXsMyjI+WDFZbQx
 10xBfBYW5IDBbKmhBRjyPr/LbKuv6vnilBNqCqPD5TasGprgi0FiudBZASFNDcwJRJ5zv5fbdf
 F6elHgygVdmwn/3y4pm9iE2//wvHPerVomSQ42O/K2sYrqkgjmnGiUsteov7mGXk8q9uJPzEdJ
 kxVLTSVfIQtBtXrKRfu4o0G5Kzr9FUi2Go2kiUPv1E+/1bF769mH3pXq2bpwpo5HRFo9SJg45Z
 yZ8=
X-SBRS: 2.7
X-MesageID: 11492537
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,319,1574139600"; d="scan'208";a="11492537"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24093.64337.28541.363727@mariner.uk.xensource.com>
Date: Tue, 14 Jan 2020 17:33:05 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20200103130616.13724-6-andrew.cooper3@citrix.com>
References: <20200103130616.13724-1-andrew.cooper3@citrix.com>
 <20200103130616.13724-6-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 19/20] tools/libxl: Re-position CPUID
 handling during domain construction
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
Cc: Anthony
 Perard <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggMTkvMjBdIHRvb2xzL2xpYnhsOiBSZS1wb3Np
dGlvbiBDUFVJRCBoYW5kbGluZyBkdXJpbmcgZG9tYWluIGNvbnN0cnVjdGlvbiIpOgo+IENQVUlE
IGhhbmRsaW5nIG5lZWRzIHRvIGJlIGVhcmxpZXIgaW4gY29uc3RydWN0aW9uLiAgTW92ZSBpdCBm
cm9tIGl0cyBjdXJyZW50Cj4gcG9zaXRpb24gaW4gbGlieGxfX2J1aWxkX3Bvc3QoKSB0byBsaWJ4
bF9fYnVpbGRfcHJlKCkgZm9yIGZyZXNoIGJ1aWxkcywgYW5kCj4gbGlieGxfX3NybV9jYWxsb3V0
X2NhbGxiYWNrX3N0YXRpY19kYXRhX2RvbmUoKSBmb3IgdGhlIG1pZ3JhdGlvbi9yZXN1bWUgY2Fz
ZS4KPiAKPiBJbiB0aGUgbWlncmF0aW9uIGNhc2UsIHRha2UgYWNjb3VudCBvZiBYR1JfU0REX01J
U1NJTkdfQ1BVSUQuCgpJcyBpdCBwb3NzaWJsZSB0byBzcGxpdCBvdXQgdGhlIGNoYW5nZSB0byB0
aGUgc2VxdWVuY2luZywgZnJvbSB0aGUgbmV3CmZ1bmN0aW9uYWxpdHkgPyAgSWYgc28sIHBsZWFz
ZSBjb3VsZCB5b3UgZG8gc28uCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=

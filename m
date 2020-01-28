Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A03114B584
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 14:58:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwRM6-0007jk-Mx; Tue, 28 Jan 2020 13:56:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=g73u=3R=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iwRM5-0007jD-G1
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 13:56:37 +0000
X-Inumbo-ID: ffba876a-41d5-11ea-86cc-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ffba876a-41d5-11ea-86cc-12813bfff9fa;
 Tue, 28 Jan 2020 13:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580219797;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5kktpDiLfKOhfsWAIDocjIeOCd6KX0nsSVDY+3/riDU=;
 b=Io7Hr0yU0poJ6rQMtJzqXNW+L6tQKqgd0JFdDRvggCmK67sI3LKgjqpr
 fw7MxAZQTepISQIMPVVFUbFvpVByq/sxN8K9l1Gk5gBxSyVZPFQgl9TLZ
 LpkykvjD7R0jODzWEmqM9H5YjfEnBKRdwBnY3kRdPlbOrBvc8OCBVs2mY 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rx3sIY+68RrOzVWOe5X1CtpzMR7cMHqu0YBVdqih+7zsjuc941L1N2g5m4l8WAYQ6euQxxlMvK
 mOAvQHCXx5uE2kaUwoDD+40ccZaT+WtXtn2HRiqI2xrveFtfWZYkyF3N13ld9nnelud/JAm8Yk
 ouCjo72AiLmU13ZkAl0VNPjsIcwfE/sHSMffd6QWeLsO54qw/FJp5ynrkvfgBfD7rxxp2M4HMc
 ENScLUebyUnq04Me5sDq/n9OvCyaGYplScPGqH4PprkZe2GnBR6qxRaYx+0rrkBcFBc9OJiSKK
 8YA=
X-SBRS: 2.7
X-MesageID: 11566022
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,374,1574139600"; d="scan'208";a="11566022"
Date: Tue, 28 Jan 2020 14:56:26 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200128135626.GO57924@desktop-tdan49n.eng.citrite.net>
References: <4c53200e-f571-a3de-cb25-6548a40bbb94@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c53200e-f571-a3de-cb25-6548a40bbb94@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/HVM: fix PM timer I/O port range
 version check
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgMDI6MTc6NTFQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gWE9SLWluZyB0d28gYXJiaXRyYXJ5IG5vbi1lcXVhbCB2YWx1ZXMgbWF5IHByb2R1Y2Ug
MSBldmVuIGlmIGJvdGggdmFsdWVzCj4gYXJlIGRpZmZlcmVudCBmcm9tIGJvdGggMCBhbmQgMSAo
MiBhbmQgMyB3b3VsZCBmaXQsIGZvciBleGFtcGxlKS4gVXNlIE9SCj4gaW5zdGVhZCwgd2hpY2gg
dG9nZXRoZXIgd2l0aCB0aGUgZWFybGllciBiYWlsaW5nIHVwb24gZmluZGluZwo+ICJ2ZXJzaW9u
ID09IG9sZF92ZXJzaW9uIiBhY2hpZXZlcyB0aGUgaW50ZW5kZWQgZWZmZWN0Lgo+IAo+IEZpeGVz
OiBmMGFkMjFjNDk5ZjcgKCJ4ODYgaHZtOiBJbnRyb2R1Y2UgcG10aW1lcl9jaGFuZ2VfaW9wb3J0
IGFuZCBIVk1fUEFSQU1fQUNQSV9JT1BPUlRTX0xPQ0FUSU9OIikKPiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

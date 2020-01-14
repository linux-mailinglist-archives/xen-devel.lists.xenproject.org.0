Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6A313B083
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 18:08:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irPdF-0007qj-Ff; Tue, 14 Jan 2020 17:05:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QqHR=3D=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1irPdD-0007qW-Bb
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 17:05:31 +0000
X-Inumbo-ID: 0e7804ef-36f0-11ea-840c-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e7804ef-36f0-11ea-840c-12813bfff9fa;
 Tue, 14 Jan 2020 17:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579021525;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=eInekDwgOoOdRYM1yo7abwXHDFyXEOHbENJxFSwTyz0=;
 b=Z9kBwZFDj44GVpHSljyKrqJ5c8HfWsXjwtksR09MMxpzByKGfckCMayI
 v6MfAU5vCQnOqpFO6lEmCGpXVfZRQ1rJ/Jt2tMPam6bJUK5tShj8gVusF
 BzSVwEbJc1RGWxUuF5W2s8SZrA4JYf886nnwJJ3ssMFiVuBQckotpDy4z 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
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
IronPort-SDR: CcSC6HOqsIOHasgwAhCcTMNHq+etO/krKw3HY2M3EnQOHO4swk9fs6KtkeKPkyAzGcLaL9tKdP
 c7zmqFSc6xsM09T8Cj03wMnqIOrQcXB/U4YdmRjs3FWK3064ABmFjwgG4Rjyjo5gQfhoFMpOBZ
 E1NY/TZL2EZC2iEykPD6dSPB63i6FvCDdoxM8yk5DLDMVDci+LuQ2CAU/LbnexIxYlQM4sy1gb
 0d/plWFZSvbY/f0Sjdtu8oexmjNAQzmywJ60Ntnme4wUPP5QlVahjTmDQYV8vtEU0zhcjExWKv
 cnA=
X-SBRS: 2.7
X-MesageID: 11331745
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,433,1574139600"; d="scan'208";a="11331745"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24093.62674.533444.119279@mariner.uk.xensource.com>
Date: Tue, 14 Jan 2020 17:05:22 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20191224151932.6304-10-andrew.cooper3@citrix.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
 <20191224151932.6304-10-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 09/12] libxc/save: Write a v3 stream
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggMDkvMTJdIGxpYnhjL3NhdmU6IFdyaXRlIGEg
djMgc3RyZWFtIik6Cj4gSW50cm9kdWNlIGEgbmV3IHN0YXRpY19kYXRhKCkgaG9vayB3aGljaCBp
cyByZXNwb25zaWJsZSBmb3Igd3JpdGluZyBvdXQKPiBhbnkgc3RhdGljIGRhdGEgcmVjb3Jkcy4g
IFRoZSBIVk0gc2lkZSBjb250aW51ZXMgdG8gYmUgYSBuby1vcCwgd2hpbGUKPiB0aGUgUFYgc2lk
ZSBtb3ZlcyB3cml0ZV94ODZfcHZfaW5mbygpIGludG8gdGhpcyBlYXJsaWVyIGhvb2suICBUaGUg
dGhlCj4gY29tbW9uIGNvZGUgd3JpdGVzIG91dCBhIFNUQVRJQ19EQVRBX0VORCByZWNvcmQsIGFu
ZCB0aGUgc3RyZWFtIHZlcnNpb24KPiBpcyBidW1wZWQgdG8gMy4KPiAKPiBVcGRhdGUgY29udmVy
dC1sZWdhY3ktc3RyZWFtIHRvIHdyaXRlIGEgdjMgc3RyZWFtLCBiZWNhdXNlIHRoaXMgd2lsbAo+
IGJ5cGFzcyB0aGUgY29tcGF0aWJsaXR5IGxvZ2ljIGluIGxpYnhjLgoKVGhpcyBzZWVtcyBsaWtl
IGl0IGNvbnRhaW5zIHRoZSBwYXJ0cyBJIHdvdWxkIGV4cGVjdC4KCkFja2VkLWJ5OiBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=

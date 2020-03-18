Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1615C18A246
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 19:24:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEdIN-00021j-83; Wed, 18 Mar 2020 18:19:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zvpX=5D=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jEdIL-00021e-Dt
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 18:19:57 +0000
X-Inumbo-ID: 111d1e7a-6945-11ea-bb4a-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 111d1e7a-6945-11ea-bb4a-12813bfff9fa;
 Wed, 18 Mar 2020 18:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584555596;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=ihlRdg308+aicVOUJJ8rx2NwX1u3l2ycNjZfMNGnrvo=;
 b=S0DF6HG8kaXb1ZsvkWWWw+WgURv3MLzJx7Y7eo4/BUGBMdDzXXKYAfzz
 2Vvmp9pY2FENT7bMM8YTIwGSTFunKlpV2nr+JJj0obitYMlmC7nDSNEoA
 MiIGBwp6grIec3HLOO/BJPH7HGlFOt8XVL/ocLWzSUc0f4Rvj/DKvHNhp E=;
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
IronPort-SDR: Fu1LquARvgX4yh3WXoadOyKYWiCf//uymbfW+WMH18gWyOYmLcDJ3IlW30ELeQw64whZY2Smc7
 ZsryaSI4MwXPI9opLxSlVW2Cbd+FTakor9/TkYpP89Ifb+JFoF+0UslZfDEJuDsNqjrbW/uYbG
 UqTR7zhOya0gLEIhXDNzQR0nXayGl+rQG/n1+EmeoBL0lGeqNn74y9zQEWdMQCFDYiRC48ZJkU
 BFYVjdQYCMPPbzG1jBkRasR5SG8y0UnOf5aoFIkeVFzAyRqerv2l5SkStZgkhI0YIOnaJQRfoo
 Dv4=
X-SBRS: 2.7
X-MesageID: 14867621
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,568,1574139600"; d="scan'208";a="14867621"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24178.26182.348632.153341@mariner.uk.xensource.com>
Date: Wed, 18 Mar 2020 18:19:50 +0000
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <d32839020e3914569a6ac20b7f837b88a100202a.camel@infradead.org>
References: <5fa9d44f9e396a07b87ef9bd63094237b1efecc2.camel@infradead.org>
 <c8f6989f-5b9d-ffec-8e21-971d18a698a4@suse.com>
 <0fc1481c9f90fd91b3e1c41bc3e26da104770cb7.camel@infradead.org>
 <24177.500.399884.150514@mariner.uk.xensource.com>
 <d32839020e3914569a6ac20b7f837b88a100202a.camel@infradead.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] Add -MP to CFLAGS along with -MMD.
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGF2aWQgV29vZGhvdXNlIHdyaXRlcyAoIlJlOiBbUEFUQ0hdIEFkZCAtTVAgdG8gQ0ZMQUdTIGFs
b25nIHdpdGggLU1NRC4iKToKPiBPSy4uLiBJIGhhdmUgYXR0ZW1wdGVkIHRvIGFkZHJlc3MgbXkg
ZnJ1c3RyYXRpb24gaW4gYSBtb3JlIGNvaGVyZW50IGFuZAo+IGhvcGVmdWxseSBwcm9kdWN0aXZl
IHdheSAocXYpLCByYXRoZXIgdGhhbiByZXNvcnRpbmcgdG8gbW9ub3N5bGxhYmljCj4gcmVzcG9u
c2VzLiBBcG9sb2dpZXMgZm9yIHRoYXQuCj4gCj4gQmFjayB0byB0aGUgc3BlY2lmaWNzIG9mIHRo
aXMgcGF0Y2guLi4KCldvdy4gIEltcHJlc3NpdmUuICBUaGFuayB5b3UgZm9yIHRoZSBjb21wcmVo
ZW5zaXZlIGV4cGxhbmF0aW9uLgoKU3VwcG9zaW5nIHlvdSBwdXQgYWxsIHRoYXQgaW4gdGhlIGNv
bW1pdCBtZXNzYWdlOgogIEFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0
cml4LmNvbT4KKGZvciB0aGUgb3JpZ2luYWwgcGF0Y2gpCgpJZiB5b3Ugd2VyZSBmZWVsaW5nIGR5
bmFtaWMsIGdldHRpbmcgdGhlIGdjYyBkb2VzIChhbmQgbWF5YmUgdGhlIG1ha2UKZG9jcykgaW1w
cm92ZWQgd291bGQgYmUgbmljZS4KCj4gU28gbm8sIEkgZG9uJ3QgdGhpbmsgdXNpbmcgLU1QIGlz
IGdvaW5nIHRvIGJyZWFrIG91ciBoYW5kbGluZyBvZiBhdXRvLQo+IGdlbmVyYXRlZCBoZWFkZXIg
ZmlsZXMsIGJ1dCB3ZSdkIGhhdmUga25vd24gdGhhdCBmcm9tIGEgdHJpdmlhbAo+IGVtcGlyaWNh
bCBidWlsZCB0ZXN0IHdpdGhpbiBzZWNvbmRzLCB3b3VsZG4ndCB3ZT8KClVuZm9ydHVhbnRlbHkg
aW4gdGhlc2UgZGF5cyBvZiBtYW55LWNvcmUgY3B1cywgZW1waXJpY2FsIHRlc3RzIHNob3dpbmcK
dGhhdCB0aGUgbWFrZWZpbGUgd29ya3MgdGhpcyB0aW1lIGRvIG5vdCBuZWNlc3NhcmlseSBtZWFu
IGl0IHdpbGwgd29yawpldmVyeSB0aW1lLiAgTWF5YmUgdGhhdCB3YXNuJ3QgYSBjb25jZXJuIGlu
IHRoaXMgY2FzZSwgYnV0IG15CmV4cGVyaWVuY2UgaW4gZ2VuZXJhbCB0ZWFjaGVzIG1lIG5vdCB0
byByZWx5IHNvbGVseSBvbiB0ZXN0cyBvdGhlcgp0aGFuIHRvIGFuc3dlciB2ZXJ5IG5hcnJvdyBx
dWVzdGlvbnMuCgpTb3JyeSB0aGF0IHRoaXMgd2FzIGZydXN0cmF0aW5nIGluIHRoaXMgY2FzZSwg
YnV0IEkgdGhpbmsgdGhhdCBzb21lIG9mCnRoZSBsb3NzYWdlIGZyb20gb3VyIChzb21ldGltZXMg
YXBwYWxsaW5nKSBtYWtlZmlsZXMgaGFzIGFyaXNlbiBkdWUgdG8KcGF0Y2hlcyBiZWluZyBjb21t
aXR0ZWQgdGhhdCBhcHBlYXJlZCB0byB3b3JrIGF0IHRoZSB0aW1lLiAgU28gSSBkb24ndAp0aGlu
ayB5b3VyIHJlc2VhcmNoIHdhcyB3YXN0ZWQgZWZmb3J0LgoKQW55d2F5LCBJIGFwcGxhdWQgeW91
ciBlZmZvcnRzIHRvIGltcHJvdmUgb3VyIE1ha2VmaWxlcy4KClJlZ2FyZHMsCklhbi4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

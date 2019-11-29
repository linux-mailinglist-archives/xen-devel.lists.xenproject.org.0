Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7441610D5C0
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 13:40:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iafX9-0006hm-CZ; Fri, 29 Nov 2019 12:38:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UeaM=ZV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iafX7-0006hh-Vc
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 12:38:02 +0000
X-Inumbo-ID: 1459e04a-12a5-11ea-a55d-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1459e04a-12a5-11ea-a55d-bc764e2007e4;
 Fri, 29 Nov 2019 12:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575031082;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=W5NQbpXRKYfbPlJ84ARRCVBlLGa7ZshwNim3P5LL8zQ=;
 b=UbLujUN2r7vA8xGQvHeRZqTPqxuAl++XMPoRTmBloiOPUS5Y6O5ELgvK
 hDYp5dbzG+yH1I25eZ5ffIrlppimgxzsuNzowo/YQJnhLnjDukW6LeJvf
 l6XbE2J34KNhHQBBZ5K8ShZ0v3oq6tfs7P/7zj056gEID7aPUTgQ0LDsf U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vFdxQZQRtDo0+Nm9wuPbpks++AZV/CyABnGiLI6xuvcKJj1nWDx3nIH4LYfTm5T0VeEp5ZZC/m
 cEoUXvWMLJZVPe+Zuqg9eLPJmkHyM2xc7R9a+63a7wPl1Vipz0h3zLD6NBdkb6icn6OcXr0u85
 AEkm97eeD5KdN56KUufvqaPe9BOhijYswd9KhQTOhInB5AUXfZU/cyydiDvy/Nn+AXYxhPBArP
 3+4YbBVtg5dMaz/ZPID5NQQ/JH0XG47dcGXGjfYNQrom7CM32g5DJGC8T15IPcjCV2P8qRcCqp
 ReY=
X-SBRS: 2.7
X-MesageID: 8978064
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="8978064"
To: Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
References: <5766dd2b-2aa7-bafe-56ad-3ea33ddf4591@suse.com>
 <78b1df38-864c-768e-b306-2db75f3b76e0@citrix.com>
 <e765c741-cba4-42bf-b61a-20a206cd628d@suse.com>
 <24033.2185.509756.178278@mariner.uk.xensource.com>
 <47257a2e-5454-6115-93c9-e1b9ed3a4131@suse.com>
 <d8e8729a-3a20-f65d-0c1b-9f5522f4a450@citrix.com>
 <f998ce81-8b77-a2c6-ab90-cedff89799da@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <358e29a0-0fce-28de-fdf3-730e6b4aaf26@citrix.com>
Date: Fri, 29 Nov 2019 12:37:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f998ce81-8b77-a2c6-ab90-cedff89799da@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] console: avoid buffer overflow in
 guest_console_write()
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad
 Wilk <konrad.wilk@oracle.com>, Ilja Van Sprundel <ivansprundel@ioactive.com>,
 GeorgeDunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMTEvMjAxOSAxMjoxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjkuMTEuMjAxOSAx
MzoxNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjkvMTEvMjAxOSAxMjoxMywgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAyOS4xMS4yMDE5IDEzOjAxLCBJYW4gSmFja3NvbiB3cm90ZToK
Pj4+PiBKYW4gQmV1bGljaCB3cml0ZXMgKCJSZTogW1BBVENIXSBjb25zb2xlOiBhdm9pZCBidWZm
ZXIgb3ZlcmZsb3cgaW4gZ3Vlc3RfY29uc29sZV93cml0ZSgpIik6Cj4+Pj4+IE9uIDI5LjExLjIw
MTkgMTE6MjIsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+PiBJcyBzaXplb2YoYXJyYXlbMF0p
IGFsd2F5cyAwLCBvciBpcyB0aGlzIGp1c3QgYSBHQ0MtaXNtID/CoCBHb2Rib2x0Cj4+Pj4+PiBz
dWdnZXN0cyBpcyAwIG9uIGFsbCBjb21waWxlciB3ZSBzdXBwb3J0Lgo+Pj4+Pj4KPj4+Pj4+IEVp
dGhlciB3YXksIGlzbid0IHRoZSBtb3JlIGNvbW1vbiBpZGlvbSArIDB1bCA/wqAgUGVyc29uYWxs
eSwgSSBmZWVsIHRoYXQKPj4+Pj4+IGlzIGNsZWFyZXIgdG8gZm9sbG93Lgo+Pj4+PiBJIGRlY2lk
ZWQgYWdhaW5zdCArIDB1bCBvciBhbGlrZSBiZWNhdXNlIGluIHByaW5jaXBsZSBzaXplX3QKPj4+
Pj4gYW5kIHVuc2lnbmVkIGxvbmcgYXJlIGRpZmZlcmVudCB0eXBlcy4gSW4gcGFydGljdWxhciAz
Mi1iaXQKPj4+Pj4geDg2IGdjYyB1c2VzIHVuc2lnbmVkIGludCBmb3Igc2l6ZV90LCBhbmQgaGVu
Y2UgbWluKCkncwo+Pj4+PiB0eXBlIHNhZmV0eSBjaGVjayB3b3VsZCBjYXVzZSB0aGUgYnVpbGQg
dG8gZmFpbCB0aGVyZS4gVGhlCj4+Pj4+IHNhbWUgcmlzayBvYnZpb3VzbHkgZXhpc3RzIGZvciBh
bnkgMzItYml0IGFyY2ggKGUuZy4gQXJtMzIsCj4+Pj4+IGJ1dCBJIGhhdmVuJ3QgY2hlY2tlZCB3
aGF0IHR5cGUgaXQgYWN0dWFsbHkgdXNlcykuCj4+Pj4gSSBkb24ndCBrbm93IHdoYXQgaSB3cm9u
ZyB3aXRoCj4+Pj4gICAgKHNpemVfdCkwCj4+Pj4gd2hpY2ggaXMgc2hvcnRlciwgZXZlbiAhCj4+
PiBUcnVlLiBZZXQgaXQgY29udGFpbnMgYSBjYXN0LCBubyBtYXR0ZXIgaG93IHJpc2stZnJlZSBp
dCBtYXkgYmUKPj4+IGluIHRoaXMgY2FzZS4gV2l0aCBhIGNhc3QsIEkgY291bGQgYXMgd2VsbCBo
YXZlIHdyaXR0ZW4gKHlldAo+Pj4gc2hvcnRlcikgKHNpemVfdCljb3VudC4KPj4gR2l2ZW4gdGhh
dCBtaW4oKSBoYXMgYSB2ZXJ5IHN0cmljdCB0eXBlY2hlY2ssIEkgdGhpbmsgd2Ugc2hvdWxkIHBl
cm1pdAo+PiBhbnkgdXNlIG9mIGFuIGV4cGxpY2l0IGNhc3QgaW4gYSBzaW5nbGUgb3BlcmFuZCwg
YmVjYXVzZSBpdCAqaXMqIHNhZmVyCj4+IHRoYW4gc3dpdGNoaW5nIHRvIHRoZSBtaW5fdCgpIHJv
dXRlIHRvIG1ha2UgdGhpbmdzIGNvbXBpbGUuCj4gV2VsbCwgSSBjYW4gc3dpdGNoIHRvIChzaXpl
X3QpY291bnQgaWYgdGhpcyBpcyBsaWtlZCBiZXR0ZXIKPiBvdmVyYWxsLgoKUGVyc29uYWxseSwg
SSdkIHByZWZlciB0aGlzIG9wdGlvbiBtb3N0IG9mIGFsbC4KCn5BbmRyZXcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

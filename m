Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70126166294
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 17:27:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4oeA-0008Ta-Oz; Thu, 20 Feb 2020 16:25:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FovI=4I=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j4oe9-0008TS-9z
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 16:25:53 +0000
X-Inumbo-ID: a9575738-53fd-11ea-aa99-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9575738-53fd-11ea-aa99-bc764e2007e4;
 Thu, 20 Feb 2020 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582215953;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=irysKF+SB4sADnwEHW+6/VWlISG6LFxmsMm60QkU8sc=;
 b=WSEslYi7QWt58+YO8IEPnsB78kC4zQAKtyaqQZmCMXK+x6u0N9073UJ+
 jLBXTjlSbuIqas24eyuF4Msj/xZrGdOtCtjuWoYio84zfayP3baYInakg
 Ok87+gr7qc1cM+DRt6rto8jiqCWbu15wH4XysPladSmscJVu82TrHWCOF c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vI1BHfKYC9saGWkhiTpz3deHkQs2aB+c64WWVjhsjlVw+DZgtUgejc74LHLSde7uJNJI3KJRIO
 05FDCDnkG8mjL0Mfohd/W1HQXWwFup2Lpc4y1Xi0aDD99B5w61mldKoJFjAghnELjr/EvnhSGo
 4IJOTgSdl+IiunrjTn171bfGIm8EEX7+YXksMw8BnU8UrAsubW+WTlWQFIiSXY3I2OO+pFqUXJ
 +W7lMsnwAkJwBKLr57jwaQGTLuLnsQi1mXsN0kbmyES2JD7vN95x8It+7XdfL/MEqLfNYgeZiJ
 lbc=
X-SBRS: 2.7
X-MesageID: 12770160
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,464,1574139600"; d="scan'208";a="12770160"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24142.45836.728873.313551@mariner.uk.xensource.com>
Date: Thu, 20 Feb 2020 16:25:48 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20200219093754.2924-5-pdurrant@amazon.com>
References: <20200219093754.2924-1-pdurrant@amazon.com>
 <20200219093754.2924-5-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v6 4/6] libxl: allow creation of domains
 with a specified or random domid
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCB2NiA0LzZdIGxpYnhsOiBhbGxvdyBjcmVhdGlv
biBvZiBkb21haW5zIHdpdGggYSBzcGVjaWZpZWQgb3IgcmFuZG9tIGRvbWlkIik6Cj4gVGhpcyBw
YXRjaCBhZGRzIGEgJ2RvbWlkJyBmaWVsZCB0byBsaWJ4bF9kb21haW5fY3JlYXRlX2luZm8gYW5k
IHRoZW4KPiBtb2RpZmllcyBsaWJ4bF9fZG9tYWluX21ha2UoKSB0byBoYXZlIFhlbiB1c2UgdGhh
dCB2YWx1ZSBpZiBpdCBpcyB2YWxpZC4KPiBJZiB0aGUgZG9taWQgdmFsdWUgaXMgaW52YWxpZCB0
aGVuIFhlbiB3aWxsIGNob29zZSB0aGUgZG9taWQsIGFzIGJlZm9yZSwKPiB1bmxlc3MgdGhlIHZh
bHVlIGlzIHRoZSBuZXcgc3BlY2lhbCBSQU5ET01fRE9NSUQgdmFsdWUgYWRkZWQgdG8gdGhlIEFQ
SS4KPiBUaGlzIHZhbHVlIGluc3RydWN0cyBsaWJ4bF9fZG9tYWluX21ha2UoKSB0byBjaG9vc2Ug
YSByYW5kb20gZG9taWQgdmFsdWUKPiBmb3IgWGVuIHRvIHVzZS4KPiAKPiBJZiBYZW4gZGV0ZXJt
aW5lcyB0aGF0IGEgZG9taWQgc3BlY2lmaWVkIHRvIG9yIGNob3NlbiBieQo+IGxpYnhsX19kb21h
aW5fbWFrZSgpIGNvLWluY2lkZXMgd2l0aCBhbiBleGlzdGluZyBkb21haW4gdGhlbiB0aGUgY3Jl
YXRlCj4gb3BlcmF0aW9uIHdpbGwgZmFpbC4gSW4gdGhpcyBjYXNlLCBpZiBSQU5ET01fRE9NSUQg
d2FzIHNwZWNpZmllZCB0bwo+IGxpYnhsX19kb21haW5fbWFrZSgpIHRoZW4gYSBuZXcgcmFuZG9t
IHZhbHVlIHdpbGwgYmUgY2hvc2VuIGFuZCB0aGUgY3JlYXRlCj4gb3BlcmF0aW9uIHdpbGwgYmUg
cmUtdHJpZWQsIG90aGVyd2lzZSBsaWJ4bF9fZG9tYWluX21ha2UoKSB3aWxsIGZhaWwuCj4gCj4g
QWZ0ZXIgWGVuIGhhcyBzdWNjZXNzZnVsbHkgY3JlYXRlZCBhIG5ldyBkb21haW4sIGxpYnhsX19k
b21haW5fbWFrZSgpIHdpbGwKPiBjaGVjayB3aGV0aGVyIGl0cyBkb21pZCBtYXRjaGVzIGFueSBy
ZWNlbnRseSB1c2VkIGRvbWlkIHZhbHVlcy4gSWYgaXQgZG9lcwo+IHRoZW4gdGhlIGRvbWFpbiB3
aWxsIGJlIGRlc3Ryb3llZC4gSWYgdGhlIGRvbWlkIHVzZWQgaW4gY3JlYXRpb24gd2FzCj4gc3Bl
Y2lmaWVkIHRvIGxpYnhsX19kb21haW5fbWFrZSgpIHRoZW4gaXQgd2lsbCBmYWlsIGF0IHRoaXMg
cG9pbnQsCj4gb3RoZXJ3aXNlIHRoZSBjcmVhdGUgb3BlcmF0aW9uIHdpbGwgYmUgcmUtdHJpZWQg
d2l0aCBlaXRoZXIgYSBuZXcgcmFuZG9tCj4gb3IgWGVuLXNlbGVjdGVkIGRvbWlkIHZhbHVlLgoK
QWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKVGhhbmtz
LiAgVGhlIGxvZ2ljIHNlZW1zIGEgbG90IGNsZWFyZXIgbm93LgoKSWFuLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

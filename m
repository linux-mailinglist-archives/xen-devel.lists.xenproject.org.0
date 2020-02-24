Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED57A16A4E3
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 12:29:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Brx-0000Qu-Sg; Mon, 24 Feb 2020 11:25:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6Brw-0000Qp-Ol
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 11:25:48 +0000
X-Inumbo-ID: 66ee2b58-56f8-11ea-8aec-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66ee2b58-56f8-11ea-8aec-12813bfff9fa;
 Mon, 24 Feb 2020 11:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582543547;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Uu6h6h4LE6oSq7XxOyLGlz8LFlSUC+bH4uoOf/8sOBk=;
 b=H/4kR3MrU+GBoeb09ay4fnZ4dWTwtVoZqP3Wtd0fnqnAgf8rncjLHHoD
 VJ78lFt8pAbYZnf6EqwbmqjDzFMc03AzaLneFNA/bd/EQ6/6SuS4hg5z6
 sOKRJDwgC9swY+DGaxusJx/BHCC/ENYD8VjmwGcnZFzT5UdEY0vp0O8Qz A=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ybywFwrR6fuFTX5sIrOtTj6X+tL77gQEKWcY3RuoZGupoNXXJuHvd0Pw3yyrmJ7Yblf/HwUQ9D
 eJUgtiRHoPppgiapiJHHgvw0vbb/i9SoVfPbVdIkk6dHdAtOfgoq2akeTav6rogqimM4AgZDI4
 uq2aqkY9JAlfKt28BlJY6P54Eu543npQjaWmLIHIJOe6WWQ0Gn6+MlZa9sE9wup1ErPztRv05G
 RiosXJbo99FbvRnShB7xJDGMx0pY7ZFOEpGv3FhD/uxt+/Bqqi8TX/ufJgSB26m1KDy+8DtmAj
 MEM=
X-SBRS: 2.7
X-MesageID: 13257351
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,480,1574139600"; d="scan'208";a="13257351"
Date: Mon, 24 Feb 2020 12:25:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20200224112539.GL4679@Air-de-Roger>
References: <20200218122114.17596-1-jgross@suse.com>
 <20200218122114.17596-4-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218122114.17596-4-jgross@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 3/4] xen: add
 process_pending_softirqs_norcu() for keyhandlers
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMTgsIDIwMjAgYXQgMDE6MjE6MTNQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBTb21lIGtleWhhbmRsZXJzIGFyZSBjYWxsaW5nIHByb2Nlc3NfcGVuZGluZ19zb2Z0
aXJxcygpIHdoaWxlIGhvbGRpbmcKPiBhIHJjdV9yZWFkX2xvY2soKS4gVGhpcyBpcyB3cm9uZywg
YXMgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzKCkgbWlnaHQKPiBhY3RpdmF0ZSByY3UgY2FsbHMg
d2hpY2ggc2hvdWxkIG5vdCBoYXBwZW4gaW5zaWRlIGEgcmN1X3JlYWRfbG9jaygpLgoKSXQgbWln
aHQgYmUgaGVscGZ1bCB0byB0dXJuIHRoZSBBU1NFUlQgaW4gcHJvY2Vzc19wZW5kaW5nX3NvZnRp
cnFzCmludG8gQVNTRVJUX05PVF9JTl9BVE9NSUMgYWxzbywgYXMgaXQgd291bGQgY2F0Y2ggc3Vj
aCBtaXNzdXNlcwpBRkFJQ1QuCgo+IAo+IEZvciB0aGF0IHB1cnBvc2UgYWRkIHByb2Nlc3NfcGVu
ZGluZ19zb2Z0aXJxc19ub3JjdSgpIHdoaWNoIHdpbGwgbm90Cj4gZG8gYW55IHJjdSBhY3Rpdml0
eSBhbmQgdXNlIHRoaXMgZm9yIGtleWhhbmRsZXJzLgoKSSB3b25kZXIgaWYgZm9yIGtleWhhbmRs
ZXJzIGl0IG1pZ2h0IGJlIGVhc2llciB0byBqdXN0IGRpc2FibGUgdGhlCndhdGNoZG9nIGluIGhh
bmRsZV9rZXlwcmVzcyBhbmQgcmVtb3ZlIHRoZSBzb2Z0aXJxIHByb2Nlc3NpbmcgZnJvbSB0aGUK
aGFuZGxlcnMuCgpBdCB0aGUgZW5kIG9mIGRheSB3ZSB3YW50IHRoZSBrZXloYW5kZXJzIHRvIHJ1
biBhcyBmYXN0IGFzIHBvc3NpYmxlIGluCm9yZGVyIHRvIGdldCB0aGUgZGF0YSBvdXQsIGFuZCB3
ZSBvbmx5IGNhcmUgYWJvdXQgdGhlIHdhdGNoZG9nIG5vdAp0cmlnZ2VyaW5nPyAobWF5YmUgSSdt
IG1pc3Npbmcgc29tZXRoaW5nIGhlcmUpCgo+ICt2b2lkIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJx
c19ub3JjdSh2b2lkKQo+ICt7Cj4gKyAgICBBU1NFUlQoIWluX2lycSgpICYmIGxvY2FsX2lycV9p
c19lbmFibGVkKCkpOwo+ICsgICAgLyogRG8gbm90IGVudGVyIHNjaGVkdWxlciBhcyBpdCBjYW4g
cHJlZW1wdCB0aGUgY2FsbGluZyBjb250ZXh0LiAqLwo+ICsgICAgX19kb19zb2Z0aXJxKCgxdWwg
PDwgU0NIRURVTEVfU09GVElSUSkgfCAoMXVsIDw8IFNDSEVEX1NMQVZFX1NPRlRJUlEpLAoKRG9u
J3QgeW91IGFsc28gbmVlZCB0byBwYXNzIFJDVV9TT0ZUSVJRIHRvIHRoZSBpZ25vcmUgbWFzayBp
biBvcmRlciB0bwphdm9pZCBhbnkgUkNVIHdvcmsgaGFwcGVuaW5nPwoKVGhhbmtzLCBSb2dlci4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

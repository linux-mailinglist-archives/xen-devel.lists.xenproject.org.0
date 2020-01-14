Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A79EE13AE76
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 17:09:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irOj3-0001ZJ-0G; Tue, 14 Jan 2020 16:07:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QqHR=3D=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1irOj1-0001ZC-KL
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 16:07:27 +0000
X-Inumbo-ID: f04f6eec-36e7-11ea-ac27-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f04f6eec-36e7-11ea-ac27-bc764e2007e4;
 Tue, 14 Jan 2020 16:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579018039;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=gND4TU+oXFDGFHnFz/JIDMveAcXUjG5VqAPMSf7k/bQ=;
 b=DSP5zZEXp83CEgYJBbfQqvUgNk6l8k5/O1UNikJ6/2JfZsvSUha5f+Di
 CyoJZZ5x7AyOLm9gfD5LGPPF8hWJTnKs3LvlKBKraTu6N5KI/y+L+HQ42
 XBoDOEQE5rUiij3X2tpP5xOj4Zyxni8apOjpgPsAuSxsSCBNoMcLVT0mb k=;
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
IronPort-SDR: 1CdEKXcP1Xr97nCHWB4ffJqKMWH+wXe0Lrn5TXTbXz8yql064kBqxyBb2p47dyzdgHpo9beCBe
 fwfJ5GH9CqgLYsrzW1PmHzi2BgFoBY/HuI+DfrU6qoPaEwt5c3OIjG7HqK5rkEOlbc7aaCjMrb
 x/fK6PCRao2ZV0XUVr5eXs27l74SZ1hZ7N0xD376tFpa1+q2MyAXwemK9jafWcJd6VY0gYGprv
 XgWMZoxBP71N2mj8AP9sAQSfrg6zJOAajRAkozf1XpeQYgVY1YKzHf/2Deo+Q1FxpJN2FYWpIu
 m6Q=
X-SBRS: 2.7
X-MesageID: 11327285
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,433,1571716800"; d="scan'208";a="11327285"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24093.59187.647402.597873@mariner.uk.xensource.com>
Date: Tue, 14 Jan 2020 16:07:15 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20191224151932.6304-7-andrew.cooper3@citrix.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
 <20191224151932.6304-7-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 06/12] docs/migration Specify migration v3
 and STATIC_DATA_END
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
 George Dunlap <George.Dunlap@citrix.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <JBeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggMDYvMTJdIGRvY3MvbWlncmF0aW9uIFNwZWNp
ZnkgbWlncmF0aW9uIHYzIGFuZCBTVEFUSUNfREFUQV9FTkQiKToKPiBNaWdyYXRpb24gZGF0YSBj
YW4gYmUgc3BsaXQgaW50byB0d28gcGFydHMgLSB0aGF0IHdoaWNoIGlzIGludmFyaWFudCBvZgo+
IGd1ZXN0IGV4ZWN1dGlvbiwgYW5kIHRoYXQgd2hpY2ggaXMgbm90LiAgU2VwYXJhdGUgdGhlc2Ug
dHdvIHdpdGggdGhlCj4gU1RBVElDX0RBVEFfRU5EIHJlY29yZC4KPiAKPiBUaGUgc2hvcnQgdGVy
bSwgd2Ugd2FudCB0byBtb3ZlIHRoZSB4ODYgQ1BVIFBvbGljeSBkYXRhIGludG8gdGhlIHN0cmVh
bS4KPiBJbiB0aGUgbG9uZ2VyIHRlcm0sIHdlIHdhbnQgdG8gcHJvdmlzaW9uYWxseSBzZW5kIHRo
ZSBzdGF0aWMgZGF0YSBvbmx5Cj4gdG8gdGhlIGRlc3RpbmF0aW9uIGFzIGEgbW9yZSByb2J1c3Qg
Y29tcGF0aWJpbGl0eSBjaGVjay4gIEluIGJvdGggY2FzZXMsCj4gd2Ugd2lsbCB3YW50IGEgY2Fs
bGJhY2sgaW50byB0aGUgaGlnaGVyIGxldmVsIHRvb2xzdGFjay4KPiAKPiBNYW5kYXRlIHRoZSBw
cmVzZW5jZSBvZiB0aGUgU1RBVElDX0RBVEFfRU5EIHJlY29yZCwgYW5kIGRlY2xhcmUgdGhpcyB2
MywKPiBhbG9uZyB3aXRoIGluc3RydWN0aW9ucyBmb3IgaG93IHRvIGNvbXBhdGlibHkgaW50ZXJw
cmV0IGEgdjIgc3RyZWFtLgoKQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5j
aXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

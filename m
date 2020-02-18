Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAB016292B
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 16:17:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j44YJ-0005c7-BR; Tue, 18 Feb 2020 15:12:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=171L=4G=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j44YH-0005bE-NH
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 15:12:45 +0000
X-Inumbo-ID: 1d169737-5261-11ea-81ab-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d169737-5261-11ea-81ab-12813bfff9fa;
 Tue, 18 Feb 2020 15:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582038765;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=enMa0/KV35gh4QNrZ+NrF7uZCy4zOnq5RwLo3XstGjI=;
 b=VfvxMk43DgSYD3n7KDXfx/Hb6KwPYH3est4SyXI+PcpRBz5CwVqm3dL8
 arQaj5nVP/qnho8CIOBGl/ah/RwJBQUVTK9ELF8PirK+ESjRlgzHLk2ix
 YdKtXmlYSdcxQLWhoSVuRNQhSxSTpvB/UK5yv/rWgD14VFKfo2s/Nlrh+ M=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: UIdn06XB5+W2Uc/FrLGvYlnaD2uQdP20l7gywTAK6Qe6O+riTEdKX57V52gnuJZdaOqbvdKMeX
 sB1NwpfswaU+CSe5xC+BnurBl4u90xH7MwC7pYPAEOVaZnbzs0pGoLk/pQCn+mKFPDlVOEHSML
 /iAQjR1a276XP+b7czyAMKN3KPkyN7hN+pHoQubMmD8TS7xAIVoYa4zp4HqYu2TTucVutcW5ha
 NQS2BCVD2gif+xvZ4SyuOlgxv7pxy01mqSYSGfyjcknOpiZS/3we7xMTE88KD4bsVRJAhWvTMl
 9kk=
X-SBRS: 2.7
X-MesageID: 12984490
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,456,1574139600"; d="scan'208";a="12984490"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24139.65257.426159.314189@mariner.uk.xensource.com>
Date: Tue, 18 Feb 2020 15:12:41 +0000
To: Pawel Marczewski <pawel@invisiblethingslab.com>
In-Reply-To: <fdc00be9-11c9-ffbf-af4f-fa22baed9d42@invisiblethingslab.com>
References: <fdc00be9-11c9-ffbf-af4f-fa22baed9d42@invisiblethingslab.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] Race condition in console_available callback?
 (libvirt + libxl + xenconsoled)
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
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF3ZWwgTWFyY3pld3NraSB3cml0ZXMgKCJbWGVuLWRldmVsXSBSYWNlIGNvbmRpdGlvbiBpbiBj
b25zb2xlX2F2YWlsYWJsZSBjYWxsYmFjaz8gKGxpYnZpcnQgKyBsaWJ4bCArIHhlbmNvbnNvbGVk
KSIpOgo+IEkgYW0gdHJ5aW5nIHRvIGRlYnVnIGFuIGlzc3VlIGluIFF1YmVzT1Mgd2hlcmUgYSBk
b21haW4gY3JlYXRlZCBieQo+IGxpYnZpcnQgb2Z0ZW4gZG9lcyBub3QgaGF2ZSBpbmZvcm1hdGlv
biBzdG9yZWQgYWJvdXQgdGhlIGNvbnNvbGUgVFRZIHBhdGguCgpIaS4gIE1hcmVrIGRyZXcgbXkg
YXR0ZW50aW9uIHRvIHRoaXMuCgo+IFRoZSByZWxldmFudCBwYXJ0IG9mIGxpYnZpcnQgY3JlYXRl
cyBhIGRvbWFpbiB1c2luZwo+IGxpYnhsX2RvbWFpbl9jcmVhdGVfbmV3KCkgYW5kIHJlZ2lzdGVy
cyBhIGNhbGxiYWNrIChhb3BfY29uc29sZV9ob3cpCj4gdGhhdCBpcyBzdXBwb3NlZCB0byBmaXJl
IHdoZW4gdGhlIGNvbnNvbGUgaXMgYXZhaWxhYmxlLiBUaGUgY2FsbGJhY2sKPiB0aGVuIGNhbGxz
IGxpYnhsX2NvbnNvbGVfZ2V0X3R0eSgpLCBidXQgdGhhdCBmYWlscyB3aXRoOgo+IAo+IDIwMjAt
MDEtMDYgMTE6NTI6MzAuOTUyKzAwMDA6IGxpYnhsOiBsaWJ4bC5jOjE4NTM6bGlieGxfY29uc29s
ZV9nZXRfdHR5Ogo+IHVuYWJsZSB0byByZWFkIGNvbnNvbGUgdHR5IHBhdGggYC9sb2NhbC9kb21h
aW4vNC9jb25zb2xlL3R0eSc6IFJlc291cmNlCj4gdGVtcG9yYXJpbHkgdW5hdmFpbGFibGUKCkht
bW0uCgo+IEJhc2VkIG9uIG15IHJlYWRpbmcgb2YgdGhlIGxpYnhsIGNvZGUsIGl0J3Mgc3VwcG9z
ZWQgdG8gc2V0IHRoZSBwYXRoIGluCj4geGVuc3RvcmUgYW5kIHRoZW4gY2FsbCB0aGUgY29uc29s
ZV9hdmFpbGFibGUgY2FsbGJhY2ssIGJ1dCBvbmx5IGlmIHRoZQo+IGJvb3Rsb2FkZXIgaXMgY29u
ZmlndXJlZC4gT3RoZXJ3aXNlLCB3ZSBjYWxsIGNvbnNvbGVfYXZhaWxhYmxlIGF0IGEKPiBsYXRl
ciBwb2ludCAoaW4gZG9tY3JlYXRlX2F0dGFjaF9kZXZpY2VzKCkpIGFuZCB0aGUgcGF0aCBpbiB4
ZW5zdG9yZSBpcwo+IGJlaW5nIHNldCBieSB4ZW5jb25zb2xlZCBpbmRlcGVuZGVudGx5LgoKWWVz
LgoKPiBIb3dldmVyLCB0aGVyZSBpcyBubyBndWFyYW50ZWUgdGhhdCB4ZW5jb25zb2xlZCB3aWxs
IGRvIHRoYXQgYmVmb3JlIHdlCj4gY2FsbCBjb25zb2xlX2F2YWlsYWJsZS4gQW5kIGluZGVlZCwg
bG9va2luZyBhdCB0aGUgdHJhY2VzIGZyb20KPiB4ZW5zdG9yZWQsIHRoZSByZWFkIGFuZCB3cml0
ZSBvZiBgLi4uL2NvbnNvbGUvdHR5YCBhcmUgb3JkZXJlZCByYW5kb21seQo+IGRlcGVuZGluZyBv
biB0aGUgbWFjaGluZS4KCk9oIGRlYXIuCgo+IFNob3VsZCBsaWJ4bCB3YWl0IGZvciB0aGUgaW5m
b3JtYXRpb24gYXBwZWFyaW5nIGluICcuLi4vY29uc29sZS90dHknIGF0Cj4gdGhpcyBwb2ludD8g
UGVyaGFwcyBzaW1pbGFyIGFzIHRoZSBjb2RlIEkgc2VlIGluIHhlbmNvbnNvbGVkIGNsaWVudAo+
ICh4ZW4vdG9vbHMvY29uc29sZS9jbGllbnQuYyk/CgpZZXMsIEkgdGhpbmsgaXQgc2hvdWxkLgoK
TG9va2luZyBhdCBteSBjb3B5IG9mIGxpYnhsX2Jvb3Rsb2FkZXIuYywgSSB3b25kZXIgaWYgdGhl
IHNhbWUgcmFjZQpleGlzdHMsIGluIHNvbWUgZm9ybSwgaW4gdGhlIHdpdGgtYm9vdGxvYWRlciBj
YXNlID8gIEkgZmluZCB0aGUgY29kZQpoZXJlIGNvbmZ1c2luZyAoYW5kIHllcywgSSB3cm90ZSB0
aGUgbGlieGwgY29kZSwgYWx0aG91Z2ggSSBkaWRuJ3QKZGVzaWduIHRoZSB4ZW5jb25zb2xlZCBw
cm90b2NvbCwgd2hpY2ggaXMgcXVpdGUgb2RkKS4KCj4gSSB3b3VsZCBiZSBoYXBweSB0byB3b3Jr
IG9uIGEgcGF0Y2ggYnV0IEknbSB1bmZhbWlsaWFyIHdpdGggdGhlIHByb2plY3QKPiBzbyBJIHdh
bnQgdG8gY2hlY2sgbXkgYXNzdW1wdGlvbnMuCgpUaGF0IG1ha2VzIHNlbnNlLiAgSSBob3BlIHdo
YXQgSSBoYXZlIHNhaWQgaXMgaGVscGZ1bC4gIEZlZWwgZnJlZSB0bwpjb21lIGJhY2sgd2l0aCBt
b3JlIHF1ZXN0aW9ucyAob3IgdG8gYm90aGVyIG1lIG9uIGlyYykuCgpSZWdhcmRzLApJYW4uCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

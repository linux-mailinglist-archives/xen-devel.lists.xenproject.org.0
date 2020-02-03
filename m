Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 146B615059C
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 12:47:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyaAK-0004jO-Li; Mon, 03 Feb 2020 11:45:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UUio=3X=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iyaAJ-0004jJ-9X
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 11:45:19 +0000
X-Inumbo-ID: a5b81cec-467a-11ea-8e50-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5b81cec-467a-11ea-8e50-12813bfff9fa;
 Mon, 03 Feb 2020 11:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580730318;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vhBxMTSjNgmZ/qmX7VGA2q9Wh+YZwtmzAsePcq9snm0=;
 b=KwYSc6UkpDNfUp07zcITINGhoqmqRNTfxyH0RW3A01PHxvDnOwiLGtGa
 ohwaPDMumSqr9eZO0a1K9e9s4FsnjWbWgC7grvgf3HwKiCwMKW/kqBN4h
 QzTSfDjW+clG/OKHRziZZOdYXBnT1DLQM/SRNw0TCOlwDEcrCld5vHaEt I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HSMtSBwqtFF36mADBYK1KfQeNlnpZDMjCRK90g/7WDVs7KUVI9O3diSRqgYwdLR1ShjtciV4dF
 Ibo+8TNmJ5nn49PFO3vS0pwfpmZRApEmQdEc2kF0TvJbRdQUWhSkjFS0sJ9aM2IfFX5zGtTj9I
 NmggvWaaMJUrmkxrBMmYBkfGwGi3CS6cmQCsiJYUEu5TvGrZh5ebW20ClZsg8o5ElwB/7zXevG
 h0TSAP/QEn2k5iCC6NuYlBqO1gMT+7i+BB5DTD5ZqrFhSudk6t640tmC1jo5qUrfw1xd2KPx+w
 xek=
X-SBRS: 2.7
X-MesageID: 12012563
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,397,1574139600"; d="scan'208";a="12012563"
Date: Mon, 3 Feb 2020 11:45:09 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200203114509.GB2306@perard.uk.xensource.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200117105358.607910-10-anthony.perard@citrix.com>
 <b794460e-75a0-12e8-07e7-c3731ff7493c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b794460e-75a0-12e8-07e7-c3731ff7493c@suse.com>
Subject: Re: [Xen-devel] [XEN PATCH v2 09/12] xen/build: include
 include/config/auto.conf in main Makefile
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDI6MDY6MThQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTcuMDEuMjAyMCAxMTo1MywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiAtLS0g
YS94ZW4vTWFrZWZpbGUKPiA+ICsrKyBiL3hlbi9NYWtlZmlsZQo+ID4gQEAgLTQ5LDcgKzQ5LDcx
IEBAIGRlZmF1bHQ6IGJ1aWxkCj4gPiAgLlBIT05ZOiBkaXN0Cj4gPiAgZGlzdDogaW5zdGFsbAo+
ID4gIAo+ID4gLWJ1aWxkIGluc3RhbGw6OiBpbmNsdWRlL2NvbmZpZy9hdXRvLmNvbmYKPiA+ICsK
PiA+ICtpZm5kZWYgcm9vdC1tYWtlLWRvbmUKPiA+ICsjIHNlY3Rpb24gdG8gcnVuIGJlZm9yZSBj
YWxsaW5nIFJ1bGVzLm1rLCBidXQgb25seSBvbmNlLgo+ID4gKyMKPiA+ICsjIFRvIG1ha2Ugc3Vy
ZSB3ZSBkbyBub3QgaW5jbHVkZSAuY29uZmlnIGZvciBhbnkgb2YgdGhlICpjb25maWcgdGFyZ2V0
cwo+ID4gKyMgY2F0Y2ggdGhlbSBlYXJseSwgYW5kIGhhbmQgdGhlbSBvdmVyIHRvIHRvb2xzL2tj
b25maWcvTWFrZWZpbGUKPiA+ICsKPiA+ICtjbGVhbi10YXJnZXRzIDo9ICVjbGVhbgo+ID4gK25v
LWRvdC1jb25maWctdGFyZ2V0cyA6PSAkKGNsZWFuLXRhcmdldHMpIFwKPiA+ICsJCQkgdW5pbnN0
YWxsIGRlYnVnIGNsb2MgXAo+ID4gKwkJCSBjc2NvcGUgVEFHUyB0YWdzIE1BUCBndGFncyBcCj4g
PiArCQkJIHhlbnZlcnNpb24KPiA+ICsKPiA+ICtjb25maWctYnVpbGQJOj0KPiAKPiBJcyB0aGlz
IGFjdHVhbGx5IG5lZWRlZD8gV2hpbGUgY29ycmVjdCAoYWZhaWN0KSB0b2dldGhlciB3aXRoIHRo
ZQo+IGlmZGVmIGZ1cnRoZXIgZG93biwgSSBmaW5kIHRoaXMgYXNwZWN0IG9mIG1ha2UgYmVoYXZp
b3IgYSBsaXR0bGUKPiBjb25mdXNpbmcsIGFuZCBoZW5jZSBpdCB3b3VsZCBzZWVtIHNsaWdodGx5
IGJldHRlciBpZiB0aGVyZSB3YXMKPiBubyBlbXB0eSBkZWZpbml0aW9uIG9mIHRoaXMgc3ltYm9s
LgoKVGhhdCdzIGFjdHVhbGx5IGEgdmVyeSByZWNlbnQgY2hhbmdlIGluIExpbnV4IHNvdXJjZSBj
b2RlLiBUaGV5IHVzZWQgdG8KdXNlIGlmZXEoJChjb25maWctYnVpbGQpLDEpIGFuZCBpZmVxKCQo
Y29uZmlnLWJ1aWxkKSwwKS4gSSBjYW4gY2VydGFpbmx5CmNoYW5nZSBiYWNrIHRvIHVzZSBpZmVx
IGluc3RlYWQgb2YgaWZkZWYuCgo+ID4gK25lZWQtY29uZmlnCTo9IDEKPiAKPiBIZXJlIGFuZCBi
ZWxvdywgd291bGQgaXQgYmUgcG9zc2libGUgdG8gdXNlIHkgaW5zdGVhZCBvZiAxLCB0bwo+IG1h
dGNoIGhvdyAidHJ1ZSIgZ2V0cyBleHByZXNzZWQgaW4gdmFyaW91cyBwbGFjZXMgZWxzZXdoZXJl
Pwo+IE9yIHdvdWxkIHRoZXJlIGFnYWluIGJlIGRldmlhdGlvbi1mcm9tLUxpbnV4IGNvbmNlcm5z
PwoKSXQncyBwcm9iYWJseSBmaW5lIHRvIHVzZSAieSIuIEkgZG9uJ3QgdGhpbmsgaXQgbWF0dGVy
LCB3ZSBuZWVkIHRvIG1ha2UKcXVpdGUgYSBsb3Qgb2YgY2hhbmdlcyBjb21wYXJlIHRvIExpbnV4
IGFueXdheS4gSSdsbCB1c2UgIm4iIGZvciB0aGUKbmVnYXRpdmUuCgo+ID4gK2lmbmVxICgkKGZp
bHRlciAkKG5vLWRvdC1jb25maWctdGFyZ2V0cyksICQoTUFLRUNNREdPQUxTKSksKQo+ID4gKwlp
ZmVxICgkKGZpbHRlci1vdXQgJChuby1kb3QtY29uZmlnLXRhcmdldHMpLCAkKE1BS0VDTURHT0FM
UykpLCkKPiA+ICsJCW5lZWQtY29uZmlnIDo9Cj4gPiArCWVuZGlmCj4gPiArZW5kaWYKPiA+ICsK
PiA+ICtpZm5lcSAoJChmaWx0ZXIgY29uZmlnICVjb25maWcsJChNQUtFQ01ER09BTFMpKSwpCj4g
Cj4gSnVzdCAkKGZpbHRlciAlY29uZmlnLCAuLi4pIHN1ZmZpY2VzIGhlcmUsIGFmYWljdCwgc2lt
aWxhciB0bwo+IGFib3ZlICIlY2xlYW4iIGFsc28gYmVpbmcgdXNlZCB0byBjb3ZlciAiY2xlYW4i
LgoKWWVzLCBJJ2xsIHJlbW92ZSB0aGUgZXh0cmEgImNvbmZpZyIuCgo+ID4gKwljb25maWctYnVp
bGQgOj0gMQo+ID4gK2VuZGlmCj4gPiArCj4gPiArZXhwb3J0IHJvb3QtbWFrZS1kb25lIDo9IDEK
PiA+ICtlbmRpZiAjIHJvb3QtbWFrZS1kb25lCj4gPiArCj4gPiAraWZkZWYgY29uZmlnLWJ1aWxk
Cj4gPiArIyA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiA+ICsjICpjb25maWcgdGFyZ2V0cyBvbmx5IC0g
bWFrZSBzdXJlIHByZXJlcXVpc2l0ZXMgYXJlIHVwZGF0ZWQsIGFuZCBkZXNjZW5kCj4gPiArIyBp
biB0b29scy9rY29uZmlnIHRvIG1ha2UgdGhlICpjb25maWcgdGFyZ2V0Cj4gPiArCj4gPiArY29u
ZmlnOiBGT1JDRQo+ID4gKwkkKE1BS0UpIC1mICQoQkFTRURJUikvdG9vbHMva2NvbmZpZy9NYWtl
ZmlsZS5rY29uZmlnIEFSQ0g9JChBUkNIKSBTUkNBUkNIPSQoU1JDQVJDSCkgSE9TVENDPSIkKEhP
U1RDQykiIEhPU1RDWFg9IiQoSE9TVENYWCkiICRACj4gPiArCj4gPiArIyBDb25maWcubWsgdHJp
ZXMgdG8gaW5jbHVkZSAuY29uZmlnIGZpbGUsIGRvbid0IHRyeSB0byByZW1ha2UgaXQKPiA+ICsl
Ly5jb25maWc6IDsKPiAKPiBUaGlzIGRpZG4ndCBleGlzdCBiZWZvcmUgLSB3aHkgaXMgaXQgbmVl
ZGVkIGFsbCBvZiB0aGUgc3VkZGVuPwoKSXQncyBiZWNhdXNlIEknbSBpbnRyb2R1Y2luZyBhIG5l
dyB0YXJnZXQgIiVjb25maWciLiBTbyB3aGVuIG1ha2UKIi1pbmNsdWRlICQoWEVOX1JPT1QpLy5j
b25maWciIChhcyBmb3VuZCBpbiBDb25maWcubWspIGl0IGNoZWNrIGlmIHRoZQpmaWxlIG5lZWRz
IHRvIGJlIHJlYnVpbHQsIGFuZCBmaW5kICVjb25maWcgYW5kIHRodXMgcnVuIGtjb25maWcgdG8g
YnVpbGQKLmNvbmZpZy4KCkN1cnJlbnRseSwgTWFrZWZpbGUgbGlzdCBhbGwgdGhlIHRhcmdldHMg
dGhhdCBuZWVkcyB0byBiZSBidWlsdCB3aXRoCmtjb25maWcuCgo+ID4gKyVjb25maWc6IEZPUkNF
Cj4gPiArCSQoTUFLRSkgLWYgJChCQVNFRElSKS90b29scy9rY29uZmlnL01ha2VmaWxlLmtjb25m
aWcgQVJDSD0kKEFSQ0gpIFNSQ0FSQ0g9JChTUkNBUkNIKSBIT1NUQ0M9IiQoSE9TVENDKSIgSE9T
VENYWD0iJChIT1NUQ1hYKSIgJEAKPiA+ICsKPiA+ICtlbHNlICMgIWNvbmZpZy1idWlsZAo+ID4g
Kwo+ID4gK2lmZGVmIG5lZWQtY29uZmlnCj4gPiAraW5jbHVkZSBpbmNsdWRlL2NvbmZpZy9hdXRv
LmNvbmYKPiA+ICsjIFJlYWQgaW4gZGVwZW5kZW5jaWVzIHRvIGFsbCBLY29uZmlnKiBmaWxlcywg
bWFrZSBzdXJlIHRvIHJ1biBzeW5jY29uZmlnIGlmCj4gPiArIyBjaGFuZ2VzIGFyZSBkZXRlY3Rl
ZC4KPiA+ICtpbmNsdWRlIGluY2x1ZGUvY29uZmlnL2F1dG8uY29uZi5jbWQKPiA+ICsKPiA+ICsj
IEFsbG93IHBlb3BsZSB0byBqdXN0IHJ1biBgbWFrZWAgYXMgYmVmb3JlIGFuZCBub3QgZm9yY2Ug
dGhlbSB0byBjb25maWd1cmUKPiA+ICskKEtDT05GSUdfQ09ORklHKToKPiA+ICsJJChNQUtFKSAt
ZiAkKEJBU0VESVIpL3Rvb2xzL2tjb25maWcvTWFrZWZpbGUua2NvbmZpZyBBUkNIPSQoQVJDSCkg
U1JDQVJDSD0kKFNSQ0FSQ0gpIEhPU1RDQz0iJChIT1NUQ0MpIiBIT1NUQ1hYPSIkKEhPU1RDWFgp
IiBkZWZjb25maWcKPiA+ICsKPiA+ICsjIFRoZSBhY3R1YWwgY29uZmlndXJhdGlvbiBmaWxlcyB1
c2VkIGR1cmluZyB0aGUgYnVpbGQgYXJlIHN0b3JlZCBpbgo+ID4gKyMgaW5jbHVkZS9nZW5lcmF0
ZWQvIGFuZCBpbmNsdWRlL2NvbmZpZy8uIFVwZGF0ZSB0aGVtIGlmIC5jb25maWcgaXMgbmV3ZXIg
dGhhbgo+ID4gKyMgaW5jbHVkZS9jb25maWcvYXV0by5jb25mICh3aGljaCBtaXJyb3JzIC5jb25m
aWcpLgo+ID4gKyMKPiA+ICsjIFRoaXMgZXhwbG9pdHMgdGhlICdtdWx0aS10YXJnZXQgcGF0dGVy
biBydWxlJyB0cmljay4KPiA+ICsjIFRoZSBzeW5jY29uZmlnIHNob3VsZCBiZSBleGVjdXRlZCBv
bmx5IG9uY2UgdG8gbWFrZSBhbGwgdGhlIHRhcmdldHMuCj4gPiArJS9hdXRvLmNvbmYgJS9hdXRv
LmNvbmYuY21kOiAkKEtDT05GSUdfQ09ORklHKQo+ID4gKwkkKE1BS0UpIC1mICQoQkFTRURJUikv
dG9vbHMva2NvbmZpZy9NYWtlZmlsZS5rY29uZmlnIEFSQ0g9JChBUkNIKSBTUkNBUkNIPSQoU1JD
QVJDSCkgSE9TVENDPSIkKEhPU1RDQykiIEhPU1RDWFg9IiQoSE9TVENYWCkiIHN5bmNjb25maWcK
PiAKPiBQcmV2aW91c2x5IHRoZSB0YXJnZXQgcGF0dGVybiB3YXMgaW5jbHVkZS9jb25maWcvJS5j
b25mLiBJcyB0aGVyZSBhCj4gcGFydGljdWxhciByZWFzb24gZm9yIHRoZSBzd2l0Y2g/CgpUaGF0
IGNoYW5nZSB3YXMgbmVlZGVkIGluIExpbnV4IGJlY2F1c2UgdGhlIGZ1bGwgdGFyZ2V0IGlzOgog
ICAgJS9hdXRvLmNvbmYgJS9hdXRvLmNvbmYuY21kICUvdHJpc3RhdGUuY29uZjoKQnV0IHNpbmNl
IHdlIGRvbid0IG5lZWQgdHJpc3RhdGUuY29uZiBpbiBYZW4sIEkgY2FuIGdvIGJhY2sgdG8gd2hh
dCB3ZSBoYXZlLgoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

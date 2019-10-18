Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E7DDCAA6
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 18:14:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLUqL-0004gO-Nz; Fri, 18 Oct 2019 16:11:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6/2k=YL=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iLUqK-0004gJ-6E
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 16:11:08 +0000
X-Inumbo-ID: e3c1ca64-f1c1-11e9-93f9-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3c1ca64-f1c1-11e9-93f9-12813bfff9fa;
 Fri, 18 Oct 2019 16:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571415066;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IR/lUiClsaQcj3tRY2gNXun4kFllLrzQRAZSZvzSJkc=;
 b=Xhtg7mKkZ5pY1HZZqxDu07ibmXAW0K/x38qclLUNyISpjbgwnOfh6AbB
 Ouk470cbzUznXBvtrNZzjkbLAQAZLjLYr1DoqDtwZkjTk4wuViR5jSfaJ
 UO8lTyXlfqZmLVWTTmiZCBvXbsDEbehIKFIrU1VxLzODxO4/466SLfXWb c=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6WhrZSy041fAxh4tR18X2cLPC6CqOe/TClDXt7a6tqTJxcYqCOZwD2fCRuQOr4Uq2pveC7XFfZ
 rd1bQHCFJHN8bymMERG8MDjP+3YiPz1M7/owDTQI6hUM+hikRSVlx4NlhQ/tUCSOMs7+3hMppR
 qnYyIIzDRi9WnhaqM6KYDPg090/J9n6KDpaU5ybnC/LOZZ4h4rKV/IEHKFCz+NQr59c/4DoTm/
 DAsWIZkUDm4KbgigysTWdIc1q3+jEB3B2tkMs3zhwqFJt8ghFZBh5wAVvVt9raw++8dCV9FFlg
 QsY=
X-SBRS: 2.7
X-MesageID: 7398999
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,312,1566878400"; 
   d="scan'208";a="7398999"
Date: Fri, 18 Oct 2019 17:11:03 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Chao Gao <chao.gao@intel.com>
Message-ID: <20191018161103.GI1138@perard.uk.xensource.com>
References: <20190930172327.784520-1-anthony.perard@citrix.com>
 <20190930172327.784520-3-anthony.perard@citrix.com>
 <20191001103522.GG1163@perard.uk.xensource.com>
 <d12ee001-7f8e-4482-2a78-9cb1fd2d7530@eikelenboom.it>
 <20191014150341.GA12156@gao-cwp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191014150341.GA12156@gao-cwp>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [PATCH 2/2] libxl_pci: Fix guest shutdown with PCI
 PT attached
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
Cc: Sander Eikelenboom <linux@eikelenboom.it>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMTE6MDM6NDNQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gT24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDY6MTM6NDNQTSArMDIwMCwgU2FuZGVyIEVpa2Vs
ZW5ib29tIHdyb3RlOgo+ID5IaSBBbnRob255IC8gQ2hhbywKPiA+Cj4gPkkgaGF2ZSB0byBjb21l
IGJhY2sgdG8gdGhpcywgYSBiaXQgYmVjYXVzZSBwZXJoYXBzIHRoZXJlIGlzIGFuIHVuZGVybHlp
bmcgaXNzdWUuCj4gPldoaWxlIGl0IGVhcmxpZXIgb2NjdXJyZWQgdG8gbWUgdGhhdCB0aGUgVk0g
dG8gd2hpY2ggSSBwYXNzZWQgdGhyb3VnaCBtb3N0IHBjaS1kZXZpY2VzIAo+ID4oOCB0byBiZSBl
eGFjdCkgYmVjYW1lIHZlcnkgc2xvdyB0byBzaHV0ZG93biwgYnV0IEkgIGRpZG4ndCBpbnZlc3Rp
Z2F0ZSBpdCBmdXJ0aGVyLgo+ID4KPiA+QnV0IGFmdGVyIHlvdSBjb21taXQgbWVzc2FnZXMgZnJv
bSB0aGlzIHBhdGNoIGl0IGtlcHQgbmFnZ2luZywgc28gdG9kYXkgSSBkaWQgc29tZSB0ZXN0aW5n
Cj4gPmFuZCBiaXNlY3RpbmcuCj4gPgo+ID5UaGUgZGlmZmVyZW5jZSBpbiB0ZWFyLWRvd24gdGlt
ZSBhdCBsZWFzdCBmcm9tIHdoYXQgdGhlIElPTU1VIGNvZGUgbG9ncyBpcyBxdWl0ZSBsYXJnZToK
PiA+Cj4gPnhlbi00LjEyLjAKPiA+CVNldHVwOiAJICAgIDcuNDUyIHMKPiA+CVRlYXItZG93bjog
IDcuNjI2IHMKPiA+Cj4gPnhlbi11bnN0YWJsZS1lZTcxNzA4MjJmMWZjMjA5ZjMzZmViNDdiMjY4
YmFiMzU1NDEzNTFkCj4gPglTZXR1cDogICAgICA3LjQ2OCBzCj4gPglUZWFyLWRvd246IDUwLjIz
OSBzCj4gPgo+ID5CaXNlY3Rpb24gdHVybmVkIHVwOgo+ID4JY29tbWl0IGM0YjFlZjBmODlhYTZh
NzRmYWE0NjE4Y2UzZWZlZDFkZTI0NmVjNDAKPiA+CUF1dGhvcjogQ2hhbyBHYW8gPGNoYW8uZ2Fv
QGludGVsLmNvbT4KPiA+CURhdGU6ICAgRnJpIEp1bCAxOSAxMDoyNDowOCAyMDE5ICswMTAwCj4g
PglsaWJ4bF9xbXA6IHdhaXQgZm9yIGNvbXBsZXRpb24gb2YgZGV2aWNlIHJlbW92YWwKPiA+Cj4g
PldoaWNoIG1ha2VzIG1lIHdvbmRlciBpZiB0aGVyZSBpcyBzb21ldGhpbmcgZ29pbmcgd3Jvbmcg
aW4gUWVtdSA/Cj4gCj4gSGkgU2FuZGVyLAo+IAo+IFRoYW5rcyBmb3IgeW91ciB0ZXN0aW5nIGFu
ZCB0aGUgYmlzZWN0aW9uLgo+IAo+IEkgdHJpZWQgb24gbXkgbWFjaGluZSwgdGhlIGRlc3RydWN0
aW9uIHRpbWUgb2YgYSBndWVzdCB3aXRoIDggcGFzcy10aHJ1Cj4gZGV2aWNlcyBpbmNyZWFzZWQg
ZnJvbSA0cyB0byAxMnMgYWZ0ZXIgYXBwbGllZCB0aGUgY29tbWl0IGFib3ZlLiBJbiBteQo+IHVu
ZGVyc3RhbmRpbmcsIEkgZ3Vlc3MgeW91IG1pZ2h0IGdldCB0aGUgZXJyb3IgbWVzc2FnZSAidGlt
ZWQgb3V0Cj4gd2FpdGluZyBmb3IgRE0gdG8gcmVtb3ZlLi4uIi4gVGhlcmUgbWlnaHQgYmUgc29t
ZSBpc3N1ZXMgb24geW91ciBhc3NpZ25lZAo+IGRldmljZXMnIGRyaXZlcnMuIFlvdSBjYW4gZmly
c3QgdW5iaW5kIHRoZSBkZXZpY2VzIHdpdGggdGhlaXIgZHJpdmVycyBpbgo+IFZNIGFuZCB0aGVu
IHRlYXIgZG93biB0aGUgVk0sIGFuZCBjaGVjayB3aGV0aGVyIHRoZSBWTSB0ZWFyZG93biBnZXRz
Cj4gbXVjaCBmYXN0ZXIuCgpIaSwKCkNoYW8sIEkgdGhpbmsgeW91J3ZlIHRlc3RlZCBgeGwgZGVz
dHJveWAsIGFuZCBTYW5kZXIsIEkgdGhpbmsgeW91ciBhcmUKc3BlYWtpbmcgYWJvdXQgYHhsIHNo
dXRkb3duYCBvciBzaW1wbHkgcG93ZXIgb2ZmIG9mIGEgZ3Vlc3QuIFdlbGwsIHRoZXNlCnR3byBv
cGVyYXRpb25zIGFyZSBhIGJpdCBkaWZmZXJlbnQsIG9uIGRlc3Ryb3kgdGhlIGd1ZXN0IGtlcm5l
bCBpcwpzdGlsbCBydW5uaW5nIHdoZW4gdGhlIHBjaSBkZXZpY2VzIGFyZSBiZWVuIHJlbW92ZWQs
IGJ1dCBvbiBzaHV0ZG93biB0aGUKZ3Vlc3Qga2VybmVsIGlzIGdvbmUuCgpJIGRvbid0IHRoaW5r
IHRoZXJlJ3MgYW55dGhpbmcgd3Jvbmcgd2l0aCBRRU1VIG9yIHdpdGggdGhlIGRldmljZXMsIGl0
Cmp1c3QgdGhhdCB3aGVuIHRoZSB0b29sc3RhY2sgYXNrIFFFTVUgdG8gdW5wbHVnIHRoZSBwY2kg
ZGV2aWNlLCBRRU1VCndpbGwgYXNrIHRoZSBndWVzdCBrZXJuZWwgZmlyc3QuIFNvIHRoZSBndWVz
dCBtYXkgbmV2ZXIgYWNrbm93bGVkZ2UgdGhlCnJlbW92YWwgYW5kIFFFTVUgd2lsbCBub3QgbGV0
IGdvIG9mIHRoZSBwY2kgZGV2aWNlLiBUaGVyZSBpcyBhY3R1YWxseSBhbgpvbGQgWGVuIGNvbW1p
dCBhYm91dCB0aGF0Ogo3N2ZlYTcyYjA2OGQyNWFmYjdlNjM5NDdhYmEzMmI0ODdkNzEyNGEyLCBh
bmQgYSBjb21tZW50IGluIHRoZSBjb2RlOgogICAgLyogVGhpcyBkZXBlbmRzIG9uIGd1ZXN0IG9w
ZXJhdGluZyBzeXN0ZW0gYWNrbm93bGVkZ2luZyB0aGUKICAgICAqIFNDSSwgaWYgaXQgZG9lc24n
dCByZXNwb25kIGluIHRpbWUgdGhlbiB3ZSBtYXkgd2lzaCB0bwogICAgICogZm9yY2UgdGhlIHJl
bW92YWwuICovCgoKPiBBbnRob255ICYgV2VpLAo+IAo+IFRoZSBjb21taXQgYWJvdmUgYmFzaWNh
bGx5IHNlcmlhbGl6ZXMgYW5kIHN5bmNocm9uaXplcyBkZXRhY2hpbmcKPiBhc3NpZ25lZCBkZXZp
Y2VzIGFuZCB0aHVzIGluY3JlYXNlcyBWTSB0ZWFyZG93biB0aW1lIHNpZ25pZmljYW50bHkgaWYK
PiB0aGVyZSBhcmUgbXVsdGlwbGUgYXNzaWduZWQgZGV2aWNlcy4gVGhlIGNvbW1pdCBhaW1lZCB0
byBhdm9pZCBxZW11J3MKPiBhY2Nlc3MgdG8gUENJIGNvbmZpZ3VyYXRpb24gc3BhY2UgY29pbmNp
ZGluZyB3aXRoIHRoZSBkZXZpY2UgcmVzZXQKPiBpbml0aWF0ZWQgYnkgeGwgKHdoaWNoIGlzIG5v
dCBkZXNpcmVkIGFuZCBpcyBleGFjdGx5IHRoZSBjYXNlIHdoaWNoCj4gdHJpZ2dlcnMgdGhlIGFz
c2VydGlvbiBpbiBYZW4gWzFdKS4gSSBwZXJzb25hbGx5IGluc2lzdCB0aGF0IHhsIHNob3VsZAo+
IHdhaXQgZm9yIERNJ3MgY29tcGxldGlvbiBvZiBkZXZpY2UgZGV0YWNoaW5nLiBPdGhlcndpc2Us
IGJlc2lkZXMgWGVuCj4gcGFuaWMgKHdoaWNoIGNhbiBiZSBmaXhlZCBpbiBhbm90aGVyIHdheSks
IGluIHRoZW9yeSwgc3VjaCBzdWRkZW4KPiB1bmF3YXJlZCBkZXZpY2UgcmVzZXQgbWlnaHQgY2F1
c2UgYSBkaXNhc3RlciAoZS5nLiBkYXRhIGxvc3MgZm9yIGEKPiBzdG9yYWdlIGRldmljZSkuCj4g
Cj4gWzFdOiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRl
dmVsLzIwMTktMDkvbXNnMDMyODcuaHRtbAo+IAo+IEJ1dCBjb25zaWRlcmluZyBmYXN0IGNyZWF0
aW9uIGFuZCB0ZWFyZG93biBpcyBhbiBpbXBvcnRhbnQgYmVuZWZpdCBvZgo+IHZpcnR1YWxpemF0
aW9uLCBJIGFtIG5vdCBzdXJlIGhvdyB0byBkZWFsIHdpdGggdGhlIHNpdHVhdGlvbi4gQW55d2F5
LAo+IHlvdSBjYW4gbWFrZSB0aGUgZGVjaXNpb24uIFRvIGZpeCB0aGUgcmVncmVzc2lvbiBvbiBW
TSB0ZWFyZG93biwgd2UgY2FuCj4gcmV2ZXJ0IHRoZSBjb21taXQgYnkgcmVtb3ZpbmcgdGhlIHRp
bWVvdXQgbG9naWMuCj4gCj4gV2hhdCdzIHlvdXIgb3Bpbmlvbj8KCkl0IHByb2JhYmx5IGEgZ29v
ZCBpZGVhIHRvIHdhaXQgYSBiaXQgdW50aWwgUUVNVSBoYXMgZGV0YWNoIHRoZSBkZXZpY2UuCkZv
ciBjYXNlcyB3aGVyZSBRRU1VIHdpbGwgbmV2ZXIgZGV0YWNoIHRoZSBkZXZpY2UgKHRoZSBndWVz
dCBrZXJuZWwgaXMKc2h1dGRvd24pLCB3ZSBjb3VsZCByZWR1Y2UgdGhlIHRpbWVvdXQuIEZvbGxv
d2luZyBteSBjaGFuZ2VzIHRvIHBjaQpwYXNzdGhyb3VnaCBoYW5kbGluZyBpbiBsaWJ4bCwgdGhl
IHRpbWVvdXQgaXMgMTBzIGZvciBvbmUgZGV2aWNlIChhbmQKcHJvYmFibHkgMTBzIGZvciBtYW55
OyBJIGRvbid0IHRoaW5rIGxpYnhsIHdpbGwgZXZlbiBhc2sgcWVtdSB0byByZW1vdmUKdGhlIG90
aGVyIGRldmljZXMgaWYgdGhlIGZpcnN0IG9uZSB0aW1lb3V0KS4KClNvLCBtYXliZSB3ZSBjb3Vs
ZCB3YWl0IGZvciA1cyBmb3IgUUVNVSB0byBkZXRhY2ggdGhlIHBjaSBkZXZpY2U/IEFzCnBhc3Qg
dGhhdCB0aW1lLCBpdCB3aWxsIHByb2JhYmx5IG5ldmVyIGhhcHBlbi4gVGhpcyBzdGlsbCBtZWFu
IGFib3V0ICs1cwp0byB0ZWFyLWRvd24gY29tcGFyZSB0byBwcmV2aW91cyByZWxlYXNlcy4gKE9y
IG1heWJlICs1cyBwZXIgZGV2aWNlIGlmCndlIGhhdmUgdG8gZG8gb25lIGRldmljZSBhdCBhIHRp
bWUuKQoKVGhlcmUgYXJlIG90aGVyIGlzc3VlcyB3aXRoIGhhbmRsaW5nIG11bHRpcGxlIHBjaSBw
YXNzdGhyb3VnaCBkZXZpY2VzLApzbyBJIGRvbid0IGhhdmUgcGF0Y2hlcyB5ZXQuCgpDaGVlcnMs
CgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=

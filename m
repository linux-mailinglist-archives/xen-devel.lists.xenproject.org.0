Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B88188D51
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 19:37:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEH3X-000499-2G; Tue, 17 Mar 2020 18:35:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iujj=5C=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jEH3V-000494-JF
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 18:35:09 +0000
X-Inumbo-ID: 072e9ddc-687e-11ea-92cf-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 072e9ddc-687e-11ea-92cf-bc764e2007e4;
 Tue, 17 Mar 2020 18:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584470109;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Lot8k76Yl67ZLO+kKkBZJ4XN/11TFQFAwTVO07DL9/s=;
 b=XdwyXoZ4XPc2UDPZKUaoBKP9OfW1nfMfFtVR8Yw2V5OgY6iTa3+K92YQ
 ALp/CZCfdes83T3k/czYlXVWyhlfrcOlzrdmMfplSHzh3pClukF4B27xs
 YIFXzS0V7rwaYB4ELqicZvsI59Yo/64TOMkVyK2i9BCCwOJsQD7JnpfQn I=;
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
IronPort-SDR: Srwdri2wxKUKMCtYE6K11l4vLnIabu5iEBk3BjdqNUl0/KM6MtWssQ1BtuMoGZh1Y13gSe7XSN
 mKK8m8IGEyyndfAwXE+25Ifybogv7SIWrsHtm/w+HE1VccR4wN3Bc8mLxCFVWy/XV/pwPE7lqv
 nC71jNtoMSLJbsIKVz6xQYIgBVD8VEbi9v6VGWr+DBo6Nkf/jel3O8hQQYtTwmCL8gMenp7Fbi
 UAl2ErsCdxnH4lspQmyQD4XRzgBcfmAPM1QxfzqJeU3+fuQqFkPi6Uadu6WcVezvOrKV+OfWzR
 tdk=
X-SBRS: 2.7
X-MesageID: 14341282
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,565,1574139600"; d="scan'208";a="14341282"
Date: Tue, 17 Mar 2020 18:35:03 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200317183503.GB4088@perard.uk.xensource.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-16-anthony.perard@citrix.com>
 <dd7bf903-6f51-7610-3963-2b572a6bde49@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dd7bf903-6f51-7610-3963-2b572a6bde49@suse.com>
Subject: Re: [Xen-devel] [XEN PATCH v3 15/23] xen/build: have the root
 Makefile generates the CFLAGS
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXIgMDQsIDIwMjAgYXQgMDQ6MDA6NTJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjYuMDIuMjAyMCAxMjozMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiBAQCAt
MTEzLDYgKzExNSw2NCBAQCAkKEtDT05GSUdfQ09ORklHKToKPiA+ICtBRkxBR1MgKz0gLURfX0FT
U0VNQkxZX18KPiA+ICsKPiA+ICtDRkxBR1MgKz0gJChDRkxBR1MteSkKPiAKPiBJIGNhbid0IHNl
ZW0gdG8gYmUgYWJsZSB0byBzcG90IGEgc2ltaWxhciBsaW5lIGZvciBBRkxBR1MuCgpJIGRpZG4n
dCBhZGQgYW55IGJlY2F1c2UgaXQgd2Fzbid0IG5lY2Vzc2FyeS4KCj4gPiBAQCAtMTA3LDcgKzY1
LDcgQEAgJChmb3JlYWNoIG8sJChmaWx0ZXItb3V0ICUvLCQob2JqLXkpICQob2JqLWJpbi15KSAk
KGV4dHJhLXkpKSwkKGV2YWwgJChjYWxsIGdlbmQKPiA+ICBzdWJkaXIteSA6PSAkKHN1YmRpci15
KSAkKGZpbHRlciAlLywgJChvYmoteSkpCj4gPiAgb2JqLXkgICAgOj0gJChwYXRzdWJzdCAlLywg
JS9idWlsdF9pbi5vLCAkKG9iai15KSkKPiA+ICAKPiA+IC0kKGZpbHRlciAlLmluaXQubywkKG9i
ai15KSAkKG9iai1iaW4teSkgJChleHRyYS15KSk6IENGTEFHUyArPSAtRElOSVRfU0VDVElPTlNf
T05MWQo+ID4gKyQoZmlsdGVyICUuaW5pdC5vLCQob2JqLXkpICQob2JqLWJpbi15KSAkKGV4dHJh
LXkpKTogQ0ZMQUdTLXkgKz0gLURJTklUX1NFQ1RJT05TX09OTFkKPiAKPiBXaGlsZSBpbiB0aGUg
ZGVzY3JpcHRpb24geW91IHNheSAiV2UgY2FuJ3QgdXNlIENGTEFHUyBpbgo+IHN1YmRpcmVjdG9y
aWVzIHRvIGFkZCBmbGFncyB0byBwYXJ0aWN1bGFyIHRhcmdldHMsIC4uLiIsIGl0Cj4gcmVtYWlu
cyB1bmNsZWFyIHRoZXJlIHdoeSB0aGF0IGlzLCBhbmQgaGVuY2Ugd2h5IGNoYW5nZXMgbGlrZQo+
IHRoaXMgb25lIGFyZSBuZWNlc3NhcnkuIElmIHRoaXMgaXMgYSByZXN0cmljdGlvbiB0aGF0J3Mg
Z29pbmcgdG8KPiByZW1haW4sIHRoaXMgYWxzbyBuZWVkcyB3cml0aW5nIGRvd24gaW4gYSBwcm9t
aW5lbnQgcGxhY2UuIEFmdGVyCgpZZXMsIEkgc2hvdWxkIHByb2JhYmx5IHN0YXJ0IHdyaXRpbmcg
c29tZSBkb2N1bWVudGF0aW9uLCBwcm9iYWJseQpmb2xsb3dpbmcgdGhlIGtpbmQgb2YgZG9jdW1l
bnRhdGlvbiB0aGF0IExpbnV4IGhhcyBmb3Iga2J1aWxkLCBhbmQgSQpjb3VsZCBwdXQgdGhhdCBp
biBkb2NzL21pc2MsIGFsb25nIHNpZGUgdGhlIGtjb25maWcgZG9jLiBUaGF0IHByb2JhYmx5Cm5v
dCBhIHByb21pbmVudCBwbGFjZSwgYnV0IEkgZG9uJ3Qga25vdyBpZiB0aGVyZSdzIGEgYmV0dGVy
IHBsYWNlLgoKPiBhbGwgaWYgKGZvciBleGFtcGxlKSBzcGVjaWFsIGNvbXBpbGVyIG9wdGlvbnMg
YXJlIG5lZWRlZCwgQ0ZMQUdTCj4gd291bGQgYmUgdGhlIG5hdHVyYWwgdGhpbmcgb25lIHdvdWxk
IHdhbnQgdG8gYWx0ZXIuIChFdmVuIGJldHRlcgo+IGlmIHdyb25nIHBsYXlpbmcgd2l0aCBDRkxB
R1MgY291bGQgYmUgZGV0ZWN0ZWQgYW5kIGF0IGxlYXN0Cj4gd2FybmVkIGFib3V0LCBidXQgSSdt
IGNvbXBsZXRlbHkgdW5jbGVhciBvbiBob3cgZmVhc2libGUgdGhpcwo+IHdvdWxkIGJlLikKClRo
ZSBpc3N1ZSB3aXRoIHRoZSBDRkxBR1MgdmFyaWFibGUgaXMgdGhhdCBpdCBpcyBzdGlsbCBzZXQg
YnkgQ29uZmlnLm1rCndoaWNoIFJ1bGVzLm1rIGluY2x1ZGVzLgpJIGd1ZXNzIEkgY291bGQgcmVz
ZXQgdGhlIENGTEFHUyB2YXJpYWJsZSBpbiBSdWxlcy5tayBhZnRlciBsb2FkaW5nCkNvbmZpZy5t
aywgYW5kIGFsbG93IGl0IHRvIGJlIHVzZWQuIEkgd2FudCB0byBzdG9wIGluY2x1ZGluZyBDb25m
aWcubWsKaW4gUnVsZXMubWsgYXQgc29tZSBwb2ludCBhbnl3YXkuCgpJIGRvbid0IHRoaW5rIGl0
J3MgcG9zc2libGUgdG8gY2hlY2sgaWYgYSB2YXJpYWJsZSBoYXMgYmVlbiBhbHRlcmVkLApiZWNh
dXNlIGl0IGNvdWxkIGJlIGNoYW5nZWQgZm9yIGEgc3BlY2lmaWMgdGFyZ2V0IHdoZXJlIGl0J3Mg
bm90IGVhc3kgdG8KY2hlY2suCgo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9SdWxlcy5t
ayBiL3hlbi9hcmNoL2FybS9SdWxlcy5tawo+ID4gaW5kZXggMDIyYTNhNmY4MmJhLi5lNjlkZTI5
YmIyZDEgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vUnVsZXMubWsKPiA+ICsrKyBiL3hl
bi9hcmNoL2FybS9SdWxlcy5tawo+ID4gQEAgLTEsOTMgKzAsMCBAQAo+IAo+IEFzIHBlciB0aGUg
aGVhZGVyIGhlcmUgeW91J3JlIHVzaW5nIGdpdC4gQ2FuIHlvdSBwbGVhc2UgYXJyYW5nZSBmb3IK
PiB0aGlzIGZpbGUgbW92ZW1lbnQgKHRvIGFyY2gubWssIGFuZCBhbHNvIGZvciB4ODYpIHRvIGFj
dHVhbGx5IGJlCj4gZXhwcmVzc2VkIGhlcmUgYXMgYSByZW5hbWUsIGkuZS4gc3VjaCB0aGF0IG9u
ZSBjYW4gc2VlIHdoYXQgLSBpZgo+IGFueXRoaW5nIC0gY2hhbmdlcz8KClRoYXQgc2hvdWxkIGJl
IHBvc3NpYmxlLCBJJ2xsIHRyeSB0byByZW1lbWJlciB0byBhZGQgdGhlIHJpZ2h0IG9wdGlvbnMu
CgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=

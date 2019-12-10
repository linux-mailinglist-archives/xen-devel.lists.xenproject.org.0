Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C7B1184D3
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 11:19:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iecZS-00076U-7N; Tue, 10 Dec 2019 10:16:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=czbI=2A=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iecZQ-00076P-QB
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 10:16:44 +0000
X-Inumbo-ID: 299e2b2a-1b36-11ea-8914-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 299e2b2a-1b36-11ea-8914-12813bfff9fa;
 Tue, 10 Dec 2019 10:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575973003;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Lvaoe6PF5ne+O8eFrYv6xylYoM5pzWb0Os8/rpg2yvA=;
 b=YhKcYfw1COcDVrvXdW3v49matTZDs198LopZkLCY5dI9T9g28yXlLlvz
 jymCH+GIyIY90y8mlN2sNwtnfLE8ODzUg44fUW3qzEkpUtWyzWwvkdCoI
 QOEhqGDMzGKXSpfJ2A7C+lQdYXmx2tQqE2TWRuapZcyXVdgK4yqqKY2GY 0=;
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
IronPort-SDR: 9IDqAWxfl6GB4MpZN7qCOk4M8hOVCyJJZkZFstv0Y6xsVz0PCZ38GaHuQOX5FR85MixU1ffCGh
 /5SCEXREeeZ1a+dcW9UMQlQ2yA9Xzlpn9OCktFGlHD8z3RhdrKQDW+92zEybK098kEsSgz6pjx
 qxHnI3A2O+cQ80dmJO9zL2Vu5ILc06RzKVhahdm0WUSb4OFAL0l+AN97cR9atUpsQNWwF2+N7p
 fSbSkb8noLO9/CSxP0FQYUtd54zwI+cuWxdgrbok8S3tAe5Wf/EsGhYevCIugfnc13VhL3sY1N
 feM=
X-SBRS: 2.7
X-MesageID: 9802387
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,299,1571716800"; 
   d="scan'208";a="9802387"
Date: Tue, 10 Dec 2019 11:16:35 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: SeongJae Park <sj38.park@gmail.com>
Message-ID: <20191210101635.GD980@Air-de-Roger>
References: <20191210080628.5264-1-sjpark@amazon.de>
 <20191210080628.5264-2-sjpark@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210080628.5264-2-sjpark@amazon.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v5 1/2] xenbus/backend: Add memory pressure
 handler callback
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
Cc: axboe@kernel.dk, sjpark@amazon.com, konrad.wilk@oracle.com,
 pdurrant@amazon.com, SeongJae Park <sjpark@amazon.de>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMTAsIDIwMTkgYXQgMDg6MDY6MjdBTSArMDAwMCwgU2VvbmdKYWUgUGFyayB3
cm90ZToKPiBHcmFudGluZyBwYWdlcyBjb25zdW1lcyBiYWNrZW5kIHN5c3RlbSBtZW1vcnkuICBJ
biBzeXN0ZW1zIGNvbmZpZ3VyZWQKPiB3aXRoIGluc3VmZmljaWVudCBzcGFyZSBtZW1vcnkgZm9y
IHRob3NlIHBhZ2VzLCBpdCBjYW4gY2F1c2UgYSBtZW1vcnkKPiBwcmVzc3VyZSBzaXR1YXRpb24u
ICBIb3dldmVyLCBmaW5kaW5nIHRoZSBvcHRpbWFsIGFtb3VudCBvZiB0aGUgc3BhcmUKPiBtZW1v
cnkgaXMgY2hhbGxlbmdpbmcgZm9yIGxhcmdlIHN5c3RlbXMgaGF2aW5nIGR5bmFtaWMgcmVzb3Vy
Y2UKPiB1dGlsaXphdGlvbiBwYXR0ZXJucy4gIEFsc28sIHN1Y2ggYSBzdGF0aWMgY29uZmlndXJh
dGlvbiBtaWdodCBsYWNrIGEKCnMvbGFjayBhL2xhY2svCgo+IGZsZXhpYmlsaXR5Lgo+IAo+IFRv
IG1pdGlnYXRlIHN1Y2ggcHJvYmxlbXMsIHRoaXMgY29tbWl0IGFkZHMgYSBtZW1vcnkgcmVjbGFp
bSBjYWxsYmFjayB0bwo+ICd4ZW5idXNfZHJpdmVyJy4gIFVzaW5nIHRoaXMgZmFjaWxpdHksICd4
ZW5idXMnIHdvdWxkIGJlIGFibGUgdG8gbW9uaXRvcgo+IGEgbWVtb3J5IHByZXNzdXJlIGFuZCBy
ZXF1ZXN0IHNwZWNpZmljIGRldmljZXMgb2Ygc3BlY2lmaWMgYmFja2VuZAoKcy9tb25pdG9yIGEv
bW9uaXRvci8KCj4gZHJpdmVycyB3aGljaCBjYXVzaW5nIHRoZSBnaXZlbiBwcmVzc3VyZSB0byB2
b2x1bnRhcmlseSByZWxlYXNlIGl0cwoKLi4ud2hpY2ggYXJlIGNhdXNpbmcuLi4KCj4gbWVtb3J5
Lgo+IAo+IFRoYXQgc2FpZCwgdGhpcyBjb21taXQgc2ltcGx5IHJlcXVlc3RzIGV2ZXJ5IGNhbGxi
YWNrIHJlZ2lzdGVyZWQgZHJpdmVyCj4gdG8gcmVsZWFzZSBpdHMgbWVtb3J5IGZvciBldmVyeSBk
b21haW4sIHJhdGhlciB0aGFuIGlzc3VlaW5nIHRoZQoKcy9pc3N1ZWluZy9pc3N1aW5nLwoKPiBy
ZXF1ZXN0cyB0byB0aGUgZHJpdmVycyBhbmQgdGhlIGRvbWFpbiBpbiBjaGFyZ2UuICBTdWNoIHRo
aW5ncyB3aWxsIGJlCgpJJ20gYWZyYWlkIEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgImRvbWFpbiBp
biBjaGFyZ2UiIHBhcnQgb2YgdGhpcwpzZW50ZW5jZS4KCj4gZG9uZSBpbiBhIGZ1dHVyLiAgQWxz
bywgdGhpcyBjb21taXQgZm9jdXNlcyBvbiBtZW1vcnkgb25seS4gIEhvd2V2ZXIsIGl0CgouLi4g
ZG9uZSBpbiBhIGZ1dHVyZSBjaGFuZ2UuIEFsc28gSSB0aGluayB0aGUgcGVyaW9kIGFmdGVyIG9u
bHkgc2hvdWxkCmJlIHJlbW92ZWQgaW4gb3JkZXIgdG8gdGllIGJvdGggc2VudGVuY2VzIHRvZ2V0
aGVyLgoKPiB3b3VsZCBiZSBhYmx0IHRvIGJlIGV4dGVuZGVkIGZvciBnZW5lcmFsIHJlc291cmNl
cy4KCnMvYWJsdC9hYmxlLwoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBTZW9uZ0phZSBQYXJrIDxzanBh
cmtAYW1hem9uLmRlPgo+IC0tLQo+ICBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2Jh
Y2tlbmQuYyB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrCj4gIGluY2x1ZGUveGVuL3hlbmJ1
cy5oICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDMyIGlu
c2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19w
cm9iZV9iYWNrZW5kLmMgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tlbmQu
Ywo+IGluZGV4IGIwYmVkNGZhZjQ0Yy4uNWE1YmEyOWUzOWRmIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfYmFja2VuZC5jCj4gKysrIGIvZHJpdmVycy94ZW4v
eGVuYnVzL3hlbmJ1c19wcm9iZV9iYWNrZW5kLmMKPiBAQCAtMjQ4LDYgKzI0OCwzNCBAQCBzdGF0
aWMgaW50IGJhY2tlbmRfcHJvYmVfYW5kX3dhdGNoKHN0cnVjdCBub3RpZmllcl9ibG9jayAqbm90
aWZpZXIsCj4gIAlyZXR1cm4gTk9USUZZX0RPTkU7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbnQgeGVu
YnVzX2JhY2tlbmRfcmVjbGFpbShzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEpCj4gK3sK
PiArCXN0cnVjdCB4ZW5idXNfZHJpdmVyICpkcnY7CgpOZXdsaW5lIGFuZCBjb25zdC4KCj4gKwlp
ZiAoIWRldi0+ZHJpdmVyKQo+ICsJCXJldHVybiAtRU5PRU5UOwo+ICsJZHJ2ID0gdG9feGVuYnVz
X2RyaXZlcihkZXYtPmRyaXZlcik7Cj4gKwlpZiAoZHJ2ICYmIGRydi0+cmVjbGFpbSkKPiArCQlk
cnYtPnJlY2xhaW0odG9feGVuYnVzX2RldmljZShkZXYpKTsKCllvdSBzZWVtIHRvIGNvbXBsZXRl
bHkgaWdub3JlIHRoZSByZXR1cm4gb2YgdGhlIHJlY2xhaW0gaG9vay4uLgoKPiArCXJldHVybiAw
Owo+ICt9Cj4gKwo+ICsvKgo+ICsgKiBSZXR1cm5zIDAgYWx3YXlzIGJlY2F1c2Ugd2UgYXJlIHVz
aW5nIHNocmlua2VyIHRvIG9ubHkgZGV0ZWN0IG1lbW9yeQo+ICsgKiBwcmVzc3VyZS4KPiArICov
Cj4gK3N0YXRpYyB1bnNpZ25lZCBsb25nIHhlbmJ1c19iYWNrZW5kX3Nocmlua19jb3VudChzdHJ1
Y3Qgc2hyaW5rZXIgKnNocmlua2VyLAo+ICsJCQkJc3RydWN0IHNocmlua19jb250cm9sICpzYykK
PiArewo+ICsJYnVzX2Zvcl9lYWNoX2RldigmeGVuYnVzX2JhY2tlbmQuYnVzLCBOVUxMLCBOVUxM
LAo+ICsJCQl4ZW5idXNfYmFja2VuZF9yZWNsYWltKTsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+
ICtzdGF0aWMgc3RydWN0IHNocmlua2VyIHhlbmJ1c19iYWNrZW5kX3Nocmlua2VyID0gewo+ICsJ
LmNvdW50X29iamVjdHMgPSB4ZW5idXNfYmFja2VuZF9zaHJpbmtfY291bnQsCj4gKwkuc2Vla3Mg
PSBERUZBVUxUX1NFRUtTLAo+ICt9Owo+ICsKPiAgc3RhdGljIGludCBfX2luaXQgeGVuYnVzX3By
b2JlX2JhY2tlbmRfaW5pdCh2b2lkKQo+ICB7Cj4gIAlzdGF0aWMgc3RydWN0IG5vdGlmaWVyX2Js
b2NrIHhlbnN0b3JlX25vdGlmaWVyID0gewo+IEBAIC0yNjQsNiArMjkyLDkgQEAgc3RhdGljIGlu
dCBfX2luaXQgeGVuYnVzX3Byb2JlX2JhY2tlbmRfaW5pdCh2b2lkKQo+ICAKPiAgCXJlZ2lzdGVy
X3hlbnN0b3JlX25vdGlmaWVyKCZ4ZW5zdG9yZV9ub3RpZmllcik7Cj4gIAo+ICsJaWYgKHJlZ2lz
dGVyX3Nocmlua2VyKCZ4ZW5idXNfYmFja2VuZF9zaHJpbmtlcikpCj4gKwkJcHJfd2Fybigic2hy
aW5rZXIgcmVnaXN0cmF0aW9uIGZhaWxlZFxuIik7Cj4gKwo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAg
c3Vic3lzX2luaXRjYWxsKHhlbmJ1c19wcm9iZV9iYWNrZW5kX2luaXQpOwo+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL3hlbi94ZW5idXMuaCBiL2luY2x1ZGUveGVuL3hlbmJ1cy5oCj4gaW5kZXggODY5
YzgxNmQ1ZjhjLi5jZGIwNzVlNDE4MmYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS94ZW4veGVuYnVz
LmgKPiArKysgYi9pbmNsdWRlL3hlbi94ZW5idXMuaAo+IEBAIC0xMDQsNiArMTA0LDcgQEAgc3Ry
dWN0IHhlbmJ1c19kcml2ZXIgewo+ICAJc3RydWN0IGRldmljZV9kcml2ZXIgZHJpdmVyOwo+ICAJ
aW50ICgqcmVhZF9vdGhlcmVuZF9kZXRhaWxzKShzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2KTsK
PiAgCWludCAoKmlzX3JlYWR5KShzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2KTsKPiArCXVuc2ln
bmVkICgqcmVjbGFpbSkoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldik7CgouLi4gaGVuY2UgSSB3
b25kZXIgd2h5IGl0J3MgcmV0dXJuaW5nIGFuIHVuc2lnbmVkIHdoZW4gaXQncyBqdXN0Cmlnbm9y
ZWQuCgpJTU8gaXQgc2hvdWxkIHJldHVybiBhbiBpbnQgdG8gc2lnbmFsIGVycm9ycywgYW5kIHRo
ZSByZXR1cm4gc2hvdWxkIGJlCmlnbm9yZWQuCgpBbHNvLCBJIHRoaW5rIGl0IHdvdWxkIHByZWZl
cmFibGUgZm9yIHRoaXMgZnVuY3Rpb24gdG8gdGFrZSBhbiBleHRyYQpwYXJhbWV0ZXIgdG8gZGVz
Y3JpYmUgdGhlIHJlc291cmNlIHRoZSBkcml2ZXIgc2hvdWxkIGF0dGVtcHQgdG8gZnJlZQooaWU6
IG1lbW9yeSBvciBpbnRlcnJ1cHRzIGZvciBleGFtcGxlKS4gSSdtIGhvd2V2ZXIgbm90IGFibGUg
dG8gZmluZAphbnkgZXhpc3RpbmcgTGludXggdHlwZSB0byBkZXNjcmliZSBzdWNoIHJlc291cmNl
cy4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs

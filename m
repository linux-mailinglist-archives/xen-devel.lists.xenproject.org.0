Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C389C91C34
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 07:03:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzZmS-0003Nf-19; Mon, 19 Aug 2019 05:00:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dN0c=WP=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1hzZmP-0003Na-Qg
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 05:00:29 +0000
X-Inumbo-ID: 438ba252-c23e-11e9-813a-bc764e2007e4
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 438ba252-c23e-11e9-813a-bc764e2007e4;
 Mon, 19 Aug 2019 05:00:28 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id j15so582945qtl.13
 for <xen-devel@lists.xenproject.org>; Sun, 18 Aug 2019 22:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X88DoY8D8cGDp3WAcWKv5K/WKmM//sqk19+swZGx6/o=;
 b=OoeVPQY5/NGtXbJzaWgkwFBh9/1ZfQmPCaGIfqsK6GjwT1o9xWsK02o1+jE7yVsLOD
 Abhav4Hyl+nnfIk06bz9yRD69rQ23h00qyK5Fjx9OY/DMWl8PqDss1ID6+aydpIcybC/
 BVxit2KOsEF34JLMQ7GsJWTUDr+d9rZu06CjTib6KvTaEul2nZsLct7I4Y17tkv7ok2M
 +VyTOZfeCOgKnok+WJAMAXEhkEyqL7rwinoUcprCI2k/iQZhBfRhW8UPxx3/z06zSVaG
 KsUvOk5sTOHUr4ubuaMQa24hUWOPNXL/zRjEhZvPYTp3rys+IZV48uA3lo3vCo3isayg
 LUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X88DoY8D8cGDp3WAcWKv5K/WKmM//sqk19+swZGx6/o=;
 b=tDNPYGK8ctpqg+kVnQrXPSsi0Nh7X66m3xAcGEhunZ0HyZQ+vyTeAeVtx8SGziH0t/
 bw3Uz5qPtKDm40wqQD0HSjutGO96Bo/zp9ClUm/3lOnguXnXsPd+oeJvlnMF8i32Ok4r
 LznF1u51RprOIi9rrCEbtmLhNZo7L3JxGga5TPj0xZ3qDAZ7p21ZqH+cSCeFDXR+Bb33
 Vp2xGm9QSvUkuykxDnRXFDIJbHHQEnDk4ZhPJInqMUwI8VpMbyqO9ipYU3JRVh5F5mSp
 iXbkTmKqsRPMMvVFotGf6dEefNXPXW+T4HyybS33cB3YTaxbRoLMv7KjjLJFLdFDoh3D
 82Xg==
X-Gm-Message-State: APjAAAWDCLr4yZSiwBlB4naOeolxwvzgKZhgD2yoUkaP1xB58/6UPvqO
 +xu6FMIwO6ULUlARXBpQWZvCsg6mHTE+o2p389wxwg==
X-Google-Smtp-Source: APXvYqyFjTiCzx1jOqWrhmASF/E+fVGG6vwUD38hBKVNDJ3ljS/cntHP4I1RpzHCWaRJod3x80pF9MKXRBS8QGIjazU=
X-Received: by 2002:ac8:75d9:: with SMTP id z25mr19017987qtq.207.1566190828508; 
 Sun, 18 Aug 2019 22:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <d6ba30f8-7959-57bc-3843-e11f48b52766@citrix.com>
 <CAMmSBy9ZiEU95yAK1ry_41GR0ttWTX9EEJ0bMStZaK=PrzCH7w@mail.gmail.com>
 <20190801081559.wruxck32h5bum2va@Air-de-Roger>
 <CAMmSBy9y6hHQfDgcDFmKiRw9QiRSgcxHAq6Qo=o7apTR2EuusA@mail.gmail.com>
 <20190802080540.r4e3rrv3eit5yebt@Air-de-Roger>
 <20190806160644.adqzknxdfuwz4qaz@Air-de-Roger>
 <CAMmSBy91XfNz5DfbaL8OC7v1eYp7n_EKjGgSgAH+YBALh9HM-g@mail.gmail.com>
 <20190807073534.7uoqo7q7gno2ljyl@Air-de-Roger>
 <20190812085703.363a2xsypnacdpes@Air-de-Roger>
 <CAMmSBy_CfoRuJZjHT6bXk5zG5jeb8a6m7TK6+mAKtr+3TzS-Vw@mail.gmail.com>
 <20190814080614.m32cupba4f5jdlhs@Air-de-Roger>
In-Reply-To: <20190814080614.m32cupba4f5jdlhs@Air-de-Roger>
From: Roman Shaposhnik <roman@zededa.com>
Date: Sun, 18 Aug 2019 22:00:17 -0700
Message-ID: <CAMmSBy8Pcv4eyZPOf+0hEtCA4bb9+1SSgieLcvKor63UyUK4-g@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUm9nZXIhCgpTb21lIGdvb2QgbmV3cywgc29tZSBiYWQgbmV3cyA7LSkKCkdvb2QgbmV3cyBp
cyB0aGF0IG9uIHRoZSBuZXdlciBCSU9TLCB5b3VyIG9yaWdpbmFsIHBhdGNoIHNlZW1zIHRvIHdv
cmsgZmluZS4KCklPVywgd2l0aCBuZXdlciBCSU9TOgogICAgMS4gd2l0aG91dCB5b3VyIG9yaWdp
bmFsIHBhdGNoIEkgc2VlIGdhcmJsZWQgc2NyZWVuCiAgICAyLiB3aXRoIHlvdXIgb3JpZ2luYWwg
cGF0Y2ggZXZlcnl0aGluZyBib290cyBub3JtYWxseS4KCkJhZCBuZXdzIGlzIHRoYXQgd2l0aCBv
bGRlciBCSU9TLCB5b3VyIG9yaWdpbmFsIHBhdGNoIHNlZW1zIHRvIGVpdGhlcgp3b3JrIG9yIG5v
dCBkZXBlbmRpbmcgb24gdGhlIEJJT1Mgc29tZSBvZiB0aGUgQklPUyBzZXR0aW5ncy4KCklPVywg
d2l0aCBvbGRlciBCSU9TOgogICAgMS4gd2l0aG91dCB5b3VyIG9yaWdpbmFsIHBhdGNoIEkgc2Vl
IGdhcmJsZWQgc2NyZWVuIChyZWdhcmRsZXNzIG9mCkJJT1Mgc2V0dGluZ3MpCiAgICAyLiB3aXRo
IHlvdXIgb3JpZ2luYWwgcGF0Y2ggQU5EIHJlc2V0dGluZyB0byBhIGZhY3RvcnkgZGVmYXVsdHMg
b2YKQklPUyBzZXR0aW5ncyAtLSBldmVyeXRoaW5nIGJvb3RzIG5vcm1hbGx5CiAgICAzLiB3aGVu
IEkgbG9hZCB1cCBvdXIgY3VzdG9tIHNldHRpbmdzIC0tIHRoZSBvbmx5IHRoaW5nIHRoYXQgY2Fu
CmJvb3Qgbm9ybWFsbHkgaXMgdGhlIGxhdGVzdCBwYXRjaAoKU28sIHdvdWxkIGl0IG1ha2Ugc2Vu
c2UgYW5kIGNvbW1pdCB5b3VyIG9yaWdpbmFsIHBhdGNoIGZvciBub3c/IFRoaXMKd2lsbCB1bmxv
Y2sgbWUgd2l0aCBuZXdlciBCSU9TZXMgb24gdGhlc2UgYm94ZXMuCgpBcyBmb3IgdGhlIG9sZGVy
IEJJT1NlcywgSSBzdGlsbCBmZWVsIHRoYXQgaXQgd291bGQgYmUgZ3JlYXQgZm9yIFhlbgp0byBi
b290IG1vcmUgcmVsaWFibHkgLS0gZXNwZWNpYWxseSBzaW5jZSBYZW4gNC4xMCBzZWVtcyB0byBi
ZSBkb2luZwpmaW5lIHJlZ2FyZGxlc3Mgb2YgQklPUyB2ZXJzaW9uIGFuZCBzZXR0aW5ncy4KCldo
YXQgZG8geW91IHRoaW5rPwoKQnR3LCBqdXN0IHRvIGJlIGNsZWFyIC0tIHdoZW4gSSBzYXkgeW91
ciBvcmlnaW5hbCBwYXRjaCBoZXJlJ3Mgd2hhdCBJIG1lYW46CgpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L21tL3AybS5jIGIveGVuL2FyY2gveDg2L21tL3AybS5jCmluZGV4IGZlZjk3YzgyZjYu
LjM2MDU2MTRhYWYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYworKysgYi94ZW4v
YXJjaC94ODYvbW0vcDJtLmMKQEAgLTEzNDEsNyArMTM0MSw3IEBAIGludCBzZXRfaWRlbnRpdHlf
cDJtX2VudHJ5KHN0cnVjdCBkb21haW4gKmQsCnVuc2lnbmVkIGxvbmcgZ2ZuX2wsCgogICAgIGlm
ICggIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZShwMm0tPmRvbWFpbikgKQogICAgIHsKLSAgICAgICAg
aWYgKCAhbmVlZF9pb21tdV9wdF9zeW5jKGQpICkKKyAgICAgICAgaWYgKCAhaGFzX2lvbW11X3B0
KGQpICkKICAgICAgICAgICAgIHJldHVybiAwOwogICAgICAgICByZXR1cm4gaW9tbXVfbGVnYWN5
X21hcChkLCBfZGZuKGdmbl9sKSwgX21mbihnZm5fbCksIFBBR0VfT1JERVJfNEssCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIElPTU1VRl9yZWFkYWJsZSB8IElPTU1VRl93cml0YWJs
ZSk7CkBAIC0xNDMyLDcgKzE0MzIsNyBAQCBpbnQgY2xlYXJfaWRlbnRpdHlfcDJtX2VudHJ5KHN0
cnVjdCBkb21haW4gKmQsCnVuc2lnbmVkIGxvbmcgZ2ZuX2wpCgogICAgIGlmICggIXBhZ2luZ19t
b2RlX3RyYW5zbGF0ZShkKSApCiAgICAgewotICAgICAgICBpZiAoICFuZWVkX2lvbW11X3B0X3N5
bmMoZCkgKQorICAgICAgICBpZiAoICFoYXNfaW9tbXVfcHQoZCkgKQogICAgICAgICAgICAgcmV0
dXJuIDA7CiAgICAgICAgIHJldHVybiBpb21tdV9sZWdhY3lfdW5tYXAoZCwgX2RmbihnZm5fbCks
IFBBR0VfT1JERVJfNEspOwogICAgIH0KClRoYW5rcywKUm9tYW4uCgpPbiBXZWQsIEF1ZyAxNCwg
MjAxOSBhdCAxOjA2IEFNIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3
cm90ZToKPgo+IE9uIFR1ZSwgQXVnIDEzLCAyMDE5IGF0IDEyOjI0OjMyUE0gLTA3MDAsIFJvbWFu
IFNoYXBvc2huaWsgd3JvdGU6Cj4gPiBIaSBSb2dlciwKPiA+Cj4gPiBzb3JyeSBmb3IgdGhlIGRl
bGF5IC0tIEkgaG9wZSB5b3Ugd2lsbCB1bmRlcnN0YW5kIHRoYXQgSSBhY3R1YWxseSBoYWQKPiA+
IGEgZ29vZCByZWFzb24uIFNlZSBiZWxvdzoKPgo+IE5vIHByb2JsZW0sIGp1c3Qgd2FudGVkIHRv
IG1ha2Ugc3VyZSB0aGlzIGRvZXNuJ3QgZmVsbCB0aHJvdWdoIHRoZQo+IGNyYWNrcy4KPgo+ID4g
T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMTo1NyBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IFBpbmc/Cj4gPiA+Cj4gPiA+IEkga25v
dyBJJ3ZlIHBvc3RlZCB0aGlzIHF1aXRlIHJlY2VudGx5LCBidXQgaGF2ZSB5b3UgYmVlbiBhYmxl
IHRvIHRlc3QKPiA+ID4gdGhlIHR3byBwcm9wb3NlZCBwYXRjaGVzPwo+ID4gPgo+ID4gPiBpZTog
dGhlIG9uZSBoZXJlIGFuZDoKPiA+ID4KPiA+ID4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA4L21zZzAwNjQzLmh0bWwKPiA+ID4KPiA+
ID4gSSB3b3VsZCBsaWtlIHRvIGZpZ3VyZSBvdXQgZXhhY3RseSB3aGF0J3MgZ29pbmcgb24gYW5k
IGZpeCB0aGlzCj4gPiA+IHByb3Blcmx5Lgo+ID4KPiA+IFR1cm5zIG91dCB0aGlzIG1heSBhY3R1
YWxseSBiZSByZWxhdGVkIHRvIHRoZSBCSU9TIHZlcnNpb24gb24gdGhlc2UKPiA+IGJveGVzLiBJ
IGhhdmUKPiA+IG9uZSB3aXRoIHRoZSBCSU9TIGJ1aWxkIGZyb20gMDYvMDcvMjAxOCBhbmQgdGhl
IG90aGVyIG9uZSBpcyBmcm9tIDIwMTcuIFNvIHdpdGgKPiA+IDIgb2YgeW91ciBwcm9wb3NlZCBw
YXRjaGVzIC0tIHdlIG5vdyBoYXZlIGEgMngyIHRlc3QgbWF0cml4LiBUaGUgYXdmdWwKPiA+IHBh
cnQgc2VlbXMKPiA+IHRvIGJlIHRoYXQgdGhlIGJlaGF2aW9yIGxvb2tzIHRvIGJlIHNsaWdodGx5
IGRpZmZlcmVudC4KPiA+Cj4gPiBJIG5lZWQgYW4gZXh0cmEgZGF5IHRvIHN1bW1hcml6ZSBpdCBh
bGwgYW5kIEknbGwgZm9sbG93IHVwIHF1aWNrbHkuIEl0Cj4gPiBqdXN0IHNvIGZhciBJIGxvc3QK
PiA+IHRpbWUgdHJ5aW5nIHRvIGZpZ3VyZSBvdXQgd2hpbGUgdGhlIHNhbWUgYnVpbGQgd291bGQg
YmVoYXZlCj4gPiBkaWZmZXJlbnRseSBvbiBkaWZmZXJlbnQKPiA+IGJveGVzIG9ubHkgdG8gZmlu
ZCBvdXQgdGhhdCB0aGUgQklPUyBpcyBkaWZmZXJlbnQgKGFuZCB0aGUgcmVhbGx5Cj4gPiBhd2Z1
bCBwYXJ0IGlzIHRoYXQKPiA+IHRoZXkgYm90aCByZXBvcnQgYXMgdmVyc2lvbiA1LjAuMS4xIC0t
IGl0IGlzIG9ubHkgd2hlbiB5b3UgbG9vayBhdCB0aGUgdGltZXN0YW1wCj4gPiBvZiB0aGUgYnVp
bGQgLS0gdGhhdCdzIHdoZXJlIHlvdSBzZWUgdGhlbSBiZWluZyBkaWZmZXJlbnQgOi0oICkuCj4K
PiBPaCwgdGhhdCdzIGF3ZnVsLiBJIGhvcGUgeW91IGNhbiBnZXQgc29tZXRoaW5nIGNsZWFyIG91
dCBvZiB0aGlzLgo+Cj4gUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs

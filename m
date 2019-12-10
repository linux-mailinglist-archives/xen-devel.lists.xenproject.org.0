Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A8311806B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 07:27:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieYy6-00018q-RN; Tue, 10 Dec 2019 06:25:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DUzY=2A=gmail.com=sj38.park@srs-us1.protection.inumbo.net>)
 id 1ieYsj-0000tl-PO
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 06:20:25 +0000
X-Inumbo-ID: 268412b8-1b15-11ea-b6f1-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 268412b8-1b15-11ea-b6f1-bc764e2007e4;
 Tue, 10 Dec 2019 06:20:24 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id y19so12678089lfl.9
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2019 22:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Jv//fc1VPzyc+MNAsiN7TquFe8yzj3we6ZRj3X1mR00=;
 b=nwjhEEqFWHgdt7GcskJDmpuj3JQ6GgLRuMmIWw6ew5Pe1AlHuPb/kNgkY6UbbWf/nV
 0Nxxbp7JtxbIWFD+mwB12W1o13HMGfeRyDupDkdAlMtQQTKb50geCspTGO6+cse+klui
 V3wsKUraWC6uWYeKN1y0zYqwOufAElbN3bP5lGSx9DTdBYeYcQ+G7hmkN7p2sah5vwAr
 XcClaUU/W3cAGDsogtO2Oi+IiZoCCa+orrJTucBey2OVgNPweO8lbw+l1vK0q5VM6yY1
 FTfuN5knCSTU95Ifmd7gxdrn5t6iCv91xSDHzI5iNFpaedvjFXTHKLGwm+Q8FPfCTExF
 OWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Jv//fc1VPzyc+MNAsiN7TquFe8yzj3we6ZRj3X1mR00=;
 b=BzNQ0bLIhcjhRs1Ny1K1NNUaiLcqvbwrQSHNKZprdUKXJluyjE/TaIlyM0FEgIFHH6
 koPbQQ4Tr6y/0zbdp87MVyyXLvjeUD0t55K+eO/rFK+xxgBJOAk5qh13WoLQ0CDOGnoY
 DieylvcoeXTwtUZfkfx4hmtnt2Azi8DXHJ/1+zu6i4kM55Bb1EdJIpYRZbejgsTFrq2i
 BH95l5ByaqoGaVjVQFLRNCArh3Ey1Uznm2/8z/zIY71RKQmXAOy6vYQN51ID85vJS+fp
 Fzd5jtpjzF/Q9b38ucfX8pa7Gg/Zht4V6LGWFB0hcCuUufVk0FfPW/RfbfEameExq0o+
 T3gA==
X-Gm-Message-State: APjAAAUd1Urr5P9koR4cMRidehiFV2VJt7s5y0Jikn2UUbrB8xux6n4X
 jVSJ2cgIlRwrsqBT2t0VdadVhGJe59q8H140wHE=
X-Google-Smtp-Source: APXvYqyS0TFkIrszmllm1gFo+1Pqhy+E7YQmUTRI7t9cOOtybqrCk6UxIdDQrEHQ6tJeW5fDrNFEyZx+GuLyWPaGlbM=
X-Received: by 2002:a19:6a06:: with SMTP id u6mr13880006lfu.187.1575958823690; 
 Mon, 09 Dec 2019 22:20:23 -0800 (PST)
MIME-Version: 1.0
References: <20191209194305.20828-1-sjpark@amazon.com>
 <20191209194305.20828-2-sjpark@amazon.com>
 <2aca11d5-38ba-e924-c38e-e48c52c915c6@suse.com>
In-Reply-To: <2aca11d5-38ba-e924-c38e-e48c52c915c6@suse.com>
From: SeongJae Park <sj38.park@gmail.com>
Date: Tue, 10 Dec 2019 07:19:57 +0100
Message-ID: <CAEjAshpqjByUcJpmkTU4ukm3pPn0hDfRfB=Rh_vh81ajr9z1Tw@mail.gmail.com>
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
X-Mailman-Approved-At: Tue, 10 Dec 2019 06:25:57 +0000
Subject: Re: [Xen-devel] [PATCH v4 1/2] xenbus/backend: Add memory pressure
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
Cc: Jens Axboe <axboe@kernel.dk>, SeongJae Park <sjpark@amazon.com>,
 konrad.wilk@oracle.com, pdurrant@amazon.com, SeongJae Park <sjpark@amazon.de>,
 LKML <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMTAsIDIwMTkgYXQgNzoxMSBBTSBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMDkuMTIuMTkgMjA6NDMsIFNlb25nSmFlIFBhcmsgd3JvdGU6
Cj4gPiBGcm9tOiBTZW9uZ0phZSBQYXJrIDxzanBhcmtAYW1hem9uLmRlPgo+ID4KPiA+IEdyYW50
aW5nIHBhZ2VzIGNvbnN1bWVzIGJhY2tlbmQgc3lzdGVtIG1lbW9yeS4gIEluIHN5c3RlbXMgY29u
ZmlndXJlZAo+ID4gd2l0aCBpbnN1ZmZpY2llbnQgc3BhcmUgbWVtb3J5IGZvciB0aG9zZSBwYWdl
cywgaXQgY2FuIGNhdXNlIGEgbWVtb3J5Cj4gPiBwcmVzc3VyZSBzaXR1YXRpb24uICBIb3dldmVy
LCBmaW5kaW5nIHRoZSBvcHRpbWFsIGFtb3VudCBvZiB0aGUgc3BhcmUKPiA+IG1lbW9yeSBpcyBj
aGFsbGVuZ2luZyBmb3IgbGFyZ2Ugc3lzdGVtcyBoYXZpbmcgZHluYW1pYyByZXNvdXJjZQo+ID4g
dXRpbGl6YXRpb24gcGF0dGVybnMuICBBbHNvLCBzdWNoIGEgc3RhdGljIGNvbmZpZ3VyYXRpb24g
bWlnaHQgbGFja3MgYQo+ID4gZmxleGliaWxpdHkuCj4gPgo+ID4gVG8gbWl0aWdhdGUgc3VjaCBw
cm9ibGVtcywgdGhpcyBjb21taXQgYWRkcyBhIG1lbW9yeSByZWNsYWltIGNhbGxiYWNrIHRvCj4g
PiAneGVuYnVzX2RyaXZlcicuICBVc2luZyB0aGlzIGZhY2lsaXR5LCAneGVuYnVzJyB3b3VsZCBi
ZSBhYmxlIHRvIG1vbml0b3IKPiA+IGEgbWVtb3J5IHByZXNzdXJlIGFuZCByZXF1ZXN0IHNwZWNp
ZmljIGRvbWFpbnMgb2Ygc3BlY2lmaWMgYmFja2VuZAo+ID4gZHJpdmVycyB3aGljaCBjYXVzaW5n
IHRoZSBnaXZlbiBwcmVzc3VyZSB0byB2b2x1bnRhcmlseSByZWxlYXNlIGl0cwo+ID4gbWVtb3J5
Lgo+ID4KPiA+IFRoYXQgc2FpZCwgdGhpcyBjb21taXQgc2ltcGx5IHJlcXVlc3RzIGV2ZXJ5IGNh
bGxiYWNrIHJlZ2lzdGVyZWQgZHJpdmVyCj4gPiB0byByZWxlYXNlIGl0cyBtZW1vcnkgZm9yIGV2
ZXJ5IGRvbWFpbiwgcmF0aGVyIHRoYW4gaXNzdWVpbmcgdGhlCj4gPiByZXF1ZXN0cyB0byB0aGUg
ZHJpdmVycyBhbmQgZG9tYWluIGluIGNoYXJnZS4gIFN1Y2ggdGhpbmdzIHdvdWxkIGJlIGEKPiA+
IGZ1dHVyZSB3b3JrLiAgQWxzbywgdGhpcyBjb21taXQgZm9jdXNlcyBvbiBtZW1vcnkgb25seS4g
IEhvd2V2ZXIsIGl0Cj4gPiB3b3VsZCBiZSBhYmx0IHRvIGJlIGV4dGVuZGVkIGZvciBnZW5lcmFs
IHJlc291cmNlcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTZW9uZ0phZSBQYXJrIDxzanBhcmtA
YW1hem9uLmRlPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVf
YmFja2VuZC5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAgaW5jbHVkZS94ZW4v
eGVuYnVzLmggICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gPiAgIDIgZmlsZXMgY2hhbmdl
ZCwgMzIgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW5i
dXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJv
YmVfYmFja2VuZC5jCj4gPiBpbmRleCBiMGJlZDRmYWY0NGMuLmNkNWZkMWNkOGRlMyAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfYmFja2VuZC5jCj4gPiAr
KysgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYwo+ID4gQEAgLTI0
OCw2ICsyNDgsMzQgQEAgc3RhdGljIGludCBiYWNrZW5kX3Byb2JlX2FuZF93YXRjaChzdHJ1Y3Qg
bm90aWZpZXJfYmxvY2sgKm5vdGlmaWVyLAo+ID4gICAgICAgcmV0dXJuIE5PVElGWV9ET05FOwo+
ID4gICB9Cj4gPgo+ID4gK3N0YXRpYyBpbnQgeGVuYnVzX2JhY2tlbmRfcmVjbGFpbShzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEpCj4gPiArewo+ID4gKyAgICAgc3RydWN0IHhlbmJ1c19k
cml2ZXIgKmRydjsKPiA+ICsgICAgIGlmICghZGV2LT5kcml2ZXIpCj4gPiArICAgICAgICAgICAg
IHJldHVybiAtRU5PRU5UOwo+ID4gKyAgICAgZHJ2ID0gdG9feGVuYnVzX2RyaXZlcihkZXYtPmRy
aXZlcik7Cj4gPiArICAgICBpZiAoZHJ2ICYmIGRydi0+cmVjbGFpbSkKPiA+ICsgICAgICAgICAg
ICAgZHJ2LT5yZWNsYWltKHRvX3hlbmJ1c19kZXZpY2UoZGV2KSwgRE9NSURfSU5WQUxJRCk7Cj4g
PiArICAgICByZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiArLyoKPiA+ICsgKiBSZXR1cm5zIDAg
YWx3YXlzIGJlY2F1c2Ugd2UgYXJlIHVzaW5nIHNocmlua2VyIHRvIG9ubHkgZGV0ZWN0IG1lbW9y
eQo+ID4gKyAqIHByZXNzdXJlLgo+ID4gKyAqLwo+ID4gK3N0YXRpYyB1bnNpZ25lZCBsb25nIHhl
bmJ1c19iYWNrZW5kX3Nocmlua19jb3VudChzdHJ1Y3Qgc2hyaW5rZXIgKnNocmlua2VyLAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHNocmlua19jb250cm9sICpzYykK
PiA+ICt7Cj4gPiArICAgICBidXNfZm9yX2VhY2hfZGV2KCZ4ZW5idXNfYmFja2VuZC5idXMsIE5V
TEwsIE5VTEwsCj4gPiArICAgICAgICAgICAgICAgICAgICAgeGVuYnVzX2JhY2tlbmRfcmVjbGFp
bSk7Cj4gPiArICAgICByZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIHN0cnVjdCBz
aHJpbmtlciB4ZW5idXNfYmFja2VuZF9zaHJpbmtlciA9IHsKPiA+ICsgICAgIC5jb3VudF9vYmpl
Y3RzID0geGVuYnVzX2JhY2tlbmRfc2hyaW5rX2NvdW50LAo+ID4gKyAgICAgLnNlZWtzID0gREVG
QVVMVF9TRUVLUywKPiA+ICt9Owo+ID4gKwo+ID4gICBzdGF0aWMgaW50IF9faW5pdCB4ZW5idXNf
cHJvYmVfYmFja2VuZF9pbml0KHZvaWQpCj4gPiAgIHsKPiA+ICAgICAgIHN0YXRpYyBzdHJ1Y3Qg
bm90aWZpZXJfYmxvY2sgeGVuc3RvcmVfbm90aWZpZXIgPSB7Cj4gPiBAQCAtMjY0LDYgKzI5Miw5
IEBAIHN0YXRpYyBpbnQgX19pbml0IHhlbmJ1c19wcm9iZV9iYWNrZW5kX2luaXQodm9pZCkKPiA+
Cj4gPiAgICAgICByZWdpc3Rlcl94ZW5zdG9yZV9ub3RpZmllcigmeGVuc3RvcmVfbm90aWZpZXIp
Owo+ID4KPiA+ICsgICAgIGlmIChyZWdpc3Rlcl9zaHJpbmtlcigmeGVuYnVzX2JhY2tlbmRfc2hy
aW5rZXIpKQo+ID4gKyAgICAgICAgICAgICBwcl93YXJuKCJzaHJpbmtlciByZWdpc3RyYXRpb24g
ZmFpbGVkXG4iKTsKPiA+ICsKPiA+ICAgICAgIHJldHVybiAwOwo+ID4gICB9Cj4gPiAgIHN1YnN5
c19pbml0Y2FsbCh4ZW5idXNfcHJvYmVfYmFja2VuZF9pbml0KTsKPiA+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL3hlbi94ZW5idXMuaCBiL2luY2x1ZGUveGVuL3hlbmJ1cy5oCj4gPiBpbmRleCA4Njlj
ODE2ZDVmOGMuLjUyYWFmNGY3ODQwMCAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUveGVuL3hlbmJ1
cy5oCj4gPiArKysgYi9pbmNsdWRlL3hlbi94ZW5idXMuaAo+ID4gQEAgLTEwNCw2ICsxMDQsNyBA
QCBzdHJ1Y3QgeGVuYnVzX2RyaXZlciB7Cj4gPiAgICAgICBzdHJ1Y3QgZGV2aWNlX2RyaXZlciBk
cml2ZXI7Cj4gPiAgICAgICBpbnQgKCpyZWFkX290aGVyZW5kX2RldGFpbHMpKHN0cnVjdCB4ZW5i
dXNfZGV2aWNlICpkZXYpOwo+ID4gICAgICAgaW50ICgqaXNfcmVhZHkpKHN0cnVjdCB4ZW5idXNf
ZGV2aWNlICpkZXYpOwo+ID4gKyAgICAgdW5zaWduZWQgKCpyZWNsYWltKShzdHJ1Y3QgeGVuYnVz
X2RldmljZSAqZGV2LCBkb21pZF90IGRvbWlkKTsKPgo+IENhbiB5b3UgcGxlYXNlIGFkZCBhIGNv
bW1lbnQgaGVyZSByZWdhcmRpbmcgc2VtYW50aWNzIG9mIHNwZWNpZnlpbmcKPiBET01JRF9JTlZB
TElEIGFzIGRvbWlkPwoKWWVzLCBvZiBjb3Vyc2UuICBXaWxsIGRvIHdpdGggdGhlIG5leHQgdmVy
c2lvbi4KCgpUaGFua3MsClNlb25nSmFlIFBhcmsKCj4KPiBCbG9jayBtYWludGFpbmVycywgd291
bGQgeW91IGJlIGZpbmUgd2l0aCBtZSBjYXJyeWluZyB0aGlzIHNlcmllcwo+IHRocm91Z2ggdGhl
IFhlbiB0cmVlPwo+Cj4KPiBKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs

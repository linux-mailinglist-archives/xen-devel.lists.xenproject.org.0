Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA48953FB
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 04:06:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hztUx-0002BT-PZ; Tue, 20 Aug 2019 02:03:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DErr=WQ=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1hztUw-0002BO-Bk
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 02:03:46 +0000
X-Inumbo-ID: bdef3774-c2ee-11e9-aee9-bc764e2007e4
Received: from mail-qt1-x82e.google.com (unknown [2607:f8b0:4864:20::82e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bdef3774-c2ee-11e9-aee9-bc764e2007e4;
 Tue, 20 Aug 2019 02:03:45 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id y26so4283880qto.4
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2019 19:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=g8RJtIK4JpqL6fx7DV3xm+yZ7oUpTrlJoyMaLsEbmuE=;
 b=Sn+KScRDnYxM/5ZiGhFX6hwq3sjNoniSYjGppnm0eqzEvhXc4hYgaR+n8aL0MgM5V/
 1eV3DFpuszAtmII/vbAshk7p0dFOEjDx5C3ezFgxdlONaYmoQ7yuWA6sMHriU42xiXIT
 uBrfSULHAWbr7xNpmy0mfyXtXn6I4GnAJKyD1hYHTD16sFyx5wUlVo0F6ME82pxJPyP7
 9dMNAoagpTDnyM2F1mqi+0k1KwsTjIm4JACL2MFvd0t7XYVIT516jmYF2YYFODEcuo2k
 oVErALYp8gqouyzrc9ChBljqcLSTS89wU09hfDeB1PrSD9em58R/lMYPN4c3JwzBhFBV
 qgzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g8RJtIK4JpqL6fx7DV3xm+yZ7oUpTrlJoyMaLsEbmuE=;
 b=BenHpD/CyL+ftcRf3F4BhOm1cdBrUzrk0MPSdJh/sJi0qSL3Dj8Hs6RJsJ6/YUilRC
 rpmVsH0gJbtUnkbDdZ/akxExSYe8Bx5HbkoT/13cxSyCc8xXDAe5dRL/jyiZoM/kkhGV
 z3zGhC6TtxQCsI87fs9biB96N5GtKRjsPJDDu07bQvNvb0YqRAxciIDu6gN8pHmwui9Z
 TGDMelJ42yCt9327BqJvAf/cQkpPbaZsH+qNelQxWHMZNFI3WDmEUSvIvtosqfp19B+9
 f3WWPKoWtwEOM1fvVv/IEVaErU40zGwzE10TB7cSrNVw5b4m2gbBOi4kAZTz6EG/WWAs
 O0pw==
X-Gm-Message-State: APjAAAX+3yRmfDCaexVYEdwdRN6DqoO2HPBULV1yKX8K7aapTk9XCkvV
 xqaGGvGhKJrmvOrc7RbrFtt2VPlETB01HOQWE/WTyg==
X-Google-Smtp-Source: APXvYqznKNTJGjcirdrYh76YCLkb7jaC+8CrZgzJSFJbhZaWP7UJUSkpv+CAWl7S2rpGa8gFGvGs2EuI3evOEPn/YHY=
X-Received: by 2002:ac8:7cd:: with SMTP id m13mr24021416qth.341.1566266625311; 
 Mon, 19 Aug 2019 19:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190801081559.wruxck32h5bum2va@Air-de-Roger>
 <CAMmSBy9y6hHQfDgcDFmKiRw9QiRSgcxHAq6Qo=o7apTR2EuusA@mail.gmail.com>
 <20190802080540.r4e3rrv3eit5yebt@Air-de-Roger>
 <20190806160644.adqzknxdfuwz4qaz@Air-de-Roger>
 <CAMmSBy91XfNz5DfbaL8OC7v1eYp7n_EKjGgSgAH+YBALh9HM-g@mail.gmail.com>
 <20190807073534.7uoqo7q7gno2ljyl@Air-de-Roger>
 <20190812085703.363a2xsypnacdpes@Air-de-Roger>
 <CAMmSBy_CfoRuJZjHT6bXk5zG5jeb8a6m7TK6+mAKtr+3TzS-Vw@mail.gmail.com>
 <20190814080614.m32cupba4f5jdlhs@Air-de-Roger>
 <CAMmSBy8Pcv4eyZPOf+0hEtCA4bb9+1SSgieLcvKor63UyUK4-g@mail.gmail.com>
 <20190819081637.dg2k5kv54o72wrty@Air-de-Roger>
In-Reply-To: <20190819081637.dg2k5kv54o72wrty@Air-de-Roger>
From: Roman Shaposhnik <roman@zededa.com>
Date: Mon, 19 Aug 2019 19:03:33 -0700
Message-ID: <CAMmSBy-QF3avMhbsQOG5AOdEFXyX7pZLcg-wiOmg0qqfKdXhug@mail.gmail.com>
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

T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMToxNiBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiBTdW4sIEF1ZyAxOCwgMjAxOSBhdCAxMDowMDox
N1BNIC0wNzAwLCBSb21hbiBTaGFwb3NobmlrIHdyb3RlOgo+ID4gSGkgUm9nZXIhCj4gPgo+ID4g
U29tZSBnb29kIG5ld3MsIHNvbWUgYmFkIG5ld3MgOy0pCj4gPgo+ID4gR29vZCBuZXdzIGlzIHRo
YXQgb24gdGhlIG5ld2VyIEJJT1MsIHlvdXIgb3JpZ2luYWwgcGF0Y2ggc2VlbXMgdG8gd29yayBm
aW5lLgo+ID4KPiA+IElPVywgd2l0aCBuZXdlciBCSU9TOgo+ID4gICAgIDEuIHdpdGhvdXQgeW91
ciBvcmlnaW5hbCBwYXRjaCBJIHNlZSBnYXJibGVkIHNjcmVlbgo+ID4gICAgIDIuIHdpdGggeW91
ciBvcmlnaW5hbCBwYXRjaCBldmVyeXRoaW5nIGJvb3RzIG5vcm1hbGx5Lgo+Cj4gVGhhdCB3b3Vs
ZCBiZSBteSBleHBlY3RhdGlvbi4KPgo+ID4gQmFkIG5ld3MgaXMgdGhhdCB3aXRoIG9sZGVyIEJJ
T1MsIHlvdXIgb3JpZ2luYWwgcGF0Y2ggc2VlbXMgdG8gZWl0aGVyCj4gPiB3b3JrIG9yIG5vdCBk
ZXBlbmRpbmcgb24gdGhlIEJJT1Mgc29tZSBvZiB0aGUgQklPUyBzZXR0aW5ncy4KPiA+Cj4gPiBJ
T1csIHdpdGggb2xkZXIgQklPUzoKPiA+ICAgICAxLiB3aXRob3V0IHlvdXIgb3JpZ2luYWwgcGF0
Y2ggSSBzZWUgZ2FyYmxlZCBzY3JlZW4gKHJlZ2FyZGxlc3Mgb2YKPiA+IEJJT1Mgc2V0dGluZ3Mp
Cj4gPiAgICAgMi4gd2l0aCB5b3VyIG9yaWdpbmFsIHBhdGNoIEFORCByZXNldHRpbmcgdG8gYSBm
YWN0b3J5IGRlZmF1bHRzIG9mCj4gPiBCSU9TIHNldHRpbmdzIC0tIGV2ZXJ5dGhpbmcgYm9vdHMg
bm9ybWFsbHkKPiA+ICAgICAzLiB3aGVuIEkgbG9hZCB1cCBvdXIgY3VzdG9tIHNldHRpbmdzIC0t
IHRoZSBvbmx5IHRoaW5nIHRoYXQgY2FuCj4gPiBib290IG5vcm1hbGx5IGlzIHRoZSBsYXRlc3Qg
cGF0Y2gKPiA+Cj4gPiBTbywgd291bGQgaXQgbWFrZSBzZW5zZSBhbmQgY29tbWl0IHlvdXIgb3Jp
Z2luYWwgcGF0Y2ggZm9yIG5vdz8gVGhpcwo+ID4gd2lsbCB1bmxvY2sgbWUgd2l0aCBuZXdlciBC
SU9TZXMgb24gdGhlc2UgYm94ZXMuCj4KPiBJIHRoaW5rIHNvLCBjYW4geW91IHBsZWFzZSBwcm92
aWRlIGEgdGVzdGVkLWJ5IHRvIHRoZSBwYXRjaDoKPgo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wNy9tc2cwMTU0Ny5odG1sCgpEb25l
LgoKPiBGZWVsIGZyZWUgdG8gYWxzbyBub3RlIHRoZSB3ZWlyZCBiZWhhdmlvdXIgeW91IGFyZSBz
ZWVpbmcgd2l0aCB0aGlzCj4gYm94IGFuZCBmaXJtd2FyZSB2ZXJzaW9uLgo+Cj4gPiBBcyBmb3Ig
dGhlIG9sZGVyIEJJT1NlcywgSSBzdGlsbCBmZWVsIHRoYXQgaXQgd291bGQgYmUgZ3JlYXQgZm9y
IFhlbgo+ID4gdG8gYm9vdCBtb3JlIHJlbGlhYmx5IC0tIGVzcGVjaWFsbHkgc2luY2UgWGVuIDQu
MTAgc2VlbXMgdG8gYmUgZG9pbmcKPiA+IGZpbmUgcmVnYXJkbGVzcyBvZiBCSU9TIHZlcnNpb24g
YW5kIHNldHRpbmdzLgo+ID4KPiA+IFdoYXQgZG8geW91IHRoaW5rPwo+Cj4gV2UgY291bGQgYWRk
IGEgcXVpcmsgZm9yIHRoaXMgZmltcndhcmUgdmVyc2lvbiBhbmQgaGFyZHdhcmUgaWYgd2Uga25v
dwo+IGV4YWN0bHkgd2hhdCB0aGUgaXNzdWUgaXMuIEhhdmUgeW91IGZpZ3VyZWQgb3V0IGlmIGl0
J3MgcmVsYXRlZCB0byB0aGUKPiBmbHVzaD8gaWU6IGlvbW11X2lvdGxiX2ZsdXNoIHZzIGlvbW11
X2lvdGxiX2ZsdXNoX2FsbCB2cyBpb21tdV9mbHVzaF9hbGw/CgpJIGFtIGFjdHVhbGx5IGF0IE9w
ZW4gU291cmNlIFN1bW1pdCBpbiBTYW4gRGllZ28gcmlnaHQgbm93IC0tIGF3YXkgZnJvbQpteSBs
YWIuIEknbGwgdHJ5IHRvIGNhcHR1cmUgYXMgbXVjaCBkYXRhIG9uIEZyaSBhcyBwb3NzaWJsZSB3
aGVuIEkgY29tZSBiYWNrLgoKUGxlYXNlIHN0YXkgdHVuZWQuCgpUaGFua3MsClJvbWFuLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

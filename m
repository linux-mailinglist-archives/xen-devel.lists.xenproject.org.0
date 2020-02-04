Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 035BF15192E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 12:02:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyvwH-0001DF-V6; Tue, 04 Feb 2020 11:00:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m1yC=3Y=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1iyvwG-0001DA-IK
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 11:00:16 +0000
X-Inumbo-ID: 85cc1bb8-473d-11ea-ad98-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85cc1bb8-473d-11ea-ad98-bc764e2007e4;
 Tue, 04 Feb 2020 11:00:15 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id p3so19369416edx.7
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2020 03:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=R5mI1sldOtv1LgeGVTGAV1D7OClOqtA3p9S/gL1D9r8=;
 b=SxRCTSUcc5ltT9Bg4hpsCv8ffFvnkWh92dum25YzlBnkjy7DhySQ0D97NB5s1WU44V
 0L0ApHIlrQ6ri97F4hpSKFaYqJtnSBuf5+5MMEEGhufSM9A5MEpXpQxOPmDTuOxjnp83
 FY4vudCKTwuMziEsJA+narqH8EhMGzKsZwpVNK6y7E8dIUh4HV9zovsE/7FI5Qj9rWJI
 Y/XLbCEx7b964xsZ7fLdV4roWRtuQw5cQds3gi55BMA79+F82G45BqkE9fwbhGXqes61
 rkzL3vL1/M5tsnJBwj9uZ9YsQbrvxmJXC1sQOk2KCyZvNkJi6WqzORzV4gsmzZXrNJRx
 +zYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=R5mI1sldOtv1LgeGVTGAV1D7OClOqtA3p9S/gL1D9r8=;
 b=UNoChV0YpA/U3ToPTKY2/sqO5AW6ajzjgEsuJ11MQ0KYa0PLHSMVEduBjmJQig5EFo
 qkIS4hwCAnwMhZc80yUc0XLRo2J8tbCEamgV4i+HtTOIpC31g+Lgasl8sHSJWP3yQV0e
 sKHvY0LXOm1sz6exqFnFD+FGu58r+sFG0OoJEATdEfomnuduYqE6fKA5/qfalRshlDFI
 0CxdzSRZk76DVwY/GGEx2m1PKowCvzlZiYB96Z4ag7DV/azlHDx+x1owE5jmt/9RyWUY
 iyWoNU+Z5KUbhJSeXbwZGq1cKPg+waVFJFipzeCSC4KZokDUZ+sxfJ6YrZAGNBAHXdXK
 naYw==
X-Gm-Message-State: APjAAAXmlTunXJz4ARsRzZl9di0ua2QWjSVVmvSwiUaMtF5FM53jRCwj
 OHC6HvwS41Q5x98kaGYbvoEMxr4hLjhcbFCPkPI=
X-Google-Smtp-Source: APXvYqyl6HPK11Q7jzH+wxIwDxnTblCw5M1QCvfL2PwAfRv8q8gLbs5hz/hrihkNFUi9aX58YVLRrjD4UWvYNRPvJPY=
X-Received: by 2002:a17:906:90c3:: with SMTP id
 v3mr26204368ejw.30.1580814014629; 
 Tue, 04 Feb 2020 03:00:14 -0800 (PST)
MIME-Version: 1.0
References: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
 <20200201003303.2363081-5-dwmw2@infradead.org>
 <4eb039f7-597c-cc07-3fa9-29b60646ae7e@xen.org>
 <d58a4a99c83875b37f07f6e52d25ec943d35a554.camel@infradead.org>
In-Reply-To: <d58a4a99c83875b37f07f6e52d25ec943d35a554.camel@infradead.org>
From: George Dunlap <dunlapg@umich.edu>
Date: Tue, 4 Feb 2020 11:00:03 +0000
Message-ID: <CAFLBxZa9oUE8bAOCK0JaDpyOwFSZU-rvwvSf7h=2zzU643oOww@mail.gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [Xen-devel] [PATCH 5/8] xen/vmap: allow vmap() to be called
 during early boot
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Varad Gautam <vrd@amazon.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Paul Durrant <pdurrant@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMywgMjAyMCBhdCA0OjM3IFBNIERhdmlkIFdvb2Rob3VzZSA8ZHdtdzJAaW5m
cmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIDIwMjAtMDItMDMgYXQgMTQ6MDAgKzAwMDAs
IEp1bGllbiBHcmFsbCB3cm90ZToKPiA+IEhpIERhdmlkLAo+ID4KPiA+IE9uIDAxLzAyLzIwMjAg
MDA6MzMsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPiA+ID4gRnJvbTogRGF2aWQgV29vZGhvdXNl
IDxkd213QGFtYXpvbi5jby51az4KPiA+Cj4gPiBJIGFtIGEgYml0IGNvbmNlcm5lZCB3aXRoIHRo
aXMgY2hhbmdlLCBwYXJ0aWN1bGFybHkgdGhlIGNvbnNlcXVlbmNlIHRoaXMKPiA+IGhhdmUgZm9y
IHRoZSBwYWdlLXRhYmxlcy4gVGhlcmUgaXMgYW4gYXNzdW1wdGlvbiB0aGF0IGludGVybWVkaWF0
ZQo+ID4gcGFnZS10YWJsZXMgYWxsb2NhdGVkIHZpYSB0aGUgYm9vdCBhbGxvY2F0b3Igd2lsbCBu
ZXZlciBiZSBmcmVlZC4KPiA+Cj4gPiBPbiB4ODYsIGEgY2FsbCB0byB2dW5tYXAoKSB3aWxsIG5v
dCBmcmVlIHBhZ2UtdGFibGVzLCBidXQgYSBzdWJzZXF1ZW50Cj4gPiBjYWxsIHRvIHZtYXAoKSBt
YXkgZnJlZSBpdCBkZXBlbmRpbmcgb24gdGhlIG1hcHBpbmcgc2l6ZS4gU28gd2Ugd291bGQKPiA+
IGNhbGwgZnJlZV9kb21oZWFwX3BhZ2VzKCkgcmF0aGVyIHRoYW4gaW5pdF9oZWFwX3BhZ2VzKCku
Cj4gPgo+ID4gSSBhbSBub3QgZW50aXJlbHkgc3VyZSB3aGF0IGlzIHRoZSBmdWxsIGNvbnNlcXVl
bmNlLCBidXQgSSB0aGluayB0aGlzIGlzCj4gPiBhIGNhbGwgZm9yIGludmVzdGlnYXRpb24gYW5k
IHdyaXRlIGl0IGRvd24gYSBzdW1tYXJ5IGluIHRoZSBjb21taXQgbWVzc2FnZS4KPgo+IFRoaXMg
aXNuJ3QganVzdCBhYm91dCBwYWdlIHRhYmxlcywgcmlnaHQ/IEl0J3MgYWJvdXQgKmFueSogYWxs
b2NhdGlvbgo+IGdpdmVuIG91dCBieSB0aGUgYm9vdCBhbGxvY2F0b3IsIGJlaW5nIGZyZWVkIHdp
dGggZnJlZV9oZWFwX3BhZ2VzKCkgPwo+Cj4gR2l2ZW4gdGhlIGFtb3VudCBvZiBjb2RlIHRoYXQg
aGFzIGNvbmRpdGlvbmFscyBpbiBib3RoIGFsbG9jIGFuZCBmcmVlCj4gcGF0aHMgYWxvbmcgdGhl
IGxpbmVzIG9m4oCmCj4KPiAgIGlmIChzeXN0ZW1fc3RhdGUgPiBTWVNfU1RBVEVfYm9vdCkKPiAg
ICAgICB1c2UgeGVuaGVhcAo+ICAgZWxzZQo+ICAgICAgIHVzZSBib290IGFsbG9jYXRvcgo+Cj4g
4oCmIEknbSBub3Qgc3VyZSBJJ2QgcmVhbGx5IHRydXN0IHRoZSBhc3N1bXB0aW9uIHRoYXQgc3Vj
aCBhIHRoaW5nIG5ldmVyCj4gaGFwcGVuczsgdGhhdCBubyBwYWdlcyBhcmUgZXZlciBhbGxvY2F0
ZWQgZnJvbSB0aGUgYm9vdCBhbGxvY2F0b3IgYW5kCj4gdGhlbiBmcmVlZCBpbnRvIHRoZSBoZWFw
Lgo+Cj4gSW4gZmFjdCBpdCBkb2VzIHdvcmsgZmluZSBleGNlcHQgZm9yIHNvbWUgZXNvdGVyaWMg
Y29ybmVyIGNhc2VzLAo+IGJlY2F1c2UgaW5pdF9oZWFwX3BhZ2VzKCkgaXMgbW9zdGx5IGp1c3Qg
YSB0cml2aWFsIGxvb3Agb3Zlcgo+IGZyZWVfaGVhcF9wYWdlcygpLgo+Cj4gVGhlIGNvcm5lciBj
YXNlcyBhcmUgaWYgeW91IGNhbGwgZnJlZV9oZWFwX3BhZ2VzKCkgb24gYm9vdC1hbGxvY2F0ZWQK
PiBtZW1vcnkgd2hpY2ggbWF0Y2hlcyBvbmUgb3IgbW9yZSBvZiB0aGUgZm9sbG93aW5nIGNyaXRl
cmlhOgo+Cj4gIOKAoiBJbmNsdWRlcyBNRk4gIzAsCj4KPiAg4oCiIEluY2x1ZGVzIHRoZSBmaXJz
dCBwYWdlIHRoZSBoZWFwIGhhcyBzZWVuIG9uIGEgZ2l2ZW4gbm9kZSwgc28KPiAgICBpbml0X25v
ZGVfaGVhcCgpIGhhcyB0byBiZSBjYWxsZWQsIG9yCj4KPiAg4oCiIEhpZ2gtb3JkZXIgYWxsb2Nh
dGlvbnMgY3Jvc3NpbmcgZnJvbSBvbmUgbm9kZSB0byBhbm90aGVyLgoKSSB3YXMgYXNrZWQgdG8g
Zm9yd2FyZCBhIG1lc3NhZ2UgcmVsYXRpbmcgdG8gTUZOIDAgYW5kIGFsbG9jYXRpb25zCmNyb3Nz
aW5nIHpvbmVzIGZyb20gYSBwcml2YXRlIGRpc2N1c3Npb24gb24gdGhlIHNlY3VyaXR5IGxpc3Q6
Cgo4PC0tLQoKPiBJIGFtIGhhdmluZyBkaWZmaWN1bHR5IHNlZWluZyBob3cgaW52YWxpZGF0aW5n
IE1GTjAgd291bGQgc29sdmUgdGhlIGlzc3VlIGhlcmUuCj4gVGhlIHpvbmUgbnVtYmVyIGZvciBh
IHNwZWNpZmljIHBhZ2UgaXMgY2FsY3VsYXRlZCBmcm9tIHRoZSBtb3N0IHNpZ25pZmljYW50IGJp
dAo+IHBvc2l0aW9uIHNldCBpbiBpdCdzIE1GTi4gQXMgYSByZXN1bHQsIGVhY2ggc3VjY2Vzc2l2
ZSB6b25lIGNvbnRhaW5zIGFuIG9yZGVyIG9mCj4gbWFnbml0dWRlIG1vcmUgcGFnZXMuIFlvdSB3
b3VsZCBuZWVkIHRvIGludmFsaWRhdGUgdGhlIGZpcnN0IG9yIGxhc3QgTUZOIGluIGVhY2gKPiB6
b25lLgoKQmVjYXVzZSAodW5sZXNzIEphbiBhbmQgSSBhcmUgcmVhZGluZyB0aGUgY29kZSB3cm9u
Zyk6CgoqIENodW5rcyBjYW4gb25seSBiZSBtZXJnZWQgc3VjaCB0aGF0IHRoZXkgZW5kIHVwIG9u
IG9yZGVyLWJvdW5kYXJpZXMuCiogQ2h1bmtzIGNhbiBvbmx5IGJlIG1lcmdlZCBpZiB0aGV5IGFy
ZSB0aGUgc2FtZSBvcmRlci4KKiBab25lIGJvdW5kYXJpZXMgYXJlIG9uIG9yZGVyIGJvdW5kYXJp
ZXMuCgpTbyBzYXkgeW91J3JlIGZyZWVpbmcgbWZuIDB4MTAwLCBhbmQgbWZuIDB4ZmYgaXMgZnJl
ZS4gIEluIHRoYXQgbG9vcCwgKDEKPDwgb3JkZXIpICYgbWZuIHdpbGwgYWx3YXlzIGJlIDAsIHNv
IGl0IHdpbGwgYWx3YXlzIG9ubHkgbG9vayAiZm9yd2FyZCIKZnJvIHRoaW5ncyB0byBtZXJnZSwg
bm90IGJhY2t3YXJkcy4KClN1cHBvc2Ugb24gdGhlIG90aGVyIGhhbmQsIHRoYXQgeW91J3JlIGZy
ZWVpbmcgbWZuIDB4MTAxLCBhbmQgMHg5OAp0aHJvdWdoIDB4MTAwIGFyZSBmcmVlLiAgVGhlIGxv
b3Agd2lsbCBsb29rICJiYWNrd2FyZHMiIGFuZCBtZXJnZSB3aXRoCjB4MTAwOyBidXQgdGhlbiBp
dCB3aWxsIGxvb2sgImZvcndhcmRzIiBhZ2Fpbi4KCk5vdyBzdXBwb3NlIHlvdSd2ZSBtZXJnZWQg
MHgxMDAtMHgxZmYsIGFuZCB0aGUgb3JkZXIgbW92ZXMgdXAgdG8gc2l6ZQoweDEwMC4gIE5vdyB0
aGUgbWFzayBiZWNvbWVzIDB4MWZmOyBzbyBpdCBjYW4ndCBtZXJnZSB3aXRoIDB4MjAwLTB4MmZm
Cih3aGljaCB3b3VsZCBjcm9zcyB6b25lcyk7IGluc3RlYWQgaXQgbG9va3MgYmFja3dhcmRzIHRv
IDB4MC0weGZmLgoKV2UgZG9uJ3QgdGhpbmsgaXQncyBwb3NzaWJsZSBmb3IgdGhpbmdzIHRvIGJl
IG1lcmdlZCBhY3Jvc3Mgem9uZXMgdW5sZXNzCml0IGNhbiAoc2F5KSBzdGFydCBhdCAweGZmLCBh
bmQgbWVyZ2UgYWxsIHRoZSB3YXkgYmFjayB0byAweDA7IHdoaWNoCmNhbid0IGJlIGRvbmUgaWYg
MHgwIGlzIG5ldmVyIG9uIHRoZSBmcmVlIGxpc3QuCgpUaGF0J3MgdGhlIGlkZWEgYW55d2F5LiAg
VGhhdCB3b3VsZCBleHBsYWluIHdoeSB3ZSd2ZSBuZXZlciBzZWVuIGl0IG9uCng4NiAtLSBkdWUg
dG8gdGhlIHdheSB0aGUgYXJjaGl0ZWN0dXJlIGlzLCBtZm4gMCBpcyBuZXZlciBvbiB0aGUgZnJl
ZSBsaXN0LgoKLS0tPjgKCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs

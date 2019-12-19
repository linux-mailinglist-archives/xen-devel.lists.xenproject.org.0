Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD671267F1
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 18:25:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihzUm-0005D8-Nr; Thu, 19 Dec 2019 17:21:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=p4n+=2J=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ihzUl-0005Cx-Hg
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 17:21:51 +0000
X-Inumbo-ID: 0afad935-2284-11ea-922d-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0afad935-2284-11ea-922d-12813bfff9fa;
 Thu, 19 Dec 2019 17:21:50 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1576776110; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=IiLumATcw0WsyVF4E9lEti7FKASfJhtTvbIsnZM/i/4=;
 b=GDMyudGeDpOvK9d+gd4lp+cSL80TmQxUzm3qux8mXtw/sGQbtDbGnRX5TOBeqKtFtX3eaRus
 uw2LZFbyqNV+s6y95WxL6CcYTDWdUPsE9zr+CvZtwuRzTasee00mNRv8pS4Sjx2z0j6xgxVB
 1hbgrqgAIKox3DU5EVT3/nI2P2M=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mxa.mailgun.org with ESMTP id 5dfb9ec7.7fca1958f9b0-smtp-out-n02;
 Thu, 19 Dec 2019 16:01:11 -0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id y11so6511504wrt.6
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2019 08:01:11 -0800 (PST)
X-Gm-Message-State: APjAAAXud/0iQei5FKGbCbjDnbCvj/0GLgn4GiPvNWxYVn+iyXWuF3vr
 SLJl6m30dCGykWnBflDzoRF1Ufj29zbRMCIDRFE=
X-Google-Smtp-Source: APXvYqwM7iT60IUT6fmX/pk2p0B6myXdUoLEbQGeyQLKrDdA5c7wfUNONJxZ/rQgN31GFeBI1fgFrDQAVnLtJEO3r5w=
X-Received: by 2002:adf:b60f:: with SMTP id f15mr9676642wre.372.1576771270340; 
 Thu, 19 Dec 2019 08:01:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <d814a518fc201c76ffd8f254c534719ee278175a.1576697796.git.tamas.lengyel@intel.com>
 <898073d2-7480-7f67-0411-f80055b10d4e@bitdefender.com>
In-Reply-To: <898073d2-7480-7f67-0411-f80055b10d4e@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 19 Dec 2019 09:00:34 -0700
X-Gmail-Original-Message-ID: <CABfawh=GKox8FE1fruW1PiTCXnq-RtMNmSnROOtC66vUxA293w@mail.gmail.com>
Message-ID: <CABfawh=GKox8FE1fruW1PiTCXnq-RtMNmSnROOtC66vUxA293w@mail.gmail.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [Xen-devel] [PATCH v2 18/20] xen/mem_access: Use
 __get_gfn_type_access in set_mem_access
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMTksIDIwMTkgYXQgMTI6NTkgQU0gQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEK
PGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPgo+Cj4KPiBPbiAxOC4xMi4yMDE5IDIx
OjQwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPiBVc2UgX19nZXRfZ2ZuX3R5cGVfYWNjZXNz
IGluc3RlYWQgb2YgcDJtLT5nZXRfZW50cnkgdG8gdHJpZ2dlciBwYWdlLWZvcmtpbmcKPiA+IHdo
ZW4gdGhlIG1lbV9hY2Nlc3MgcGVybWlzc2lvbiBpcyBiZWluZyBzZXQgb24gYSBwYWdlIHRoYXQg
aGFzIG5vdCB5ZXQgYmVlbgo+ID4gY29waWVkIG92ZXIgZnJvbSB0aGUgcGFyZW50Lgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXMubGVuZ3llbEBpbnRlbC5jb21S
ZXZpZXdlZC1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+Cj4K
PiA+IC0tLQo+ID4gICB4ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jIHwgNSArKy0tLQo+ID4g
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jIGIveGVuL2FyY2gveDg2
L21tL21lbV9hY2Nlc3MuYwo+ID4gaW5kZXggMzIwYjlmZTYyMS4uOWNhZjA4YTViMiAxMDA2NDQK
PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMKPiA+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9tbS9tZW1fYWNjZXNzLmMKPiA+IEBAIC0zMDMsMTEgKzMwMywxMCBAQCBzdGF0aWMgaW50
IHNldF9tZW1fYWNjZXNzKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBwMm1fZG9tYWluICpwMm0s
Cj4gPiAgICAgICBBU1NFUlQoIWFwMm0pOwo+ID4gICAjZW5kaWYKPiA+ICAgICAgIHsKPiA+IC0g
ICAgICAgIG1mbl90IG1mbjsKPiA+ICAgICAgICAgICBwMm1fYWNjZXNzX3QgX2E7Cj4gPiAgICAg
ICAgICAgcDJtX3R5cGVfdCB0Owo+ID4gLQo+ID4gLSAgICAgICAgbWZuID0gcDJtLT5nZXRfZW50
cnkocDJtLCBnZm4sICZ0LCAmX2EsIDAsIE5VTEwsIE5VTEwpOwo+ID4gKyAgICAgICAgbWZuX3Qg
bWZuID0gX19nZXRfZ2ZuX3R5cGVfYWNjZXNzKHAybSwgZ2ZuX3goZ2ZuKSwgJnQsICZfYSwKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQMk1fQUxMT0MsIE5V
TEwsIGZhbHNlKTsKPgo+IERvbid0IHlvdSB3YW50IHAybV9xdWVyeV90IHRvIGJlIDAgYXMgaXQg
d2FzIGluIHRoZSBwMm0tPmdldF9lbnRyeSgpIGNhbGwgPwoKTm8sIHRoZSBlbnRpcmUgcG9pbnQg
b2YgdGhlIHBhdGNoIGlzIHRvIGhhdmUgdGhlIFAyTV9BTExPQyBxdWVyeSBmbGFnCnNldC4gVGhh
dCB0cmlnZ2VycyB0aGUgZm9yaydzIHAybSBwb3B1bGF0aW9uLgoKVGFtYXMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

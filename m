Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACF6188A2B
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 17:26:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEF0P-0000NQ-Nh; Tue, 17 Mar 2020 16:23:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B9yM=5C=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jEF0O-0000NL-K8
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 16:23:48 +0000
X-Inumbo-ID: ad931788-686b-11ea-b34e-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad931788-686b-11ea-b34e-bc764e2007e4;
 Tue, 17 Mar 2020 16:23:47 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id z65so27350805ede.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Mar 2020 09:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jFyWPq0MayJz5UqdHjuUit1xZPfnpt+WO6oSEt69QFA=;
 b=SpMnKiqq59CUIoq9MIFopFlugW2Mn1/eQImGEyL37OM6q1UKJoQkUJ0jAyvmOFOViY
 rPgCsJAA7xKuIVHl9wiEqyz1ais6abqMvMxDuE+e/niMplD27Ox+1x8w6K+kUWbT5jgU
 109sYv0JPubd31gfLAnzm7etGlf2w83AP3+ZvsG9YDXz0dK/usa7DN4EfJe+qYuym1le
 OW1agvXFeLIXdHtl4/dU7IEEjk2ld6q1e8GwbvMj0WO3qRs+bomz2MFmiG03E60RigU3
 AbEPtpzRu+36ufBWJKBE+EVTYNIr3CjuLE50T2vBWjVgHh6GYqA6UDYi4a6kwQP38Qms
 85pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jFyWPq0MayJz5UqdHjuUit1xZPfnpt+WO6oSEt69QFA=;
 b=OhaVHtg4lF2pt/e7A8AUu3MwvRgoNLfnDAE5Ovg/GCOR0ttaye0D2vtd4aVPvxh7Wy
 0vZDdbhL6OBClTbN5CyVPur9cLWQ3uebyRkFRCvOS+yWsHgegTha8/+SqRZv2k5ZW6hc
 2gzeavp+keNm6NfI2BW2f4BqMau+JlndAzUKhjz14+qGDfbHENwInzGZP2agT89SS2fP
 EBE3cTGJtzf2ZLRTATQOHwXkGZkcHlKgq+/uQD9Hdw2BvSZ6yvcl1Zgn7HlPwcYqkA9h
 30TJrEpB5OmiwgiSTSqiRS8Mdsf6vaVX54ss6de9t4tXzrglt2driz40qnh0XrzPTjBk
 kuOg==
X-Gm-Message-State: ANhLgQ3UShlEvaB6xKivsDdH4SB2N22o/q12FfXQsWiPGFZVX6Vof64T
 Tir94R3yJP9rSF/WDpzeB9eBcsJKln0=
X-Google-Smtp-Source: ADFU+vsAuCh8UnjeszmEha0t+/oUXyIIZqK59Oi6rsjI7M3K5pQTEGLiHHB9uzw9rO2zHFGW62CZ/g==
X-Received: by 2002:aa7:ca03:: with SMTP id y3mr5976436eds.383.1584462226336; 
 Tue, 17 Mar 2020 09:23:46 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48])
 by smtp.gmail.com with ESMTPSA id l2sm231129edk.70.2020.03.17.09.23.45
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2020 09:23:45 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id m3so22715647wmi.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Mar 2020 09:23:45 -0700 (PDT)
X-Received: by 2002:a1c:3105:: with SMTP id x5mr95400wmx.51.1584462225075;
 Tue, 17 Mar 2020 09:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1582914997.git.tamas.lengyel@intel.com>
 <4d049987eab1a08607f62d0e3b51768b529e1ff5.1582914998.git.tamas.lengyel@intel.com>
 <03a3d2e4-8ab1-1a83-f4ed-a6a403524f62@suse.com>
In-Reply-To: <03a3d2e4-8ab1-1a83-f4ed-a6a403524f62@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 17 Mar 2020 10:23:08 -0600
X-Gmail-Original-Message-ID: <CABfawhmr9fvRQ4Y_39XUE+iPjU=sG-kznG5ZP5eDAKH4XZ8bVw@mail.gmail.com>
Message-ID: <CABfawhmr9fvRQ4Y_39XUE+iPjU=sG-kznG5ZP5eDAKH4XZ8bVw@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v11 1/3] xen/mem_sharing: VM forking
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXIgMTcsIDIwMjAgYXQgMTA6MDIgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPgo+IE9uIDI4LjAyLjIwMjAgMTk6NDAsIFRhbWFzIEsgTGVuZ3llbCB3
cm90ZToKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+ID4gKysrIGIveGVuL2FyY2gv
eDg2L21tL3AybS5jCj4gPiBAQCAtNTA5LDYgKzUwOSwxMiBAQCBtZm5fdCBfX2dldF9nZm5fdHlw
ZV9hY2Nlc3Moc3RydWN0IHAybV9kb21haW4gKnAybSwgdW5zaWduZWQgbG9uZyBnZm5fbCwKPiA+
Cj4gPiAgICAgIG1mbiA9IHAybS0+Z2V0X2VudHJ5KHAybSwgZ2ZuLCB0LCBhLCBxLCBwYWdlX29y
ZGVyLCBOVUxMKTsKPiA+Cj4gPiArICAgIC8qIENoZWNrIGlmIHdlIG5lZWQgdG8gZm9yayB0aGUg
cGFnZSAqLwo+ID4gKyAgICBpZiAoIChxICYgUDJNX0FMTE9DKSAmJiBwMm1faXNfaG9sZSgqdCkg
JiYKPiA+ICsgICAgICAgICAhbWVtX3NoYXJpbmdfZm9ya19wYWdlKHAybS0+ZG9tYWluLCBnZm4s
ICEhKHEgJiBQMk1fVU5TSEFSRSkpICkKPgo+IE5vIG5lZWQgZm9yICEhIGhlcmUuCgpJIGRvbid0
IHRoaW5rIGl0IHJlYWxseSBtYXR0ZXJzIGJ1dCBzdXJlLgoKPgo+ID4gQEAgLTU4OCw3ICs1OTQs
OCBAQCBzdHJ1Y3QgcGFnZV9pbmZvICpwMm1fZ2V0X3BhZ2VfZnJvbV9nZm4oCj4gPiAgICAgICAg
ICAgICAgcmV0dXJuIHBhZ2U7Cj4gPgo+ID4gICAgICAgICAgLyogRXJyb3IgcGF0aDogbm90IGEg
c3VpdGFibGUgR0ZOIGF0IGFsbCAqLwo+ID4gLSAgICAgICAgaWYgKCAhcDJtX2lzX3JhbSgqdCkg
JiYgIXAybV9pc19wYWdpbmcoKnQpICYmICFwMm1faXNfcG9kKCp0KSApCj4gPiArICAgICAgICBp
ZiAoICFwMm1faXNfcmFtKCp0KSAmJiAhcDJtX2lzX3BhZ2luZygqdCkgJiYgIXAybV9pc19wb2Qo
KnQpICYmCj4gPiArICAgICAgICAgICAgICFtZW1fc2hhcmluZ19pc19mb3JrKHAybS0+ZG9tYWlu
KSApCj4gPiAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4KPiBUaGlzIGxvb2tzIHByZXR0eSBi
cm9hZCBhIGNvbmRpdGlvbiwgaS5lLiBhbGwgcG9zc2libGUgdHlwZXMgd291bGQKPiBtYWtlIGl0
IHRocm91Z2ggaGVyZSBmb3IgYSBmb3JrLiBXb3VsZG4ndCBpdCBtYWtlIHNlbnNlIHRvIGxpbWl0
Cj4gdG8gdG8gcDJtX2lzX2hvbGUoKSBwYWdlIHR5cGVzLCBsaWtlIHlvdSBjaGVjayBmb3IgaW4K
PiBfX2dldF9nZm5fdHlwZV9hY2Nlc3MoKT8KCk5vIG5lZWQgdG8gcHV0IHRoYXQgY2hlY2sgaGVy
ZS4gQnkgYWxsb3dpbmcgdG8gZ28gZnVydGhlciB3aGVuIHdlIGhhdmUKYSBmb3JrZWQgVk0sIHRo
aXMgY29kZS1wYXRoIHdpbGwgY2FsbCBnZXRfZ2ZuX3R5cGVfYWNjZXNzLCB3aGljaCBkb2VzCnRo
YXQgY2hlY2suIEl0J3MgYmV0dGVyIHRvIGhhdmUgdGhhdCBjaGVjayBhdCBvbmUgcGxhY2UgaW5z
dGVhZCBvZiBhbGwKb3ZlciB1bm5lY2Vzc2FyaWx5LgoKPgo+ID4gLS0tIGEveGVuL2NvbW1vbi9k
b21haW4uYwo+ID4gKysrIGIveGVuL2NvbW1vbi9kb21haW4uYwo+ID4gQEAgLTEyNjksNiArMTI2
OSw5IEBAIGludCBtYXBfdmNwdV9pbmZvKHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBsb25nIGdm
biwgdW5zaWduZWQgb2Zmc2V0KQo+ID4KPiA+ICAgICAgdi0+dmNwdV9pbmZvID0gbmV3X2luZm87
Cj4gPiAgICAgIHYtPnZjcHVfaW5mb19tZm4gPSBwYWdlX3RvX21mbihwYWdlKTsKPiA+ICsjaWZk
ZWYgQ09ORklHX01FTV9TSEFSSU5HCj4gPiArICAgIHYtPnZjcHVfaW5mb19vZmZzZXQgPSBvZmZz
ZXQ7Cj4gPiArI2VuZGlmCj4KPiBTZWVpbmcgc29tZXRoaW5nIGxpa2UgdGhpcyBtYWtlcyBtZSB3
b25kZXIgd2hldGhlciBmb3JraW5nIHNob3VsZG4ndAo+IGhhdmUgaXRzIG93biBLY29uZmlnIGNv
bnRyb2wuCgpGb3Igbm93IEkgdGhpbmsgaXQncyBmaW5lIHRvIGhhdmUgaXQgdW5kZXIgbWVtX3No
YXJpbmcuCgo+Cj4gPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21lbV9zaGFyaW5nLmgKPiA+
ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbWVtX3NoYXJpbmcuaAo+ID4gQEAgLTM5LDYgKzM5
LDkgQEAgc3RydWN0IG1lbV9zaGFyaW5nX2RvbWFpbgo+ID4KPiA+ICAjZGVmaW5lIG1lbV9zaGFy
aW5nX2VuYWJsZWQoZCkgKChkKS0+YXJjaC5odm0ubWVtX3NoYXJpbmcuZW5hYmxlZCkKPiA+Cj4g
PiArI2RlZmluZSBtZW1fc2hhcmluZ19pc19mb3JrKGQpIFwKPiA+ICsgICAgKG1lbV9zaGFyaW5n
X2VuYWJsZWQoZCkgJiYgISEoKGQpLT5wYXJlbnQpKQo+Cj4gQWdhaW4gbm90IG5lZWQgZm9yICEh
IChmb3IgYSBkaWZmZXJlbnQgcmVhc29uKS4KCldoaWNoIGlzPwoKPgo+IEFsc28sIGRvZXMgdGhl
IGJ1aWxkIGJyZWFrIGlmIHlvdSBtYWRlIHRoaXMgYW4gaW5saW5lIGZ1bmN0aW9uCj4gKGFzIHdl
IGdlbmVyYWxseSBwcmVmZXIpPwoKQW55IHBhcnRpY3VsYXIgcmVhc29uIGZvciB0aGF0IChpbmxp
bmUgdnMgZGVmaW5lKT8KCj4KPiA+IEBAIC0xNDEsNiArMTQ4LDE2IEBAIHN0YXRpYyBpbmxpbmUg
aW50IG1lbV9zaGFyaW5nX25vdGlmeV9lbm9tZW0oc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQg
bG9uZyBnZm4sCj4gPiAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKPiA+ICB9Cj4gPgo+ID4gK3N0
YXRpYyBpbmxpbmUgaW50IG1lbV9zaGFyaW5nX2Zvcmsoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0
IGRvbWFpbiAqY2QsIGJvb2wgdmNwdSkKPiA+ICt7Cj4gPiArICAgIHJldHVybiAtRU9QTk9UU1VQ
UDsKPiA+ICt9CgpUaGlzIGFjdHVhbGx5IGlzIG5vIGxvbmdlciBuZWVkZWQgYXQgYWxsLgoKPiA+
ICsKPiA+ICtzdGF0aWMgaW5saW5lIGludCBtZW1fc2hhcmluZ19mb3JrX3BhZ2Uoc3RydWN0IGRv
bWFpbiAqZCwgZ2ZuX3QgZ2ZuLCBib29sIGxvY2spCj4gPiArewo+ID4gKyAgICByZXR1cm4gLUVP
UE5PVFNVUFA7Cj4gPiArfQo+Cj4gQ2FuIHRoZXNlIGJlIHJlYWNoZWQ/IElmIG5vdCwgcGxlYXNl
IGFkZCBBU1NFUlRfVU5SRUFDSEFCTEUoKS4KClRoaXMgY2FuIGJlIHJlYWNoZWQuCgo+Cj4gPiBA
QCAtNTMyLDYgKzUzMywxMCBAQCBzdHJ1Y3QgeGVuX21lbV9zaGFyaW5nX29wIHsKPiA+ICAgICAg
ICAgICAgICAgICAgdWludDMyX3QgZ3JlZjsgICAgIC8qIElOOiBncmVmIHRvIGRlYnVnICAgICAg
ICAgKi8KPiA+ICAgICAgICAgICAgICB9IHU7Cj4gPiAgICAgICAgICB9IGRlYnVnOwo+ID4gKyAg
ICAgICAgc3RydWN0IG1lbV9zaGFyaW5nX29wX2ZvcmsgeyAgICAgIC8qIE9QX0ZPUksgKi8KPiA+
ICsgICAgICAgICAgICBkb21pZF90IHBhcmVudF9kb21haW47ICAgICAgICAvKiBJTjogcGFyZW50
J3MgZG9tYWluIGlkICovCj4gPiArICAgICAgICAgICAgdWludDE2X3QgX3BhZFszXTsgICAgICAg
ICAgICAgLyogTXVzdCBiZSBzZXQgdG8gMCAqLwo+Cj4gRXNwZWNpYWxseSBpbiB0aGUgcHVibGlj
IGludGVyZmFjZSAtIG5vIG5ldyBuYW1lIHNwYWNlCj4gdmlvbGF0aW9ucyBwbGVhc2UuIEkuZS4g
cGxlYXNlIGRyb3AgdGhlIGxlYWRpbmcgdW5kZXJzY29yZS4KPiBJIGFsc28gc3RydWdnbGUgdG8g
c2VlIHdoeSB0aGlzIGlzIGFuIGFycmF5IG9mIHRocmVlCj4gZWxlbWVudHMuIEluIGZhY3QgSSBk
b24ndCBzZWUgd2h5IHRoZSBwYWRkaW5nIGZpZWxkIHdvdWxkIGJlCj4gbmVlZGVkIGF0IGFsbCAt
IG9uZSBvdGhlciB1bmlvbiBtZW1iZXIgb25seSBnZXRzIHBhZGRlZCB0bwo+IGl0cyBhbGlnbm1l
bnQgKHdoaWNoIGlzIHdoYXQgSSdkIGV4cGVjdCksIHdoaWxlIG90aGVycwo+IChwcmVzdW1hYmx5
IG9sZGVyIG9uZXMpIGRvbid0IGhhdmUgYW55IHBhZGRpbmcgYXQgYWxsLiBIZXJlCj4gdGhlcmUn
cyBubyBpbXBsaWNpdCBzdHJ1Y3R1cmUncyBhbGlnbm1lbnQgcGFkZGluZyB0aGF0IHdhbnRzCj4g
bWFraW5nIGV4cGxpY2l0LgoKSSBkb24ndCBrbm93IHdoYXQgeW91IGFyZSBhc2tpbmcuIERyb3Ag
dGhlIHBhZGRpbmc/IEkgcHJlZmVyIGVhY2gKdW5pb24gbWVtYmVyIHRvIGJlIHBhZGRlZCB0byA2
NC1iaXQsIHJlZHVjZXMgY29nbml0aXZlIGxvYWQgdHJ5aW5nIHRvCmZpZ3VyZSBvdXQgd2hhdCB0
aGUgc2l6ZSBhbmQgYWxnaW5tZW50IG9mIGVhY2ggbWVtYmVyIHN0cnVjdCB3b3VsZCBiZS4KCj4K
PiA+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCj4gPiArKysgYi94ZW4vaW5jbHVkZS94
ZW4vc2NoZWQuaAo+ID4gQEAgLTI0OCw2ICsyNDgsOSBAQCBzdHJ1Y3QgdmNwdQo+ID4KPiA+ICAg
ICAgLyogR3Vlc3Qtc3BlY2lmaWVkIHJlbG9jYXRpb24gb2YgdmNwdV9pbmZvLiAqLwo+ID4gICAg
ICBtZm5fdCAgICAgICAgICAgIHZjcHVfaW5mb19tZm47Cj4gPiArI2lmZGVmIENPTkZJR19NRU1f
U0hBUklORwo+ID4gKyAgICB1aW50MzJfdCAgICAgICAgIHZjcHVfaW5mb19vZmZzZXQ7Cj4KPiBU
aGVyZSdzIG5vIG5lZWQgZm9yIGEgZml4ZWQgd2lkdGggdHlwZSBoZXJlIGFmYWljcyAtIHVuc2ln
bmVkCj4gaW50IGFuZCBwcm9iYWJseSBldmVuIHVuc2lnbmVkIHNob3J0IHdvdWxkIHNlZW0gdG8g
Ym90aCBiZQo+IGZpbmUuCgpPSy4KClRoYW5rcywKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

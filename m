Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F35FE3CC
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 18:18:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVfCz-00024I-8P; Fri, 15 Nov 2019 17:16:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SiVl=ZH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iVfCy-00024D-4g
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 17:16:32 +0000
X-Inumbo-ID: aa71094e-07cb-11ea-a27d-12813bfff9fa
Received: from mail-lf1-f66.google.com (unknown [209.85.167.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa71094e-07cb-11ea-a27d-12813bfff9fa;
 Fri, 15 Nov 2019 17:16:31 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id i26so8601634lfl.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 09:16:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0jfAmuOnx8UZgo2FCczz1haEf63FUEGwhDDvcGg0z38=;
 b=iArb4Ohsqpk36DEK8QV4JawjKu7SznlmLsT6tV+4Or8jtn3AOT20+PKXyVzzOWgwjn
 Dg7JAhTEJ0K5fxsegfwKM24o0TE7B5nY7LbpAIOknIydyfuKNhM6fSk/+BhDfHbW6Jz1
 /wJdTPwBd0wn0u0VrKLbitbq9RQogY76rgjYyxWQKFBBLt9fppehyZ3H6gcpNUjC4NlT
 zHfCrlfGPdn9VpfmeReqIcNnbLbOtGrsFgYj0raWZIISPl1ZnB9q2JvzDyjyK9yk9SBt
 YmuaA/keERGJBxCCxOCAVXiu5vYbwB1Z7vgQTR/pot56jmlPg9KXZRXTrlRZW9Mr9OQC
 9E+g==
X-Gm-Message-State: APjAAAXLVP8A2ALq+gwb0Rpqcz7SkcKnvCGy8pV+I7PhRtebcVYo5wkc
 trKSOLSry/sCFfGbiOMDwpIpJhRN9WY=
X-Google-Smtp-Source: APXvYqxr0vsCXz5wFWw7IFs9fALKyE5frLAewhReIljdzeRf5f9Ac4Z5z1pfhKVmBBFW0ZN8/nPhyA==
X-Received: by 2002:a5d:4a85:: with SMTP id o5mr17168437wrq.109.1573838189973; 
 Fri, 15 Nov 2019 09:16:29 -0800 (PST)
Received: from debian (74.162.147.147.dyn.plus.net. [147.147.162.74])
 by smtp.gmail.com with ESMTPSA id y78sm10990577wmd.32.2019.11.15.09.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 09:16:29 -0800 (PST)
Date: Fri, 15 Nov 2019 17:16:27 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191115171627.vqafpuo2ic3ymhvj@debian>
References: <cover.1570034362.git.hongyax@amazon.com>
 <177843fa29560291b8af90db5daffe4852ea96b7.1570034362.git.hongyax@amazon.com>
 <98238224-df4e-5ff0-95d1-1f9f93ca0ab6@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <98238224-df4e-5ff0-95d1-1f9f93ca0ab6@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v3 2/9] x86: introduce a new set of APIs to
 manage Xen page tables
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Hongyan Xia <hongyax@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMDQ6MjM6MzBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDIuMTAuMjAxOSAxOToxNiwgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4gPiBAQCAtNDg0
NywyMiArNDg0OCw1MCBAQCBpbnQgbW1jZmdfaW50ZXJjZXB0X3dyaXRlKAo+ID4gIH0KPiA+ICAK
PiA+ICB2b2lkICphbGxvY194ZW5fcGFnZXRhYmxlKHZvaWQpCj4gPiArewo+ID4gKyAgICBtZm5f
dCBtZm47Cj4gPiArCj4gPiArICAgIG1mbiA9IGFsbG9jX3hlbl9wYWdldGFibGVfbmV3KCk7Cj4g
PiArICAgIEFTU0VSVCghbWZuX2VxKG1mbiwgSU5WQUxJRF9NRk4pKTsKPiA+ICsKPiA+ICsgICAg
cmV0dXJuIG1hcF94ZW5fcGFnZXRhYmxlX25ldyhtZm4pOwo+ID4gK30KPiA+ICsKPiA+ICt2b2lk
IGZyZWVfeGVuX3BhZ2V0YWJsZSh2b2lkICp2KQo+ID4gK3sKPiA+ICsgICAgaWYgKCBzeXN0ZW1f
c3RhdGUgIT0gU1lTX1NUQVRFX2Vhcmx5X2Jvb3QgKQo+ID4gKyAgICAgICAgZnJlZV94ZW5fcGFn
ZXRhYmxlX25ldyh2aXJ0X3RvX21mbih2KSk7Cj4gPiArfQo+ID4gKwo+ID4gK21mbl90IGFsbG9j
X3hlbl9wYWdldGFibGVfbmV3KHZvaWQpCj4gPiAgewo+ID4gICAgICBpZiAoIHN5c3RlbV9zdGF0
ZSAhPSBTWVNfU1RBVEVfZWFybHlfYm9vdCApCj4gPiAgICAgIHsKPiA+ICAgICAgICAgIHZvaWQg
KnB0ciA9IGFsbG9jX3hlbmhlYXBfcGFnZSgpOwo+ID4gIAo+ID4gICAgICAgICAgQlVHX09OKCFo
YXJkd2FyZV9kb21haW4gJiYgIXB0cik7Cj4gPiAtICAgICAgICByZXR1cm4gcHRyOwo+ID4gKyAg
ICAgICAgcmV0dXJuIHZpcnRfdG9fbWZuKHB0cik7Cj4gPiAgICAgIH0KPiA+ICAKPiA+IC0gICAg
cmV0dXJuIG1mbl90b192aXJ0KG1mbl94KGFsbG9jX2Jvb3RfcGFnZXMoMSwgMSkpKTsKPiA+ICsg
ICAgcmV0dXJuIGFsbG9jX2Jvb3RfcGFnZXMoMSwgMSk7Cj4gPiAgfQo+ID4gIAo+ID4gLXZvaWQg
ZnJlZV94ZW5fcGFnZXRhYmxlKHZvaWQgKnYpCj4gPiArdm9pZCAqbWFwX3hlbl9wYWdldGFibGVf
bmV3KG1mbl90IG1mbikKPiAKPiBUaGVyZSdzIG5vIG5lZWQgZm9yIHRoZSBtYXAvdW5tYXAgZnVu
Y3Rpb25zIHRvIGhhdmUgYSBfbmV3Cj4gc3VmZml4LCBpcyB0aGVyZT8KPiAKCkl0IGlzIG1vcmUg
Y29uc2lzdGVudC4KCj4gPiAgewo+ID4gLSAgICBpZiAoIHN5c3RlbV9zdGF0ZSAhPSBTWVNfU1RB
VEVfZWFybHlfYm9vdCApCj4gPiAtICAgICAgICBmcmVlX3hlbmhlYXBfcGFnZSh2KTsKPiA+ICsg
ICAgcmV0dXJuIG1mbl90b192aXJ0KG1mbl94KG1mbikpOwo+ID4gK30KPiA+ICsKWy4uLl0KPiAK
PiA+ICt7Cj4gPiArICAgIC8qIFhYWCBzdGlsbCB1c2luZyB4ZW5oZWFwIHBhZ2UsIG5vIG5lZWQg
dG8gZG8gYW55dGhpbmcuICAqLwo+IAo+IEkgd29uZGVyIGlmIGl0IHdvdWxkbid0IGJlIGEgZ29v
ZCBpZGVhIHRvIGF0IGxlYXN0IGhhdmUgc29tZQo+IGxlYWsgZGV0ZWN0aW9uIGhlcmUgdGVtcG9y
YXJpbHksIHN1Y2ggdGhhdCB3ZSBoYXZlIGEgY2hhbmNlIG9mCj4gbm90aWNpbmcgcGF0aHMgbm90
IHByb3Blcmx5IGRvaW5nIHRoZSBuZWNlc3NhcnkgdW5tYXBwaW5nLgo+IAo+IFRoZSBhZ2FpbiBh
IHF1ZXN0aW9uIGlzIHdoeSB5b3UgaW50cm9kdWNlIHN1Y2ggYSBtYXAvdW5tYXAgcGFpcgo+IGlu
IHRoZSBmaXJzdCBwbGFjZS4gVGhpcyBpcyBnb2luZyB0byBiZSBhIHRoaW4gd3JhcHBlciBhcm91
bmQKPiB7LHVufW1hcF9kb21haW5fcGFnZSgpIGluIHRoZSBlbmQgYW55d2F5LCBhbmQgaGVuY2Ug
Y2FsbGVycwo+IGNvdWxkIGFzIHdlbGwgYmUgc3dpdGNoZWQgdG8gY2FsbGluZyB0aG9zZSBmdW5j
dGlvbiBkaXJlY3RseSwKPiBhcyB0aGV5J3JlIG5vLW9wcyBvbiBYZW4gaGVhcCBwYWdlcy4KCgpB
bGwgcm9hZHMgbGVhZCB0byBSb21lLCBidXQgc29tZSByb2FkcyBhcmUgZWFzaWVyIHRoYW4gb3Ro
ZXJzLiAgSGF2aW5nIGEKc2V0IG9mIEFQSXMgdG8gZGVhbCB3aXRoIHBhZ2UgdGFibGVzIG1ha2Ug
dGhlIGNvZGUgZWFzaWVyIHRvIGZvbGxvdyBJTU8uCgpBbmQgd2UgY2FuIHBvdGVudGlhbGx5IGRv
IG1vcmUgc3R1ZmYgaW4gdGhpcyBmdW5jdGlvbiwgZm9yIGV4YW1wbGUsIG1ha2UKdGhlIHVubWFw
IGZ1bmN0aW9uIHRlc3QgaWYgdGhlIHBhZ2UgaXMgcmVhbGx5IGEgcGFnZSB0YWJsZSB0byBhdm9p
ZAptaXN1c2U7IG9yIGxpa2UgeW91IHNhaWQsIGhhdmUgc29tZSBsZWFrIGRldGVjdGlvbiBjaGVj
ayB0aGVyZS4KCkFsc28sIHBsZWFzZSBjb25zaWRlciB0aGVyZSBhcmUgZG96ZW5zIG9mIHBhdGNo
ZXMgdGhhdCBhcmUgYnVpbHQgb24gdG9wCm9mIHRoaXMgc2V0IG9mIG5ldyBBUElzLiAgSGF2aW5n
IHRvIHJld3JpdGUgdGhlbSBqdXN0IGZvciBtZWNoYW5pY2FsCmNoYW5nZXMgaXMgbm90IGZ1biBm
b3IgSG9uZ3lhbi4gSSB3b3VsZCBzdWdnZXN0IHdlIGJlIG1vcmUgcHJhZ21hdGljCmhlcmUuCgpX
ZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

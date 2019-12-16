Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C37FA120879
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 15:22:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igrDW-00066V-8o; Mon, 16 Dec 2019 14:19:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v9dV=2G=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1igrDV-00066Q-9b
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 14:19:21 +0000
X-Inumbo-ID: 082a4270-200f-11ea-88e7-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 082a4270-200f-11ea-88e7-bc764e2007e4;
 Mon, 16 Dec 2019 14:19:12 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y11so7447350wrt.6
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2019 06:19:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pWc8du4s6H9H0JdoQL6ObfTvVDwEC/gS7PwnXaFC7eE=;
 b=RJ/9y8rdxYoh2sNsZAranrgwbziICHw2YoQUAxQ3cFQfbnnvIwEBo5qw0ErTh3PmIy
 45o/fzvhhXfGPg4mTQtUxFoyzhfd9JjenrMtrHMYfTh/PTZY9DFpD8RSQuq1Agsa2Qwn
 rqfemfiyfU6+cBKa5+Yo08IOvZiDvDfYviSF76qos+EmdKEkdjLoBUtJAhyEp0x5Je14
 rKPNUKl8sgS+ktZYkEJbX6qKJTqr8CPMZ/udP1R5QkoKT2sTcCkTmnXK3Vs+SI9Mzaqm
 dxXqI592bjgtiMrWsbp37sDX+hR4qhSEnXVTNldckcxh5nY7ssRpouzmDzwdF/tEV7tL
 8LMA==
X-Gm-Message-State: APjAAAVr7JvKks7EAnJvD/Pe39Q5uN9/2Z3yB0Vit3KLWbCkeYbuuEd1
 yRxL4J3sh8M/ykbOYJyLJEY=
X-Google-Smtp-Source: APXvYqxNRa1jt0aTCapLHgYlrLlnNwKdDBP95gAEeLKkV4D7C/1MCHBvWFlOLhC35C8XIoYsxt2SnQ==
X-Received: by 2002:adf:f802:: with SMTP id s2mr30771646wrp.201.1576505951831; 
 Mon, 16 Dec 2019 06:19:11 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id 4sm20786400wmg.22.2019.12.16.06.19.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 06:19:11 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ad758354-b8e7-f5ef-b3cf-94a6a0d92bd4@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <eb7b413b-4e58-d509-eab2-758b3090eb74@xen.org>
Date: Mon, 16 Dec 2019 14:19:10 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <ad758354-b8e7-f5ef-b3cf-94a6a0d92bd4@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v4] gnttab: don't expose host physical
 address without need
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwNS8xMi8yMDE5IDE1OjM0LCBKYW4gQmV1bGljaCB3cm90ZToKPiBUcmFuc2xhdGVk
IGRvbWFpbnMgc2hvdWxkbid0IHNlZSBob3N0IHBoeXNpY2FsIGFkZHJlc3Nlcy4gV2hpbGUgdGhl
Cj4gYWRkcmVzcyBpcyBhbHNvIG5vdCBzdXBwb3NlZCB0byBiZSBoYW5kZWQgYmFjayBldmVuIHRv
IG5vbi10cmFuc2xhdGVkCj4gZG9tYWlucyB3aGVuIEdOVE1BUF9kZXZpY2VfbWFwIGlzIG5vdCBz
ZXQgKGFzIGV4cGxpY2l0bHkgc3RhdGVkIGJ5IGEKPiBjb21tZW50IGluIHRoZSBwdWJsaWMgaGVh
ZGVyKSwgUFYga2VybmVscyAoTGludXggYXQgbGVhc3QpIGFzc3VtZSB0aGUKPiBmaWVsZCB0byBn
ZXQgcG9wdWxhdGVkIG5ldmVydGhlbGVzcy4gKFNpbWlsYXJseSBtYXBraW5kKCkgc2hvdWxkIGNo
ZWNrCj4gb25seSBHTlRNQVBfZGV2aWNlX21hcC4pCj4gCj4gQWxvbmcgdGhlc2UgbGluZXMgc3Bs
aXQgdGhlIHBhZ2luZyBtb2RlIHJlbGF0ZWQgY2hlY2sgbmVhciB0aGUgdG9wIG9mCj4gbWFwX2dy
YW50X3JlZigpIHRvIGhhbmRsZSB0aGUgImV4dGVybmFsIiBhbmQgInRyYW5zbGF0ZWQiIGNhc2Vz
Cj4gc2VwYXJhdGVseSAoR05UTUFQX2RldmljZV9tYXAgdXNlIGdldHRpbmcgdGllZCB0byBiZWlu
ZyBub24tdHJhbnNsYXRlZAo+IHJhdGhlciB0aGFuIG5vbi1leHRlcm5hbCkuCj4gCj4gU3RpbGwg
YWxvbmcgdGhlc2UgbGluZXMgaW4gdGhlIHVubWFwcGluZyBjYXNlIHRoZXJlJ3Mgbm8gcG9pbnQg
Y2hlY2tpbmcKPiAtPmRldl9idXNfYWRkciB3aGVuIEdOVE1BUF9kZXZpY2VfbWFwIGlzbid0IHNl
dCAoYW5kIGhlbmNlIHRoZSBmaWVsZAo+IGlzbid0IGdvaW5nIHRvIGJlIGNvbnN1bWVkKS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gLS0tCj4g
djQ6IFJlLWJhc2Ugb3ZlciBkcm9wcGVkIHBhdGNoZXMuCj4gdjM6IE5ldy4KPiAKPiAtLS0gYS94
ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKPiArKysgYi94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMK
PiBAQCAtOTY3LDEwICs5NjcsMTYgQEAgbWFwX2dyYW50X3JlZigKPiAgICAgICB9Cj4gICAKPiAg
ICAgICBpZiAoIHVubGlrZWx5KHBhZ2luZ19tb2RlX2V4dGVybmFsKGxkKSAmJgo+IC0gICAgICAg
ICAgICAgICAgICAob3AtPmZsYWdzICYgKEdOVE1BUF9kZXZpY2VfbWFwfEdOVE1BUF9hcHBsaWNh
dGlvbl9tYXB8Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBHTlRNQVBfY29udGFpbnNf
cHRlKSkpICkKPiArICAgICAgICAgICAgICAgICAgKG9wLT5mbGFncyAmIChHTlRNQVBfYXBwbGlj
YXRpb25fbWFwfEdOVE1BUF9jb250YWluc19wdGUpKSkgKQo+ICAgICAgIHsKPiAtICAgICAgICBn
ZHByaW50ayhYRU5MT0dfSU5GTywgIk5vIGRldmljZSBtYXBwaW5nIGluIEhWTSBkb21haW5cbiIp
Owo+ICsgICAgICAgIGdkcHJpbnRrKFhFTkxPR19JTkZPLCAiTm8gYXBwL3B0ZSBtYXBwaW5nIGlu
IEhWTSBkb21haW5cbiIpOwo+ICsgICAgICAgIG9wLT5zdGF0dXMgPSBHTlRTVF9nZW5lcmFsX2Vy
cm9yOwo+ICsgICAgICAgIHJldHVybjsKPiArICAgIH0KPiArCj4gKyAgICBpZiAoIHBhZ2luZ19t
b2RlX3RyYW5zbGF0ZShsZCkgJiYgdW5saWtlbHkob3AtPmZsYWdzICYgR05UTUFQX2RldmljZV9t
YXApICkKClRoZXJlIGlzIGF0IGxlYXN0IG9uZSBpbnN0YW5jZSBpbiBMaW51eCB3aGVyZSBHTlRN
QVBfZGV2aWNlX21hcCBtYXkgYmUgCmdpdmVuIHJlZ2FyZGxlc3MgdGhlIHR5cGUgb2YgdGhlIGd1
ZXN0LiBTZWUgZG1hYnVmX2V4cF9mcm9tX3JlZnMoKSBpbiAKZHJpdmVycy94ZW4vZ250ZGV2LWRt
YWJ1Zi5jLgoKSG93IGFyZSB5b3UgZ29pbmcgdG8gZGVhbCB3aXRoIHRoZW0/Cgo+ICsgICAgewo+
ICsgICAgICAgIGdkcHJpbnRrKFhFTkxPR19JTkZPLCAiTm8gZGV2aWNlIG1hcHBpbmcgaW4gdHJh
bnNsYXRlZCBkb21haW5cbiIpOwo+ICAgICAgICAgICBvcC0+c3RhdHVzID0gR05UU1RfZ2VuZXJh
bF9lcnJvcjsKPiAgICAgICAgICAgcmV0dXJuOwo+ICAgICAgIH0KPiBAQCAtMTIxMyw3ICsxMjE5
LDggQEAgbWFwX2dyYW50X3JlZigKPiAgICAgICBpZiAoIG5lZWRfaW9tbXUgKQo+ICAgICAgICAg
ICBkb3VibGVfZ3RfdW5sb2NrKGxndCwgcmd0KTsKPiAgIAo+IC0gICAgb3AtPmRldl9idXNfYWRk
ciA9IG1mbl90b19tYWRkcihtZm4pOwo+ICsgICAgb3AtPmRldl9idXNfYWRkciA9IHBhZ2luZ19t
b2RlX3RyYW5zbGF0ZShsZCkgPyBvcC0+aG9zdF9hZGRyCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6IG1mbl90b19tYWRkcihtZm4pOwoKVGhlICJo
b3N0X2FkZHIiIGlzIHByZXR0eSBjb25mdXNpbmcuIEkgZmlyc3QgdGhvdWdodCBpdCB3b3VsZCBi
ZSBhICJIb3N0IApQaHlzaWNhbCBBZGRyZXNzIiBidXQgaXQgc2VlbXMgdG8gYmUgYSAiR3Vlc3Qg
UGh5c2ljYWwgYWRkcmVzcyIKCklmIHNvLCB0aGlzIGlzIGdvaW5nIHRvIGJyZWFrIExpbnV4IERv
bTAgb24gQXJtIHdoZXJlIGl0IGlzIGV4cGVjdGVkIHRvIApyZXR1cm4gdGhlIG1hY2hpbmUgcGh5
c2ljYWwgYWRkcmVzcyB0byBoYXZlIGEgRE1BIGZ1bGx5IHdvcmtpbmcuCgpJIGRvbid0IGFiaWRl
IHdpdGggdGhlIGN1cnJlbnQgYmVoYXZpb3Igb24gQXJtLCBidXQgSSBkb24ndCB0aGluayB3ZSAK
c2hvdWxkIGJyZWFrIHRoZW0gd2hlbiB0aGVyZSBhcmUgbm8gcmVwbGFjZW1lbnQgZm9yIGl0LgoK
U28gaXQgd291bGQgYmUgYmV0dGVyIGlmIHdlIGxvb2sgYXQgYSBkaWZmZXJlbnQgYXBwcm9hY2gg
KGkuZSBhIG5ldyBmbGFnIApvciBzdHJpY3QgbW9kZSkgaW4gb3JkZXIgdG8gYXZvaWQgYnJlYWth
Z2UuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs

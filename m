Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF3114714E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 20:01:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuhgU-0004U8-2r; Thu, 23 Jan 2020 18:58:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l7XC=3M=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1iuhgR-0004U3-Vw
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 18:58:28 +0000
X-Inumbo-ID: 510cdd10-3e12-11ea-9fd7-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 510cdd10-3e12-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 18:58:18 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1579805899; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=Aa2Z4/Z1b5BxB4veS2SbOc1XYRHGiQxmG1Lwgx8MHhY=;
 b=bcBRPmc2eFk962sImxh9sBI/dOno3vArgFjiRstC+xMzpI8qhG5qYzpsJmXpKwlrWSo3UZnz
 eh7lqzeVxLyIwLXzzqsGKT45BvIVvdCPAqXbdQf6WCeCVX+NLiIDuK1CDvR5trCJODz/fkvn
 sO5FXBX3bC6uyiIQ5wofuGfE7g8=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mxa.mailgun.org with ESMTP id 5e29ecc3.7f93ece89770-smtp-out-n03;
 Thu, 23 Jan 2020 18:58:11 -0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id g17so4348900wro.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2020 10:58:10 -0800 (PST)
X-Gm-Message-State: APjAAAU02riypzjpW+kzeXUrVq5QzH4orKU+TYwaVIIA8fKXyFAT8ioQ
 cfxAQf7CaKU/CnoD+wHrdaCxKFD9h/mMInG5J+8=
X-Google-Smtp-Source: APXvYqzjrNs0E9MvT49FeekxLtEsc6jRJlS/3LsvVRAjXzC73JF2RbiZcvqtwcClDqj2tBDGVtif+QSM1KKDMMXpsAE=
X-Received: by 2002:adf:f5cf:: with SMTP id k15mr19865849wrp.182.1579805889902; 
 Thu, 23 Jan 2020 10:58:09 -0800 (PST)
MIME-Version: 1.0
References: <20200117133059.14602-1-aisaila@bitdefender.com>
 <25903c05-3582-9fe1-bd7d-23f265c760ae@citrix.com>
In-Reply-To: <25903c05-3582-9fe1-bd7d-23f265c760ae@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 23 Jan 2020 11:57:33 -0700
X-Gmail-Original-Message-ID: <CABfawhk_e+0fXv7me_RY2PK199k4R=miKfhyEfuScaGQ4VgsrQ@mail.gmail.com>
Message-ID: <CABfawhk_e+0fXv7me_RY2PK199k4R=miKfhyEfuScaGQ4VgsrQ@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH V8 1/4] x86/mm: Add array_index_nospec to
 guest provided index values
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
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMjMsIDIwMjAgYXQgMTE6NDUgQU0gQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAxNy8wMS8yMDIwIDEzOjMxLCBBbGV4YW5k
cnUgU3RlZmFuIElTQUlMQSB3cm90ZToKPiA+IFRoaXMgcGF0Y2ggYWltcyB0byBzYW5pdGl6ZSBp
bmRleGVzLCBwb3RlbnRpYWxseSBndWVzdCBwcm92aWRlZAo+ID4gdmFsdWVzLCBmb3IgYWx0cDJt
X2VwdHBbXSBhbmQgYWx0cDJtX3AybVtdIGFycmF5cy4KPiA+Cj4gPiBSZXF1ZXN0ZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRy
dSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPgo+ID4gQWNrZWQtYnk6IFRhbWFzIEsg
TGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KPgo+IFNvbWV0aGluZyBpbiB0aGlzIHNlcmll
cyBicm9rZSB0aGUgQVJNIGJ1aWxkLiAgU29ycnksIGJ1dCBJIGRvbid0IGhhdmUKPiBhbnkgZnVy
dGhlciB0aW1lIHRvIGludmVzdGlnYXRlLgo+Cj4gZ2NjIC1EQlVJTERfSUQgLWZuby1zdHJpY3Qt
YWxpYXNpbmcgLXN0ZD1nbnU5OSAtV2FsbCAtV3N0cmljdC1wcm90b3R5cGVzCj4gLVdkZWNsYXJh
dGlvbi1hZnRlci1zdGF0ZW1lbnQgLVduby11bnVzZWQtYnV0LXNldC12YXJpYWJsZQo+IC1Xbm8t
dW51c2VkLWxvY2FsLXR5cGVkZWZzIC1PMSAtZm5vLW9taXQtZnJhbWUtcG9pbnRlciAtbm9zdGRp
bmMKPiAtZm5vLWJ1aWx0aW4gLWZuby1jb21tb24gLVdlcnJvciAtV3JlZHVuZGFudC1kZWNscyAt
V25vLXBvaW50ZXItYXJpdGgKPiAtV3ZsYSAtcGlwZSAtRF9fWEVOX18gLWluY2x1ZGUKPiAvYnVp
bGRzL3hlbi1wcm9qZWN0L3hlbi94ZW4vaW5jbHVkZS94ZW4vY29uZmlnLmgKPiAnLURfX09CSkVD
VF9GSUxFX189ImFzbS1vZmZzZXRzLnMiJyAtV2EsLS1zdHJpcC1sb2NhbC1hYnNvbHV0ZSAtZyAt
TU1ECj4gLU1GIC4vLmFzbS1vZmZzZXRzLnMuZCAtbWNwdT1nZW5lcmljIC1tZ2VuZXJhbC1yZWdz
LW9ubHkKPiAtSS9idWlsZHMveGVuLXByb2plY3QveGVuL3hlbi9pbmNsdWRlIC1mbm8tc3RhY2st
cHJvdGVjdG9yCj4gLWZuby1leGNlcHRpb25zIC1XbmVzdGVkLWV4dGVybnMgLURHQ0NfSEFTX1ZJ
U0lCSUxJVFlfQVRUUklCVVRFIC1TIC1vCj4gYXNtLW9mZnNldHMucyBhcm02NC9hc20tb2Zmc2V0
cy5jCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC9idWlsZHMveGVuLXByb2plY3QveGVuL3hlbi9p
bmNsdWRlL2FzbS9wMm0uaDo3LAo+ICAgICAgICAgICAgICAgICAgZnJvbSAvYnVpbGRzL3hlbi1w
cm9qZWN0L3hlbi94ZW4vaW5jbHVkZS9hc20vZG9tYWluLmg6NywKPiAgICAgICAgICAgICAgICAg
IGZyb20gL2J1aWxkcy94ZW4tcHJvamVjdC94ZW4veGVuL2luY2x1ZGUveGVuL2RvbWFpbi5oOjgs
Cj4gICAgICAgICAgICAgICAgICBmcm9tIC9idWlsZHMveGVuLXByb2plY3QveGVuL3hlbi9pbmNs
dWRlL3hlbi9zY2hlZC5oOjExLAo+ICAgICAgICAgICAgICAgICAgZnJvbSBhcm02NC9hc20tb2Zm
c2V0cy5jOjk6Cj4gL2J1aWxkcy94ZW4tcHJvamVjdC94ZW4veGVuL2luY2x1ZGUveGVuL21lbV9h
Y2Nlc3MuaDo2MTo0NzogZXJyb3I6Cj4gJ3N0cnVjdCBwMm1fZG9tYWluJyBkZWNsYXJlZCBpbnNp
ZGUgcGFyYW1ldGVyIGxpc3Qgd2lsbCBub3QgYmUgdmlzaWJsZQo+IG91dHNpZGUgb2YgdGhpcyBk
ZWZpbml0aW9uIG9yIGRlY2xhcmF0aW9uIFstV2Vycm9yXQo+ICBib29sIHhlbm1lbV9hY2Nlc3Nf
dG9fcDJtX2FjY2Vzcyhjb25zdCBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fgo+IC9idWlsZHMv
eGVuLXByb2plY3QveGVuL3hlbi9pbmNsdWRlL3hlbi9tZW1fYWNjZXNzLmg6ODM6Mzg6IGVycm9y
Ogo+ICdzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fc3VwcHJlc3NfdmVfbXVsdGknIGRlY2xhcmVkIGlu
c2lkZSBwYXJhbWV0ZXIgbGlzdAoKTG9va3MgbGlrZSB3ZSBuZWVkIGFuIGV4cGxpY2l0IGluY2x1
ZGUgZm9yIGFzbS9wMm0uaCBhbmQKcHVibGljL2h2bS9odm1fb3AuaCBpbiB0aGUgbWVtX2FjY2Vz
cy5oIGhlYWRlciAoYm90aCBvZiB3aGljaCBlbmQgdXAKYmVpbmcgaW5jbHVkZWQgcHJpb3IgdG8g
bWVtX2FjY2Vzcy5oIG9uIGFuIHg4NiBidWlsZCkuIEFsdGhvdWdoIGZyb20KdGhlIGxvb2tzIG9m
IGl0IHdyYXBwaW5nIHRoZSBfdmUgZnVuY3Rpb25zIGluICNpZmRlZiBDT05GSUdfWDg2IC4uCiNl
bmRpZiB3b3VsZCBiZSBldmVuIGJldHRlci4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs

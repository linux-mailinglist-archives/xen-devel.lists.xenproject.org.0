Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F1C17F77D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 13:32:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBe1d-0006v7-Oi; Tue, 10 Mar 2020 12:30:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HhRS=43=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jBe1c-0006v1-LH
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 12:30:20 +0000
X-Inumbo-ID: e78591ce-62ca-11ea-a6c1-bc764e2007e4
Received: from mail-ed1-x52e.google.com (unknown [2a00:1450:4864:20::52e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e78591ce-62ca-11ea-a6c1-bc764e2007e4;
 Tue, 10 Mar 2020 12:30:20 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id ca19so7087161edb.13
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2020 05:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=Vm24ONJCNbMp8uGOnrbGJnqGrsvGRszL49ZJCDU/bNI=;
 b=ZI8ZwKhRYwnv36L6wGay7COL3nGNrDTs3Ri6L093TsUOnPUEh2OKvPX1ZTXzTR7tIt
 qmUVrqDpcrBb7w3pjWpbflT86B52dFnnLiCmcckaTNeZei4Ywm6P7nM4MOh1coqtE9y6
 IaKzOuJqgAoxdENWJq5IkhNBxDok9YREu0NJSklF0PeVoGkGq4TDTI5wcx7K1Op+nMyp
 xMc3cOzU1nKGovOdM0KwWsEjf6j+3qBCFS446zJTziJX1ONZ29UdYOgVfg1DwWrE76fD
 830M+dA508ErLAQLE28PVHvEC+dOXPva6un/7TUE/O+opEFwtGVdP6ltELB8sKCZ7Yxs
 HThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=Vm24ONJCNbMp8uGOnrbGJnqGrsvGRszL49ZJCDU/bNI=;
 b=HOUx9fPb7k7YGHRxqqUTHYqVmole0asLJIyaTbshsbs2ONkcCbLRP81hHkRz/VfUOZ
 neD2pNDpihlt2R3D6tzPwXx+p7GPr4aFyxPCDj5oAha8FGE4QZsc2CLE4L1rMPTTwPB1
 NEycx5N9HP8RTO4TPDLXI6QxlY4pHq07aiOYKoF2XoPK4fUXN5v8h/+kCcsl2LpxZ9L6
 GFxQpU2DosgHY1x7WZLVwwr/UQ+NJwzjqRMSQgn3VL5KvYNkSBv9y1rLgHpJ4xtqfDm7
 iNmC/2OjOGhmzwTlAi/m7Nw75cAQ/UyvJi8yUlfVOZFRp3WpltBo+ub+Eej3XKyXHTZb
 RJRA==
X-Gm-Message-State: ANhLgQ2kO8M6707XcVctvhcyULI0BxvesKMK6y0v2SVU0bAKxPuYkkIP
 fgD+W37kiPykADMLIhIMk00=
X-Google-Smtp-Source: ADFU+vtwBkBMKSxGdVoF/wAu2t3s/lQ21GlBFpUcvJLJ+2XmzW5SLUATMgPLYjlxq9uqpQvYMoReiw==
X-Received: by 2002:a17:906:b30f:: with SMTP id
 n15mr18913712ejz.236.1583843419028; 
 Tue, 10 Mar 2020 05:30:19 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id ck21sm1301868ejb.51.2020.03.10.05.30.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Mar 2020 05:30:18 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>, "'Tian, Kevin'" <kevin.tian@intel.com>
References: <83253657-b3b4-a045-b829-f8f4c4aeae28@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7C5CDC@SHSMSX104.ccr.corp.intel.com>
 <2999c86a-328f-927e-6b53-895d2fd788f6@suse.com>
In-Reply-To: <2999c86a-328f-927e-6b53-895d2fd788f6@suse.com>
Date: Tue, 10 Mar 2020 12:30:17 -0000
Message-ID: <000f01d5f6d7$a89fe3b0$f9dfab10$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJZoBACz6CdVNlWCO6Kdq3kziJjnAF185EEAMB17mmnKLnp4A==
Content-Language: en-gb
Subject: Re: [Xen-devel] [PATCH v3] IOMMU: make DMA containment of
 quarantined devices optional
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
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, 'Andrew Cooper' <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAxMCBNYXJjaCAyMDIwIDEwOjI3Cj4gVG86IFRpYW4sIEtldmlu
IDxrZXZpbi50aWFuQGludGVsLmNvbT47IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPgo+IENj
OiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2M10gSU9NTVU6IG1ha2Ug
RE1BIGNvbnRhaW5tZW50IG9mIHF1YXJhbnRpbmVkIGRldmljZXMgb3B0aW9uYWwKPiAKPiBPbiAx
MC4wMy4yMDIwIDA0OjQzLCBUaWFuLCBLZXZpbiB3cm90ZToKPiA+PiBGcm9tOiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPj4gU2VudDogTW9uZGF5LCBNYXJjaCA5LCAyMDIwIDc6
MDkgUE0KPiA+Pgo+ID4+IEknbSBoYXBweSB0byB0YWtlIGJldHRlciBzdWdnZXN0aW9ucyB0byBy
ZXBsYWNlIHRoZSAiZnVsbCIgY29tbWFuZCBsaW5lCj4gPj4gb3B0aW9uIGFuZCBLY29uZmlnIHBy
b21wdCB0b2tlbnMuIEkgZG9uJ3QgdGhpbmsgdGhvdWdoIHRoYXQgImZhdWx0IiBhbmQKPiA+PiAi
d3JpdGUtZmF1bHQiIGFyZSByZWFsbHkgc3VpdGFibGUgdGhlcmUuCj4gPgo+ID4gSSB0aGluayB3
ZSBtYXkganVzdCBhbGxvdyBib3RoIHIvdyBhY2Nlc3MgdG8gc2NyYXRjaCBwYWdlIGZvciBzdWNo
IGJvZ3VzCj4gPiBkZXZpY2UsIHdoaWNoIG1heSBtYWtlICdmdWxsJyBtb3JlIHJlYXNvbmFibGUg
c2luY2Ugd2Ugbm93IGZ1bGx5Cj4gPiBjb250YWluIGluLWZseSBETUFzLiBJJ20gbm90IHN1cmUg
YWJvdXQgdGhlIHZhbHVlIG9mIGtlZXBpbmcgd3JpdGUtZmF1bHQKPiA+IGFsb25lIGZvciBzdWNo
IGRldmljZXMgKGp1c3QgYmVjYXVzZSBvbmUgb2JzZXJ2ZWQgaGlzIHNwZWNpZmljIGRldmljZSBv
bmx5Cj4gPiBoYXMgcHJvYmxlbSB3aXRoIHJlYWQtZmF1bHQpLgo+IAo+IFdlbGwsIGEgZnVuZGFt
ZW50YWwgcHJvYmxlbSBJIGhhdmUgaGVyZSBpcyB0aGF0IEkgc3RpbGwgZG9uJ3Qga25vdwo+IHRo
ZSBfZXhhY3RfIGNvbmRpdGlvbnMgZm9yIHRoZSBvYnNlcnZlZCBoYW5ncy4gSSBjb25zaWRlciBp
dCB1bmxpa2VseQo+IGZvciBJT01NVSByZWFkIGZhdWx0cyB0byBjYXVzZSBoYW5ncywgYnV0IGZv
ciB3cml0ZSBmYXVsdHMgdG8gYmUKPiAiZmluZSIuCgpBRkFJSyBpdCdzIGJlY2F1c2UgdGhlIHdy
aXRlcyBhcmUgcG9zdGVkIGFuZCBzbyBhbnkgZmF1bHRzIGFyZSBqdXN0IGlnbm9yZWQsIHdoZXJl
YXMgYSByZWFkIGZhdWx0IGJlaW5nIHN5bmNocm9ub3VzIGNhdXNlcyB0aGUgZGV2aWNlJ3Mgc3Rh
dGUgbWFjaGluZSB0byBsb2NrIHVwLiBJdCByZWFsbHkgaXMgb2JzZXJ2ZWQgYmVoYXZpb3VyLgoK
PiBJdCB3b3VsZCBzZWVtIG1vcmUgbGlrZWx5IHRvIG1lIHRoYXQgZS5nLiBhIG5vbi1wcmVzZW50
Cj4gY29udGV4dCBlbnRyeSBtaWdodCBjYXVzZSBpc3N1ZXMuIElmIHRoYXQgd2FzIHRoZSBjYXNl
LCB3ZSB3b3VsZG4ndAo+IG5lZWQgdG8gaGFuZGxlIHJlYWRzIGFuZCB3cml0ZXMgZGlmZmVyZW50
bHk7IHdlIGNvdWxkIGluc3RlYWQgaW5zdGFsbAo+IGFuIGFsbCB6ZXJvIHRvcCBsZXZlbCBwYWdl
IHRhYmxlLiBBbmQgd2UnZCBzdGlsbCBnZXQgYWxsIGZhdWx0cyB0aGF0Cj4gYXJlIHN1cHBvc2Vk
IHRvIHN1cmZhY2UuIEJ1dCBwZXJoYXBzIFBhdWwgZGlkIHRyeSB0aGlzIGJhY2sgdGhlbiwgYW5k
Cj4gaXQgdHVybmVkIG91dCB0byBub3QgYmUgYW4gb3B0aW9uLgo+IAoKVGhlIG9ubHkgaW5mbyBJ
IGhhZCB3YXMgdGhhdCBmYXVsdHMgb24gRE1BIHJlYWRzIGhhZCB0byBhdm9pZGVkIGNvbXBsZXRl
bHkuIEkgZGlkIG5vdCBoYXZlIGFjY2VzcyB0byB0aGUgaC93IGluIHF1ZXN0aW9uIGF0IHRoZSB0
aW1lLiBJIG1heSBiZSBhYmxlIHRvIGdldCBpdCBub3cuCgogIFBhdWwKCj4gVGhlIGNob2ljZSBv
ZiBsZXR0aW5nIHdyaXRlcyBjb250aW51ZSB0byBmYXVsdCB3YXMgYmFzZWQgb24gKGEpIHRoaXMK
PiBoYXZpbmcgYmVlbiB0ZXN0ZWQgdG8gd29yayBvbiB0aGUgYWZmZWN0ZWQgc3lzdGVtKHMpIGFu
ZCAoYikgYWxzbwo+IGxldHRpbmcgd3JpdGVzIGdvIHRvIGEgc2NyYXRjaCBwYWdlIHJlcXVpcmlu
ZyBhIHBlci1kZXZpY2Ugc2NyYXRjaAo+IHBhZ2UgKGFuZCBhc3NvY2lhdGVkIHBhZ2UgdGFibGVz
KSByYXRoZXIgdGhhbiBhIHN5c3RlbS13aWRlIG9uZSwgYXMKPiBkZXZpY2VzIGNvbWluZyBmcm9t
IGRpZmZlcmVudCBkb21haW5zIHdvdWxkIG90aGVyd2lzZSBiZSBhYmxlIHRvCj4gb2JzZXJ2ZSBk
YXRhIHdyaXR0ZW4gdG8gbWVtb3J5IGJ5IHJlc3BlY3RpdmVseSAiZm9yZWlnbiIgZGV2aWNlcwo+
IChhbmQgaGVuY2UgZG9tYWlucykuCj4gCj4gQnV0IHRoaXMgaXMgYWxsIGd1ZXNzd29yayB3aXRo
b3V0IHRoZSBmaXJtd2FyZSB3cml0ZXJzIG9mIGFmZmVjdGVkCj4gc3lzdGVtcyBnaXZpbmcgdXMg
YXQgbGVhc3Qgc29tZSBoaW50cy4KPiAKPiA+IGFsdGVybmF0aXZlbHkgSSBhbHNvIHRob3VnaHQg
YWJvdXQgd2hldGhlciB3aGl0ZWxpc3RpbmcgdGhlIHByb2JsZW1hdGljCj4gPiBkZXZpY2VzIHRo
cm91Z2ggYW5vdGhlciBvcHRpb24gKGUuZy4gbm9mYXVsdD1iOmQ6ZikgY291bGQgcHJvdmlkZSBt
b3JlCj4gPiB2YWx1ZS4gSW4gY29uY2VwdCBhbnkgSU9NTVUgcGFnZSB0YWJsZSAoZG9tMCwgZG9t
X2lvIG9yIGRvbVUpCj4gPiBmb3Igc3VjaCBib2d1cyBkZXZpY2Ugc2hvdWxkIG5vdCBpbmNsdWRl
IGludmFsaWQgZW50cnksIGV2ZW4gd2hlbgo+ID4gcXVhcmFudGluZSBpcyBub3Qgc3BlY2lmaWVk
LiBIb3dldmVyIEknbSBub3Qgc3VyZSB3aGV0aGVyIGl0J3Mgd29ydGh5IG9mCj4gPiBnb2luZyBz
byBmYXIuLi4KPiAKPiBJbmRlZWQuIFF1ZXN0aW9uIHRob3VnaCBpcyB3aGV0aGVyIHRoaXMgYmFk
IGJlaGF2aW9yIGlzIGRldmljZSBzcGVjaWZpYwo+IChyYXRoZXIgdGhhbiBlLmcuIHN5c3RlbSBk
ZXBlbmRlbnQpLiBQbHVzIC0gYXMgcGVyIGFib3ZlIC0gcXVlc3Rpb24KPiBhbHNvIGlzIHdoZXRo
ZXIgaXQncyByZWFsbHkgbGVhZiAob3IgaW50ZXJtZWRpYXRlKSBwYWdlIHRhYmxlIGVudHJ5Cj4g
cHJlc2VuY2Ugd2hpY2ggYWN0dWFsbHkgbWF0dGVycyBoZXJlLiBJZiBpdCB3YXMsIEkgYWdyZWUg
d2Ugc2hvdWxkbid0Cj4gaGF2ZSBhbnkgbm9uLXByZXNlbnQgZW50cmllcyBhbnl3aGVyZSBpbiB0
aGUgcGFnZSB0YWJsZSB0cmVlcy4KPiAKPiBKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA761149317
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jan 2020 04:30:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ivC6A-0006DX-2L; Sat, 25 Jan 2020 03:27:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=i6Vi=3O=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1ivC68-0006DP-5J
 for xen-devel@lists.xenproject.org; Sat, 25 Jan 2020 03:27:00 +0000
X-Inumbo-ID: 8b5d4f34-3f22-11ea-aecd-bc764e2007e4
Received: from mail-yb1-xb44.google.com (unknown [2607:f8b0:4864:20::b44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b5d4f34-3f22-11ea-aecd-bc764e2007e4;
 Sat, 25 Jan 2020 03:26:59 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id l197so2017360ybf.7
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2020 19:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=AkT4RDgUOlPeRpDbVQBdH57XpLnH+YMMwlHZCgAPl/A=;
 b=dZjllH+20uAaVUTZ7XDdLbsGY1ltf8VMq7kz5K4uzjPbxAjHQcJrlVCYZTxtKcsXMD
 PKKL7IprAX9M4muCcACKEMcl7XDMBVfqsfUR577VZcyfPGYwPMtRySR40yNyvM4h5RUm
 J/JI+toLhJ2LsRdu8zF9v4ibGWmMNr1aTYe5SmpxlyFL+89r05VVsnrw6yQZSdkyvgtR
 WQYd1XHTZ2K5SII4xoQlMyZWTNbTXaa8NSjJDXuFcu8kguMwOcxr6gc6t9tSS6tKbrx8
 C0unOUmmJUUDDmPUx2PcT2f4QzevYxhTC/nTdcC8yGzpwww/qQ5nzQsuBghk4E51izd/
 cD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AkT4RDgUOlPeRpDbVQBdH57XpLnH+YMMwlHZCgAPl/A=;
 b=twOKKUiO8EMxNRt412de3y7WbkvVGVjyJtSNDJ3bWnAQdvDRg7hPMYxXCLDqpuVm60
 fZrUGOD8tEsCzPX3uNSaUmgXFbormiTpja4oICQ4cvynvfI06tFdo/JBYzHNMZ11rOC4
 B0QiSN8LgJNzmUGYd2cQYh/4Xx0LNgf72VwlKxlGdlO49aZ+Tr45xHmQXIPZ0fxsiE/A
 JHJq/cqDAFXalIi5b8LLVVxxwxwleY/WKwDbBUJrQOdfRQs5AV1MSwyUTIr5VnfZ3K2U
 7cnc80GnmRrQpr9sxyNcojjsCbL7sslU8Jsa2K6ftaElQcGwMDzFta3JuMQ1XorPTAb1
 2Vvg==
X-Gm-Message-State: APjAAAXCHA+3beEleKZaxk53iNSJqklPJZDxb3pUrxQE4h7nnjedd1+v
 JA4JEd4+eLEeo+VSq3I0kWM=
X-Google-Smtp-Source: APXvYqzVLXQScfBeEnS7fbdMQD0tVZMKiHOXFdF4slv4CM5WNrHa9tjFnmQHrp7Kjv/Zf+wXcSh7Lg==
X-Received: by 2002:a25:2545:: with SMTP id l66mr5061160ybl.221.1579922818177; 
 Fri, 24 Jan 2020 19:26:58 -0800 (PST)
Received: from bobbye-pc ([216.186.244.35])
 by smtp.gmail.com with ESMTPSA id i72sm3270067ywg.49.2020.01.24.19.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2020 19:26:57 -0800 (PST)
Date: Fri, 24 Jan 2020 21:26:55 -0600
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200125032655.GC11702@bobbye-pc>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
 <abbe5c9f-46e2-af76-a7ff-d98c55fa364f@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abbe5c9f-46e2-af76-a7ff-d98c55fa364f@citrix.com>
Subject: Re: [Xen-devel] [RFC XEN PATCH 00/23] xen: beginning support for
 RISC-V
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Dan Robertson <dan@dlrobertson.com>,
 Alistair Francis <alistair.francis@wdc.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMjQsIDIwMjAgYXQgMDE6NDE6MzhQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyMi8wMS8yMDIwIDAxOjU4LCBCb2JieSBFc2hsZW1hbiB3cm90ZToKPiA+IEN1
cnJlbnRseSwgdGhpcyBwYXRjaHNldCByZWFsbHkgb25seSBzZXRzIHVwIHZpcnR1YWwgbWVtb3J5
IGZvciBYZW4gYW5kCj4gPiBpbml0aWFsaXplcyBVQVJUIHRvIGVuYWJsZSBwcmludCBvdXRwdXQu
ICBOb25lIG9mIFJJU0MtVidzCj4gPiB2aXJ0dWFsaXphdGlvbiBzdXBwb3J0IGhhcyBiZWVuIGlt
cGxlbWVudGVkIHlldCwgYWx0aG91Z2ggdGhhdCBpcyB0aGUKPiA+IG5leHQgcm9hZCB0byBzdGFy
dCBnb2luZyBkb3duLiAgTWFueSBmdW5jdGlvbnMgb25seSBjb250YWluIGR1bW15Cj4gPiBpbXBs
ZW1lbnRhdGlvbnMuICBNYW55IHNob3J0Y3V0cyBoYXZlIGJlZW4gdGFrZW4gYW5kIFRPRE8ncyBo
YXZlIGJlZW4KPiA+IGxlZnQgYWNjb3JkaW5nbHkuICBJdCBpcyB2ZXJ5LCB2ZXJ5IHJvdWdoLiAg
QmUgZm9yZXdhcm5lZDogeW91IGFyZSBxdWl0ZQo+ID4gbGlrZWx5IHRvIHNlZSBzb21lIHVuZ2Fp
bmx5IGNvZGUgaGVyZSAoZGVzcGl0ZSBteSBlZmZvcnRzIHRvIGNsZWFuIGl0IHVwCj4gPiBiZWZv
cmUgc2VuZGluZyB0aGlzIHBhdGNoc2V0IG91dCkuICBNeSBpbnRlbnQgd2l0aCB0aGlzIFJGQyBp
cyB0byBhbGlnbgo+ID4gZWFybHkgYW5kIGdhdWdlIGludGVyZXN0LCBhcyBvcHBvc2VkIHRvIHBy
ZXNlbnRpbmcgYSB0b3RhbGx5IGNvbXBsZXRlCj4gPiBwYXRjaHNldC4KPiAKPiBJJ3ZlIHRha2Vu
IGEgdmVyeSBxdWljayBsb29rIG92ZXIgdGhlIHNlcmllcy4KPiAKPiBOb3JtYWxseSwgd2UgcmVx
dWlyZSB0aGF0IGFsbCBwYXRjaGVzIGJlIGJpc2VjdGFibGUsIGFuZCB0aGlzIHNlcmllcyBpcwo+
IG5vdCBiZWNhdXNlIG9mIHRoZSBNYWtlZmlsZSBjaGFuZ2VzIGluIHBhdGNoIDMgc3BlY2lmeWlu
ZyBvYmplY3QgZmlsZXMKPiB3aGljaCBhcmUgaW50cm9kdWNlZCBpbiB0aGUgZm9sbG93aW5nIDIw
IHBhdGNoZXMuwqAgT2YgY291cnNlLAo+IGludHJvZHVjaW5nIGEgYnJhbmQgbmV3IGFyY2hpdGVj
dHVyZSBpcyBhIHNwZWNpYWwgY2FzZSwgYnV0IHRoZQo+IHN1Z2dlc3RlZCBwbGFuIG9mIGdldHRp
bmcgYSAibWluaW1hbCBidWlsZCIgdG9nZXRoZXIgd2lsbCBoZWxwIGtlZXAgdGhlCj4gc2Vjb25k
IHBoYXNlIG9mICJtYWtpbmcgaXQgYm9vdCIuCgpUaGF0IHRvdGFsbHkgbWFrZXMgc2Vuc2UuCgo+
IAo+IFRvIHN0YXJ0IHdpdGgsIEknZCByZWNvbW1lbmQgYSBoZWFkLlMgd2l0aCBfc3RhcnQ6IGFu
ZCBhbiBpbmZpbml0ZSBsb29wLAo+IGFsb25nIHdpdGggd2hhdGV2ZXIgbWFrZWZpbGUva2NvbmZp
ZyBpbmZyYXN0cnVjdHVyZSBpcyByZXF1aXJlZCB0byBnZXQgYQo+IGJ1aWxkLgo+IAoKR290IGl0
LCBzb3VuZHMgbGlrZSBhIHBsYW4uCgo+IFdpdGhpbiB0aGF0IGZpcnN0IHBoYXNlIGhvd2V2ZXIs
IHRoZXJlIGFyZSBzb21lIG9idmlvdXMgdHdlYWtzIHdlIHNob3VsZAo+IG1ha2UgdG8gY29tbW9u
IGNvZGUuwqAgRm9yIG9uZSwgdGhlIGRlYnVnZ2VyX3RyYXAoKSBpbmZyYXN0cnVjdHVyZSByZWFs
bHkKPiBpcyB4ODYtc3BlY2lmaWMgKGFuZCBJIGhhdmVuJ3Qgc2VlbiBpdCB1c2VkIGluIGEgZGVj
YWRlKSBzbyBzaG91bGQgaGF2ZQo+IGl0cyBBUk0gc3R1YnMgZHJvcHBlZCBzbyBhcyBub3QgdG8g
YmUgYSBidXJkZW4gb24gb3RoZXIgYXJjaGl0ZWN0dXJlcy4KPiAKPiBUaGVyZSBhcmUgb3RoZXIg
YXNwZWN0cyAodGhlIGF0b21pY190IGluZnJhc3RydWN0dXJlKSB3aGVyZSB4ODYgYW5kIEFSTQo+
IGFscmVhZHkgaGF2ZSBiYXNpY2FsbHkgaWRlbnRpY2FsIGNvcGllcyBvZiB0aGUgaGVhZGVyIGZp
bGUsIGFuZCB5b3UndmUKPiB0YWtlbiBhIDNyZCBjb3B5Lgo+IAo+IE90aGVyIGFyZWFzIHdoZXJl
IHlvdSBjYW4gcmVkdWNlIHRoZSBtaW5pbXVtIGJ1aWxkIHdvdWxkIGJlIHRvIHB1dCBzb21lCj4g
ZGVmYXVsdHMgaW50byB0aGUgZGVmY29uZmlnLCBzdWNoIGFzIGRpc2FibGluZyBncmFudCB0YWJs
ZXMgYW5kIG1lbQo+IGFjY2Vzcy7CoCBUaGVyZSBhcmUgYWxtb3N0IGNlcnRhaW5seSBvdGhlcnMg
d2hpY2ggd2lsbCBoZWxwLCBzbyBoYXZlIGEKPiBzZWFyY2ggYXJvdW5kIG1lbnVjb25maWcuCgpU
YWtpbmcgbm90ZSBvZiB0aGVzZSwgSSBjYW4gZGVmaW5pdGVseSBkbyB0aGF0LgoKPiAKPiBEaXNh
YmxpbmcgZ3JhbnQgdGFibGVzIGluIHBhcnRpY3VsYXIgd2lsbCB3b3JrIGFyb3VuZCB0aGUgZmFj
dCB0aGF0IHRoZQo+IEFSTSBzbmFwc2hvdCB5b3UgYmFzZWQgeW91ciBwb3J0IG9uIHdhcyBwcmUt
WFNBLTI5NSwgYW5kIHRoZSBjbXB4Y2hnCj4gbG9vcCBhZ2FpbnN0IGd1ZXN0IG1lbW9yeSBpbiBn
bnR0YWJfY2xlYXJfZmxhZ3MoKSBpcyByZWludHJvZHVjaW5nIGEKPiBwcmV2aW91c2x5LWZpeGVk
IHNlY3VyaXR5IHZ1bG5lcmFiaWxpdHkuCgpEdWx5IG5vdGVkLCBJJ2xsIGZpeCB0aGF0IGFuZCBs
b29rIG92ZXIgc29tZSBvZiB0aG9zZSBhZ2FpbiBhbmQgY29tcGFyZSB0aGVtIHRvIHRoZQpuZXdl
ciBmaWxlcywgYXMgc29tZSBhcmUgZGVmaW5pdGVseSBhIGZldyB2ZXJzaW9uIGJ1bXBzIGJlaGlu
ZC4KCj4gCj4gU29tZSBBUk0taXNtcyB5b3UndmUgaW5oZXJpdGVkIHdvdWxkIGJlIG11Y2ggYmV0
dGVyIGlmIHlvdSBkaWRuJ3QuwqAgSW4KPiBwYXJ0aWN1bGFyLCBJICpyZWFsbHkqIGhvcGUgUklT
Qy1WIGhhc24ndCBtYWRlIHRoZSBzYW1lIGJhY2t3YXJkcyBuYW1pbmcKPiBidWcgaW4gdGhlaXIg
cGFnZXRhYmxlIGxldmVscyB3aGljaCByZXN1bHRzIGluIHtzZWNvbmQsZmlyc3QsemVyb3RofV8q
Cj4gZXQgYWwuwqAgSW4geDg2LCB3ZSBwdXJwb3NlZnVsbHkgY2hvc2Ugbm90IHRvIGZvbGxvdyBJ
bnRlbCdzIG5hbWluZywgYW5kCj4gaW5zdGVhZCB3ZW50IHdpdGggTDEsIEwyLCBMMywgYW5kIGZv
ciA2NGJpdCBMNC4KPiAKClRoZSBSSVNDLVYgc3BlYyBkb2VzIGluZGVlZCBkZXNjcmliZSB0aGUg
dGFibGUgbGV2ZWwgbnVtYmVycyBpbiByZXZlcnNlCm9yZGVyOiBMMiBwb2ludHMgdG8gTDEgcG9p
bnRzIHRvIEwwIChmb3IgMzliaXQgYWRkcmVzc2VzKS4KCkZvciBTVjQ4IDQ4Yml0IGFkZHJlc3Nl
cywgaXQncyBMMywgTDIsIEwxLCB0byBMMC4KClRoYXQgc2FpZCwgaW4gdGhlIHNwZWMgdGhlcmUg
aXMgbm8gZGlyZWN0IG1lbnRpb24gb2YgTFggZm9yIGxldmVscywgYW5kCmluc3RlYWQgdGhlc2Ug
YXJlIHJlZmVycmVkIHRvIGJ5IHRoZSBzZWN0aW9uIGZyb20gdGhlICJ2aXJ0dWFsIHBhZ2UKbnVt
YmVyIiB0aGF0IHRoZXkgYXJlIHJlZmVycmVkIGJ5LCAoaWUgVlBOWzNdLCBWUE5bMl0sIGV0Yy4u
LikuCgpJIGRlZmluaXRlbHkgd291bGQgbm90IGJlIHN0cm9uZ2x5IG9wcG9zZWQgdG8gdGhpcyBj
aGFuZ2UgZm9yIGEgZm9ybQp0aGF0IHJlYWRzIGJldHRlci4KCj4gQXMgYSBjb3VwbGUgb2YgZ2Vu
ZXJhbCBwb2ludHMgZnJvbSBvdXIgY29kaW5nIHN0eWxlLCBwbGVhc2UgYXZvaWQKPiBjb21tZW50
ZWQgb3V0IGNvZGUsIGFuZCB5b3UgYXJlIGZyZWUgdG8gb21pdCBicmFjZXMgZm9yIHNpbmdsZSBz
dGF0ZW1lbnQKPiBibG9ja3MuCj4gCj4gfkFuZHJldwoKClRoYW5rcyBhZ2FpbiwKLUJvYmJ5Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

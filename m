Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C6817E60B
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 18:50:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBMVX-0002NM-4b; Mon, 09 Mar 2020 17:48:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RYxH=42=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jBMVV-0002NH-Em
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 17:48:01 +0000
X-Inumbo-ID: 1e26a166-622e-11ea-b383-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e26a166-622e-11ea-b383-bc764e2007e4;
 Mon, 09 Mar 2020 17:48:00 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id h5so2684605edn.5
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2020 10:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=34vH8WPa7UD+ikGA8W5Qm3lMo1ff/oUabgknLaXzoQQ=;
 b=ilHWDWbBYJaHOnMc2yyk3S6IyyTHxZrfVQjErTLXzs3yzmwPO+Yqu/JeBqnzFi4CyU
 AV7GkwAL8jsmtrV5Up1lr6Jd8XfSycPVgGxVK8jUaOk6kizZEfC7lIwTloDyVwiGAz/M
 G32e+bbBhwmdKBSiwIm1GMMnsi73eTvd6YAlXW2xJguhVQWVIzhnZUdlHWJMDnkYps0W
 p6FiSz6uCxjfbQ93J+4ttb3e1NXlXd6+lXwMLtL32Ynu4OPtB23hC+apYP13xnJhPqJq
 fl4riltVhJZ8ST6F3dCd1kS4uUMfhzOzw9+IVNEWg0NqJv4wj0RJXA1WL+uPcgKZH11Z
 yTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=34vH8WPa7UD+ikGA8W5Qm3lMo1ff/oUabgknLaXzoQQ=;
 b=Bjvkxj9FzE/ULZCFrPGhpw0+Dd8gwUfoIdwEkyOLTez0541Ed4xu+fO5zJh4WJ9JjE
 rOVI0//Bx5giA6glE8a1834PNa2h9uAPRckKBzKBOgWH7NPoDsh6x5VXUDxe4Y6Afr/4
 vhSfRZ1/VaLuAapylJnGDXLypYTxRPfsGLduDaxfp4zg5Pt0En+V9p5gr6r8Jy3009hu
 irkyOFcXyA+71w1X1NPZkzUo6NnRh56S8nvLI4Y91q+At5D/4qiP6X/UPEEmX9+G/HWx
 jK+gVSCNTQ96fXpjJSovqzvdP64acFnBleD/nwKgXDtcVdId8nBo1Nkdy8VU6dEod/GO
 oMqA==
X-Gm-Message-State: ANhLgQ1zNBp1ceVD9SarxtWRGRICRjgkmyfjpJTalqEJqlJe8Zevljcr
 FfB3K02Wz2fpyp/A/M1PSlw=
X-Google-Smtp-Source: ADFU+vsSqvrIccvaoeQg/rHhdMhb36FHXJUXLR1254OGCmSsZk7scV7cCO4IZWyDx95OTS1ZvhnD5A==
X-Received: by 2002:a05:6402:14da:: with SMTP id
 f26mr4491873edx.85.1583776079871; 
 Mon, 09 Mar 2020 10:47:59 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id o8sm3295295edj.5.2020.03.09.10.47.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Mar 2020 10:47:59 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200306160254.8465-1-paul@xen.org>
 <58f00871-2fff-be69-299e-e2b9911e0723@suse.com>
In-Reply-To: <58f00871-2fff-be69-299e-e2b9911e0723@suse.com>
Date: Mon, 9 Mar 2020 17:47:58 -0000
Message-ID: <000301d5f63a$df5f04a0$9e1d0de0$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIK2yJyYyCu4hvzDwRQ39T9TXjhmgIXPdL9p8YDW2A=
Content-Language: en-gb
Subject: Re: [Xen-devel] [PATCH v4] x86: irq: Do not BUG_ON multiple unbind
 calls for shared pirqs
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
Cc: xen-devel@lists.xenproject.org, 'Varad Gautam' <vrd@amazon.de>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Julien Grall' <julien@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAwOSBNYXJjaCAyMDIwIDE2OjI5Cj4gVG86IHBhdWxAeGVuLm9y
Zwo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IFZhcmFkIEdhdXRhbSA8dnJk
QGFtYXpvbi5kZT47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBSb2dlcgo+IFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0XSB4ODY6IGlycTogRG8gbm90
IEJVR19PTiBtdWx0aXBsZSB1bmJpbmQgY2FsbHMgZm9yIHNoYXJlZCBwaXJxcwo+IAo+IE9uIDA2
LjAzLjIwMjAgMTc6MDIsIHBhdWxAeGVuLm9yZyB3cm90ZToKPiA+IEZyb206IFZhcmFkIEdhdXRh
bSA8dnJkQGFtYXpvbi5kZT4KPiA+Cj4gPiBYRU5fRE9NQ1RMX2Rlc3Ryb3lkb21haW4gY3JlYXRl
cyBhIGNvbnRpbnVhdGlvbiBpZiBkb21haW5fa2lsbCAtRVJFU1RBUlRTLgo+ID4gSW4gdGhhdCBz
Y2VuYXJpbywgaXQgaXMgcG9zc2libGUgdG8gcmVjZWl2ZSBtdWx0aXBsZSBfX3BpcnFfZ3Vlc3Rf
dW5iaW5kCj4gPiBjYWxscyBmb3IgdGhlIHNhbWUgcGlycSBmcm9tIGRvbWFpbl9raWxsLCBpZiB0
aGUgcGlycSBoYXMgbm90IHlldCBiZWVuCj4gPiByZW1vdmVkIGZyb20gdGhlIGRvbWFpbidzIHBp
cnFfdHJlZSwgYXM6Cj4gPiAgIGRvbWFpbl9raWxsKCkKPiA+ICAgICAtPiBkb21haW5fcmVsaW5x
dWlzaF9yZXNvdXJjZXMoKQo+ID4gICAgICAgLT4gcGNpX3JlbGVhc2VfZGV2aWNlcygpCj4gPiAg
ICAgICAgIC0+IHBjaV9jbGVhbl9kcGNpX2lycSgpCj4gPiAgICAgICAgICAgLT4gcGlycV9ndWVz
dF91bmJpbmQoKQo+ID4gICAgICAgICAgICAgLT4gX19waXJxX2d1ZXN0X3VuYmluZCgpCj4gPgo+
ID4gRm9yIGEgc2hhcmVkIHBpcnEgKG5yX2d1ZXN0cyA+IDEpLCB0aGUgZmlyc3QgY2FsbCB3b3Vs
ZCB6YXAgdGhlIGN1cnJlbnQKPiA+IGRvbWFpbiBmcm9tIHRoZSBwaXJxJ3MgZ3Vlc3RzW10gbGlz
dCwgYnV0IHRoZSBhY3Rpb24gaGFuZGxlciBpcyBuZXZlciBmcmVlZAo+ID4gYXMgdGhlcmUgYXJl
IG90aGVyIGd1ZXN0cyB1c2luZyB0aGlzIHBpcnEuIEFzIGEgcmVzdWx0LCBvbiB0aGUgc2Vjb25k
IGNhbGwsCj4gPiBfX3BpcnFfZ3Vlc3RfdW5iaW5kIHNlYXJjaGVzIGZvciB0aGUgY3VycmVudCBk
b21haW4gd2hpY2ggaGFzIGJlZW4gcmVtb3ZlZAo+ID4gZnJvbSB0aGUgZ3Vlc3RzW10gbGlzdCwg
YW5kIGhpdHMgYSBCVUdfT04uCj4gPgo+ID4gTWFrZSBfX3BpcnFfZ3Vlc3RfdW5iaW5kIHNhZmUg
dG8gYmUgY2FsbGVkIG11bHRpcGxlIHRpbWVzIGJ5IGxldHRpbmcgeGVuCj4gPiBjb250aW51ZSBp
ZiBhIHNoYXJlZCBwaXJxIGhhcyBhbHJlYWR5IGJlZW4gdW5ib3VuZCBmcm9tIHRoaXMgZ3Vlc3Qu
IFRoZQo+ID4gUElSUSB3aWxsIGJlIGNsZWFuZWQgdXAgZnJvbSB0aGUgZG9tYWluJ3MgcGlycV90
cmVlIGR1cmluZyB0aGUgZGVzdHJ1Y3Rpb24KPiA+IGluIGNvbXBsZXRlX2RvbWFpbl9kZXN0cm95
IGFueXdheS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBWYXJhZCBHYXV0YW0gPHZyZEBhbWF6b24u
ZGU+Cj4gPiBbdGFraW5nIG92ZXIgZnJvbSBWYXJhZCBhdCB2NF0KPiA+IFNpZ25lZC1vZmYtYnk6
IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPgo+ID4gLS0tCj4gPiBDYzogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgo+ID4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+
Cj4gPiBDYzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiBDYzog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiA+Cj4gPiBSb2dlciBz
dWdnZXN0ZWQgY2xlYW5pbmcgdGhlIGVudHJ5IGZyb20gdGhlIGRvbWFpbiBwaXJxX3RyZWUgc28g
dGhhdAo+ID4gd2UgbmVlZCBub3QgbWFrZSBpdCBzYWZlIHRvIHJlLWNhbGwgX19waXJxX2d1ZXN0
X3VuYmluZCgpLiBUaGlzIHNlZW1zIGxpa2UKPiA+IGEgcmVhc29uYWJsZSBzdWdnZXN0aW9uIGJ1
dCB0aGUgc2VtYW50aWNzIG9mIHRoZSBjb2RlIGFyZSBhbG1vc3QKPiA+IGltcGVuZXRyYWJsZSAo
ZS5nLiAncGlycScgaXMgdXNlZCB0byBtZWFuIGFuIGluZGV4LCBhIHBvaW50ZXIgYW5kIGlzIGFs
c28KPiA+IHRoZSBuYW1lIG9mIHN0cnVjdCBzbyB5b3UgZ2VuZXJhbGx5IGhhdmUgbGl0dGxlIGlk
ZWEgd2hhdCBpdCBhY3RhbGx5IG1lYW5zKQo+ID4gc28gSSBwcmVmZXIgdG8gc3RpY2sgd2l0aCBh
IHNtYWxsIGZpeCB0aGF0IEkgY2FuIGFjdHVhbGx5IHJlYXNvbiBhYm91dC4KPiA+Cj4gPiB2NDoK
PiA+ICAtIFJlLXdvcmsgdGhlIGd1ZXN0IGFycmF5IHNlYXJjaCB0byBtYWtlIGl0IGNsZWFyZXIK
PiAKPiBJLmUuIHRoZXJlIGFyZSBjb3NtZXRpYyBkaWZmZXJlbmNlcyB0byB2MyAoc2VlIGJlbG93
KSwgYnV0Cj4gdGVjaG5pY2FsbHkgaXQncyBzdGlsbCB0aGUgc2FtZS4gSSBjYW4ndCBiZWxpZXZl
IHRoZSByZS11c2UKPiBvZiAicGlycSIgZm9yIGRpZmZlcmVudCBlbnRpdGllcyBpcyB0aGlzIGJp
ZyBvZiBhIHByb2JsZW0uCgpQbGVhc2Ugc3VnZ2VzdCBjb2RlIGlmIHlvdSB0aGluayBpdCBvdWdo
dCB0byBiZSBkb25lIGRpZmZlcmVudGVseS4gSSB0cmllZC4KCj4gQnV0IGFueXdheToKPiAKPiA+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYwo+ID4gKysrIGIveGVuL2FyY2gveDg2L2lycS5jCj4g
PiBAQCAtMTY4MCw5ICsxNjgwLDIzIEBAIHN0YXRpYyBpcnFfZ3Vlc3RfYWN0aW9uX3QgKl9fcGly
cV9ndWVzdF91bmJpbmQoCj4gPgo+ID4gICAgICBCVUdfT04oIShkZXNjLT5zdGF0dXMgJiBJUlFf
R1VFU1QpKTsKPiA+Cj4gPiAtICAgIGZvciAoIGkgPSAwOyAoaSA8IGFjdGlvbi0+bnJfZ3Vlc3Rz
KSAmJiAoYWN0aW9uLT5ndWVzdFtpXSAhPSBkKTsgaSsrICkKPiA+IC0gICAgICAgIGNvbnRpbnVl
Owo+ID4gLSAgICBCVUdfT04oaSA9PSBhY3Rpb24tPm5yX2d1ZXN0cyk7Cj4gPiArICAgIGZvciAo
IGkgPSAwOyBpIDwgYWN0aW9uLT5ucl9ndWVzdHM7IGkrKyApCj4gPiArICAgICAgICBpZiAoIGFj
dGlvbi0+Z3Vlc3RbaV0gPT0gZCApCj4gPiArICAgICAgICAgICAgYnJlYWs7Cj4gPiArCj4gPiAr
ICAgIGlmICggaSA9PSBhY3Rpb24tPm5yX2d1ZXN0cyApIC8qIE5vIG1hdGNoaW5nIGVudHJ5ICov
Cj4gPiArICAgIHsKPiA+ICsgICAgICAgIC8qCj4gPiArICAgICAgICAgKiBJbiBjYXNlIHRoZSBw
aXJxIHdhcyBzaGFyZWQsIHVuYm91bmQgZm9yIHRoaXMgZG9tYWluIGluIGFuIGVhcmxpZXIKPiA+
ICsgICAgICAgICAqIGNhbGwsIGJ1dCBzdGlsbCBleGlzdGVkIG9uIHRoZSBkb21haW4ncyBwaXJx
X3RyZWUsIHdlIHN0aWxsIHJlYWNoCj4gPiArICAgICAgICAgKiBoZXJlIGlmIHRoZXJlIGFyZSBh
bnkgbGF0ZXIgdW5iaW5kIGNhbGxzIG9uIHRoZSBzYW1lIHBpcnEuIFJldHVybgo+ID4gKyAgICAg
ICAgICogaWYgc3VjaCBhbiB1bmJpbmQgaGFwcGVucy4KPiA+ICsgICAgICAgICAqLwo+ID4gKyAg
ICAgICAgQVNTRVJUKGFjdGlvbi0+c2hhcmVhYmxlKTsKPiA+ICsgICAgICAgIHJldHVybiBOVUxM
Owo+ID4gKyAgICB9Cj4gPiArCj4gPiArICAgIEFTU0VSVChhY3Rpb24tPm5yX2d1ZXN0cyA+IDAp
Owo+IAo+IFRoaXMgc2VlbXMgcG9pbnRsZXNzIHRvIGhhdmUgaGVyZSAtIHYzIGhhZCBpdCBpbnNp
ZGUgdGhlIGlmKCksCj4gd2hlcmUgaXQgd291bGQgYWN0dWFsbHkgZ3VhcmQgYWdhaW5zdCBjb21p
bmcgaGVyZSB3aXRoIG5yX2d1ZXN0cwo+IGVxdWFsIHRvIHplcm8uCgpXaHkuIFRoZSBjb2RlIGp1
c3QgYWZ0ZXIgdGhpcyBkZWNyZW1lbnRzIG5yX2d1ZXN0cyBzbyBpdCBzZWVtcyBsaWtlIGVudGly
ZWx5IHRoZSByaWdodCBwb2ludCB0byBoYXZlIHRoZSBBU1NFUlQuIEkgY2FuIG1ha2UgaXQgQVNT
RVJUID49IDAsIGlmIHRoYXQgbWFrZXMgbW9yZSBzZW5zZS4KCj4gdjMgYWxzbyB1c2VkIGlmKCkg
YW5kIEJVRygpIGluc3RlYWQgb2YgQVNTRVJUKCkKPiBpbnNpZGUgdGhpcyBpZigpLCB3aGljaCB0
byBtZSB3b3VsZCBzZWVtIG1vcmUgaW4gbGluZSB3aXRoIG91cgo+IGN1cnJlbnQgLi9DT0RJTkdf
U1RZTEUgZ3VpZGVsaW5lcyBvZiBoYW5kbGluZyB1bmV4cGVjdGVkCj4gY29uZGl0aW9ucy4gQ291
bGQgeW91IGNsYXJpZnkgd2h5IHlvdSBzd2l0Y2hlZCB0aGluZ3M/Cj4gCgpCZWNhdXNlIEkgZG9u
J3QgdGhpbmsgdGhlcmUgaXMgbmVlZCB0byBraWxsIHRoZSBob3N0IGluIGEgbm9uLWRlYnVnIGNv
bnRleHQgaWYgd2UgaGl0IHRoaXMgY29uZGl0aW9uOyBpdCBpcyBlbnRpcmVseSBzdXJ2aXZhYmxl
IGFzIGZhciBhcyBJIGNhbiB0ZWxsIHNvIGEgQlVHX09OKCkgZGlkIG5vdCBzZWVtIGFwcHJvcHJp
YXRlLgoKICBQYXVsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=

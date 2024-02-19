Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E82485A614
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 15:36:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682929.1062183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc4kX-0008DD-SR; Mon, 19 Feb 2024 14:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682929.1062183; Mon, 19 Feb 2024 14:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc4kX-0008An-PH; Mon, 19 Feb 2024 14:36:05 +0000
Received: by outflank-mailman (input) for mailman id 682929;
 Mon, 19 Feb 2024 14:36:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pKiv=J4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rc4kW-0008AD-7t
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 14:36:04 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 354dde8a-cf34-11ee-8a52-1f161083a0e0;
 Mon, 19 Feb 2024 15:36:03 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5649f396269so930535a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 06:36:03 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 pk27-20020a170906d7bb00b00a3ee20b00d0sm13620ejb.4.2024.02.19.06.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 06:35:58 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 354dde8a-cf34-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708353363; x=1708958163; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1AMKLvPr8rT/i5jcMKX6ZoRGjd3JpDPwqUSMqNzSME4=;
        b=SM97mE/Ebxz65ZhqipFHpOLG3/2ULVNw+EQbDxgn4Zxx7AIpbmveZiv6fytMZaLUqF
         dmHCxC/Tv1aRky/RKOPG01fqMcQGOkt5B1bOn2vu4bdzOgnotjLCdTXmrU3sM5B+HCst
         eUMJl2x6JQvHYxFMWMQUD8z7+MKRJpp0YImNjvabNYZelMZkJtyHVgxvPP/clGMZw7Uk
         EvH03y+OiC4e+rY9nCeTAkWiA2sCAwQItDg1WDZBDGZmOo+FwwxsmBqRwIIgKgB/murM
         wI1cCWNsiso6YX9k1OIUXORYWcRT/NMlYpn92v4OU00b9SxgDU8JTqjqXOUGA+47+s7A
         B8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708353363; x=1708958163;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1AMKLvPr8rT/i5jcMKX6ZoRGjd3JpDPwqUSMqNzSME4=;
        b=Ne57P32dKWhIYqO5+ATCvOYU+SQBgDxcL/9OvLeIKmVXGEfwwdImwBGpnM4MziH5l/
         cCZgvLlLeUNNRmHkFAqKuHM+jts70Tos02jw3PySUMUM8LnvIeDvR3wzArViZC07NeGb
         Z9D9XlOPEhOr1q27mW9Uwg6ravwAcqVf75T6rUv16jT1cll9njvb6rQnuFMNd/a+NS+U
         AefuTHodN2R75NLuRQphm6B+geIeEkvZ/t2sjxwIDXVySYLTfmE+mOqb544Iqql0uStR
         fGytvUHTkcoTBFMa98qHSSV1rYGLMr7LvBW1hqdAclTrpuEEV8uVuxdqvneAc+rfdCtb
         eO4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNtDNcPbFGc2KdutP1CWDy6D70eJNSVQLetcXHQco9BYzcop02laRsZuV1W0o2NudJdV6wZMsGGIInAhMjqlA0TFKkUrgzDVXUb5tBYwc=
X-Gm-Message-State: AOJu0Yw7sVS4z6yuOlkE8MW07dMkNR0AQV5H7rcEEFWDk5VubgmBqPwf
	Gns+OyHnZzBH95kw7BoMFDvaRWo6aVRzd1deAJjDxsLWaJAFu1kW
X-Google-Smtp-Source: AGHT+IH3sFgn1cjYl6SdjJhOCyWM1G0BJo1f54dldDs7aDwGV0a+y+eDnr/OmtgH+DomeNi7EzwiGQ==
X-Received: by 2002:a17:906:6d04:b0:a3e:920d:4f8a with SMTP id m4-20020a1709066d0400b00a3e920d4f8amr2788117ejr.37.1708353358323;
        Mon, 19 Feb 2024 06:35:58 -0800 (PST)
Message-ID: <5617af1e8d94b4f1946a26e18eb10d62fd6c0fbe.camel@gmail.com>
Subject: Re: [PATCH v4 14/30] xen/riscv: introduce atomic.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Date: Mon, 19 Feb 2024 15:35:56 +0100
In-Reply-To: <26e01c13-364d-474b-8b8e-d1721ff0daf0@xen.org>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <6554f2479e19ed3eae6de842ac1568c31d236461.1707146506.git.oleksii.kurochko@gmail.com>
	 <26e01c13-364d-474b-8b8e-d1721ff0daf0@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

SGkgSnVsaWVuLAoKT24gU3VuLCAyMDI0LTAyLTE4IGF0IDE5OjIyICswMDAwLCBKdWxpZW4gR3Jh
bGwgd3JvdGU6Cj4gSGksCj4gCj4gT24gMDUvMDIvMjAyNCAxNTozMiwgT2xla3NpaSBLdXJvY2hr
byB3cm90ZToKPiA+IEZyb206IEJvYmJ5IEVzaGxlbWFuIDxib2JieWVzaGxlbWFuQGdtYWlsLmNv
bT4KPiA+IAo+ID4gQWRkaXRpb25hbGx5LCB0aGlzIHBhdGNoIGludHJvZHVjZXMgbWFjcm9zIGlu
IGZlbmNlLmgsCj4gPiB3aGljaCBhcmUgdXRpbGl6ZWQgaW4gYXRvbWljLmguCj4gPiAKPiA+IGF0
b21pYyMjcHJlZml4IyNfKnhjaGdfKihhdG9taWMjI3ByZWZpeCMjX3QgKnYsIGNfdCBuKQo+ID4g
d2VyZSB1cGRhdGVkIHRvIHVzZSBfXyp4Y2hnX2dlbmVyaWMoKS4KPiA+IAo+ID4gU2lnbmVkLW9m
Zi1ieTogT2xla3NpaSBLdXJvY2hrbyA8b2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20+Cj4gCj4g
VGhlIGF1dGhvciBpcyBCb2JieSwgYnV0IEkgZG9uJ3Qgc2VlIGEgU2lnbmVkLW9mZi1ieS4gRGlk
IHlvdSBmb3Jnb3QKPiBpdD8KSSBtaXNzZWQgdG8gYWRkIHRoYXQgYXMgSSB0aG91Z2h0IHRoYXQg
aXQgd291bGQgYmUgZW5vdWdoIHRvIGNoYW5nZSBhCmNvbW1pdCBhdXRob3IuCgo+IAo+ID4gLS0t
Cj4gPiBDaGFuZ2VzIGluIFY0Ogo+ID4gwqAgLSBkbyBjaGFuZ2VzIHJlbGF0ZWQgdG8gdGhlIHVw
ZGF0ZXMgb2YgW1BBVENIIHYzIDEzLzM0XQo+ID4geGVuL3Jpc2N2OiBpbnRyb2R1Y2UgY21weGNo
Zy5oCj4gPiDCoCAtIGRyb3AgY2FzdHMgaW4gcmVhZF9hdG9taWNfc2l6ZSgpLCB3cml0ZV9hdG9t
aWMoKSwgYWRkX3NpemVkKCkKPiA+IMKgIC0gdGFicyAtPiBzcGFjZXMKPiA+IMKgIC0gZHJvcCAj
aWZkZWYgQ09ORklHX1NNUCAuLi4gI2VuZGlmIGluIGZlbmNlLmhhIGFzIGl0IGlzIHNpbXBsZXIK
PiA+IHRvIGhhbmRsZSBOUl9DUFVTPTEKPiA+IMKgwqDCoCB0aGUgc2FtZSBhcyBOUl9DUFVTPjEg
d2l0aCBhY2NlcHRpbmcgbGVzcyB0aGFuIGlkZWFsCj4gPiBwZXJmb3JtYW5jZS4KPiA+IC0tLQo+
ID4gQ2hhbmdlcyBpbiBWMzoKPiA+IMKgwqAgLSB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlCj4g
PiDCoMKgIC0gYWRkIFNQRFggZm9yIGZlbmNlLmgKPiA+IMKgwqAgLSBjb2RlIHN0eWxlIGZpeGVz
Cj4gPiDCoMKgIC0gUmVtb3ZlIC8qIFRPRE86IC4uLiAqLyBmb3IgYWRkX3NpemVkIG1hY3Jvcy4g
SXQgbG9va3MgY29ycmVjdAo+ID4gdG8gbWUuCj4gPiDCoMKgIC0gcmUtb3JkZXIgdGhlIHBhdGNo
Cj4gPiDCoMKgIC0gbWVyZ2UgdG8gdGhpcyBwYXRjaCBmZW5jZS5oCj4gPiAtLS0KPiA+IENoYW5n
ZXMgaW4gVjI6Cj4gPiDCoCAtIENoYW5nZSBhbiBhdXRob3Igb2YgY29tbWl0LiBJIGdvdCB0aGlz
IGhlYWRlciBmcm9tIEJvYmJ5J3Mgb2xkCj4gPiByZXBvLgo+ID4gLS0tCj4gPiDCoCB4ZW4vYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9hdG9taWMuaCB8IDM5NQo+ID4gKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ID4gwqAgeGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZmVuY2UuaMKgIHzC
oMKgIDggKwo+ID4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA0MDMgaW5zZXJ0aW9ucygrKQo+ID4gwqAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2F0b21pYy5oCj4g
PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZmVuY2Uu
aAo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXRvbWlj
LmgKPiA+IGIveGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXRvbWljLmgKPiA+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwLi4yNjdkM2MwODAzCj4gPiAtLS0gL2Rl
di9udWxsCj4gPiArKysgYi94ZW4vYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hdG9taWMuaAo+ID4g
QEAgLTAsMCArMSwzOTUgQEAKPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MC1vbmx5ICovCj4gPiArLyoKPiA+ICsgKiBUYWtlbiBhbmQgbW9kaWZpZWQgZnJvbSBMaW51eC4K
PiAKPiBXaGljaCB2ZXJzaW9uIG9mIExpbnV4PyBDYW4geW91IGFsc28gc3BlbGwgb3V0IHdoYXQg
YXJlIHRoZSBiaWcKPiBjaGFuZ2VzPyAKPiBUaGlzIHdvdWxkIGJlIGhlbHBmdWwgaWYgd2UgbmVl
ZCB0byByZS1zeW5jLgpTdXJlLCBJJ2xsIGFkZCB0aGUgY2hhbmdlcyBoZXJlLgoKPiAKPiA+ICsg
Kgo+ID4gKyAqIGF0b21pYyMjcHJlZml4IyNfKnhjaGdfKihhdG9taWMjI3ByZWZpeCMjX3QgKnYs
IGNfdCBuKSB3ZXJlCj4gPiB1cGRhdGVkIHRvIHVzZQo+ID4gKyAqIF9fKnhjaGdfZ2VuZXJpYygp
Cj4gPiArICoKPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMDcgUmVkIEhhdCwgSW5jLiBBbGwgUmln
aHRzIFJlc2VydmVkLgo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAxMiBSZWdlbnRzIG9mIHRoZSBV
bml2ZXJzaXR5IG9mIENhbGlmb3JuaWEKPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMTcgU2lGaXZl
Cj4gPiArICogQ29weXJpZ2h0IChDKSAyMDIxIFZhdGVzIFNBUwo+ID4gKyAqLwo+ID4gKwo+ID4g
KyNpZm5kZWYgX0FTTV9SSVNDVl9BVE9NSUNfSAo+ID4gKyNkZWZpbmUgX0FTTV9SSVNDVl9BVE9N
SUNfSAo+ID4gKwo+ID4gKyNpbmNsdWRlIDx4ZW4vYXRvbWljLmg+Cj4gPiArI2luY2x1ZGUgPGFz
bS9jbXB4Y2hnLmg+Cj4gPiArI2luY2x1ZGUgPGFzbS9mZW5jZS5oPgo+ID4gKyNpbmNsdWRlIDxh
c20vaW8uaD4KPiA+ICsjaW5jbHVkZSA8YXNtL3N5c3RlbS5oPgo+ID4gKwo+ID4gK3ZvaWQgX19i
YWRfYXRvbWljX3NpemUodm9pZCk7Cj4gPiArCj4gPiArc3RhdGljIGFsd2F5c19pbmxpbmUgdm9p
ZCByZWFkX2F0b21pY19zaXplKGNvbnN0IHZvbGF0aWxlIHZvaWQgKnAsCj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHZvaWQgKnJlcywKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgdW5zaWduZWQgaW50IHNpemUpCj4gPiArewo+ID4gK8KgwqDCoCBzd2l0Y2ggKCBzaXpl
ICkKPiA+ICvCoMKgwqAgewo+ID4gK8KgwqDCoCBjYXNlIDE6ICoodWludDhfdCAqKXJlcyA9IHJl
YWRiKHApOyBicmVhazsKPiA+ICvCoMKgwqAgY2FzZSAyOiAqKHVpbnQxNl90ICopcmVzID0gcmVh
ZHcocCk7IGJyZWFrOwo+ID4gK8KgwqDCoCBjYXNlIDQ6ICoodWludDMyX3QgKilyZXMgPSByZWFk
bChwKTsgYnJlYWs7Cj4gPiArwqDCoMKgIGNhc2UgODogKih1aW50MzJfdCAqKXJlc8KgID0gcmVh
ZHEocCk7IGJyZWFrOwo+ID4gK8KgwqDCoCBkZWZhdWx0OiBfX2JhZF9hdG9taWNfc2l6ZSgpOyBi
cmVhazsKPiA+ICvCoMKgwqAgfQo+ID4gK30KPiA+ICsKPiA+ICsjZGVmaW5lIHJlYWRfYXRvbWlj
KHApICh7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFwKPiA+ICvCoMKgwqAgdW5pb24geyB0eXBlb2YoKnApIHZhbDsgY2hhciBjWzBd
OyB9IHhfO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoCByZWFkX2F0b21pY19z
aXplKHAsIHhfLmMsIHNpemVvZigqcCkpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+
ICvCoMKgwqAgeF8udmFsO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK30p
Cj4gPiArCj4gPiArI2RlZmluZSB3cml0ZV9hdG9taWMocCwgeCnCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICsoe8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoCB0
eXBlb2YoKnApIHhfXyA9ICh4KTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoCBzd2l0Y2ggKCBzaXplb2YoKnAp
ICnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgXAo+ID4gK8KgwqDCoCB7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBcCj4gPiArwqDCoMKgIGNhc2UgMTogd3JpdGViKCh1aW50OF90KXhfXyzCoCBwKTsg
YnJlYWs7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArwqDCoMKgIGNhc2UgMjogd3JpdGV3
KCh1aW50MTZfdCl4X18sIHApOyBicmVhazvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvC
oMKgwqAgY2FzZSA0OiB3cml0ZWwoKHVpbnQzMl90KXhfXywgcCk7IGJyZWFrO8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoCBjYXNlIDg6IHdyaXRlcSgodWludDY0X3QpeF9fLCBw
KTsgYnJlYWs7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArwqDCoMKgIGRlZmF1bHQ6IF9f
YmFkX2F0b21pY19zaXplKCk7IGJyZWFrO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBc
Cj4gPiArwqDCoMKgIH3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFwKPiA+ICvCoMKgwqAgeF9fO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
XAo+ID4gK30pCj4gPiArCj4gPiArI2RlZmluZSBhZGRfc2l6ZWQocCwgeCnCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+
ICsoe8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+
ID4gK8KgwqDCoCB0eXBlb2YoKihwKSkgeF9fID0gKHgpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKgwqAgc3dpdGNoICgg
c2l6ZW9mKCoocCkpICnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBcCj4gPiArwqDCoMKgIHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKgwqAgY2FzZSAxOiB3cml0ZWIocmVhZF9hdG9taWMo
cCkgKyB4X18sIHApOyBicmVhazvCoMKgwqDCoCBcCj4gPiArwqDCoMKgIGNhc2UgMjogd3JpdGV3
KHJlYWRfYXRvbWljKHApICsgeF9fLCBwKTsgYnJlYWs7wqDCoMKgwqAgXAo+ID4gK8KgwqDCoCBj
YXNlIDQ6IHdyaXRlbChyZWFkX2F0b21pYyhwKSArIHhfXywgcCk7IGJyZWFrO8KgwqDCoMKgIFwK
PiA+ICvCoMKgwqAgZGVmYXVsdDogX19iYWRfYXRvbWljX3NpemUoKTsgYnJlYWs7wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKgwqAgfcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK30pCj4gPiArCj4gPiArLyoKPiA+ICsgKsKg
IF9fdW5xdWFsX3NjYWxhcl90eXBlb2YoeCkgLSBEZWNsYXJlIGFuIHVucXVhbGlmaWVkIHNjYWxh
cgo+ID4gdHlwZSwgbGVhdmluZwo+ID4gKyAqwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBu
b24tc2NhbGFyIHR5cGVzIHVuY2hhbmdlZC4KPiA+ICsgKgo+ID4gKyAqIFByZWZlciBDMTEgX0dl
bmVyaWMgZm9yIGJldHRlciBjb21waWxlLXRpbWVzIGFuZCBzaW1wbGVyIGNvZGUuCj4gPiBOb3Rl
OiAnY2hhcicKPiAKPiBYZW4gaXMgdGVjaG5pY2FsbHkgYnVpbHQgdXNpbmcgYzk5L2dudTk5LiBT
byBpdCBpcyBmZWVscyBhIGJpdCBvZGQgdG8KPiBpbnRyb2R1Y2UgYSBDMTEgZmVhdHVyZS4gSSBz
ZWUgdGhhdCBfR2VuZXJpYyBpcyBhbHJlYWR5IHVzZWQgaW4KPiBQUEMuLi4gCj4gSG93ZXZlciwg
aWYgd2UgZGVjaWRlIHRvIGFkZCBtb3JlIHVzZSBvZiBpdCwgdGhlbiBJIHRoaW5rIHRoaXMgc2hv
dWxkCj4gYXQgCj4gbWluaW11bSBiZSBkb2N1bWVudGVkIGluIGRvY3MvbWlzcmEvQy1sYW5ndWFn
ZS10b29sY2hhaW4ucnN0ICh0aGUKPiBtb3JlIAo+IGlmIHdlIHBsYW4gdGhlIG1hY3JvIGlzIG1v
dmVkIHRvIGNvbW1vbiBhcyBKYW4gc3VnZ2VzdGVkKS4KPiAKPiBDaGVlcnMsCj4gCgo=



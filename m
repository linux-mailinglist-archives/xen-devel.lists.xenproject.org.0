Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0482897D43C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2024 12:34:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801124.1211172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sraxL-0003D1-B8; Fri, 20 Sep 2024 10:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801124.1211172; Fri, 20 Sep 2024 10:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sraxL-0003BJ-8R; Fri, 20 Sep 2024 10:33:43 +0000
Received: by outflank-mailman (input) for mailman id 801124;
 Fri, 20 Sep 2024 10:33:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4UDy=QS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sraxK-0003BD-12
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2024 10:33:42 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd4dc51f-773b-11ef-a0b8-8be0dac302b0;
 Fri, 20 Sep 2024 12:33:40 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so263927266b.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Sep 2024 03:33:40 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90979ceb67sm514670366b.219.2024.09.20.03.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 03:33:38 -0700 (PDT)
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
X-Inumbo-ID: cd4dc51f-773b-11ef-a0b8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726828420; x=1727433220; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fXfA4L39sX5G9eOd5FrgKunOUW4Ym5rPBsBYvg38bf4=;
        b=nHdXX2pYaECsrxatxytDeFMvvSLxl1PdMhfqg7VzJAbPslvF4oIHDhvSYzhldcdPt7
         MGNLfin/tXIErmQ1eR4TirYts0+CwCL23DDNwRiZpnwjw2uudmxV1JjZQ3yZKQnElfhx
         GQDENOm7BgZV1cqkTwJuzTvYVYHN3HMenStjfWVlEWkOF84EVvUCQ7q7V7rO30hoTY5/
         gJcdEy7b/4bt2XoLPgLn+IxhFKx+qNYKoI/v8ozV1xGaWU6wvJTiRnaHmGWdT+II4OcA
         8Bx3w+6iS9ESFWww9SdK7pR8XAebf6kqpe1qAO/dkR1GrNC+fJaVtGhpGEHOm1unMM/U
         eu1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726828420; x=1727433220;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fXfA4L39sX5G9eOd5FrgKunOUW4Ym5rPBsBYvg38bf4=;
        b=KptlaLzcrRQy7HpseiJWAo35yTRB3kxi+TMbCmGHDwEqnFIuqZKREmxlSqWB6dLltU
         +U4zLmUH8uuhxm4SvoUh7zwsDpNn/PVe6M4+SXR08X2HdgJ+YLdQDccgDDF0J7La4oUb
         i9gYghGcyjGyakSK7npoekp3lNgRh+Kg4/QLdg3edMSiiwM4FMbT9ORf3LzJcObN6eFC
         6s1PZsnBjq6Ud8QNOOlezU1dRNq68nsVQYZDGC9NarknPLSjf9hQ81LdMdLe0AaL0TG/
         NWgFkP/YFCimfTzaVo8vXUXAvo5/zxjnNKErux2KgHH4wfZHwhvdkhfrA189n6kaoeU5
         GQlA==
X-Forwarded-Encrypted: i=1; AJvYcCX5Cp7fcceEG+SPMq7edkXqtoQzUAGXmLyhGw8mhpJwzIqboRb90OGRgXZ7i3cADwLaOYaMF7xhBxU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNs93eSsk2yeqXBpRWvB1DfnIgU0rKm7Up8k9HJ4yADtDhdsJJ
	B1+A9Ejr1phFWUoip/tvqYa5Cj/lcLAdyfx+BGn6JyQtSfzrNXWm
X-Google-Smtp-Source: AGHT+IFFQYM0DsmH8a+mQQadk7N7mXVFgxZmOEcBAwIgSz3CiVqwdaFuy2hPp83Ihub+2To6MHa4Jw==
X-Received: by 2002:a17:907:e2df:b0:a8d:28dc:9e2b with SMTP id a640c23a62f3a-a90d510aa86mr187805466b.44.1726828419532;
        Fri, 20 Sep 2024 03:33:39 -0700 (PDT)
Message-ID: <42fcd07631d3890b6fa9be683a5b2819417b10bf.camel@gmail.com>
Subject: Re: [PATCH v2 1/5] xen: define ACPI and DT device info sections
 macros
From: oleksii.kurochko@gmail.com
To: Shawn Anastasio <sanastasio@raptorengineering.com>, 
	xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,  Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>
Date: Fri, 20 Sep 2024 12:33:37 +0200
In-Reply-To: <c7670e45-30dd-4cba-a226-a5130412a96c@raptorengineering.com>
References: <cover.1726579819.git.oleksii.kurochko@gmail.com>
	 <3049dd691f79c688751abaae63c0ccdc36680fbb.1726579819.git.oleksii.kurochko@gmail.com>
	 <c7670e45-30dd-4cba-a226-a5130412a96c@raptorengineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

SGkgU2hhd24sCgpPbiBUaHUsIDIwMjQtMDktMTkgYXQgMTY6MDUgLTA1MDAsIFNoYXduIEFuYXN0
YXNpbyB3cm90ZToKPiBIaSBPbGVrc2lpLAo+IAo+IE9uIDkvMTcvMjQgMTE6MTUgQU0sIE9sZWtz
aWkgS3Vyb2Noa28gd3JvdGU6Cj4gPiBJbnRyb2R1Y2UgY29uZGl0aW9uYWwgbWFjcm9zIHRvIGRl
ZmluZSBkZXZpY2UKPiA+IGluZm9ybWF0aW9uIHNlY3Rpb25zIGJhc2VkIG9uIHRoZSBjb25maWd1
cmF0aW9uIG9mIEFDUEkKPiA+IG9yIGRldmljZSB0cmVlIHN1cHBvcnQuIFRoZXNlIHNlY3Rpb25z
IGFyZSByZXF1aXJlZCBmb3IKPiA+IGNvbW1vbiBjb2RlIG9mIGRldmljZSBpbml0aWFsaXphdGlv
biBhbmQgZ2V0dGluZyBhbiBpbmZvcm1hdGlvbgo+ID4gYWJvdXQgYSBkZXZpY2UuCj4gPiAKPiA+
IFRoZXNlIG1hY3JvcyBhcmUgZXhwZWN0ZWQgdG8gYmUgdXNlZCBhY3Jvc3MgZGlmZmVyZW50Cj4g
PiBhcmNoaXRlY3R1cmVzIChBcm0sIFBQQywgUklTQy1WKSwgc28gdGhleSBhcmUgbW92ZWQgdG8K
PiA+IHRoZSBjb21tb24geGVuL3hlbi5sZHMuaCwgYmFzZWQgb24gdGhlaXIgb3JpZ2luYWwgZGVm
aW5pdGlvbgo+ID4gaW4gQXJtLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2lpIEt1cm9j
aGtvIDxvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gQ2hhbmdlcyBpbiB2
MjoKPiA+IMKgLSBOZXcgcGF0Y2guCj4gPiAtLS0KPiA+IMKgeGVuL2luY2x1ZGUveGVuL3hlbi5s
ZHMuaCB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiDCoDEgZmlsZSBjaGFuZ2Vk
LCAyNiBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4v
eGVuLmxkcy5oIGIveGVuL2luY2x1ZGUveGVuL3hlbi5sZHMuaAo+ID4gaW5kZXggYTE3ODEwYmIy
OC4uYWE3MzAxMTM5ZCAxMDA2NDQKPiA+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi94ZW4ubGRzLmgK
PiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi94ZW4ubGRzLmgKPiA+IEBAIC0xMTQsNiArMTE0LDIx
IEBACj4gPiDCoAo+ID4gwqAvKiBMaXN0IG9mIGNvbnN0cnVjdHMgb3RoZXIgdGhhbiAqX1NFQ1RJ
T05TIGluIGFscGhhYmV0aWNhbCBvcmRlci4KPiA+ICovCj4gPiDCoAo+ID4gKyNkZWZpbmUgVVNF
X0RFQ0xfU0VDVElPTih4KSBERUNMX1NFQ1RJT04oeCkKPiA+ICsKPiA+ICsjZGVmaW5lIE5PVVNF
X0RFQ0xfU0VDVElPTih4KSB4IDoKPiA+ICsKPiA+ICsjaWZkZWYgQ09ORklHX0FDUEkKPiA+ICsj
ZGVmaW5lIEFDUElfREVWX0lORk9fU0VDKHNlY25hbWUsIERFQ0xfU0VDVElPTl9NQUNST1NfTkFN
RSnCoCBcCj4gPiArwqDCoMKgIERFQ0xfU0VDVElPTl9NQUNST1NfTkFNRShzZWNuYW1lKSB7wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArwqDCoMKgwqDCoCBf
YXNkZXZpY2UgPSAuO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArwqDCoMKgwqDCoCAqKHNl
Y25hbWUpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoMKgwqAgX2Fl
ZGV2aWNlID0gLjvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoCB9IDp0ZXh0Cj4g
PiArI2Vsc2UKPiA+ICsjZGVmaW5lIEFDUElfREVWX0lORk9fU0VDKHNlY25hbWUsIERFQ0xfU0VD
VElPTl9NQUNST1NfTkFNRSkKPiA+ICsjZW5kaWYgLyogQ09ORklHX0FDUEkgKi8KPiAKPiBUaGlz
IHdvcmtzLCBidXQgaXMgdGhlcmUgYSByZWFzb24geW91IGRpZG4ndCBqdXN0IGRlZmluZSB0aGUg
YWN0dWFsCj4gZW50cmllcyB0aGVtc2VsdmVzIGluIHRoZSBtYWNybywgbGlrZSBpcyBkb25lIGZv
ciBtb3N0IG9mIHRoZSBvdGhlcgo+IG1hY3JvcyBpbiB0aGlzIGZpbGUgKGluY2x1ZGluZyBCVUZS
QU1FUyByaWdodCBiZWxvdyB0aGlzKT8KVGhlcmUgaXMgbm8gc3BlY2lmaWMgcmVhc29uLCBqdXN0
IGRlY2lkZWQgaXQgd291bGQgYmUgbmljZSB0byBhYnN0cmFjdAp0aGUgdGhlIGZ1bGwgc2VjdGlv
biBkZWNsYXJhdGlvbi4KCj4gIFNvbWV0aGluZwo+IGxpa2U6Cj4gCj4gI2RlZmluZSBBREVWX0lO
Rk/CoMKgwqDCoCBcCj4gwqDCoMKgIF9hc2RldmljZSA9IC47wqDCoMKgIFwKPiDCoMKgwqAgKihz
ZWNuYW1lKcKgwqDCoMKgwqDCoMKgIFwKPiDCoMKgwqAgX2FlZGV2aWNlID0gLjvCoMKgwqAgXAo+
IAo+IFBhcmFtZXRlcml6aW5nIHRoZSBzZWN0aW9uIG5hbWUgc2VlbXMgcG9pbnRsZXNzIHNpbmNl
IHRoZXJlIGFyZSBvdGhlcgo+IHBhcnRzIG9mIHRoZSBjb2RlIHRoYXQgcmVseSBvbiB0aGVtLCBh
bmQgcGFyYW1ldGVyaXppbmcgdGhlIG1hY3JvIGZvcgo+IGRlY2xhcmluZyBhIHNlY3Rpb24gYWRk
cyB1bm5lY2Vzc2FyeSBib2lsZXJwbGF0ZSBmb3Igbm9uLXBwYy94ODYKPiBhcmNoaXRlY3R1cmVz
ICh0aGUgTk9VU0VfREVDTF9TRUNUSU9OIG5vLW9wKS4KSeKAmW0gb2theSB3aXRoIHRoZSBzdWdn
ZXN0ZWQgYXBwcm9hY2guIEnigJlsbCB3YWl0IGZvciBhIGJpdCB0byBzZWUgaWYKYW55b25lIGhh
cyBvdGhlciBjb21tZW50cy4gSWYgdGhlcmUgYXJlIG5vIHJlc3BvbnNlcywgSeKAmWxsIHJlc2Vu
ZCB0aGUKcGF0Y2ggc2VyaWVzIHdpdGggdGhlIHByb3Bvc2VkIGNoYW5nZXMuCgpUaGFua3MhCgp+
IE9sZWtzaWkKCj4gCj4gPiArCj4gPiDCoCNkZWZpbmUgQlVHRlJBTUVTwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+IMKgwqDC
oMKgIF9fc3RhcnRfYnVnX2ZyYW1lc18wID0gLjvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgXAo+ID4gwqDCoMKgwqAgKiguYnVnX2ZyYW1lcy4wKcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiBAQCAtMTMxLDYgKzE0
NiwxNyBAQAo+ID4gwqDCoMKgwqAgKiguYnVnX2ZyYW1lcy4zKcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiDCoMKgwqDCoCBfX3N0b3Bf
YnVnX2ZyYW1lc18zID0gLjsKPiA+IMKgCj4gPiArI2lmZGVmIENPTkZJR19IQVNfREVWSUNFX1RS
RUUKPiA+ICsjZGVmaW5lIERUX0RFVl9JTkZPX1NFQyhzZWNuYW1lLCBERUNMX1NFQ1RJT05fTUFD
Uk9TX05BTUUpwqAgXAo+ID4gK8KgwqDCoCBERUNMX1NFQ1RJT05fTUFDUk9TX05BTUUoc2VjbmFt
ZSkge8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDC
oMKgwqAgX3NkZXZpY2UgPSAuO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKgwqDC
oMKgICooc2VjbmFtZSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArwqDCoMKg
wqDCoCBfZWRldmljZSA9IC47wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoCB9
IDp0ZXh0Cj4gPiArI2Vsc2UKPiA+ICsjZGVmaW5lIERFQ0xfRFRfREVWX0lORk9fU0VDKHNlY25h
bWUsIERFQ0xfU0VDVElPTl9NQUNST1NfTkFNRSkKPiA+ICsjZW5kaWYgLyogQ09ORklHX0hBU19E
RVZJQ0VfVFJFRSAqLwo+IAo+IERpdHRvLiBBbHNvLCBpZiB5b3UgZ28gd2l0aCB0aGUgYXBwcm9h
Y2ggSSBtZW50aW9uZWQsIHRoZW4geW91Cj4gd291bGRuJ3QKPiBuZWVkIHRvIGd1YXJkIHRoZXNl
IG9uIENPTkZJR19IQVNfREVWSUNFX1RSRUUvQ09ORklHX0FDUEkgc2luY2UgdGhhdAo+IHdvdWxk
IGJlIGRvbmUgaW4gdGhlIGxpbmtlciBzY3JpcHRzIHRoZW1zZWx2ZXMuCgo=



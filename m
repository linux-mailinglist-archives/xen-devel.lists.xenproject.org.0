Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A4091E37B
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 17:12:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751780.1159844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOIh8-00041T-QP; Mon, 01 Jul 2024 15:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751780.1159844; Mon, 01 Jul 2024 15:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOIh8-0003zg-Nc; Mon, 01 Jul 2024 15:11:54 +0000
Received: by outflank-mailman (input) for mailman id 751780;
 Mon, 01 Jul 2024 15:11:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fTSe=OB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sOIh7-0003za-8c
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 15:11:53 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e4d5e16-37bc-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 17:11:51 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-57cbc66a0a6so639369a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 08:11:51 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58614d50409sm4477926a12.68.2024.07.01.08.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 08:11:50 -0700 (PDT)
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
X-Inumbo-ID: 3e4d5e16-37bc-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719846710; x=1720451510; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jgnHJ5Y58C1RC6pwwu2MqeJ9YmmthzZBE20Xh0GGb8M=;
        b=QdPmx+C7FCFnQK2B44XXpX8+eTs2aGzCeoSHWGlC+/3UR5WBzMAxxyQ5TrvEfpTIhI
         cATiqQzmhm3/vgjM6H+Ogk3Ad1Oigi4CBdUdszgFLj/99Bw+Q7MiKKu0P4eWQAvLS7dH
         QxQzts5N9ubsSCVqKdJxHjJDwBEAuZHq5ZgDuth4HSLDwOrfO202cN5Hwz2jpBSvg4dq
         4NvJ5VqmtI0bRIRGnu4FpLv78MaeAeqPq7u7DVYMwiz+KCKOTEIQtkUpli9Jzw7FXLmB
         6h6r/5onmPddXXmke/ElL5UALmMUr+rRbJJetd6Sf/XyV1XyLFMBpw6bo9xzF8XaQjnH
         Sayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719846710; x=1720451510;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jgnHJ5Y58C1RC6pwwu2MqeJ9YmmthzZBE20Xh0GGb8M=;
        b=VFsAHdPXmaHJ+vUn9YcKiUzF7Okd47h3z9FEaJ/0rc3HPel4XkAuF6QGraJILwvdgo
         0MdXeXadPsPmkkhHqSdLGfRCHmx957sJ5Apk8rwGtm98W90qXVenotgh7xflAy95uxM4
         IVTOD4cvNYPHx+OtnALL4dWdvtKQ0QYRoIbOF79xjVpqzwD4bYUeSOAaefxrxza3UU41
         nJaqrWTL0139kOtDRd9jnS23eiJruNtvZcRYnqim7vGzXraczjnfOOP8kaEzhRsignNH
         hXFqokP6W2uVMjWo9p8KLhkS5uAe6LzS40hxxdyqNNDWiwcw1RVoA9pMzWou3o+mD2ki
         Qftg==
X-Forwarded-Encrypted: i=1; AJvYcCUq2ll+ugUmzBlpBvyVCT9XBg4hq0EnsbIWQgJfLay/nMf27o5eWqoy0dDWtB/h0ehbJ/nFf3xkfIWH0oN4AC60LN/QATDKvR5Qu4Tm60U=
X-Gm-Message-State: AOJu0YxmY7/MXAgexWtmRl3npMu0YA93dBIIO+OrlY649cWq3kgMR+Ko
	p2aLEcqclPHTG2Y3n9HnoflPHMmy0i3/69eiC8COX499iUQH/jXR
X-Google-Smtp-Source: AGHT+IHX7xWO8g0RwdLW6+qpnRcZr2RPfJc74hVjT5BbmId8sk5IlyRKXg9nvWW/Mk4THpKwCjMQ+A==
X-Received: by 2002:a05:6402:3494:b0:585:2924:1569 with SMTP id 4fb4d7f45d1cf-5865e026b63mr7782414a12.21.1719846710408;
        Mon, 01 Jul 2024 08:11:50 -0700 (PDT)
Message-ID: <fabbfa80ab4cfd516f4ac1e03c6318f672dad546.camel@gmail.com>
Subject: Re: [PATCH for-4.19? 3/6] xen/macros: Introduce BUILD_ERROR()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
 <michal.orzel@amd.com>
Date: Mon, 01 Jul 2024 17:11:49 +0200
In-Reply-To: <20240625190719.788643-4-andrew.cooper3@citrix.com>
References: <20240625190719.788643-1-andrew.cooper3@citrix.com>
	 <20240625190719.788643-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

T24gVHVlLCAyMDI0LTA2LTI1IGF0IDIwOjA3ICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+
IC4uLiBhbmQgdXNlIGl0IGluIHNlbGYtdGVzdHMuaC4KPiAKPiBUaGlzIGlzIGludGVuZGVkIHRv
IHJlcGxhY2UgY29uc3RydWN0cyBzdWNoIGFzIF9fYml0b3BfYmFkX3NpemUoKS7CoAo+IEl0Cj4g
cHJvZHVjZXMgYSBiZXR0ZXIgZGlhZ25vc3RpYywgYW5kIGlzIE1JU1JBLWZyaWVuZGx5Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
Cj4gLS0tCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPiBDQzogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz4KPiBDQzogVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29t
Pgo+IENDOiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+Cj4gQ0M6
IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+Cj4gQ0M6IE9sZWtzaWkgS3Vyb2No
a28gPG9sZWtzaWkua3Vyb2Noa29AZ21haWwuY29tPgo+IAo+IFJGQyBmb3ItNC4xOS7CoCBUaGlz
IGNhbiBiZSB1c2VkIHRvIG5vdCBpbnRyb2R1Y2UgbmV3IE1JU1JBIHZpb2xhdGlvbnMKPiB3aGVu
Cj4gYWRqdXN0aW5nIF9fYml0b3BfYmFkX3NpemUoKS7CoCBJdCdzIHNhZmUgdG8gcHVsbCBvdXQg
b2YgdGhpcyBzZXJpZXMuCldlIGNhbiBjb25zaWRlciB0aGlzIHBhdGNoIHRvIGJlIGluIDQuMTkg
cmVsZWFzZSBpZiBuZWNlc3NhcnkgQWNrZWQKd2lsbCBiZSByZWNpZXZlZDoKIFJlbGVhc2UtQWNr
ZWQtQnk6IE9sZWtzaWkgS3Vyb2Noa28gPG9sZWtzaWkua3Vyb2Noa29AZ21haWwuY29tPgoKfiBP
bGVrc2lpCgo+IAo+IC0tLQo+IMKgeGVuL2luY2x1ZGUveGVuL21hY3Jvcy5owqDCoMKgwqAgfCAy
ICsrCj4gwqB4ZW4vaW5jbHVkZS94ZW4vc2VsZi10ZXN0cy5oIHwgNCArKy0tCj4gwqAyIGZpbGVz
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUveGVuL21hY3Jvcy5oIGIveGVuL2luY2x1ZGUveGVuL21hY3Jvcy5oCj4g
aW5kZXggZWM4OWY0NjU0ZmNmLi44NDQxZDdlN2Q2NmEgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1
ZGUveGVuL21hY3Jvcy5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL21hY3Jvcy5oCj4gQEAgLTU5
LDYgKzU5LDggQEAKPiDCoCNkZWZpbmUgQlVJTERfQlVHX09OKGNvbmQpICgodm9pZClCVUlMRF9C
VUdfT05fWkVSTyhjb25kKSkKPiDCoCNlbmRpZgo+IMKgCj4gKyNkZWZpbmUgQlVJTERfRVJST1Io
bXNnKSBhc20gKCAiLmVycm9yIFwiIiBtc2cgIlwiIiApCj4gKwo+IMKgLyogSGlkZSBhIHZhbHVl
IGZyb20gdGhlIG9wdGltaXNlci4gKi8KPiDCoCNkZWZpbmUgSElERSh4KcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+IMKg
wqDCoMKgICh7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gZGlmZiAtLWdpdCBhL3hlbi9p
bmNsdWRlL3hlbi9zZWxmLXRlc3RzLmggYi94ZW4vaW5jbHVkZS94ZW4vc2VsZi0KPiB0ZXN0cy5o
Cj4gaW5kZXggNDJhNGNjNGQxN2ZlLi40YmMzMjJiN2YyYTYgMTAwNjQ0Cj4gLS0tIGEveGVuL2lu
Y2x1ZGUveGVuL3NlbGYtdGVzdHMuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zZWxmLXRlc3Rz
LmgKPiBAQCAtMjIsOSArMjIsOSBAQAo+IMKgwqDCoMKgwqDCoMKgwqAgdHlwZW9mKGZuKHZhbCkp
IHJlYWwgPQo+IGZuKHZhbCk7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4g
wqDCoMKgIFwKPiDCoMKgwqDCoMKgwqDCoMKgIGlmICggIV9fYnVpbHRpbl9jb25zdGFudF9wKHJl
YWwpCj4gKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgXAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFzbSAoICIuZXJyb3IgXCInIiBT
VFIoZm4odmFsKSkgIicgbm90IGNvbXBpbGUtdGltZQo+IGNvbnN0YW50XCIiICk7IFwKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBCVUlMRF9FUlJPUigiJyIgU1RSKGZuKHZhbCkpICInIG5vdCBj
b21waWxlLXRpbWUKPiBjb25zdGFudCIpOyBcCj4gwqDCoMKgwqDCoMKgwqDCoCBlbHNlIGlmICgg
cmVhbCAhPSByZXMKPiApwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGFzbSAoICIuZXJyb3IgXCJDb21waWxlIHRpbWUgY2hlY2sgJyIgU1RSKGZuKHZh
bCkgPT0KPiByZXMpICInIGZhaWxlZFwiIiApOyBcCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
QlVJTERfRVJST1IoIkNvbXBpbGUgdGltZSBjaGVjayAnIiBTVFIoZm4odmFsKSA9PSByZXMpCj4g
IicgZmFpbGVkIik7IFwKPiDCoMKgwqDCoCB9IHdoaWxlICggMCApCj4gwqAjZWxzZQo+IMKgI2Rl
ZmluZSBDT01QSUxFX0NIRUNLKGZuLCB2YWwsIHJlcykKCg==



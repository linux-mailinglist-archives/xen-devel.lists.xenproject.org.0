Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D249B97E9F1
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 12:32:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801871.1211915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgMH-0005kI-5D; Mon, 23 Sep 2024 10:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801871.1211915; Mon, 23 Sep 2024 10:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgMH-0005h7-19; Mon, 23 Sep 2024 10:31:57 +0000
Received: by outflank-mailman (input) for mailman id 801871;
 Mon, 23 Sep 2024 10:31:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=81ci=QV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ssgMG-0005h1-4s
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 10:31:56 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0dd55fc6-7997-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 12:31:55 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c5bca59416so1525098a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 03:31:55 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bb5f2b6sm10220640a12.52.2024.09.23.03.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 03:31:53 -0700 (PDT)
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
X-Inumbo-ID: 0dd55fc6-7997-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727087515; x=1727692315; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9iMEpwiF8JFXsAKE2907nKP8LFyNI0+3168tWS6XdHs=;
        b=WyBxZ6AZJ24PaNLiRqpnxOcbSjCk/0icZEYvf0mKq4hQHnWQSHStQWYSHMiUKqr6V5
         snSDA4tqVElj1Mgyj8tv2Je+LgrYHuh/X0Qg7PMPVJUoZLjNJDFFBQRqJ7H4L2PuVg9P
         nH6nLS15vGwyRvZfPGzfohSsZcNz0Z9+MEz2bePEW3kTaVDQeiIljF/jwDs7yL7xPKIf
         p3wdBIwNgx8LQDCDsnkfzOQ8QFH2wt337gV9j7qKGma6650EdpszF4Cu7ftVGW+J7397
         6E/lP7fmE7DafaRvFNqGotJzX9CMTW8MA21RxUa5OLygOf6E+wMkm8OkVLm/fdZeWzok
         mHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727087515; x=1727692315;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9iMEpwiF8JFXsAKE2907nKP8LFyNI0+3168tWS6XdHs=;
        b=aDD72OjS/xPP5Y14EtxDlKTFNjrZ+hv/iC2UkyZ3TlBTmh/lGZB7ca2uD3ZBfkcrd+
         WIfXz6xHHLLDSOiLy5aQzwMw5EDGiIISAEWpCVWcbIF1Z9/U8YsVap2q4WXktdgOdvpI
         SRNJQPvtiQ0U7xF64n70b6Wz6LjBEvKfOHKylk35f/cFqDLp/ropJwcQDFVLzAFTfJzq
         BAcC9pZ+zRXXO7Pq1yOB+WbsJ3oM2KNYUnu4g13R/PYIO9N46x3DD1FREHTzzOebEkB1
         O+t0bm8c3nuxwSfkbY7e26lzIxY/olx7zhAS44lP4PqQyU93O7hWM72xH6QoFWALRytL
         5ivg==
X-Forwarded-Encrypted: i=1; AJvYcCU5yA8yffzEKWICNm8hoCWXJQ8SWMa/u/NrF0J5dTMqLVeZSNR4ouKNTqZ3+Og+lswzZRWFNyJOdXo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCWIG0k/4hBlD4Zzp8M9glP2qX91mXu8lED6XEHPj6DY4yNsST
	KBGgqwhU22tutZfX1FydLM9mmdnt8r/p0Zw/K01giDiyBcFfCy68bYOwyA==
X-Google-Smtp-Source: AGHT+IFD59r5ja5pIbCtIJ1Hdw0LwSysMlt5Z5KgfzVsbfLNoaSLxnZ620tz/fc/gS3QTJW1TAWnsg==
X-Received: by 2002:a05:6402:43cb:b0:5c5:b902:a0f with SMTP id 4fb4d7f45d1cf-5c5b9020bb4mr5790022a12.15.1727087514194;
        Mon, 23 Sep 2024 03:31:54 -0700 (PDT)
Message-ID: <03d6974b7fb01da8c2813f1d4f6b516bc62ea3dc.camel@gmail.com>
Subject: Re: [PATCH v2 1/5] xen: define ACPI and DT device info sections
 macros
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall
 <julien@xen.org>,  Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Date: Mon, 23 Sep 2024 12:31:52 +0200
In-Reply-To: <b9320c6b-9827-4826-b99e-585e0328b35a@suse.com>
References: <cover.1726579819.git.oleksii.kurochko@gmail.com>
	 <3049dd691f79c688751abaae63c0ccdc36680fbb.1726579819.git.oleksii.kurochko@gmail.com>
	 <b9320c6b-9827-4826-b99e-585e0328b35a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

T24gTW9uLCAyMDI0LTA5LTIzIGF0IDEyOjA4ICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAxNy4wOS4yMDI0IDE4OjE1LCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gLS0tIGEveGVu
L2luY2x1ZGUveGVuL3hlbi5sZHMuaAo+ID4gKysrIGIveGVuL2luY2x1ZGUveGVuL3hlbi5sZHMu
aAo+ID4gQEAgLTExNCw2ICsxMTQsMjEgQEAKPiA+IMKgCj4gPiDCoC8qIExpc3Qgb2YgY29uc3Ry
dWN0cyBvdGhlciB0aGFuICpfU0VDVElPTlMgaW4gYWxwaGFiZXRpY2FsIG9yZGVyLgo+ID4gKi8K
PiA+IMKgCj4gPiArI2RlZmluZSBVU0VfREVDTF9TRUNUSU9OKHgpIERFQ0xfU0VDVElPTih4KQo+
ID4gKwo+ID4gKyNkZWZpbmUgTk9VU0VfREVDTF9TRUNUSU9OKHgpIHggOgo+ID4gKwo+ID4gKyNp
ZmRlZiBDT05GSUdfQUNQSQo+ID4gKyNkZWZpbmUgQUNQSV9ERVZfSU5GT19TRUMoc2VjbmFtZSwg
REVDTF9TRUNUSU9OX01BQ1JPU19OQU1FKcKgIFwKPiA+ICvCoMKgwqAgREVDTF9TRUNUSU9OX01B
Q1JPU19OQU1FKHNlY25hbWUpIHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFwKPiA+ICvCoMKgwqDCoMKgIF9hc2RldmljZSA9IC47wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFwKPiA+ICvCoMKgwqDCoMKgICooc2VjbmFtZSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBcCj4gPiArwqDCoMKgwqDCoCBfYWVkZXZpY2UgPSAuO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBc
Cj4gPiArwqDCoMKgIH0gOnRleHQKPiA+ICsjZWxzZQo+ID4gKyNkZWZpbmUgQUNQSV9ERVZfSU5G
T19TRUMoc2VjbmFtZSwgREVDTF9TRUNUSU9OX01BQ1JPU19OQU1FKQo+ID4gKyNlbmRpZiAvKiBD
T05GSUdfQUNQSSAqLwo+ID4gKwo+ID4gwqAjZGVmaW5lIEJVR0ZSQU1FU8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiDCoMKg
wqDCoCBfX3N0YXJ0X2J1Z19mcmFtZXNfMCA9IC47wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFwKPiA+IMKgwqDCoMKgICooLmJ1Z19mcmFtZXMuMCnCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gQEAgLTEzMSw2ICsx
NDYsMTcgQEAKPiA+IMKgwqDCoMKgICooLmJ1Z19mcmFtZXMuMynCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gwqDCoMKgwqAgX19zdG9w
X2J1Z19mcmFtZXNfMyA9IC47Cj4gPiDCoAo+ID4gKyNpZmRlZiBDT05GSUdfSEFTX0RFVklDRV9U
UkVFCj4gPiArI2RlZmluZSBEVF9ERVZfSU5GT19TRUMoc2VjbmFtZSwgREVDTF9TRUNUSU9OX01B
Q1JPU19OQU1FKcKgIFwKPiA+ICvCoMKgwqAgREVDTF9TRUNUSU9OX01BQ1JPU19OQU1FKHNlY25h
bWUpIHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKg
wqDCoMKgIF9zZGV2aWNlID0gLjvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArwqDCoMKg
wqDCoCAqKHNlY25hbWUpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDC
oMKgwqAgX2VkZXZpY2UgPSAuO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKgwqAg
fSA6dGV4dAo+ID4gKyNlbHNlCj4gPiArI2RlZmluZSBERUNMX0RUX0RFVl9JTkZPX1NFQyhzZWNu
YW1lLCBERUNMX1NFQ1RJT05fTUFDUk9TX05BTUUpCj4gPiArI2VuZGlmIC8qIENPTkZJR19IQVNf
REVWSUNFX1RSRUUgKi8KPiAKPiBBbnkgc3BlY2lmaWMgcmVhc29uIGZvciB0aGUgX1NFQyBzdWZm
aXhlcyBpbiB0aGUgbmFtZXM/IFdlIGRvbid0IGhhdmUKPiBzdWNoIGVsc2V3aGVyZSwgYXMgY2Fu
IGJlIHNlZW4gKGJ5IGV4YW1wbGUpIC4uLgo+IAo+ID4gwqAjaWZkZWYgQ09ORklHX0hZUEZTCj4g
PiDCoCNkZWZpbmUgSFlQRlNfUEFSQU3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiDC
oMKgwqDCoMKgwqDCoCAuID0gQUxJR04oUE9JTlRFUl9BTElHTik7IFwKPiAKPiAuLi4gZXZlbiBp
biBjb250ZXh0IGhlcmUuCgpUaGUgX1NFQyBzdWZmaXhlcyBjYW4gYmUgcmVtb3ZlZDsgdGhleSB3
ZXJlIG9ubHkgdXNlZCB0byBoaWdobGlnaHQgdGhhdAppdCB3YXMgYSBzZWN0aW9uIGRlY2xhcmF0
aW9uLiBJJ2xsIGRyb3AgaXQgaW4gdGhlIG5leHQgcGF0Y2ggdmVyc2lvbi4KCn4gT2xla3NpaQo=



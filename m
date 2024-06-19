Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BDA90E974
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 13:31:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743660.1150591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJtWo-00085r-T2; Wed, 19 Jun 2024 11:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743660.1150591; Wed, 19 Jun 2024 11:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJtWo-000849-QJ; Wed, 19 Jun 2024 11:31:02 +0000
Received: by outflank-mailman (input) for mailman id 743660;
 Wed, 19 Jun 2024 11:31:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hxBI=NV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sJtWn-000843-Rp
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 11:31:01 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66c83239-2e2f-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 13:30:59 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4218180a122so46504475e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 04:30:59 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3607509c707sm17009042f8f.36.2024.06.19.04.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 04:30:58 -0700 (PDT)
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
X-Inumbo-ID: 66c83239-2e2f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718796659; x=1719401459; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2OQcV8wPm6FM6pib18mi19TvpIhUIlJRckjnpmOo1Yo=;
        b=H5XCTu4Z7IJHKnhqyUOXcyQ1lW6CYnYr1uCbvR8tAfm0lxnKP0r230Ybx7SL5QDNm9
         2yLhrJSya0HdO/P/pgUeNQyLg6rBewOJqbTSL37+yS6zTB/OdwpRfk2W1HTPP72XQJl2
         ooflseCF56DMM2iqWgwVIZt8Xi1e9U+9jjKO/tQMy4PNMTsZGc4LuB+Fdo1QlisT3a4A
         EcA54vFEeIglS+LnGlIx/sKBayXxhhjGgtfwl8Dux7J6sEhBLla7XtuNjzgIYk0Ki/fD
         g1klr6X5aoXydY6UXqmwQEjGa7A2iIAWivipy2iOf8/xJ8RLyEqT9rtfXTndVpYJqDKc
         rmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796659; x=1719401459;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2OQcV8wPm6FM6pib18mi19TvpIhUIlJRckjnpmOo1Yo=;
        b=DJZwbDrD35HzmwISlHHhayDv3vNQTSqEGifTJIt5CChCStVQWzmuMpl2UwLqPGWe6v
         hzH7bqwS64fkwD21iB5/1ddlxhR6h0JGis+SsGXx1Rflq4i+wtdTtAHwegprF0ELHDKx
         IMToKXTtOfXz7UPQrUfZeM8yy79J+AeE9L1b2bw2JP2o4cagcZifrdhvAud5tQT2XTIW
         hrxBc90zn1h/GpLXR8ejp0SsOCTBXomvICMYne4hMxehv9LSLSTfd+inMiYHaP6qkp62
         4FumwlEv84+zjhCa9RcrkqParudpARpdvUyEXOghQC3hpgilgVOuPNE/ySUIl9cdoMg/
         +NNw==
X-Forwarded-Encrypted: i=1; AJvYcCWFdOUJPo4RIF4y5k+SknDE6XeYuxpu2Na9ETIXhg8V7BlacmfNaN94iXvor9n1h6Qs7d4Q/F/1uSZqlDpzAk+OQZCMFG/6vhNW7+ZUpuc=
X-Gm-Message-State: AOJu0Yzl+DcqL9tLQdnPDlXhhRSw+d3QkiiIYW+XjBkxs0+DKZKzYaHd
	2sTMONbNmFXdIzy9/x32PGc0iIX9ty+RqPR5yyK0lP46CwpLh3rF
X-Google-Smtp-Source: AGHT+IEESA6Zs9Q9brwIwCSKoZHiAO8OgyglAiGCQfnM+vzfu1dJ7v8az8f/Lwan2tnP3Jhzn4yRTA==
X-Received: by 2002:a5d:63c7:0:b0:362:c971:d97e with SMTP id ffacd0b85a97d-363171e241bmr1730637f8f.4.1718796658650;
        Wed, 19 Jun 2024 04:30:58 -0700 (PDT)
Message-ID: <97fb98c6763a9a56875240359919e7713225f53f.camel@gmail.com>
Subject: Re: [PATCH for-4.19 v4 0/7] x86/xstate: Fixes to size calculations
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>
Date: Wed, 19 Jun 2024 13:30:57 +0200
In-Reply-To: <20240617173921.1755439-1-andrew.cooper3@citrix.com>
References: <20240617173921.1755439-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

T24gTW9uLCAyMDI0LTA2LTE3IGF0IDE4OjM5ICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+
IE9ubHkgbWlub3IgY2hhbmdlcyBpbiB2NCB2cyB2My7CoCBTZWUgcGF0Y2hlcyBmb3IgZGV0YWls
cy4KPiAKPiBUaGUgZW5kIHJlc3VsdCBoYXMgYmVlbiB0ZXN0ZWQgYWNyb3NzIHRoZSBlbnRpcmUg
WGVuU2VydmVyIGhhcmR3YXJlCj4gbGFiLsKgIFRoaXMKPiBmb3VuZCBzZXZlcmFsIGZhbHNlIGFz
c3VwbXRpb24gYWJvdXQgaG93IHRoZSBkeW5hbWljIHNpemVzIGJlaGF2ZS4KUmVsZWFzZS1BY2tl
ZC1ieTogT2xla3NpaSBLdXJvY2hrbyA8b2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20+Cgp+IE9s
ZWtzaWkKPiAKPiBQYXRjaGVzIDEgYW5kIDYgdGhlIG1haW4gYnVnZml4ZXMgZnJvbSB0aGlzIHNl
cmllcy7CoCBUaGVyZSdzIHN0aWxsCj4gbG90cyBtb3JlCj4gd29yayB0byBkbyBpbiBvcmRlciB0
byBnZXQgQU1YIGFuZC9vciBDRVQgd29ya2luZywgYnV0IHRoaXMgaXMgYXQKPiBsZWFzdCBhIDQt
eW8KPiBzZXJpZXMgZmluYWxseSBvZmYgbXkgcGxhdGUuCj4gCj4gQW5kcmV3IENvb3BlciAoNyk6
Cj4gwqAgeDg2L3hzdGF0ZTogRml4IGluaXRpYWxpc2F0aW9uIG9mIFhTUyBjYWNoZQo+IMKgIHg4
Ni94c3RhdGU6IENyb3NzLWNoZWNrIGR5bmFtaWMgWFNUQVRFIHNpemVzIGF0IGJvb3QKPiDCoCB4
ODYvYm9vdDogQ29sbGVjdCB0aGUgUmF3IENQVSBQb2xpY3kgZWFybGllciBvbiBib290Cj4gwqAg
eDg2L3hzdGF0ZTogUmV3b3JrIHhzdGF0ZV9jdHh0X3NpemUoKSBhcyB4c3RhdGVfdW5jb21wcmVz
c2VkX3NpemUoKQo+IMKgIHg4Ni9jcHUtcG9saWN5OiBTaW1wbGlmeSByZWNhbGN1bGF0ZV94c3Rh
dGUoKQo+IMKgIHg4Ni9jcHVpZDogRml4IGhhbmRsaW5nIG9mIFhTQVZFIGR5bmFtaWMgbGVhdmVz
Cj4gwqAgeDg2L2RlZm5zOiBDbGVhbiB1cCBYODZfe1hDUjAsWFNTfV8qIGNvbnN0YW50cwo+IAo+
IMKgeGVuL2FyY2gveDg2L2NwdS1wb2xpY3kuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqAgNTYgKystLQo+IMKgeGVuL2FyY2gveDg2L2NwdWlkLmPCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyNCArLQo+IMKgeGVuL2FyY2gv
eDg2L2RvbWN0bC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgwqAgMiArLQo+IMKgeGVuL2FyY2gveDg2L2h2bS9odm0uY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICstCj4gwqB4ZW4vYXJjaC94ODYvaTM4Ny5j
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIg
Ky0KPiDCoHhlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS94ODYtZGVmbnMuaMKgwqDCoMKgwqDCoMKg
IHzCoCA1NSArKy0tCj4gwqB4ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20veHN0YXRlLmjCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqDCoCA4ICstCj4gwqB4ZW4vYXJjaC94ODYvc2V0dXAuY8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNCArLQo+IMKgeGVu
L2FyY2gveDg2L3hzdGF0ZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCAyOTQgKysrKysrKysrKysrKysrKystCj4gLS0KPiDCoHhlbi9pbmNsdWRlL3B1Ymxp
Yy9hcmNoLXg4Ni9jcHVmZWF0dXJlc2V0LmggfMKgwqAgMyArCj4gwqB4ZW4vaW5jbHVkZS94ZW4v
bGliL3g4Ni9jcHUtcG9saWN5LmjCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICstCj4gwqAxMSBmaWxl
cyBjaGFuZ2VkLCAzMzAgaW5zZXJ0aW9ucygrKSwgMTIyIGRlbGV0aW9ucygtKQo+IAoK



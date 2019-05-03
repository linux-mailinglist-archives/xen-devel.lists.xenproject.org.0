Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC1F131B3
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 18:01:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMaaX-0007rT-Rp; Fri, 03 May 2019 15:59:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaaW-0007qk-7c
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:59:04 +0000
X-Inumbo-ID: 5ed15871-6dbc-11e9-843c-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5ed15871-6dbc-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 15:59:03 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id b12so5654915lji.4
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ad37KRXN91B8ACrl4rKyNROT9IAmty+3bOhAiCSV7vA=;
 b=EgY2hkX9G9eAMCKlhcVqzQ9zwRPqA0EEuU/xzI2CiOQgUxHuvbb4ru5DVDgnq4bJE+
 uakSw7XC5fgaJ3ZnwAu48xjPxBcDaR4SO4/P62MkVl7cThxihLqmO/ETkx5cI6hBEGvr
 LwdfJXBE9oMluWOPHFPQUWYcignE8xP1N0K2VjiSLN7D7CJCOgjRkG9qO6dDNMBhdtbn
 4sCcRm7lqRhBoqhncnSFsO/bFNbfvT5lY1vW4SG4EYeGy6iKR0//DF0ECOlIEkm0QNH1
 13NtIW3nV8XxtMgEkwzOAbeWZpeeAnq5jRPsGBmZZaQnHUDoQLViSnQ0SsJj4ztwnyD/
 ylCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ad37KRXN91B8ACrl4rKyNROT9IAmty+3bOhAiCSV7vA=;
 b=EQcafUOJNo/cMOAjA+lnQguAOFBpWJLKJpzDKOoYAUzQsLLqebRrfcnwE4/4eK0lz/
 92QFdot4U4RAU/I4HRzAv70Qb0+om8/bdggflGyTyosicK2QBrGwBoZSP7uCLX+FISt0
 xxf2PfN9CsYeDXEu2rjkvvyCuAOSqH/tu70JP31c+ur1NkQQVAwg8OkyB4c2sYo1N2FS
 O+zctZnt8stNkKODIE01CnoiM8ub29QDipEmBx4389Jb3TRzJVD/z4phs8khH1SNh+Qv
 MNy//i8aSQVxW0IMmOPMxHtoSwn/LSwlBVQM0AQB49h4t0zZkfanP4QM/RyLrdt9O0fs
 Wbhw==
X-Gm-Message-State: APjAAAVdSEGDFtvAR9GEUkgTuZSBoesBzbzjbH/sxqGmFXHFNjpiDNII
 RAv3RNPrSKZWpBXdYI1iJvw=
X-Google-Smtp-Source: APXvYqys8GFfjfb2k85m7aTCH5NrXZYWyaLzbF1mblhulb5Gz14zJTSyv2E46NsKbRqOx4gtZW5NTQ==
X-Received: by 2002:a2e:8693:: with SMTP id l19mr5461488lji.47.1556899141882; 
 Fri, 03 May 2019 08:59:01 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 b28sm493968lfc.7.2019.05.03.08.59.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 08:59:01 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-17-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <13fdc8c8-5dba-7b21-067e-e54e9531bf73@gmail.com>
Date: Fri, 3 May 2019 18:59:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190422164937.21350-17-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 16/20] xen/arm: mm: Protect Xen page-table
 update with a spinlock
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVsaWVuLAoKT24gMjIuMDQuMTkgMTk6NDksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBU
aGUgZnVuY3Rpb24gY3JlYXRlX3hlbl9lbnRyaWVzIG1heSBiZSBjb25jdXJyZW50bHkgY2FsbGVk
LiBTbyB3ZSBuZWVkCj4gdG8gcHJvdGVjdCB3aXRoIGEgc3BpbmxvY2sgdG8gYXZvaWQgY29ycnVw
dGlvbiB0aGUgcGFnZS10YWJsZXMuCgpUaGUgcXVlc3Rpb24gZnJvbSBtZSBpcyB3aHkgZGlkbid0
IHdlIHN0ZXAgaW50byB0aGlzIGlzc3VlIGJlZm9yZT8KCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAtLS0KPiAgIHhlbi9hcmNoL2FybS9t
bS5jIHwgNiArKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwo+IGluZGV4
IGZhMGY0MWJkMDcuLmVjZGU0ZTM0ZGYgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL21tLmMK
PiArKysgYi94ZW4vYXJjaC9hcm0vbW0uYwo+IEBAIC05NjksNiArOTY5LDggQEAgZW51bSB4ZW5t
YXBfb3BlcmF0aW9uIHsKPiAgICAgICBSRVNFUlZFCj4gICB9Owo+ICAgCj4gK3N0YXRpYyBERUZJ
TkVfU1BJTkxPQ0soeGVuX3B0X2xvY2spOwo+ICsKPiAgIHN0YXRpYyBpbnQgY3JlYXRlX3hlbl9l
bnRyaWVzKGVudW0geGVubWFwX29wZXJhdGlvbiBvcCwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgdmlydCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIG1mbl90IG1mbiwKPiBAQCAtOTgwLDYgKzk4Miw4IEBAIHN0YXRpYyBpbnQgY3JlYXRl
X3hlbl9lbnRyaWVzKGVudW0geGVubWFwX29wZXJhdGlvbiBvcCwKPiAgICAgICBscGFlX3QgcHRl
LCAqZW50cnk7Cj4gICAgICAgbHBhZV90ICp0aGlyZCA9IE5VTEw7Cj4gICAKPiArICAgIHNwaW5f
bG9jaygmeGVuX3B0X2xvY2spOwo+ICsKPiAgICAgICBmb3IoOyBhZGRyIDwgYWRkcl9lbmQ7IGFk
ZHIgKz0gUEFHRV9TSVpFLCBtZm4gPSBtZm5fYWRkKG1mbiwgMSkpCj4gICAgICAgewo+ICAgICAg
ICAgICBlbnRyeSA9ICZ4ZW5fc2Vjb25kW3NlY29uZF9saW5lYXJfb2Zmc2V0KGFkZHIpXTsKPiBA
QCAtMTA1NCw2ICsxMDU4LDggQEAgb3V0Ogo+ICAgICAgICAqLwo+ICAgICAgIGZsdXNoX3hlbl90
bGJfcmFuZ2VfdmEodmlydCwgUEFHRV9TSVpFICogbnJfbWZucyk7Cj4gICAKPiArICAgIHNwaW5f
dW5sb2NrKCZ4ZW5fcHRfbG9jayk7Cj4gKwo+ICAgICAgIHJldHVybiByYzsKPiAgIH0KPiAgIAo+
IAoKCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs

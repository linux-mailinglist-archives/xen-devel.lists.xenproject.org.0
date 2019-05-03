Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC83131A0
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 17:59:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMaYz-00074e-Ei; Fri, 03 May 2019 15:57:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaYy-00073y-73
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:57:28 +0000
X-Inumbo-ID: 255d87ae-6dbc-11e9-843c-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 255d87ae-6dbc-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 15:57:26 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id q23so1012955lfc.12
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6eVNA1CxVkkja2TbDbB9zmx87IEjQbEVkFnhHp7bMRE=;
 b=rpnqjpkirs+l3t+uDcg4/zdsGpO6isA61RxYAK6Wcpm/047fX/P9RJl+STe3tPciY5
 OswqT8l9jiWMSaOKwNmWVupgwRAJzrq1rn0eZBjVeBkZy9s2cvB9MxsvlRu/DjWs97qK
 c9hEBQKWQQDIb6ZuZyNG7KdNbrWLsXvlY5b9fEcgnFqIw0v31IEfSc2lGGv4QrkSblom
 lldp2EIkDBvUTVPlj3WjDVDyVD96C5FITkyrtK5C//fBmYweRXXFm8Llgor8EtLY+SDE
 Kosp2msjku4q5Sexra929jS7uQa+otF/d6PUgL9dTmKoYbhb6KJjDhR0cbUoxpvPMAXb
 O12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6eVNA1CxVkkja2TbDbB9zmx87IEjQbEVkFnhHp7bMRE=;
 b=S4vewisnpuO1VV0H1GNck8WBcm35xtCQ8IQi+L5XQmP+hLbUMRWE+Cz/GWAtEenc8V
 LKTZmG2iNHvKiKyIPcupkxcjOw0ju+297gn9dK6ZsF1ZXV3MmPJc0GRpqN+AV+ewAcNC
 F91B1L3rNk1ZZS8OnI0CEQU8fy2NT0YBgViBaDIxm1BhZQawr8YITZwupVKKYDRl/GNj
 JdnQwc6m1MIKTpfYRj4Hw9khEIcDtVJyckqtVpWL3HWACePq18T6LCiwPsAnY3cuTGaA
 X7ZFrON8qVum8I5Jr577yKUDywYa1mIpqDUunQzcjfuopdjHZsvVRS2vPnm03jPpOMe2
 ia1g==
X-Gm-Message-State: APjAAAXMLpSPiuLxyOaSS2ZkZI/Y8UMa9GYZI2OU4L5IxhN180uWRzFt
 Nwddz1IxLpIFBwwqkvJY02RRvajK68o=
X-Google-Smtp-Source: APXvYqxMcXHdnDf/8GxJ+nWC2jzEOTRuFLO8pBzLIHjjHCujDtv3p6FceBw2sObu0+31mryhyhAtAA==
X-Received: by 2002:ac2:443c:: with SMTP id w28mr3103612lfl.38.1556899045472; 
 Fri, 03 May 2019 08:57:25 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 q125sm454884ljb.76.2019.05.03.08.57.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 08:57:24 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-13-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <be841c38-657f-de69-0a9b-dd2b8c214a22@gmail.com>
Date: Fri, 3 May 2019 18:57:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190422164937.21350-13-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 12/20] xen/arm32: head: Always zero r3
 before update a page-table entry
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
aGUgYm9vdCBjb2RlIGlzIHVzaW5nIHIyIGFuZCByMyB0byBob2xkIHRoZSBwYWdlLXRhYmxlIGVu
dHJ5IHZhbHVlLgo+IFdoaWxlIHIyIGlzIGFsd2F5cyB1cGRhdGVkIGJlZm9yZSBzdG9yaW5nIHRo
ZSB2YWx1ZSwgdGhpcyBpcyBub3QgYWx3YXlzCj4gdGhlIGNhc2UgZm9yIHIzLgo+IAo+IFRoYW5r
ZnVsbHkgdG9kYXksIHIzIHdpbGwgYWx3YXlzIGJlIHplcm8gd2hlbiB3ZSBjYXJlLiBCdXQgdGhp
cyBpcwo+IGRpZmZpY3VsdCB0byB0cmFjayBhbmQgZXJyb3ItcHJvbmUuCj4gCj4gU28gYWx3YXlz
IHplcm8gcjMgd2l0aGluIHRoZSBmZXcgaW5zdHJ1Y3Rpb25zIGJlZm9yZSB0aGUgd3JpdGUgdGhl
Cj4gcGFnZS10YWJsZSBlbnRyeS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPgo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyB8
IDMgKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5T
Cj4gaW5kZXggMzQ0ODgxN2FhYi4uMDUzNmI2MmFlYyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9h
cm0vYXJtMzIvaGVhZC5TCj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwo+IEBAIC0y
NzAsNiArMjcwLDcgQEAgY3B1X2luaXRfZG9uZToKPiAgICAgICAgICAgb3JyICAgcjIsIHIyLCAj
UFRfVVBQRVIoTUVNKSAvKiByMjpyMyA6PSBzZWN0aW9uIG1hcCAqLwo+ICAgICAgICAgICBvcnIg
ICByMiwgcjIsICNQVF9MT1dFUihNRU0pCj4gICAgICAgICAgIGxzbCAgIHIxLCByMSwgIzMgICAg
ICAgICAgICAgLyogcjEgOj0gU2xvdCBvZmZzZXQgKi8KPiArICAgICAgICBtb3YgICByMywgIzB4
MD4gICAgICAgICAgIHN0cmQgIHIyLCByMywgW3I0LCByMV0gICAgICAgLyogTWFwcGluZyBvZiBw
YWRkcihzdGFydCkgKi8KPiAgICAgICAgICAgbW92ICAgcjYsICMxICAgICAgICAgICAgICAgICAv
KiByNiA6PSBpZGVudGl0eSBtYXAgbm93IGluIHBsYWNlICovCj4gICAKPiBAQCAtMzc3LDYgKzM3
OCw3IEBAIHBhZ2luZzoKPiAgICAgICAgICAgbHNsICAgcjIsIHIyLCAjVEhJUkRfU0hJRlQgICAv
KiA0SyBhbGlnbmVkIHBhZGRyIG9mIFVBUlQgKi8KPiAgICAgICAgICAgb3JyICAgcjIsIHIyLCAj
UFRfVVBQRVIoREVWX0wzKQo+ICAgICAgICAgICBvcnIgICByMiwgcjIsICNQVF9MT1dFUihERVZf
TDMpIC8qIHIyOnIzIDo9IDRLIGRldiBtYXAgaW5jbHVkaW5nIFVBUlQgKi8KPiArICAgICAgICBt
b3YgICByMywgIzAKCldoYXQncyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIGAjMHgwYCBhbmQgYCMw
YD8gSSd2ZSBzZWVuIHRoZSB1c2FnZSBpcyBtaXhlZCBhY3Jvc3MgdGhlIGZpbGUsIGJ1dCBub3Qg
c3VyZSB3aHkuIENvdWxkIGl0IGJlIHVuaWZpZWQ/Cgo+ICAgICAgICAgICBzdHJkICByMiwgcjMs
IFtyMSwgIyhGSVhNQVBfQ09OU09MRSo4KV0gLyogTWFwIGl0IGluIHRoZSBmaXJzdCBmaXhtYXAn
cyBzbG90ICovCj4gICAxOgo+ICAgCj4gQEAgLTM4OCw2ICszOTAsNyBAQCBwYWdpbmc6Cj4gICAg
ICAgICAgIG9yciAgIHIyLCByMiwgI1BUX0xPV0VSKFBUKSAgLyogcjI6cjMgOj0gdGFibGUgbWFw
IG9mIHhlbl9maXhtYXAgKi8KPiAgICAgICAgICAgbGRyICAgcjQsID1GSVhNQVBfQUREUigwKQo+
ICAgICAgICAgICBtb3YgICByNCwgcjQsIGxzciAjKFNFQ09ORF9TSElGVCAtIDMpICAgLyogcjQg
Oj0gU2xvdCBmb3IgRklYTUFQKDApICovCj4gKyAgICAgICAgbW92ICAgcjMsICMwCkRpdHRvLgoK
PiAgICAgICAgICAgc3RyZCAgcjIsIHIzLCBbcjEsIHI0XSAgICAgICAvKiBNYXAgaXQgaW4gdGhl
IGZpeG1hcCdzIHNsb3QgKi8KPiAgIAo+ICAgICAgICAgICAvKiBVc2UgYSB2aXJ0dWFsIGFkZHJl
c3MgdG8gYWNjZXNzIHRoZSBVQVJULiAqLwo+IAoKV2l0aCB0aGUgbWlub3IgY29tbWVudHM6CgpS
ZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCi0tIApT
aW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs

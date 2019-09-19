Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1DDB7969
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 14:29:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAvUv-0004AW-67; Thu, 19 Sep 2019 12:25:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C8m3=XO=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iAvUt-0004AR-Jb
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 12:25:19 +0000
X-Inumbo-ID: 8a56edba-dad8-11e9-978d-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a56edba-dad8-11e9-978d-bc764e2007e4;
 Thu, 19 Sep 2019 12:25:18 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id y23so3361757lje.9
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2019 05:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=+90Hot02a9rmJaGAPUrO55FUeljP6KcR1a2k0GQsd/Y=;
 b=JYZFzLj4b4kZHfFN6F8dkHJ6BV+RZilmnvAFV/5gspMLRuHYtXL4YDvj5WtZ47XGd0
 fim3sK9J4/q+O8hS9m9pnKPz7egLyRUGobCaDInrzfY2X2HcoDph5Xvu+1SYyEdd31jW
 B3MSDvDffq6T0Gw18vcSiEUOLnzncT/4akeQVCEZHXZLxSO4/Zi25t+VI8bRSB+RN54Y
 5qp4I/nl7PuhLJqrXyv5qFHyiUxrGHLh/hZxjNdJSJXjQSE8ridoSnTXz5zJln096kA/
 Rxxg9YR/9UrAv4hMNXzDADc4VFbW+HJZF58rC+EwqnfdCgRlFKRst3AAWnLaRRMrhpjA
 t42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=+90Hot02a9rmJaGAPUrO55FUeljP6KcR1a2k0GQsd/Y=;
 b=EphvpHdn/wekaBFsZ2wPinwWvrl0fMcBGRFY7eX3u0vfqJqmqvWaaEt6xqdpaNyXkK
 PekDMbC69yQpZuesQKxhJroVUY76NTVah99OHn8kDWb/J9S4QFT48wNcXOI9LL8YEJG3
 /xOUgCklzUNmKRKmUZMoEBiXJ39pyezVgejDnvS00nuQJ2+MQTYNBJVubzwtsJNulqKL
 Izz67Wh8DljtmGdrOLmuMYhDbYcYcKy3ycnLaONEKyhRAm3qRq5lN8WF/JZgfh8yLrNF
 sLqml1oaLPs3z/+prJkHFS892e6Je/IzzVcJ4LGWaghXorqDxQO0fyUPOTg5PnrV6+TX
 f+nA==
X-Gm-Message-State: APjAAAWSt+wIEddqzU+iHUR9BX76Lec7BULZDyJAFlS7woY6iRZXC9c0
 NhGmGQoHfPVJqKaahnc48jU=
X-Google-Smtp-Source: APXvYqxl4pxh/0/J8CYqkwmC50SZQJ5Tyg6gq27CgowlV360XSy4OEbeaWZv+FBdauq5jeJxc/5Ncg==
X-Received: by 2002:a2e:94cd:: with SMTP id r13mr5255462ljh.24.1568895917559; 
 Thu, 19 Sep 2019 05:25:17 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id w13sm1547279lfk.47.2019.09.19.05.25.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Sep 2019 05:25:17 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-8-git-send-email-olekstysh@gmail.com>
 <631c94fe-d3ac-002b-0e1d-30b9b03158d1@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <aa7eb317-7807-71ba-8fe2-2e944516dcd6@gmail.com>
Date: Thu, 19 Sep 2019 15:25:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <631c94fe-d3ac-002b-0e1d-30b9b03158d1@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 7/8] iommu/arm: Introduce
 iommu_add_dt_device API
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDE5LjA5LjE5IDE0OjM1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgT2xla3NhbmRyLAoK
SGksIEp1bGllbi4KCgo+Cj4gT24gMTMvMDkvMjAxOSAxNjozNSwgT2xla3NhbmRyIFR5c2hjaGVu
a28gd3JvdGU6Cj4+IEZyb206IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNo
ZW5rb0BlcGFtLmNvbT4KPj4KPj4gVGhlIG1haW4gcHVwcm9zZSBvZiB0aGlzIHBhdGNoIGlzIHRv
IGFkZCBhIHdheSB0byByZWdpc3RlciBEVCBkZXZpY2UKPj4gKHdoaWNoIGlzIGJlaGluZCB0aGUg
SU9NTVUpIHVzaW5nIHRoZSBnZW5lcmljIElPTU1VIERUIGJpbmRpbmdzIFsxXQo+PiBiZWZvcmUg
YXNzaWduaW5nIHRoYXQgZGV2aWNlIHRvIGEgZG9tYWluLgo+Pgo+PiBTbywgdGhpcyBwYXRjaCBh
ZGRzIG5ldyAiaW9tbXVfYWRkX2R0X2RldmljZSIgQVBJIGZvciBhZGRpbmcgRFQgZGV2aWNlCj4+
IHRvIHRoZSBJT01NVSB1c2luZyBnZW5lcmljIElPTU1VIERUIGJpbmRpbmdzIGFuZCBwcmV2aW91
c2x5IGFkZGVkCj4+ICJpb21tdV9md3NwZWMiIHN1cHBvcnQuIEl0IGlzIGNhbGxlZCB3aGVuIGNv
bnN0cnVjdGluZyBEb20wIHNpbmNlCj4+ICJpb21tdV9hc3NpZ25fZHRfZGV2aWNlIiBjYW4gYmUg
Y2FsbGVkIGZvciBEb20wIGFsc28uCj4KPiBUaGUgbGFzdCBzZW50ZW5jZSBpcyBtaXNsZWFkaW5n
LiBZZXMgc29tZSBkZXZpY2VzIG1heSBiZSBhc3NpZ25lZCB0byAKPiB0aGUgaGFyZHdhcmUgZG9t
YWluIChha2EgZG9tMCkgYnV0IG90aGVyIG1heSBiZSBhc3NpZ25lZCB0byBvdGhlciAKPiBkb21h
aW5zLgo+Cj4gSGVyZSB5b3UgYXJlIChhYil1c2luZyB0aGUgY29uc3RydWN0aW9uIG9mIHRoZSBo
YXJkd2FyZSBkb21haW4gdG8gYWRkIAo+IGFsbCB0aGUgZGV2aWNlcyB0byB0aGUgSU9NTVUuIFRo
aXMgd29ya3MgZmluZSBub3cgYmVjYXVzZSB0aGUgaGFyZHdhcmUgCj4gZG9tYWluIHdpbGwgYWx3
YXlzIGJlIHRoZSBmaXJzdCBkb21haW4gdG8gYmUgaW5pdGlhbGl6ZWQuIEJ1dCBJIGFtIG5vdCAK
PiBzdXJlIHRoYXQgd2hldGhlciB0aGlzIGlzIGNvcnJlY3QgdG8gZG8gbG9uZyB0ZXJtLgo+Cj4g
QXMgbWVudGlvbmVkIGVhcmxpZXIsIG15IHByZWZlcmVuY2UgaXMgdG8ga2VlcCAiYWRkIiBhbmQg
ImFzc2lnbiIgCj4gc2VwYXJhdGVkLiBTbyBtYXliZSB3aGF0IHdlIHdhbnQgdG8gZG8gaXM6Cj4K
PiBpZiAoIG5lZWRfbWFwcGluZyApCj4gewo+IMKgwqAgaW9tbXVfYWRkX2R0X2RldmljZShkLCBk
ZXYpOwo+IMKgwqAgaWYgKCBkdF9kZXZpY2VfaXNfcHJvdGVjdGVkKGQpICkKPiDCoMKgIHsKPiDC
oMKgwqDCoCByZXMgPSBpb21tdV9hc3NpZ25fZHRfZGV2aWNlKC4uLik7Cj4gwqDCoMKgwqAgaWYg
KCByZXMgKQo+IMKgwqDCoMKgwqDCoCAvKiBlcnJvciAqLwo+IMKgwqAgfQo+IH0KPiBXZSB3b3Vs
ZCBuZWVkIHNpbWlsYXIgY29kZSBpbiBpb21tdV9kb19kdF9kb21jdGwuIEFsdGhvdWdoLCBkZXZp
Y2UgCj4gc2hvdWxkIGFsd2F5IGJlIHByb3RlY3RlZCBpbiB0aGlzIGNhc2UuCgoKV2VsbCwgd2ls
bCBtb2RpZnkgdGhpcyB3YXkuCgoKPj4gwqAgZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2FybS9pb21tdS5jIAo+PiBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pb21t
dS5jCj4+IGluZGV4IDVhM2QxZDUuLmRlYTc5ZWQgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2FybS9pb21tdS5jCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2FybS9pb21tdS5jCj4+IEBAIC0yMCw2ICsyMCw3IEBACj4+IMKgICNpbmNsdWRlIDx4ZW4vbGli
Lmg+Cj4+IMKgIMKgICNpbmNsdWRlIDxhc20vZGV2aWNlLmg+Cj4+ICsjaW5jbHVkZSA8YXNtL2lv
bW11X2Z3c3BlYy5oPgo+PiDCoCDCoCAvKgo+PiDCoMKgICogRGVmZXJyZWQgcHJvYmUgbGlzdCBp
cyB1c2VkIHRvIGtlZXAgdHJhY2sgb2YgZGV2aWNlcyBmb3Igd2hpY2ggCj4+IGRyaXZlcgo+PiBA
QCAtMTQxLDMgKzE0Miw2NSBAQCBpbnQgYXJjaF9pb21tdV9wb3B1bGF0ZV9wYWdlX3RhYmxlKHN0
cnVjdCBkb21haW4gCj4+ICpkKQo+PiDCoCB2b2lkIF9faHdkb21faW5pdCBhcmNoX2lvbW11X2h3
ZG9tX2luaXQoc3RydWN0IGRvbWFpbiAqZCkKPj4gwqAgewo+PiDCoCB9Cj4+ICsKPj4gK2ludCBf
X2luaXQgaW9tbXVfYWRkX2R0X2RldmljZShzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5wKQo+Cj4g
U29ycnkgdG8gb25seSByZWFsaXNlIGl0IG5vdy4gV291bGQgaXQgbWFrZSBzZW5zZSB0byBoYXZl
IHRoaXMgCj4gZnVuY3Rpb24gaW1wbGVtZW50ZWQgaW4geGVuL3Bhc3N0aHJvdWdoL2RldmljZV90
cmVlLmM/IAoKTm90IGVudGlyZWx5IHN1cmUuIGRldmljZV90cmVlLmMgaXMgYSBjb21tb24gY29k
ZS4gVGhlIGlvbW11X2Z3c3BlYyAKc3R1ZmYgKHdpZGVseSB1c2VkIGluIHRoaXMgZnVuY3Rpb24p
IGlzIEFSTSBjb2RlLgoKCi0tIApSZWdhcmRzLAoKT2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

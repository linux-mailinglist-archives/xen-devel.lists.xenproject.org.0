Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A1DAEBB1
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 15:37:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7gIG-0000dz-Gr; Tue, 10 Sep 2019 13:34:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=npq1=XF=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i7gIE-0000dc-Pv
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 13:34:50 +0000
X-Inumbo-ID: c2f16a66-d3cf-11e9-b76c-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2f16a66-d3cf-11e9-b76c-bc764e2007e4;
 Tue, 10 Sep 2019 13:34:50 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id j16so16480300ljg.6
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2019 06:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=yjDKD4gvByqJx6zgQOTxPswO0ncH+yhp9VVcGQfOBhY=;
 b=saPvSH2xULmke5hlWwW7p01NOFGrZRcjzjbxyG2vglx15CpUPQndz/kZhzBnVhG6VO
 U3wa9td/LJDblc8hDhwmC2fS/Tl8Q+/PdIj/25Mq3UlFXp7RVYMcrzBiPwDuPbTNl/io
 9BQkHfIujIoLKZNFrYiJl3s9xrHpPDQbkpVV7TdNGfgj8S7th8ittCoP6oJcoxd/uuL1
 nJHLyVyW8RpVZSQLrJfG5T9W/chhKWbsffoH0EmQupRU5K4eo5OhRLulLVVgqNuoj1/h
 rnHyxAYRIfZFIUX0rmIMMzV7hCGvA5Q4yYBQ+KUfRbxv330Ff279DelBbsL49L+G6CML
 cXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=yjDKD4gvByqJx6zgQOTxPswO0ncH+yhp9VVcGQfOBhY=;
 b=LK0Y8TwBDNm4h7LOqhua1BG9Ll5q4JjSkp4Ja7Ly7kc+Zd6SViJBbvrsgW47X3zLuL
 F6EvonHTVESQdP9+KptLP+AMT/KS/Jy2BIWpDE4yB6+y1AAt333+YRMsQv10pqyg2kd6
 JW0DJQ5zUnEzFRikzcjZgL7dsKg0p/1XKMEXKtI/2s/1E7uk2amD7DQTfjgYOL8ht0OG
 igO3Mno220WR4Xc9xREojDGvyyW2IVlEkQmuyJplYFeQaYozd7GKgd2BpIrk7b3hvpNj
 OI2F6YZIg5SR7t5hj3V+/AEbyOW992o8lhKi61xziIyPef9AONHA6yEk/Og1PH2y5QLA
 XoNQ==
X-Gm-Message-State: APjAAAVIsAc10l34ExKB+gp4ONeoSCK6HsxmV+GL+fYMnu4bxwvy6CDO
 FWNlFThE18kIUUDSB1ROGM4=
X-Google-Smtp-Source: APXvYqzbLd0cuv3oq7Q8m0i1v/6tzOxrJ4oc9Ro5S1J6tozYjQvh8pxxsN+AWqyRb6x0L31a8h711Q==
X-Received: by 2002:a2e:99cc:: with SMTP id l12mr3592247ljj.5.1568122488821;
 Tue, 10 Sep 2019 06:34:48 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id t3sm4101629lfd.92.2019.09.10.06.34.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Sep 2019 06:34:48 -0700 (PDT)
From: Oleksandr <olekstysh@gmail.com>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
 <1566324587-3442-8-git-send-email-olekstysh@gmail.com>
 <17ed5e35-94e5-69a7-67f1-6978c50fea09@arm.com>
 <e2e67d7a-788d-9ae7-3f5f-274ce7bb2ab1@gmail.com>
Message-ID: <7f7e08f1-d61d-d3ff-e71a-ca85de92b289@gmail.com>
Date: Tue, 10 Sep 2019 16:34:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e2e67d7a-788d-9ae7-3f5f-274ce7bb2ab1@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 7/8] iommu/arm: Introduce
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
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpLCBKdWxpZW4KCgo+Cj4+PiDCoCBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvYXJtL2lvbW11LmMgCj4+PiBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pb21tdS5j
Cj4+PiBpbmRleCA3MmEzMGUwLi40N2U0YmM2IDEwMDY0NAo+Pj4gLS0tIGEveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvYXJtL2lvbW11LmMKPj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2FybS9pb21tdS5jCj4+PiBAQCAtMjAsNiArMjAsNyBAQAo+Pj4gwqAgI2luY2x1ZGUgPHhlbi9s
aWIuaD4KPj4+IMKgIMKgICNpbmNsdWRlIDxhc20vZGV2aWNlLmg+Cj4+PiArI2luY2x1ZGUgPGFz
bS9pb21tdV9md3NwZWMuaD4KPj4+IMKgIMKgIC8qCj4+PiDCoMKgICogRGVmZXJyZWQgcHJvYmUg
bGlzdCBpcyB1c2VkIHRvIGtlZXAgdHJhY2sgb2YgZGV2aWNlcyBmb3Igd2hpY2ggCj4+PiBkcml2
ZXIKPj4+IEBAIC0xMzksMyArMTQwLDU3IEBAIGludCBhcmNoX2lvbW11X3BvcHVsYXRlX3BhZ2Vf
dGFibGUoc3RydWN0IAo+Pj4gZG9tYWluICpkKQo+Pj4gwqAgdm9pZCBfX2h3ZG9tX2luaXQgYXJj
aF9pb21tdV9od2RvbV9pbml0KHN0cnVjdCBkb21haW4gKmQpCj4+PiDCoCB7Cj4+PiDCoCB9Cj4+
PiArCj4+PiAraW50IF9faW5pdCBpb21tdV9hZGRfZHRfZGV2aWNlKHN0cnVjdCBkdF9kZXZpY2Vf
bm9kZSAqbnApCj4+PiArewo+Pj4gK8KgwqDCoCBjb25zdCBzdHJ1Y3QgaW9tbXVfb3BzICpvcHMg
PSBpb21tdV9nZXRfb3BzKCk7Cj4+PiArwqDCoMKgIHN0cnVjdCBkdF9waGFuZGxlX2FyZ3MgaW9t
bXVfc3BlYzsKPj4+ICvCoMKgwqAgc3RydWN0IGRldmljZSAqZGV2ID0gZHRfdG9fZGV2KG5wKTsK
Pj4+ICvCoMKgwqAgaW50IHJjID0gMSwgaW5kZXggPSAwOwo+Pj4gKwo+Pj4gK8KgwqDCoCBpZiAo
ICFpb21tdV9lbmFibGVkICkKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gMTsKPj4+ICsKPj4+
ICvCoMKgwqAgaWYgKCAhb3BzIHx8ICFvcHMtPmFkZF9kZXZpY2UgfHwgIW9wcy0+b2ZfeGxhdGUg
KQo+Pgo+PiBUaGUgU01NVSBkb2VzIG5vdCBpbXBsZW1lbnQgb2ZfeGxhdGUoKS4gSXQgaXMgYWN0
dWFsbHkgb25seSBtYW5kYXRvcnkgCj4+IGlmIHlvdSBhcmUgdXNpbmcgdGhlIGdlbmVyaWMgYmlu
ZGluZ3MuIFNvIEkgd291bGQgb25seSBjaGVjayAKPj4gb3BzLT5vZl94bGF0ZSBpZiAiaW9tbXVz
IiBleGlzdHMuCj4KPiBBZ3JlZS4gV2lsbCBkby4KCgpKdXN0IHRvIGNsYXJpZnkuCgpXaGF0IGFi
b3V0ICJvcHMtPmFkZF9kZXZpY2UiLCBzaGFsbCBJIGNoZWNrIGl0IGlmICJpb21tdXMiIGV4aXN0
cyBhcyB3ZWxsPwoKLS0gClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlzaGNoZW5rbwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

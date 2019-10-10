Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 751A5D2DFF
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 17:45:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIaai-0002Bt-CF; Thu, 10 Oct 2019 15:43:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QV7c=YD=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iIaag-0002Bo-O1
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 15:42:58 +0000
X-Inumbo-ID: a1b60bd8-eb74-11e9-a531-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1b60bd8-eb74-11e9-a531-bc764e2007e4;
 Thu, 10 Oct 2019 15:42:58 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id r22so4772870lfm.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2019 08:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=5k2tecizN6QY5x8p3lS6qS9TiBDtf8nXgp7pvcGI5dI=;
 b=nCWHUGfYLKe+5bRfblaYASjflMnSaXEJ3IYk2OvDfLoaPimED5BDsEAkwwR+NwygKr
 l2uvdqVYjnGssIpFX5zLxxy37N5nIs01Nf+qfeoild/a2dT5+ywdOyTOZf/1Pw5YoGCD
 rVsv8yzDWBFsWTt6ZZFf6CYZ+66N7AYrHvhRTxieMjFlQFuk7CqbM3sRfLpJFy6r30jD
 CGtvEXMIwWDHHRRq78wUazid1qA1OiTdkmkdKfXwvdVqyeml0e2ZOrSyxFygeBgtrGgZ
 td2DFu6s3BSuBdcnj/dXpxwPjvhflR+mcigf5k4i+tSqr+wAebqGjU9qf7DSFniiWpL5
 nwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=5k2tecizN6QY5x8p3lS6qS9TiBDtf8nXgp7pvcGI5dI=;
 b=PEdKQLRTey8T42RO8Yd3+8HxMEqosKZ+/vEV4UFf8cjGiJsv5X/MXrQM5/EaPRbOAB
 kyYFawy16C3c4gKIO6ffwdUT1dtjhxDxI+W3FMk+36AgyBKDf6ihs3NY4fjpbmnXYd/t
 qS073UWPU1yn+5T3gXlSSU/7Na5bhQbWMLiNcW2j99hEMmvNunhtF7OwzWt7UwxHhStt
 meJ9Klb1w79tp4LArJMlGE7jYelnvc9mOH6qDfLfgPiIXRuT6TfGTruYXUKbZWZI3Pa9
 6Ai96VHIqDfELvkR0/nCyceVv/EfLN4kPe9M3qA+90Jh+A8zPrLmRu1baqOZm7PqQYwd
 OYPw==
X-Gm-Message-State: APjAAAVnph1sU2ZYh8lBSU5U2gSfrnRV46BQtHBxzAP4zv+S7QVvvhs4
 ln+YkyEqWEBNTxFIpR6kSiM=
X-Google-Smtp-Source: APXvYqzyMxkQzeyHj0orug8CZas5vInOaHiOY0SgBXGUnJd2nEXliT8yEkkP0qpNY3DPtfR59u5Q4g==
X-Received: by 2002:ac2:4c13:: with SMTP id t19mr6468071lfq.20.1570722176819; 
 Thu, 10 Oct 2019 08:42:56 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id f28sm1403110lfp.28.2019.10.10.08.42.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Oct 2019 08:42:56 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1570548304-12020-1-git-send-email-olekstysh@gmail.com>
 <948ee2a4-8a6a-57d5-3358-e0d6217624cb@arm.com>
 <94356055-721d-91bf-ac16-462da510007f@gmail.com>
 <71e64847-2ce7-0954-4ab9-72f678d5dc93@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <038fef3d-471e-ea12-801d-b471e19671b7@gmail.com>
Date: Thu, 10 Oct 2019 18:42:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <71e64847-2ce7-0954-4ab9-72f678d5dc93@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v2] xen/arm: domain_build: Don't
 expose IOMMU specific properties to hwdom
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
Cc: Juergen Gross <jgross@suse.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, sstabellini@kernel.org,
 volodymyr_babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDEwLjEwLjE5IDE4OjMyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCgpIaQoKCj4KPj4+
PiBbMV0gCj4+Pj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hl
bi1kZXZlbC8yMDE5LTEwL21zZzAwMTA0Lmh0bWwgCj4+Pj4KPj4+PiAtLS0KPj4+PiDCoCB4ZW4v
YXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCAyOSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kwo+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspCj4+Pj4KPj4+PiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFp
bl9idWlsZC5jCj4+Pj4gaW5kZXggNmQ2ZGQ1Mi4uYTczMjFiOCAxMDA2NDQKPj4+PiAtLS0gYS94
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPj4+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWlu
X2J1aWxkLmMKPj4+PiBAQCAtNDgwLDEwICs0ODAsMjYgQEAgc3RhdGljIGludCBfX2luaXQgd3Jp
dGVfcHJvcGVydGllcyhzdHJ1Y3QgCj4+Pj4gZG9tYWluICpkLCBzdHJ1Y3Qga2VybmVsX2luZm8g
KmtpbmZvLAo+Pj4+IMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGR0X3Byb3BlcnR5ICpwcm9wLCAq
c3RhdHVzID0gTlVMTDsKPj4+PiDCoMKgwqDCoMKgIGludCByZXMgPSAwOwo+Pj4+IMKgwqDCoMKg
wqAgaW50IGhhZF9kb20wX2Jvb3RhcmdzID0gMDsKPj4+PiArwqDCoMKgIHN0cnVjdCBkdF9kZXZp
Y2Vfbm9kZSAqaW9tbXVfbm9kZTsKPj4+PiDCoCDCoMKgwqDCoMKgIGlmICgga2luZm8tPmNtZGxp
bmUgJiYga2luZm8tPmNtZGxpbmVbMF0gKQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBib290YXJn
cyA9ICZraW5mby0+Y21kbGluZVswXTsKPj4+PiDCoCArwqDCoMKgIC8qCj4+Pj4gK8KgwqDCoMKg
ICogSWYgd2Ugc2tpcCB0aGUgSU9NTVUgZGV2aWNlIHdoZW4gY3JlYXRpbmcgRFQgZm9yIGh3ZG9t
IAo+Pj4+IChldmVuIGlmCj4+Pj4gK8KgwqDCoMKgICogdGhlIElPTU1VIGRldmljZSBpcyBub3Qg
dXNlZCBieSBYZW4pLCB3ZSBzaG91bGQgYWxzbyBza2lwIAo+Pj4+IHRoZSBJT01NVQo+Pj4+ICvC
oMKgwqDCoCAqIHNwZWNpZmljIHByb3BlcnRpZXMgb2YgdGhlIG1hc3RlciBkZXZpY2UgYmVoaW5k
IGl0IGluIG9yZGVyIAo+Pj4+IHRvIGF2b2lkCj4+Pj4gK8KgwqDCoMKgICogZXhwb3NpbmcgYW4g
aGFsZiBjb21wbGV0ZSBJT01NVSBiaW5kaW5ncyB0byBod2RvbS4KPj4+PiArwqDCoMKgwqAgKiBV
c2UgImlvbW11X25vZGUiIGFzIGFuIGluZGljYXRvciBvZiB0aGUgbWFzdGVyIGRldmljZSB3aGlj
aCAKPj4+PiBwcm9wZXJ0aWVzCj4+Pj4gK8KgwqDCoMKgICogc2hvdWxkIGJlIHNraXBwZWQuCj4+
Pj4gK8KgwqDCoMKgICovCj4+Pj4gK8KgwqDCoCBpb21tdV9ub2RlID0gZHRfcGFyc2VfcGhhbmRs
ZShub2RlLCAiaW9tbXVzIiwgMCk7Cj4+Pgo+Pj4gVGhlIGNvZGUgaXMgc2xpZ2h0bHkgY29uZnVz
aW5nIHRvIHJlYWQuIEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGNhcmUgCj4+PiBvZiBpbnZhbGlk
IERUIGhlcmUsIHNvIGxldCdzIG9ubHkgY29uc2lkZXIgdmFsaWQgb25lLgo+Pgo+PiBEbyB5b3Ug
bWVhbiAidGhlIGNvbW1lbnQiIGlzIGNvbmZ1c2luZyB0byByZWFkPwo+Cj4gVGhlIGNvZGUgaXMg
Y29uZnVzaW5nIGJlY2F1c2UgImlvbW11cyIgc2hvdWxkIGFsd2F5cyBwb2ludCB0byBhIElPTU1V
IAo+IG5vZGUsIGJ1dCB0aGVuIHlvdSBjaGVjayB3aGV0aGVyIHRoaXMgaXMgYW4gSU9NTVUuIFNv
IGl0IGlzIG5vdCBjbGVhciAKPiBpZiB0aGlzIGlzIGRvbmUgZm9yIHNhbml0eSBjaGVjayAob3Ig
Zm9yIGEgZGlmZmVyZW50IHJlYXNvbikuCgpHb3QgaXQuIFdpbGwgY2xhcmlmeSBhIHJlYXNvbi4K
CgotLSAKUmVnYXJkcywKCk9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

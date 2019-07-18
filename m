Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D718D6CCB2
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 12:21:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho3Us-0002AR-IS; Thu, 18 Jul 2019 10:18:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nWwS=VP=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1ho3Uq-0002AM-Ar
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 10:18:44 +0000
X-Inumbo-ID: 6a766dee-a945-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6a766dee-a945-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 10:18:42 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id r9so26751572ljg.5
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 03:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Mk6F3uw8w3Ybq0rnwHqVamZh0E/CQZ4nrIT9lJhO3wM=;
 b=QeqkCHS42Wsf98fHyTu476hggGv8XUVSNAuTHPA4YKVOESRWvYpELAYA/nGLrTCbHs
 SYJ50jeLFWHbMEKgWiv4VnxcXciyPJdz+ZGupqLxru7QAgJPMhxMy8R0MB+Z+fQOaqbp
 jbVoU5apO+2piWutCZ0x2SksbeXIIYFDxSKtygMiiN6RBnCYORJaxdNxNuNnlG1Y8zV1
 P1ID4kZQrZZ9Zt6nUtNhhcxiFcwGovZJT7ZnMwbPG1v+RjRGf4y4/HOju/OUtqQWDHoA
 opxcHnVuNGuOiCe9kQoVd5q/Uf8XxfwNlGjMfC0yDbUjFt6horkR27tmtX0Svrj8o0MM
 h/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mk6F3uw8w3Ybq0rnwHqVamZh0E/CQZ4nrIT9lJhO3wM=;
 b=Mi3KET/77yfY9HpSfhq21KyT/R0C/hkgAYc/es2w2XWinBW9OBKHIcfdqvQye7sA6d
 MKwJt/2jZSJhzGpD7So75DNCLp/m407AvDWRStXw99/deMbGPMQKkUY3nUXObyW9G5ZY
 Iae1Ssmu09Ei5iQPTaK+7SSF2msUJVYGsMGosfI6NV8IcOswlQCE7YR79ILn8bu8sRQA
 sbY3da5QIOOwoMRf5MqrEUfNB9i1y9thd3AfOQN7HDfQSWSO90kxmUt9JlXWr1+i08yK
 6FGhuhrxzj163PdV+53P4VmtlxjUnl/FRsmmFU2hH6660haRzeWRi3CXp8WmRi+m+3Dd
 luKg==
X-Gm-Message-State: APjAAAXXv7+ZwutzFla9VONS6wcab/ucwW5rSR71WEauUZNHPcSdB7ZX
 9nQE9rKzAhP7L76nGQShSZE=
X-Google-Smtp-Source: APXvYqwD6SETCWHBamVJjz95fREkVDpPqiTsSP4jjMqrS6OdLJwl2fDdJdklVGzEz/KnX0SWtSiM1Q==
X-Received: by 2002:a2e:86c3:: with SMTP id n3mr24823166ljj.129.1563445121032; 
 Thu, 18 Jul 2019 03:18:41 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 v12sm4998656ljk.22.2019.07.18.03.18.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Jul 2019 03:18:40 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: George Dunlap <george.dunlap@eu.citrix.com>
References: <1563443655-15802-1-git-send-email-andrii.anisov@gmail.com>
Message-ID: <4c22ad51-511b-cd70-261a-3ccce366570a@gmail.com>
Date: Thu, 18 Jul 2019 13:18:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1563443655-15802-1-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] schedule: mask out XEN_RUNSTATE_UPDATE from
 state entry time
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
Cc: xen-devel@lists.xenproject.org, Andrii Anisov <andrii_anisov@epam.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gR2VvcmdlLAoKVGhlIHBhdGNoIHdhcyBhbHNvIENDJ2VkIHRvIHlvdSwgYnV0IEkgZ290
OgoKIjU1NCBlc2ExLmhjMzM3MC02OC5pcGhteC5jb20gWW91IGFyZSBiZWluZyByZWplY3RlZCBi
ZWNhdXNlIHlvdXIgc2VuZGVyYmFzZSBzY29yZSBpcyBiZWxvdyBvdXIgYWNjZXB0ZWQgcG9saWN5
LiIKCmZyb20geW91ciBzZXJ2ZXIuCgpwcy4gSSBob3BlIEknbSBub3QgYm90aGVyaW5nIHlvdSB0
b28gbXVjaC4KCk9uIDE4LjA3LjE5IDEyOjU0LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEZyb206
IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Cj4gCj4gVXNpbmcgWEVOX1JV
TlNUQVRFX1VQREFURSBtYXNrIGR1cmluZyB0aGUgcHJvY2VzcyBvZiBjb3B5aW5nIHJ1bnN0YXRl
Cj4gdmFsdWVzIHRvIGd1ZXN0IGNhdXNlcyBydW5zdGF0ZSBlbnRyeSB0aW1lIHRvIGJlIGV2ZW50
dWFsbHkgY29uc2lkZXJlZAo+IG5lZ2F0aXZlIG9uIGEgY2FsY3VsYXRpb24gb2YgdGhlIHRpbWUg
ZGVsdGEuIFNvIHRoZSBYRU5fUlVOU1RBVEVfVVBEQVRFCj4gc2hvdWxkIGJlIG1hc2tlZCBvdXQg
ZHVyaW5nIHRoZSBjYWxjdWxhdGlvbiBvZiB0aGUgdGltZSBzcGVudCBpbiB0aGUKPiBwYXJ0aWN1
bGFyIHJ1bnN0YXRlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9h
bmlzb3ZAZXBhbS5jb20+Cj4gLS0tCj4gICB4ZW4vY29tbW9uL3NjaGVkdWxlLmMgfCA0ICsrKy0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBk
aWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5j
Cj4gaW5kZXggMjVmNmFiMy4uZjRmMWE4MSAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9uL3NjaGVk
dWxlLmMKPiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPiBAQCAtMTgyLDcgKzE4Miw5IEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCB2Y3B1X3J1bnN0YXRlX2NoYW5nZSgKPiAgIAo+ICAgICAgIHRy
YWNlX3J1bnN0YXRlX2NoYW5nZSh2LCBuZXdfc3RhdGUpOwo+ICAgCj4gLSAgICBkZWx0YSA9IG5l
d19lbnRyeV90aW1lIC0gdi0+cnVuc3RhdGUuc3RhdGVfZW50cnlfdGltZTsKPiArICAgIGRlbHRh
ID0gbmV3X2VudHJ5X3RpbWUgLQo+ICsgICAgICAgICAgICAodi0+cnVuc3RhdGUuc3RhdGVfZW50
cnlfdGltZSAmIH5YRU5fUlVOU1RBVEVfVVBEQVRFKTsKPiArCj4gICAgICAgaWYgKCBkZWx0YSA+
IDAgKQo+ICAgICAgIHsKPiAgICAgICAgICAgdi0+cnVuc3RhdGUudGltZVt2LT5ydW5zdGF0ZS5z
dGF0ZV0gKz0gZGVsdGE7Cj4gCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

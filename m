Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A0A8BE9F
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 18:31:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxZel-0006SX-2o; Tue, 13 Aug 2019 16:28:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2EeJ=WJ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hxZej-0006SS-CM
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 16:28:17 +0000
X-Inumbo-ID: 5a345d7e-bde7-11e9-816d-f3ed8d9b24da
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a345d7e-bde7-11e9-816d-f3ed8d9b24da;
 Tue, 13 Aug 2019 16:28:16 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id a30so14118762lfk.12
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2019 09:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=G+7Yl2yZX2X0/2Qf8lpvou45sRZEE9fCzx91kAfNMjE=;
 b=uWeJWnb+TKjgtsvoEtCUKyccvDZq+vOlMK6cFJCJIZ6RpAOBnVvJUB5zBmC5o0wI1K
 5A5HFxmpKPlFewYc4AGfXiuqD8NAlxaL8h4XOAq5HFm9sa9XE7MaGSphVUSsEEy++vPz
 GovXktjgxT3S4q6CVmoxxMychI2HgGR4MhtJT0bhsredJbVQm0PvJqoXsJx9Z8YIBXBo
 7YBHKCZ9GGcp6RO8ghqhnG9hi2t3DbQeAmx8cU26IEbM5NFx3YICbkWWT7rckhucxuKR
 Ed1KinjmA+9j0wbOWNf+Gw9vb0Q6K0TKW3ljesoGaHkAA2zuMKw3PdA7SO1OlV11oL+I
 AH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=G+7Yl2yZX2X0/2Qf8lpvou45sRZEE9fCzx91kAfNMjE=;
 b=bySZaCna6wZhZJx+UysZPQzcdaGXULdV6hD4bZrpeONgXt8RZ+LN8aLg04+ZQKpZ3u
 gaUPEu3pQQqTqYeahzeFsgkFY1ZrtR5MZMUEuR0GkIklmCEmOIrhn3owCISkJ80AnQyJ
 ikrJ+NZBY7GEuhAm3wPq8e/IJhonIQ1FCPmZEVDiync6JU17TFJ4EApcVaWVFiolTyKV
 fyItIVApUvKL0RfIxhD91+21jCNcGGkMC3XYPzA0CRTieVoKZcEmFvs0T+7Yakl5tz88
 xLl0XHC1flZwwe7Q/m1G5coIJXPMG8vDnh5Kim6f/P4PsQqrtAX8CQqvymtybhWh6gDO
 zCHQ==
X-Gm-Message-State: APjAAAWnFHGJ0w40+FVgyzZHprWmiIJMuHsGz22YZGRrqgu/d39g/15I
 XCVrBoC7U6oQbXAWjjyZZco=
X-Google-Smtp-Source: APXvYqwc2peY6P6KBrPyz6neqJnhgAr5w+NzRWFoaeVFeZnoLZ/b3GuVAuvXkXNIpRgubUKz+r29kw==
X-Received: by 2002:ac2:5506:: with SMTP id j6mr23876086lfk.144.1565713695532; 
 Tue, 13 Aug 2019 09:28:15 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id j4sm1245409ljg.23.2019.08.13.09.28.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Aug 2019 09:28:14 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-5-git-send-email-olekstysh@gmail.com>
 <dd8d6ac0-b5d3-bc1c-1a94-73660a60cabd@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <cbe5af18-b9c3-b523-003a-8bc1b745b114@gmail.com>
Date: Tue, 13 Aug 2019 19:28:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <dd8d6ac0-b5d3-bc1c-1a94-73660a60cabd@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 4/6] iommu/arm: Add lightweight
 iommu_fwspec support
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
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDEzLjA4LjE5IDE2OjQwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgT2xla3NhbmRyLAoK
SGkgSnVsaWVuLgoKCj4KPiBPbmUgbW9yZSBjb21tZW50IDopLgo+Cj4gT24gOC8yLzE5IDU6Mzkg
UE0sIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOgo+PiAraW50IGlvbW11X2Z3c3BlY19pbml0
KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqaW9tbXVfZGV2KQo+PiArewo+PiAr
wqDCoMKgIHN0cnVjdCBpb21tdV9md3NwZWMgKmZ3c3BlYyA9IGRldl9pb21tdV9md3NwZWNfZ2V0
KGRldik7Cj4+ICsKPj4gK8KgwqDCoCBpZiAoIGZ3c3BlYyApCj4KPiBJIHdvdWxkIGFjdHVhbGx5
IGNoZWNrIHRoZSBpb21tdV9kZXYgcGFzc2VkIGluIHBhcmFtZXRlciBpcyB0aGUgc2FtZSAKPiBh
cyBzdG9yZWQuIFdlIGV4cGVjdCBhbGwgZGV2aWNlIHRvIGJlIHByb3RlY3RlZCBieSBvbmx5IG9u
ZSBJT01NVS4gU28gCj4gYmV0dGVyIHRvIGJlIHNhZmUgdGhhbiBhbGxvdyBvdmVycmlkaW5nIDsp
LgoKQWN0dWFsbHksIGl0IG1ha2VzIHNlbnNlLCB3aWxsIGFkZCBhcHByb3ByaWF0ZSBjaGVjay4K
CgotLSAKUmVnYXJkcywKCk9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

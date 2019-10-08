Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B401FCFDB9
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 17:36:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHrVF-0005OQ-OJ; Tue, 08 Oct 2019 15:34:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B2Bu=YB=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iHrVD-0005OL-VN
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 15:34:20 +0000
X-Inumbo-ID: 179f130c-e9e1-11e9-96dc-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 179f130c-e9e1-11e9-96dc-bc764e2007e4;
 Tue, 08 Oct 2019 15:34:19 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id r22so12334896lfm.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2019 08:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=bgZJF+2BaYPlXiKwIcK+F20eXe/dMMTjdIflIOtFIxc=;
 b=kd8XihTjfRnXfgAKbWIjMgdRFt8eY7x+1k09UVRWrMZHFpINNMlmzk9EnXti5+W2mp
 DrRyAksUgib3+9/Xm2WJFSyBPVt5gQba8TZWk5OsJ5KhWTibgvYdYvaOBeAnB7sX7XxR
 Ujn1/ubQ0hk9usF6yOhBEB3r0Qwm47NdeOcAoqLQAoJIVWLG286EAadSmnE/zfptjy/L
 htE21SaO1uyUwlpuIYEgXPnBLIWhILgdqGNdCev3rW2LtLBE4gzosK6js1hegvH+vJ/m
 SbSxqHN3+V6bLpbdZ4giPmpNhcJRQLDOlN3/X4F48O6YPfRC0QN/0MfU1DFe7PLuE5YC
 ds/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=bgZJF+2BaYPlXiKwIcK+F20eXe/dMMTjdIflIOtFIxc=;
 b=X/n3SN7QYQDPPazYdEirAw2t6lEdqeSnia/DPZuKwuy9DddE6YAzbLBc2GKSMz1JCL
 IGJfLbIwmDBuNYQ+rO89wf97UFdZtAcAuQsRijmc6GvZL/hsuuv5pBwphL6B4jv9mhvn
 83zDxbtFXtpqhKk4T6xM9FivY59yfKutFCb0+gekt/ff92zw8/5xUDH09Rk8nhXlUYBy
 DGWsMifh2AzPebRup5ypCXCT28vCUzl92Ih6jpyPCqp8t/xNXSzs/j9WTeJ2U0r5Z117
 Nr4uBClkVhh4k4OUGKVXBFxNYoY4jvivsZwh00DmramKy/qO9NRTNLDu0p9A76igTkWN
 K59g==
X-Gm-Message-State: APjAAAVsGOpP+fEJlq489abBS4ug70UYxf/fb3PKtOaTp/zuOnPqaCYF
 C0idf0eN3dP9VYb1pC80mKg=
X-Google-Smtp-Source: APXvYqzCcozr7RGII22DyI1Iz6YtFtdsLVPfoKJ6FuqmN/cb0FakDQWL3YWkSaSPKEHfRSFmxELcNg==
X-Received: by 2002:ac2:51ce:: with SMTP id u14mr18849784lfm.72.1570548857992; 
 Tue, 08 Oct 2019 08:34:17 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id g3sm4034283lja.61.2019.10.08.08.34.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 08:34:17 -0700 (PDT)
To: Julien Grall <Julien.Grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1548090247-20078-1-git-send-email-andrii.anisov@gmail.com>
 <1548090247-20078-3-git-send-email-andrii.anisov@gmail.com>
 <d7ee428b-6010-7f04-c412-d65f657f1518@arm.com>
 <1238d45f-1693-6afb-4eff-e8af3b9e4f7d@gmail.com>
 <e9ce8c39-fa90-461d-0958-a0b2a0cf968a@arm.com>
 <d43ca714-130b-091b-79db-c20d1a6da2b0@gmail.com>
 <435b4ce8-6c9c-a9d3-f5b5-b19bf68f1ab9@arm.com>
 <92577653-a113-9028-e267-9724079402e5@gmail.com>
 <9a29bc73-18b8-67ad-1215-3e7fccdd6e09@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <4fe5c773-bd69-a0fd-bbc3-cb45629720be@gmail.com>
Date: Tue, 8 Oct 2019 18:34:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9a29bc73-18b8-67ad-1215-3e7fccdd6e09@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen/arm: domain_build: Don't expose
 IOMMU specific properties to the guest
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, nd <nd@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii.anisov@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDA4LjEwLjE5IDAwOjAyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCgpIaSBKdWxpZW4K
Cgo+Pj4gQnV0LCB0aGlzIGlzIGNsZWFybHkgd2hhdCBoYXBwZW4gaW4gY3VycmVudCBYZW4gc2V0
dXAgaWYgdGhlIGRyaXZlciBpcwo+Pj4gbm90IGVuYWJsZWQuIFdoYXQgSSB3YW50IHRvIGF2b2lk
IGlzIGV4cG9zaW5nIGFuIGhhbGYgY29tcGxldGUKPj4+IGJpbmRpbmdzIHRvIHRoZSBndWVzdCAo
eW91IGRvbid0IGtub3cgaG93IGl0IHdpbGwgYmVoYXZlKS4KPj4+Cj4+PiBTbyB3ZSBlaXRoZXIg
cmVtb3ZlIGFsbCB0aGUgcHJvcGVydGllcyBhbmQgbm9kZSByZWxhdGVkIHRvIHRoZSBJT01NVXMK
Pj4+IG9yIG5vdGhpbmcuCj4+IEkgdGhpbmssIEkgZ290IGl0LiBPdXIgdGFyZ2V0IGlzICpub3Qq
IHRvIGFkZCBhIHdheSBmb3IgRG9tMCB0byB1c2UKPj4gSU9NTVUsIGJ1dCB0byBiZSBjb25zaXN0
ZW50IGluIHJlbW92aW5nIElPTU1VIG5vZGUvbWFzdGVyIGRldmljZQo+PiBwcm9wZXJ0aWVzLiBO
b3csIHdlIHJlbW92ZSB0aGUgSU9NTVUgbm9kZSBpZiBYZW4gaWRlbnRpZmllcyBpdCAodGhlCj4+
IElPTU1VIGRyaXZlciBpcyBwcmVzZW50IGluIFhlbiksCj4+IHNvIGxvb2tzIGxpa2Ugd2UgaGF2
ZSB0byByZW1vdmUgbWFzdGVyIGRldmljZSBwcm9wZXJ0aWVzIG9ubHkgaWYgdGhpcwo+PiBtYXN0
ZXIgZGV2aWNlIGlzIGJlaGluZCB0aGUgSU9NTVUgd2hpY2ggbm9kZSBpcyByZW1vdmVkLiBUaGlz
LCBJIGhvcGUsCj4+IHdpbGwgYXZvaWQgZXhwb3NpbmcgYW4gaGFsZiBjb21wbGV0ZSBiaW5kaW5n
cyB0byBndWVzdC4gQW0gSSByaWdodD8KPj4KPj4KPj4gWzFdCj4+IGh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wOC9tc2cwMDg1OC5odG1s
Cj4+Cj4+Cj4+IC0tLS0tLS0tLS0KPj4KPj4gSWYgeW91IGhhcHB5IHdpdGggdGhhdCBsb2dpYyBJ
IHdpbGwgY3JhZnQgYSBwcm9wZXIgcGF0Y2guCj4gVGhlIGxvZ2ljIGxvb2tzIGFscmlnaHQgdG8g
bWUuIE9uZSBjb21tZW50IGJlbG93LCBJIHdpbGwgbG9vayBhdCB0aGUKPiByZXN0IG9uY2UgdGhp
cyBpcyBmb3JtYWxseSBzZW50LgoKb2sKCgo+Cj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9h
cm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPj4gaW5kZXgg
NjcwMjFkOS4uNmQ0NWU1NSAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWls
ZC5jCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+PiBAQCAtNDgwLDEwICs0
ODAsMjYgQEAgc3RhdGljIGludCBfX2luaXQgd3JpdGVfcHJvcGVydGllcyhzdHJ1Y3QgZG9tYWlu
Cj4+ICpkLCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLAo+PiAgIMKgwqDCoMKgIGNvbnN0IHN0
cnVjdCBkdF9wcm9wZXJ0eSAqcHJvcCwgKnN0YXR1cyA9IE5VTEw7Cj4+ICAgwqDCoMKgwqAgaW50
IHJlcyA9IDA7Cj4+ICAgwqDCoMKgwqAgaW50IGhhZF9kb20wX2Jvb3RhcmdzID0gMDsKPj4gK8Kg
wqDCoCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmlvbW11X25vZGU7Cj4+Cj4+ICAgwqDCoMKgwqAg
aWYgKCBraW5mby0+Y21kbGluZSAmJiBraW5mby0+Y21kbGluZVswXSApCj4+ICAgwqDCoMKgwqDC
oMKgwqDCoCBib290YXJncyA9ICZraW5mby0+Y21kbGluZVswXTsKPj4KPj4gK8KgwqDCoCAvKgo+
PiArwqDCoMKgwqAgKiBJZiB3ZSBza2lwIHRoZSBJT01NVSBkZXZpY2Ugd2hlbiBjcmVhdGluZyBE
VCBmb3IgRG9tMCAoZXZlbiBpZgo+IEkgd291bGQgcHJlZmVyIGlmIHdlIHVzZSAiaHdkb20iIG92
ZXIgIkRvbTAiLiBUaGV5IGFyZSBib3RoIHRoZSBzYW1lIG9uCj4gQXJtLCBidXQgdGhpcyBtYXkg
Y2hhbmdlIGluIHRoZSBmdXR1cmUgKHdlIG1heSBhY3R1YWxseSBkcm9wIERvbTAgOykpLgoKQWxy
ZWFkeSBzZW50IHYyLCBwbGVhc2Ugc2VlOgoKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9h
cmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTEwL21zZzAwNjczLmh0bWwKCi0tIApSZWdhcmRz
LAoKT2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs

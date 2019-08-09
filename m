Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E18DF88212
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 20:13:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw9LH-0003K6-TS; Fri, 09 Aug 2019 18:10:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Cff=WF=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hw9LG-0003K0-U6
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 18:10:18 +0000
X-Inumbo-ID: f0f6312e-bad0-11e9-8980-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f0f6312e-bad0-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 18:10:17 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id k18so92849613ljc.11
 for <xen-devel@lists.xenproject.org>; Fri, 09 Aug 2019 11:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Ep1+7GFgR0drBKdp5G8z++tqv5KQOME7uCaTxlo95gE=;
 b=F12VO6kf/e00+nZjc7KuM/x3ZP7WC1L1IblD2BOv0UBltUaYqMfqllzSQEF6g2zUbF
 4Lu09HSvRs/J3s0Zz4RcYQ2+YJsVk9bfaV4IlBzO4GaXYkQMaIKOEF2YvOMuwpmnqc7M
 w2qmLiXGzhH9PLPh6OXyDppF4FQhJPaWYmrcy70OLM+Ax7gEpz6tY7w7wbdu4nHwPGq9
 VGvZHVgDwiBvDIATe+0h6YeMMd6XFxhk7h9MKXo7XpWI8IUc4StInckfSvPymzXfZYTr
 BQ37PgWhKyu5Qn4GLH8hqvyvC6J3qnWJg8KWE/CJmY9jGLDQiFKi34X81aSmBkOvHBGY
 txew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Ep1+7GFgR0drBKdp5G8z++tqv5KQOME7uCaTxlo95gE=;
 b=SvWtOZaSDucifIvwOCR3U1KqkYVaKmnNBBnYE+LldHpvWlStdmaJKDVcHPBksy0Plp
 Pb0C9wJq4Nvs9uIUT4K8BKZsQM4LhMY5O8566WXbFKxXwOp4CcL1V9NwFvF6U417LXCa
 b/T2NYnmz7oyOQHyNGBVb2hTN5t1pJwOK18bpC2VT4UCzrJT5CVIltuOZR3ne2zvTZvE
 93QpgM+G8OO61pyl1VvuWsMZan71rpPfvUqnEy4Tt8elwAqzV0CKAczG9tDlMK6iGzdb
 2uuF/N4zyK8dm0xqYWFx7aN6+g7OM5c4XI7wzlKIg7qmStUabKnKo4q1j0aGdPNfr/G0
 3ByA==
X-Gm-Message-State: APjAAAVjSBx1cCwAVr/SXpz3LAEcy1+Ge2I/nEFnUhgIwkDGKBbtteFT
 QH6glyAJVwvUtDB86yia02M=
X-Google-Smtp-Source: APXvYqxlBan8qiXl1v0EppqZ8PpFmOsDky2Q9TcTdUpZpMHhuVaXC0fMUXvtfAlNV8rGfuMSTZzyQQ==
X-Received: by 2002:a2e:970a:: with SMTP id r10mr11417953lji.115.1565374216468; 
 Fri, 09 Aug 2019 11:10:16 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id k8sm19424074lja.24.2019.08.09.11.10.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 11:10:15 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-2-git-send-email-olekstysh@gmail.com>
 <45cdffdb-6a07-1a8e-9dc5-1e7531af6636@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <d46d4b6a-ab38-7c96-0734-4a5019a34d9d@gmail.com>
Date: Fri, 9 Aug 2019 21:10:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <45cdffdb-6a07-1a8e-9dc5-1e7531af6636@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 1/6] iommu/arm: Add iommu_helpers.c file
 to keep common for IOMMUs stuff
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

CkhpLCBKdWxpZW4KCgo+Cj4gT24gMDIvMDgvMjAxOSAxNzozOSwgT2xla3NhbmRyIFR5c2hjaGVu
a28gd3JvdGU6Cj4+IEZyb206IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNo
ZW5rb0BlcGFtLmNvbT4KPj4KPj4gSW50cm9kdWNlIGEgc2VwYXJhdGUgZmlsZSB0byBrZWVwIHZh
cmlvdXMgaGVscGVycyB3aGljaCBjb3VsZCBiZSB1c2VkCj4+IGJ5IG1vcmUgdGhhbiBvbmUgSU9N
TVUgZHJpdmVyIGluIG9yZGVyIG5vdCB0byBkdXBsaWNhdGUgY29kZS4KPj4KPj4gVGhlIGZpcnN0
IGNvbmRpZGF0ZXMgdG8gYmUgbW92ZWQgdG8gdGhlIG5ldyBmaWxlIGFyZSBTTU1VIGRyaXZlcidz
Cj4KPiBOSVQ6IHMvY29uZGlkYXRlcy9jYW5kaWRhdGVzLwoKb2sKCgo+Cj4+ICJtYXBfcGFnZS91
bm1hcF9wYWdlIiBjYWxsYmFja3MuIFRoZXJlIGNhbGxiYWNrcyBuZWl0aGVyIGNvbnRhaW4gYW55
Cj4+IFNNTVUgc3BlY2lmaWMgaW5mbyBub3IgcGVyZm9ybSBhbnkgU01NVSBzcGVjaWZpYyBhY3Rp
b25zIGFuZCBhcmUgZ29pbmcKPj4gdG8gYmUgdGhlIHNhbWUgYWNyb3NzIGFsbCBJT01NVSBkcml2
ZXJzIHdoaWNoIEgvVyBJUCBzaGFyZXMgUDJNCj4+IHdpdGggdGhlIENQVSBsaWtlIFNNTVUgZG9l
cy4KPj4KPj4gU28sIG1vdmUgY2FsbGJhY2tzIHRvIGlvbW11X2hlbHBlcnMuYyBmb3IgdGhlIHVw
Y29taW5nIElQTU1VIGRyaXZlcgo+PiB0byBiZSBhYmxlIHRvIHJlLXVzZSB0aGVtLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29A
ZXBhbS5jb20+Cj4+IC0tLQo+PiDCoCB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vTWFrZWZp
bGXCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+PiDCoCB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9h
cm0vaW9tbXVfaGVscGVycy5jIHwgNzggCj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Cj4+IMKgIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmPCoMKgwqDCoMKgwqDCoMKg
wqAgfCA0OCArLS0tLS0tLS0tLS0tLS0tLS0KPj4gwqAgeGVuL2luY2x1ZGUvYXNtLWFybS9pb21t
dS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDcgKysrCj4+IMKgIDQgZmls
ZXMgY2hhbmdlZCwgODggaW5zZXJ0aW9ucygrKSwgNDcgZGVsZXRpb25zKC0pCj4+IMKgIGNyZWF0
ZSBtb2RlIDEwMDY0NCB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXVfaGVscGVycy5j
Cj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vTWFrZWZpbGUg
Cj4+IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL01ha2VmaWxlCj4+IGluZGV4IGIzZWZj
ZmQuLjRhYmI4N2EgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9N
YWtlZmlsZQo+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vTWFrZWZpbGUKPj4g
QEAgLTEsMiArMSwyIEBACj4+IC1vYmoteSArPSBpb21tdS5vCj4+ICtvYmoteSArPSBpb21tdS5v
IGlvbW11X2hlbHBlcnMubwo+PiDCoCBvYmotJChDT05GSUdfQVJNX1NNTVUpICs9IHNtbXUubwo+
PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lvbW11X2hlbHBlcnMu
YyAKPj4gYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXVfaGVscGVycy5jCj4+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAuLjUzZThkYWEKPj4gLS0tIC9kZXYv
bnVsbAo+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXVfaGVscGVycy5j
Cj4+IEBAIC0wLDAgKzEsNzggQEAKPj4gKy8qCj4+ICsgKiB4ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9hcm0vaW9tbXVfaGVscGVycy5jCj4+ICsgKgo+PiArICogQ29udGFpbnMgdmFyaW91cyBoZWxw
ZXJzIHRvIGJlIHVzZWQgYnkgSU9NTVUgZHJpdmVycy4KPj4gKyAqCj4+ICsgKiBDb3B5cmlnaHQg
KEMpIDIwMTkgRVBBTSBTeXN0ZW1zIEluYy4KPgo+IFlvdSBtb3N0bHkgbW92ZWQgdGhlIGNvZGUg
ZnJvbSB0aGUgU01NVSBjb2RlLCBzbyB0aGUgY29weXJpZ2h0IHRoZXJlIAo+IHNob3VsZCBiZSBy
ZXRhaW4uIEFzIHRoaXMgaXMgWGVuIG1vZGlmaWNhdGlvbiB0aGUgY29weXJpZ2h0IGhlcmUgCj4g
c2hvdWxkIGJlOgo+Cj4gwqAqIENvcHlyaWdodCAoQykgMjAxNCBMaW5hcm8gTGltaXRlZC4KCk9o
LCB5ZXMuIFNvcnJ5LCBmb3Jnb3QgYWJvdXQgaXQuIFdpbGwgYWRkLgoKCj4KPj4gKyAqCj4+ICsg
KiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQg
YW5kL29yCj4+ICsgKiBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIGFuZCBjb25kaXRpb25zIG9m
IHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMKPj4gKyAqIExpY2Vuc2UsIHZlcnNpb24gMiwgYXMgcHVi
bGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24uCj4+ICsgKgo+PiArICogVGhp
cyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2Vm
dWwsCj4+ICsgKiBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1w
bGllZCB3YXJyYW50eSBvZgo+PiArICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEg
UEFSVElDVUxBUiBQVVJQT1NFLsKgIFNlZSB0aGUgR05VCj4+ICsgKiBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCj4+ICsgKgo+PiArICogWW91IHNob3VsZCBoYXZlIHJl
Y2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljCj4+ICsgKiBMaWNlbnNlIGFs
b25nIHdpdGggdGhpcyBwcm9ncmFtOyBJZiBub3QsIHNlZSAKPj4gPGh0dHA6Ly93d3cuZ251Lm9y
Zy9saWNlbnNlcy8+Lgo+PiArICovCj4+ICsKPj4gKyNpbmNsdWRlIDx4ZW4vbGliLmg+Cj4+ICsj
aW5jbHVkZSA8eGVuL3NjaGVkLmg+Cj4+ICsjaW5jbHVkZSA8eGVuL2lvbW11Lmg+Cj4KPiBDb3Vs
ZCB5b3Ugb3JkZXIgdGhlIGhlYWRlcnMgYWJvdmUgYWxwaGFiZXRpY2FsIHBsZWFzZT8KPgo+IEFu
ZCBhbHNvIGFzIGEgZXh0cmEgTklUIGEgbmV3bGluZSBiZWZvcmUgJ3hlbicgaGVhZGVycyBhbmQg
J2FzbScgb25lIDopLgoKWWVzLCB3aWxsIGZvbGxvdyB0aGlzIHJ1bGUuCgoKPgo+PiArI2luY2x1
ZGUgPGFzbS9kZXZpY2UuaD4KPgo+IFRoZSByZXN0IG9mIHRoZSBnb29kIGxvb2tzIGdvb2QgdG8g
bWUuCj4KPiBDaGVlcnMsCj4KLS0gClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlzaGNoZW5rbwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

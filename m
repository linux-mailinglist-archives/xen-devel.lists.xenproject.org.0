Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F06E861C6
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 14:32:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvhXZ-0003nx-2P; Thu, 08 Aug 2019 12:29:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u8RY=WE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hvhXX-0003ns-Ax
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 12:29:07 +0000
X-Inumbo-ID: 1c48b74a-b9d8-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1c48b74a-b9d8-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 12:29:05 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id y17so64158542ljk.10
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2019 05:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Q6/dSRGBKhJwBqFU3lCHISab0J6nYyVNMgO+ljW57Oo=;
 b=QsyVp/7QCPyaG5gnMcJ741i/objpG8JkI4oriO9mvOCpcqvcgY2P9GFA8tkx5dStOU
 qe3lcJCSXrzEphFkIfphHtptgDRCxS9VJqR4q75QBqH6Dh6mXfd5Wh86tj6ncec99FJS
 CSDsQKNCN+H+gUeb+bKMdAWUVRhNyVCON1zzosq0r/xG/A/q5H3dAcJ6i3ZWmPRrW0qx
 ksMiLKpL4w8egRgsd+7k+7r4ntekv8qI0Ea6X8ua6TnB+/lo/uiILu8Dknc3cDpALGrX
 Thzw99CImh5isZ4OKubzScts5efrU0bTmk70HIbKzChR+gizzK7XGUvssM7fBZQofJUm
 c3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Q6/dSRGBKhJwBqFU3lCHISab0J6nYyVNMgO+ljW57Oo=;
 b=f71PovIQ3+uNr3bgEeAHzynUEMPAlVBHxenjmKdkAPAEc6TY9tt9H3zXoE8dG7GjD1
 3uf7hH5giTKZ6KmkiY1V8tPfjippwsOUFb2LjNkSw6DSbdef6n8jibWzrWAsbj6rak0J
 fv87NNn0TU+aiXovrm11zO0jvhB2MCvyRSqrY286UNR7YkKBSaSVqHhlUVHNa+y7HcEe
 e2todZPcFS07RtF9859VTu+9sb8kDKDky7fAdoRhdMkCUraUFL7gGfESp+g3fnlS5m6h
 Mz1HUSiCdR8KhSse9jRAQyBjbowcVUZwcCuAzG32wsv1OwUcJAP1OT9qjKB/1ypZIKXD
 /1CQ==
X-Gm-Message-State: APjAAAVytOxwmH4g4OVsGzUWr1QszVcNTZZrGrAnMH8kGlizY68G32ne
 0l+0TqVqZEsLlNLJIWaTdbM=
X-Google-Smtp-Source: APXvYqyrqlQHwNPzKJScMNnOnPdN9okoC5zu6ISFx4QDl4e4z00tFwLss4sWQKgIynG3ieq08uRoNw==
X-Received: by 2002:a2e:989a:: with SMTP id b26mr8164786ljj.31.1565267344514; 
 Thu, 08 Aug 2019 05:29:04 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id e23sm2719518lfn.43.2019.08.08.05.29.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 05:29:04 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-7-git-send-email-olekstysh@gmail.com>
 <OSBPR01MB453664F7A6D6AA717761BC07D8D40@OSBPR01MB4536.jpnprd01.prod.outlook.com>
 <a49eccf6-935c-c87a-1fcc-fdc12a67d58e@gmail.com>
 <42cc28a7-5ab3-e24f-16d3-7a287f7f14e8@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <7c63babd-4121-ad3a-834f-22fce7350e07@gmail.com>
Date: Thu, 8 Aug 2019 15:28:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <42cc28a7-5ab3-e24f-16d3-7a287f7f14e8@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 6/6] iommu/arm: Add Renesas IPMMU-VMSA
 support
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Lars Kurth <lars.kurth@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpLCBKdWxpZW4uCgoKPj4gSSBhbSBhZnJhaWQsIEkgZG9uJ3Qga25vdyBhIGNvcnJlY3QgYW5z
d2VyIGZvciB0aGlzIHF1ZXN0aW9uLiBJIHdvdWxkIAo+PiBsZWF2ZSB0aGlzIHRvIG1haW50YWlu
ZXJzLgo+Pgo+PiBJIGp1c3QgZm9sbG93ZWQgc2FtcGxlIGNvcHlyaWdodCBub3RpY2UgZm9yIEdQ
TCB2MiBMaWNlbnNlIGFjY29yZGluZyAKPj4gdG8gdGhlIGRvY3VtZW50Ogo+Pgo+PiBodHRwOi8v
eGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9YmxvYjtmPUNPTlRSSUJVVElORwo+
Cj4gVGhlIGZpbGUgQ09OVFJJQlVUSU5HIGlzIG9ubHkgZ2l2aW5nIGV4YW1wbGUgb2YgY29tbW9u
IGV4YW1wbGUgb2YgCj4gbGljZW5zZS4gU28gSSB0aGluayB0aGlzIGlzIGZpbmUgdG8gdXNlIFNQ
RFgsIHRoZSBtb3JlIHRoZXkgYXJlIAo+IGFscmVhZHkgdXNlZC4gVGhlIG9ubHkgcmVxdWVzdCBp
cyB0byBwdXQgZWl0aGVyIFNEUFggb3IgdGhlIGZ1bGwtYmxvd24gCj4gdGV4dCBidXQgbm90IHRo
ZSB0d28gOikuIExhcnMsIGFueSBvYmplY3Rpb24/Cj4KPiBJIGFtIHF1aXRlIGluIGZhdm9yIG9m
IFNQRFggYmVjYXVzZSBpdCBpcyBlYXNpZXIgdG8gZmluZCBvdXQgdGhlIAo+IGxpY2Vuc2UuIFdp
dGggdGhlIGZ1bGwtYmxvd24gdGV4dCwgdGhlIHRleHQgbWF5IHNsaWdodGx5IHZhcnkgYmV0d2Vl
biAKPiBsaWNlbnNlcy4gRm9yIGluc3RhbmNlLCB0aGUgb25seSBkaWZmZXJlbmNlIGJldHdlZW4g
R1BMdjIgYW5kIEdQTHYyKyAKPiBpcyAiLG9yIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZl
cnNpb24iLiBJIGxldCB5b3UgaW1hZ2luZSBob3cgaXQgCj4gY2FuIGJlIGVhc3kgdG8gbWlzcyBp
dCB3aGVuIHJldmlld2luZyA7KS4KPgo+IFdlIGhhZCBhIGRpc2N1c3Npb24gbGFzdCB5ZWFyIGFi
b3V0IHVzaW5nIFNQRFggaW4gWGVuIGNvZGUgYmFzZSBidXQgSSAKPiBuZXZlciBnb3QgdGhlIHRp
bWUgdG8gZm9ybWFsbHkgc3VnZ2VzdCBpdC4KCkkgdHJpZWQgdG8gbG9jYXRlIGZpbGVzIGluIFhl
biB3aGVyZSBTUERYIGlzIHVzZWQuIEFmdGVyIGZpbmRpbmcgb25seSAKbm9zcGVjLmggSSBnb3Qg
YW4gaW5jb3JyZWN0IG9waW5pb24gdGhpcyBpcyBub3QgcG9wdWxhciBpbiBYZW4pKQoKCkp1c3Qg
dG8gY2xhcmlmeS4gU28gdGhlIHRpdGxlIGZvciB0aGUgZHJpdmVyIHNob3VsZCBiZSB0aGUgZm9s
bG93aW5nIChpZiAKdGhlcmUgYXJlIG5vIG9iamVjdGlvbnMpOgoKLy8gU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAKLyoKIMKgKiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaXBt
bXUtdm1zYS5jCiDCoCoKIMKgKiBEcml2ZXIgZm9yIHRoZSBSZW5lc2FzIElQTU1VLVZNU0EgZm91
bmQgaW4gUi1DYXIgR2VuMyBTb0NzLgogwqAqCiDCoCogQ29weXJpZ2h0IChDKSAyMDE0LTIwMTkg
UmVuZXNhcyBFbGVjdHJvbmljcyBDb3Jwb3JhdGlvbgogwqAqCiDCoCogVGhlIElQTU1VLVZNU0Eg
aXMgVk1TQS1jb21wYXRpYmxlIEkvTyBNZW1vcnkgTWFuYWdlbWVudCBVbml0IChJT01NVSkKIMKg
KiB3aGljaCBwcm92aWRlcyBhZGRyZXNzIHRyYW5zbGF0aW9uIGFuZCBhY2Nlc3MgcHJvdGVjdGlv
biBmdW5jdGlvbmFsaXRpZXMKIMKgKiB0byBwcm9jZXNzaW5nIHVuaXRzIGFuZCBpbnRlcmNvbm5l
Y3QgbmV0d29ya3MuCiDCoCoKIMKgKiBQbGVhc2Ugbm90ZSwgY3VycmVudCBkcml2ZXIgaXMgc3Vw
cG9zZWQgdG8gd29yayBvbmx5IHdpdGggbmV3ZXN0IApSLUNhciBHZW4zCiDCoCogU29DcyByZXZp
c2lvbnMgd2hpY2ggSVBNTVUgaGFyZHdhcmUgc3VwcG9ydHMgc3RhZ2UgMiB0cmFuc2xhdGlvbiAK
dGFibGUgZm9ybWF0CiDCoCogYW5kIGlzIGFibGUgdG8gdXNlIENQVSdzIFAyTSB0YWJsZSBhcyBp
cy4KIMKgKgogwqAqIEJhc2VkIG9uIExpbnV4J3MgSVBNTVUtVk1TQSBkcml2ZXIgZnJvbSBSZW5l
c2FzIEJTUDoKIMKgKsKgwqDCoCBkcml2ZXJzL2lvbW11L2lwbW11LXZtc2EuYwogwqAqIHlvdSBj
YW4gZm91bmQgYXQ6CiDCoCrCoMKgwqAgdXJsOiAKZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L2hvcm1zL3JlbmVzYXMtYnNwLmdpdAogwqAqwqDCoMKgIGJyYW5j
aDogdjQuMTQuNzUtbHRzaS9yY2FyLTMuOS42CiDCoCrCoMKgwqAgY29tbWl0OiBlMjA2ZWI1Yjgx
YTYwZTY0YzM1ZmJjM2E5OTliMWEwZGIyYjk4MDQ0CiDCoCogYW5kIFhlbidzIFNNTVUgZHJpdmVy
OgogwqAqwqDCoMKgIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMKIMKgKgogwqAq
IENvcHlyaWdodCAoQykgMjAxNi0yMDE5IEVQQU0gU3lzdGVtcyBJbmMuCiDCoCovCgoKQW5zd2Vy
IHRvIG15c2VsZjoKCkxvb2tzIGxpa2UsIHRoZSBzYW1lIEkgaGF2ZSB0byBkbyB3aXRoIGFsbCBu
ZXdseSBhZGRlZCBmaWxlcyBpbiB0aGlzIApzZXJpZXMgKGlvbW11X2Z3c3BlYywgZXRjKS4KCgo+
Pj4+ICvCoMKgwqAgLyoKPj4+PiArwqDCoMKgwqAgKiBEZXN0cm95IFJvb3QgSVBNTVUgZG9tYWlu
IHdoaWNoIGNvbnRleHQgaXMgbWFwcGVkIHRvIHRoaXMgCj4+Pj4gWGVuIGRvbWFpbgo+Pj4+ICvC
oMKgwqDCoCAqIGlmIGV4aXRzLgo+Pj4+ICvCoMKgwqDCoCAqLwo+Pj4+ICvCoMKgwqAgaWYgKCB4
ZW5fZG9tYWluLT5yb290X2RvbWFpbiApCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlwbW11X2ZyZWVf
cm9vdF9kb21haW4oeGVuX2RvbWFpbi0+cm9vdF9kb21haW4pOwo+Pj4+ICsKPj4+PiArwqDCoMKg
IHNwaW5fdW5sb2NrKCZ4ZW5fZG9tYWluLT5sb2NrKTsKPj4+PiArCj4+Pj4gK8KgwqDCoCAvKgo+
Pj4+ICvCoMKgwqDCoCAqIFdlIGFzc3VtZSB0aGF0IGFsbCBtYXN0ZXIgZGV2aWNlcyBoYXZlIGFs
cmVhZHkgYmVlbiAKPj4+PiBkZXRhY2hlZCBmcm9tCj4+Pj4gK8KgwqDCoMKgICogdGhpcyBYZW4g
ZG9tYWluIGFuZCB0aGVyZSBtdXN0IGJlIG5vIGFzc29jaWF0ZWQgQ2FjaGUgSVBNTVUgCj4+Pj4g
ZG9tYWlucwo+Pj4+ICvCoMKgwqDCoCAqIGluIHVzZS4KPj4+PiArwqDCoMKgwqAgKi8KPj4+PiAr
wqDCoMKgIEFTU0VSVChsaXN0X2VtcHR5KCZ4ZW5fZG9tYWluLT5jYWNoZV9kb21haW5zKSk7Cj4+
PiBJIHRoaW5rIHRoaXMgc2hvdWxkIGJlIGluIHRoZSBzcGluIGxvY2sgaGVsZCBieSAmeGVuX2Rv
bWFpbi0+bG9jay4KPj4KPj4gT0suIFdpbGwgcHV0IHNwaW5fdW5sb2NrIGFmdGVyIGl0Lgo+Cj4g
VGhlIHNwaW5fbG9jayBpcyBhY3R1YWxseSBwb2ludGxlc3MgaGVyZS4gVGhpcyBpcyBkb25lIHdo
ZW4gdGhlIGRvbWFpbiAKPiBpcyBkZXN0cm95ZWQsIHNvIG5vYm9keSBzaG91bGQgdG91Y2ggaXQu
Cj4KPiBJZiB5b3UgdGhpbmsgY29uY3VycmVudCBhY2Nlc3MgY2FuIHN0aWxsIGhhcHBlbiwgdGhl
biB5b3UgYXJlIGdvaW5nIHRvIAo+IGJlIGluIGRlZXAgdHJvdWJsZSBhcyB5b3UgZnJlZSB0aGUg
eGVuX2RvbWFpbiAoYW5kIHRoZXJlZm9yZSB0aGUgCj4gc3BpbmxvY2spIGJlbG93IDopLgoKSW5k
ZWVkLCB0aGlzIGlzIHBvaW50bGVzcy4gV2UgZG9uJ3QgcmVhbGx5IGV4cGVjdCBhbnkgb3RoZXIg
b3BlcmF0aW9ucyAKd2l0aCB0aGUgZG9tYWluIHdoaWNoIGlzIGJlaW5nIGRlc3Ryb3llZC4gTm8g
YXNzaWduL2RlYXNzaWduIGRldmljZXMsIG5vIApmbHVzaCwgbm8gbWFwLCBub3RoaW5nLi4uCgoK
Pgo+Ci0tIApSZWdhcmRzLAoKT2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

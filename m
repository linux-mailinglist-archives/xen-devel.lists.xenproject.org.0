Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B02CB909F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 15:27:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBIu7-0003pu-N2; Fri, 20 Sep 2019 13:24:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z5Xb=XP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iBIu6-0003pp-4W
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 13:24:54 +0000
X-Inumbo-ID: 075e52cc-dbaa-11e9-978d-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 075e52cc-dbaa-11e9-978d-bc764e2007e4;
 Fri, 20 Sep 2019 13:24:53 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id b20so1702642ljj.5
 for <xen-devel@lists.xenproject.org>; Fri, 20 Sep 2019 06:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=huzJgTcBpftWWkBveZ3FVoq2N6Wf2oOW+H1gIzs8YWs=;
 b=c0wyG0E4/9x7Qjx7SPxLCo+OIfSkyHAUOvTI7K5pOtbWT4htFjOo91D+735hGYlY7x
 vJnbnWsS9alR2OL+AKQOBteE8k8zgPELOkOhZcMkdfjddaHL+FbT3TdzV52AQTf4Md/G
 JS0nRXKxrKO76sxA0bqpAMGe8kEuB3BMMTCISRTVA6OvZdP4jgSpGEIhPHMXI+PvVN09
 hi1sB+rujeGxMrqLT6YHEY/dbsWui5Pfc0xOeUxanPkpd42g9hBKMLQDsubDZ5hcdFyB
 /xLC9+4PhKMUf5HFs+jSnxAZmjapy2u3O6RC+AcUEGHQMmMxEC0ZHqRzvOT0mVXt/ITB
 Dtvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=huzJgTcBpftWWkBveZ3FVoq2N6Wf2oOW+H1gIzs8YWs=;
 b=mrZ/MIYO001LeFTR0FqdtINrvjG2+IdypS2H4Tv7QYaKZBbHZXDvRHHKZdSo90fXtt
 AtsZZ4vKTWEyfn0+607s8YRzFvcFAs420QaI6v2EgdDPFjF8CxyfPMZhB28i+jBufMEv
 EmsGk33nIgIS3DlOfUuyNV59rpVCmM+j3ZepPCnb9lqciLO6KafO75p/lL6XfM43cWW5
 r/EZN8LTLL7QfrXAaWLGasH7Gn0ikyY70xkYnKEZtXEuaD7WsU2La/2ZijrOX6kPrMhC
 dT35vygT7iOrGfeY1uUiJ4dqso9tCa/MTPOYMVxDlLtvnv+8IIZI40hhgTIoiqdwvDnc
 Bbjw==
X-Gm-Message-State: APjAAAVQIQLp0RoxGpCxtjLJX/yF1FkPXpqWYMA8491LhBwUzMafZzyR
 AalDSGGhT5FxnuD+UiAHFfg=
X-Google-Smtp-Source: APXvYqw9oRtEVstEX4BKOiYoUWqdTTbvxcEkMPoUhla8rX0wztobI/WN2V2gTKcxqJiCGdq/5OBrng==
X-Received: by 2002:a2e:b045:: with SMTP id d5mr9345350ljl.105.1568985891683; 
 Fri, 20 Sep 2019 06:24:51 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id j28sm487703lfh.57.2019.09.20.06.24.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Sep 2019 06:24:50 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-8-git-send-email-olekstysh@gmail.com>
 <631c94fe-d3ac-002b-0e1d-30b9b03158d1@arm.com>
 <aa7eb317-7807-71ba-8fe2-2e944516dcd6@gmail.com>
 <538a5486-2702-81f4-f925-c78542ff4118@arm.com>
 <1c1bb0b2-cb4d-24ea-75c8-573094bb8601@gmail.com>
 <5d306b6f-b657-4668-4c79-f624ca9350a5@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <b4faaef5-c99e-8ba2-49fb-2279d40edef3@gmail.com>
Date: Fri, 20 Sep 2019 16:24:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5d306b6f-b657-4668-4c79-f624ca9350a5@arm.com>
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

CgpIaSBKdWxpZW4KCgo+Cj4+Cj4+Pgo+Pj4+Pj4gKwo+Pj4+Pj4gK2ludCBfX2luaXQgaW9tbXVf
YWRkX2R0X2RldmljZShzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5wKQo+Pj4+Pgo+Pj4+PiBTb3Jy
eSB0byBvbmx5IHJlYWxpc2UgaXQgbm93LiBXb3VsZCBpdCBtYWtlIHNlbnNlIHRvIGhhdmUgdGhp
cyAKPj4+Pj4gZnVuY3Rpb24gaW1wbGVtZW50ZWQgaW4geGVuL3Bhc3N0aHJvdWdoL2RldmljZV90
cmVlLmM/IAo+Pj4+Cj4+Pj4gTm90IGVudGlyZWx5IHN1cmUuIGRldmljZV90cmVlLmMgaXMgYSBj
b21tb24gY29kZS4gVGhlIGlvbW11X2Z3c3BlYyAKPj4+PiBzdHVmZiAod2lkZWx5IHVzZWQgaW4g
dGhpcyBmdW5jdGlvbikgaXMgQVJNIGNvZGUuCj4+Pgo+Pj4gU29tZSBvZiB0aGUgZGV2aWNlX3Ry
ZWUuYyBhbHJlYWR5IGNvbnRhaW5zIEFybSBzcGVjaWZpYyBjb2RlIChzdWNoIAo+Pj4gYXMgZGV2
aWNlLmgpLgo+Pj4KPj4+IERUIGhhcyBiZWVuIG9ubHkgdXNlZCBieSBBcm0gc28gZmFyLCBzbyBp
dCBpcyBzYWRseSBmYWlybHkgdGllIHRvIAo+Pj4gdGhlIGFyY2hpdGVjdHVyZS4gQnV0IGl0IHNo
b3VsZCBiZSBlYXN5IHRvIG1ha2UgaXQgZ2VuZXJpYyBpZiBuZWVkcyAKPj4+IGJlIChzdWNoIGFz
IGZvciBSSVNDdikuCj4+Pgo+Pj4gV2hpbGUgaW9tbXVfZndzcGVjIGlzIGJlZW4gaW1wbGVtZW50
ZWQgaW4gQXJtIGhlYWRlcnMsIHRoaXMgY291bGQgCj4+PiBwb3RlbnRpYWxseSBiZSBtYWRlIGNv
bW1vbi4gU28gSSB3b3VsZCBzdGlsbCBwcmVmZXIgdGhpcyB0aGF0IAo+Pj4gZnVuY3Rpb24gaXMg
bW92ZWQgaW4gZGV2aWNlX3RyZWUuYwo+Pgo+PiBXZWxsLCB3aWxsIG1vdmUuIEFsc28gSSB3aWxs
IHJlbW92ZSBfX2luaXQgYXMgaXQgY2FuIGJlIGNhbGxlZCBhdCAKPj4gcnVudGltZS4uLgo+Pgo+
Pgo+PiBBcyBmb3IgcnVudGltZToKPj4KPj4gVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gYWxs
b3dzIHVzIHRvIGZhaWwgYXQgZWFybHkgc3RhZ2UgaWYgCj4+IHNvbWV0aGluZyBpcyB3cm9uZyB3
aXRoIHRoZSBkZXZpY2Ugd2hpY2ggaXMgYmVoaW5kIGFuIElPTU1VIChhbmQgCj4+IG5lZWRzIHRv
IGJlIHByb3RlY3RlZCkuIEFzIHdlIHNjYW4gZm9yIGFsbCBwcmVzZW50IGRldmljZXMsIGJ1dCBu
b3QgCj4+IG9ubHkgZm9yICJwYXNzdGhyb3VnaCIuCj4+IFRoZSAic3BsaXR0aW5nIiBpbnRvIGhh
bmRsZV9kZXZpY2UoKSBmb3IgaHdkb20gYW5kIAo+PiBpb21tdV9kb19kdF9kb21jdGwoKSBmb3Ig
b3RoZXIgZ3Vlc3RzIHdpbGwgcG9zdHBvbmUgYW4gZXJyb3IgCj4+IHJlY29nbml0aW9uIHRvIHRo
ZSBndWVzdCBkb21haW4gY3JlYXRpb24gdGltZS4gU28sIHdlIHdvdWxkIGhhdmUgbm9uIAo+PiBm
dW5jdGlvbiBzeXN0ZW0gYW55d2F5LiBXb3VsZG4ndCBiZSBiZXR0ZXIgdG8gZmFpbCBlYXJseSBp
bnN0ZWFkIG9mIAo+PiBjb250aW51ZSBhbmQgZmFpbCBhbnl3YXk/Cj4KPiBZZXMgeW91ciBpbXBs
ZW1lbnRhdGlvbiBhbGxvd3MgdXMgdG8gZmFpbCBhdCBlYXJseSBzdGFnZSBidXQgdGhlbiB5b3Ug
Cj4gYXJlIGFidXNpbmcgdGhlIGZ1bmN0aW9uIGhhbmRsZV9kZXZpY2UoKS4gVGhlcmUgYXJlIGFj
dHVhbGx5IG5vIAo+IHByb21pc2UgdGhpcyB3aWxsIGJlIGNhbGxlZCBmb3IgZXZlcnkgZGV2aWNl
IGdvaW5nIGZvcndhcmQuIFRoaW5rIAo+IGFib3V0IGRvbTBsZXNzIHdoZXJlIHRoZSBnb2FsIGlz
IHRvIGhhdmUgbm8gZG9tMCBhdCBhbGwuCj4KPiBZb3UgYXJlIGFsc28gdHlpbmcgdGhlIG9yZGVy
IG9mIHRoZSBkb21haW5zIGNyZWF0aW9uIGFzIGRvbTAgd291bGQgCj4gaGF2ZSB0byBiZSBhbHdh
eXMgY3JlYXRlZCBiZWZvcmUgYW55IG90aGVyIGRvbWFpbnMgYXJlIGNyZWF0ZWQuCj4KPiBTaW1p
bGFyIChhYil1c2Ugb2YgaGFuZGxlX2RldmljZSgpIGRvZXMgbm90IGV4aXN0LCBzbyBJIHdvdWxk
IHJhdGhlciAKPiBub3Qgc3RhcnQgdG8gaW50cm9kdWNlIHRoZW0gYmVjYXVzZSB0aGlzIHdpbGwg
YmVjb21lIHF1aWNrbHkgCj4gdW5tYWludGFpbmFibGUgYXMgd2UgYXJlIG1peGluZyBkb20wIGNy
ZWF0aW9uIGFuZCBYZW4gaW5pdGlhbGl6YXRpb24uCj4KPiBFdmVuIHdpdGhvdXQgdGhpcyBzZXJp
ZXMsIGFzc2lnbmluZyBhIGRldmljZSB0byB0aGUgZ3Vlc3QgbWF5IG5vdCBiZSBhIAo+IHN1Y2Nl
c3MgYmVjYXVzZSB0aGUgSU9NTVUgbWF5IG5vdCBoYXZlIGVub3VnaCBjb250ZXh0IGJhbmsgKHVz
ZWQgZm9yIAo+IGNvbmZpZ3VyaW5nIHRoZSBJT01NVSBzdGFnZS0yKSBvciB0aGVyZSBhcmUgbm90
IGVub3VnaCBtZW1vcnkuIE5vdCAKPiBiZWVuIGFibGUgdG8gYWRkIHRoZSBkZXZpY2UgdG8gdGhl
IElPTU1VIGRyaXZlciBpcyBvbmx5IGFub3RoZXIgCj4gZXhhbXBsZSB3aGVyZSBpdCBtYXkgZmFp
bC4KPgo+IEJ1dCBJIHdvdWxkIG5vdCBjb25zaWRlciB0aGlzIGFzIG5vdCBmdW5jdGlvbmFsLiBU
aGUgcmVzdCBvZiB5b3VyIAo+IHN5c3RlbSBtYXkgd29yayBwZXJmZWN0bHkgZXZlbiBpZiB0aGlz
IHBhcnRpY3VsYXIgZGV2aWNlIGlzIG5vdCAKPiB1c2FibGUuIFRoZXJlIGFyZSBubyBzZWN1cml0
eSByaXNrIGFzIHRoZSBJT01NVSBzaG91bGQgYmxvY2sgYW55IAo+IHRyYW5zYWN0aW9uIGJ5IGRl
ZmF1bHQuCj4KPiBJIGFtIGFsc28gbm90IGluIGZhdm9yIG9mIHBhcnNpbmcgYWdhaW4gdGhlIERl
dmljZS1UcmVlICh3ZSBoYXZlIAo+IGVub3VnaCBvZiB0aGVtKSwgc28gdGhpcyBpcyB0aGUgYmVz
dCBzb2x1dGlvbiBJIGNhbiBjb21lIHVwLiBGZWVsIGZyZWUgCj4gdG8gc3VnZ2VzdCBzb21ldGhp
bmcgZGlmZmVyZW50LgoKSSBhbSBoYXBweSB3aXRoIHRoZSBleHBsYW5hdGlvbiwgc291bmRzIHJl
YXNvbmFibGUuIFdpbGwgbW9kaWZ5IHBhdGNoIGFzIAp5b3Ugc3VnZ2VzdGVkLgoKCi0tIApSZWdh
cmRzLAoKT2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

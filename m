Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B813086346
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 15:38:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hviaU-0001LE-0Z; Thu, 08 Aug 2019 13:36:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u8RY=WE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hviaT-0001L6-88
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 13:36:13 +0000
X-Inumbo-ID: 7baf5dc7-b9e1-11e9-8980-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7baf5dc7-b9e1-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 13:36:11 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id v16so13004372lfg.11
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2019 06:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=rLnoKKuUcr31KoGG30Zj6hwLt08dxroTMV7Szsu6NcE=;
 b=UM4IFnJ2gJHoN4YtkXzDQklx6cXhO0DF4QuUF/t0xqYfOoaQZRC42LnvjiCh6lQT0s
 KE0uq8y2qomuaBta8aNd4OmEGSFgidBkxti/2uQ68mF4NB4m7yuZazcSbOrDjl1xVqo2
 eJ/+WbQryEa9OLxRkyII/LATBpXl5y2psLC3BcjrDASTP96rVeuTGDSr/vJnOyJZdfHG
 O1DzY1iPOedvvn1J1Dfa+i1upIjskfM3YqYVu0nZ1//z9iHZufzkUIlosDQEsTnTQ7t+
 Jm9c/KyOvAAonTfXMNp++yZHzmYBPxOLP1Qkrn7buwkp4eFw7y1ejZrV6+xn19bLoYaO
 7mqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=rLnoKKuUcr31KoGG30Zj6hwLt08dxroTMV7Szsu6NcE=;
 b=R34vZ4BomRCdFPya7DiaOyaDhEOdS4XyoxWUcgZsKMSlba7q8qDkT9KPR8zQsgdu92
 D5KHDgujzBAbI6qBCKPaL9RZPkY9g6MeQR5OkD7gtkLGiNx4kYZDjms/l95/tWan9wWT
 gXYn4mQJ3UAobDMjobv3zvmtx45y7iRA6L7pS1Cj0U3atT1pszfzNNPbpLUJGsbuRMry
 AKjN2zdQAVs2/NUxHrU/XHNJhLMbQkHkW2Lpcy7wAfdYp+j1K9YmnWtvbBgNZodHKxum
 UeTKHlbP2GGOydjJ8Tn8pIcGZ0BpfYcPg4SEJi81b/QD0RPLPqiwmEtopR1yhymY+YIp
 kMCQ==
X-Gm-Message-State: APjAAAXlHApDsfURQL6IwogtM65QjemkAkgrEGXfLSpMt+2iflXnjlOQ
 8nzUdgM3TrWaX8XFSBRt1Ro=
X-Google-Smtp-Source: APXvYqxWFwomvZ4PDURRsWVRRyhYMvoTiCugOq3xHQgF1qZnuWKwwvYQbKqa4KhAOZPn+gm9i0xnqA==
X-Received: by 2002:ac2:5442:: with SMTP id d2mr9897894lfn.70.1565271370051;
 Thu, 08 Aug 2019 06:36:10 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id o24sm18898900ljg.6.2019.08.08.06.36.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 06:36:09 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1565261603-9632-1-git-send-email-olekstysh@gmail.com>
 <20190808110107.kh2jbl2eztgzong3@Air-de-Roger>
 <e5483aef-cb1f-4fa0-eea7-59005ababa38@gmail.com>
 <2dfcda6f-c5da-7b86-429f-f11827ad1b08@arm.com>
 <a6d060d0-663e-83ac-e880-813db882b677@gmail.com>
 <13592722-6a0c-ac81-1402-3f09e662ca4d@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <bb0990c3-af35-8a32-cad5-da1d86594010@gmail.com>
Date: Thu, 8 Aug 2019 16:36:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <13592722-6a0c-ac81-1402-3f09e662ca4d@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: Let the IOMMU be accessible by
 Dom0 if forcibly disabled in Xen
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
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpCgoKPj4KPj4KPj4KPj4+Pgo+Pj4+Cj4+Pj4+IE9uIFRodSwgQXVnIDA4LCAyMDE5IGF0IDAx
OjUzOjIzUE0gKzAzMDAsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOgo+Pj4+Pj4gRnJvbTog
T2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgo+Pj4+
Pj4KPj4+Pj4+IERvbid0IHNraXAgSU9NTVUgbm9kZXMgd2hlbiBjcmVhdGluZyBEVCBmb3IgRG9t
MCBpZiBJT01NVSBoYXMgYmVlbgo+Pj4+Pj4gZm9yY2libHkgZGlzYWJsZWQgaW4gYm9vdGFyZ3Mg
KGUuZy4gImlvbW11PTAiKSBpbiBvcmRlciB0byBsZXQKPj4+Pj4+IHRoZSBJT01NVSBiZSBhY2Nl
c3NpYmxlIGJ5IERPTTAuCj4+Pgo+Pj4gSSBkb24ndCB0aGluayB5b3VyIGNvZGUgaXMgZG9pbmcg
d2hhdCB5b3UgZXhwZWN0Li4uIElmIGlvbW11PTAsIHRoZW4gCj4+PiBYZW4gd2lsbCBub3QgbG9v
a3VwIGZvciBJT01NVXMgKGlvbW11X2hhcmR3YXJlX3NldHVwKCkgd2lsbCBub3QgYmUgCj4+PiBj
YWxsZWQpLiBTbyBub25lIG9mIHRoZSBkZXZpY2Ugd2lsbCBoYXZlIERFVklDRV9JT01NVSBzZXQg
YW5kIGhlbmNlIAo+Pj4gdGhleSBhcmUgYWxyZWFkeSBnaXZlbiB0byBkb20wLgo+Pj4KPj4+IEJ1
dCBJIHRoaW5rIGl0IGlzIHdyb25nIHRvIGdpdmUgdGhlIElPTU1VcyB0byBEb20wIHdoZW4gaW9t
bXU9MC4gCj4+PiBUaGlzIGlzIG5vdCB0aGUgZ29hbCBvZiB0aGlzIG9wdGlvbi4gSWYgeW91IHdh
bnQgdG8gcGFzc3Rocm91Z2ggdGhlIAo+Pj4gSU9NTVUgdG8gRG9tMCwgdGhlbiB5b3Ugc2hvdWxk
IHVzZSB0aGUgcGFyYW1ldGVyIAo+Pj4gaW9tbXVfaHdkb21fcGFzc3Rocm91Z2guCj4+Pgo+Pj4g
SG93ZXZlciwgSSBhZ3JlZSB3aXRoIFJvZ2VyIHRoYXQgZ2l2aW5nIHRoZSBJT01NVSB0byBkb20w
IGlzIGEgCj4+PiBwcmV0dHkgYmFkIGlkZWEuIFNvIHRoaXMgc2hvdWxkIGJlIGZpeGVkLgo+Pgo+
Pgo+PiBJIGZ1bGx5IGFncmVlIHdpdGggdGhlIGFyZ3VtZW50cyBwcm92aWRlZCB0aGF0IGl0IGlz
IGEgYmFkIGlkZWEuIFNvLCAKPj4gcGxlYXNlIGNvbnNpZGVyIHRoYXQgcGF0Y2ggYXMgbm90IHJl
bGV2YW50Lgo+Pgo+Pgo+PiBCdXQsIEkgYW0gbm90IHN1cmUgSSBmb2xsb3cgdGhlIGxhc3Qgc2Vu
dGVuY2U6Cj4+Cj4+IMKgPj4+IElmIGlvbW11PTAsIHRoZW4gWGVuIHdpbGwgbm90IGxvb2t1cCBm
b3IgSU9NTVVzIAo+PiAoaW9tbXVfaGFyZHdhcmVfc2V0dXAoKSB3aWxsIG5vdCBiZSBjYWxsZWQp
LiBTbyBub25lIG9mIHRoZSBkZXZpY2UgCj4+IHdpbGwgaGF2ZSBERVZJQ0VfSU9NTVUgc2V0IGFu
ZCBoZW5jZSB0aGV5IGFyZSBhbHJlYWR5IGdpdmVuIHRvIGRvbTAuCj4+Cj4+IEkgY2FuIHNlZSB0
aGF0IGRldmljZXMgaGF2ZSBERVZJQ0VfSU9NTVUgc2V0LiBBbHRob3VnaCwgdGhlIElPTU1VIAo+
PiBkcml2ZXIgaXMgbm90IGluIHVzZSwgaXQgaXMgcHJlc2VudCBhbmQgY29tcGF0aWJsZSBtYXRj
aGVzLiBTbywgZXZlbiAKPj4gaWYgaW9tbXU9MCwgdGhlIElPTU1VIGRldmljZXMgYXJlIG5vdCBn
aXZlbiB0byBEb20wLCBiZWNhdXNlIG9mIAo+PiBza2lwcGVkLiBPciBJIG1pc3NlZCBzb21ldGhp
bmc/Cj4KPiBJIGNhbid0IHNlZSBob3cgaW9tbXVfaGFyZHdhcmVfc2V0dXAoKSBjYW4gYmUgY2Fs
bGVkIG9uIHN0YWdpbmcgd2hlbiAKPiBpb21tdT0wIGFzIHRoaXMgaXMgcHJvdGVjdGVkIGJ5IGEg
aWYgKCBpb21tdV9lbmFibGUgKS4KPgo+IENhbiB5b3UgcGxlYXNlIGdpdmUgYSBzdGFjayB0cmFj
ZSBob3cgdGhpcyBpcyBjYWxsZWQgYW5kIHRoZSB2ZXJzaW9uIAo+IHlvdSB1c2U/IFdBUk4oKSBz
aG91bGQgZG8gaXQgZm9yIHlvdS4KCgppb21tdV9oYXJkd2FyZV9zZXR1cCgpIGlzIG5vdCBjYWxs
ZWQuIEJ1dCwgZGV2aWNlcyBoYXZlIERFVklDRV9JT01NVSAKc2V0LCBldmVuIGlmICJpb21tdT0w
Ii4gSSBhbSBiYXNlZCBvbiAiN2QxNDYwYyB4ZW4vYXJtOiBvcHRlZTogZml4IApjb21waWxhdGlv
biB3aXRoIEdDQyA0LjgiICsgU3RlZmFubydzIHJlc2VydmVkLW1lbW9yeSBzZXJpZXMgKyBteSBJ
UE1NVSAKc2VyaWVzLgoKCi0tIApSZWdhcmRzLAoKT2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

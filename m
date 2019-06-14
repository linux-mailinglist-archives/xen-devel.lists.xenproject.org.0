Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E4046245
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 17:14:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbnrE-0004Sd-2v; Fri, 14 Jun 2019 15:11:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ztYt=UN=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hbnrC-0004SW-3a
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 15:11:10 +0000
X-Inumbo-ID: a25f8aca-8eb6-11e9-8980-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a25f8aca-8eb6-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 15:11:08 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id u10so1958535lfm.12
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jun 2019 08:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hywNNffWNrLQjjy0AQMQfayosK5JEAGRCptnlEj3WGk=;
 b=MX9zOtdwBCE2yUBTf7F85I+JE/mC3rQDH+vPCwN2RVqELH5G+JoXRmfQcqZ5QNGykp
 kVB2tnKB3QCAibdyr/udVeF5pYp2KucpvK7nGQRCWoG4u1g9brGJSHP/9F1EKSnCtot8
 Dnt56/WNYOUlqzwvzdmG9LGDh8kPOZWj3H5s6owosIv3VEPYu8bJ1YG4HiUQBBbACpqi
 QxjfE3BjPe3DFPbgGbDjR3C1bnVifNi2s9aa2bbqNpjEaTZOxndXVKZN8tZk5FKtn8lY
 Y3nVNKvmxrzatC2zI8E71Vxuj38cXEPfkN15ns01xBaZHTwYmQkvPrxWkHbcoSjAkgQq
 h3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hywNNffWNrLQjjy0AQMQfayosK5JEAGRCptnlEj3WGk=;
 b=eLJVRgm4DfavtSCFZ5shAl1l10NCzdY03QOvlwbXvxv6irhue1FHz1+zPScq13UI/D
 lN9nMwC4Rcm7g3jvQ+ci56JldQDUIq+BbkIRKrVexgCWSw8hCK1wv5gc1YSJkHBcUxEc
 QCi1CGGGvR/EFkZgiGDxt/RTX/5qHbGhMFWX8ymbA72i9D+KzbINHbfpa94cgiORQbMc
 8bFhtAU2L1xMMTOz6scJ0+b9XZAQpWZrRUdbOpYd6c3SUlxzlWDFRzfmaahxssGuRXus
 5SKOyomN5P6o9nwRclC8MTDwQqU8p1n8mqonA5gUry/4ZF4338L+O8f5gr350oVNptXE
 MDZQ==
X-Gm-Message-State: APjAAAVEPHMTTmBwJXvAb5Y31IDZx+ux5EKApi0IY2cLuEaRsGMt4upv
 K6USuWMT+Uyvo0c45yTyIYI=
X-Google-Smtp-Source: APXvYqyvCSaYoo9DKYmViWgevjETpYFBbJzTsaaONKZ4VGKsGgLB05EUQwqnV+JpSH4D8bUuoPYVqA==
X-Received: by 2002:ac2:4c84:: with SMTP id d4mr47369755lfl.1.1560525066516;
 Fri, 14 Jun 2019 08:11:06 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 l1sm528236lfe.60.2019.06.14.08.11.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 08:11:05 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
 <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
 <7a225ac4-f1e0-7cf8-b697-ea1f985f2dc8@arm.com>
 <5CFF6FEE0200007800236E11@prv1-mh.provo.novell.com>
 <7de133a9-6aa7-1523-3f8f-b5506efef032@gmail.com>
 <5D02448E0200007800237D77@prv1-mh.provo.novell.com>
 <9390f580-d99b-0163-48c2-7c1bd2d0133d@arm.com>
 <5D0248770200007800237DAF@prv1-mh.provo.novell.com>
 <f5b28793-5cc4-0f83-d571-af87d75e38c0@arm.com>
 <5D0252300200007800237E93@prv1-mh.provo.novell.com>
 <f90caffd-32c1-54a4-a28a-8d5f3976f8f8@arm.com>
 <90a3c768-5274-dbb8-8eb2-2eda902c3e5b@gmail.com>
 <a439c5ec-cec5-51be-bf76-eebdf50cf1bb@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <5e13f916-4ea7-05a6-3156-df6dc8bbd1d8@gmail.com>
Date: Fri, 14 Jun 2019 18:11:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <a439c5ec-cec5-51be-bf76-eebdf50cf1bb@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] xen: introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNC4wNi4xOSAxNzozOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFdoeT8gV2hhdCBhcmUg
dGhlIGJlbmVmaXRzIGZvciBhIGd1ZXN0IHRvIHVzZSB0aGUgdHdvIGludGVyZmFjZSB0b2dldGhl
cj8KCkkgZG8gbm90IHNheSB0aGUgZ3Vlc3QgaGFzIHRvIHVzZSBib3RoIGludGVyZmFjZXMgc2lt
dWx0YW5lb3VzbHkuIEl0IGlzIGxvZ2ljYWxseSBvZGQsIGRvaW5nIHNvIHdpbGwgb25seSByZWZs
ZWN0IGluIGluY3JlYXNpbmcgb2YgaHlwZXJ2aXNvciBvdmVyaGVhZC4KQnV0IHN1Y2ggYW4gaW1w
bGVtZW50YXRpb24gd2lsbCBoYXZlIGEgc2ltcGxlciBjb2RlLCB3aGljaCBleHBlY3RlZCB0byBi
ZSAoYSBiaXQpIGZhc3Rlci4KU28gdGhlIGNvZGUgc2ltcGxpY2l0eSB3b3VsZCBiZSBhIGJlbmVm
aXQgZm9yIHVzLiBMb3dlciBoeXBlcnZpc29yIG92ZXJoZWFkIGlzIGEgYmVuZWZpdCBmb3Igc2Fu
ZSBndWVzdHMsIHdoaWNoIHVzZSBvbmx5IG9uZSBpbnRlcmZhY2UuCgpCVFcsIGRyb3BwaW5nIHRo
ZSBvbGQgaW50ZXJmYWNlIGltcGxlbWVudGF0aW9uIHdpbGwgYmUgbXVjaCBlYXNpZXIgaW4gZnV0
dXJlIGlmIGl0IHdpbGwgbm90IGNsYXNoIHdpdGggdGhlIG5ldyBvbmUuCgo+IEFmdGVyIGFsbCB0
aGV5IGhhdmUgZXhhY3RseSB0aGUgc2FtZSBkYXRhLi4uCgpZZXMsIGJ1dCBub3JtYWwgZ3Vlc3Rz
IHNob3VsZCB1c2Ugb25seSBvbmUgaW50ZXJmYWNlLgoKCj4+IEJUVywgSSdtIGEgYml0IGNvbmZ1
c2VkLCBhcmUgeW91IE9LIHdpdGggbG9jayAobm90IHRyeWxvY2spIGV4aXN0aW5nIGluIGh5cGVy
Y2FsbD8KPiAKPiBUaGlzIGlzIHN0aWxsIGluIGRpc2N1c3Npb24uCgpJIHNlZS4gU28gSSdsbCB0
aGluayBhYm91dCB0aGUgY29udGludWF0aW9uIGltcGxlbWVudGF0aW9uIGluIG1lYW53aGlsZS4K
Ci0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs

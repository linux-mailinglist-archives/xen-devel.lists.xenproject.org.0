Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB10806C3
	for <lists+xen-devel@lfdr.de>; Sat,  3 Aug 2019 16:41:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htv98-0001IO-QA; Sat, 03 Aug 2019 14:36:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LPa+=V7=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1htv97-0001IJ-3U
 for xen-devel@lists.xenproject.org; Sat, 03 Aug 2019 14:36:33 +0000
X-Inumbo-ID: 15bd58ad-b5fc-11e9-8980-bc764e045a96
Received: from mail-yb1-xb43.google.com (unknown [2607:f8b0:4864:20::b43])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 15bd58ad-b5fc-11e9-8980-bc764e045a96;
 Sat, 03 Aug 2019 14:36:31 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id d9so21411079ybf.3
 for <xen-devel@lists.xenproject.org>; Sat, 03 Aug 2019 07:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=2idUo+xBnrys/wAReqHzoBBAPIdj2mekF3UXp3hP5gI=;
 b=HztT4vyvN52P6LuHUsNpRPCXFR0SqYRtSOm7pOjn31/eirZOPBKoj+AHy1DGx9gpkn
 wmLDRK6NWJ7TVDRmHB7+9W5d2s19DLJbAGkvYaLsocbSs7tf0iCwNLt5tltvxWkgT6rf
 /ZKrp0xNsTGjMnqdYPieyQe0uzFuwq8BcbEpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=2idUo+xBnrys/wAReqHzoBBAPIdj2mekF3UXp3hP5gI=;
 b=sPI8/nAaetZ/96PdDKNphibLiaAaUoaGet0Wv5ce/UbWqoyiOhA8Ox1HCm1P0M1sdm
 PNzh4iFAOSe1sXX5kwhhY0yVyXxSgH75BTZbPV8tbTenNsscsoc1Bq0V+umA+QQWBZOl
 6i7GwG89JvXQ6IfyinDvH/Uo372hcJ80qJ+hbn2fONIsFWEa6Lty/3Qc4/a2Xt4gq6gR
 PAivFXFZT16eUST7wS9Q2+TZLCze4RTLBiZvlBZ2PjSL/IgJ9FM0Sf167E+yELcbjbBr
 yL5kqWK3wJ16/0VXJlnnmYrJvDVbpWXfyjXP61iOoY3QtWZoevy15LJoEK2jbJ3XqRge
 L6Sg==
X-Gm-Message-State: APjAAAWU5qppj96O1cU7PHp5Ecfbuz2UvFVIFo9aFZszQuvMk7g0m8r3
 /JQfugKeTR3MZtxFVUbU0wtRQ3Eb
X-Google-Smtp-Source: APXvYqz8xeVMb+SvXI79ea5Kvl3is+kg7medcllYURViimAx83lJsuZTaOXpXFq3pnDcuWeiPsuP7A==
X-Received: by 2002:a25:5a41:: with SMTP id o62mr4966631ybb.435.1564842990785; 
 Sat, 03 Aug 2019 07:36:30 -0700 (PDT)
Received: from MacBook-Pro.localdomain
 ([2600:1700:7b90:52f0:a01d:69c7:44ec:418c])
 by smtp.gmail.com with ESMTPSA id l34sm17150871ywa.55.2019.08.03.07.36.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 03 Aug 2019 07:36:29 -0700 (PDT)
To: Dario Faggioli <dfaggioli@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <156413540514.22784.14073005924861814163.stgit@Palanthas>
 <65d9c6bf-3eec-59d0-a070-8142f34d9e15@cardoe.com>
 <40213dac0d5d431c4cbc39efdeab23a222ddcc90.camel@suse.com>
 <b6b94de3-9fb5-5df4-81b6-60028033f985@citrix.com>
 <c9d9ff506042ed2e8a53e4acca538c793a939869.camel@suse.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <5a1246a4-621c-77db-4c8a-5044740f1551@cardoe.com>
Date: Sat, 3 Aug 2019 09:36:28 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c9d9ff506042ed2e8a53e4acca538c793a939869.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] ci: install C++ in opensuse-leap CI
 container
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8yLzE5IDk6MzcgQU0sIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgoKPiBPbiBGcmksIDIwMTkt
MDgtMDIgYXQgMTM6MTEgKzAxMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDAyLzA4LzIw
MTkgMTM6MDAsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+Pj4gT24gTW9uLCAyMDE5LTA3LTI5IGF0
IDEyOjE4IC0wNTAwLCBEb3VnIEdvbGRzdGVpbiB3cm90ZToKPj4+PiBXaWxsIHlvdSBiZSBwdXNo
aW5nIHRoZSByZWJ1aWx0IGNvbnRhaW5lciBvciBkbyB5b3UgbmVlZCBtZSB0byBkbwo+Pj4+IHRo
YXQ/Cj4+PiBTbywgSSBndWVzcyBzb21lb25lIGVsc2UsIHdpdGggZW5vdWdoIHJpZ2h0cywgd291
bGQgaGF2ZSB0byBkbwo+Pj4gdGhhdC4KPj4+Cj4+PiBPciBhbSBJIG1pc3Npbmcgc29tZSBhdXRo
IHN0ZXAgb3IgYW9tZXRoaW5nPwo+PiBZb3UgbmVlZCB0byBkbyBhIGRvY2tlciBsb2dpbiB0byB0
aGUgcmVnaXN0cnkuCj4+Cj4+IFNlZSBodHRwczovL2dpdGxhYi5jb20vaGVscC91c2VyL3Byb2pl
Y3QvY29udGFpbmVyX3JlZ2lzdHJ5Cj4+Cj4gQWgsIHRoYXQncyB3aGF0IEkgd2FzIG1pc3Npbmch
CkknbGwgc3VibWl0IGEgcGF0Y2ggdG8gdXBkYXRlIHRoZSBkb2NzIHRvIG1ha2UgdGhpcyBjbGVh
ci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

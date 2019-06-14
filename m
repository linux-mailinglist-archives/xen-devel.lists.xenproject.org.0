Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 906C9463BD
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 18:14:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbonr-00028t-56; Fri, 14 Jun 2019 16:11:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ztYt=UN=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hbonp-00028o-Hs
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 16:11:45 +0000
X-Inumbo-ID: 19aa3ef7-8ebf-11e9-8980-bc764e045a96
Received: from mail-lf1-x133.google.com (unknown [2a00:1450:4864:20::133])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 19aa3ef7-8ebf-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 16:11:44 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id a9so2112527lff.7
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jun 2019 09:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=peZY/4QLJvI7shqXXHWx3cp9bPcZQSbPPwzzvE8q74c=;
 b=Hrlp+XQhmBfJmSq7xniczGUi8zGD16vTNSGGeayDGBnho30ON/nw6eCxeDO4p+a75u
 Kz5zvoLFBHLmODRp4CEBHBE2oAAI3iTzmPKCxeip5LDbODnptSzjc/K3L+277fb5VrLy
 3if1p0RgVn4OKvz+GiBq5TcZ+wPk6cauMQiET4/hZh82k1tWwjc/Usihz4emSJ6PqRT+
 QBiSWoWbGfotW13xZctihMOhCMwFeDpUTnjxY74KPId9+tJHHDKFayXQ4vFFNNVS5LTB
 O255L6F+2rw2QMFJerKdBLX8jygC9pCRYeY/4p8zvhD652dEjIcPwcsCSKvl/XnC1nqT
 zvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=peZY/4QLJvI7shqXXHWx3cp9bPcZQSbPPwzzvE8q74c=;
 b=Ey7WBL3J0ioSspWjZGO7/8i+yF19XkKt6OWXp9aMi2lC4gVQueN/H6d7ZMnmiyWH9I
 QztORVHrA175phW0YYboSkJZ/7QAuFidyvgr4B1shPL9+Lf8tNufHVOlH4mp8Ju4xeed
 1W+IradA5hxFKRGy+JNvZatYBA7/F9NDvl8NUzr4mz5KeJ1j2LQg4g+MOTiw7RuwOZel
 mo1Y+VGuobH5h0RnoE2zOD4ng813eFL1wk71CnTfx8wVZmXLHX1u9bu9FL8CCMGFMaPR
 r39Xkla/RFOU8H3iaVG3c2MlDhz078LNF5PGpXkrZDQi78aMsGfwXRRAE9aWNAYwz02c
 2Mxg==
X-Gm-Message-State: APjAAAWUEZnB2VRh0LAdUtXUypu/W+i03tjAl8eAAdxiCuG0G6H8GaiY
 vfl2fslu0hqZp3R7V4JiYvA=
X-Google-Smtp-Source: APXvYqxvfOuWQMySW/JvlEAyEPe6pkIRhsDPJrfpsF4ye7412H6B0nzGuAs2ZziNFilYNo6xQrKtGw==
X-Received: by 2002:a19:2247:: with SMTP id i68mr47197695lfi.174.1560528702635; 
 Fri, 14 Jun 2019 09:11:42 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 h13sm662465ljb.10.2019.06.14.09.11.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 09:11:41 -0700 (PDT)
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
 <5e13f916-4ea7-05a6-3156-df6dc8bbd1d8@gmail.com>
 <c1094660-9c41-9883-8869-f04f95976728@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <848e4c57-7cc2-2d68-bc23-1c01c0329c80@gmail.com>
Date: Fri, 14 Jun 2019 19:11:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <c1094660-9c41-9883-8869-f04f95976728@arm.com>
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

CgpPbiAxNC4wNi4xOSAxODoyNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEkgaG9wZSB5b3UgYXJl
IGF3YXJlIHRoYXQgc3BlYWtpbmcgYWJvdXQgc3BlZWQgaGVyZSBpcyBxdWl0ZSBpcnJlbGV2YW50
LiBUaGUgZGlmZmVyZW5jZSB3b3VsZCBiZSBjbGVhciBsb3N0IGluIHRoZSBub2lzZSBvZiB0aGUg
cmVzdCBvZiB0aGUgY29udGV4dCBzd2l0Y2guCgpNbW0uLi4gSSBoYXZlIHRoYXQgdW5kZXJzdGFu
ZGluZy4gWWV0IEknZCByYXRoZXIgdHJ5IHRvIG5vdCBpbmNyZWFzZSB0aGUgbm9pc2UsIGlmIG5v
dCByZWR1Y2UuCgpCVFcsIEknbGwgcmVtZW1iZXIgdGhhdCB0byB5b3Ugb24geW91ciBuZXh0IGNv
bmRpdGlvbmFsIGJyYW5jaCByZW1vdmFsIDspCgo+IEJ1dCwgaWYgeW91IGFsbG93IHNvbWV0aGlu
ZywgdGhlbiBtb3N0IGxpa2VseSBzb21lb25lIHdpbGwgdXNlIGl0LiBIb3dldmVyLCB5b3UgaGF2
ZSB0byBkaWZmZXJlbnRpYXRlIGltcGxlbWVudGF0aW9uIHZzIGRvY3VtZW50YXRpb24uCj4gCj4g
SW4gdGhpcyBjYXNlLCBJIGRvbid0IHRoaW5rIHRoZSBpbXBsZW1lbnRhdGlvbiBzaG91bGQgZGlj
dGF0ZSB3aGF0IGlzIGdvaW5nIHRvIGJlIGV4cG9zZWQuCj4KPiBJZiB5b3UgZG9jdW1lbnQgdGhh
dCBpdCBjYW4ndCBoYXBwZW4sIHRoZW4geW91IGhhdmUgcm9vbSB0byBmb3JiaWQgdGhlIG1peCBp
biB0aGUgZnV0dXJlIChhc3N1bWluZyB0aGlzIGNhbid0IGJlIGRvbmUgbm93KS4KPiAKPiBJbiBv
dGhlciB3b3JkLCB0aGUgbW9yZSBsYXggaXMgdGhlIGludGVyZmFjZSwgdGhlIG1vcmUgZGlmZmlj
dWx0IGl0IGlzIHRpZ2h0ZW4gaW4gdGhlIGZ1dHVyZS4KPiAKPiBJIGFtIG5vdCBnb2luZyB0byBw
dXNoIGZvciBhbiBpbXBsZW1lbnRhdGlvbiB0aGF0IGZvcmJpZCB0aGUgbWl4LiBCdXQgSSBhbSBz
dHJvbmdseSBnb2luZyB0byBwdXNoIGZvciBhbnkgZG9jdW1lbnRhdGlvbiBvZiB0aGUgZXhwZWN0
ZWQgaW50ZXJhY3Rpb24uIFNvIHdlIGRvbid0IG1ha2Ugb3VyIGxpZmUgbWlzZXJhYmxlIGxhdGVy
IG9uLgoKSSBkbyBub3QgZW5jb3VyYWdlIHVzaW5nIGJvdGggaW50ZXJmYWNlcyBzaW11bHRhbmVv
dXNseSwgaXQgaXMgcG9pbnRsZXNzLgpJZiB5b3UgYXJlIHNheWluZyB0aGF0IHRoaXMgbWF0dGVy
IGNvdWxkIGJlIHNvbHZlZCB3aXRoIHRoZSBhcHByb3ByaWF0ZSBkb2N1bWVudGF0aW9uLCBpdCdz
IE9LIHdpdGggbWUuCgo+PiBCVFcsIGRyb3BwaW5nIHRoZSBvbGQgaW50ZXJmYWNlIGltcGxlbWVu
dGF0aW9uIHdpbGwgYmUgbXVjaCBlYXNpZXIgaW4gZnV0dXJlIGlmIGl0IHdpbGwgbm90IGNsYXNo
IHdpdGggdGhlIG5ldyBvbmUuCj4gSSBhbSBhZnJhaWQgd2Ugd2lsbCBuZXZlciBiZSBhYmxlIHRv
IHJlbW92ZSB0aGUgb2xkIGludGVyZmFjZS4KCk1heWJlLgoKLS0gClNpbmNlcmVseSwKQW5kcmlp
IEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

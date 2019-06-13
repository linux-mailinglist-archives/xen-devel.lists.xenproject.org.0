Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5CC435F2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 14:34:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbOto-0004i9-L6; Thu, 13 Jun 2019 12:32:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=okag=UM=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hbOtm-0004i4-UC
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 12:32:11 +0000
X-Inumbo-ID: 426bde87-8dd7-11e9-8980-bc764e045a96
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 426bde87-8dd7-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 12:32:09 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id z15so12237539lfh.13
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2019 05:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/veWZEki3vTtCVYGN2qGxPDwz601YH9CQlTZN1oTt6I=;
 b=vXkrWFhyXgXPXpdIl3ORcl6jqV8TXgQxdDNJwPgoYAZ0pErB2dYxkCJVOSy5A5Hwl9
 kkoufb+TwROYSgaGWaDvbAlv4ETHq4uuvgff67dHoKbNj7cd/inR2ijdY6NpWQdidKoD
 zjxayPKzdloZ3DUx1OVwOkC+oBiq+5R4+8E+SEnjmiZYoL7mVLc+Rdf35dBzqM2ruWl+
 cdVlgj6ZL8DqGeTRHnXlnvacDQp5YVfnzmmBxKKU/NSKBqqFU3KX9yl1JOjrfs41Pmk7
 EysLMAyS6skNzE8OC0CoKcr7dBhMjSTmbTQ25Jm2WchXdlEGltKU2Q59ts86OlFgvTav
 wDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/veWZEki3vTtCVYGN2qGxPDwz601YH9CQlTZN1oTt6I=;
 b=WNy300zNCeDxx/g+SHKjTfahbf5UUVwU+vCoH25nWbu6+k/4S3nRqwy3t62cM3HvJ/
 DyGCSfcZ34SrNxRKGAezH7pVSBr92BT1n2aTg/NSU/AKX7BUazyoQZX9CCwFxWR79uXw
 8cUZsk8bLCbJXYHtDI5g7T4rOfi9A41G5iW8H9qYsfAb5I/MSCPEKi5oKL6oe1u9micc
 KwYaa+Knt5SuKmmxb2w5nAeiJEQUd48UAp78Nwr9HkWSwH/TElMyf8ZHDvywP53VVP5d
 qSntxlByTCvBYrKlQIX/8CQmbwthbnHwmmW6DXtAOG7unG+H7gArk3ui3raajUh36Eh7
 k4ZA==
X-Gm-Message-State: APjAAAU2Mc6n13U59yMQ5IB/tbgNenLV0J2Cr6SbhvvNjGVybj0oI/7s
 /fYnL10/OYNAlxuzbFaKZJI=
X-Google-Smtp-Source: APXvYqx9Yhp02BTcrf0NBuMLgKmwvMr1CEUEO6yoT0FByeHeDU0FMshG9J6NViTOJNmefxTTgiyF6Q==
X-Received: by 2002:ac2:5981:: with SMTP id w1mr24160444lfn.48.1560429127668; 
 Thu, 13 Jun 2019 05:32:07 -0700 (PDT)
Received: from [10.17.180.34] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 i195sm566149lfi.87.2019.06.13.05.32.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 05:32:06 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@arm.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
 <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
 <7a225ac4-f1e0-7cf8-b697-ea1f985f2dc8@arm.com>
 <5CFF6FEE0200007800236E11@prv1-mh.provo.novell.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <7de133a9-6aa7-1523-3f8f-b5506efef032@gmail.com>
Date: Thu, 13 Jun 2019 15:32:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5CFF6FEE0200007800236E11@prv1-mh.provo.novell.com>
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

SmFuLCBKdWxpZW4sCgpPbiAxMS4wNi4xOSAxMjoxMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBB
dCB0aGUgdmVyeSBsZWFzdCBzdWNoIGxvb3BzIHdhbnQgYSBjcHVfcmVsYXgoKSBpbiB0aGVpciBi
b2RpZXMuCj4+PiBCdXQgdGhpcyBiZWluZyBvbiBhIGh5cGVyY2FsbCBwYXRoIC0gYXJlIHRoZXJl
IHRoZW9yZXRpY2FsIGd1YXJhbnRlZXMKPj4+IHRoYXQgYSBndWVzdCBjYW4ndCBhYnVzZSB0aGlz
IHRvIGxvY2sgdXAgYSBDUFU/Cj4+IEhtbW0sIEkgc3VnZ2VzdGVkIHRoaXMgYnV0IGl0IGxvb2tz
IGxpa2UgYSBndWVzdCBtYXkgY2FsbCB0aGUgaHlwZXJjYWxsIG11bHRpcGxlCj4+IHRpbWUgZnJv
bSBkaWZmZXJlbnQgdkNQVS4gU28gdGhpcyBjb3VsZCBiZSBhIHdheSB0byBkZWxheSB3b3JrIG9u
IHRoZSBDUFUuCj4+Cj4+IEkgd2FudGVkIHRvIG1ha2UgdGhlIGNvbnRleHQgc3dpdGNoIG1vc3Rs
eSBsb2NrbGVzcyBhbmQgdGhlcmVmb3JlIGF2b2lkaW5nIHRvCj4+IGludHJvZHVjZSBhIHNwaW5s
b2NrLgo+IAo+IFdlbGwsIGNvbnN0cnVjdHMgbGlrZSB0aGUgYWJvdmUgYXJlIHRyeWluZyB0byBt
aW1pYyBhIHNwaW5sb2NrCj4gd2l0aG91dCBhY3R1YWxseSB1c2luZyBhIHNwaW5sb2NrLiBUaGVy
ZSBhcmUgZXh0cmVtZWx5IHJhcmUKPiBzaXR1YXRpb24gaW4gd2hpY2ggdGhpcyBtYXkgaW5kZWVk
IGJlIHdhcnJhbnRlZCwgYnV0IGhlcmUgaXQKPiBmYWxscyBpbiB0aGUgY29tbW9uICJtYWtlcyB0
aGluZ3Mgd29yc2Ugb3ZlcmFsbCIgYnVja2V0LCBJCj4gdGhpbmsuIFRvIG5vdCB1bmR1bHkgcGVu
YWxpemUgdGhlIGFjdHVhbCB1cGRhdGUgcGF0aHMsIEkgdGhpbmsKPiB1c2luZyBhIHIvdyBsb2Nr
IHdvdWxkIGJlIGFwcHJvcHJpYXRlIGhlcmUuCgpTbyB3aGF0IGlzIHRoZSBjb25jbHVzaW9uIGhl
cmU/IFNob3VsZCB3ZSBnbyB3aXRoIHRyeWxvY2sgYW5kIGh5cGVyY2FsbF9jcmVhdGVfY29udGlu
dWF0aW9uKCkgaW4gb3JkZXIgdG8gYXZvaWQgbG9ja2luZyBidXQgc3RpbGwgbm90IGZhaWwgdG8g
dGhlIGd1ZXN0PwoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

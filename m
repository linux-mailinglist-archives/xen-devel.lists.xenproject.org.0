Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A999179221
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 15:15:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9UlQ-0002ke-Tg; Wed, 04 Mar 2020 14:12:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=l4g8=4V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j9UlQ-0002kU-6K
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 14:12:44 +0000
X-Inumbo-ID: 36e513a0-5e22-11ea-a3eb-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 36e513a0-5e22-11ea-a3eb-12813bfff9fa;
 Wed, 04 Mar 2020 14:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583331163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b7srj8zEuTazIYxOYrJokLlRxWd2VZAqD00tlhx9owY=;
 b=gW3NIvyJksP4Aii5w40XR0hW92fAOtknF9BbulaGpR3V/godshe5+49xFr6J9hwrFK8AL6
 J1PPXua262/JNMqeEvGR/uiFU8i9PrSoCH0BBka3FB531UA0fO1e/QrhmWIzRiwvwR9jt+
 lcAAGWFORVs2zrtBL+nv98JtVxhyB6c=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-i3bBdw5AP1q3OoCxwkSBUQ-1; Wed, 04 Mar 2020 09:12:41 -0500
X-MC-Unique: i3bBdw5AP1q3OoCxwkSBUQ-1
Received: by mail-ed1-f72.google.com with SMTP id d12so1679421edq.16
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2020 06:12:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lFyl0oWSIFawg9jU+3cT2APwSI/olxPL8/tc2lKxfMo=;
 b=aLNQGR/tYFNsXPnRxHKeWFx2XeIUuqcjYVbRMSomOO26/dJ4zDzxhJoC7NNZs1UCPF
 TOgJhTjK/6KRTnEVbQeFtNE7H/76UgeCZlYLG0C7lJibAcYF5OPq0nipA7K3xaEEJ/Jy
 zEB3ukoL36m6yKp6DhNgtfIrXzAMSgzeKxuO2jGatrGRrua+D63rKWj7YNGNL7mUtqFG
 E0sEZT0Kgcoo+ECUFdU9Y1DXktPi6t6kqZ3ZV3ELx+35+SCRXFYpN11eG98HmczKxsxI
 DcrLOvkekwVKN40dz1pxv+rvNDOVEvGP5a2Xnl3vUOZBegK50lPLctBpL7A+uH5pWSru
 Ut7w==
X-Gm-Message-State: ANhLgQ1jqRu6NgwUp4O5CXa5PzQSCxQgrHRcZF9Z0FUnGjoL7LKUn5+L
 qZOGcpXp6nKbQZn2YP+60HiE/LqPSIMf2Yt7/1hUoegXuDvCXkd2elE+tWYu5NGckLREtrQRDsv
 tW4+kCwukeNmUqnfqAGzjxHGGGjk=
X-Received: by 2002:aa7:d98b:: with SMTP id u11mr3006931eds.318.1583331160113; 
 Wed, 04 Mar 2020 06:12:40 -0800 (PST)
X-Google-Smtp-Source: ADFU+vuP55SvhASNjU9nGkyGp7u2t6tkxKJ0KuqmQr1ZP4GnrNsftDADFi9LO4DFGKJ7ZEB2x7Vnvw==
X-Received: by 2002:aa7:d98b:: with SMTP id u11mr3006903eds.318.1583331159941; 
 Wed, 04 Mar 2020 06:12:39 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id h21sm1070908ejq.83.2020.03.04.06.12.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 06:12:39 -0800 (PST)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20200304005105.27454-1-philmd@redhat.com>
 <20200304005105.27454-2-philmd@redhat.com>
 <1e1a1491-15ca-29d4-8bd6-1bf14edb4ad5@redhat.com>
 <38b55649-b1cd-8891-5c13-ec4c6ef3ae5e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f1d4241c-e82e-53db-cc33-898890a0b070@redhat.com>
Date: Wed, 4 Mar 2020 15:12:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <38b55649-b1cd-8891-5c13-ec4c6ef3ae5e@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH 1/2] misc: Replace zero-length arrays with
 flexible array member (automatic)
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMy80LzIwIDI6NDQgUE0sIFBhb2xvIEJvbnppbmkgd3JvdGU6Cj4gT24gMDQvMDMvMjAgMTQ6
MTIsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOgo+Pgo+PiBody9zY3NpL3NwYXByX3Zz
Y3NpLmM6Njk6Mjk6IGVycm9yOiBmaWVsZCAnaXUnIHdpdGggdmFyaWFibGUgc2l6ZWQgdHlwZQo+
PiAndW5pb24gdmlvc3JwX2l1JyBub3QgYXQgdGhlIGVuZCBvZiBhIHN0cnVjdCBvciBjbGFzcyBp
cyBhIEdOVSBleHRlbnNpb24KPj4gWy1XZXJyb3IsLVdnbnUtdmFyaWFibGUtc2l6ZWQtdHlwZS1u
b3QtYXQtZW5kXQo+PiAgwqDCoMKgIHVuaW9uIHZpb3NycF9pdcKgwqDCoMKgwqDCoMKgwqAgaXU7
Cj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgXgo+Pgo+PiBZYXkgd2UgZm91bmQgYSBidWchIFRoYW5rcyBHdXN0YXZvIDopCj4+Cj4+IHVu
aW9uIHNycF9pdSB7Cj4+ICDCoMKgwqAgc3RydWN0IHNycF9sb2dpbl9yZXEgbG9naW5fcmVxOwo+
PiAgwqDCoMKgIHN0cnVjdCBzcnBfbG9naW5fcnNwIGxvZ2luX3JzcDsKPj4gIMKgwqDCoCBzdHJ1
Y3Qgc3JwX2xvZ2luX3JlaiBsb2dpbl9yZWo7Cj4+ICDCoMKgwqAgc3RydWN0IHNycF9pX2xvZ291
dCBpX2xvZ291dDsKPj4gIMKgwqDCoCBzdHJ1Y3Qgc3JwX3RfbG9nb3V0IHRfbG9nb3V0Owo+PiAg
wqDCoMKgIHN0cnVjdCBzcnBfdHNrX21nbXQgdHNrX21nbXQ7Cj4+ICDCoMKgwqAgc3RydWN0IHNy
cF9jbWQgY21kOwo+PiAgwqDCoMKgIHN0cnVjdCBzcnBfcnNwIHJzcDsKPj4gIMKgwqDCoCB1aW50
OF90IHJlc2VydmVkW1NSUF9NQVhfSVVfTEVOXTsKPj4gfTsKPiAKPiBJdCdzIHZhcmlhYmxlLXNp
emVkIGJ1dCBpdCdzIG9rYXkgYXMgbG9uZyBhcyB0aGUgdG90YWwgc2l6ZSBkb2Vzbid0Cj4gZXhj
ZWVkIFNSUF9NQVhfSVVfTEVOLiAgU28gaXQncyBub3QgYSBidWcsIGJ1dCBJIGFncmVlIGl0J3Mg
YSB0aW1lIGJvbWIuCj4gICBNb3ZpbmcgdGhlIGZpZWxkIGxhc3Qgc2hvdWxkIHdvcmssIGJ1dCBp
dCB3b3VsZCBzdGlsbCBiZSBxdWl0ZQo+IGRhbmdlcm91cyBjb2RlLgoKWWVhaCBJIHJlYWNoZWQg
dGhlIHNhbWUgY29uY2x1c2lvbi4KCkknbGwgc2VuZCBhIGZpeCBmb3IgdGhlIGRhbmdlcm91cyBj
b2RlLgpEbyB5b3Ugd2FudCB0byBkcm9wIHRoaXMgc2VyaWVzLCBvciBvbmx5IHRoZSBjaGFuZ2Ug
aW4gJ3N0cnVjdCBzcnBfcnNwJyAKKG9yIGluIGFsbCBody9zY3NpL3NycC5oKS4gQWN0dWFsbHkg
SSBndWVzcyBpdCBtYWtlcyBzZW5zZSBJIG1vdmUgdGhlIAonaHcvc2NzaS9zcnAuaCcgY2hhbmdl
cyB3aXRoIHRoZSBzZXJpZXMgY2xlYW5pbmcgZGFuZ2Vyb3VzIGNvZGUuCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

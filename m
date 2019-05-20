Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F43C23DC6
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 18:46:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSlOP-000523-1g; Mon, 20 May 2019 16:44:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ag2u=TU=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hSlON-00051y-Ek
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 16:44:03 +0000
X-Inumbo-ID: 7892f78f-7b1e-11e9-8980-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7892f78f-7b1e-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 16:44:02 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id e13so13077479ljl.11
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2019 09:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=67P3swRptSy6EdeC7WnmfovjaHx7saRUB1/v6EnAj8Y=;
 b=uqQNNeNDIp2mwtNP0NFBx47EsErfPjy879fg02vx1leK4kVJXXJFbruHfEb6LQiOk5
 rO2IIRcObzR70lpYmQ9msp1A8pAhJ8Q05L+sf2d4Qus+Iz1cbW1xiMhTLnjWfsMOcMTp
 nvdSzsILxEujgxIrzEIsc+4IInZ2KEPh0bkeUAnmJoAagReniYg1D59LEDPVff9XeNF4
 ZiqF9OZo9ueHnq2lr3+FxyzGf/lDZk8tu1Hv3BNMc4LXCLjlIvQCOzM5zdJUC1FLaGSN
 tdvqrRsbBpnVnTWzOcf/9pPiXuybFnzon9PDHvVHOd/Jg9WVwvj9MQRFGMMMkm1hGV+d
 pRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=67P3swRptSy6EdeC7WnmfovjaHx7saRUB1/v6EnAj8Y=;
 b=jS6Oaamxtdj0VtoNJ1cSguJsmj/e+vCVgsZoRUXW2UDFx6yF7Q9z8mlDVsztk6yA2w
 RA4PM69Jjv8WS41yu4doL5xkubcaZfMHgPH0adWuUDcyk04NKoZSXOLYc9/czn6GoKAK
 N9iAxuvScoe73Xvk3yCq6+ycljkr4EgHAWA65HBT/A1KS1rP6+Zouc1GYQNEEVZ0miHW
 goG2ogTozJXrJQCx2RZ5HJUrOlauf+e4axhKgrY0z+6IRkdsUfEVZkDuA8H3KUwRSoCH
 OmEBF/4WnL0gWIq4zse1wFB4BjSK0eJK0yDIX5sZIXYvA9frMu5IMiMAxloIZMOqRJ1E
 Vybg==
X-Gm-Message-State: APjAAAU/ZqqH9uevgBCedCAgV3qr8LJFbLjj9UQHyu7t+tRZ+2LqoQF5
 YMSidL2x/HnJ0fqh2+w/Y0E=
X-Google-Smtp-Source: APXvYqzwYw3Y5Xg1g1i7WdNybRkIhuW9MuJAXlpDUwKYNfGLItrGDPw4L+ETSJIhn/a1u5xFPA4S2A==
X-Received: by 2002:a2e:5d8e:: with SMTP id v14mr37061920lje.106.1558370640960; 
 Mon, 20 May 2019 09:44:00 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id v12sm3906719ljv.49.2019.05.20.09.43.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 09:44:00 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1556806436-26283-1-git-send-email-olekstysh@gmail.com>
 <1556806436-26283-3-git-send-email-olekstysh@gmail.com>
 <fbff2663-666b-143d-548b-d47007cccbe2@arm.com>
 <03801f3e-4f0e-eb72-8ea4-c4860939ff6c@gmail.com>
 <55742220-761a-36b1-b6ff-bb74bc96dc53@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <d223064c-5884-8ad6-9bab-41f342fdb1e3@gmail.com>
Date: Mon, 20 May 2019 19:43:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <55742220-761a-36b1-b6ff-bb74bc96dc53@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 2/2] xen/device-tree: Add ability to
 handle nodes with interrupts-extended prop
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

CkhpLCBKdWxpZW4KCgo+Pgo+Pgo+Pj4KPj4+IE9uIDAyLzA1LzIwMTkgMTU6MTMsIE9sZWtzYW5k
ciBUeXNoY2hlbmtvIHdyb3RlOgo+Pj4+IEZyb206IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVr
c2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KPj4+Pgo+Pj4+IFhlbiBleHBlY3RzIHRvIHNlZSAi
aW50ZXJydXB0cyIgcHJvcGVydHkgd2hlbiBwYXJzaW5nIGhvc3QKPj4+PiBkZXZpY2UtdHJlZS4g
QnV0LCB0aGVyZSBhcmUgY2FzZXMgd2hlbiBzb21lIGRldmljZSBub2RlcyBjb250YWluCj4+Pj4g
ImludGVycnVwdHMtZXh0ZW5kZWQiIHByb3BlcnR5IGluc3RlYWQuCj4+Pj4KPj4+PiBUaGUgZ29v
ZCBleGFtcGxlIGhlcmUgaXMgYXJjaCB0aW1lciBub2RlIGZvciBSLUNhciBHZW4zL0dlbjIgZmFt
aWx5LAo+Pj4+IHdoaWNoIGlzIG1hbmRhdG9yeSBkZXZpY2UgZm9yIFhlbiB1c2FnZSBvbiBBUk0u
IEFuZCB3aXRob3V0IGFiaWxpdHkKPj4+PiB0byBoYW5kbGUgc3VjaCBub2RlcywgWGVuIGZhaWxz
IHRvIG9wZXJhdGU6Cj4+Pgo+Pj4gUGVyIHRoZSBiaW5kaW5nIGRvY3VtZW50YXRpb24gWzFdLCB0
aGUgaW50ZXJydXB0cy1leHRlbmQgcHJvcGVydHkgCj4+PiBzaG91bGQgb25seSBiZSB1c2VkIHdo
ZW4gYSBkZXZpY2UgaGFzIG11bHRpcGxlIGludGVycnVwdCBwYXJlbnRzLiAKPj4+IFRoaXMgaXMg
bm90IHRoZSBjYXNlIG9mIHRoZSBhcmNoIHRpbWVyLCBzbyB3aHkgaXMgaXQgdXNlZCB0aGVyZT8K
Pj4+IERvbid0IGdldCBtZSB3cm9uZywgSSBhbSBmaW5lIHdpdGggdGhlIGlkZWEgb2YgYWRkaW5n
IAo+Pj4gImludGVycnVwdHMtZXh0ZW5kIi4gSG93ZXZlciwgdGhlIGNvbW1pdCBtZXNzYWdlIHNo
b3VsZCBnaXZlIHNvbWUgCj4+PiBncm91bmQgd2h5IGEgbmV3IHByb3BlcnR5IGhhcyBiZWVuIGlu
dHJvZHVjZWQvdXNlZCBvdmVyIHRoZSBjdXJyZW50IAo+Pj4gb25lLgo+Pgo+PiBIYXZlIGp1c3Qg
Z3JlcHBlZCwgbG9va3MgbGlrZSwgUi1DYXIgR2VuMi9HZW4zIGR0c2kgZmlsZXMgYXJlIG5vdCB0
aGUgCj4+IG9ubHkgc2luZ2xlIHVzZXJzIG9mICJpbnRlcnJ1cHRzLWV4dGVuZGVkIiBwcm9wZXJ0
eSBmb3IgYSBkZXZpY2Ugd2l0aCAKPj4gYSBzaW5nbGUgaW50ZXJydXB0IHBhcmVudC4uLgo+Pgo+
PiBVbmZvcnR1bmF0ZWx5LCBJIGRvbid0IGtub3cgdGhlIHJlYWwgcmVhc29uLCBjYW4gZ3Vlc3Mg
b25seSB0aGF0IGZvciAKPj4gYSBkZXZpY2UgKHdpdGggYSBzaW5nbGUgaW50ZXJydXB0IHBhcmVu
dCkgb3V0c2lkZSAiL3NvYyIgY29udGFpbmVyIAo+PiB0aGUgdXNhZ2Ugb2Ygc2luZ2xlICJpbnRl
cnJ1cHRzLWV4dGVuZGVkIiBwcm9wZXJ0eSBpcyBtb3JlIAo+PiBzaW1wbGVyL2NsZWFuZXIgdGhh
biB1c2FnZSBvZiBwYWlycyAoImludGVycnVwdC1wYXJlbnQiICsgCj4+ICJpbnRlcnJ1cHRzIiku
wqAgTG9va3MgbGlrZSwgdGhlIHBhdGNoICJBUk06IGR0czogcjhhNzc5MDogYWRkIHNvYyAKPj4g
bm9kZSIgZnJvbSB0aGlzIHNlcmllcyBbMV0gc3RhcnRlZCB1c2luZyAiaW50ZXJydXB0cy1leHRl
bmRlZCIgCj4+IHByb3BlcnR5IGZvciBBUkNIIHRpbWVyIG5vZGUuIEkgd2lsbCBtZW50aW9uIHRo
YXQgaW4gcGF0Y2ggZGVzY3JpcHRpb24uCj4KPiBJIGRvbid0IHRoaW5rIGl0IGlzIGltcG9ydGFu
dCB0byBrbm93IHdoeSBSZW5lc2FzIGlzIHVzaW5nIGl0LiBXaGF0IAo+IG1hdHRlciBpcyB0aGUg
cHJvcGVydHkgYWxsb3dzIHRvIGRlc2NyaWJlIGluIERUIGEgZGV2aWNlIHdpdGggCj4gaW50ZXJy
dXB0cyBjb21pbmcgZnJvbSBtdWx0aXBsZSBpbnRlcnJ1cHQgY29udHJvbGxlcnMuCj4KPiBJbiBv
dGhlciB3b3Jkcywgd2hhdCBJIGFzayBpcyBleHBsYWluaW5nIGluIHRoZSBjb21taXQgbWVzc2Fn
ZSB3aGF0IAo+IHRoaXMgcHJvcGVydHkgaXMgdXNlZCBmb3IgYW5kIHByb3Blcmx5IGEgcG9pbnRl
ciB0byB0aGUgYmluZGluZ3MgCj4gaGVscGluZyB0aGUgcmV2aWV3ZXIgdG8gZmluZCBvdXQgd2hh
dCB5b3Ugc3BlYWsgYWJvdXQuCgpPSy4gU291bmRzIHJlYXNvbmFibGUuIFdpbGwgYWRkIGFuIGlu
Zm9ybWF0aW9uIHJlZ2FyZGluZyB0aGUgcHJvcGVydHkgCml0c2VsZiB3aXRoIGxpbmsuIFNob3Vs
ZCBJIHJldGFpbiB0aGUgb3JpZ2luYWwgc2VudGVuY2VzIChyZWdhcmRpbmcgQVJDSCAKdGltZXIg
b24gUi1DYXIgdXNlcyBpdCwgZXRjKSBhcyB3ZWxsPwoKCj4+Cj4+Cj4+Pgo+Pj4+ICvCoMKgwqAg
ewo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBkdF9kcHJpbnRrKCIgaW50bnVtPSVkXG4iLCBpbnRudW0p
Owo+Pj4KPj4+IFlvdSBhcmUgcmUtdXNpbmcgdGhlIGV4YWN0IHNhbWUgZGVidWcgbWVzc2FnZSBh
cyBmb3IgImludGVycnVwdHMiLiAKPj4+IFNvIGl0IHdvdWxkIGJlIGRpZmZpY3VsdCBmb3IgYSBk
ZXZlbG9wZXIgdG8ga25vdyBleGFjdGx5IHdoaWNoIHBhdGggCj4+PiBpcyB1c2VkLiBDb3VsZCB3
ZSBwcmludCBtZXNzYWdlIHJlZ2FyZGluZyB3aGV0aGVyIAo+Pj4gImludGVycnVwdHMtZXh0ZW5k
ZWQiIG9yICJpbnRlcnJ1cHRzIiBpcyB1c2VkPwo+Pgo+PiBJIGNvdWxkbid0IGZpbmQgd2hlcmUg
ZWxzZSB0aGUgc2FtZSBkZWJ1ZyBtZXNzYWdlIHdhcyB1c2VkLCBjb3VsZCAKPj4geW91LCBwbGVh
c2UsIHBvaW50IG1lPyBCdXQsIEkgZG9uJ3QgbWluZCB0byBhZGQgc29tZSBpbmRpY2F0b3IuIEZv
ciAKPj4gImludGVycnVwdHMtZXh0ZW5kZWQiIHBhdGggKG5ld2x5IGFkZGVkIHByaW50cykgSSBj
YW4gYWRkIHRoZSAKPj4gY29ycmVzcG9uZGluZyBwcmVmaXguLi4KPgo+IFNvcnJ5LCBJIHRob3Vn
aHQgdGhlIG1lc3NhZ2Ugd2FzIGR1cGxpY2F0ZWQuIEhvd2V2ZXIsIEkgc3RpbGwgdGhpbmsgYSAK
PiBtZXNzYWdlIHRlbGxpbmcgd2hpY2ggcHJvcGVydHkgaXMgdXNlZCB3b3VsZCBiZSB1c2VmdWwu
CgpKdXN0IHRvIGNsYXJpZnk6IHNob3VsZCBJIGFkZCBmb3IgdGhlIG5ld2x5IGFkZGVkIG1lc3Nh
Z2VzIAooImludGVycnVwdHMtZXh0ZW5kZWQiIHBhdGgpIG9ubHk/IE9yIEkgc2hvdWxkIG1vZGlm
eSBleGlzdGluZyBtZXNzYWdlcyAKZm9yICJpbnRlcnJ1cHRzIiBwYXRoIGFsc28/CgoKLS0gClJl
Z2FyZHMsCgpPbGVrc2FuZHIgVHlzaGNoZW5rbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=

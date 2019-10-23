Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A40C3E2048
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 18:13:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNJEl-0003uH-Fk; Wed, 23 Oct 2019 16:11:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9Yc4=YQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iNJEk-0003uC-Ex
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 16:11:50 +0000
X-Inumbo-ID: d1267106-f5af-11e9-beca-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1267106-f5af-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 16:11:49 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id u4so7595551ljj.9
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2019 09:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=wc1HDg/8yHMcid8DS54KgoLODbwupmxT4Sf7AiONukE=;
 b=Jb+vUiK6z8unxpmviAqAPwv/gpZV6KZxVwUiLPvUtR5QUS+RnitQxhas1Iuq89VLuI
 09SzIYYSTciCbjDd9I1GAwcR2qOLxtIQZgxtMNzQLPsAe2yk9iKTdlCchxfgqUOmM2ll
 5RoKrZTMYxQtWGcAh83nOWPJq3edc+IQHfQrrcYLDdSJJcwfXHg7AQHePCxYf/N43/7v
 oBGCLrxQrIPlwmhoP9p/i0BBndRedQAgfHEz4H17Vsoct+ElylNskhbPUo0x7l6RpsDI
 7rABAImuOsWR49QyKqAJPz5CKbpBmvcYS5bck2F1p0bcqpZUxnJSxapYd9dRnQ6/jeA9
 jXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=wc1HDg/8yHMcid8DS54KgoLODbwupmxT4Sf7AiONukE=;
 b=T0lwN3G/nzmfMYEuB9L7PC+0Td/yTcvb0nrmvhl0+isaqobAgymdUwrZF4M6ZIhi8W
 6HsH6s7FhfJNqoB7IZt2mCkyJCHODsmI2AGsiDF8OtFp0vWrNex5NjCPpBsublJFHziZ
 KGM72LwI2vJGMlpWzzM2troO6m+YCKnSczxtMRG37W1Z1vlvjzHhMmCB1c+u4VMnun1G
 /qWbf/gJFVZ9jk2zqY0ds+d3AHSge4pLAVCzv1tT2KBJesUfgfA+JGypfxU7NvrlDfk2
 pOs/b4JtSeF6xuUV9HYntyjUAy6DclnMmR/9wWWkrt4Ldeg9ytvWqv9w0efRovmYOT87
 Qo8A==
X-Gm-Message-State: APjAAAU3xYKpBnsN76ekI+q/jAGhdyo9hk4ULDzLmnUDx/KMaVNAMT0Z
 bcQNxptzZXkWiAsSWoVfpUk=
X-Google-Smtp-Source: APXvYqzylqh4XutdWNv2PEUL1ftPz+aqYviqczNXSf4Kkuwa02NhEzmyOmZLi1zXp+JbgiAuPcTAJg==
X-Received: by 2002:a2e:9b12:: with SMTP id u18mr23534846lji.142.1571847108271; 
 Wed, 23 Oct 2019 09:11:48 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id h3sm16164156ljf.12.2019.10.23.09.11.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Oct 2019 09:11:46 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>
References: <20191010141231.25363-1-al1img@gmail.com>
 <23968.40555.917945.129929@mariner.uk.xensource.com>
 <8413c89d-3495-6407-f1a9-6eb9aff24e47@arm.com>
 <alpine.DEB.2.21.1910111017050.6326@sstabellini-ThinkPad-T480s>
 <CACvf2oWENPf27aqQdve6StQOBv_TitKF_HSxhqFTcfJtmkL6eg@mail.gmail.com>
 <950c69d8-8f0c-b3f7-11da-9accef793c37@arm.com>
 <CACvf2oVCL_FMkHS82p=hKhRq4xUPyLT_qhDd3dTicTWU-yWPGw@mail.gmail.com>
 <d37bb4f0-d8bd-665c-1d11-9f635b813881@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <ae16f2ef-ef5b-3445-42ed-d5bd73fdedbd@gmail.com>
Date: Wed, 23 Oct 2019 19:11:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d37bb4f0-d8bd-665c-1d11-9f635b813881@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v1] libxl: Add DTB compatible list to
 config file
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
Cc: Iurii Konovalenko <iurii.konovalenko@globallogic.com>,
 Stefano Stabellini <sstabellini@kernel.org>, "wl@xen.org" <wl@xen.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Oleksandr Grytsov <al1img@gmail.com>,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDE2LjEwLjE5IDE4OjA0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCgpIaSBKdWxpZW4K
CgpqdXN0IG15IDIgY2VudHMpCgoKPgo+PiBCZWxvdyBpcyBleGFtcGxlIGZyb20gbGludXgga2Vy
bmVsIHNvdXJjZXM6Cj4+Cj4+IGxpbnV4L3NvdW5kL3BwYy9hd2Fjcy5jOjc0MTrCoMKgwqAgaWYg
Cj4+IChvZl9tYWNoaW5lX2lzX2NvbXBhdGlibGUoIlBvd2VyQm9vazMsMSIpCj4+IGxpbnV4L3Nv
dW5kL3BwYy9hd2Fjcy5jOjc0MjrCoMKgwqDCoMKgwqDCoCB8fAo+PiBvZl9tYWNoaW5lX2lzX2Nv
bXBhdGlibGUoIlBvd2VyQm9vazMsMiIpKSB7Cj4+IGxpbnV4L3NvdW5kL3BwYy9hd2Fjcy5jOjc3
MDojZGVmaW5lIElTX1BNNzUwMAo+PiAob2ZfbWFjaGluZV9pc19jb21wYXRpYmxlKCJBQVBMLDc1
MDAiKSBcCj4+IGxpbnV4L3NvdW5kL3BwYy9hd2Fjcy5jOjc3MTrCoMKgwqDCoMKgwqDCoCB8fCAK
Pj4gb2ZfbWFjaGluZV9pc19jb21wYXRpYmxlKCJBQVBMLDg1MDAiKSBcCj4+IGxpbnV4L3NvdW5k
L3BwYy9hd2Fjcy5jOjc3MjrCoMKgwqDCoMKgwqDCoCB8fCAKPj4gb2ZfbWFjaGluZV9pc19jb21w
YXRpYmxlKCJBQVBMLDk1MDAiKSkKPj4gLi4uCj4+IGxpbnV4L2FyY2gvYXJtL21hY2gtb21hcDIv
cGRhdGEtcXVpcmtzLmM6NzAzOsKgwqDCoMKgwqDCoMKgIGlmCj4+IChvZl9tYWNoaW5lX2lzX2Nv
bXBhdGlibGUocXVpcmtzLT5jb21wYXRpYmxlKSkgewo+PiBsaW51eC9hcmNoL2FybS9tYWNoLW9t
YXAyL3BkYXRhLXF1aXJrcy5jOjcxNzrCoMKgwqAgaWYKPj4gKG9mX21hY2hpbmVfaXNfY29tcGF0
aWJsZSgidGksb21hcDI0MjAiKSB8fAo+PiBsaW51eC9hcmNoL2FybS9tYWNoLW9tYXAyL3BkYXRh
LXF1aXJrcy5jOjcxODoKPj4gb2ZfbWFjaGluZV9pc19jb21wYXRpYmxlKCJ0aSxvbWFwMyIpKQo+
PiBsaW51eC9hcmNoL2FybS9tYWNoLW9tYXAyL3BkYXRhLXF1aXJrcy5jOjcyMTrCoMKgwqAgaWYK
Pj4gKG9mX21hY2hpbmVfaXNfY29tcGF0aWJsZSgidGksb21hcDMiKSkKPj4gLi4uCj4+Cj4+IEFs
c28gc2VlIFsxXQo+Pgo+PiBbMV0gCj4+IGh0dHBzOi8vc291cmNlLmNvZGVhdXJvcmEub3JnL2V4
dGVybmFsL2lteC9pbXgteGVuL2NvbW1pdC8/aD1pbXhfNC4xNC45OF8yLjAuMF9nYSZpZD02ZTU4
ZDQ3ODIwMzYzOWU3MWRhM2RhNjlmZmVhZTNmYTVkYzAxOTdiCj4KPiBTbyB0aGlzIGlzIGEgZ3Jl
cCBmcm9tIExpbnV4LCBJIGhhdmUgYWxyZWFkeSBkb25lIHRoYXQuIFdoYXQgSSBhbSAKPiBsb29r
aW5nIGF0IGlzIGFuIGV4YWN0IGRlc2NyaXB0aW9uIG9mIHlvdXIgcHJvYmxlbS4gQ2FuIHlvdSB0
ZWxsIG1lIAo+IHdoYXQgeW91IGFyZSB0cnlpbmcgdG8gcGFzc3Rocm91Z2g/IENhbiB5b3UgYWxz
byBwcm92aWRlIGEgcG9pbnRlciB0byAKPiB0aGUgTGludXggY29kZSBjaGVja2luZyB0aGUgY29t
cGF0aWJsZSBmb3IgeW91ciBwcm9ibGVtPwoKSSBoYXZlIG5vIGlkZWEgd2hldGhlciBpdCBpcyBv
ayBvciBub3QgdG8gcGFzcyBtYWNoaW5lL1NvQyBjb21wYXRpYmxlIHRvIAphIGd1ZXN0IGZyb20g
dGhlIHNhZmV0eSBQb1YsIHNvIEkgYW0gbm90IGdvaW5nIHRvIGNvbW1lbnQgcmVnYXJkaW5nIHNh
ZmV0eS4KSSBqdXN0IHdvdWxkIGxpa2UgdG8gcHJvdmlkZSBkZXNjcmlwdGlvbiBvZiB0aGUgcHJv
YmxlbSB3ZSBjb3VsZCBmYWNlIAp3aGVuIG5vdCBwYXNzaW5nIG1hY2hpbmUvU29DIGNvbXBhdGli
bGUgdG8gYSBndWVzdCB3aGljaCBydW5zIHJlYWwgSC9XIAoobm90IFBWKSBkZXZpY2VzLgoKLi4u
CgpJIGhhdmUganVzdCBjaGVja2VkIHdpdGhvdXQgcGFzc2luZyByZWFsICJkdF9jb21wYXRpYmxl
IiB0byBhIGd1ZXN0IG9uIAp0aGUgTTNOIGJvYXJkLiBTbywgdGhpcyBjYW4gYmUgY29uc2lkZXJl
ZCBhcyByZWFsIGV4YW1wbGUuCkkgbm90aWNlZCB0aGF0IGF0IGxlYXN0IHR3byBIL1cgZGV2aWNl
cyAod2hpY2ggYXJlIHBhc3MgdGhyb3VnaGVkIHRvIHRoZSAKZ3Vlc3QpIHN1ZmZlcmVkIGZyb20g
dGhlIGxhY2sgb2YgY29tcGF0aWJsZTogc2RoaV9pbnRlcm5hbF9kbWFjIGFuZCAKeGhjaS1oY2Qu
IEFuZCBhcyByZXN1bHQgU0QgY2FyZCBhbmQgVVNCIGhvc3QgYXJlIG5vdCBmdW5jdGlvbmFsLgpX
aHkgdGhpcyBoYXBwZW5lZD8gVGhlcmUgaXMgU29DIElkZW50aWZpY2F0aW9uIGZyYW1ld29yayB3
aGljaCBwdXJwb3NlIAppcyB0byBkZXRlY3QgU29DJ3MgaWQvcmV2aXNpb24gZm9yIHRoZSBmdXR1
cmUgdXNlIGluIGRyaXZlcnMgdG8gcHJvcGVybHkgCmFwcGx5IHNvbWUgcXVpcmtzIChpZiBuZWVk
ZWQpLiBBbmQgd2l0aG91dCByZWFsIGNvbXBhdGlibGUgc3RyaW5nIGluIApwbGFjZSB0aGUgZnJh
bWV3b3JrIGZhaWxzCnRvIHByb2NlZWQgbGVhdmluZyB0aGUgU29DIGF0dHJpYnV0ZXMgdW5yZWdp
c3RlcmVkIFsxXS4gVGhpcyByZXN1bHRzIGluIApTREhJIEludGVybmFsIERNQUMgY29udHJvbGxl
ciBmYWlscyB0byBpZGVudGlmeSB0aGUgU29DIFsyXSwgc28gY2FuJ3QgCm9wZXJhdGUuCgpJIGRp
ZG4ndCBpbnZlc3RpZ2F0ZSB3aGF0IGlzIHdyb25nIHdpdGggdGhlIHhIQ0ksIGJ1dCBJIHRlbmQg
dG8gdGhpbmsgCnRoYXQgdGhlIHByb2JsZW0gaXMgY2xvc2UgdG8gd2hhdCB3ZSBoYXZlIHdpdGgg
dGhlIFNESEkuCgpbMV0gCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjQtcmMy
L3NvdXJjZS9kcml2ZXJzL3NvYy9yZW5lc2FzL3JlbmVzYXMtc29jLmMjTDI5MgpbMl0gCmh0dHBz
Oi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjQtcmMyL3NvdXJjZS9kcml2ZXJzL21tYy9o
b3N0L3JlbmVzYXNfc2RoaV9pbnRlcm5hbF9kbWFjLmMjTDMyOAoKCi0tIApSZWdhcmRzLAoKT2xl
a3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs

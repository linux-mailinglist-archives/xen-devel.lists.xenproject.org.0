Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DCFC3A14
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 18:11:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFKh2-0003uD-22; Tue, 01 Oct 2019 16:08:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pYZ1=X2=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iFKh0-0003u8-Tw
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 16:08:02 +0000
X-Inumbo-ID: a4667856-e465-11e9-97fb-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by localhost (Halon) with ESMTPS
 id a4667856-e465-11e9-97fb-bc764e2007e4;
 Tue, 01 Oct 2019 16:08:01 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id q64so13956400ljb.12
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2019 09:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=owDBS8aqoPIMpY8HM8pKcrTOsNWrzGIzxBx7JoQh5aU=;
 b=cWb8XEgMGsHVnE7asZ2F1ejb5X1jtpwuc1qmdEdpKME7QW64HFXRlAM19HvVDcsc9Y
 7sL8LZMjZVxUPyG9HzBHY3ge+keXD/jOy03oidYC3McZTjUMkoRsJrljDB/aFHFMYOdU
 A9zE608BhbViXlMyvVWoMN3FWrDbH6zGeA9W6QQl4GxDhuYBzIRZvtZh47msyokXmEtE
 OHXWXky22NTYAVNund8hKGPjD7i6tVsxKtcUHwW7dCZFpvlwFx7isLBhcsmRtP9b7ae7
 TIjDkWGEppwzroXJ+/en3vdKP1rQbsN0IfbyAg1msa37+fJTeTBESG9TISTwRm+BEv4z
 vVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=owDBS8aqoPIMpY8HM8pKcrTOsNWrzGIzxBx7JoQh5aU=;
 b=DjPXjcGLkiYoaY0sMz6XhOejIkAcV2pWgW/v73jCD8IwcxeL/8Mb17k0utP3PLI+6Q
 YhAkLWci8SfKVcbmEGMKtnxkW5Vvb3k+6TV13mDME4oyON+vN0liq7WbznYwHpn6MAlX
 zkcB73i1qXke9ZeoVmyEFRtIKDrwNeBcV2JtFcaNah8dEojWQiVtqvrhq6rP8XX0udF3
 2XjmdFYm+H+mRKRx4ICTZYpmSjjmxmBrrWsILBjdMvfJrONwvjM6XLC0r/ZQzQxlvoAY
 Ha6B2U7CPLuQYtADXM4bqb/QICsVTjbA7c+QZtP+FpVoGCf+zsz0GaltZ/1Jxiwbfrbk
 NVZw==
X-Gm-Message-State: APjAAAWioy2FXXumAbvQJA0ouKPazXrw9kFeelUE62l/il3zGQRvuxXI
 g04nWBAONjYPQpjfBtPGcIg=
X-Google-Smtp-Source: APXvYqxp9/3Td3p8H7E9aBX+LglvQM660eedXBNVanVvtwiP9R6rnynJ1PMHrhtbYUJ7Sfs2PMclXA==
X-Received: by 2002:a2e:b4c5:: with SMTP id r5mr16515065ljm.54.1569946080736; 
 Tue, 01 Oct 2019 09:08:00 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id w27sm4072565ljd.55.2019.10.01.09.07.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Oct 2019 09:08:00 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>,
 Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <1548090247-20078-1-git-send-email-andrii.anisov@gmail.com>
 <1548090247-20078-3-git-send-email-andrii.anisov@gmail.com>
 <d7ee428b-6010-7f04-c412-d65f657f1518@arm.com>
 <1238d45f-1693-6afb-4eff-e8af3b9e4f7d@gmail.com>
 <e9ce8c39-fa90-461d-0958-a0b2a0cf968a@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <d43ca714-130b-091b-79db-c20d1a6da2b0@gmail.com>
Date: Tue, 1 Oct 2019 19:07:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e9ce8c39-fa90-461d-0958-a0b2a0cf968a@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen/arm: domain_build: Don't expose
 IOMMU specific properties to the guest
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDAxLjEwLjE5IDE4OjM2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgT2xla3NhbmRyLAoK
SGkgSnVsaWVuCgoKCj4KPiBPbiAwMS8xMC8yMDE5IDE2OjI1LCBPbGVrc2FuZHIgd3JvdGU6Cj4+
Cj4+IE9uIDAxLjEwLjE5IDE4OjA0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBIaSwKPj4KPj4g
SGkgSnVsaWVuCj4+Cj4+Cj4+Pgo+Pj4gSSBhbSByZXZpdmluZyB0aGUgdGhyZWFkLiBJIHRoaW5r
IHdlIG5lZWQgYSBwYXRjaCBzaW1pbGFyIHRvIHRoaXMgCj4+PiBvbmUgZm9yIFhlbiA0LjEzLiBU
aGlzIGlzIGJlY2F1c2UgZ2VuZXJpYyBhcmUgbm93IHVzZWQgYnkgWGVuIHNvIAo+Pj4gdGhleSBz
aG91bGQgYmUgaGlkZGVuIGZyb20gdGhlIGhhcmR3YXJlIGRvbWFpbi4KPj4+Cj4+PiBBbmRyaWks
IE9sZWtzYW5kciwgY2FuIG9uZSBvZiB5b3UgbG9vayBhdCBpdD8KPj4KPj4gSSB3aWxsIGJlIGFi
bGUgdG8gbG9vayBhdCBpdCBwcm9iYWJseSBhdCB0aGUgZW5kIG9mIHRoZSB3ZWVrIGlmIHRoZXJl
IAo+PiBpcyBubyB1cmdlbmN5Lgo+Cj4gVGhhdCdzIGZpbmUsIEkgdGhpbmsgd2UgY2FuIG1ha2Ug
YSBjYXNlIHRvIGFkZCBpdCBpbiBYZW4gNC4xMy4KPgo+Pgo+Pgo+Pj4KPj4+IENoZWVycywKPj4+
Cj4+PiBPbiAyMS8wMS8yMDE5IDE3OjA0LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+Pj4+IEZyb206
IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KPj4+
Pgo+Pj4+IFdlIGRvbid0IHBhc3N0aHJvdWdoIElPTU1VIGRldmljZSB0byBET00wIGV2ZW4gaWYg
aXQgaXMgbm90IHVzZWQgYnkKPj4+PiBYZW4uIFRoZXJlZm9yZSBleHBvc2luZyB0aGUgcHJvcGVy
dGllcyB0aGF0IGRlc2NyaWJlIHJlbGF0aW9uc2hpcAo+Pj4+IGJldHdlZW4gbWFzdGVyIGRldmlj
ZXMgYW5kIElPTU1VcyBkb2VzIG5vdCBtYWtlIGFueSBzZW5zZS4KPj4+Pgo+Pj4+IEFjY29yZGlu
ZyB0byB0aGU6Cj4+Pj4gMS4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11
L2lvbW11LnR4dAo+Pj4+IDIuIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kv
cGNpLWlvbW11LnR4dAo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVu
a28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgo+Pj4+IEFja2VkLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+Pj4+IC0tLQo+Pj4+IMKgIHhlbi9hcmNoL2Fy
bS9kb21haW5fYnVpbGQuYyB8IDEwICsrKysrKysrKysKPj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwg
MTAgaW5zZXJ0aW9ucygrKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21h
aW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+Pj4+IGluZGV4IGQyYzYz
YTguLjE1YTA4ZDYgMTAwNjQ0Cj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5j
Cj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4+Pj4gQEAgLTU0MCw2ICs1
NDAsMTYgQEAgc3RhdGljIGludCBfX2luaXQgd3JpdGVfcHJvcGVydGllcyhzdHJ1Y3QgCj4+Pj4g
ZG9tYWluICpkLCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLAo+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4gwqAg
K8KgwqDCoMKgwqDCoMKgIC8qIERvbid0IGV4cG9zZSBJT01NVSBzcGVjaWZpYyBwcm9wZXJ0aWVz
IHRvIHRoZSBndWVzdCAqLwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIGR0X3Byb3BlcnR5X25h
bWVfaXNfZXF1YWwocHJvcCwgImlvbW11cyIpICkKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjb250aW51ZTsKPj4+PiArCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICggZHRfcHJvcGVydHlf
bmFtZV9pc19lcXVhbChwcm9wLCAiaW9tbXUtbWFwIikgKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGNvbnRpbnVlOwo+Pj4+ICsKPj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCBkdF9wcm9w
ZXJ0eV9uYW1lX2lzX2VxdWFsKHByb3AsICJpb21tdS1tYXAtbWFzayIpICkKPj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4+PiArCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
IHJlcyA9IGZkdF9wcm9wZXJ0eShraW5mby0+ZmR0LCBwcm9wLT5uYW1lLCBwcm9wX2RhdGEsIAo+
Pj4+IHByb3BfbGVuKTsKPj4+PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCByZXMgKQo+Pj4+
Cj4+Pgo+PiBKdWxpZW4sIGFyZSB5b3UgaGFwcHkgdG8gc2VlIHRoaXMgcGF0Y2ggYXMgaXMsIG9y
IGRvIHlvdSBoYXZlIHNvbWUgCj4+IGNvbW1lbnRzIHJlZ2FyZGluZyBpdD8KPgo+IEkgaGF2ZSBz
b21lIGNvbW1lbnRzIG9uIHRoZSBjb3ZlciBsZXR0ZXIgZm9yIHRoaXMgcGF0Y2guIFBsZWFzZSBz
ZWUgWzFdLgo+Cj4gVGhhbmsgeW91IGZvciBoYXZpbmcgYSBsb29rIGF0IHRoZSBwYXRjaC4KPgo+
IENoZWVycywKPgo+IFsxXSA8ZWQwODc5ODAtYTJiOS0yZmQ0LTdlODQtNDQ2MTQyZTgxNzZiQGFy
bS5jb20+CgpMb29raW5nIGJyaWVmbHksIEkgZm91bmQgdHdvIG1haW4gcG9pbnRzIHJlZ2FyZGlu
ZyB0aGF0IHBhdGNoLiBUaGlzIGlzIApob3cgSSB1bmRlcnN0YW5kIHRoZW0gKHBsZWFzZSwgY29y
cmVjdCBtZSBpZiBJIGFtIHdyb25nKToKCjEuIFRoZSBJT01NVSBjYW4gYmUgYWNjZXNzaWJsZSBi
eSBEb20wIChmb3IgZXhhbXBsZSwgaWYgd2UgcGFzcyAKImlvbW11PWRpc2FibGVkIiB0byBYZW4g
Y29tbWFuZCBsaW5lIG9yIGl0IGlzIGVuYWJsZWQsIGJ1dCB0aGVyZSBpcyBub3QgCnN1aXRhYmxl
IGRyaXZlciBpbiBYZW4gZm91bmQpLgpUaGVyZSBpcyBubyBuZWVkIHRvIHJlbW92ZSBwcm9wZXJ0
aWVzIGlmIERvbTAgaXMgYWxyZWFkeSB0b3VjaGluZyB0aGUgSU9NTVUuCjIuIEdlbmVyaWMgSU9N
TVUgRFQgYmluZGluZ3MgaXMgbm90IHVzZWQgaW4gWGVuIHNvIGZhci4gVGhlcmUgaXMgbm8gbmVl
ZCAKdG8gcmVtb3ZlIHByb3BlcnRpZXMuCgpBcyBJIHVuZGVyc3RhbmQsIGJvdGggcG9pbnRzIGFy
ZSBub3QgYWN0dWFsIGFueW1vcmUgYW5kIG5vdGhpbmcgdG8gCm1vZGlmeSBpbiB0aGF0IHBhdGNo
LCBjb3JyZWN0PwoKQmVjYXVzZToKCjEuIEdpdmluZyB0aGUgSU9NTVUgdG8gRG9tMCBpcyBhIGJh
ZCBpZGVhLgoyLiBBbHJlYWR5IHN1cHBvcnRlZC4KCgotLSAKUmVnYXJkcywKCk9sZWtzYW5kciBU
eXNoY2hlbmtvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE3E3D5B7
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 20:47:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1halkW-00065H-Sa; Tue, 11 Jun 2019 18:44:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W27b=UK=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1halkU-00065C-FV
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 18:43:58 +0000
X-Inumbo-ID: de2670de-8c78-11e9-8980-bc764e045a96
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id de2670de-8c78-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 18:43:57 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id a25so10112812lfg.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2019 11:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SY3arHbpbdqEtlG90/+UaeMdIgr12loSonKZtVUhASE=;
 b=lasy0nUvJXwpARDW8B5cFbrD0C4YTsgoK22LcI7dIFu/EUmNrV476cdwttoOoizY5q
 2jocqE3ZoO/QVeeUCeuJnywIbFG7b6Lg/RZZOpn+oKPJIxx20aLtoPqUJ0fX2BMjvpeO
 TC7v9X8GRDomUEYTJjEX9FBZoXPmXs4fntY+lL+o/GU9zxshcIE582mWbGkjsRYxYhhS
 ywzB3OGqwaEVEU8c98AG3+o6+Lkc8uwzY+25tWaT/lmzVEyO2oF0VLv8y/dbANu3ARSR
 S8OtTXz3jovR+lA05SQV1PY8+U0fNJHywvCJhW6HzsJBFhFQWlTKerEBPLF4AmkSxU/7
 Twxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SY3arHbpbdqEtlG90/+UaeMdIgr12loSonKZtVUhASE=;
 b=CncKJEHVCCdId6Xg1JqnRMOJlxOQ/yK98JzFSSKAsR2ZpeevZzShfIMy2allKJ3SWm
 q8zJeoo1lVAjWxFpKRZeRPl/P0DhcylKN1VLIp3LKz7+8njbGUGVAySYMsGX4Qzp0K+T
 7TfHRrH9f7mkSIYvGz4n/i6TBECN9qkcYT7uexyogF5uT6nFcYj3/b2UnZj4zKNk4IJS
 a9FpKulhV7PSsZGP2V/G10mudAnVJNLBHT7ONPyFn6byHCEEcsFOYMeMsnjYn7upC2nl
 tfdyki2NClEIJDpDKZrPeTRL47x+FzMygw69MLNLlRXMtgtk/OgqyhDDQpFXhDI+MZYm
 4Jrg==
X-Gm-Message-State: APjAAAWtOXnT8qY9yEmddoUv1a2s36LQM13UlVWcPeZQqjIZjq1MCzRP
 /Q3MgCNV66AtxvVgJuswKM4A79b2mChW2mJKpjY=
X-Google-Smtp-Source: APXvYqyGKvmtCglvXn3h7NZUXetZqJSARCJDwqxi12/FIusjq0YvcJFlM0kWiFPt9L94m82SSwfI6HMYkmaE93vvAwQ=
X-Received: by 2002:ac2:46d5:: with SMTP id p21mr4693298lfo.133.1560278635722; 
 Tue, 11 Jun 2019 11:43:55 -0700 (PDT)
MIME-Version: 1.0
References: <fb83896f3b399c7ace3292f38506812bc4616f6d.1560272437.git.tsirakisn@ainfosec.com>
In-Reply-To: <fb83896f3b399c7ace3292f38506812bc4616f6d.1560272437.git.tsirakisn@ainfosec.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 11 Jun 2019 11:43:44 -0700
Message-ID: <CACMJ4GYFeudWjWUOEDPYCKPF+JNJ761yQ7n+rkEY4bzWbnO69Q@mail.gmail.com>
To: Nicholas Tsirakis <niko.tsirakis@gmail.com>
Subject: Re: [Xen-devel] [PATCH 1/2] argo: warn sendv() caller when ring is
 full
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Nicholas Tsirakis <tsirakisn@ainfosec.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMTA6MTEgQU0gTmljaG9sYXMgVHNpcmFraXMKPG5pa28u
dHNpcmFraXNAZ21haWwuY29tPiB3cm90ZToKPgo+IEluIGl0cyBjdXJyZW50IHN0YXRlLCBpZiB0
aGUgZGVzdGluYXRpb24gcmluZyBpcyBmdWxsLCBzZW5kdigpCj4gd2lsbCByZXF1ZXVlIHRoZSBt
ZXNzYWdlIGFuZCByZXR1cm4gdGhlIHJjIG9mIHBlbmRpbmdfcmVxdWV1ZSgpLAo+IHdoaWNoIHdp
bGwgcmV0dXJuIDAgb24gc3VjY2Vzcy4gVGhpcyBwcmV2ZW50cyB0aGUgY2FsbGVyIGZyb20KPiBk
aXN0aW5ndWlzaGluZyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIGEgc3VjY2Vzc2Z1bCB3cml0ZSBh
bmQgYQo+IG1lc3NhZ2UgdGhhdCBuZWVkcyB0byBiZSByZXNlbnQgYXQgYSBsYXRlciB0aW1lLgo+
Cj4gSW5zdGVhZCwgY2FwdHVyZSB0aGUgLUVBR0FJTiB2YWx1ZSByZXR1cm5lZCBmcm9tIHJpbmdi
dWZfaW5zZXJ0KCkKPiBhbmQgKm9ubHkqIG92ZXJ3cml0ZSBpdCBpZiB0aGUgcmMgb2YgcGVuZGlu
Z19yZXF1ZXVlKCkgaXMgbm9uLXplcm8uCj4gVGhpcyBhbGxvd3MgdGhlIGNhbGxlciB0byBtYWtl
IGludGVsbGlnZW50IGRlY2lzaW9ucyBvbiAtRUFHQUlOIGFuZAo+IHN0aWxsIGJlIGFsZXJ0ZWQg
aWYgdGhlIHBlbmRpbmcgbWVzc2FnZSBmYWlscyB0byByZXF1ZXVlLgo+Cj4gU2lnbmVkLW9mZi1i
eTogTmljaG9sYXMgVHNpcmFraXMgPHRzaXJha2lzbkBhaW5mb3NlYy5jb20+CgpUaGFua3MgZm9y
IHRoZSBjb3JyZWN0IGlkZW50aWZpY2F0aW9uIG9mIHRoZSBwcm9ibGVtIGFuZCB0aGUgcGF0Y2gu
CgpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZXIgQ2xhcmsgPGNocmlzdG9waGVyLmNsYXJrNkBiYWVz
eXN0ZW1zLmNvbT4KCgo+IC0tLQo+ICB4ZW4vY29tbW9uL2FyZ28uYyB8IDYgKysrKystCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1n
aXQgYS94ZW4vY29tbW9uL2FyZ28uYyBiL3hlbi9jb21tb24vYXJnby5jCj4gaW5kZXggMTMwNTJi
OTIzOS4uMmY4NzRhNTcwZCAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9uL2FyZ28uYwo+ICsrKyBi
L3hlbi9jb21tb24vYXJnby5jCj4gQEAgLTIwNDgsOSArMjA0OCwxMyBAQCBzZW5kdihzdHJ1Y3Qg
ZG9tYWluICpzcmNfZCwgeGVuX2FyZ29fYWRkcl90ICpzcmNfYWRkciwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBtZXNzYWdlX3R5cGUsICZsZW4pOwo+ICAgICAgICAgIGlmICggcmV0
ID09IC1FQUdBSU4gKQo+ICAgICAgICAgIHsKPiArICAgICAgICAgICAgaW50IHJjOwo+ICsKPiAg
ICAgICAgICAgICAgYXJnb19kcHJpbnRrKCJhcmdvX3JpbmdidWZfc2VuZHYgZmFpbGVkLCBFQUdB
SU5cbiIpOwo+ICAgICAgICAgICAgICAvKiByZXF1ZXVlIHRvIGlzc3VlIGEgbm90aWZpY2F0aW9u
IHdoZW4gc3BhY2UgaXMgdGhlcmUgKi8KPiAtICAgICAgICAgICAgcmV0ID0gcGVuZGluZ19yZXF1
ZXVlKGRzdF9kLCByaW5nX2luZm8sIHNyY19pZC5kb21haW5faWQsIGxlbik7Cj4gKyAgICAgICAg
ICAgIHJjID0gcGVuZGluZ19yZXF1ZXVlKGRzdF9kLCByaW5nX2luZm8sIHNyY19pZC5kb21haW5f
aWQsIGxlbik7Cj4gKyAgICAgICAgICAgIGlmICggcmMgKQo+ICsgICAgICAgICAgICAgICAgcmV0
ID0gcmM7Cj4gICAgICAgICAgfQo+Cj4gICAgICAgICAgc3Bpbl91bmxvY2soJnJpbmdfaW5mby0+
TDNfbG9jayk7Cj4gLS0KPiAyLjE3LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF79141797
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jan 2020 14:11:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isnqe-0007aB-Gd; Sat, 18 Jan 2020 13:09:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s8pn=3H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1isnqc-0007a6-RN
 for xen-devel@lists.xenproject.org; Sat, 18 Jan 2020 13:09:06 +0000
X-Inumbo-ID: b459a10a-39f3-11ea-b718-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b459a10a-39f3-11ea-b718-12813bfff9fa;
 Sat, 18 Jan 2020 13:09:05 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d16so25198732wre.10
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jan 2020 05:09:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NmLbM5vhrZhS2BZnkcsF2xH8EigUP2OMqOu1aSDt0cM=;
 b=pY/RqU5iEZEvuqUnb+g4egPs31xpnZxoMjknCBri/KmRgc9/QLW0OAvjhxUVINobHB
 rPrgN27Yo+Xc4Dva2s26T2XObzyCgvKJqBIAmZt+E42lfmb5obaGeesdu241sv22hHYj
 C1PlA9SbPXNvQEuY3/NMgCsDl6xRf3ScZzEkRfj0HI4jHNbJ2yHcXq6tU3CJdP9+fXn5
 Oh/hBVDbQEUZHDQkIbx7HovI9L6XSKI0gmGIhCwFgmA6X70P9HjV44LTS1kvRJkVGoEY
 5ZDl0mpOicK7XB+4WJlmI8f94PNyfoayXDP6ZxafzGYdPToHP4i/wuUTU5yKX+DaSEJd
 tRig==
X-Gm-Message-State: APjAAAXz1GQ5fJi051p1NphT3JQ+8r42lcUzpP8tqWWMuP40Js52+aq4
 8hTmrmHs2RInarTjizZatNw=
X-Google-Smtp-Source: APXvYqwz1LaAgb+I392akp0+HfADt0t/T2/YSVHFie6V7qP2TOyDzJmdvs1adzyrOLQwu2wNfhHytQ==
X-Received: by 2002:a05:6000:367:: with SMTP id
 f7mr8268538wrf.174.1579352945039; 
 Sat, 18 Jan 2020 05:09:05 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-231.amazon.com.
 [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id n67sm14656857wmf.46.2020.01.18.05.09.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Jan 2020 05:09:04 -0800 (PST)
To: Artem Mygaiev <joculator@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1570628924.git.artem_mygaiev@epam.com>
 <5eec779f850fec88caeb67a090a25092792689ba.1570628924.git.artem_mygaiev@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <51fd5546-b0aa-2d37-4d26-51484dd3cde8@xen.org>
Date: Sat, 18 Jan 2020 13:09:03 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5eec779f850fec88caeb67a090a25092792689ba.1570628924.git.artem_mygaiev@epam.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 1/3] Consistent use for lock variable
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
Cc: Artem Mygaiev <artem_mygaiev@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQXJ0ZW0sCgpBcG9sb2dpZXMgZm9yIHRoZSBsYXRlIGFuc3dlci4KCk9uIDA5LzEwLzIwMTkg
MTU6MjAsIEFydGVtIE15Z2FpZXYgd3JvdGU6Cj4gLi4uIGZvciBib3RoIGxvY2sgYW5kIHVubG9j
awoKSSB3b3VsZCBzdWdnZXN0IHRoZSBmb2xsb3dpbmcgY29tbWl0IG1lc3NhZ2U6Cgp4ZW4veHNt
OiBVc2UgdGhlIHNhbWUgbG9jayBmb3IgbG9jayBhbmQgdW5sb2NrCgpUaGUgZnVuY3Rpb24gYXZj
X3JlY2xhaW1fbW9kZSgpIGlzIG5vdCB1c2luZyB0aGUgc2FtZSB2YXJpYWJsZSBmb3IgCmxvY2tp
bmcgYW5kIHVubG9ja2luZy4gV2hpbGUgdGhlIHVuZGVybHlpbmcgc3BpbmxvY2sgaXMgdGhlIHNh
bWUsIApjb3Zlcml0eSB3aWxsIGdldCBjb25mdXNlZCBhbmQgdGhpbmsgdGhlIGxvY2sgd2FzIG5v
dCByZWxlYXNlZC4KClVwZGF0ZSB0aGUgY29kZSB0byB1c2UgdGhlIHNhbWUgdmFyaWFibGUgZm9y
IHRoZSBsb2NrIGFuZCB1bmxvY2sgcGFydC4KCj4gCj4gQ292ZXJpdHktSUQ6IDEzODE4NDAKPiBT
aWduZWQtb2ZmLWJ5OiBBcnRlbSBNeWdhaWV2IDxhcnRlbV9teWdhaWV2QGVwYW0uY29tPgoKQWNr
ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CgpXZSBhbHNvIG5lZWQgYW4gaGFj
ayBmcm9tIERhbmllbC4gQERhbmllbCwgYXJlIHlvdSBoYXBweSB3aXRoIHRoZSBjaGFuZ2U/Cgo+
IC0tLQo+ICAgeGVuL3hzbS9mbGFzay9hdmMuYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4veHNtL2Zs
YXNrL2F2Yy5jIGIveGVuL3hzbS9mbGFzay9hdmMuYwo+IGluZGV4IDg3ZWEzOGI3YTAuLjNhOTUw
N2Y2MmEgMTAwNjQ0Cj4gLS0tIGEveGVuL3hzbS9mbGFzay9hdmMuYwo+ICsrKyBiL3hlbi94c20v
Zmxhc2svYXZjLmMKPiBAQCAtMzIwLDcgKzMyMCw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IGF2Y19y
ZWNsYWltX25vZGUodm9pZCkKPiAgICAgICAgICAgaGVhZCA9ICZhdmNfY2FjaGUuc2xvdHNbaHZh
bHVlXTsKPiAgICAgICAgICAgbG9jayA9ICZhdmNfY2FjaGUuc2xvdHNfbG9ja1todmFsdWVdOwo+
ICAgCj4gLSAgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJmF2Y19jYWNoZS5zbG90c19sb2NrW2h2
YWx1ZV0sIGZsYWdzKTsKPiArICAgICAgICBzcGluX2xvY2tfaXJxc2F2ZShsb2NrLCBmbGFncyk7
Cj4gICAgICAgICAgIHJjdV9yZWFkX2xvY2soJmF2Y19yY3VfbG9jayk7Cj4gICAgICAgICAgIGhs
aXN0X2Zvcl9lYWNoX2VudHJ5KG5vZGUsIG5leHQsIGhlYWQsIGxpc3QpCj4gICAgICAgICAgIHsK
PiAKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=

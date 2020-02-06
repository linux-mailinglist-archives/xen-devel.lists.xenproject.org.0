Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BC915463F
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 15:33:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iziAW-00017a-SD; Thu, 06 Feb 2020 14:30:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VSBF=32=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iziAU-00017R-WD
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 14:30:11 +0000
X-Inumbo-ID: 2d91f8f8-48ed-11ea-841d-bc764e2007e4
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d91f8f8-48ed-11ea-841d-bc764e2007e4;
 Thu, 06 Feb 2020 14:30:10 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w12so7487079wrt.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2020 06:30:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r+o1jX7ZA1kyy/EzL7fpD+k16beTz1e6aXoBNhZEkho=;
 b=Zo3pCjSBYhXLBNKnyqGIi2vd1nXE0eIyi174rEWr8uGnCAKrunzi5DZrtwKKW6xO7c
 SwNyJr09FbGQmJYwq0IC6rgcUPyPU488YINL0bHkS8m16K27fuCDzYC4XZ8Vv5Yz57ZS
 KqHO8UU8EZoafY7x+fuFjZIE0ioE8b+wzBSISoP0a3PPydH5ReDtfcEX9v4TOD/C1WxL
 d5KVppRkU6b49i8ndJHl00mn6Eq3J3NYjoDFfrXgHduldQj2wCY0UbFghxBNHpblM20x
 qvo418rfrZ/UadqgdkZaBR/ca/KceBtHsp4diEd4lfJEGcK2IMbjbFB0Va6Ge0FFEckj
 1Xhg==
X-Gm-Message-State: APjAAAVQwpoD07R/iGQoUtJMw+tCeO9qD6vX/suofosmSDdx8SN6cVx/
 77/GPXXIF2/UNVzzvsRmAl0=
X-Google-Smtp-Source: APXvYqzFSv5W7uCW6aWYBX5xRLzKOJpkvV/eRFRaK8QJI9oCBHqEno9cQBIlsOtDceHc8/xMigYlUQ==
X-Received: by 2002:a05:6000:367:: with SMTP id
 f7mr4067455wrf.174.1580999409383; 
 Thu, 06 Feb 2020 06:30:09 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-236.amazon.com.
 [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id b11sm4443972wrx.89.2020.02.06.06.30.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2020 06:30:08 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <20200203105654.22998-1-pdurrant@amazon.com>
 <20200203105654.22998-4-pdurrant@amazon.com>
 <eb444c22-de88-e0e9-1a99-3cbd412851a0@xen.org>
 <dea18d7c61b240edb9e9dfdf1eacf90d@EX13D32EUC003.ant.amazon.com>
 <8358cbdc-8487-1dce-22c2-9ad008a879d8@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f95e22c3-1f72-f394-071d-a564a1442c77@xen.org>
Date: Thu, 6 Feb 2020 14:30:07 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <8358cbdc-8487-1dce-22c2-9ad008a879d8@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v9 3/4] mm: make pages allocated with
 MEMF_no_refcount safe to assign
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, "Durrant,
 Paul" <pdurrant@amazon.co.uk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwNi8wMi8yMDIwIDExOjQzLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAwNi4wMi4yMDIw
IDExOjEyLCBEdXJyYW50LCBQYXVsIHdyb3RlOgo+Pj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqdWxp
ZW5AeGVuLm9yZz4KPj4+IFNlbnQ6IDA2IEZlYnJ1YXJ5IDIwMjAgMTA6MDQKPj4+Cj4+PiBPbiAw
My8wMi8yMDIwIDEwOjU2LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+Pj4gQEAgLTIzMzIsMTEgKzIz
NTAsMjMgQEAgc3RydWN0IHBhZ2VfaW5mbyAqYWxsb2NfZG9taGVhcF9wYWdlcygKPj4+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWVtZmxhZ3MsIGQpKSA9PSBOVUxMKSkg
KQo+Pj4+ICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+Pj4+Cj4+Pj4gLSAgICBpZiAoIGQgJiYg
IShtZW1mbGFncyAmIE1FTUZfbm9fb3duZXIpICYmCj4+Pj4gLSAgICAgICAgIGFzc2lnbl9wYWdl
cyhkLCBwZywgb3JkZXIsIG1lbWZsYWdzKSApCj4+Pj4gKyAgICBpZiAoIGQgJiYgIShtZW1mbGFn
cyAmIE1FTUZfbm9fb3duZXIpICkKPj4+PiAgICAgICAgewo+Pj4+IC0gICAgICAgIGZyZWVfaGVh
cF9wYWdlcyhwZywgb3JkZXIsIG1lbWZsYWdzICYgTUVNRl9ub19zY3J1Yik7Cj4+Pj4gLSAgICAg
ICAgcmV0dXJuIE5VTEw7Cj4+Pj4gKyAgICAgICAgaWYgKCBtZW1mbGFncyAmIE1FTUZfbm9fcmVm
Y291bnQgKQo+Pj4+ICsgICAgICAgIHsKPj4+PiArICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBp
Owo+Pj4+ICsKPj4+PiArICAgICAgICAgICAgZm9yICggaSA9IDA7IGkgPCAoMXVsIDw8IG9yZGVy
KTsgaSsrICkKPj4+PiArICAgICAgICAgICAgewo+Pj4+ICsgICAgICAgICAgICAgICAgQVNTRVJU
KCFwZ1tpXS5jb3VudF9pbmZvKTsKPj4+PiArICAgICAgICAgICAgICAgIHBnW2ldLmNvdW50X2lu
Zm8gPSBQR0NfZXh0cmE7Cj4+Pgo+Pj4gLi4uIHRoaXMgaXMgcHVyc3VpbmcgdGhlIHdyb25nbmVz
cyBvZiB0aGUgY29kZSBhYm92ZSBhbmQgbm90IHNhZmUKPj4+IGFnYWluc3Qgb2ZmbGluaW5nLgo+
Pj4KPj4+IFdlIGNvdWxkIGFyZ3VlIHRoaXMgaXMgYW4gYWxyZWFkeSBleGlzdGluZyBidWcsIGhv
d2V2ZXIgSSBhbSBhIGJpdAo+Pj4gdW5lYXNlIHRvIGFkZCBtb3JlIGFidXNlIGluIHRoZSBjb2Rl
LiBKYW4sIHdoYXQgZG8geW91IHRoaW5rPwo+Pj4KPj4KPj4gSSdkIGNvbnNpZGVyIGEgc3RyYWln
aHRmb3J3YXJkIHBhdGNoLWNsYXNoLiBJZiB0aGlzIHBhdGNoIGdvZXMgaW4KPj4gYWZ0ZXIgeW91
cnMgdGhlbiBpdCBuZWVkcyB0byBiZSBtb2RpZmllZCBhY2NvcmRpbmdseSwgb3IgdmljZSB2ZXJz
YS4KPiAKPiBXaGlsZSBnZW5lcmFsbHkgSSBhZHZvY2F0ZSBmb3Igbm90IHdpZGVuaW5nIGV4aXN0
aW5nIGlzc3VlcywgSSBhZ3JlZQo+IHdpdGggUGF1bCBoZXJlLiBIaXMgcGF0Y2ggc2hvdWxkIG5v
dCBiZSBwZW5hbGl6ZWQgYnkgdXMgX2xhdGVyXwo+IGhhdmluZyBmb3VuZCBhbiBpc3N1ZSAod2hp
Y2ggaXMgcXVpdGUgYSBiaXQgd2lkZXIpLgoKRmFpciBlbm91Z2guIEZvciB0aGUgQXJtIGJpdHM6
CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

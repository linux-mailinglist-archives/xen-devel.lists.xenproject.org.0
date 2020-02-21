Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B2816862D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 19:11:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5Cjm-0002hB-1G; Fri, 21 Feb 2020 18:09:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IhbZ=4J=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1j5Cjk-0002gw-4P
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 18:09:16 +0000
X-Inumbo-ID: 331c4d3e-54d5-11ea-ade5-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 331c4d3e-54d5-11ea-ade5-bc764e2007e4;
 Fri, 21 Feb 2020 18:08:45 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id e10so3427656edv.9
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2020 10:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fdiWzG71gBsIxqPoISH7NrYz3VYKtqSKko+7G0dhafI=;
 b=szDBuWl2qBuqIyTjdHWrOnziHaXeQg+xi8NwVYh5gZ1n9NG3BSDBKlmNBy452/Tjik
 Vb5p0a4/T72mOXxkigTqpmaY6cONSOe1JdYzdG2VA2jyClwWYhFMHazUqgPvATadXGOc
 T0E9csK6GRJTCyOBeqfhijGkgU2fTMTSi4ut7o1Cj192hbV8Vo+k17LZvwp7PCKfgvRZ
 XIZvzgsaTZWKolzNm5Luar+to1xFqKCFH9Gj+K6Lp+HXtK1RzVQ5OYShomh7ttQBMD35
 RGtZj5uSAIDEEi2LYnJ6TY5zj6zWX5/mXjYy97h5WATkUajjBlPtAnisWcYOyGVS9YlH
 Y2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fdiWzG71gBsIxqPoISH7NrYz3VYKtqSKko+7G0dhafI=;
 b=lBWhZz/pwXQD89q0hm4Iiy8ayWfXgT+uRC/nm/cuQITs+j1uJbiqqRlgWAKA4ZPzmx
 QcDisMHXHU+S3ejUIKQUexdPRZeppdlKGv5ZEdoaQSxGdVbZDikYOOsjHJk+ZSV2aF92
 EnHdv/Cl5X2zQVXy8UZV5Kc/1XSldZWfkWz7uEZcM9NYH+fL1juQnuQgjomE7j7DMVwI
 br5xaq/qdqzg1qOiZVgRvq0uDe+SEMqyy5rgP4XAV1J3ibjZzvKN7KMhrjYyq10YpqdW
 uY5p1suppMFoibY+ZVU0wy6Ec5nEZH6i25MMZ9Xoi/ja5O1XE6/DIAQkT9vTvtBt8G16
 pDYA==
X-Gm-Message-State: APjAAAUvE6ace6wRMRXCbsLhapNHM0iHcGjJOyDIFQe4e2LgeUGXzrxr
 5rK0S2tfCl8wJpnXI1tfja7I8tMP2uQ=
X-Google-Smtp-Source: APXvYqx9pwIWfAf4ugVYa/GpVttIgBUe/bbLOyo5OBgUbi3d3O+kGe0oSUvjqCBnDxrrJNnuvAGp/w==
X-Received: by 2002:aa7:dd95:: with SMTP id g21mr35709921edv.355.1582308524399; 
 Fri, 21 Feb 2020 10:08:44 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54])
 by smtp.gmail.com with ESMTPSA id h12sm290335ejb.6.2020.02.21.10.08.42
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 10:08:43 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id a9so2863636wmj.3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2020 10:08:42 -0800 (PST)
X-Received: by 2002:a1c:66d7:: with SMTP id a206mr96033wmc.77.1582308522312;
 Fri, 21 Feb 2020 10:08:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581362050.git.tamas.lengyel@intel.com>
 <0f7d636910c45e9ca32fda4ef864a9b7d6e32745.1581362050.git.tamas.lengyel@intel.com>
 <fa70f8c7-a822-b9de-0af6-c9fb2835c664@citrix.com>
 <CABfawh=g7OXetqAgA9rtu0gL0PB6bkg4U-e_raXrvS11X_+gBA@mail.gmail.com>
 <24288f4e-36da-f701-9709-ca3acc1f815a@citrix.com>
In-Reply-To: <24288f4e-36da-f701-9709-ca3acc1f815a@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 21 Feb 2020 11:08:06 -0700
X-Gmail-Original-Message-ID: <CABfawh=mizacs_L3v-UaxdNG5G=eTncEPu-GX__70ryNfE3J6g@mail.gmail.com>
Message-ID: <CABfawh=mizacs_L3v-UaxdNG5G=eTncEPu-GX__70ryNfE3J6g@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH v8 3/5] xen/mem_sharing: VM forking
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBPbmUgcXVlc3Rpb24gbmVlZGluZyBjb25zaWRlcmluZyBpcyB3aGV0aGVyIHN1Y2ggYSBoeXBl
cmNhbGwgY291bGQgaW4KPiB0aGVvcnkgYmUgdXNlZnVsIHdpdGhvdXQgdGhlIG1lbV9zaGFyaW5n
IGluZnJhc3RydWN0dXJlLCBvciBub3QuICAoaS5lLgo+IGhvdyB0aWdodGx5IGludGVncmF0ZWQg
d2Ugc2hvdWxkIGFpbSBmb3IuKQoKSXQgd291bGQgYmUgcG9zc2libGUgdG8gY3JlYXRlIGRvbWFp
biBmb3JrcyB3aXRob3V0IG1lbV9zaGFyaW5nLiBUaGUKbWVtX3NoYXJpbmcgcGFydCBqdXN0IGFk
ZHMgYW4gZXh0cmEgb3B0aW1pemF0aW9uIG9uIHRvcCBzbyB3ZSBkb24ndAplbmQgdXAgY29weWlu
ZyBhbGwgYWNjZXNzZWQgcGFnZXMgbmVlZGxlc3NseSwgd2Ugb25seSBkbyB0aGF0IHdoZW4gdGhl
CnBhZ2UgaXMgd3JpdHRlbiB0by4gSW4gb25lIG9mIHRoZSBlYXJsaWVyIHJldmlzaW9ucyBvZiB0
aGUgc2VyaWVzCih+djQpIGR1ZSB0byBhIGJ1ZyB3ZSBhY3R1YWxseSByYW4gdGhlIHN5c3RlbSB3
aXRoIGFsbCBwYWdlcyBiZWluZwpkZWR1cGxpY2F0ZWQgYW5kIG5vIG1lbV9zaGFyaW5nIGFuZCBp
dCB3YXMgd29ya2luZyBqdXN0IGZpbmUuIEknbSBub3QKc3VyZSBpZiB0aGF0J3Mgd2hhdCB5b3Ug
d2VyZSBhc2tpbmcgdGhvdWdoIDopCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A0712F6F5
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 12:04:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inKiB-00013l-Aq; Fri, 03 Jan 2020 11:01:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=swuY=2Y=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1inKi9-00013g-I8
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 11:01:45 +0000
X-Inumbo-ID: 6df7374a-2e18-11ea-88e7-bc764e2007e4
Received: from mail-pl1-x644.google.com (unknown [2607:f8b0:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6df7374a-2e18-11ea-88e7-bc764e2007e4;
 Fri, 03 Jan 2020 11:01:45 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id bd4so18942715plb.8
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 03:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eWoksbSSF8sLYP20FdZbp8k0NEhoakxnIAt7mIXhHvA=;
 b=rt4a7RHzofyHb94mrUvjzLQcupeMbSzu+IDb3k/vRG2x0UGTuBRoADe+AJl1/G+sC1
 HttDVtJM2SYF9z+iEMES4iRjKrg/rym6D35DAP1wg9KQpS9gSHyy8v6RseYazGB7TKAB
 6RsGP8F5k/AM5RhnZljyUc3gmZTwcQwMBn/CdZp/lMXJliOILnLUp3F6K6mHx1+yOJ8r
 TUXKqJcwgV3wu5f2g9yLBnaRza/y+ll4erzFaLu1CQGb074h5/JfKp6NAYm8QthkNqin
 yr2Ls0lyx/go5SUZvGPus2AfTRKO8+kIIX+xm5QOmxpgAMXiR4mL4kntz8V9GIB4mN8e
 4kjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eWoksbSSF8sLYP20FdZbp8k0NEhoakxnIAt7mIXhHvA=;
 b=q+s56wiS/EAkKVudZFmwE1UHS+EeUVM0sfKiSGRlEsdY4LeCbdboFmfVK58f7MB3KK
 eNK0boH28n4ZGDhD30F8HsJ2/HY59FEIxw/cC/ZjppI8CfVsVhpPjzpZiO7x7A2Y7Ysw
 vZSieI12xsg1sIVnhOLYWpR5abewFxrBq5iXoswfWKdb4eAMh3zBYiXQFEsWEi07jQK3
 AKMtDgOt+8sJQtgzvzhxYt9lgXWahGXZmfkhTldrWX8BY21u8qiejXujBqEnwkeMWq4w
 Fgnn76USMcNVdO3PhAUmAifDPV9b7fwxrqgTQe7ASt3zkbwaRyrdBaOHoftT93FUGLql
 cC7A==
X-Gm-Message-State: APjAAAVcIJq3aoGI3gPCDU01J44flhDZCcMu7iiZ3W6sQcj8lcgEZmPO
 mjSbKmt2vVhIY/IZCXIkzoDXbsTi/Y/54nATnMk=
X-Google-Smtp-Source: APXvYqxrQ0dSyuLc1tl4glaPAovFYIdpPnKelUgPCrki0fZkzDvl9hEDAmmPNuR9q86HYO82/xeZLzUpPcZDtnxu560=
X-Received: by 2002:a17:90a:98d:: with SMTP id
 13mr26415669pjo.102.1578049304319; 
 Fri, 03 Jan 2020 03:01:44 -0800 (PST)
MIME-Version: 1.0
References: <20191229183341.14877-1-liuwe@microsoft.com>
 <20191229183341.14877-3-liuwe@microsoft.com>
In-Reply-To: <20191229183341.14877-3-liuwe@microsoft.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Fri, 3 Jan 2020 11:01:33 +0000
Message-ID: <CACCGGhDpQ4Df9KcgeTY30XPri9cP+Nv=NZsm7oZA4J_Z7ZS_Jg@mail.gmail.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [Xen-devel] [PATCH 2/8] x86/hyperv: detect absolutely necessary
 MSRs
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCAyOSBEZWMgMjAxOSBhdCAxODozNCwgV2VpIExpdSA8d2xAeGVuLm9yZz4gd3JvdGU6
Cj4KPiBJZiB0aGV5IGFyZSBub3QgYXZhaWxhYmxlLCBkaXNhYmxlIEh5cGVyLVYgcmVsYXRlZCBm
ZWF0dXJlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+
Cj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgfCAxMSArKysrKysr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3Qv
aHlwZXJ2L2h5cGVydi5jCj4gaW5kZXggMmU3MGI0YWE4Mi4uYzZhMjZjNTQ1MyAxMDA2NDQKPiAt
LS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gKysrIGIveGVuL2FyY2gv
eDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+IEBAIC0zMiw2ICszMiw4IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgb3BzID0gewo+ICBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNv
cl9vcHMgKl9faW5pdCBoeXBlcnZfcHJvYmUodm9pZCkKPiAgewo+ICAgICAgdWludDMyX3QgZWF4
LCBlYngsIGVjeCwgZWR4Owo+ICsgICAgdWludDY0X3QgcmVxdWlyZWRfbXNycyA9IEhWX1g2NF9N
U1JfSFlQRVJDQUxMX0FWQUlMQUJMRSB8Cj4gKyAgICAgICAgSFZfWDY0X01TUl9WUF9JTkRFWF9B
VkFJTEFCTEU7Cj4KPiAgICAgIGNwdWlkKDB4NDAwMDAwMDAsICZlYXgsICZlYngsICZlY3gsICZl
ZHgpOwo+ICAgICAgaWYgKCAhKChlYnggPT0gMHg3MjYzNjk0ZCkgJiYgIC8qICJNaWNyIiAqLwo+
IEBAIC01Nyw2ICs1OSwxNSBAQCBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgKl9faW5pdCBo
eXBlcnZfcHJvYmUodm9pZCkKPiAgICAgIG1zX2h5cGVydi5tYXhfdnBfaW5kZXggPSBlYXg7Cj4g
ICAgICBtc19oeXBlcnYubWF4X2xwX2luZGV4ID0gZWJ4Owo+Cj4gKyAgICBpZiAoIChtc19oeXBl
cnYuZmVhdHVyZXMgJiByZXF1aXJlZF9tc3JzKSAhPSByZXF1aXJlZF9tc3JzICkKPiArICAgIHsK
PiArICAgICAgICAvKiBPb3BzLCByZXF1aXJlZCBNU1JzIGFyZSBub3QgYXZhaWxhYmxlLiBUcmVh
dCB0aGlzIGFzCj4gKyAgICAgICAgICogIkh5cGVyLVYgaXMgbm90IGF2YWlsYWJsZSIuCj4gKyAg
ICAgICAgICovCgpUaGF0IGJsb2NrIGNvbW1lbnQgdmlvbGF0ZXMgZGVmYXVsdCBjb2Rpbmcgc3R5
bGUuCgogIFBhdWwKCj4gKyAgICAgICAgbWVtc2V0KCZtc19oeXBlcnYsIDAsIHNpemVvZihtc19o
eXBlcnYpKTsKPiArICAgICAgICByZXR1cm4gTlVMTDsKPiArICAgIH0KPiArCj4gICAgICByZXR1
cm4gJm9wczsKPiAgfQo+Cj4gLS0KPiAyLjIwLjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==

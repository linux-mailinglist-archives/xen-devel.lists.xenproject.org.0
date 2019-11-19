Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4F910275B
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 15:51:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX4nk-0001Kq-Rn; Tue, 19 Nov 2019 14:48:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z/Cz=ZL=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1iX4nj-0001Kl-J0
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 14:48:19 +0000
X-Inumbo-ID: 9fb0e872-0adb-11ea-9631-bc764e2007e4
Received: from mail-vs1-xe42.google.com (unknown [2607:f8b0:4864:20::e42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fb0e872-0adb-11ea-9631-bc764e2007e4;
 Tue, 19 Nov 2019 14:48:18 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id q21so14374440vsg.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2019 06:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=G62lTrqzyLQeRPmfdnQUkzMEt9qDdGCATrCP7g1zUDA=;
 b=fVePIuisgkjyO34cPEjqoYa2P1EPSl5d8YmZndxQ01YZ06uYz4ZnMaQE/DsNpdzn/o
 rbEwUOTBi2nduoK+KSg9Ts8fZeX4CggDuo67AKrY41Eg0d06ro4DJGJo6Yyn3Fdhq2SU
 tI3afNX8nDanE6JI9nDj7KwBeywMGe3KXIIvDcnUCt9ItB5v+rOFEt1dM0IWucb1Sp5O
 Vlnxsq+g5/MxlOXj2he7GgXgdlYhV8zR3WKQzyZBH3jw9e81QQK4TEORwAJfFECNB+O3
 oMKoPTwNrsDUtx+KiFbKkmzm7k0NmKu87S1yNVVLixc6DENgHvSblNJmJuj74RPgBymj
 j/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=G62lTrqzyLQeRPmfdnQUkzMEt9qDdGCATrCP7g1zUDA=;
 b=MAlm+3AWy7uoCZVohB+blyGN7LJ0ICSWx5eM4vlQaclwLeMkqtzM/UbWNeTr9hI7Zl
 /5LNNkEZnJ4yo9u6uOf9MiNwphLs+PjIG6RwbqnF5LLKhqPSUUmQaXGV+L2D9UR+KgPz
 mw1pwLZ1JZ34QRF7FGhO4H/UO5TB+jSbKZmpQ35YPk6XIIOVoQG2kCZPKhnkNQTnEHu9
 EX4BE9Go9/tP+7iRBagKbA8nKEWF2sjMDQfoAju4Ma8mNeQyyW87uaOzIogJMN/dbQdY
 T1XDeZuBIsEf7LS+5BYBweqtIwoJDOXpwLBkZoTPD4YfT5Vo2UYKVnnBYowDlQPN8Axi
 pCrw==
X-Gm-Message-State: APjAAAVyprq28xZkl2heR/zJeisbMZgF36SPSU2Hc+BA64xZPgoqw3QE
 c2IZXIrcL+eQhY3r9YgZ0fQ=
X-Google-Smtp-Source: APXvYqwtA3ZWP3uk0Xcx/pTfn3KpMx5/UEx7np8eAeUK769BAhOmUEZk6BfQGbPhPrnrKXSngwrcIQ==
X-Received: by 2002:a67:cf02:: with SMTP id y2mr10718445vsl.125.1574174897057; 
 Tue, 19 Nov 2019 06:48:17 -0800 (PST)
Received: from [192.168.0.106] ([190.106.76.210])
 by smtp.gmail.com with ESMTPSA id d196sm6060673vkd.17.2019.11.19.06.48.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Nov 2019 06:48:16 -0800 (PST)
From: Lars Kurth <lars.kurth.xen@gmail.com>
X-Google-Original-From: Lars Kurth <lars.kurth@xenproject.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
In-Reply-To: <410bf860-09f3-de37-49dc-683cf5f74ced@dornerworks.com>
Date: Tue, 19 Nov 2019 08:48:14 -0600
Message-Id: <56BEEE59-BE78-4CC1-BB40-4D3A918C2E20@xenproject.org>
References: <410bf860-09f3-de37-49dc-683cf5f74ced@dornerworks.com>
To: Jeff Kubascik <Jeff.Kubascik@dornerworks.com>
X-Mailer: Apple Mail (2.3445.104.11)
Subject: Re: [Xen-devel] arm/vtimer: Physical timer emulation and the
 physical counter
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "Julien Grall <julien.grall@arm.com>Stefano Stabellini"
 <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkaW5nLApBcnRlbSBhcyB0aGlzIGlzIHBvdGVudGlhbGx5IG9mIGludGVyZXN0IHRvIHRoZSBG
dVNhIGdyb3VwPwpMYXJzIAoKPiBPbiAxNCBOb3YgMjAxOSwgYXQgMTM6MzMsIEplZmYgS3ViYXNj
aWsgPEplZmYuS3ViYXNjaWtAZG9ybmVyd29ya3MuY29tPiB3cm90ZToKPiAKPiBIZWxsbywKPiAK
PiBJJ20gd29ya2luZyBvbiBhIHBvcnQgb2YgYSBSVE9TIChSVEVNUykgdG8gWGVuIG9uIEFSTSwg
YW5kIGNhbWUgYWNyb3NzIGFuCj4gaW50ZXJlc3RpbmcgZmluZGluZyBpbiBob3cgWGVuIGVtdWxh
dGVzIHRoZSBwaHlzaWNhbCB0aW1lciBvbiBBUk0uCj4gCj4gSW4gdGVzdGluZyBkaWZmZXJlbnQg
Y29uZmlndXJhdGlvbnMgb2YgdGhlIHBvcnQsIEkgaGF2ZSB0aGUgUlRPUyBjb25maWd1cmVkIHRv
Cj4gdXNlIHRoZSBBUk0gZ2VuZXJpYyBwaHlzaWNhbCB0aW1lci4gVGhlIGRyaXZlciBvcGVyYXRl
cyB0aGUgcGh5c2ljYWwgdGltZXIgaW4KPiB0aGUgIkNvbXBhcmVWaWV3IiBtb2RlLCB3aGVyZSB0
aGUgdGltZXIgY29uZGl0aW9uIGlzIG1ldCB3aGVuIHRoZSBwaHlzaWNhbAo+IGNvdW50ZXIgcmVh
Y2hlcyB0aGUgcHJvZ3JhbW1lZCBDb21wYXJlVmFsdWUuCj4gCj4gVGhlIGRyaXZlciBpbml0aWFs
aXplcyB0aGUgcGh5c2ljYWwgdGltZXIgYnkgZmlyc3QgcmVhZGluZyB0aGUgcGh5c2ljYWwgY291
bnRlcgo+IHJlZ2lzdGVyIENOVFBDVCwgYWRkaW5nIHRoZSBzeXN0aWNrIGludGVydmFsLCBhbmQg
dGhlbiB3cml0aW5nIHRoZSByZXN1bHQgdG8gdGhlCj4gQ29tcGFyZVZhbHVlIHJlZ2lzdGVyIENO
VFBfQ1ZBTC4gVGhpcyBhcHBlYXJzIHRvIGJlIHZhbGlkIGJlaGF2aW9yIGJhc2VkIG9uIG15Cj4g
dW5kZXJzdGFuZGluZyBvZiB0aGUgQVJNVjggQXJjaGl0ZWN0dXJlIFJlZmVyZW5jZSBNYW51YWws
IHNpbmNlIHRoZSBwaHlzaWNhbAo+IHRpbWVyICJvZmZzZXQiIGlzIHNwZWNpZmllZCB0byBiZSB6
ZXJvLgo+IAo+IFhlbiB3aWxsIHRyYXAgYWNjZXNzZXMgdG8gdGhlIHBoeXNpY2FsIHRpbWVyIHJl
Z2lzdGVycyAtIENOVFBfQ1RMLCBDTlRQX0NWQUwsCj4gYW5kIENOVFBfVFZBTCwgd2hpY2ggaGFw
cGVucyBpbiB4ZW4vYXJjaC9hcm0vdnRpbWVyLmMuIFhlbiB3aWxsIGFkZCBvciByZW1vdmUgYW4K
PiBvZmZzZXQgcGh5c190aW1lcl9iYXNlLm9mZnNldCB3aGVuIHJlYWRpbmcgb3Igd3JpdGluZyB0
byB0aGUgQ05UUF9DVkFML0NOVFBfVFZBTAo+IHJlZ2lzdGVycy4gVGhpcyBvZmZzZXQgaXMgZGV0
ZXJtaW5lZCB3aGVuIHRoZSB2dGltZXIgaXMgaW5pdGlhbGl6ZWQgb24gZ3Vlc3QKPiBjcmVhdGlv
bi4KPiAKPiBIb3dldmVyLCBYZW4gZG9lcyBub3QgdHJhcCBhY2Nlc3MgdG8gdGhlIHBoeXNpY2Fs
IGNvdW50ZXIgcmVnaXN0ZXIgQ05UUENULiBUaGlzCj4gbWVhbnMgdGhlIGd1ZXN0IGhhcyBkaXJl
Y3QgYWNjZXNzIHRvIHRoZSByZWdpc3Rlci4gSXQgYWxzbyBtZWFucyB0aGUgb2Zmc2V0IGlzCj4g
bm90IGFwcGxpZWQgaGVyZS4gSSBiZWxpZXZlIHRoaXMgaXMgYSBwcm9ibGVtLCBiZWNhdXNlIHRo
ZSBwaHlzaWNhbCB0aW1lciBpcyBubwo+IGxvbmdlciBjb25zaXN0ZW50IHdpdGggdGhlIHBoeXNp
Y2FsIGNvdW50ZXIgZnJvbSB0aGUgZ3Vlc3QncyBwZXJzcGVjdGl2ZSAtIHRoZXJlCj4gaXMgYSBu
b24temVybywgdW5rbm93biBvZmZzZXQgYmV0d2VlbiB0aGUgdHdvLgo+IAo+IFRoaXMgd2FzIGEg
cHJvYmxlbSBmb3IgdGhlIFJUT1MsIHNpbmNlIGl0IHdhcyByZWFkaW5nIHRoZSBwaHlzaWNhbCBj
b3VudGVyCj4gcmVnaXN0ZXIgKFhlbiBkb2VzIG5vdCBhcHBseSBhbiBvZmZzZXQpLCBhZGRpbmcg
c29tZSBpbnRlcnZhbCwgYW5kIHRoZW4gc2V0dGluZwo+IHRoZSBDb21wYXJlVmFsdWUgcmVnaXN0
ZXIgKFhlbiBhcHBsaWVzIHRoZSBvZmZzZXQpLCByZXN1bHRpbmcgaW4gYSBsb25nIGRlbGF5Cj4g
YmVmb3JlIHRoZSB0aW1lciBleHBpcmVzLgo+IAo+IEkgd2FzIGFibGUgdG8gZml4IHRoaXMgYnkg
YWRkaW5nIGNvZGUgaW4gWGVuIHRvIHRyYXAgYWNjZXNzIHRvIENOVFBDVCBhbmQKPiBhcHBseWlu
ZyB0aGUgb2Zmc2V0IC0gSSBjYW4gc3VibWl0IHRoZSBwYXRjaCBpZiB0aGVyZSBpcyBpbnRlcmVz
dC4gSG93ZXZlciwgSQo+IHdhcyBjdXJpb3VzIGlmIHRoZXJlIHdhcyBhbiByZWFzb24gZm9yIG5v
dCB0cmFwcGluZy8gZW11bGF0aW5nIGFjY2VzcyB0byB0aGUKPiBwaHlzaWNhbCBjb3VudGVyIHJl
Z2lzdGVyIGFuZCBhcHBseWluZyB0aGUgb2Zmc2V0Pwo+IAo+IFNpbmNlcmVseSwKPiBKZWZmIEt1
YmFzY2lrCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

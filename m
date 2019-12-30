Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0AA12D1F6
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2019 17:26:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ilxq6-0004qa-8r; Mon, 30 Dec 2019 16:24:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4aY4=2U=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ilxq4-0004qU-Ct
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2019 16:24:16 +0000
X-Inumbo-ID: cd4af010-2b20-11ea-88e7-bc764e2007e4
Received: from mail-lf1-f44.google.com (unknown [209.85.167.44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd4af010-2b20-11ea-88e7-bc764e2007e4;
 Mon, 30 Dec 2019 16:24:07 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id y19so25419680lfl.9
 for <xen-devel@lists.xenproject.org>; Mon, 30 Dec 2019 08:24:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=zDBAHXQG87z0Ff/Xu9nLJqnwQVe5CE5ELYFWfO0+Eyw=;
 b=WMNp0VEICaZvczpCp6fZv8aJytNxmn3x8HjLElTQFqvdo5CVjsPA+Pmdg8LqUVZ0yo
 uBfuCJNKMuIeL0RwbFwGG6hGAnO+zvkhaqe447VMNCvx2IqhPrv+l/6RvAJFKvgo33wT
 aBHwkf0mVtvib6STrKcYyHBjLL7ttW5hF9bWYkUkcIiU1olH9+40/3QMF9WkZPAiAgWW
 sa4KkkexBAH9vfxLXfGgHZWy3XUKXaAMR/2M+m/lbAA8/+3e0sFUfpvGNYWzXukgw0VT
 OtwazIAQ5wLKqJHyBN3l/0ZkItmni2YQbR4gI9TXV83UjYiVMHd5zuX+0rIbcev/zaTK
 rjKQ==
X-Gm-Message-State: APjAAAVdxZFSgd6fdbiX4Xhprw8TfNu6FXq2/Rv4coOSNRaD9ZduP10j
 SCP/YbXxGSJM0FrWjiArMumVGMYdmTo=
X-Google-Smtp-Source: APXvYqzNNI9Du+xRxsCKw1VzycxoWucOkpXhzrO4WrVVITt5Iw/xWjwgcQwpvl5mdBWga1NmkljVnw==
X-Received: by 2002:a19:f619:: with SMTP id x25mr37489451lfe.146.1577723046516; 
 Mon, 30 Dec 2019 08:24:06 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170])
 by smtp.gmail.com with ESMTPSA id e9sm10892474ljp.75.2019.12.30.08.24.06
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Dec 2019 08:24:06 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id w1so11815761ljh.5
 for <xen-devel@lists.xenproject.org>; Mon, 30 Dec 2019 08:24:06 -0800 (PST)
X-Received: by 2002:a2e:5304:: with SMTP id h4mr40480802ljb.75.1577723046138; 
 Mon, 30 Dec 2019 08:24:06 -0800 (PST)
MIME-Version: 1.0
From: Wei Liu <wl@xen.org>
Date: Mon, 30 Dec 2019 16:23:50 +0000
X-Gmail-Original-Message-ID: <CAK9nU=oNdkB0hmREt+qCzNThctOD85Lameo5k0jGPc1oNoSZSg@mail.gmail.com>
Message-ID: <CAK9nU=oNdkB0hmREt+qCzNThctOD85Lameo5k0jGPc1oNoSZSg@mail.gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [Xen-devel] Discovering L0 hypervisor features from L2
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <liuwe@microsoft.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsCgpPbmUgb2YgdGhlIHRoaW5ncyByZXF1aXJlZCB0byBtYWtlIGEgWGVuIHN5c3RlbSBy
dW4gd2VsbCBvbiBIeXBlci1WIGlzCnRvIG1ha2UgRG9tMCB1c2UgYXMgbWFueSBwYXJhdmlydHVh
bGlzZWQgaW50ZXJmYWNlcyBhcyBwb3NzaWJsZS4KCkZvciBzdGFydGVycywgd2Ugd291bGQgcmVh
bGx5IHdhbnQgRG9tMCBMaW51eCBrZXJuZWwgdG8gdXNlIEh5cGVyLVYncyBQVgpkcml2ZXJzLiBC
dXQgdGhlIGNvcmUgVk1CdXMgZHJpdmVyIGlzIGdhdGVkIGJ5IGNwdWlkIGxlYXZlcy4gSWYgY3B1
aWQKcmV0dXJucyBYZW4ncyBzaWduYXR1cmUsIFZNQnVzIGRyaXZlciB3b24ndCBiZSBsb2FkZWQu
CgpXZSB3aWxsIHdhbnQgdG8gZGlmZmVyZW50IG1ldGhvZCBvdGhlciB0aGFuIGNwdWlkIGxlYXZl
cyB0byBjb21tdW5pY2F0ZQp0byBMaW51eCAidGhpcyBYZW4gaHlwZXJ2aXNvciBpcyBydW5uaW5n
IG9uIHRvcCBvZiBIeXBlci1WLCB0aHVzIGl0IGlzCm9rYXkgdG8gdXNlIEh5cGVyLVYgZHJpdmVy
cyIuIFdlIG1heSBhbHNvIHdhbnQgdG8gYmUgYWJsZSB0byBpbmRpY2F0ZQp3aGF0IGZlYXR1cmVz
IGFyZSBhdmFpbGFibGUgZGlyZWN0bHkgZnJvbSBMMC4KClRoZXJlIGFyZSBzZXZlcmFsIHdheXMg
b2YgZG9pbmcgdGhpczoKCjEuIFVzZSBhIGh5cGVydmlzb3Igc3BlY2lmaWMgY3B1aWQgbGVhZi4K
Mi4gVXNlIGFuIE1TUiByZXNlcnZlZCBmb3Igc29mdHdhcmUgdXNlLgozLiBVc2UgYSBoeXBlcmNh
bGwuCgpJIGdlbmVyYWxseSBwcmVmZXIgZ29pbmcgd2l0aCBlaXRoZXIgMSBvciAyLgoKTGFzdCBi
dXQgbm90IGxlYXN0LCB3ZSBzaG91bGQgbWFrZSB0aGUgZGlzY292ZXJ5IG1lY2hhbmlzbSBnZW5l
cmljIGZvcgphbnkgTDAgaHlwZXJ2aXNvciwgc3VjaCB0aGF0IHdlIGNhbiBlYXNpbHkgYWRkIHN1
cHBvcnQgZm9yIHJ1bm5pbmcgWGVuCmluIEwwIGluIHRoZSBmdXR1cmUuCgpUaG91Z2h0cywgY29t
bWVudHMgYW5kIHByZWZlcmVuY2VzPwoKVGhhbmtzLApXZWkuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs

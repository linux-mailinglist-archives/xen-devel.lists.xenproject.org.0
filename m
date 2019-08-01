Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A467D907
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 12:08:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ht7xT-0008UV-46; Thu, 01 Aug 2019 10:05:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H9Oh=V5=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1ht7xR-0008UQ-G7
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 10:05:13 +0000
X-Inumbo-ID: d949411e-b443-11e9-8980-bc764e045a96
Received: from mail-io1-xd41.google.com (unknown [2607:f8b0:4864:20::d41])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d949411e-b443-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 10:05:11 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id k20so142992114ios.10
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 03:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3OTCKeV8H1LJBg+jZ396pAsq0FtyP5Ofc66JLc8fK5U=;
 b=Kvw8F6GSUkBDGjTyeS3Z1E+5llmoIs4hAvQ78BFwrpBKtRCVfbhCILiYu2RecLMIKA
 Mrjrc+dzGghXuhw3hZe4i8Eujwk9ZqRlruI8rpE4jDLcH+BoS9mFP0o+TYrVc+0CxjXr
 cNEkP7H21hsd8ZqKVSL/cWKtN7MjWvTmdmEuUcYyQnR/gfoMjUv8dLDmXCFbEmvP2CYw
 7F5FsjSB8GyN+bvA342Gyuj+5DX2sX7ACeNQ+HeuVSfe9+e5yvZMogshFY+O3J2NO5+o
 qtfMM+YREJ5cSy5epVEJJqb+lC6yCH75qaG1VLDWWsf1UBlc+zgYHKzMfYN0SAnY2T3Q
 UY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3OTCKeV8H1LJBg+jZ396pAsq0FtyP5Ofc66JLc8fK5U=;
 b=ZcwmUyJ0XsHaej9AN314ijUEAXHhMnrgjthmaJNYQ8M2csWEiXi/UqZm9tihXzIFX/
 XVRp5dR50Qit0t4bH0fZFEj+/obh3aB95+RLnwn3uQwSmfCogNwGUhlUjtn0aw3/qUV3
 IoQhHDfczHEvPfakDdZd2ZLO4/uMKIbCBL83EI3k/FVAcCoywEEgDpiQj5JfnE4OsY53
 ACO0K4Lmps+4HJ3BlouDhCwDpCG/GczhrN/LmXp1lkTNwgdo003/Q3EOy0wEf9SceoE2
 jTkyrdHAeFsXkBDyjzm3UeF1XdGjTYNjxIIcWTlHu7I8PeAraV7ER7povmnToajLb4G5
 QBBw==
X-Gm-Message-State: APjAAAXjpcVUQDaLgB8DfFtMO/L6A4j0ezGs+ywi2nkK8lFHy/dJN9KR
 tk7VxfrputYwEhYuL0hjo/ojH3NzD+GbiNTRSyU=
X-Google-Smtp-Source: APXvYqyL4eIzdH3jQ8Q4nla5NDNnOqG1eJweiYEE+QrkcD7F1FbWBoRrbC/3lhwXgtZlPrBygEYvyBrQBu1wf1lrZPs=
X-Received: by 2002:a02:b016:: with SMTP id p22mr46451245jah.121.1564653910857; 
 Thu, 01 Aug 2019 03:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAOcoXZavLnHhNc7mmHnO5Gi_vq-0j1FCgvpXh0NimAewXX8e1g@mail.gmail.com>
 <5B61E054-048E-46BF-9952-382FA65893EE@gmail.com>
 <ab635236-6dac-0f8f-8bab-46ccbc9d47e2@arm.com>
 <CAOcoXZYw0uC+2c5KAVMhvXRukYomAuhSVW=jWU3HH1sX6zgkaQ@mail.gmail.com>
 <685e081c-b374-7d66-4645-d6ee7a02f655@arm.com>
 <CAOcoXZZ5HWYrDEy966BN-Esaci2XD=H98kn1JNwjAU_DUW_Egg@mail.gmail.com>
 <d5e1b66e-4d94-6ec5-96e4-54fb77c44eaa@arm.com>
 <CAOcoXZbapuZ3FhDP2cZ+C9JEJwCZUp03h-6eTbynqk5RGWF+3g@mail.gmail.com>
 <efbb6de5-3454-ad61-e3e6-07c7bdb0def7@arm.com>
 <CAOcoXZYKXqXa=M2LvcGMDrufh9snhSQvCX_qBFr63sn=fgDo=w@mail.gmail.com>
 <1CE4B542-C03C-4B21-AC92-145F7B9B63BB@gmail.com>
 <CAOcoXZaL3OwVcNsOUkUVw4Wo6ts8YQkuQ60vz+-H573Zwvuy2g@mail.gmail.com>
In-Reply-To: <CAOcoXZaL3OwVcNsOUkUVw4Wo6ts8YQkuQ60vz+-H573Zwvuy2g@mail.gmail.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Thu, 1 Aug 2019 13:04:59 +0300
Message-ID: <CAOcoXZbibFp02xus2VaJ6i2sh04--R6Cj_Wc+NhWOhSb_z2ZMA@mail.gmail.com>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: [Xen-devel] Xen Coding style and clang-format
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
 Julien Grall <julien.grall@arm.com>, Committers <committers@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgODowNSBQTSBWaWt0b3IgTWl0aW4gPHZpa3Rvci5taXRp
bi4xOUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgNzoyNyBQ
TSBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoLnhlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBWaWt0
b3I6IHRoYW5rIHlvdSBmb3Igc3BlbmRpbmcgdGltZSBvbiB0aGlzCj4gPgo+ID4gSSBhZGRlZCBh
biBpdGVtIHRvIGNvbW11bml0eSBjYWxsIHRvbW9ycm93IGFuZCBDQydlZCB5b3UgaW4gdGhlIGlu
dml0ZS4gU28gSSB0aGluayB3aGF0IHdlIG5lZWQgdG8gZG8gaXMgZmlndXJlIG91dCBhIHdheSBv
biBob3cgdG8gbWFrZSB0aGUgY29kaW5nIHN0YW5kYXJkIGVuZm9yY2VhYmxlIGJ5IGEgY29kaW5n
IHN0YW5kYXJkIGNoZWNrZXIgc3VjaCBhcyBwcm9wb3NlZCBoZXJlLiBBRkFJQ1QKPiA+ICogSXQg
c2VlbXMgdGhlcmUgYXJlIHNvbWUgdW5kb2N1bWVudGVkIGNvZGluZyBzdGFuZGFyZCBydWxlcywg
d2hpY2ggYXJlIGVzc2VudGlhbGx5IGNhdXNpbmcgcHJvYmxlbXMgd2l0aCB0aGUgdG9vbAo+ID4g
KiBJbiBhZGRpdGlvbiwgdGhlIGZhY3QgdGhhdCB0aGUgTExWTSBjb2Rpbmcgc3R5bGUgaXMgdGhl
IGJhc2VsaW5lIGZvciB0aGUgY2hlY2tzIG1heSBhbHNvIGNyZWF0ZSBzb21lIHByb2JsZW1zIHdp
dGggZmFsc2Ugc3RhbmRhcmQgdmlvbGF0aW9ucwo+ID4KPiA+IE15IGluc3RpbmN0IHdvdWxkIGJl
IHRvIHRyeSBhbmQgZG9jdW1lbnQgYW55IHVuZG9jdW1lbnRlZCBydWxlcyBvbiBhIHNjcmF0Y2gg
c3BhY2UgKGUuZy4gZ29vZ2xlIGRvYyksIGxvb2sgYXQgZGlmZmVyZW5jZXMgYmV0d2VlbiBYZW4g
YW5kIExMVk0gZm9ybWF0dGluZyBzdHlsZSBhbmQgdGhlbiBtYWtlIGRlY2lzaW9ucyB1c2luZyBh
IHZvdGluZyBtZWNoYW5pc20gdG8gYXZvaWQgYmlrZS1zaGVkZGluZy4gSW4gc29tZSBjYXNlcyBk
aXNjdXNzaW9uIG1heSBiZSBuZWNlc3NhcnkgdGhvdWdoCj4gPgo+ID4gSXQgd291bGQgYmUgZ29v
ZCBpZiB5b3UgY291bGQgYXR0ZW5kLCBidXQgSSB0aGluayB3ZSBjYW4gZG8gd2l0aG91dCB5b3Us
IGlmIG5lZWRlZAo+ID4KPgo+IExhcnMsIHRoYW5rIHlvdSBmb3IgdGhlIGludml0YXRpb24uIEkg
d2lsbCB0cnkgdG8gam9pbiB0aGUgY2FsbC4KPiBTZWVtcyB0aGUgdG9waWMgaXMgbm90IGEgc2lt
cGxlIG9uZSwgdGhlcmUgYXJlIGEgbG90IG9mIHRoaW5ncyB0byBkaXNjdXNzIGl0LgoKUGxlYXNl
IGJlIGF3YXJlIHRoYXQgdGhlIHJlcG8gd2l0aCB4ZW4gY2xhbmctZm9ybWF0IGhhcyBiZWVuIGNy
ZWF0ZWQKdW5kZXIgdGhlIG5leHQgbGluayAoYnJhbmNoIHhlbi1jbGFuZy1mb3JtYXQpOgpodHRw
czovL2dpdGh1Yi5jb20veGVuLXRyb29wcy9sbHZtLXByb2plY3QvdHJlZS94ZW4tY2xhbmctZm9y
bWF0CgpUaGUgbmV4dCBzY3JpcHQgY2FuIGJlIHVzZWQgYXMgYW4gZXhhbXBsZSBvZiBob3cgdG8g
YnVpbGQgY2xhbmctZm9ybWF0OgpodHRwczovL2dpdGh1Yi5jb20vdmlrdG9yLW1pdGluL3hlbi1j
bGFuZy1mb3JtYXQtZXhhbXBsZS9ibG9iL21hc3Rlci9idWlsZF9jbGFuZ19mb3JtYXQuc2gKCkkn
dmUgYWRkZWQgYSBjb3VwbGUgbW9yZSB1cGRhdGVzIGRpc2N1c3NlZCB0aGVzZSBkYXlzOgotIE1h
eCBsaW5lIGxlbmd0aCBmcm9tIDgwIHRvIDc5IGNoYXJzOwotIFNldCBCcmVha1N0cmluZ0xpdGVy
YWxzIHRvIGZhbHNlLgoKUGxlYXNlIHNlZSB0aGUgdXBkYXRlZCB4ZW4tY2xhbmctZm9ybWF0IHN1
bW1hcnkgYmVsb3c6CgpTdW1tYXJ5IG9mIHRoZSBjaGFuZ2VzOgotIEFkZGVkIDMgbmV3IGZvcm1h
dHRpbmcgc3R5bGVzIHRvIGNvdmVyIGFsbCB0aGUgY2FzZXMgbWVudGlvbmVkIGluClhlbiBjb2Rp
bmcgc3R5bGUgZG9jdW1lbnQ6IFhlbiwgTGlieGwsIExpbnV4OwotIEFkZGVkIGxpc3Qgb2YgdGhl
IGZpbGVzIGFuZCBjb3JyZXNwb25kaW5nIHN0eWxlIG5hbWUgbWFwcGluZ3M7Ci0gQWRkZWQgaW5k
ZW50YXRpb24gYWNjb3JkaW5nIHRvIFhlbiBjb2Rpbmcgc3R5bGU7Ci0gQWRkZWQgd2hpdGUgc3Bh
Y2UgZm9ybWF0dGluZyBhY2NvcmRpbmcgdG8gWGVuIGNvZGluZyBzdHlsZTsKLSBBZGRlZCBicmFj
aW5nIHN1cHBvcnQgZXhjZXB0aW9uIGZvciBkby93aGlsZSBsb29wczsKCkFkZGVkIHRvIGNsYW5n
LWZvcm1hdCwgaG93ZXZlciwgcHJvYmFibHkgdGhpcyBsb2dpYyBzaG91bGQgYmUgbW92ZWQgdG8K
cHl0aG9uIHBhcnQgKHNlZSBrbm93biBjbGFuZy1mb3JtYXQgbGltaXRhdGlvbnMgYWJvdmUpOgot
IEJyYWNlcyBzaG91bGQgYmUgb21pdHRlZCBmb3IgYmxvY2tzIHdpdGggYSBzaW5nbGUgc3RhdGVt
ZW50LiBOb3RlOgp0aGVzZSBicmFjZXMgd2lsbCBiZSByZXF1aXJlZCBieSBNSVNSQSwgZm9yIGV4
YW1wbGUsIHNvIGl0IGlzIHByb2JhYmx5CndvcnRoIGFkZGluZyBzdWNoIGEgcmVxdWlyZW1lbnQg
dG8gdGhlIGNvZGluZyBzdHlsZS4KLSBDb21tZW50cyBmb3JtYXQgcmVxdWlyZW1lbnRzLiBOb3Rl
OiAvLy1zdHlsZSBjb21tZW50cyBhcmUgZGVmaW5lZCBpbgpDOTkgYXMgd2VsbCwgYW5kIG5vdCBq
dXN0IGluIHRoZSBjYXNlIG9mIEMrKy4gQzk5IHN0YW5kYXJkIGlzIDIwLXllYXJzCm9sZOKApgoK
VG8gYmUgYWRkZWQ6Ci0gRW1hY3MgbG9jYWwgdmFyaWFibGVzLiBPcGVuIHBvaW50czogV2h5IHRv
IGtlZXAgZW1hY3MgbG9jYWwKdmFyaWFibGVzIGluIFhlbiBjb2RlPyBXaGF0IGFib3V0IG90aGVy
IGVkaXRvcnMnIGNvbW1lbnRzICh2aW0pPwotIFdhcm5pbmcgdG8gc3RkZXJyIGluIHRoZSBjYXNl
IHdoZW4g4oCYdW5maXhhYmxl4oCZIGxpbmUvcyBkZXRlY3RlZC4KClRvIGJlIGZpeGVkOgotIERp
c2FibGUgLy8gY29tbWVudHM7CgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=

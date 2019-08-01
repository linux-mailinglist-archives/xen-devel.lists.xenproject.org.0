Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4197DE46
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 16:53:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htCPd-0007WU-9m; Thu, 01 Aug 2019 14:50:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H9Oh=V5=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1htCPb-0007WF-Vf
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 14:50:36 +0000
X-Inumbo-ID: b7ad08eb-b46b-11e9-8980-bc764e045a96
Received: from mail-io1-xd42.google.com (unknown [2607:f8b0:4864:20::d42])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b7ad08eb-b46b-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 14:50:35 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id k20so144906496ios.10
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 07:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UVyHlQ4kZG6u1DpnqFrHJ7ape8c8NtXwfusU5R3Epfk=;
 b=nqj3hhby634q/cQK6x0CQtI3HaeE0C9qCrsy+xnKHmXlCh328vujWrnVTwn3zIpFjX
 pLJoM68b1HyGdPazWBSQa7BGsq3f9HGoSNudCq4zMjqmNcT8yI3e0wRJ4RvvkIIE6JVY
 AosqCf9LImCmXFMDHP+jRpQkfglKqZBs8NI/hl+zMgSzT4Zh6gLRl0hYhhWLtS2DBtzw
 9M+3SzE7cpvhd4UuPvpVcPUVxGi8t6DjoNN27tR1h025yxDHYR1nxvbwOjdXxMr/tEZ5
 ltEjZqnlAmRVCD2YmbH2JMXXoSU79AezD7JR7c1fXcdNKT6rptHYJvafQZ8NIHYWT0ra
 ElNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UVyHlQ4kZG6u1DpnqFrHJ7ape8c8NtXwfusU5R3Epfk=;
 b=J/hhX7srnyIvVNZRz8ymH/Wffu3cZigKDz0JFjlHczNJS2r10IFmiOu9CKGAbIQBFv
 irpynD1SmS9rufQPqvSpj30R5M04qiaxtvteb5HBEon35RKE0F+YIWx9nl6j0kVWRxiT
 KliVVnJV+BDpqlgFAMCpd//g3pcXRIkuZsdJj064WNrsPFas1IuLSFd5p/Mu/VLJI4zi
 CcFLaJiBVkWegEsjVPyRBA0LLQ6LpCX1aK6OQrE1mQgbBRAwRK/524rLsbq44toTGFiQ
 7WBQBLQoPbCQTkdo8KWnzhppFz9rrMDR3eE5+6s4Q2q6N6Ni17VqU+Zqf6i//raXV6Rx
 DUhg==
X-Gm-Message-State: APjAAAVBzKbvrH73arpy3c7oYMTyMJf1zNnU4as3R47nCKl3L5MnVAr9
 ixfBYiqbVrpYSQfANjsAfwN+s2MNCHW5wA7803A=
X-Google-Smtp-Source: APXvYqx1h5JCBydWAJj7HdmUsSCqzrNI3LjHoXzRbjoHJ8Lb2qjnXxYwQuDwN5LYrWOeUiNYI+fE+JVBlLtvXYkLC18=
X-Received: by 2002:a02:4484:: with SMTP id
 o126mr133749218jaa.34.1564671034355; 
 Thu, 01 Aug 2019 07:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190731102856.23215-1-viktor.mitin.19@gmail.com>
 <878sseieu1.fsf@epam.com>
 <CAOcoXZatOXLnvYjum+EGCwnxDRUG1eGJbeENQcSyNYX6JXFizw@mail.gmail.com>
 <15e988be-80bd-f729-ea39-8e7cbc16007f@arm.com>
 <CAOcoXZZbu5-RSJxM8jzDh4EQbq8O11prOkJfrrzqWT45ppCzFQ@mail.gmail.com>
 <c7ce6c8d-3b79-8510-a4df-9d95e3adc6c0@arm.com>
 <269AA3CE-4B2D-4651-B65D-907E64B43473@xenproject.org>
 <6b3a71b6-4040-9e42-4f83-daa07f2ae15b@arm.com>
 <6AD2FCDA-857C-4611-9797-16CD3BD8B2AF@gmail.com>
In-Reply-To: <6AD2FCDA-857C-4611-9797-16CD3BD8B2AF@gmail.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Thu, 1 Aug 2019 17:50:23 +0300
Message-ID: <CAOcoXZbUBhBGW0k+FYnrR4uUDYQz0byK=O=z0NwhEm1_d-kwTg@mail.gmail.com>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: [Xen-devel] [PATCH v4 1/2] xen/arm: extend
 fdt_property_interrupts
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
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Viktor Mitin <Viktor_Mitin@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+IEl0IGlzIG5vdCBleHBsaWNpdGx5IHdyaXR0ZW4gaW4gdGhlIHdpa2kgcGFnZS4gQnV0IGl0
IGlzIGltcGxpZWQgaW4gYSBmZXcgcGxhY2VzIHN1Y2ggYXMgaW4gdGhlIHNlY3Rpb24gIlByb3Zp
ZGluZyBhIGdpdCBicmFuY2giLCAiVXNpbmcgZ2l0IHNlbmQtZW1haWwgYWxvbmUiLgo+Cj4gWW91
IGFyZSByaWdodC4gVGhhdCBzaG91bGQgYmUgbWFkZSBleHBsaWNpdC4gSSB0aGluayB5b3UgYXJl
IHRoZSBvbmx5IHBlcnNvbiBpbiB5ZWFycyB0aGF0IHNlbnQgYSBzZXJpZXMgd2l0aG91dCBjb3Zl
ciBsZXR0ZXIKPgo+IEkgd2lsbCBoYXZlIGEgZ28gb3ZlciB0aGF0IHBhZ2UgaW4gdGhlIG5leHQg
ZmV3IGRheXMgcmVkdWNpbmcgdGhlIG9wdGlvbnMgYW5kIG1ha2luZyBpdCBtb3JlIHN0cmljdCBh
bmQgY2xlYXIKPgo+IEl0IHdvdWxkIGJlIGdvb2QgaWYgeW91IGNvdWxkIGdvIG92ZXIgaXQsIG9u
Y2UgSSBhbSBkb25lLCBhbmQgbGV0IG1lIGtub3cgd2hldGhlciBpdCBpcyBjbGVhcmVyCgpMYXJz
LCBzdXJlLCB3aWxsIGdvIG92ZXIgaXQgb25jZSBpdCByZWFkeS4gQlRXIHdoYXQgaXMgdGhlIHBv
bGljeSBmb3IKZWRpdGluZyBYZW4gd2lraT8gSXMgdGhlcmUgc29tZSBhY3R1YWwgcG9pbnRlciB0
byByZWFkIGFib3V0IGl0LCBmb3IKZXhhbXBsZSwgd2hvIGlzIGFsbG93ZWQgdG8gZWRpdCBpdCwg
d2hhdCBhcmUgdGhlIHJ1bGVzLCBldGM/CgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=

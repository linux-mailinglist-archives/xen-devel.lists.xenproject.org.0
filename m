Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B222023010
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 11:19:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSeQQ-0001ln-Rr; Mon, 20 May 2019 09:17:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z/e/=TU=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hSeQO-0001lf-QU
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 09:17:40 +0000
X-Inumbo-ID: 1d89082d-7ae0-11e9-8980-bc764e045a96
Received: from mail-it1-x129.google.com (unknown [2607:f8b0:4864:20::129])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1d89082d-7ae0-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 09:17:40 +0000 (UTC)
Received: by mail-it1-x129.google.com with SMTP id i10so1132035ite.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2019 02:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lbJGtu86pee7SfGKjnljlwEy/+ilsvRvdqzS/WbYXHY=;
 b=O22TsUFcHeZ6OEexgG6wDW7LRsagCaIq6Pjq1Kne/iGzcbDuM59ifoz0fd19YvYN1E
 +udTpdTZxdLISCfiC6v1L9GND2yoamDUXcCaCgFRDtKae3EAs0w4wiQwirkeCsUbfBf/
 vHpjcwF7x0EPF2di310NhEJYbYHmH/xVJV/3x6gdq15H3uxA6vpMg7qVymLDjK5DVjkF
 d6t9sdu47+lfh2XzcTJ1A1ZzFhjr1O9gg4+WnEAqwu5fyfGqwXuYtLRwCeOyaibCUcmk
 TaZGG5Gwm+c4bjw5fwzVCRUPosPETdDiHnCFFBPUmrwivQaPu31Nz8X6hLZ50oQWRO19
 3N+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lbJGtu86pee7SfGKjnljlwEy/+ilsvRvdqzS/WbYXHY=;
 b=HyAj6k2WsWDHn7ASA6+uiQcquxWLOZdJt0bxWZz28XRuGAp3WFGJoRr8SDn4n2MJFa
 JaMDnCoJnQtdEw80D4kUWXF7R2You6F94CS3DckuTig+rwzhzOMEp4sRKflN4/frhNTi
 89SLS8V1u+J70CC+8sRUJx1+pzQv0oOKYNVdlIFfqwtrUPKuiKeq98SAsaPwPB7Aiiaj
 0GbtlQtRHtrtiQweYCcBrfKYOpS9d9yTUvW9llvirwjxJrIaVGuVyAFu7NOc1q6kYJIe
 wXVEfPQjWp16UGuqhXm+ebd4vgibOI3WV4MNoA+3ams9duQtq0S0wPLuWNSFPSn31I1L
 /OQg==
X-Gm-Message-State: APjAAAUM/Q7hFCI0x7HrfAREOips0JY/ImWtpE4AB9Jc1FRTg7Y/vRcT
 uO2O2whN4eF6cBk2MqOGB6Fh7cuCkgnW2vxkcDY=
X-Google-Smtp-Source: APXvYqyk8/QCOY6Q0V9rPROJ674JtM6FZo+w5j8uCoRgvZDFiTqid0jg2vRBx80xBrMV3W/jsyr7qD0v18gD7mAiOLM=
X-Received: by 2002:a24:440c:: with SMTP id o12mr13257487ita.145.1558343859436; 
 Mon, 20 May 2019 02:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAOcoXZZZbKOXkNQNqFgp9BSRUHnovDqZ4TfV_aMh+h9BcC6Qnw@mail.gmail.com>
 <5CDEA9CC020000780023017C@prv1-mh.provo.novell.com>
 <CAOcoXZa=KriCu6KP0Ju-sFdNx8xgz91FgXTbimGGC7tAk=BsXg@mail.gmail.com>
 <5CDECD540200007800230246@prv1-mh.provo.novell.com>
In-Reply-To: <5CDECD540200007800230246@prv1-mh.provo.novell.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Mon, 20 May 2019 12:17:28 +0300
Message-ID: <CAOcoXZYeoUt9bf2Uv7-pbhFV+bnaz0hvxPKc9A9CnjcUc1bDuA@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] libxc: Casting of xen virtual address type
 xen_vaddr_t to signed int64 type: (int64_t)vaddr
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+IE1lYW4gdGhhdCByZXN1bHQgb2YgIihpbnQ2NF90KXZhZGRyID4+IDYzIiBjYW4gYmUgMCBv
ciAxLgo+ID4gU28gdGhlIG5leHQgY29kZSBtYXkgbm90IHdvcmsgcHJvcGVybHkgaW4gY2FzZSBv
ZiBhbm90aGVyICdpbXBsZW1lbnRhdGlvbnMnLgo+ID4gV2l0aCBhbm90aGVyIGNvbXBpbGVyIChp
LmUuIGNsYW5nLCBldGMpIHRoaXMgY29kZSBtYXkgaW50cm9kdWNlIGJ1Z3MKPiA+IHdoaWNoIGFy
ZSBoYXJkIHRvIGZpbmQuCj4gPgo+ID4gKChpbnQ2NF90KXZhZGRyID4+IDQ3KSA9PSAoKGludDY0
X3QpdmFkZHIgPj4gNjMpCj4gPgo+ID4gRm9yIHRoaXMgcmVhc29uIGl0IGlzIGJldHRlciB0byBh
dm9pZCBpbXBsZW1lbnRhdGlvbi1kZWZpbmVkIGNvZGUuCj4KPiBXZWxsLCBpZGVhbGx5IHdlJ2Qg
bGlrZSB0byBnZXQgYXdheSB3aXRob3V0IHVzaW5nIGltcGxlbWVudGF0aW9uCj4gZGVmaW5lZCBi
ZWhhdmlvci4gQnV0IEknbSBhZnJhaWQgd2UncmUgcXVpdGUgZmFyIGZyb20gdGhhdCwgYW5kCj4g
d2UnZCBub3QgYWx3YXlzIGJlIHdpbGxpbmcgdG8gYWNjZXB0IHRoZSB3b3JzZSBzb3VyY2UgYW5k
L29yCj4gYmluYXJ5IGNvZGUgdGhhdCB3b3VsZCBiZSBuZWVkZWQgdG8gYXZvaWQgaXQuCgpIb3cg
YWJvdXQgdXNpbmcgdGhlIG5leHQgb25lLWxpbmVyIHRvIGF2b2lkIGltcGxlbWVudGF0aW9uLWRl
ZmluZWQgY29kZSA6CgovL1JldHVybnMgdHJ1ZSBpbiBjYXNlIHdoZW4gdGhlIHRvcCBsZWZ0IDE3
IGJpdHMgYXJlIGFsbCB6ZXJvIG9yIGFyZSBhbGwgb25lCnJldHVybiAoKCEodmFkZHIgPj4gNDcp
KSB8fCAoKCh2YWRkciA+PiA0NykmMHgxRkZGRikgPT0gMHgxRkZGRikpCgpBZ3JlZT8KClRoYW5r
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

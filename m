Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37674138D3F
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 09:53:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iqvQX-0003Jj-VY; Mon, 13 Jan 2020 08:50:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3ec7=3C=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iqvQW-0003Je-Gb
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 08:50:24 +0000
X-Inumbo-ID: bc6312a2-35e1-11ea-a985-bc764e2007e4
Received: from mail-pj1-x1042.google.com (unknown [2607:f8b0:4864:20::1042])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc6312a2-35e1-11ea-a985-bc764e2007e4;
 Mon, 13 Jan 2020 08:50:23 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id u63so3271207pjb.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2020 00:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L1SKSUAyoD/bHOLJkon4lyQ5GdcL2lV4qAInB435n8c=;
 b=LjyNLkR7Qv+wJCQHCAT43JYwfTl+f9ihM3ALPFf56ZmfzCTarCGdSkSHe5sAeG4xT2
 8Ijp7HtX716s/+Gd8IGnxg1850eDaOvH2kuiBErWUvZ8NL9EBuRx5hK7rj+MXdUkQBPA
 chEz0/IyaBkHeo62pPI5Xi8K0HfCgeCX0GJVHUPQBcNdIuWRUKfzOXnZjbgRm035bGYZ
 hfXkNQ1SpljfObfN+lis+8uk3KsRO3OA9IX85t8OTlarfABlnPKozde9N2Wwtq7xolid
 5Q623h7Njc+42wrHFnDq85r4e79QQ2bcw9YtNLeaEpwifS9Bf6Jb37KMzD0J9V+uJtxB
 hNgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L1SKSUAyoD/bHOLJkon4lyQ5GdcL2lV4qAInB435n8c=;
 b=ttyQ+z7MppdNv7cO0HoRvYXdCwFfS9B90OwywCHXf7Lecy3tNu15/ZXTV0hJ+HLILx
 KTcCpBIamO7E+GIt8RcqA/Qd31AnXmUpAk/P+JwspSU66SznEpJI6oJtgEkg1cymDQdK
 IthLfIZTSWnJ/doMNQIOYT+kQqHW9/e7irCU7QQ6W1CMZdB+NdyR4KnqMRcW2GPtuIXL
 8Ib2aVXP7G6WjyUNQHw6I44lKaA2vhB9lSai4JhvGXx0vpDbnQvi3GH03mOE9Y6TXDIk
 qC+tGniyJufd4/eQR0AZL777iP5qWKwi1pXS/dvqKLTT1YrC82a1zoEJPmdo5FT5q4s7
 jC1Q==
X-Gm-Message-State: APjAAAWf8Ib9Yzkelpv/AbS9euVtP3dgvR1jvTCOc/1VWhPOzlV0ICWw
 7aex9JlwI3oU5woZ7QyxjF/sxW5Ck8IrlO8Xj0U=
X-Google-Smtp-Source: APXvYqy6W8yd0QUxnJYi/zVBl+awg1E5YRwX4vixK8CCy4auxM5lf9WVJcShGpD8J0a35k8jH6CrhDCKhcsd+ZBTixk=
X-Received: by 2002:a17:902:be0c:: with SMTP id
 r12mr19207296pls.148.1578905422751; 
 Mon, 13 Jan 2020 00:50:22 -0800 (PST)
MIME-Version: 1.0
References: <20200110194158.14190-1-vsementsov@virtuozzo.com>
 <20200110194158.14190-3-vsementsov@virtuozzo.com>
In-Reply-To: <20200110194158.14190-3-vsementsov@virtuozzo.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Mon, 13 Jan 2020 08:50:11 +0000
Message-ID: <CACCGGhD+v3cPdrU0ZCctO3SCpN7yHJcd9=J6AwTrrYWZdHrTZA@mail.gmail.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [Xen-devel] [PATCH v6 02/11] error: auto propagated local_err
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Laszlo Ersek <lersek@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Max Reitz <mreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAxMCBKYW4gMjAyMCBhdCAxOTo0MiwgVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tp
eQo8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3cm90ZToKW3NuaXBdCj4gKy8qCj4gKyAqIEVS
UlBfQVVUT19QUk9QQUdBVEUKPiArICoKPiArICogVGhpcyBtYWNybyBpcyBjcmVhdGVkIHRvIGJl
IHRoZSBmaXJzdCBsaW5lIG9mIGEgZnVuY3Rpb24gd2hpY2ggdXNlCj4gKyAqIEVycm9yICoqZXJy
cCBwYXJhbWV0ZXIgdG8gcmVwb3J0IGVycm9yLiBJdCdzIG5lZWRlZCBvbmx5IGluIGNhc2VzIHdo
ZXJlIHdlCj4gKyAqIHdhbnQgdG8gdXNlIGVycm9yX3ByZXBlbmQsIGVycm9yX2FwcGVuZF9oaW50
IG9yIGRlcmVmZXJlbmNlICplcnJwLiBJdCdzCj4gKyAqIHN0aWxsIHNhZmUgKGJ1dCB1c2VsZXNz
KSBpbiBvdGhlciBjYXNlcy4KPiArICoKPiArICogSWYgZXJycCBpcyBOVUxMIG9yIHBvaW50cyB0
byBlcnJvcl9mYXRhbCwgaXQgaXMgcmV3cml0dGVuIHRvIHBvaW50IHRvIGEKPiArICogbG9jYWwg
RXJyb3Igb2JqZWN0LCB3aGljaCB3aWxsIGJlIGF1dG9tYXRpY2FsbHkgcHJvcGFnYXRlZCB0byB0
aGUgb3JpZ2luYWwKPiArICogZXJycCBvbiBmdW5jdGlvbiBleGl0IChzZWUgZXJyb3JfcHJvcGFn
YXRvcl9jbGVhbnVwKS4KPiArICoKPiArICogQWZ0ZXIgaW52b2NhdGlvbiBvZiB0aGlzIG1hY3Jv
IGl0IGlzIGFsd2F5cyBzYWZlIHRvIGRlcmVmZXJlbmNlIGVycnAKPiArICogKGFzIGl0J3Mgbm90
IE5VTEwgYW55bW9yZSkgYW5kIHRvIGFkZCBpbmZvcm1hdGlvbiAoYnkgZXJyb3JfcHJlcGVuZCBv
cgo+ICsgKiBlcnJvcl9hcHBlbmRfaGludCkKPiArICogKGFzLCBpZiBpdCB3YXMgZXJyb3JfZmF0
YWwsIHdlIHN3YXBwZWQgaXQgd2l0aCBhIGxvY2FsX2Vycm9yIHRvIGJlCj4gKyAqIHByb3BhZ2F0
ZWQgb24gY2xlYW51cCkuCj4gKyAqCj4gKyAqIE5vdGU6IHdlIGRvbid0IHdyYXAgdGhlIGVycm9y
X2Fib3J0IGNhc2UsIGFzIHdlIHdhbnQgcmVzdWx0aW5nIGNvcmVkdW1wCj4gKyAqIHRvIHBvaW50
IHRvIHRoZSBwbGFjZSB3aGVyZSB0aGUgZXJyb3IgaGFwcGVuZWQsIG5vdCB0byBlcnJvcl9wcm9w
YWdhdGUuCj4gKyAqLwo+ICsjZGVmaW5lIEVSUlBfQVVUT19QUk9QQUdBVEUoKSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICBnX2F1dG8oRXJyb3JQcm9wYWdhdG9yKSBf
YXV0b19lcnJwX3Byb3AgPSB7LmVycnAgPSBlcnJwfTsgIFwKPiArICAgIGVycnAgPSAoKGVycnAg
PT0gTlVMTCB8fCAqZXJycCA9PSBlcnJvcl9mYXRhbCkgICAgICAgICAgICAgXAoKUGVyaGFwcyAh
ZXJycCByYXRoZXIgdGhhbiBlcnJwID09IE5VTEwsIGZvciBicmV2aXR5LgoKICBQYXVsCgo+ICsg
ICAgICAgICAgICA/ICZfYXV0b19lcnJwX3Byb3AubG9jYWxfZXJyIDogZXJycCkKPiArCj4gIC8q
Cj4gICAqIFNwZWNpYWwgZXJyb3IgZGVzdGluYXRpb24gdG8gYWJvcnQgb24gZXJyb3IuCj4gICAq
IFNlZSBlcnJvcl9zZXRnKCkgYW5kIGVycm9yX3Byb3BhZ2F0ZSgpIGZvciBkZXRhaWxzLgo+IC0t
Cj4gMi4yMS4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

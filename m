Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CB6DB861
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 22:37:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLCUE-0004oZ-4I; Thu, 17 Oct 2019 20:35:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YlzT=YK=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iLCUD-0004oU-0a
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 20:35:05 +0000
X-Inumbo-ID: 98ddece8-f11d-11e9-a531-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98ddece8-f11d-11e9-a531-bc764e2007e4;
 Thu, 17 Oct 2019 20:35:03 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id d1so3898474ljl.13
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 13:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RhvgiGHv2AVe6EhSuyT7Hedc27Hq1Uj75ffFhVlQMwA=;
 b=T4LPWO+q5mWPf82mYzExgEvVUzQ9OPdwtAjM/yVPGKRTHXdHsis3y6wB7fG5/i5mpT
 l1erGy8Ax4hFoT/zrdGaLFrhYH45NcGdlL2a7dm3Q60zq1OQzV/Y0y6I5eIBVCTtp1fe
 IkV4ROiiIEjNccBH+xfqPK0RFFQbCO4tJ7vGeRXJ+Ve6/409Y7Q3uKNVhn6tIfz8O1hr
 Rrty0oal01RxHrfQ2nNL1ZQDFU3ca+7+iZQmCYUvpRq2GRsiGtqSrCUMvroRSlpLLU8W
 1JNC2T7GtfXfkA5iR2zpzTQUIaEFyMoHD78kVMwsl5ZYbDin2U9dEULKoA5XrUf2+ZHY
 m4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RhvgiGHv2AVe6EhSuyT7Hedc27Hq1Uj75ffFhVlQMwA=;
 b=a47zjSZmpuVTiROrf/CzC1G8c6Ik8u17/TRfTrIOlJLGvjpBUvXEIOBOfoUKQxXsIS
 GrIoTiIySOd07jKwq1ts9sWyDwn0LIaoCMuWNjFuv20bGo99rj6kPW7Rxm0RExUK65kl
 xzJWXvRZf/j14sLMQM3bgPbKxRyPtwsVYUAJf416vr9kVJPv1I36qdjfprQTHfpcJPQR
 3IpmCUldnSZvwwOlqu10vA8qM2qqX7buhFqTS3mITDuL3g6VzRSj+rySM9cAI+oPaRSi
 KrzJYiDdQi9i8pPYTw6KsBamlKLt/YU1dRzHDugYvXy0BgAoF6bqQ6MyQiO4iMg3hUbY
 PLnw==
X-Gm-Message-State: APjAAAUnp62U9g5BhTl+Ie1qkoZsqzwuQrRQrQ5xmxun7ZmzVVFF2zkN
 MHVTt9XkuzwIkOaHKmfPgS9f3B+gE0Tgcn0YXpw=
X-Google-Smtp-Source: APXvYqyluHCDPnIrjzqdSw1mGQQcC68il5lgKtLLnb/lmnQqnjkMns4gsVI8wGImf3gxJVORPgG+cO83r09VssJks3I=
X-Received: by 2002:a2e:a0ca:: with SMTP id f10mr3623321ljm.83.1571344502829; 
 Thu, 17 Oct 2019 13:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <1570650447-3225-1-git-send-email-brian.woods@xilinx.com>
 <1571342860-15838-1-git-send-email-brian.woods@xilinx.com>
In-Reply-To: <1571342860-15838-1-git-send-email-brian.woods@xilinx.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 17 Oct 2019 21:34:51 +0100
Message-ID: <CAJ=z9a2TxLmtE2nrwYQNVvh3K8upSszYke-PZ8BeaAs2wc0qjQ@mail.gmail.com>
To: Brian Woods <brian.woods@xilinx.com>
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: add warning if memory modules
 overlap
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiBUaHUsIDE3IE9jdCAyMDE5IGF0IDIxOjA4LCBCcmlhbiBXb29kcyA8YnJpYW4ud29v
ZHNAeGlsaW54LmNvbT4gd3JvdGU6Cj4KPiBJdCdzIHBvc3NpYmxlIGZvciBhIG1pc2NvbmZpZ3Vy
ZWQgZGV2aWNlIHRyZWUgdG8gY2F1c2UgWGVuIHRvIGNyYXNoIHdoZW4KPiB0aGVyZSBhcmUgb3Zl
cmxhcHBpbmcgYWRkcmVzc2VzIGluIHRoZSBtZW1vcnkgbW9kdWxlcy4gIEFkZCBhIHdhcm5pbmcK
PiB3aGVuIHByaW50aW5nIHRoZSBhZGRyZXNzZXMgdG8gbGV0IHRoZSB1c2VyIGtub3cgdGhlcmUn
cyBhIHBvc3NpYmxlCj4gaXNzdWUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCcmlhbiBXb29kcyA8YnJp
YW4ud29vZHNAeGlsaW54LmNvbT4KPiAtLS0KPiB2MSAtPiB2Mgo+ICAgICAgICAgLSByZW1vdmVk
IG5lc3RlZCBsb29wIGFuZCBwbGFjZWQgY2hlY2sgaW4gYWRkX2Jvb3RfbW9kdWxlKCkKPgo+IFNh
bXBsZSBvdXRwdXQ6Cj4gLi4uCj4gKFhFTikgTU9EVUxFWzBdOiAwMDAwMDAwMDAxNDAwMDAwIC0g
MDAwMDAwMDAwMTU0MjEyMSBYZW4KPiAoWEVOKSBNT0RVTEVbMV06IDAwMDAwMDAwMDM4NDYwMDAg
LSAwMDAwMDAwMDAzODUwMDgwIERldmljZSBUcmVlCj4gKFhFTikgTU9EVUxFWzJdOiAwMDAwMDAw
MDAzODUzMDAwIC0gMDAwMDAwMDAwN2ZmZjY3NiBSYW1kaXNrCj4gKFhFTikgTU9EVUxFWzNdOiAw
MDAwMDAwMDAwMDgwMDAwIC0gMDAwMDAwMDAwMzE4MDAwMCBLZXJuZWwKPiAoWEVOKSAgUkVTVkRb
MF06IDAwMDAwMDAwMDM4NDYwMDAgLSAwMDAwMDAwMDAzODUwMDAwCj4gKFhFTikgIFJFU1ZEWzFd
OiAwMDAwMDAwMDAzODUzMDAwIC0gMDAwMDAwMDAwN2ZmZjY3Ngo+IChYRU4pCj4gKFhFTikgV0FS
TklORzogb3ZlcmxhcCBkZXRlY3RlZCBpbiB0aGUgbWVtb3J5IG1vZHVsZSBhZGRyZXNzZXMKPiAo
WEVOKQo+IChYRU4pIENvbW1hbmQgbGluZTogY29uc29sZT1kdHVhcnQgZHR1YXJ0PXNlcmlhbDAg
ZG9tMF9tZW09MUcgYm9vdHNjcnViPTAgbWF4Y3B1cz0xIHRpbWVyX3Nsb3A9MAo+IC4uLgo+Cj4g
IHhlbi9hcmNoL2FybS9ib290ZmR0LmMgICAgICB8IDQgKysrKwo+ICB4ZW4vYXJjaC9hcm0vc2V0
dXAuYyAgICAgICAgfCA2ICsrKysrKwo+ICB4ZW4vaW5jbHVkZS9hc20tYXJtL3NldHVwLmggfCAx
ICsKPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyBiL3hlbi9hcmNoL2FybS9ib290ZmR0LmMKPiBpbmRleCAw
OGZiNTlmLi5mOGIzNGQ0IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9ib290ZmR0LmMKPiAr
KysgYi94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCj4gQEAgLTM4Nyw2ICszODcsMTAgQEAgc3RhdGlj
IHZvaWQgX19pbml0IGVhcmx5X3ByaW50X2luZm8odm9pZCkKPiAgICAgICAgICAgICAgICAgbWVt
X3Jlc3YtPmJhbmtbal0uc3RhcnQgKyBtZW1fcmVzdi0+YmFua1tqXS5zaXplIC0gMSk7Cj4gICAg
ICB9Cj4gICAgICBwcmludGsoIlxuIik7Cj4gKwo+ICsgICAgaWYgKCBtZW1fbW9kdWxlX292ZXJs
YXAgKQo+ICsgICAgICAgIHByaW50aygiV0FSTklORzogb3ZlcmxhcCBkZXRlY3RlZCBpbiB0aGUg
bWVtb3J5IG1vZHVsZSBhZGRyZXNzZXMuXG4iKTsKCkFzIGEgdXNlciBzdWNoIG1lc3NhZ2Ugd291
bGQgbGlrZWx5IHB1dCBtZSBvZmYuIFlvdSB0ZWxsIG1lIHRoZXJlIGFyZQphbiBvdmVybGFwLCBi
dXQgeW91IGRvbid0IHByb3ZpZGUgbW9yZSBpbmZvcm1hdGlvbiBldmVuIGlmIHlvdSBsaWtlbHkK
aGF2ZSB0aGUgaW5mb3JtYXRpb24gaW4gcGxhY2UuIEhvd2V2ZXIuLi4KCj4gKwo+ICAgICAgZm9y
ICggaSA9IDAgOyBpIDwgY21kcy0+bnJfbW9kczsgaSsrICkKPiAgICAgICAgICBwcmludGsoIkNN
RExJTkVbJSJQUklwYWRkciJdOiVzICVzXG4iLCBjbWRzLT5jbWRsaW5lW2ldLnN0YXJ0LAo+ICAg
ICAgICAgICAgICAgICBjbWRzLT5jbWRsaW5lW2ldLmR0X25hbWUsCj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9zZXR1cC5jIGIveGVuL2FyY2gvYXJtL3NldHVwLmMKPiBpbmRleCA3MDVhOTE3
Li4zMTVhMTMxIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9zZXR1cC5jCj4gKysrIGIveGVu
L2FyY2gvYXJtL3NldHVwLmMKPiBAQCAtNjksNiArNjksOCBAQCBpbnRlZ2VyX3BhcmFtKCJ4ZW5o
ZWFwX21lZ2FieXRlcyIsIG9wdF94ZW5oZWFwX21lZ2FieXRlcyk7Cj4KPiAgZG9taWRfdCBfX3Jl
YWRfbW9zdGx5IG1heF9pbml0X2RvbWlkOwo+Cj4gK2Jvb2wgX19pbml0ZGF0YSBtZW1fbW9kdWxl
X292ZXJsYXA7Cj4gKwo+ICBzdGF0aWMgX191c2VkIHZvaWQgaW5pdF9kb25lKHZvaWQpCj4gIHsK
PiAgICAgIC8qIE11c3QgYmUgZG9uZSBwYXN0IHNldHRpbmcgc3lzdGVtX3N0YXRlLiAqLwo+IEBA
IC0yNTQsNiArMjU2LDEwIEBAIHN0cnVjdCBib290bW9kdWxlIF9faW5pdCAqYWRkX2Jvb3RfbW9k
dWxlKGJvb3Rtb2R1bGVfa2luZCBraW5kLAo+ICAgICAgICAgICAgICAgICAgbW9kLT5kb21VID0g
ZmFsc2U7Cj4gICAgICAgICAgICAgIHJldHVybiBtb2Q7Cj4gICAgICAgICAgfQo+ICsKPiArICAg
ICAgICBpZiAoICgobW9kLT5zdGFydCA+PSBzdGFydCkgJiYgKG1vZC0+c3RhcnQgPCBzdGFydCAr
IHNpemUpKSB8fAo+ICsgICAgICAgICAgICAgKChzdGFydCA+PSBtb2QtPnN0YXJ0KSAmJiAoc3Rh
cnQgPCBtb2QtPnN0YXJ0ICsgbW9kLT5zaXplKSkgKQo+ICsgICAgICAgICAgICBtZW1fbW9kdWxl
X292ZXJsYXAgPSB0cnVlOwoKLi4uIFdoYXQncyB3cm9uZyB3aXRoIGp1c3QgZHVtcGluZyB0aGUg
aW5mb3JtYXRpb24gaGVyZSBkaXJlY3RseT8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

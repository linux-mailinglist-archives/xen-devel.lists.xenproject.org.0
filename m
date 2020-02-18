Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 819E1162F0B
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 19:52:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j47wL-0001Ut-ML; Tue, 18 Feb 2020 18:49:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SCTr=4G=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1j47wJ-0001Uo-Ah
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 18:49:47 +0000
X-Inumbo-ID: 6f04f538-527f-11ea-bc8e-bc764e2007e4
Received: from mail-oi1-x244.google.com (unknown [2607:f8b0:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f04f538-527f-11ea-bc8e-bc764e2007e4;
 Tue, 18 Feb 2020 18:49:46 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id q84so21186975oic.4
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2020 10:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6ndz9R/2Ak+mICgHOUuAFkqW2EslmCysAANW5wyc+i0=;
 b=OEYPeuzg/u9ffkAmlm1Jp8NRqEI99WkLpvE6YCJ+n79GsARgweL2qq7oCgU3JZn/Tr
 g2KCPZU5LlGadCnAaruwk661QkIV7KCdIEtokVVL2nz5ER8B7HGY9NQMj446urvVkNHV
 xBYhPXsZwoItIpCec6oQHQxuMyGtJRYKGgWlp9hwxATdB0tfezXSbh35CdCj7mfj+he5
 5yZfsbRd8g7mGBnx8a21IQqipWUwOT17asBcIipbeKlYlQJjldT2jL7GsYXW4jkiXFYE
 0yryYYXNwh4HZIjcXOFHLnF3xa73hTru6odMa/zzrjnX3g4oymxi1CiVspEv+RnhUlla
 v6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6ndz9R/2Ak+mICgHOUuAFkqW2EslmCysAANW5wyc+i0=;
 b=QSETQTxfH8JJ+E3w3CZyxoRVVV6HJt3+Y4P2a+yRQSw0HvMHizQJR4hk8H75ik5BRm
 bKtLJEzqa6bAiTXN+bAzBgecFDXBAbcVgCe+ExIdgxKZMoHXGM1qcDYYHzwoSzGzG4/Q
 gnicuVTVbWfvJIC1dhnC/7TgASnBWZyPtjMXrAnWMdrA8+geOVYhqK0wAeHq+2Fr5sJg
 dsyZT3AkBADpDzARJsWV8F68CdLTDNgr9nRNdE5+VKM1eb15StW4Sh64392DbChBZ2Gz
 ANPkW0AFra9kuqRuIZlvVtHqdybX76fDPal0OPtxxi2BZeE6f2jarZ49oENBEB4nHphq
 EsmQ==
X-Gm-Message-State: APjAAAV3nJ2ERF11XLMQPz8EaRS/KptRt8QY0BT0kR9unpK+zET45jfT
 NHOyQMEHL16Ua0YM6kFRSr6Slm72nufIq3qlbBcY1Q==
X-Google-Smtp-Source: APXvYqyVtuGm3F97BkZ9Dz+su/pwUSaiOq3bNc3NwybUJs/P2HmE1EDs0pVB6ZLF87bjbAqQFR1rUjVLZnDpmDFiySk=
X-Received: by 2002:a05:6808:3b2:: with SMTP id
 n18mr2073600oie.146.1582051786092; 
 Tue, 18 Feb 2020 10:49:46 -0800 (PST)
MIME-Version: 1.0
References: <20200218132023.22936-1-philmd@redhat.com>
 <87e06de3-179b-54a1-3451-39a0a30b65f0@weilnetz.de>
In-Reply-To: <87e06de3-179b-54a1-3451-39a0a30b65f0@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Feb 2020 18:49:35 +0000
Message-ID: <CAFEAcA9Jr2Yi1K8_9MGUJYt8C=OcKbWDh1UJjTQG1EspLux3JQ@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Subject: Re: [Xen-devel] [PATCH] Avoid cpu_physical_memory_rw() with a
 constant is_write argument
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
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxOCBGZWIgMjAyMCBhdCAxNzo1NywgU3RlZmFuIFdlaWwgPHN3QHdlaWxuZXR6LmRl
PiB3cm90ZToKPgo+IEFtIDE4LjAyLjIwIHVtIDE0OjIwIHNjaHJpZWIgUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6k6Cj4KPiA+IFRoaXMgY29tbWl0IHdhcyBwcm9kdWNlZCB3aXRoIHRoZSBpbmNsdWRl
ZCBDb2NjaW5lbGxlIHNjcmlwdAo+ID4gc2NyaXB0cy9jb2NjaW5lbGxlL2FzLXJ3LWNvbnN0LnBh
dGNoLgo+ID4KPiA+IEluc3BpcmVkLWJ5OiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxp
bmFyby5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhp
bG1kQHJlZGhhdC5jb20+Cj4gPiAtLS0KPiA+IEJhc2VkLW9uOiA8MjAyMDAyMTgxMTI0NTcuMjI3
MTItMS1wZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+Cj4gWy4uLl0KPiA+IGRpZmYgLS1naXQgYS90
YXJnZXQvaTM4Ni9oYXgtYWxsLmMgYi90YXJnZXQvaTM4Ni9oYXgtYWxsLmMKPiA+IGluZGV4IGE4
YjZlNWFlYjguLmY1OTcxY2NjNzQgMTAwNjQ0Cj4gPiAtLS0gYS90YXJnZXQvaTM4Ni9oYXgtYWxs
LmMKPiA+ICsrKyBiL3RhcmdldC9pMzg2L2hheC1hbGwuYwo+ID4gQEAgLTM3Niw4ICszNzYsOCBA
QCBzdGF0aWMgaW50IGhheF9oYW5kbGVfZmFzdG1taW8oQ1BVQXJjaFN0YXRlICplbnYsIHN0cnVj
dCBoYXhfZmFzdG1taW8gKmhmdCkKPiA+ICAgICAgICAgICAqICBoZnQtPmRpcmVjdGlvbiA9PSAy
OiBncGEgPT0+IGdwYTIKPiA+ICAgICAgICAgICAqLwo+ID4gICAgICAgICAgdWludDY0X3QgdmFs
dWU7Cj4gPiAtICAgICAgICBjcHVfcGh5c2ljYWxfbWVtb3J5X3J3KGhmdC0+Z3BhLCAodWludDhf
dCAqKSAmdmFsdWUsIGhmdC0+c2l6ZSwgMCk7Cj4gPiAtICAgICAgICBjcHVfcGh5c2ljYWxfbWVt
b3J5X3J3KGhmdC0+Z3BhMiwgKHVpbnQ4X3QgKikgJnZhbHVlLCBoZnQtPnNpemUsIDEpOwo+ID4g
KyAgICAgICAgY3B1X3BoeXNpY2FsX21lbW9yeV9yZWFkKGhmdC0+Z3BhLCAodWludDhfdCAqKSZ2
YWx1ZSwgaGZ0LT5zaXplKTsKPiA+ICsgICAgICAgIGNwdV9waHlzaWNhbF9tZW1vcnlfd3JpdGUo
aGZ0LT5ncGEyLCAodWludDhfdCAqKSZ2YWx1ZSwgaGZ0LT5zaXplKTsKPgo+Cj4gTWF5YmUgdGhv
c2UgdHlwZSBjYXN0cyBjb3VsZCBiZSByZW1vdmVkLCB0b28uIFRoZXkgYXJlIG5vIGxvbmdlciBu
ZWVkZWQKPiBhZnRlciB5b3VyIG1vZGlmaWNhdGlvbi4KCkkgdGhpbmsgdGhhdCB3ZSBzaG91bGQg
Zml4IHRoZSBpbmNvbnNpc3RlbmN5IHdoZXJlIHRoZXNlIGZ1bmN0aW9ucwphbGwgdGFrZSAidWlu
dDhfdCogYnVmIjoKCiAtIGFkZHJlc3Nfc3BhY2VfcncoKQogLSBhZGRyZXNzX3NwYWNlX3JlYWQo
KQogLSBhZGRyZXNzX3NwYWNlX3dyaXRlKCkKIC0gYWRkcmVzc19zcGFjZV93cml0ZV9yb20oKQog
LSBjcHVfcGh5c2ljYWxfbWVtb3J5X3J3KCkKIC0gY3B1X21lbW9yeV9yd19kZWJ1ZygpCgpidXQg
dGhlc2UgdGFrZSB2b2lkKjoKIC0gY3B1X3BoeXNpY2FsX21lbW9yeV9yZWFkKCkKIC0gY3B1X3Bo
eXNpY2FsX21lbW9yeV93cml0ZSgpCiAtIGFkZHJlc3Nfc3BhY2Vfd3JpdGVfY2FjaGVkKCkKIC0g
YWRkcmVzc19zcGFjZV9yZWFkX2NhY2hlZF9zbG93KCkKIC0gYWRkcmVzc19zcGFjZV93cml0ZV9j
YWNoZWRfc2xvdygpCiAtIHBjaV9kbWFfcmVhZCgpCiAtIHBjaV9kbWFfd3JpdGUoKQogLSBwY2lf
ZG1hX3J3KCkKIC0gZG1hX21lbW9yeV9yZWFkKCkKIC0gZG1hX21lbW9yeV93cml0ZSgpCiAtIGRt
YV9tZW1vcnlfcncoKQogLSBkbWFfbWVtb3J5X3J3X3JlbGF4ZWQoKQoKRGVwZW5kaW5nIG9uIHdo
aWNoIHdheSB3ZSBnbyB3ZSB3b3VsZCBlaXRoZXIgd2FudCB0byByZW1vdmUgdGhlc2UKY2FzdHMs
IG9yIG5vdC4KCkkgZ3Vlc3MgdGhhdCB3ZSBoYXZlIG1vcmUgY2FzZXMgb2YgJ3ZvaWQqJywgYW5k
IHRoYXQgd291bGQKY2VydGFpbmx5IGJlIHRoZSBlYXNpZXIgd2F5IHRvIGNvbnZlcnQgKG90aGVy
d2lzZSB3ZSBwcm9iYWJseQpuZWVkIHRvIGFkZCBhIGJ1bmNoIG9mIG5ldyBjYXN0cyB0byB1aW50
OF90KiBpbiB2YXJpb3VzIGNhbGxzaXRlcyksCmJ1dCBJIGRvbid0IGhhdmUgYSBzdHJvbmcgb3Bp
bmlvbi4gUGFvbG8gPwoKdGhhbmtzCi0tIFBNTQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==

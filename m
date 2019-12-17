Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EADF8122E39
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 15:12:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihDYX-0001aH-Ik; Tue, 17 Dec 2019 14:10:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=S5nP=2H=redhat.com=vkuznets@srs-us1.protection.inumbo.net>)
 id 1ihDYV-0001Zz-Q1
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 14:10:31 +0000
X-Inumbo-ID: f5d0c3c5-20d6-11ea-8ed5-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f5d0c3c5-20d6-11ea-8ed5-12813bfff9fa;
 Tue, 17 Dec 2019 14:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576591820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NU89d8R3gu38BXtEWYFAE1R5MspGNajzMjWsud1XviY=;
 b=OEHlrpD3CsST22+zUsjz8agT56N4WqeiCJ99jLSIl4QyZOnh9R1xipKAErKoKpb+iGSJD8
 oPprrREH24wn9uiIWqn1NMJSnsCYrAotHwjYK86nhYfQlmTkbBUHuC1Bwl/irk4DHjBHao
 mqVL6XVhMjaurVBqB5fu3Bv0E7z53GQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-Q9DnBPSVNQ-5DRd2NqAKAg-1; Tue, 17 Dec 2019 09:10:19 -0500
Received: by mail-wm1-f70.google.com with SMTP id 7so599161wmf.9
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 06:10:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=l+9uMkP5RS2E3iz9PV+jjXlyXbFKuV9GLhcKuu5FhcU=;
 b=cTnEwmGPC/wKfJDbe2GcNuXHxx40ghJ4d74KhhBH/DhZ9z0UyvECz9ooxQdtg+4wJT
 hmRz6cy2a++OFLqIVWnYBvXyoXwDCrJTZT7JDwL/e6ijgGLNxJ3e967sseL03e27C1ex
 HcbJGHDimHhrbzZNzdrnTeZS7AZ1Lof/O6ub+TcYY4hbQPTwI2/QSTOFlRa7zk53LSq8
 /Lccfp82SJ1J8DXX/gXARjIT0/cls8/WanN6GxXSn8F8jdTDuAeF51PirZQ3r2or5KFN
 HG+ZaVVelskoGlMDV9oQN52oKATlMMxdPAF/1m4JEh8d+4lFxkz2dK9+djH1f0xnghXD
 j+Ng==
X-Gm-Message-State: APjAAAUaFtXmvMMBudBpYkS+C4agjNSE99xh99z8iZ/aYRQwmXiFgTdi
 V2a4sFPUbsSt9TQ6tFm0XIshscSoe7Tl8snfFuZfRZzXWYjVPjGuu5F5KES9jtAJa3Nmk6ILWfn
 X0fX9gFY+hnSYQ2qbHUpWIRCNCXk=
X-Received: by 2002:adf:f2d0:: with SMTP id d16mr38825209wrp.314.1576591817685; 
 Tue, 17 Dec 2019 06:10:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqwaELcthklaxQ6wLgDx/YlEXj3opzNJiBv6389QDhORMgwNtbPpUtXb75P8pH2ZWl6IiqNKdg==
X-Received: by 2002:adf:f2d0:: with SMTP id d16mr38825179wrp.314.1576591817477; 
 Tue, 17 Dec 2019 06:10:17 -0800 (PST)
Received: from vitty.brq.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id o194sm3248953wme.45.2019.12.17.06.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 06:10:16 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Boqun Feng <boqun.feng@gmail.com>
In-Reply-To: <20191216001922.23008-7-boqun.feng@gmail.com>
References: <20191216001922.23008-1-boqun.feng@gmail.com>
 <20191216001922.23008-7-boqun.feng@gmail.com>
Date: Tue, 17 Dec 2019 15:10:16 +0100
Message-ID: <87y2vb82lz.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
X-MC-Unique: Q9DnBPSVNQ-5DRd2NqAKAg-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [RFC 6/6] arm64: hyperv: Enable vDSO
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
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, linux-kernel@vger.kernel.org,
 Michael Kelley <mikelley@microsoft.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Qm9xdW4gRmVuZyA8Ym9xdW4uZmVuZ0BnbWFpbC5jb20+IHdyaXRlczoKCj4gU2ltaWxhciB0byB4
ODYsIGFkZCBhIG5ldyB2Y2xvY2tfbW9kZSBWQ0xPQ0tfSFZDTE9DSywgYW5kIHJldXNlIHRoZQo+
IGh2X3JlYWRfdHNjX3BhZ2UoKSBmb3IgdXNlcnNwYWNlIHRvIHJlYWQgdHNjIHBhZ2UgY2xvY2tz
b3VyY2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCb3F1biBGZW5nIChNaWNyb3NvZnQpIDxib3F1bi5m
ZW5nQGdtYWlsLmNvbT4KPiAtLS0KPiAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9jbG9ja3NvdXJj
ZS5oICAgICAgIHwgIDMgKystCj4gIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vbXNoeXBlcnYuaCAg
ICAgICAgICB8ICAyICstCj4gIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vdmRzby9nZXR0aW1lb2Zk
YXkuaCB8IDE5ICsrKysrKysrKysrKysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5j
bHVkZS9hc20vY2xvY2tzb3VyY2UuaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vY2xvY2tzb3Vy
Y2UuaAo+IGluZGV4IGZiZTgwMDU3NDY4Yy4uYzZhY2Q0NWZlNzQ4IDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvYXJtNjQvaW5jbHVkZS9hc20vY2xvY2tzb3VyY2UuaAo+ICsrKyBiL2FyY2gvYXJtNjQvaW5j
bHVkZS9hc20vY2xvY2tzb3VyY2UuaAo+IEBAIC00LDcgKzQsOCBAQAo+ICAKPiAgI2RlZmluZSBW
Q0xPQ0tfTk9ORQkwCS8qIE5vIHZEU08gY2xvY2sgYXZhaWxhYmxlLgkJKi8KPiAgI2RlZmluZSBW
Q0xPQ0tfQ05UVkNUCTEJLyogdkRTTyBzaG91bGQgdXNlIGNudHZjbnQJCSovCj4gLSNkZWZpbmUg
VkNMT0NLX01BWAkxCj4gKyNkZWZpbmUgVkNMT0NLX0hWQ0xPQ0sJMgkvKiB2RFNPIHNob3VsZCB1
c2UgdnJlYWRfaHZjbG9jaygpCSovCj4gKyNkZWZpbmUgVkNMT0NLX01BWAkyCj4gIAo+ICBzdHJ1
Y3QgYXJjaF9jbG9ja3NvdXJjZV9kYXRhIHsKPiAgCWludCB2Y2xvY2tfbW9kZTsKPiBkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9tc2h5cGVydi5oIGIvYXJjaC9hcm02NC9pbmNs
dWRlL2FzbS9tc2h5cGVydi5oCj4gaW5kZXggMGFmYjAwZTM1MDFkLi43Yzg1ZGQ4MTZkY2EgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9tc2h5cGVydi5oCj4gKysrIGIvYXJj
aC9hcm02NC9pbmNsdWRlL2FzbS9tc2h5cGVydi5oCj4gQEAgLTkwLDcgKzkwLDcgQEAgZXh0ZXJu
IHZvaWQgaHZfZ2V0X3ZwcmVnXzEyOCh1MzIgcmVnLCBzdHJ1Y3QgaHZfZ2V0X3ZwX3JlZ2lzdGVy
X291dHB1dCAqcmVzdWx0KTsKPiAgI2RlZmluZSBodl9zZXRfcmVmZXJlbmNlX3RzYyh2YWwpIFwK
PiAgCQlodl9zZXRfdnByZWcoSFZfUkVHSVNURVJfUkVGRVJFTkNFX1RTQywgdmFsKQo+ICAjZGVm
aW5lIGh2X3NldF9jbG9ja3NvdXJjZV92ZHNvKHZhbCkgXAo+IC0JCSgodmFsKS5hcmNoZGF0YS52
Y2xvY2tfbW9kZSA9IFZDTE9DS19OT05FKQo+ICsJCSgodmFsKS5hcmNoZGF0YS52Y2xvY2tfbW9k
ZSA9IFZDTE9DS19IVkNMT0NLKQo+ICAKPiAgI2lmIElTX0VOQUJMRUQoQ09ORklHX0hZUEVSVikK
PiAgI2RlZmluZSBodl9lbmFibGVfc3RpbWVyMF9wZXJjcHVfaXJxKGlycSkJZW5hYmxlX3BlcmNw
dV9pcnEoaXJxLCAwKQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3Zkc28v
Z2V0dGltZW9mZGF5LmggYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3Zkc28vZ2V0dGltZW9mZGF5
LmgKPiBpbmRleCBlNmUzZmUwNDg4YzcuLjdlNjg5YjkwM2Y0ZCAxMDA2NDQKPiAtLS0gYS9hcmNo
L2FybTY0L2luY2x1ZGUvYXNtL3Zkc28vZ2V0dGltZW9mZGF5LmgKPiArKysgYi9hcmNoL2FybTY0
L2luY2x1ZGUvYXNtL3Zkc28vZ2V0dGltZW9mZGF5LmgKPiBAQCAtNjcsNiArNjcsMjAgQEAgaW50
IGNsb2NrX2dldHJlc19mYWxsYmFjayhjbG9ja2lkX3QgX2Nsa2lkLCBzdHJ1Y3QgX19rZXJuZWxf
dGltZXNwZWMgKl90cykKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiAgCj4gKyNpZmRlZiBDT05GSUdf
SFlQRVJWX1RJTUVSCj4gKy8qIFRoaXMgd2lsbCBvdmVycmlkZSB0aGUgZGVmYXVsdCBodl9nZXRf
cmF3X3RpbWVyKCkgKi8KPiArI2RlZmluZSBodl9nZXRfcmF3X3RpbWVyKCkgX19hcmNoX2NvdW50
ZXJfZ2V0X2NudHZjdCgpCj4gKyNpbmNsdWRlIDxjbG9ja3NvdXJjZS9oeXBlcnZfdGltZXIuaD4K
PiArCj4gK2V4dGVybiBzdHJ1Y3QgbXNfaHlwZXJ2X3RzY19wYWdlCj4gK19odmNsb2NrX3BhZ2Ug
X19hdHRyaWJ1dGVfXygodmlzaWJpbGl0eSgiaGlkZGVuIikpKTsKPiArCj4gK3N0YXRpYyB1NjQg
dnJlYWRfaHZjbG9jayh2b2lkKQo+ICt7Cj4gKwlyZXR1cm4gaHZfcmVhZF90c2NfcGFnZSgmX2h2
Y2xvY2tfcGFnZSk7Cj4gK30KPiArI2VuZGlmCgpUaGUgZnVuY3Rpb24gaXMgYWxtb3N0IHRoZSBz
YW1lIG9uIHg4NiAoJl9odmNsb2NrX3BhZ2UgLT4KJmh2Y2xvY2tfcGFnZSksIHdvdWxkIGl0IG1h
eWJlIG1ha2Ugc2Vuc2UgdG8gbW92ZSB0aGlzIHRvIGFyY2ggbmV1dHJhbApjbG9ja3NvdXJjZS9o
eXBlcnZfdGltZXIuaD8KCj4gKwo+ICBzdGF0aWMgX19hbHdheXNfaW5saW5lIHU2NCBfX2FyY2hf
Z2V0X2h3X2NvdW50ZXIoczMyIGNsb2NrX21vZGUpCj4gIHsKPiAgCXU2NCByZXM7Cj4gQEAgLTc4
LDYgKzkyLDExIEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdTY0IF9fYXJjaF9nZXRfaHdfY291
bnRlcihzMzIgY2xvY2tfbW9kZSkKPiAgCWlmIChjbG9ja19tb2RlID09IFZDTE9DS19OT05FKQo+
ICAJCXJldHVybiBfX1ZEU09fVVNFX1NZU0NBTEw7Cj4gIAo+ICsjaWZkZWYgQ09ORklHX0hZUEVS
Vl9USU1FUgo+ICsJaWYgKGxpa2VseShjbG9ja19tb2RlID09IFZDTE9DS19IVkNMT0NLKSkKPiAr
CQlyZXR1cm4gdnJlYWRfaHZjbG9jaygpOwoKSSdtIG5vdCBzdXJlIGxpa2VseSgpIGlzIGp1c3Rp
ZmllZCBoZXJlOiBpdCdsbCBtYWtlIEFMTCBidWlsZHMgd2hpY2gKZW5hYmxlIENPTkZJR19IWVBF
UlZfVElNRVIgKGUuZy4gZGlzdHJvIGtlcm5lbHMpIHRvIHByZWZlcgpWQ0xPQ0tfSFZDTE9DSywg
ZXZlbiBpZiB0aGUga2VybmVsIGlzIG5vdCBydW5uaW5nIG9uIEh5cGVyLVYuCgo+ICsjZW5kaWYK
PiArCj4gIAkvKgo+ICAJICogVGhpcyBpc2IoKSBpcyByZXF1aXJlZCB0byBwcmV2ZW50IHRoYXQg
dGhlIGNvdW50ZXIgdmFsdWUKPiAgCSAqIGlzIHNwZWN1bGF0ZWQuCgotLSAKVml0YWx5CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

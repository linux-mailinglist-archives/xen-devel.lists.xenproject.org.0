Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2675FE003D
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 11:04:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMq23-0006E7-Ci; Tue, 22 Oct 2019 09:00:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5eab=YP=gmail.com=estebanbosse@srs-us1.protection.inumbo.net>)
 id 1iMq21-0006Da-Gb
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 09:00:45 +0000
X-Inumbo-ID: 6e390c12-f4aa-11e9-a531-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e390c12-f4aa-11e9-a531-bc764e2007e4;
 Tue, 22 Oct 2019 09:00:44 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s1so8338571wro.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Oct 2019 02:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=AcCASEYH1hCVMf9hLghEauBrYxu+AYXXjLB+5xAbk9g=;
 b=l3XPFRzN7mSq7gY5Iw0AVsm6zTRCLM0/ApJCfZmlzGG5IKeR0CN+OwpJehBw/weZm7
 9DM5/BzDLdtFAHkrIQXdbiak/ovAB4DPXrc+igavBNCRoX0a49PlUjMStgidczA+dWco
 HFIk2Jf/DFDXPM08Cii1a7BNlcMdwjI/F98ne01PYUcV6dcd1JWhk+xnp2sU/FS4kfWO
 iBlaDExbJ00hy5Nv1LbAAJirfJXfLt/u/og75EvJX5sXs28qHP8nRQQOa9egAljAJ6Mj
 MIIiHqF2+o5tMYyNt2b3ujw6x0MoowKgZuSM66DIYuFWbxGzp0itcr1DdBt5Cp2V8wRz
 q4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=AcCASEYH1hCVMf9hLghEauBrYxu+AYXXjLB+5xAbk9g=;
 b=hv+I+/P3J5icYpD6VqliHjOzJfs91HrxSHBhH5ePcNcoL/fqWToCM/9JIAi7TPOvUi
 FA6n21DiUD+/cEEoodWtuXrAcBUUOaVkDxTqhgt+rQo7MsOnsiQKiq6E4OhnJuZMICZC
 AG7SE0Ox7OJxTHDV51kpk3IjBJsp7+ZkumcETWxVzbud05Dt9PEwNIq5RaLjp22L06N+
 P/RgSLFuJCWXvFkjkK1VpmB1DcosHxUeQH69DYC3xrOV/Kcc7OKtdioWksQ3MdVTzRvZ
 ea3+netcslqX4lSzKwuCb13aV5HA91z/GGoTNVUrlIZH1by+MZJSYbHMJ49uimK60nfK
 PItg==
X-Gm-Message-State: APjAAAWygLTw9cFKTAMSyI0MUI1Yas2z0Gj5Iz4On3g0/0UJtG+V7HXM
 Yw5RO+ACLvpflNqLb4Xsfp8=
X-Google-Smtp-Source: APXvYqzDBWzMcj3qvajXKJJQFwA59fI+V/ry/U2ff3NahnjgViH3kkXLRz4Nu2Hf2D00Fq1UU6J79w==
X-Received: by 2002:adf:f44e:: with SMTP id f14mr2369212wrp.56.1571734843691; 
 Tue, 22 Oct 2019 02:00:43 -0700 (PDT)
Received: from ?IPv6:2a01:c23:604c:2a00:af2b:2e92:39f9:c05b?
 ([2a01:c23:604c:2a00:af2b:2e92:39f9:c05b])
 by smtp.gmail.com with ESMTPSA id a9sm24261324wmf.14.2019.10.22.02.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 02:00:43 -0700 (PDT)
Message-ID: <686191b4f6a91d85bf6a458e586533225905baea.camel@gmail.com>
From: Esteban Bosse <estebanbosse@gmail.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>, 
 qemu-devel@nongnu.org
Date: Tue, 22 Oct 2019 10:57:12 +0200
In-Reply-To: <20191018134754.16362-6-philmd@redhat.com>
References: <20191018134754.16362-1-philmd@redhat.com>
 <20191018134754.16362-6-philmd@redhat.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 05/20] piix4: Rename PIIX4 object to
 piix4-isa
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?ISO-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RWwgdmllLCAxOC0xMC0yMDE5IGEgbGFzIDE1OjQ3ICswMjAwLCBQaGlsaXBwZSBNYXRoaWV1LURh
dWTDqSBlc2NyaWJpw7M6Cj4gRnJvbTogSGVydsOpIFBvdXNzaW5lYXUgPGhwb3Vzc2luQHJlYWN0
b3Mub3JnPgo+IAo+IE90aGVyIHBpaXg0IHBhcnRzIGFyZSBhbHJlYWR5IG5hbWVkIHBpaXg0LWlk
ZSBhbmQgcGlpeDQtdXNiLXVoY2kuCj4gCj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUt
RGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+Cj4gQWNrZWQtYnk6IE1pY2hhZWwgUy4gVHNpcmtpbiA8
bXN0QHJlZGhhdC5jb20+Cj4gQWNrZWQtYnk6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhh
dC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSGVydsOpIFBvdXNzaW5lYXUgPGhwb3Vzc2luQHJlYWN0
b3Mub3JnPgo+IE1lc3NhZ2UtSWQ6IDwyMDE3MTIxNjA5MDIyOC4yODUwNS0xNS1ocG91c3NpbkBy
ZWFjdG9zLm9yZz4KPiBSZXZpZXdlZC1ieTogQWxla3NhbmRhciBNYXJrb3ZpYyA8YW1hcmtvdmlj
QHdhdmVjb21wLmNvbT4KPiBbUE1EOiByZWJhc2VkXQo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBl
IE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KPiAtLS0KPiAgaHcvaXNhL3BpaXg0
LmMgICAgICAgfCAxIC0KPiAgaHcvbWlwcy9taXBzX21hbHRhLmMgfCAyICstCj4gIGluY2x1ZGUv
aHcvaXNhL2lzYS5oIHwgMiArKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaHcvaXNhL3BpaXg0LmMgYi9ody9pc2Ev
cGlpeDQuYwo+IGluZGV4IDljMzdjODVhZTIuLmFjOTM4M2E2NTggMTAwNjQ0Cj4gLS0tIGEvaHcv
aXNhL3BpaXg0LmMKPiArKysgYi9ody9pc2EvcGlpeDQuYwo+IEBAIC00NSw3ICs0NSw2IEBAIHR5
cGVkZWYgc3RydWN0IFBJSVg0U3RhdGUgewo+ICAgICAgdWludDhfdCByY3I7Cj4gIH0gUElJWDRT
dGF0ZTsKPiAgCj4gLSNkZWZpbmUgVFlQRV9QSUlYNF9QQ0lfREVWSUNFICJQSUlYNCIKPiAgI2Rl
ZmluZSBQSUlYNF9QQ0lfREVWSUNFKG9iaikgXAo+ICAgICAgT0JKRUNUX0NIRUNLKFBJSVg0U3Rh
dGUsIChvYmopLCBUWVBFX1BJSVg0X1BDSV9ERVZJQ0UpCj4gIAo+IGRpZmYgLS1naXQgYS9ody9t
aXBzL21pcHNfbWFsdGEuYyBiL2h3L21pcHMvbWlwc19tYWx0YS5jCj4gaW5kZXggN2QyNWFiNmMy
My4uZTQ5OWI3YTZiYiAxMDA2NDQKPiAtLS0gYS9ody9taXBzL21pcHNfbWFsdGEuYwo+ICsrKyBi
L2h3L21pcHMvbWlwc19tYWx0YS5jCj4gQEAgLTE0MTQsNyArMTQxNCw3IEBAIHZvaWQgbWlwc19t
YWx0YV9pbml0KE1hY2hpbmVTdGF0ZSAqbWFjaGluZSkKPiAgICAgIGlkZV9kcml2ZV9nZXQoaGQs
IEFSUkFZX1NJWkUoaGQpKTsKPiAgCj4gICAgICBwY2kgPSBwY2lfY3JlYXRlX3NpbXBsZV9tdWx0
aWZ1bmN0aW9uKHBjaV9idXMsIFBDSV9ERVZGTigxMCwgMCksCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHRydWUsICJQSUlYNCIpOwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0cnVlLAo+IFRZUEVfUElJWDRfUENJX0RFVklD
RSk7Cj4gICAgICBkZXYgPSBERVZJQ0UocGNpKTsKPiAgICAgIGlzYV9idXMgPSBJU0FfQlVTKHFk
ZXZfZ2V0X2NoaWxkX2J1cyhkZXYsICJpc2EuMCIpKTsKPiAgICAgIHBpaXg0X2RldmZuID0gcGNp
LT5kZXZmbjsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9pc2EvaXNhLmggYi9pbmNsdWRlL2h3
L2lzYS9pc2EuaAo+IGluZGV4IDAxOGFkYTRmNmYuLjc5ZjcwM2ZkNmMgMTAwNjQ0Cj4gLS0tIGEv
aW5jbHVkZS9ody9pc2EvaXNhLmgKPiArKysgYi9pbmNsdWRlL2h3L2lzYS9pc2EuaAo+IEBAIC0x
NDcsNCArMTQ3LDYgQEAgc3RhdGljIGlubGluZSBJU0FCdXMKPiAqaXNhX2J1c19mcm9tX2Rldmlj
ZShJU0FEZXZpY2UgKmQpCj4gICAgICByZXR1cm4gSVNBX0JVUyhxZGV2X2dldF9wYXJlbnRfYnVz
KERFVklDRShkKSkpOwo+ICB9Cj4gIAo+ICsjZGVmaW5lIFRZUEVfUElJWDRfUENJX0RFVklDRSAi
cGlpeDQtaXNhIgo+ICsKPiAgI2VuZGlmClJldmlld2VkLWJ5OiBFc3RlYmFuIEJvc3NlIDxlc3Rl
YmFuYm9zc2VAZ21haWwuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=

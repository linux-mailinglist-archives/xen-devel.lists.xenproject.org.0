Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FDBE0054
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 11:08:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMq63-0006O5-0t; Tue, 22 Oct 2019 09:04:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5eab=YP=gmail.com=estebanbosse@srs-us1.protection.inumbo.net>)
 id 1iMq60-0006Nw-T6
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 09:04:52 +0000
X-Inumbo-ID: ff365b0c-f4aa-11e9-a531-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff365b0c-f4aa-11e9-a531-bc764e2007e4;
 Tue, 22 Oct 2019 09:04:47 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id v9so5848636wrq.5
 for <xen-devel@lists.xenproject.org>; Tue, 22 Oct 2019 02:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=UmHm3AiSqt2iVMcVU/NWv6PsSOjF93eUoyVo/nVpHXM=;
 b=Rgk84VbKzRTyfv2LVMoR7vqhHqHp5oTrMRf+xv+FCx3r4wd3HQMHsipV4lG2qWuAHO
 AMSC/3S8nilAy2d/SvFgAvKr//ftRq66xa4AfaU2ndrs/6adFk8yIzILaCUV4AfLXQ4Q
 dFwdVChZJl4JGiyTmB6+8A/NJYOPyg+ZLP2KiwqUMQteLL3KT4SzJSXDAaKxbwq3lvve
 rMhPul5oFsqt0IZQj7j0z6kUK+rvw8K5fpK37fMChZvrijEYXgK6k7b1SLTusZfmaSoa
 dQG2GKhwhjSMF2bYpuD+N74wWmPs3vWKEBBNAWz2UYTSdYqSEMwQDLnKDcYeDIaZlxrq
 T/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=UmHm3AiSqt2iVMcVU/NWv6PsSOjF93eUoyVo/nVpHXM=;
 b=abRy1VGQEeVkVgpb989wj+uJhQM/G4JPiQtZCVi+nsvN5O5ygmPdxdveCnb+2pUbij
 HxabUe0sB9pruf7yB55/0A4SinLu03CIXxkCqokXmjOrqRtSx1KgZnBi4aAiYDlmif0g
 NPGOosuoYoCM2qnyWUE9LD2Szewd03OmfYPfPbtSwp6DV14DJZqris7AXMt7dPgAbZ3V
 DOSnhAL/ijso0wk6khXBXX1b/F5ahptp6yjyznK+fV3Ip1ULWsv132aCmwZb07vheOBt
 +bltxKDIS5RsjvRDPbD1Cc53bX6nEmXqrqeQT7ayk0aHI6+6AqvXMtb79LqjmsiyCZtB
 6F6A==
X-Gm-Message-State: APjAAAUfgYcXJz6ZRpc79R/iJrFilnXEsW8/DeTc9lmGXTel2ID9CTpK
 ZT5YWRyob47G5JzvS67q464=
X-Google-Smtp-Source: APXvYqxVYmvwr0OhwG+/kv7s0CufodGfHDOH/vZgEl7VSIlA5CXUiiaAI8JhuMY9dP0g5S0uSulMcw==
X-Received: by 2002:adf:b219:: with SMTP id u25mr2318597wra.327.1571735087015; 
 Tue, 22 Oct 2019 02:04:47 -0700 (PDT)
Received: from ?IPv6:2a01:c23:604c:2a00:af2b:2e92:39f9:c05b?
 ([2a01:c23:604c:2a00:af2b:2e92:39f9:c05b])
 by smtp.gmail.com with ESMTPSA id v11sm15086925wml.30.2019.10.22.02.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 02:04:46 -0700 (PDT)
Message-ID: <43c8125af50404df58b1336a22dbc0298ac0f868.camel@gmail.com>
From: Esteban Bosse <estebanbosse@gmail.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>, 
 qemu-devel@nongnu.org
Date: Tue, 22 Oct 2019 11:01:16 +0200
In-Reply-To: <20191018134754.16362-7-philmd@redhat.com>
References: <20191018134754.16362-1-philmd@redhat.com>
 <20191018134754.16362-7-philmd@redhat.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 06/20] piix4: Add a i8257 DMA Controller
 as specified in datasheet
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
b3Mub3JnPgo+IAo+IFJlbW92ZSBpODI1NyBpbnN0YW50aWF0ZWQgaW4gbWFsdGEgYm9hcmQsIHRv
IG5vdCBoYXZlIGl0IHR3aWNlLgo+IAo+IEFja2VkLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1z
dEByZWRoYXQuY29tPgo+IEFja2VkLWJ5OiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQu
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IEhlcnbDqSBQb3Vzc2luZWF1IDxocG91c3NpbkByZWFjdG9z
Lm9yZz4KPiBNZXNzYWdlLUlkOiA8MjAxNzEyMTYwOTAyMjguMjg1MDUtOS1ocG91c3NpbkByZWFj
dG9zLm9yZz4KPiBSZXZpZXdlZC1ieTogQWxla3NhbmRhciBNYXJrb3ZpYyA8YW1hcmtvdmljQHdh
dmVjb21wLmNvbT4KPiBbUE1EOiByZWJhc2VkXQo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1h
dGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KPiAtLS0KPiAgaHcvaXNhL3BpaXg0LmMg
ICAgICAgfCA0ICsrKysKPiAgaHcvbWlwcy9taXBzX21hbHRhLmMgfCAyIC0tCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9ody9pc2EvcGlpeDQuYyBiL2h3L2lzYS9waWl4NC5jCj4gaW5kZXggYWM5MzgzYTY1OC4uMGIy
NGQ4MzIzYyAxMDA2NDQKPiAtLS0gYS9ody9pc2EvcGlpeDQuYwo+ICsrKyBiL2h3L2lzYS9waWl4
NC5jCj4gQEAgLTI5LDYgKzI5LDcgQEAKPiAgI2luY2x1ZGUgImh3L3BjaS9wY2kuaCIKPiAgI2lu
Y2x1ZGUgImh3L2lzYS9pc2EuaCIKPiAgI2luY2x1ZGUgImh3L3N5c2J1cy5oIgo+ICsjaW5jbHVk
ZSAiaHcvZG1hL2k4MjU3LmgiCj4gICNpbmNsdWRlICJtaWdyYXRpb24vdm1zdGF0ZS5oIgo+ICAj
aW5jbHVkZSAic3lzZW11L3Jlc2V0LmgiCj4gICNpbmNsdWRlICJzeXNlbXUvcnVuc3RhdGUuaCIK
PiBAQCAtMTY3LDYgKzE2OCw5IEBAIHN0YXRpYyB2b2lkIHBpaXg0X3JlYWxpemUoUENJRGV2aWNl
ICpkZXYsIEVycm9yCj4gKiplcnJwKQo+ICAgICAgLyogaW5pdGlhbGl6ZSBJU0EgaXJxcyAqLwo+
ICAgICAgaXNhX2J1c19pcnFzKGlzYV9idXMsIHMtPmlzYSk7Cj4gIAo+ICsgICAgLyogRE1BICov
Cj4gKyAgICBpODI1N19kbWFfaW5pdChpc2FfYnVzLCAwKTsKPiArCj4gICAgICBwaWl4NF9kZXYg
PSBkZXY7Cj4gIH0KPiAgCj4gZGlmZiAtLWdpdCBhL2h3L21pcHMvbWlwc19tYWx0YS5jIGIvaHcv
bWlwcy9taXBzX21hbHRhLmMKPiBpbmRleCBlNDk5YjdhNmJiLi5kZjI0NzE3N2NhIDEwMDY0NAo+
IC0tLSBhL2h3L21pcHMvbWlwc19tYWx0YS5jCj4gKysrIGIvaHcvbWlwcy9taXBzX21hbHRhLmMK
PiBAQCAtMjgsNyArMjgsNiBAQAo+ICAjaW5jbHVkZSAiY3B1LmgiCj4gICNpbmNsdWRlICJody9p
Mzg2L3BjLmgiCj4gICNpbmNsdWRlICJody9pc2Evc3VwZXJpby5oIgo+IC0jaW5jbHVkZSAiaHcv
ZG1hL2k4MjU3LmgiCj4gICNpbmNsdWRlICJody9jaGFyL3NlcmlhbC5oIgo+ICAjaW5jbHVkZSAi
bmV0L25ldC5oIgo+ICAjaW5jbHVkZSAiaHcvYm9hcmRzLmgiCj4gQEAgLTE0MzAsNyArMTQyOSw2
IEBAIHZvaWQgbWlwc19tYWx0YV9pbml0KE1hY2hpbmVTdGF0ZSAqbWFjaGluZSkKPiAgICAgIHNt
YnVzID0gcGlpeDRfcG1faW5pdChwY2lfYnVzLCBwaWl4NF9kZXZmbiArIDMsIDB4MTEwMCwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBpc2FfZ2V0X2lycShOVUxMLCA5KSwgTlVMTCwgMCwg
TlVMTCk7Cj4gICAgICBwaXQgPSBpODI1NF9waXRfaW5pdChpc2FfYnVzLCAweDQwLCAwLCBOVUxM
KTsKPiAtICAgIGk4MjU3X2RtYV9pbml0KGlzYV9idXMsIDApOwo+ICAgICAgbWMxNDY4MThfcnRj
X2luaXQoaXNhX2J1cywgMjAwMCwgTlVMTCk7Cj4gIAo+ICAgICAgLyogZ2VuZXJhdGUgU1BEIEVF
UFJPTSBkYXRhICovClJldmlld2VkLWJ5OiBFc3RlYmFuIEJvc3NlIDxlc3RlYmFuYm9zc2VAZ21h
aWwuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

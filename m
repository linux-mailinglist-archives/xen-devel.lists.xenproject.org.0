Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4985E00FD
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 11:45:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMqhE-0001Z2-8u; Tue, 22 Oct 2019 09:43:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5eab=YP=gmail.com=estebanbosse@srs-us1.protection.inumbo.net>)
 id 1iMqhC-0001Yt-0c
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 09:43:18 +0000
X-Inumbo-ID: 5fb1a9aa-f4b0-11e9-bbab-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5fb1a9aa-f4b0-11e9-bbab-bc764e2007e4;
 Tue, 22 Oct 2019 09:43:17 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c2so12014579wrr.10
 for <xen-devel@lists.xenproject.org>; Tue, 22 Oct 2019 02:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=bOO11wkg+2Pv2o27r/wTAOCc87SP9Q0u1nKIfbm7dc4=;
 b=Makr/dWtTrYdoqQAsMav8Vn9ebRf0GuVi0GlHq/CdPrEY7lPLP9o3hZzx+bM/c6od6
 lPNAcNXGHk6xc+eyl9pZuOFNtAsYSJF56xBE6l8wH8I+l5QPhoX3dzcg3znn0vfyHB5o
 gZePOcNqjyibY+fQktOvYeZRqHlGEODv0Jkzck6D+WO4wR7rJlSMZbFXKCFMkeqzgoqX
 sjp2Rf4vp5mB4rb03fR439sbTc21fR3mNolz9hE8oXNFgsz3M2gJorJNekSTm4bl7uos
 LSmgG/sUepd4aRnHEAftEiY8wv1ZJnCyOkpn7B1wVHyXG3m9DUdkKezwO39OiD5cJn3C
 U/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=bOO11wkg+2Pv2o27r/wTAOCc87SP9Q0u1nKIfbm7dc4=;
 b=q9FxQUnek0BEL9MqbXgagqkISjEgRnXFs++0VQ+Kuo5/qT+l8/sSZaumhMtBdstvHI
 dRHnY7xvSlrnBfi5evpw+tm7Fx5MIYxGOVYJugpKbAMWdHbk23z/89WZ08JlyJLvONn7
 RgexU/ca5mrCextI/3fRqTvINelZtbDS6D2ZgMo1WeGcbfW/ook3V20K4TffrSmXuIUg
 g+2NUdjFT9DePA86/meUPCaIB7LYq7mQEzUF/2ydwUzP83IC3kvZ8qQglhnC66VIBqyw
 wDwPyIupL7vTnsGTF2FDisVSFQX7U6rv9ijX+jqrVz/BZlovaSnBOW8NCg8Mdw0oI6s7
 h4WQ==
X-Gm-Message-State: APjAAAUi1jSlsMrNwwtjq3XoAzBEB8dva8JJbDE1XdFNe+sU8eUGJq1F
 qFRP3o6nT5rJZvBDFDwxBB8=
X-Google-Smtp-Source: APXvYqxXLI5hVIo27IDWpEbmDG0UYH133w1mDm61eRNBrGPJ00fgYopAm7GZ0y/Rb1XxYHR9ffEDug==
X-Received: by 2002:a5d:498e:: with SMTP id r14mr2444844wrq.36.1571737396409; 
 Tue, 22 Oct 2019 02:43:16 -0700 (PDT)
Received: from ?IPv6:2a01:c23:604c:2a00:af2b:2e92:39f9:c05b?
 ([2a01:c23:604c:2a00:af2b:2e92:39f9:c05b])
 by smtp.gmail.com with ESMTPSA id p12sm5101204wrt.7.2019.10.22.02.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 02:43:15 -0700 (PDT)
Message-ID: <6289a119c4be0dcae17eecb6176acdd387206b02.camel@gmail.com>
From: Esteban Bosse <estebanbosse@gmail.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>, 
 qemu-devel@nongnu.org
Date: Tue, 22 Oct 2019 11:39:44 +0200
In-Reply-To: <20191018134754.16362-18-philmd@redhat.com>
References: <20191018134754.16362-1-philmd@redhat.com>
 <20191018134754.16362-18-philmd@redhat.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 17/20] hw/pci-host/piix: Fix code style
 issues
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
dWTDqSBlc2NyaWJpw7M6Cj4gV2Ugd2lsbCBtb3ZlIHRoaXMgY29kZSwgZml4IGl0cyBzdHlsZSBm
aXJzdC4KPiAKPiBSZXZpZXdlZC1ieTogQWxla3NhbmRhciBNYXJrb3ZpYyA8YW1hcmtvdmljQHdh
dmVjb21wLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhp
bG1kQHJlZGhhdC5jb20+Cj4gLS0tCj4gIGh3L3BjaS1ob3N0L3BpaXguYyB8IDcgKysrKy0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9ody9wY2ktaG9zdC9waWl4LmMgYi9ody9wY2ktaG9zdC9waWl4LmMKPiBpbmRl
eCA5NWIwNDEyMmZhLi4xNTQ0YzQ3MjZiIDEwMDY0NAo+IC0tLSBhL2h3L3BjaS1ob3N0L3BpaXgu
Ywo+ICsrKyBiL2h3L3BjaS1ob3N0L3BpaXguYwo+IEBAIC0xMzMsOSArMTMzLDEwIEBAIHN0YXRp
YyBQQ0lJTlR4Um91dGUKPiBwaWl4M19yb3V0ZV9pbnR4X3Bpbl90b19pcnEodm9pZCAqb3BhcXVl
LCBpbnQgcGNpX2ludHgpOwo+ICBzdGF0aWMgdm9pZCBwaWl4M193cml0ZV9jb25maWdfeGVuKFBD
SURldmljZSAqZGV2LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3Qg
YWRkcmVzcywgdWludDMyX3QgdmFsLCBpbnQKPiBsZW4pOwo+ICAKPiAtLyogcmV0dXJuIHRoZSBn
bG9iYWwgaXJxIG51bWJlciBjb3JyZXNwb25kaW5nIHRvIGEgZ2l2ZW4gZGV2aWNlIGlycQo+IC0g
ICBwaW4uIFdlIGNvdWxkIGFsc28gdXNlIHRoZSBidXMgbnVtYmVyIHRvIGhhdmUgYSBtb3JlIHBy
ZWNpc2UKPiAtICAgbWFwcGluZy4gKi8KPiArLyoKPiArICogUmV0dXJuIHRoZSBnbG9iYWwgaXJx
IG51bWJlciBjb3JyZXNwb25kaW5nIHRvIGEgZ2l2ZW4gZGV2aWNlIGlycQo+ICsgKiBwaW4uIFdl
IGNvdWxkIGFsc28gdXNlIHRoZSBidXMgbnVtYmVyIHRvIGhhdmUgYSBtb3JlIHByZWNpc2UKPiBt
YXBwaW5nLgo+ICsgKi8KPiAgc3RhdGljIGludCBwY2lfc2xvdF9nZXRfcGlycShQQ0lEZXZpY2Ug
KnBjaV9kZXYsIGludCBwY2lfaW50eCkKPiAgewo+ICAgICAgaW50IHNsb3RfYWRkZW5kOwpSZXZp
ZXdlZC1ieTogRXN0ZWJhbiBCb3NzZSA8ZXN0ZWJhbmJvc3NlQGdtYWlsLmNvbT4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

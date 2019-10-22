Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CE9E0017
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 10:56:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMpvo-0005Oj-Ik; Tue, 22 Oct 2019 08:54:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5eab=YP=gmail.com=estebanbosse@srs-us1.protection.inumbo.net>)
 id 1iMpvn-0005OY-5O
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 08:54:19 +0000
X-Inumbo-ID: 880129dc-f4a9-11e9-beca-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 880129dc-f4a9-11e9-beca-bc764e2007e4;
 Tue, 22 Oct 2019 08:54:18 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a11so984985wra.6
 for <xen-devel@lists.xenproject.org>; Tue, 22 Oct 2019 01:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=V4VhBihoolZqFYIN54r9nmx9vYW/oQSJU4NMMDQk7As=;
 b=Dgu+TC/pYPvxFl322P5ZQxatcCTlZr9/Na3bgs3e7uOoeVESu2uvhuRLFlA7Vx7/JT
 /eva777fMJ8YfTgOGc73Mx0YxP01s6+hevrbvcCTqdpw/rTSEltteQbcZoXK4PmPIUBm
 cl1ypCckqOcn43h6toBhuentFcrt9KGnXUPqpaFPa4bW3E56B+6i3Tx8qAHh1iiETUX3
 dGqXsu8Ew2uALCJSx4VFErFJJJcuSnDcWNuVe97h231nTAgZjz2TP8/8KWalCN6fqC//
 yNJAMz15ra9LHEt59Z0uirpJUswkt76MyYPG+hYLPwDY8SCBSYcr4fVQzU3aNLfA4uei
 GoKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=V4VhBihoolZqFYIN54r9nmx9vYW/oQSJU4NMMDQk7As=;
 b=Jn8/fBOba6e3S0iLGVZUZJqb5CWcEvFwonlwWHNP0EMK4qdhz30zc2KhwSPMFtt8Ja
 pLgXyVAoaLsNegohaFMRsX0cJxYaXrUpkb6BF12FthNgLnCj8vtaaAIEWE9Z9/RegC7/
 ED84CwVM8QbWVTT57ve2kt6fC9hPu6ZmDsbDg5K0yi1fPanESMZlWiGoopzSv3kUr1Zt
 c7X+4TAPCjQCAS7SBqfz6aPYBhvVB5lvSWyqQbnvLEP9heD9RqgRTUjitgDuFwlQc1hR
 1RDZk17Le4KnfVYOoQuCHbo+OnynS8KzfNUfy/7ONX/+T7TQzVUspS7qjHYyA65N4DfZ
 TA6w==
X-Gm-Message-State: APjAAAXRACagEoY8oMtoYF76jSuEvd4LZwmff1fLLuadILD9AVv2dptW
 ZcJbw1foth/M84r1ulXfa4M=
X-Google-Smtp-Source: APXvYqz8BBP5wYK70GC9RnObS4GNK085VbmK6595Ok53rEH80UBeoYuODXHUVHqO1KEoZ2xkh46u7g==
X-Received: by 2002:a5d:6b0a:: with SMTP id v10mr2269042wrw.32.1571734457519; 
 Tue, 22 Oct 2019 01:54:17 -0700 (PDT)
Received: from ?IPv6:2a01:c23:604c:2a00:af2b:2e92:39f9:c05b?
 ([2a01:c23:604c:2a00:af2b:2e92:39f9:c05b])
 by smtp.gmail.com with ESMTPSA id p21sm8365131wmc.25.2019.10.22.01.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 01:54:17 -0700 (PDT)
Message-ID: <80119c423b25ff027844fd04a4e57e5fcb7dfbb9.camel@gmail.com>
From: Esteban Bosse <estebanbosse@gmail.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>, 
 qemu-devel@nongnu.org
Date: Tue, 22 Oct 2019 10:50:46 +0200
In-Reply-To: <20191018134754.16362-5-philmd@redhat.com>
References: <20191018134754.16362-1-philmd@redhat.com>
 <20191018134754.16362-5-philmd@redhat.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 04/20] Revert "irq: introduce
 qemu_irq_proxy()"
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
Cc: Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
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
dWTDqSBlc2NyaWJpw7M6Cj4gRnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFt
c2F0Lm9yZz4KPiAKPiBUaGlzIGZ1bmN0aW9uIGlzbid0IHVzZWQgYW55bW9yZS4KPiAKPiBUaGlz
IHJldmVydHMgY29tbWl0IDIyZWMzMjgzZWZiYTliYTA3OTI3OTBkYTc4NmQ2Nzc2ZDgzZjJhOTIu
Cj4gCj4gUmV2aWV3ZWQtYnk6IFRob21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+Cj4gLS0t
Cj4gIGh3L2NvcmUvaXJxLmMgICAgfCAxNCAtLS0tLS0tLS0tLS0tLQo+ICBpbmNsdWRlL2h3L2ly
cS5oIHwgIDUgLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxOSBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvaHcvY29yZS9pcnEuYyBiL2h3L2NvcmUvaXJxLmMKPiBpbmRleCA3Y2MwMjk1
ZDBlLi5mYjMwNDViOTEyIDEwMDY0NAo+IC0tLSBhL2h3L2NvcmUvaXJxLmMKPiArKysgYi9ody9j
b3JlL2lycS5jCj4gQEAgLTEyMCwyMCArMTIwLDYgQEAgcWVtdV9pcnEgcWVtdV9pcnFfc3BsaXQo
cWVtdV9pcnEgaXJxMSwgcWVtdV9pcnEKPiBpcnEyKQo+ICAgICAgcmV0dXJuIHFlbXVfYWxsb2Nh
dGVfaXJxKHFlbXVfc3BsaXRpcnEsIHMsIDApOwo+ICB9Cj4gIAo+IC1zdGF0aWMgdm9pZCBwcm94
eV9pcnFfaGFuZGxlcih2b2lkICpvcGFxdWUsIGludCBuLCBpbnQgbGV2ZWwpCj4gLXsKPiAtICAg
IHFlbXVfaXJxICoqdGFyZ2V0ID0gb3BhcXVlOwo+IC0KPiAtICAgIGlmICgqdGFyZ2V0KSB7Cj4g
LSAgICAgICAgcWVtdV9zZXRfaXJxKCgqdGFyZ2V0KVtuXSwgbGV2ZWwpOwo+IC0gICAgfQo+IC19
Cj4gLQo+IC1xZW11X2lycSAqcWVtdV9pcnFfcHJveHkocWVtdV9pcnEgKip0YXJnZXQsIGludCBu
KQo+IC17Cj4gLSAgICByZXR1cm4gcWVtdV9hbGxvY2F0ZV9pcnFzKHByb3h5X2lycV9oYW5kbGVy
LCB0YXJnZXQsIG4pOwo+IC19Cj4gLQo+ICB2b2lkIHFlbXVfaXJxX2ludGVyY2VwdF9pbihxZW11
X2lycSAqZ3Bpb19pbiwgcWVtdV9pcnFfaGFuZGxlcgo+IGhhbmRsZXIsIGludCBuKQo+ICB7Cj4g
ICAgICBpbnQgaTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9pcnEuaCBiL2luY2x1ZGUvaHcv
aXJxLmgKPiBpbmRleCBmZTUyN2Y2ZjUxLi4yNGJhMGVjZTExIDEwMDY0NAo+IC0tLSBhL2luY2x1
ZGUvaHcvaXJxLmgKPiArKysgYi9pbmNsdWRlL2h3L2lycS5oCj4gQEAgLTUxLDExICs1MSw2IEBA
IHFlbXVfaXJxIHFlbXVfaXJxX2ludmVydChxZW11X2lycSBpcnEpOwo+ICAgKi8KPiAgcWVtdV9p
cnEgcWVtdV9pcnFfc3BsaXQocWVtdV9pcnEgaXJxMSwgcWVtdV9pcnEgaXJxMik7Cj4gIAo+IC0v
KiBSZXR1cm5zIGEgbmV3IElSUSBzZXQgd2hpY2ggY29ubmVjdHMgMToxIHRvIGFub3RoZXIgSVJR
IHNldCwKPiB3aGljaAo+IC0gKiBtYXkgYmUgc2V0IGxhdGVyLgo+IC0gKi8KPiAtcWVtdV9pcnEg
KnFlbXVfaXJxX3Byb3h5KHFlbXVfaXJxICoqdGFyZ2V0LCBpbnQgbik7Cj4gLQo+ICAvKiBGb3Ig
aW50ZXJuYWwgdXNlIGluIHF0ZXN0LiAgU2ltaWxhciB0byBxZW11X2lycV9zcGxpdCwgYnV0Cj4g
b3BlcmF0aW5nCj4gICAgIG9uIGFuIGV4aXN0aW5nIHZlY3RvciBvZiBxZW11X2lycS4gICovCj4g
IHZvaWQgcWVtdV9pcnFfaW50ZXJjZXB0X2luKHFlbXVfaXJxICpncGlvX2luLCBxZW11X2lycV9o
YW5kbGVyCj4gaGFuZGxlciwgaW50IG4pOwpSZXZpZXdlZC1ieTogRXN0ZWJhbiBCb3NzZSA8ZXN0
ZWJhbmJvc3NlQGdtYWlsLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs

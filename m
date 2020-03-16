Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D56AC1870F9
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2020 18:14:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jDtHP-0004hh-Rl; Mon, 16 Mar 2020 17:11:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X1t4=5B=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1jDtHP-0004hb-03
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2020 17:11:55 +0000
X-Inumbo-ID: 3c0bd086-67a9-11ea-92cf-bc764e2007e4
Received: from mail-ot1-x343.google.com (unknown [2607:f8b0:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c0bd086-67a9-11ea-92cf-bc764e2007e4;
 Mon, 16 Mar 2020 17:11:54 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id h17so3852otn.7
 for <xen-devel@lists.xenproject.org>; Mon, 16 Mar 2020 10:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jGqYMRdq+LB8A/GFfRTKfqhbPMZ1y7l+2Nofeb6biR4=;
 b=YgKbCK4v/DosAcCr/gjPFUczjd0OmJ6Veyb2qjAruXqGF0EJ02OTVJzlie+LQ4hVRz
 PcDTuEcM9JGw0OH6X88OF/7/08IgrgIoBSyEqJNBcHGkedrd/XCo6ZfD/6DLSgv0LHLH
 ExwvxF5F0Yh1n31FAGH8drqhnJ/ULGamjlBRsJF6KJc0WaKZoDhriC0e+sSNex2TqYi9
 5gDBQgPTFLTDkndw5EiVuHRmwH1LHd7W3E5PP+ChyixvqS1KtqN1r6j2Uq0JiycTup5i
 TgpHYGMOxC0BB+bJl3IsVqsqtRjVLppyFw2N+w4y9Eb+2n0Ct75Q3H2bk+88FA87Sdh0
 Wdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jGqYMRdq+LB8A/GFfRTKfqhbPMZ1y7l+2Nofeb6biR4=;
 b=uSKFriTlSBQ7grauKUTI18QzlEMcDS1cchCRj0R1Ab8GFNoyKrtN6oDczgzYvIHNaV
 l1X7VQlROJQ9fIT05vMaWletXLgQz8BKf5W+b8sghI2MHug2EXY7rOgEXEa407gbHrDo
 tn2ToIoXTiyZXqpkJbz7DJF4x0RV5yMx2ldW0QJlx9q6+70AACz3eIJEEyrlMcZWLFNz
 ugBLQVHX3+mbXnmDpOpBkC8TvpXVE//b3vXxhJa+t9yT4JeY++AH4hTDAmMrohfBT9jU
 Ct/OT30SXW1vtEANNobEzs3ODXqvSSOyz8ionzdoPik7KGw5c/dYwEjwpcb6V08/LeaW
 v5/A==
X-Gm-Message-State: ANhLgQ2C9FuWMnKiuhAQXt/2LPpQEaI3E55IBWdlDDPc4O3ZeFw3TrLH
 oB71ni0Qzt+s6DFl6fIuA9F3BvBlCqx1El0HvRVdsQ==
X-Google-Smtp-Source: ADFU+vvoWGysq3r5lRnRM5NKLd1UWK0pjHyrPiNZU34PNJZFCmSxBRDw8Ugb5d9gZs9dpVzqX8nq0ix0va8GcoCMtHM=
X-Received: by 2002:a9d:1d43:: with SMTP id m61mr213922otm.91.1584378713933;
 Mon, 16 Mar 2020 10:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-19-philmd@redhat.com>
In-Reply-To: <20200316160634.3386-19-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Mar 2020 17:11:42 +0000
Message-ID: <CAFEAcA_bXb_RZFxMSYJ8FAoAahAxrq3c0PBzidu+Z0iXTzZqFw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH v3 18/19] hw/arm: Do not build to 'virt'
 machine on Xen
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kvm-devel <kvm@vger.kernel.org>,
 Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxNiBNYXIgMjAyMCBhdCAxNjowOCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBo
aWxtZEByZWRoYXQuY29tPiB3cm90ZToKPgo+IFhlbiBvbiBBUk0gZG9lcyBub3QgdXNlIFFFTVUg
bWFjaGluZXMgWypdLiBEaXNhYmxlIHRoZSAndmlydCcKPiBtYWNoaW5lIHRoZXJlIHRvIGF2b2lk
IG9kZCBlcnJvcnMgc3VjaDoKPgo+ICAgICBDQyAgICAgIGkzODYtc29mdG1tdS9ody9jcHUvYTE1
bXBjb3JlLm8KPiAgIGh3L2NwdS9hMTVtcGNvcmUuYzoyODoxMDogZmF0YWwgZXJyb3I6IGt2bV9h
cm0uaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+Cj4gWypdIGh0dHBzOi8vd2lraS54ZW5w
cm9qZWN0Lm9yZy93aWtpL1hlbl9BUk1fd2l0aF9WaXJ0dWFsaXphdGlvbl9FeHRlbnNpb25zI1Vz
ZV9vZl9xZW11LXN5c3RlbS1pMzg2X29uX0FSTQo+Cj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUg
TWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgo+IC0tLQo+IENjOiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ2M6IEFudGhvbnkgUGVyYXJkIDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IENjOiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9y
Zz4KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gLS0tCj4gIGh3L2FybS9L
Y29uZmlnIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAt
LWdpdCBhL2h3L2FybS9LY29uZmlnIGIvaHcvYXJtL0tjb25maWcKPiBpbmRleCA4ZTgwMWNkMTVm
Li42OWE4ZTMwMTI1IDEwMDY0NAo+IC0tLSBhL2h3L2FybS9LY29uZmlnCj4gKysrIGIvaHcvYXJt
L0tjb25maWcKPiBAQCAtMSw1ICsxLDYgQEAKPiAgY29uZmlnIEFSTV9WSVJUCj4gICAgICBib29s
Cj4gKyAgICBkZXBlbmRzIG9uICFYRU4KPiAgICAgIGRlZmF1bHQgeSBpZiBLVk0KPiAgICAgIGlt
cGx5IFBDSV9ERVZJQ0VTCj4gICAgICBpbXBseSBURVNUX0RFVklDRVMKPiAtLQoKVGhpcyBzZWVt
cyBvZGQgdG8gbWU6CigxKSB0aGUgZXJyb3IgbWVzc2FnZSB5b3UgcXVvdGUgaXMgZm9yIGExNW1w
Y29yZS5jLCBub3QgdmlydC5jCigyKSBzaG91bGRuJ3QgdGhpcyBiZSBwcmV2ZW50ZWQgYnkgc29t
ZXRoaW5nIHNheWluZyAiZG9uJ3QgYnVpbGQKZ3Vlc3QgYXJjaGl0ZWN0dXJlIFggYm9hcmRzIGlu
dG8gWS1zb2Z0bW11IiwgcmF0aGVyIHRoYW4gYSBzcGVjaWZpYwpmbGFnIGZvciBhIHNwZWNpZmlj
IGFybSBib2FyZCA/Cgp0aGFua3MKLS0gUE1NCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

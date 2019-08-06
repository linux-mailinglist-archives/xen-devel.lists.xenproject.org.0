Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9975C83AF0
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 23:19:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv6nv-00074X-Ls; Tue, 06 Aug 2019 21:15:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nn9y=WC=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hv6nu-00074S-8S
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 21:15:34 +0000
X-Inumbo-ID: 52d6b3e4-b88f-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 52d6b3e4-b88f-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 21:15:33 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m23so83369999lje.12
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2019 14:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ODfw52Pr3KZ4EUzDc02A4JGVDgd9M1emqsf/B9VHqlI=;
 b=bQxfwpmMA/aFSPSBYcrrUysgZKkzjz9MqocuMBn6wo1O2xhI0GwkmR0lNDcGArSP9s
 O7uKPgBPPOW23FoNTtmPdyp8wACuqdW0YTAKFafvviDCd1YmjPloqUxPhIB+pek/s2mB
 5NaphPwYfKhnz7jQrxaRALAInO3Vd2JryiMy6Zlccw87kpbPIRm3nyAl3WM2+Oii8jiy
 n1LGIO3JUz5Pn8YlkXijbcUAV9PKlGoPjsQxN+7lfhG5jHUgKrT17PkS1iw+dHAQUNvR
 ZNZip72PejrIjKo4pgMqUawiSuanAG0YFK6XEhCJiYMQ3OrlWnT0rGP6LPRfJ8xkayqB
 8czg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ODfw52Pr3KZ4EUzDc02A4JGVDgd9M1emqsf/B9VHqlI=;
 b=nMD/SYTRcsGjRvfHNsY/HQBhqvnTJEvMRyKlYbELnoRANbzEcFNVQaCaIpvzINQoXW
 Z4UXxhubSqpMYeJZ2gW2L7IIWSA0o310P6zeKmSFFkcPH8B/fmUb6gmVk+HANeUyTzXP
 t0c9zMS39VI/Iimi5DzZHv+uIFvwKwWttNC1+cC9R1J38O0nYyyYuEYfg/j1L1X9rHXz
 4hz5obtwpwcwsD1JYPS9DKIOTieScHOEoMZrVfQlyh0amCRcIPpAHsTgjfIMUhLbWP9L
 /At2kqecbDuXcOeIJB6oXZHMwu+qCRugw5YhKCYDVpGKul2FcHtLuJeHwCoKNbMZA4PD
 atxg==
X-Gm-Message-State: APjAAAU8jqFq2r1+u/vvUAzIAz7zuIUxEtwfU6pFH5ygt4y+A7oWX75i
 6gKckAgYcsz/A3ar6M5QE21qiXzlxaet0Ln9zyk=
X-Google-Smtp-Source: APXvYqyLRYjU16s0ITZDKw8Llmrcr54IAUc/7djQCtabWYZ6A53DVSca7sHIwSFpcOUwpGTslbg1VRnUY2uLYc/cPoA=
X-Received: by 2002:a2e:9188:: with SMTP id f8mr2893758ljg.33.1565126131553;
 Tue, 06 Aug 2019 14:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <1559938596-5696-1-git-send-email-amittomer25@gmail.com>
 <CABHD4K87Z8QWtga6+FmkFXzJcot+WHH4KS7x-g1wOir8V2-tcQ@mail.gmail.com>
 <44094e19-48c6-8281-4e04-2b2a24db98db@arm.com>
 <CABHD4K8GmFLXjwrRse5JuJ4rSJ3Wy0_uU_6edqSMF_Yi5-YjDQ@mail.gmail.com>
 <ff55b765-03b5-9cb1-0e56-d342425a608d@arm.com>
In-Reply-To: <ff55b765-03b5-9cb1-0e56-d342425a608d@arm.com>
From: Amit Tomer <amittomer25@gmail.com>
Date: Wed, 7 Aug 2019 02:44:55 +0530
Message-ID: <CABHD4K_3KSCJmEhn2uONt2wnMdLwz0hp-3Ocr_-KRpTmGKM9ow@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [RFC PATCH 0/2] XEN booting on i.MX8M platform
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org, peng.fan@nxp.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkKCj4KPiBXaGF0IGFyZSB0aGUgY29uc2VxdWVuY2VzIHRvIGNoYW5nZSB0aGUgaW50ZXJydXB0
IHBhcmVudD8KCkkgYW0gbm90IGVudGlyZWx5IHN1cmUgYWJvdXQgaXQgYXQgdGhlIG1vbWVudCBi
dXQgbG9va3MgbGlrZSBpdApjb250cm9sbGVycyBwb3dlciBkb21haW4KZm9yIHZhcmlvdXMgZGV2
aWNlcyBsaWtlIEdQVSwgVlBVIGFuZCBPVEcgZXRjLgoKU28sIHdlIG1heSBub3QgYmUgYWJsZSB0
byBzdXBwb3J0IHRoZXNlIGRldmljZXMgZm9yIFhFTiBkb21haW5zID8KCkFsc28sIHRoaXMgSVAg
aXMgbm90IHByZXNlbnQgb24gb3RoZXIgaS5NWDggcGxhdGZvcm1zLCBmb3IgaW5zdGFuY2UgaU1Y
OFFNLgoKPiA+Cj4gPiBUaGUgcGF0Y2hlcyBoYXMgYmVlbiB0ZXN0ZWQgYm9vdGluZyBET00wIHdp
dGggcmFtZnMuCj4KPiBJIGRvbid0IHRoaW5rIHRoaXMgaXMgZW5vdWdoIHRvIGNsYWltIHN1cHBv
cnQgZm9yIFhlbiBvbiB0aGUgSS5NWDhNIHBsYXRmb3JtLgo+IFdoYXQgSSBkb24ndCB3YW50IHRv
IGVuZCB1cCBpcyBoYXZpbmcgeWV0IGFub3RoZXIgVUFSVCBkcml2ZXIgdG8gbWFpbnRhaW4gaW4g
WGVuCj4gYnV0IHRoZSBwbGF0Zm9ybSBpcyBzdGlsbCB1bnVzYWJsZS4KPgo+IFlvdSBzaG91bGQg
YXQgbGVhc3QgYmUgYWJsZSB0byBib290IG11bHRpcGxlIGRvbWFpbnMgYW5kIHVzZSBhIGZ1bGx5
IGZsZWRnZQo+IGRpc3RybyAoeW9jdG8sIERlYmlhbi4uLikgZnJvbSBhIG1hc3Mgc3RvcmFnZSAo
YW5kIHBvc3NpYmx5IG5ldHdvcmspLgo+ClllYWgsIEkgY2FuIHVuZGVyc3RhbmQgdGhpcyBhbmQg
d291bGQgdHJ5IHRvIHdvcmsgb24gaXQgKGJ1dCBub3Qgc3VyZQp3aGVuIGNhbiBJIGhhdmUgYWNj
ZXNzCnRvIEgvVykuCgpUaGFua3MsCkFtaXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=

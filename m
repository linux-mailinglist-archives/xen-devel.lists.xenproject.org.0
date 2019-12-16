Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0C41206B0
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 14:11:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igq7V-0007tQ-5H; Mon, 16 Dec 2019 13:09:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DHV3=2G=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1igq7T-0007tK-VV
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 13:09:04 +0000
X-Inumbo-ID: 3659f2da-2005-11ea-b6f1-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 3659f2da-2005-11ea-b6f1-bc764e2007e4;
 Mon, 16 Dec 2019 13:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576501734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vW71febaZ6KqLELxDd277QVRHIP/LeDFnIhgDGUV3kk=;
 b=FBWD0t3K0G0l9pgjzq+IC62/1FhOHgmCChZkPP7DyQJr85CvkYHZn15SitYLO3Bin5stVD
 hZQbwmlJQrujSmHRW5nRdWRRYg3UejU+Y+w25RxxdyPREUZ1nP6EX/GFz+dfXFxeRRch7i
 ZEdNMGs+WLZ3tbKy1RgM/4kPQana3GU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-MuuQvc59PWq9mRLTsgBHyQ-1; Mon, 16 Dec 2019 08:08:52 -0500
Received: by mail-wm1-f69.google.com with SMTP id p5so1001891wmc.4
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2019 05:08:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qVps0ksEeffzPKmQcVs/p+Pjxq+Vz+TDTh2GnN60Xxw=;
 b=Qq9E4KsJSuGvay6thhE6V+tqk8R+I83StectlnZW438dQ3SoCu1MNw4gX9SwjORDMV
 BMzqcUWYbdrniBiytFiRB9EmAN+Q/+5Bo/k18DAeU70kRu2PML0eBgfdIhKeL+bPyzB9
 31MBov1toyQS1gGVMd8VXSAifoJN/wdZS1w3Ch+ka7xhZWbcLCoqEUdFfpWjnFJHQAQL
 sbOy/YCBIy4eyBfTSs+9CajbJHUiSfvhRmYxZEH0oz7NCHnn66LczM+dUmy8rVQ7zP/C
 mUkpj0FFQhyj4JIXdgbt3t8UU+XoNjAg0J69qUmGJ0JnmA4EgMbA8bHzwTd70wOHo6+t
 wNLQ==
X-Gm-Message-State: APjAAAXonk1DdGO0T2U74/mRmAnV3vlksRLVkmeEhqFfczK07AXuW9xp
 q/j6BllqGh80/e6CumMUYnzbrwRkBAY81J8++vXvefcJ999cHJTm65tqyx6CA5lh6U46MtMMjuj
 GSl81LmJEziih0OdIBoZyd1qZHug=
X-Received: by 2002:adf:b648:: with SMTP id i8mr30617231wre.91.1576501731218; 
 Mon, 16 Dec 2019 05:08:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqw5r6BjWyq15DIgwSERvxbOhPXbbbeovtPSwMIC0Ga4pAhcnI6btOTfyyoXbuuWBe0pFwLUzg==
X-Received: by 2002:adf:b648:: with SMTP id i8mr30617202wre.91.1576501731026; 
 Mon, 16 Dec 2019 05:08:51 -0800 (PST)
Received: from [192.168.10.150] ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id x11sm21078428wmg.46.2019.12.16.05.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 05:08:50 -0800 (PST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191213161753.8051-1-philmd@redhat.com>
 <20191213161753.8051-4-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <39ca6020-193e-294b-2845-f5bab35609ef@redhat.com>
Date: Mon, 16 Dec 2019 14:08:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191213161753.8051-4-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: MuuQvc59PWq9mRLTsgBHyQ-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH 03/12] hw/i386/pc: Remove obsolete
 pc_pci_device_init() declaration
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMvMTIvMTkgMTc6MTcsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOgo+IEluIGNv
bW1pdCAxNDU0NTA5NzI2IHdlIHJlbW92ZWQgdGhlIHBjX3BjaV9kZXZpY2VfaW5pdCgpCj4gZGVw
cmVjYXRlZCBmdW5jdGlvbiBhbmQgaXRzIGNhbGxzLCBidXQgd2UgZm9yZ290IHRvIHJlbW92ZQo+
IGl0cyBwcm90b3R5cGUuIERvIHRoYXQgbm93Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBl
IE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9ody9p
Mzg2L3BjLmggfCAxIC0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9ody9pMzg2L3BjLmggYi9pbmNsdWRlL2h3L2kzODYvcGMuaAo+IGlu
ZGV4IDk4NjZkZmJkNjAuLmJjN2Q4NTVhYWEgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9ody9pMzg2
L3BjLmgKPiArKysgYi9pbmNsdWRlL2h3L2kzODYvcGMuaAo+IEBAIC0yMTEsNyArMjExLDYgQEAg
dm9pZCBwY19jbW9zX2luaXQoUENNYWNoaW5lU3RhdGUgKnBjbXMsCj4gICAgICAgICAgICAgICAg
ICAgIEJ1c1N0YXRlICppZGUwLCBCdXNTdGF0ZSAqaWRlMSwKPiAgICAgICAgICAgICAgICAgICAg
SVNBRGV2aWNlICpzKTsKPiAgdm9pZCBwY19uaWNfaW5pdChQQ01hY2hpbmVDbGFzcyAqcGNtYywg
SVNBQnVzICppc2FfYnVzLCBQQ0lCdXMgKnBjaV9idXMpOwo+IC12b2lkIHBjX3BjaV9kZXZpY2Vf
aW5pdChQQ0lCdXMgKnBjaV9idXMpOwo+ICAKPiAgdHlwZWRlZiB2b2lkICgqY3B1X3NldF9zbW1f
dCkoaW50IHNtbSwgdm9pZCAqYXJnKTsKPiAgCj4gCgpRdWV1ZWQsIHRoYW5rcy4KClBhb2xvCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

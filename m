Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABAC121288
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 18:53:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iguVm-0000Ql-5E; Mon, 16 Dec 2019 17:50:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PTo5=2G=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iguVk-0000Qg-U8
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 17:50:24 +0000
X-Inumbo-ID: 88d42018-202c-11ea-b6f1-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88d42018-202c-11ea-b6f1-bc764e2007e4;
 Mon, 16 Dec 2019 17:50:24 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id a13so7739989ljm.10
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2019 09:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8vjOjg51aHOlQp3jRL7nVJPBEoPOysVV+ENxF2qpWEM=;
 b=CgnhroZLrvJx1rn/KsERyxOsTHS0xTBUcSaolB1SVuE43/lC8TvQEvL5zXbXzrskdE
 H9KpGyxPmODTOBWd7Ar5ifYr9Pe/GuZoB1G+fgsML27CpQ6CrRoyKiI/u5EzcxfNpAtI
 c4+NeJozL24EiBs45M1LxszKIrPcQbyf5uFUB1Ll/Vqnf7shgbITenBjcJlU91ja1AmF
 tfp3oA4Mi4eJbkR10qSW0p1oyFLx1Hie4g/Bk+I704mW/Oz2d6YGShPXtdwjIXGWLUIP
 34H2rAa9vVc+24GF3RipCpdDxO8b2cVATC7FKNvlLqPdCRcP8IKuJd5v5+rN6+PVzs3X
 CyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8vjOjg51aHOlQp3jRL7nVJPBEoPOysVV+ENxF2qpWEM=;
 b=rpcfuhS0RFV/95fRAU71LqdnuR8f6/UfPnRAFJQYcX1FkUoroQ9zky5StX/RS882RW
 aCbWHvkPBHpLjzCvhIPXeSGBGWkWYyU+KzHRYe3n66KNHwD6jCrPhdahIN+HoHN4bYv6
 KJfqAY3HPTTfGnDvAt58JH3C0BBlyIRW6+GEF/rc2lDJ4RjJW95CP5OezTqW9DrcLj4X
 LlHVjBCX3WxJKKClf90MhPDXG7z6TEAjcSNzvHrbwloOho5o2uFjHdjMHaVO9MZBGV+R
 TA6iPScDo3jlfhhaB8C49aIT3y9UzBsmPvoHdGLFpNc8a7TEYa3CECiqgvdY7X6jA4Uf
 Cs/g==
X-Gm-Message-State: APjAAAXwl88q0yjH/+O2Thx5WBX3iajuZ7gSnpsL/y47zxtNrqTyn9Yx
 xc5oKUJCggb1mFRdRlH6xEAT1FAXKTeB76SGa3c=
X-Google-Smtp-Source: APXvYqwql2nYkWaBdH8ovgXS8meaDIEuKT1bc1Z96uQQiiOAxL6LnzlISiQ3cJDfbQiLYv88X/+NZYWIT/f7y+oQc00=
X-Received: by 2002:a2e:6a14:: with SMTP id f20mr223103ljc.87.1576518622478;
 Mon, 16 Dec 2019 09:50:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1575990937.git.rosbrookn@ainfosec.com>
 <d27d337198de7807c952b237a7b79ab21faa9ec6.1575990937.git.rosbrookn@ainfosec.com>
 <571dd8ab-55ad-46ee-7aae-f80e0a9fd273@citrix.com>
In-Reply-To: <571dd8ab-55ad-46ee-7aae-f80e0a9fd273@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Mon, 16 Dec 2019 12:50:11 -0500
Message-ID: <CAEBZRSfAKNtsU0TkdzNZ=Nt1aaEhJshLgo+sgp5K12xy6gcFjQ@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v3 01/22] golang/xenlight: generate enum
 types from IDL
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, kerriganb@ainfosec.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBJIHdhcyBleHBlY3RpbmcgeW91IHRvIGNoYW5nZSB0aGlzIGlmIHlvdSBzZW50IGEgdjMuIDot
KQo+Cj4gSSBjYW4gc3RpbGwgY2hhbmdlIGl0IG9uIGNoZWNrLWluLCBidXQgaWYgZm9yIHNvbWUg
cmVhc29uIHRoZXJlJ3MgYSB2NCwKPiBwbGVhc2UgbWFrZSB0aGUgY2hhbmdlIGJlZm9yZSByZXNl
bmRpbmcuICBUaGFua3MuIDotKQoKU29ycnksIG15IG1pc3Rha2UuIEkgd2lsbCBtYWtlIHRoZSBj
aGFuZ2UgaWYgSSBzZW5kIHY0LgoKVGhhbmtzLAotTlIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=

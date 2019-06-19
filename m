Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FAB4BBC0
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 16:35:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdbea-0005gB-Lc; Wed, 19 Jun 2019 14:33:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9VwC=US=gmail.com=denisobrezkov@srs-us1.protection.inumbo.net>)
 id 1hdbeZ-0005g4-6H
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 14:33:35 +0000
X-Inumbo-ID: 37abbc93-929f-11e9-8980-bc764e045a96
Received: from mail-oi1-x244.google.com (unknown [2607:f8b0:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 37abbc93-929f-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 14:33:34 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id s184so10704438oie.9
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2019 07:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YpWj6CitSORzjW15Yvl5iUJm5/0NEJAcq6OnYGWkZGE=;
 b=WBiq1R/UgguEMJ6FEtCBjaOqSl61zEbGNzwyb5lm0guy8L1JC0OR0C6Khaj4luUHJm
 wLgL6TzgttO1CZpwhmn7laL4uRdSboLum1ig01CP6xfBksJyAAaMq19vkCNqsm5LcKV/
 yJUf0xDDMOBBbrV5FBwmaAv5B5aCLY4ttuofhIm4+VvPxnzQlSSzBXn75/r4SkZIPon3
 E0nfWOasPNOL1NicDBBzFmV56sSzhbDy1/+bQ1GvHRms/RZNjQVhGFuSuZw5Wj5h1AyQ
 bi6lT4mXGntcaOgETzaum9lpL25LpK6moBKm4XVJt/cbi9bqWfYfJCPP2z6sSKHxAou3
 3azg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YpWj6CitSORzjW15Yvl5iUJm5/0NEJAcq6OnYGWkZGE=;
 b=TqTaF4xFeCIoqZsHXgnZu1MTsi3Z8IzMPK1Yk+Nyx6sBwz/xe0HoFdGRniFmK4oBQ5
 vNRJi8jlSJJH5hmPjJl5GnCi8lLB16bp4uslRIcs7kW8tCSoqYWBr63i4a0R8/Vw3YDX
 i3PuDqDoMt7Dy4xpNGFsGDib9Z39w5MVgZAR+kfp6aAziYWJ6IfYB6qEIPrEF2HxeSpy
 2AO79+2B9D6FN3vEB47nO/Tp2/tSaf6ONyDTtuUBvCiCVpJTULBEEtcM8Ew8zv9mMY6r
 18lwYG1H/4+EcUVtftGp6yZG3+6Yz1EyainbEPn01rvrn55U5F8VduU4L0TV0OSDr0OX
 cypg==
X-Gm-Message-State: APjAAAX/80XyCGaHwuh23zCqC4JdXDRp+E0uQ9JzB6xJrzbGsA7iqz+g
 Z3Y81N2o+vHsPJ9OaVZY1Afr4ED8CMhunNUBofA=
X-Google-Smtp-Source: APXvYqwg9r7rKf9nDJHiw3m9gUvCDP6cqxDEvg/rZ/cZfvr4dUzC3+vjktbaSochp3enlCuMzzTrZlAiPfJaTtgKDJs=
X-Received: by 2002:aca:5b86:: with SMTP id p128mr2942587oib.126.1560954814011; 
 Wed, 19 Jun 2019 07:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <287117b9-952c-1a92-26e0-9597df936c27@gmail.com>
 <cd936ab7-df65-1615-a03a-bea30b5814f9@arm.com>
 <f3596bd5-ede3-7299-e28f-033ad32e6c99@gmail.com>
 <62194faf-0bf8-61b8-a69f-e41934fb5a43@arm.com>
 <0c900a15-14ab-9947-bffe-2fbeed176486@gmail.com>
 <CALC81-vaVKgZoi27MauGTxjda8mchy5GRLipu5z=v1vh9fyvAg@mail.gmail.com>
 <747dd124-3511-f010-dac7-b9b23d7b44ad@gmail.com>
 <CALC81-tewzAtaaH94U1nVc-UiacR_YvqhaYcPXtXcviTFHAG8A@mail.gmail.com>
 <ecb2cf41-51e5-2ff2-5e61-72be64399e40@arm.com>
 <AM6PR0302MB32215CD7FAED139C682D92A386EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>
 <ef82a028-9e4e-9976-d205-42cbc4bfc8ac@arm.com>
 <AM6PR0302MB3221D649900B54C2FFA7003A86EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>
 <AM6PR03MB49190A0828A49569B64611B4E6EA0@AM6PR03MB4919.eurprd03.prod.outlook.com>
 <07a7084a-b798-0cc7-cca4-3fe58ea95835@arm.com>
 <666fc807-af6a-231c-9d7e-48ecabb07371@gmail.com>
 <2c0cced8-27ec-a3bb-b2bf-c037176a162a@arm.com>
 <4a2ae4d4-493a-d5f6-64da-1da313db3962@gmail.com>
In-Reply-To: <4a2ae4d4-493a-d5f6-64da-1da313db3962@gmail.com>
From: Denis Obrezkov <denisobrezkov@gmail.com>
Date: Wed, 19 Jun 2019 16:33:22 +0200
Message-ID: <CAGPpAzUpeFEmFX9FMkQDn+2gWnL1GmyEsL49DPLxWKBQ=_W0Eg@mail.gmail.com>
To: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [Xen-devel] Starting to port xen on beagleboard-x15 (GSoC 2019
 project)
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
Cc: Hunyue Yau <hy-gsoc@hy-research.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Andre Przywara <andre.przywara@arm.com>, Iain Hunter <drhunter95@gmail.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCtGB0YAsIDE5INC40Y7QvS4gMjAxOSDQsy4g0LIgMTQ6MDEsIEFuZHJpaSBBbmlzb3YgPGFu
ZHJpaS5hbmlzb3ZAZ21haWwuY29tPjoKPgo+Cj4KPiBPbiAxOC4wNi4xOSAxOToxOSwgSnVsaWVu
IEdyYWxsIHdyb3RlOgo+ID4gRGVuaXMgKHRoZSBhdXRob3Igb2YgdGhlIHRocmVhZCkgaXMgZG9p
bmcgYSBHU09DIHRvIHBvcnQgWGVuIG9uIHRoZSBCZWFnbGVCb2FyZCBYMTUuIFlvdSBlbmRlZCB1
cCBDQ2VkIGJlY2F1c2UgeW91IGNhbiBwcm92aWRlIGZlZWRiYWNrIGhvdyB0byBwcm9jZWVkLiBO
b3QgYmVjYXVzZSB3ZSB3YW50ZWQgeW91IHRvIGltcGxlbWVudCBpdC4uLgo+Cj4gT0sgdGhlbi4K
Pgo+IERlbmlzLAo+Cj4gRmVlbCBmcmVlIHRvIGNvbnRhY3QgbWUgaW4gY2FzZSB5b3UgbmVlZCBj
bGFyaWZpY2F0aW9ucyBhYm91dCB0aGUgc3R1ZmYuCnRoYW5rIHlvdQo+Cj4gLS0KPiBTaW5jZXJl
bHksCj4gQW5kcmlpIEFuaXNvdi4KClNvLCByaWdodCBub3cgSSBnZXQgYSBiaXQgZnVydGhlciBh
bmQgaXQgc2VlbXMgdGhhdCBDUFUxIHdhcyBzd2l0Y2hlZAp0byBoeXAgbW9kZToKaHR0cHM6Ly9n
aXRodWIuY29tL2VtYmVkZGVkZGVuL3hlbi9jb21taXQvMmQ3NmFlN2FhY2I3YzBlYTczMTJlYWRk
YjkxYzNlYjFlMTk2M2NjOQoKYW5kIHRoZSBvdXRwdXQ6Cmh0dHBzOi8vcGFzdGViaW4uY29tLzNK
Qnc2UzRLCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

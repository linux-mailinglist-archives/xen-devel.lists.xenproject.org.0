Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 695823144C
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 19:57:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWljR-0008LG-EM; Fri, 31 May 2019 17:54:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2tza=T7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hWljQ-0008LA-BA
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 17:54:20 +0000
X-Inumbo-ID: 1d4990b6-83cd-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 1d4990b6-83cd-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 17:54:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42D7AA78;
 Fri, 31 May 2019 10:54:19 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 565333F59C;
 Fri, 31 May 2019 10:54:18 -0700 (PDT)
To: Andre Przywara <andre.przywara@arm.com>
References: <1558949370-14331-1-git-send-email-andrii.anisov@gmail.com>
 <d63ff1d7-963a-bd1a-7835-ee5b30504628@arm.com>
 <20190531182511.7de8ff68@donnerap.cambridge.arm.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <56280030-d23f-5a6d-ed4d-6863af63b629@arm.com>
Date: Fri, 31 May 2019 18:54:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190531182511.7de8ff68@donnerap.cambridge.arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] gic: drop interrupts enabling on
 interrupts processing
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Andrii Anisov <andrii.anisov@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAzMS8wNS8yMDE5IDE4OjI1LCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPiBPbiBUdWUsIDI4
IE1heSAyMDE5IDE4OjA3OjE5ICswMTAwCj4gSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4gd3JvdGU6Cj4gCj4gWyAuLi4gXQo+IAo+PiBXaGlsZSBsb29raW5nIGF0IHRoZSBjb2Rl
LCBJIG5vdGljZWQgdGhhdCBpbiB0aGUgbmV3IHZnaWMgdmdpY19nZXRfaXJxKCkKPj4gbG9va3Mg
dW5zYWZlIHRvIGJlIGNhbGxlZCB3aXRoIGludGVycnVwdCB1bm1hc2tlZC4gVGhpcyBpcyBiZWNh
dXNlIG9uZQo+PiBvZiB0aGUgY2FsbGVlICh2Z2ljX2dldF9scGkoKSkgdGFrZXMgYSBzcGlubG9j
ayBhbmQgbm90IGEgc3BpbmxvY2tfaXJxLgo+PiBBbmRyZSwgd2hhdCBkbyB5b3UgdGhpbms/Cj4g
Cj4gSSB0aGluayB5b3UgYXJlIHJpZ2h0LiBJbiB2Z2ljX2luamVjdF9pcnEoKSwgcmlnaHQgYWZ0
ZXIgdGhlIGNhbGwgdG8gdmdpY19nZXRfaXJxKCksIHdlIHVzZSBzcGluX2xvY2tfaXJxc2F2ZSgp
IG9uIHRoZSBpcnFfbG9jaywgc28gdXNpbmcgdGhlIHNhbWUgaXJxc2F2ZSB2ZXJzaW9uIG9uIHRo
ZSBscGlfbGlzdF9sb2NrIHNlZW1zIG5lZWRlZC4gQnV0IHRoaXMgaXMgc29tZXdoYXQgdGhlb3Jl
dGljYWwgYXQgdGhlIG1vbWVudCwgYXMgSSB0aGluayB3ZSB3aWxsIG5ldmVyIExQSXMgdGhyb3Vn
aCB0aGUgbmV3IFZHSUMgYXQgdGhlIG1vbWVudC4KClRoYXQncyBjb3JyZWN0LCB3ZSBwcm9iYWJs
eSB3YW50IHRvIGFkZCB0aGF0IGluIHRoZSBsaXN0IG9mIFRPRE9zIGZvciB0aGUgbmV3IAp2R0lD
IDopLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 830581EA66
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 10:46:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQpWn-0004r0-Lk; Wed, 15 May 2019 08:44:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HoWo=TP=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hQpWm-0004qq-1x
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 08:44:44 +0000
X-Inumbo-ID: aebf82ea-76ed-11e9-8980-bc764e045a96
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id aebf82ea-76ed-11e9-8980-bc764e045a96;
 Wed, 15 May 2019 08:44:43 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id c17so1361455lfi.2
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2019 01:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dntjEfQvW7WsIMXtEjIZVD7Dx8M8+uzNj2UORiU5z9g=;
 b=aVSFZnDdxgPt2os3IcaUoBx9Hbh3jpnDnqcolotdCuklB8jQ/8h6inBn43en82+lOC
 gBI+dHzPie/9b9//l3ilRihOa8SKV8j5b/EPUmBgCsTjjNKVTO5dqI9CiyQ2nZ33w49I
 li+//3lrk4giUffFkgjic8MacTXEmhTy9KLVak9MgSwvPn20uVPmHi4WflkDLKlHdjDl
 d1P9akMHJU1PqS0ofDc7C3Xy5PhmbFUYlXw2zAHyK05AqUAm9CnP1r/yYHcuSNXT9zrv
 lhxDXR5QeJcVgg8zJuA2NgQX3LG96CE/mqpJmozE4WUjiCucHlQlW7dqrZzL3NOZYizb
 zrCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dntjEfQvW7WsIMXtEjIZVD7Dx8M8+uzNj2UORiU5z9g=;
 b=OcuXpQSm6rrKlf1LTkeHRONyq/k8dVy8kX+KjabDu9c8U5K4ZTVdIGNY+aL8NZIAox
 1R9QrX/r/rjCt73rgWGaPQ//POAef+3t68x7l4zp4gDlkoW5VQJN077LAbpB1Vx2rlQ6
 my6c7E6g5zHwWZMXnvkJ7GDh2yHX85zuXq7gM+qCC8s7GUHq42oBkigxRT4vX3oZ9BaV
 TxCf1v4YMxbNkEgY/851j8Zr4UilObMJw7JD3EnqWM3Ni62SoEU7ste7xyDRCBVAFzEo
 wSRvLeE+nXgqAM3B0COiYlQ5XU6ij6sGJ0pC07Abxz7m4Zby2N/khPBVLtkX6nYZ6mmX
 9+Qg==
X-Gm-Message-State: APjAAAXs3prBSzpgg2SBQKwh8iA1uSsnZlsglAGIc9jkekPKT9QtDz4Y
 ePj164m9YOkhyrAU9bCABpE=
X-Google-Smtp-Source: APXvYqy0c6k49oSEW95yIW7N+pUZI774HUO/qCmCEdwo2GNIXIKgzSCgKc8naEDirJdjo8WdSfz8wg==
X-Received: by 2002:ac2:4a8c:: with SMTP id l12mr19414477lfp.53.1557909881680; 
 Wed, 15 May 2019 01:44:41 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 x68sm265712lff.3.2019.05.15.01.44.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2019 01:44:40 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <e248dae9-c91c-c735-ea16-9bcb70c65e9d@arm.com>
 <959c8975-ec44-a788-25b3-84ee17520abc@gmail.com>
 <24f3e2b1-4889-1780-0e48-0c909f555997@arm.com>
 <4ac886b5-ad15-f0cf-5af8-91aaf7d2460e@gmail.com>
 <7bbea412-f4af-4dc8-199a-1c02ac02a7af@arm.com>
 <f71bdb25-ebd3-31fc-f5fc-b8d591c3cc28@gmail.com>
 <5CDAAE4F020000780022E941@prv1-mh.provo.novell.com>
 <945c7543-7c49-f278-0b0d-5b6492ce93ca@gmail.com>
 <5CDAC779020000780022EBA7@prv1-mh.provo.novell.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <9a285538-2c98-2b3d-9c1c-f7a21f9de890@gmail.com>
Date: Wed, 15 May 2019 11:44:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CDAC779020000780022EBA7@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSmFuLAoKT24gMTQuMDUuMTkgMTY6NDksIEphbiBCZXVsaWNoIHdyb3RlOgo+IElmIHRo
aXMgd2FzIGEgY29uY2VybiBvbmx5IGZvciBuZXdseSB3cml0dGVuIGNvZGUsIHRoaXMgd291bGQg
YmUgZmluZS4KPiBCdXQgeW91IG5lZWQgdG8gbWFrZSBzdXJlIGFsbCBleGlzdGluZyBjb2RlIGFs
c28gY29udGludWVzIHRvIHdvcmsKPiB3aXRoIHdoYXRldmVyIG5ldyBpbnRlcmZhY2UgeW91IGlt
cGxlbWVudC4KCkFuZCB0aGF0IGlzIG9uZSBtb3JlIHJlYXNvbiB3aHkgSSB0ZW5kIHRvIGludHJv
ZHVjZSB0aGUgbmV3IGludGVyZmFjZSBpbiBwYXJhbGxlbCB0byBiZSBmdWxseSBpbmRlcGVuZGVu
dCBmcm9tIHRoZSBvbGQgb25lLgpCdXQgbm90IGRvIGEgbWl4ZWQgaW1wbGVtZW50YXRpb24gYXMg
eW91IGFuZCBKdWxpZW4gc3VnZ2VzdC4KCj4gSnVzdCBiZWNhdXNlIGEga2VybmVsCj4gdXNlcyB5
b3VyIG5ldyBwaHlzaWNhbCBhZGRyZXNzIGJhc2VkIG1lY2hhbmlzbSBkb2Vzbid0IG1lYW4gdGhl
Cj4gYm9vdCBsb2FkZXIga25vd3MgdG8gdW5yZWdpc3RlciB3aGF0IGl0IGhhcyByZWdpc3RlcmVk
LgoKQXMgSnVsaWVuIGFscmVhZHkgc2FpZCwgdGhlIGN1cnJlbnQgaW50ZXJmYWNlIGhhcyBhbiBp
bXBsaWNpdCBtZWNoYW5pc20gdG8gdW5yZWdpc3RlciBydW5zdGF0ZSBhcmVhLgpBbHNvIGlmIHRo
ZSBib290bG9hZGVyIG1pc3NlcyB1bnJlZ2lzdGVyaW5nIHJ1bnN0YXRlIGFyZWEgd2l0aCB0aGUg
Y3VycmVudCBpbnRlcmZhY2UsIHdlIGFscmVhZHkgaGF2ZSB0aGUgYnJva2VuIHN5c3RlbS4KU28g
aXQgaXMgcmVhbGx5IHVwIHRvIHRoZSBndWVzdCBzeXN0ZW0gdG8gdGFrZSBjYXJlIGFib3V0IGl0
cyBwb3NzaWJsZSB0cmFuc2l0aW9ucy4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0187764C72
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 20:57:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlHjC-0003NK-Uo; Wed, 10 Jul 2019 18:54:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ivr2=VH=gmail.com=denisobrezkov@srs-us1.protection.inumbo.net>)
 id 1hlHjC-0003NF-2j
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 18:54:06 +0000
X-Inumbo-ID: 16a29d4a-a344-11e9-8980-bc764e045a96
Received: from mail-ed1-x52b.google.com (unknown [2a00:1450:4864:20::52b])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 16a29d4a-a344-11e9-8980-bc764e045a96;
 Wed, 10 Jul 2019 18:54:05 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id d4so3163516edr.13
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jul 2019 11:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:openpgp:autocrypt:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=kdNgjD54m5Ov588PmEB078yMc/Ryajlmd811erzhQbE=;
 b=ZU/uGdYSPxlHgk5Rtj688GNQSNTOxOyEo+Z60AI8BkN5gLXhSkLKweL8J3xKYkFxac
 llymc+UYg0aX8EPGuAeql9rokm1D30no3t7bah8vJwMqidmsWDmKpbOJhqx1NzdzIlH5
 IruvNGXSj12VxwjkX6QotCQchEIiq2+D7kSCAqWYmap3YW6mvDt+TDjB27z2UykfOibs
 MCzwpPZIc685CHICHIFSURXYp11xLhXqUmCmyfCXZ3U1Dfpfc5fhofwo0Wi2BBY7tmm3
 hkH15J1tZRUnPJY4z85k2hXHUxo3Jjvez4WytMCM9O4lkVXCx/mq5y08Julty47kpMeo
 uOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:openpgp:autocrypt:message-id
 :date:user-agent:mime-version:content-language
 :content-transfer-encoding;
 bh=kdNgjD54m5Ov588PmEB078yMc/Ryajlmd811erzhQbE=;
 b=t8i0aMzYHDBuriWEQTqpj5rhlZnUBy3ziCmNQ7v9YWU9geEtupzEDohM2sRrU6sxkz
 zxqhtuZ0+96Qo/ZPML2kzZWTsAevuiOS7Vtc2aQyGSfxlyetT1XgtjLmvqXsTQz+U/po
 GNfZUlqSe8Lkz1IbYMz5a+ZDYD0NubeG2eeJfsNriMx/qW5eIQ7HesO1xuxAgPWp40nO
 VnVQoD20lxgWrTLNvq9Vgwwsmk/kY14tlfdpGhLps4Bpbmj0VN4t4g6Fkqoe1rZWdl/+
 /jZvLHJU2ax7hS8cM3VBSKgmbEVdZava1wG/OAw4rJZiKCb3B2dgqv+ZyweEQ4JWDiN8
 UqhQ==
X-Gm-Message-State: APjAAAXxCPafyedfZcHtEz4TPOkuP0xC5d6qnszppcErp1xznyOYM24W
 wtFQwgNyZEIrqatHtg/FGqs=
X-Google-Smtp-Source: APXvYqxSfUSuQdVVOyg0N0U+3AkgCP6d4ol4DTmRi+d4lpdY63+Sy6OgyCZGZu9CuSTM2YSNl6xMYg==
X-Received: by 2002:a50:eb8f:: with SMTP id y15mr33433678edr.31.1562784844119; 
 Wed, 10 Jul 2019 11:54:04 -0700 (PDT)
Received: from ?IPv6:2001:16b8:6621:9400:1e4b:d6ff:fef9:46e6?
 (200116b8662194001e4bd6fffef946e6.dip.versatel-1u1.de.
 [2001:16b8:6621:9400:1e4b:d6ff:fef9:46e6])
 by smtp.gmail.com with ESMTPSA id a3sm632723ejb.83.2019.07.10.11.54.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 11:54:03 -0700 (PDT)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Iain Hunter <drhunter95@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>, Hunyue Yau <hy-gsoc@hy-research.com>
From: Denis Obrezkov <denisobrezkov@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=denisobrezkov@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <25386cfa-d0b7-83fe-4d87-5af3459d54bd@gmail.com>
Date: Wed, 10 Jul 2019 20:54:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [GSoC-2019] About the crossbar and xen
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpzbywgSSB0aGluayBJIHVuZGVyc3Rvb2Qgd2h5IHVhcnQgZG9lc24ndCB3b3JrLCB0
aGF0J3MgYmVjYXVzZSBhbGwgdGhlCmlycXMgYXJlIHJvdXRlZCB0byB0aGUgY3Jvc3NiYXIgbm90
IHRvIEdJQywgc28sIHhlbiBjYW4ndCBkZWFsIHdpdGggdGhlbS4KCk9uZSB0aGluZyBJIGFtIGNv
bmNlcm5lZCBvZiBpcyB0aGU6CglpbnRlcnJ1cHQtY29udHJvbGxlckA0ODI4MTAwMCB7CgkJY29t
cGF0aWJsZSA9ICJ0aSxvbWFwNS13dWdlbi1tcHUiLCAidGksb21hcDQtd3VnZW4tbXB1IjsKCQlp
bnRlcnJ1cHQtY29udHJvbGxlcjsKCQkjaW50ZXJydXB0LWNlbGxzID0gPDB4MDAwMDAwMDM+OwoJ
CXJlZyA9IDwweDAwMDAwMDAwIDB4NDgyODEwMDAgMHgwMDAwMDAwMCAweDAwMDAxMDAwPjsKCQlp
bnRlcnJ1cHQtcGFyZW50ID0gPDB4MDAwMDAwMDI+OwoJCXBoYW5kbGUgPSA8MHgwMDAwMDAwOD47
Cgl9OwpBbmQgdGhpcyBpcyBhbiBpbnRlcnJ1cHQtcGFyZW50IGZvciB0aGUgY3Jvc3NiYXIuIFNv
LCBpdCBpcyBub3QgY2xlYXIKZm9yIG1lIGhvdyBpdCBwYXJ0aWNpcGF0ZXMgaW4gaW50ZXJydXB0
IHByb2Nlc3NpbmcuIEFueSB0aG91Z2h0cz8KCkhlcmUgaXMgbXkgZGV2aWNlIHRyZWU6IGh0dHBz
Oi8vcGFzdGViaW4uY29tL1hlYzU3SmNyCi0tIApSZWdhcmRzLCBEZW5pcyBPYnJlemtvdgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

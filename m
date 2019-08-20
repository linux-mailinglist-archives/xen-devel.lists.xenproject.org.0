Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F64496279
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 16:31:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i057u-0001cO-3Z; Tue, 20 Aug 2019 14:28:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3t4G=WQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i057s-0001c5-AN
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 14:28:44 +0000
X-Inumbo-ID: cf8c5792-c356-11e9-893a-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf8c5792-c356-11e9-893a-bc764e2007e4;
 Tue, 20 Aug 2019 14:28:43 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h15so5309191ljg.10
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2019 07:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=RnkoIo4s6j/9q7D2nKapxTQsGB04Got44Yl4wmcJHO0=;
 b=DEUHgFt/5Cn3uKJ5TPw+IDb44eKzVYEDRrb8DnsPGZLPv+uVI6NvLpZwUpO9dNHu/r
 4cOGZx/g2+njfZnJujSjLM73d7jjgvAd/59E8h6jvGFj3zBXwLx6S2ztFuVJzu83jruq
 3B7XZkpisSUnXyzfXjZ72QnaopmOT2TQUhd5acqs36gHijk0VzkMyXTg7kBv8c95GEcq
 EJCNVA2BiPzi6Xw372wxnroysbaLOe1fSVOWbvAwakZwNYm3FIrW3UsgoJDBRzLeUghW
 jOykhTzZGfP/NY3/gfcwxuoDnr6yux0Lxox6uvcCaBDLbT92daw9K6IGE1TTcUZ183/4
 Ak3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=RnkoIo4s6j/9q7D2nKapxTQsGB04Got44Yl4wmcJHO0=;
 b=m64xFECEXDAoEEI5c07VXQRBRMJyl1j9krM1tmM+f6cQNYCFzods/epeURZmD1yP3S
 r36j9xcTnPky+oAdK+XuaI+mgqcFL4Fcc3L/fr7drWbvcwe5xPyJFldwga0ah2ZUtSqe
 DKO05JsqkHPTozi3qBC6IgIYK8PKHLodwWZsvDcZiBOeq2Tq2BWdG9ZfsU0M+G1gOQWm
 pVOSzhatcBQ3stfEVSohG0S0n+Dvg/JNAsEBCJNHeV4ONBRhWjcBAFDHp+c2sfowftI8
 ufgMClKcn+xLbsN6AV/hQk8PXLB8MA+iTvlpJdvYP+l6lVkw3dPfe/o73LTw6gWDBgCY
 OhBQ==
X-Gm-Message-State: APjAAAVbHsh/16tN1IvqG+27mv1R/9xmuRGGiqwQCBNbBGeQ0vdeBvNi
 dkVXAl86lW5ErbpBP8tRqO8=
X-Google-Smtp-Source: APXvYqzs4+wYBYhVrfoWnP11QvdVAwensxZCyQ6IOlQQvMj/FJmgqfza8GFEE6ZHKTcwXZy7xFnxtA==
X-Received: by 2002:a2e:91d1:: with SMTP id u17mr15360904ljg.98.1566311322220; 
 Tue, 20 Aug 2019 07:28:42 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id p11sm2844904ljg.56.2019.08.20.07.28.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Aug 2019 07:28:41 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190820122255.9864-1-julien.grall@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <ccfee255-79e1-43f1-a92b-28c6c3ab6606@gmail.com>
Date: Tue, 20 Aug 2019 17:28:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820122255.9864-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: iommu: Panic if not all IOMMUs are
 initialized
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDIwLjA4LjE5IDE1OjIyLCBKdWxpZW4gR3JhbGwgd3JvdGU6CgpIaSwgSnVsaWVuCgo+ICAg
Cj4gLSAgICBpb21tdV9zZXR1cCgpOwo+ICsgICAgcmMgPSBpb21tdV9zZXR1cCgpOwo+ICsgICAg
aWYgKCAhaW9tbXVfZW5hYmxlZCAmJiByYyAhPSAtRU5PREVWICkKPiArICAgICAgICBwYW5pYygi
Q291bGRuJ3QgY29uZmlndXJlIGNvcnJlY3RseSBhbGwgdGhlIElPTU1Vcy4iKTsKPiAgIAoKUGxl
YXNlIGFkZCAiXG4iCgoKWW91IGNhbiBhZGQ6CgpUZXN0ZWQtYnk6IE9sZWtzYW5kciBUeXNoY2hl
bmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KCi0tIApSZWdhcmRzLAoKT2xla3Nh
bmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs

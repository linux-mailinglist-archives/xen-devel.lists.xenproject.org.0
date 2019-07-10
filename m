Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DCC64D0F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 21:56:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlIfa-0007oA-5X; Wed, 10 Jul 2019 19:54:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ivr2=VH=gmail.com=denisobrezkov@srs-us1.protection.inumbo.net>)
 id 1hlIfY-0007o5-La
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 19:54:24 +0000
X-Inumbo-ID: 83a0dc04-a34c-11e9-8980-bc764e045a96
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 83a0dc04-a34c-11e9-8980-bc764e045a96;
 Wed, 10 Jul 2019 19:54:23 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id i11so3364971edq.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jul 2019 12:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=awp2KFQJ268jAUOVSRmondv50I1zQVtyHYL0KbCjCZM=;
 b=aurnCRCHYMLjowQdpjY7MD/jVDUrzGhFiyxuyR3eV7sFJW2kF/jVvq4yifwmDnuijQ
 Zhp/1qOZG7u3i9rQkim4xKQl3pB1/Zv+C6zNzM+5kdn9H05hZxydTLDpO7oThmlaD2Dl
 fudUhXqt+LbFcFIv50D0E3758yuYUVK5CE5NJZx/xu5Ask3RTuy3wq2qsrOuSN4by9mv
 a6pfDlpeILKdgQTV/cDhPJpTCUl9jafEKaAgf/DuAoUGaAk7T+E7IRFs5uFEfB2c+boF
 9uaB5V6tHwnUwy7Umxe4VT3yBCM3RhxmXtRCQJo7WGbXwZqtXKphJIqDcB07hdlytvbp
 gfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=awp2KFQJ268jAUOVSRmondv50I1zQVtyHYL0KbCjCZM=;
 b=ZqyZiQs6CYVLjYq7jSL4kA51pjLz6VDcjyzuO8S0R7pjLCdpnchKopmEjDOz/QooZ0
 JTenuSXSN1jFBZymkPaciL8sBxpFcskOGrcwe6qMbG47P6Bm5mfyiFEeXu3rrQ7twcCJ
 M9K/9k+SXBJ4qiRHf8b5he+5K4pLy1pYOz3CFVfKryUQaeUv8pX8G2QZID5DdRR2A6rN
 m47HwdxB8BHBG4LX2sETpQYY5Ta0HtMGZ0A83aGj2kmYIUNVjkXWQmufvck8ohOwBxSX
 BCid8tC/4snOQT+C0mwvUIgmheWBsbvMDYgYtsn86B2QrVvdoG7NgbPRvVQYCTcTXoXK
 Z/pg==
X-Gm-Message-State: APjAAAU0a49ysYlRjlYxOQ93X27D0MTxfAfmqbdb/shj5yYQkqaDWXTS
 ZfXnc5NCObnMYQx4jkOy6w4=
X-Google-Smtp-Source: APXvYqwW8qtK210gZdIMkT49XL47ysMg+Idu3s0QEaBensaVxHYnwOjnERuwUwIEOfD7ogXANXYWPg==
X-Received: by 2002:a50:b635:: with SMTP id b50mr33349723ede.293.1562788462970; 
 Wed, 10 Jul 2019 12:54:22 -0700 (PDT)
Received: from ?IPv6:2001:16b8:6621:9400:1e4b:d6ff:fef9:46e6?
 (200116b8662194001e4bd6fffef946e6.dip.versatel-1u1.de.
 [2001:16b8:6621:9400:1e4b:d6ff:fef9:46e6])
 by smtp.gmail.com with ESMTPSA id n5sm661353eje.44.2019.07.10.12.54.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 12:54:22 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <25386cfa-d0b7-83fe-4d87-5af3459d54bd@gmail.com>
 <alpine.DEB.2.21.1907101447440.12168@sstabellini-ThinkPad-T480s>
From: Denis Obrezkov <denisobrezkov@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=denisobrezkov@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <23ac4d9b-8cbe-7c43-5c28-30b2e7cbbdeb@gmail.com>
Date: Wed, 10 Jul 2019 21:54:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1907101447440.12168@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [GSoC-2019] About the crossbar and xen
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>, Hunyue Yau <hy-gsoc@hy-research.com>,
 Iain Hunter <drhunter95@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA3LzEwLzE5IDk6NDkgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKCj4gCj4g
ICBwaGFuZGxlID0gPDB4MDAwMDAwMDI+Owo+IAo+IEkgdGhpbmsgdGhhdCBtZWFucyB0aGF0IGlu
dGVycnVwdHMgZ28gdG8gdGhlIEdJQyB2aWEgQ3Jvc3NiYXI7IGkuZS4gdGhlCj4gcGFyZW50IGlu
dGVycnVwdCBjb250cm9sbGVyIG9mIENyb3NzYmFyIGlzIHRoZSBHSUMuCj4gCkJ1dCB0aGUgY3Jv
c3NiYXIncyBpbnRlcnJ1cHQtcGFyZW50IG5vZGUgaXMgMHgwMDAwMDAwOCBhbmQgcGhhbmRsZSB2
YWx1ZQoweDAwMDAwMDA4IGJlbG9uZ3MgdG8KaW50ZXJydXB0LWNvbnRyb2xsZXJANDgyODEwMDAg
ewoJCWNvbXBhdGlibGUgPSAidGksb21hcDUtd3VnZW4tbXB1IiwgInRpLG9tYXA0LXd1Z2VuLW1w
dSI7CgpGb3IgbWUgaXQgbG9va3MgbGlrZSBpbnRlcnJ1cHRzIGZyb20gY3Jvc3NiYXIgZ29lcyB0
byB3dWdlbiBhbmQgdGhlIGZyb20Kd3VnZW4gdG8gR0lDLiBCdXQgSSBkb24ndCBxdWl0ZSB1bmRl
cnN0YW5kIGl0LgotLSAKUmVnYXJkcywgRGVuaXMgT2JyZXprb3YKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA947DAE8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 14:08:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ht9pp-0002KM-K6; Thu, 01 Aug 2019 12:05:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H9Oh=V5=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1ht9pn-0002KG-AT
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 12:05:27 +0000
X-Inumbo-ID: a53602e4-b454-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a53602e4-b454-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 12:05:26 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m8so35514367lji.7
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 05:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ed7arSXReeVaoFtgLXXC1nZKrXxAD3z6VFn+18Ha/Lk=;
 b=WmUJIpENgaejVXRY3SzhHQ6o66KBIWWvRGLNbKeTmeRKAln6s6WgNvi/1AlaCB+b2T
 5L8bdgXKfY03QqcZI1T2n6F2irBOI0fyeryUsAWcNcPasoA9ss0T1VKdMDgAd657xrdV
 WtY2eB3qYneCCxpDklPP61Wt1UWEj+4aCWvlzFr9kHsvDLuZBI3KQeJHONsAuXOhrq9S
 iNiLvVUAPB8tSI4lWxO93M3FUTv/+K+WCRZEYmV9tnCBGnC23NrqPBdnXH1n2F/GbiYs
 Fqp6JroX5pOHXsmE947ScTXWfWP9OdZZbMB7Q0fwFXFxRPNFHBvP9NYl6vjV/8FTJ07L
 8Syg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ed7arSXReeVaoFtgLXXC1nZKrXxAD3z6VFn+18Ha/Lk=;
 b=maNc4FiHqaNVy+ny7af0uSQWXjnqQ1JYw+hGnnGk23LS7mH2bZRCDC2HNC0uN4mPvH
 /53FEc0E0vurSbSvrABoO1UOcvFYflP+a5+Tmx5rbbK6bEtqKhLUI8fz/c21lCVJt13a
 WgNwga9RP0fqTbybh+MarsKsyWXJ7IvosKzLx9u0+b/qPgcS/friRcVqjp2qsKVT8gTr
 DC+tAWH8N0h2P4I1YMixZwrx/7rhysFnWYcp5HQ37zM6N2qeMauzC6OHOdpOlnn/dKI6
 8uvFq7Xg2Idd0YG7irNW9hQaNCJDX6z33U8aSdAVIj3ETuCcNs1r4twZJKqhbOFMRwk0
 4NHg==
X-Gm-Message-State: APjAAAXKCB0e3GPJYevc5ocMwTmDS3QpKyMfDXtbglOyXG81rQZnvc10
 p+ooKfOLr7RY7YwJjryROeiEu9r4
X-Google-Smtp-Source: APXvYqzsL9aDqfHvgzh/c1zfSZ1XDI1wHI7dpreiGNEoH4pKOYNUK9IDra6VwRmHfFeYZuBNHnCjuQ==
X-Received: by 2002:a2e:1459:: with SMTP id 25mr66304188lju.153.1564661124565; 
 Thu, 01 Aug 2019 05:05:24 -0700 (PDT)
Received: from 3489.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id u18sm12147150lfe.65.2019.08.01.05.05.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 05:05:23 -0700 (PDT)
From: Viktor Mitin <viktor.mitin.19@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  1 Aug 2019 15:04:50 +0300
Message-Id: <20190801120452.6814-1-viktor.mitin.19@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH v5 0/2] xen/arm: Consolidate make_timer_node and
 make_timer_domU_node
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
Cc: Viktor Mitin <viktor.mitin.19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnVuY3Rpb25zIG1ha2VfdGltZXJfbm9kZSBhbmQgbWFrZV90aW1lcl9kb21VX25vZGUgYXJlIHF1
aXRlIHNpbWlsYXIsCnNvIGl0IGlzIGJldHRlciB0byBjb25zb2xpZGF0ZSB0aGVtIHRvIGF2b2lk
IGRpc2NyZXBhbmN5LgoKVGhpcyBwYXRjaCBzZXJpZXMgYWNoaXZlcyB0aGlzIGdvYWwgaW4gdHdv
IHN0ZXBzOgotIEV4dGVuZCBmZHRfcHJvcGVydHlfaW50ZXJydXB0cyB0byBkZWFsIHdpdGggb3Ro
ZXIgZG9tYWluIHRoYW4gdGhlIGh3ZG9tLgotIENvbnNvbGlkYXRlIG1ha2VfdGltZXJfbm9kZSBh
bmQgbWFrZV90aW1lcl9kb21VX25vZGUgaW50byBvbmUgZnVuY3Rpb246CiAgbWFrZV90aW1lcl9u
b2RlKGNvbnN0IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8pCgpWaWt0b3IgTWl0aW4gKDIpOgog
IHhlbi9hcm06IGV4dGVuZCBmZHRfcHJvcGVydHlfaW50ZXJydXB0cyB0byBzdXBwb3J0IERvbVUK
ICB4ZW4vYXJtOiBjb25zb2xpZGF0ZSBtYWtlX3RpbWVyX25vZGUgYW5kIG1ha2VfdGltZXJfZG9t
VV9ub2RlCgogeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgMTI4ICsrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKyks
IDc2IGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=

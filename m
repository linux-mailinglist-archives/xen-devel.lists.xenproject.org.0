Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CEA84C32
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 15:00:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvLVn-000189-HA; Wed, 07 Aug 2019 12:57:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EA5+=WD=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hvLVl-00017y-Rw
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 12:57:49 +0000
X-Inumbo-ID: f4ecbbfb-b912-11e9-8980-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f4ecbbfb-b912-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 12:57:49 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id r9so85373674ljg.5
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 05:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ZBof11h7OSEBOC/U337k/8gGlRuCR+IfrkR1UYdfluk=;
 b=mq4eyHUjfjl2knWObSfbtWDXfCKjTOKDsFNGyA8eRSspn5D6HEb6md8v5fyAbDFu/M
 AbNYW2bhc7sOrZ3TnHp+UxhKbpWVqpfo8UXj6bo5owCCRA7rJt4BqTc10lsZk9U0Bocx
 Msy9n2K9vOGA2qm3J7bywfFcIWRz9YDsZchUOeIclrW6veuHyQnuInpI4SV1xunvjbyw
 oohhxO8WA8eauGLEAfchsHmrRd4i6+H79hq2SiRmcjVxAXnbCN6ypaIqQpunB4cZUv9+
 XzB+9kFKBWga/3FowOERHGfNqJ7Z535g69mOfcGB07yktshglSiDdi15gZODZCRnVSBo
 Ooug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZBof11h7OSEBOC/U337k/8gGlRuCR+IfrkR1UYdfluk=;
 b=jvxz+XNWZkPIqNEVorN8pLxr0KzKcq+MsrfbLZSBHqfP3vlt0p6DAVBZntYur7KGaa
 NHJy8ZVY5U1oT+BtFTAw55rEkI2zOTowh65HnV2W6tbA60wPfhHBgaqf4qgTbI+dagV2
 O1wK1sdUa2zZ1o4YLmoo7VfGghivAkUG7LymiUo3NpQjec6lAzRpxPXTTLfiB+8/jePs
 7hu3jGStkWGerQJ2Jy3Q2hG+lt4+bVE9W1TtjYqivu+VyHA/pmwX1H4SKLFAjZYfM93J
 VXdD7NbMi3z4zwwAgA5BETJezRlip1xAHJO+PVp/FZ0X6zvfPEOM4XDU5qW+vTFmC/LV
 oZ/g==
X-Gm-Message-State: APjAAAWECX62BMG18rxoR+9XREqt4p7xadz3HBOa5bMs736Bi8EDTAmD
 4qidTF8dTFT6AnSIN07IHjSgPxj1
X-Google-Smtp-Source: APXvYqwcSAAGZxYB55UYiFWD4I4v1ZvWoNplGqq+bZkJkXB8SbW2AI+Co2+V03fnrICacjzOhdgH8Q==
X-Received: by 2002:a2e:9192:: with SMTP id f18mr4792673ljg.52.1565182667348; 
 Wed, 07 Aug 2019 05:57:47 -0700 (PDT)
Received: from 3489.kyiv.epam.com ([178.133.153.36])
 by smtp.gmail.com with ESMTPSA id a15sm2033220lfo.2.2019.08.07.05.57.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 05:57:46 -0700 (PDT)
From: Viktor Mitin <viktor.mitin.19@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  7 Aug 2019 15:57:23 +0300
Message-Id: <20190807125725.31683-1-viktor.mitin.19@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH v8 0/2] xen/arm: Consolidate make_timer_node and
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Viktor Mitin <viktor.mitin.19@gmail.com>
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
bmQgbWFrZV90aW1lcl9kb21VX25vZGUgaW50byBvbmUgZnVuY3Rpb246CgpWaWt0b3IgTWl0aW4g
KDIpOgogIHhlbi9hcm06IGV4dGVuZCBmZHRfcHJvcGVydHlfaW50ZXJydXB0cyB0byBzdXBwb3J0
IERvbVUKICB4ZW4vYXJtOiBjb25zb2xpZGF0ZSBtYWtlX3RpbWVyX25vZGUgYW5kIG1ha2VfdGlt
ZXJfZG9tVV9ub2RlCgogeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgMTE4ICsrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQ0IGluc2VydGlv
bnMoKyksIDc0IGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

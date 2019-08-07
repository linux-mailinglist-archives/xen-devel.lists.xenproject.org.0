Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE758492F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 12:13:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvItz-00034F-LN; Wed, 07 Aug 2019 10:10:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EA5+=WD=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hvItx-00034A-SW
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 10:10:37 +0000
X-Inumbo-ID: 9969c5d1-b8fb-11e9-8980-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9969c5d1-b8fb-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 10:10:37 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id a30so542060lfk.12
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 03:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ZBof11h7OSEBOC/U337k/8gGlRuCR+IfrkR1UYdfluk=;
 b=Ru4CuPqAp8hb7X4xLvx6bIR+x63DLSLtawZfiyb9kvve4LDTx1tQol0CMSWdvm2fbX
 7LU0LIr67g2nU2t8gy5Je+C5VrmSvsL4x67v9Ifu0XIYF8b7HHlr3SIyXXSpPEiJQ5xp
 8CbQKnNGk5K0RbVJzwwuUZ/QIA+30d+OSiJvFgkWh5yfudLv4+af6ztVIzjmy3XoiRMC
 axI0nYzWPJbmjSLMaqMcWetlEiPYVJy1V51Ftm8JEyXdv/hg62XXE9HfbOykP/MoDy3L
 FcvRXeSSOG1R5H3Z5o+RJsDXDX6fgwdtoYeeVdoWLpar//rDzJ8R2hMdWhxdQ4p9UmQm
 hG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZBof11h7OSEBOC/U337k/8gGlRuCR+IfrkR1UYdfluk=;
 b=So13g7rcmPfC5zpNtVWBKxkJPEZawtt928p7rTxlEuAbyg6/S7j/zzXSu351woFfnN
 gAsuIXfYcOyYkqJ9cuCPZd3uIHySWocARG34eE4vXDXyuk6jHMUyJeC6dpu+kvrofKvq
 es+zYAgam8kwgjEevLop0Wi31A7vh6YR38zAOxgl6MTsdMYuL/0N7db3jkl5bB/q+L5H
 v3XMSlrVS1BJ8Htryw8zYZiWrI4db/qT/+2wUcvM7/M5Dw/YQyPCiAHG0+vtdgmrgjTi
 3dHv63UlavRmSUrkcMRK/YNl6INgL6xQ0mdO0/3fxjfCc8IaqJZRbFETnTnkhUAp94hA
 CyUw==
X-Gm-Message-State: APjAAAUMsh5H8L1Rpw3P6Pv1ESH6Lj76d41ZajMakcGR4syyCjtaLZsH
 vCZfVkuBXvzmeVtnmlgY8ZhEeins
X-Google-Smtp-Source: APXvYqwQpKtSPmnc3n7nqJ9IyJb6Aw+bHmaHR2qtLj99ApD54ZqX/DiHd+zS9vIlocK+001JtgE1fg==
X-Received: by 2002:ac2:5976:: with SMTP id h22mr5366879lfp.79.1565172635380; 
 Wed, 07 Aug 2019 03:10:35 -0700 (PDT)
Received: from 3489.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id n24sm18384408ljc.25.2019.08.07.03.10.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 03:10:34 -0700 (PDT)
From: Viktor Mitin <viktor.mitin.19@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  7 Aug 2019 13:10:26 +0300
Message-Id: <20190807101028.28778-1-viktor.mitin.19@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH v7 0/2] xen/arm: Consolidate make_timer_node and
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
bmQgbWFrZV90aW1lcl9kb21VX25vZGUgaW50byBvbmUgZnVuY3Rpb246CgpWaWt0b3IgTWl0aW4g
KDIpOgogIHhlbi9hcm06IGV4dGVuZCBmZHRfcHJvcGVydHlfaW50ZXJydXB0cyB0byBzdXBwb3J0
IERvbVUKICB4ZW4vYXJtOiBjb25zb2xpZGF0ZSBtYWtlX3RpbWVyX25vZGUgYW5kIG1ha2VfdGlt
ZXJfZG9tVV9ub2RlCgogeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgMTE4ICsrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQ0IGluc2VydGlv
bnMoKyksIDc0IGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

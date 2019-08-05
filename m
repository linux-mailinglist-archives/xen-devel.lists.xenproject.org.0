Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C71D081858
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 13:45:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hubP1-0003pa-6z; Mon, 05 Aug 2019 11:43:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1x4A=WB=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hubOz-0003pV-S1
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 11:43:45 +0000
X-Inumbo-ID: 46f75d60-b776-11e9-8980-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 46f75d60-b776-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 11:43:44 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y17so54471048ljk.10
 for <xen-devel@lists.xenproject.org>; Mon, 05 Aug 2019 04:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=4C2OWib1H1mdgJvinElwjJ3QmclF3Xi+3gvhXtF+PDw=;
 b=dLZgJggRNLhXC0AaZxwz8IlRiwwVcNHq3gh74xY9J7T+7IpP9oCRdbq92yoQfJ1+Q1
 m7TwjLTFXAGUezh8mnqA5Xqa6bgYJqtwurCMUmdx22YMIATtEouyPfKdfgsWmzphLFWA
 hOATJ1R2TF2300fkaDtbUn834JFExcoTRUg9qxEIaeEpu0Fpq2SlcREWWHE1VUriNsw3
 lnrA6PJOEdJaegIdKqsxJ5WZAQpU88m6zxGwLSP69/Q8tptK7IjVUuDyK78x7BwvLLOt
 C2xTznIS9y27tuj2dSklsnU9GMQUYmTn7CYhKLetfuI/gN7nU6qFPSdEweD6CzGZqSzb
 C/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=4C2OWib1H1mdgJvinElwjJ3QmclF3Xi+3gvhXtF+PDw=;
 b=qwaHPHlt51RKKalo9Pj7HcvQpuNTE/4XCrjL3zGgh1K4/BdgFMxdqRtImF0iLH65x2
 QRbpyBJOpDfU+X9rMrArxPaV6VBNDnDMjioLaBr0g09aQb5QoPZttF3RUMkMdDzNG0d5
 AUlGyzlG8U8tZ6doGXdKtuO8wKuiv0yTvHVFGlBdsnu04f0+O3oh2W+Vf5sSnjbGpduy
 RehiNqx0zyglyL2SI+m9yDO8W9zoSAqYlK+Oa+0HvUwESvZHrdUzjCyW4K/VGY+6cnHt
 cDzzqSahoY+nfxvTih0GCVWdhLYs8UlLRvTQCR3tHvb5DwR9WM/41jKFZoMG0KqHHabn
 AFDA==
X-Gm-Message-State: APjAAAUjzs41im/qTKo+jkORbrkEqy0nP1irsSRMj2Mwhd2b2xd1Fekz
 r1+nzLOYu1ExcDl+6bn0SAP0Ah8h
X-Google-Smtp-Source: APXvYqwDtGPGmcwTDNHgiho/4iihsNJyFztBEedoBCaqlAxnbYFPgPYsQ9m0V9nZhDUbU6TKtwLPQA==
X-Received: by 2002:a2e:98d7:: with SMTP id s23mr37731599ljj.179.1565005422907; 
 Mon, 05 Aug 2019 04:43:42 -0700 (PDT)
Received: from 3489.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id b1sm17285057ljj.26.2019.08.05.04.43.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 04:43:42 -0700 (PDT)
From: Viktor Mitin <viktor.mitin.19@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  5 Aug 2019 14:43:29 +0300
Message-Id: <20190805114332.15329-1-viktor.mitin.19@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH v6 0/2] xen/arm: Consolidate make_timer_node and
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
VV9ub2RlCgogeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgMTIyICsrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyks
IDc0IGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=

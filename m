Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF49118EF84
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 06:38:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGFjx-0007wZ-Bt; Mon, 23 Mar 2020 05:35:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zDPB=5I=gmail.com=yyankovskyi@srs-us1.protection.inumbo.net>)
 id 1jGFjv-0007wM-VW
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 05:35:07 +0000
X-Inumbo-ID: 0dd68cc8-6cc8-11ea-92cf-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0dd68cc8-6cc8-11ea-92cf-bc764e2007e4;
 Mon, 23 Mar 2020 05:35:07 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b2so15333672wrj.10
 for <xen-devel@lists.xenproject.org>; Sun, 22 Mar 2020 22:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=48qkqxYGNTDT4PSF+80i7p8bQweaG9a4WqU/RKeDBq0=;
 b=HvHOEg6bjFJZoPMKPOmc7fwaVV2PDx1Ej1qXD4A4KcfoHT4syJkL251SH4ddfaSJay
 LPG6C91roOJSUvy0ke+r7pFnsOYGJ07pHwVSYGbZBje3Pn/j+Eqo4r5KbfG7ddlkDr8X
 XXe21LX8S9C4hlWgexmfve42E6GH+e9sbTpqE3kVe23+MBRpEYLR4OX2kr6FWTObvxJ0
 5URCx0Xc83wMqefkAMRfk4fJHl1qFA5HMp3x4hPzWGme60NBZLkNguorjZv8XTEu2Zta
 xvWzY4CFtu3/pI59o8w3UutM5Ex/oEe8SYq9ltKHJfTHz30uUeuS73UfE0jWqbSLSJWo
 Uptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=48qkqxYGNTDT4PSF+80i7p8bQweaG9a4WqU/RKeDBq0=;
 b=DnhZCJV8dMHIMel3Oj9WCTw4qVnXQN4E0CCr7EuOGhHNGLQ/hsrdoh0JC+hBWacHnq
 FOCOhE/zbpoxd+BmPloVQPJFTWgGwLm7IEmuCzDaAcXaC2MnLTdGTRLCu37bYGqMYMn1
 /VVhHpzcqcVqgOH0Zoq1KgDCAWRKHK3JORTnOWeQo9umLDpEMEF+6096Cui+AFRwM1xG
 V1lDdgBAji1it4PokHIKO2JwyktWfJWuCmSFmlNEfvJA5FqG5AtzhVHZG65MGX0q074S
 vWlZGjnx4gBD8eLmRFHD/5Iww9mRHcdgIy5SLGZIAqZazZzPJP8daBaiLuOyfQQxnoUe
 Geuw==
X-Gm-Message-State: ANhLgQ2oA371RHHTZ2N+ERtqFXlw+6jyC5UiUuwose/S58BadwvqOtXd
 /gttlRgmCSNQCKwTbj9VpWg=
X-Google-Smtp-Source: ADFU+vtxXvjXEAlDtqjeAJ71CW/iwYi4dJYF2EK/ocEUKGF4ITV9b2s0pUjEdrnOwB6r7yU2RMkscQ==
X-Received: by 2002:adf:9ccb:: with SMTP id h11mr7645800wre.22.1584941706626; 
 Sun, 22 Mar 2020 22:35:06 -0700 (PDT)
Received: from kbp1-lhp-F74019 (a81-14-236-68.net-htp.de. [81.14.236.68])
 by smtp.gmail.com with ESMTPSA id z129sm19935999wmb.7.2020.03.22.22.35.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 22 Mar 2020 22:35:06 -0700 (PDT)
Date: Mon, 23 Mar 2020 07:35:03 +0200
From: Yan Yankovskyi <yyankovskyi@gmail.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Jan Beulich <jbeulich@suse.com>
Message-ID: <20200323053503.GA1406@kbp1-lhp-F74019>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: [Xen-devel] [PATCH 2/2] evtchn: Change evtchn port type to
 evtchn_port_t
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

c3RydWN0IGV2dGNobl9zZXRfcHJpb3JpdHkgdXNlcyB1aW50MzJfdCB0eXBlIGZvciBldmVudCBj
aGFubmVsIHBvcnQuClJlcGxhY2UgdGhlIHR5cGUgd2l0aCBldnRjaG5fcG9ydF90LiBTdWNoIGNo
YW5nZSBpcyBhbHNvIGRvbmUgaW4gTGludXguCgpTaWduZWQtb2ZmLWJ5OiBZYW4gWWFua292c2t5
aSA8eXlhbmtvdnNreWlAZ21haWwuY29tPgotLS0KIHhlbi9pbmNsdWRlL3B1YmxpYy9ldmVudF9j
aGFubmVsLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvZXZlbnRfY2hhbm5lbC5oIGIv
eGVuL2luY2x1ZGUvcHVibGljL2V2ZW50X2NoYW5uZWwuaAppbmRleCA0NGM1NDlkZDZiLi5jZmI3
OTI5ZmVmIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvZXZlbnRfY2hhbm5lbC5oCisr
KyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9ldmVudF9jaGFubmVsLmgKQEAgLTMwNyw3ICszMDcsNyBA
QCB0eXBlZGVmIHN0cnVjdCBldnRjaG5fZXhwYW5kX2FycmF5IGV2dGNobl9leHBhbmRfYXJyYXlf
dDsKICAqLwogc3RydWN0IGV2dGNobl9zZXRfcHJpb3JpdHkgewogICAgIC8qIElOIHBhcmFtZXRl
cnMuICovCi0gICAgdWludDMyX3QgcG9ydDsKKyAgICBldnRjaG5fcG9ydF90IHBvcnQ7CiAgICAg
dWludDMyX3QgcHJpb3JpdHk7CiB9OwogdHlwZWRlZiBzdHJ1Y3QgZXZ0Y2huX3NldF9wcmlvcml0
eSBldnRjaG5fc2V0X3ByaW9yaXR5X3Q7Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs

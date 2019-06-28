Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 853785A551
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 21:46:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgwm5-0001ag-3T; Fri, 28 Jun 2019 19:43:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Pu4=U3=gmail.com=denisobrezkov@srs-us1.protection.inumbo.net>)
 id 1hgwm2-0001ab-Qt
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 19:43:06 +0000
X-Inumbo-ID: f22801c5-99dc-11e9-8980-bc764e045a96
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f22801c5-99dc-11e9-8980-bc764e045a96;
 Fri, 28 Jun 2019 19:43:05 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id p15so12226272eds.8
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jun 2019 12:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=25sbOMIoiVh7SPuJ0bwpjLaZBR2UkMj4Irqy6GC+1O4=;
 b=StTlYcijRQyurpDo3tOpHjznq+kwkZegFAlPCk/6XbtGf4mh3PHWCu8oPdMB7Jpzdv
 tOZ4II7txwUGFeSRH03wRhWrzI9ihjY/bCUB0cQ0ipiSU64b9BLSMPVC0ps3JXPWzBXT
 39WV3iB53JrHeGFPYkdpPP1mfi8VW/l8aUXHsiXj5Xkgbwyz4nrEjCszZb7zbtw1RxdS
 H5AIeNUoWypuy9TEM1tKSS8XgO9KGvACZ5RmVDLqRRInWKA61VCt2I4Auv26Y7yucSXb
 xvtd48zzjIYMF7GgCMmg6K9ASQkl59vMDNd9k6M2t7hn7jPCD8ziVhJ2PcF/YqIgUdGj
 Zduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=25sbOMIoiVh7SPuJ0bwpjLaZBR2UkMj4Irqy6GC+1O4=;
 b=LSpyPxJLXsmKE+DTJZIMSbD5h7OHc84iwmtc/wo9THU2RjpQrXAvCVAaERnDJfzGzR
 hOxSaLOX+zOuMNdooK5Ki/r7EMLUE3qA19p2JVqiagYGpbjtOLCggs/nosc9u03ZvPsV
 DItdRESdwN7oTnz4qwILRZD6ny3rY0O6uEZ7BBgWl9ASVfkcTXqkmwrldDD+i2ibskYE
 3WtwEBdH2OEUR85Z/HiDVDpP7j9JnKlOFN7Gem4HNmfKFe5iyVdL6nDwktSa1V97UM/V
 rWkapDcB8hQ01hy9IqvR3VnoNInAMIiuA3aS5SlO3vNKSKQUzm2dqsudwdV3CH88PAyE
 HnvQ==
X-Gm-Message-State: APjAAAVvZO90PVihV7R5qtXapkB9Ha2Q6OqP0uYZ7xen9q3zbm0X+AKx
 mGOfLzu9l8X2QckWSYgxMBzns3m5fGw=
X-Google-Smtp-Source: APXvYqxTsusqp3qrtUDQGHYI2ov3w7xm6Z5sg/RHoMqUVhpohE7JHgmfuU1HgoJDSYV0CR59jiFP5w==
X-Received: by 2002:a17:906:944f:: with SMTP id
 z15mr10357906ejx.137.1561750984015; 
 Fri, 28 Jun 2019 12:43:04 -0700 (PDT)
Received: from debian.fritz.box
 (200116b866b09f001e4bd6fffef946e6.dip.versatel-1u1.de.
 [2001:16b8:66b0:9f00:1e4b:d6ff:fef9:46e6])
 by smtp.gmail.com with ESMTPSA id d25sm602206ejb.71.2019.06.28.12.43.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 12:43:03 -0700 (PDT)
From: Denis Obrezkov <denisobrezkov@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 28 Jun 2019 21:42:54 +0200
Message-Id: <8af4cfa481e24256b822f64efc6a0f45ae87cf65.1561750725.git.denisobrezkov@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] xen/arm: Switch OMAP5 secondary cores into
 hyp mode
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
Cc: hy-gsoc@hy-research.com, sstabellini@kernel.org, andre.przywara@arm.com,
 tim@xen.org, Denis Obrezkov <denisobrezkov@gmail.com>, drhunter95@gmail.com,
 julien.grall@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBmdW5jdGlvbiBhbGxvd3MgeGVuIHRvIGJyaW5nIHNlY29uZGFyeSBDUFUgY29yZXMgaW50
byBub24tc2VjdXJlCkhZUCBtb2RlLiBUaGlzIGlzIGRvbmUgYnkgdXNpbmcgYSBTZWN1cmUgTW9u
aXRvciBjYWxsLgoKU2lnbmVkLW9mZi1ieTogRGVuaXMgT2JyZXprb3YgPGRlbmlzb2JyZXprb3ZA
Z21haWwuY29tPgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBtb3ZlIGNvZGUgdG8gcGxhdGZvcm0gc3Bl
Y2lmaWMgZmlsZQotLS0KIHhlbi9hcmNoL2FybS9wbGF0Zm9ybXMvb21hcDUuYyB8IDE2ICsrKysr
KysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvb21hcDUuYyBiL3hlbi9h
cmNoL2FybS9wbGF0Zm9ybXMvb21hcDUuYwppbmRleCBhZWUyNGU0ZDI4Li43OTc2NGE2Y2Q2IDEw
MDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL29tYXA1LmMKKysrIGIveGVuL2FyY2gv
YXJtL3BsYXRmb3Jtcy9vbWFwNS5jCkBAIC0yMyw2ICsyMywxNyBAQAogI2luY2x1ZGUgPHhlbi92
bWFwLmg+CiAjaW5jbHVkZSA8YXNtL2lvLmg+CiAKK3ZvaWQgb21hcDVfaW5pdF9zZWNvbmRhcnko
dm9pZCk7Cithc20gKAorICAgICAgICAiLnRleHQgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcblx0IgorICAgICAgICAib21hcDVfaW5pdF9zZWNvbmRhcnk6ICAgICAgICAgICAgICBcblx0
IgorICAgICAgICAiICAgICAgICBsZHIgICByMTIsID0weDEwMiAgICAgICAgICBcblx0IiAvKiBB
UElfSFlQX0VOVFJZICovCisgICAgICAgICIgICAgICAgIGFkciAgIHIwLCBvbWFwNV9oeXAgICAg
ICAgIFxuXHQiCisgICAgICAgICIgICAgICAgIHNtYyAgICMwICAgICAgICAgICAgICAgICAgIFxu
XHQiCisgICAgICAgICJvbWFwNV9oeXA6ICAgICAgICAgICAgICAgICAgICAgICAgIFxuXHQiCisg
ICAgICAgICIgICAgICAgIGIgICAgIGluaXRfc2Vjb25kYXJ5ICAgICAgIFxuXHQiCisgICAgICAg
ICk7CisKIHN0YXRpYyB1aW50MTZfdCBudW1fZGVuWzhdWzJdID0gewogICAgIHsgICAgICAgICAw
LCAgICAgICAgICAwIH0sICAvKiBub3QgdXNlZCAqLwogICAgIHsgIDI2ICogIDY0LCAgMjYgKiAg
MTI1IH0sICAvKiAxMi4wIE1oeiAqLwpAQCAtMTI4LDggKzEzOSw5IEBAIHN0YXRpYyBpbnQgX19p
bml0IG9tYXA1X3NtcF9pbml0KHZvaWQpCiAgICAgfQogCiAgICAgcHJpbnRrKCJTZXQgQXV4Q29y
ZUJvb3QxIHRvICUiUFJJcGFkZHIiICglcClcbiIsCi0gICAgICAgICAgIF9fcGEoaW5pdF9zZWNv
bmRhcnkpLCBpbml0X3NlY29uZGFyeSk7Ci0gICAgd3JpdGVsKF9fcGEoaW5pdF9zZWNvbmRhcnkp
LCB3dWdlbl9iYXNlICsgT01BUF9BVVhfQ09SRV9CT09UXzFfT0ZGU0VUKTsKKyAgICAgICAgICAg
X19wYShvbWFwNV9pbml0X3NlY29uZGFyeSksIG9tYXA1X2luaXRfc2Vjb25kYXJ5KTsKKyAgICB3
cml0ZWwoX19wYShvbWFwNV9pbml0X3NlY29uZGFyeSksCisgICAgICAgICAgIHd1Z2VuX2Jhc2Ug
KyBPTUFQX0FVWF9DT1JFX0JPT1RfMV9PRkZTRVQpOwogCiAgICAgcHJpbnRrKCJTZXQgQXV4Q29y
ZUJvb3QwIHRvIDB4MjBcbiIpOwogICAgIHdyaXRlbCgweDIwLCB3dWdlbl9iYXNlICsgT01BUF9B
VVhfQ09SRV9CT09UXzBfT0ZGU0VUKTsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A191282EB
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 20:54:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiOJJ-0005Bz-Es; Fri, 20 Dec 2019 19:51:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YXk5=2K=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iiOJI-0005Bu-Cd
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 19:51:40 +0000
X-Inumbo-ID: 235320c0-2362-11ea-a914-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 235320c0-2362-11ea-a914-bc764e2007e4;
 Fri, 20 Dec 2019 19:51:40 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id q6so10504227wro.9
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2019 11:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d3gWeUOunqAmsD6ITNZf1IsHIla/8KhZut7TR/WpYs0=;
 b=dEu6w4l9qR4eyH7Bj8a40BsewNVU17c+thoOrEX+60ssCk0d8WNUA5VGzkPttLqmu5
 HSINXMqRanPkSNQVb5fXXFj+5k9RC5akjGRC2SWjzv7gStLQ/6ELsATNg8chF41Eda2Z
 M3PCuoGayNKrGgyVEj/cTEKwO5WYOfps1FqCFGeeYSJy4aR9IwC4lvllrsSo02VETmmn
 KXXCn+w+HURpj11nkBJ6CjrqsBVLUCdSCbd3FtLN0ioYqSUmFZIacHSlfLeJ3S8q48qx
 yci8MHVDYK9/wi6zwHgk5Azi1BxK5+mWT345DfNfn/C4sl+ngEhHhdWdJJ+0PJTycK7s
 qOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=d3gWeUOunqAmsD6ITNZf1IsHIla/8KhZut7TR/WpYs0=;
 b=qu/cLDcg3IL3JDxJvwyc+y+vmxWoz6v+fpk/ARQ7Xzt4GpAn6Rz1TX3y+PCm9UoUyb
 tPgohrvQ5F6Sw7xL6KBUQTaIMvySBaZRBbz7WWklkvqfwcX6ffdGLgZCkR/rfboxeggL
 /23ZBPFx+a5iGngmLXlwzU9HGCahfcubUfTPftqxN+/GvubGSgaPjlUUy7aCRTPzDfl3
 hTMwyBmlV+Ov5fHH2vPbe0Y7w4IyTkN3WnNMWVT2SBRYL+9Cpi6wfBriTB6foxnTy08T
 oXbkJqlw4x7lGWju0DtEbMClAqMRuRSVcDAnLYHWoJnAMM36ns5sOo7IG6QlWLPjQyvr
 FJoA==
X-Gm-Message-State: APjAAAVcUmz6uAHpyS6elYtJHFctKiwVTitTkNdoEcbY4pCqn3jhVnmN
 trRvPHXwPm0i786WWdq3XDlOrgGY
X-Google-Smtp-Source: APXvYqyDUqvs4lOAzWwMhOqOjgX8ZzUj7w00VqpJcvqkzVCXD0rS2eQ+1LnJkGuISIATQQ8M95xx7Q==
X-Received: by 2002:a5d:44ca:: with SMTP id z10mr18046082wrr.266.1576871499031; 
 Fri, 20 Dec 2019 11:51:39 -0800 (PST)
Received: from debian.mshome.net (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id a184sm11006287wmf.29.2019.12.20.11.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 11:51:38 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri, 20 Dec 2019 19:51:31 +0000
Message-Id: <20191220195135.20130-1-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/4] Clean up viridian code
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
Cc: Paul Durrant <pdurrant@amazon.com>, Wei Liu <liuwe@microsoft.com>,
 Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2VpIExpdSAoNCk6CiAgeDg2L3ZpcmlkaWFuOiBkcm9wIGR1cGxpY2F0ZSBkZWZpbmVzIGZyb20g
cHJpdmF0ZS5oIGFuZCB2aXJpZGlhbi5jCiAgeDg2L3ZpcmlkaWFuOiBkcm9wIHByaXZhdGUgY29w
eSBvZiBIVl9SRUZFUkVOQ0VfVFNDX1BBR0UgaW4gdGltZS5jCiAgeDg2OiBwcm92aWRlIGFuZCB1
c2UgaHZfdHNjX3NjYWxlCiAgeDg2OiBtb3ZlIHZpcmlkaWFuX2d1ZXN0X29zX2lkX21zciB0byBo
eXBlcnYtdGxmcy5oCgogeGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi9wcml2YXRlLmggICAgIHwg
NjYgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogeGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi90
aW1lLmMgICAgICAgIHwgNTAgKysrLS0tLS0tLS0tLS0tLS0tLQogeGVuL2FyY2gveDg2L2h2bS92
aXJpZGlhbi92aXJpZGlhbi5jICAgIHwgMzEgKysrLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvdGlt
ZS5jICAgICAgICAgICAgICAgICAgICAgfCAgNyArLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vl
c3QvaHlwZXJ2LXRsZnMuaCB8IDE0ICsrKysrKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9o
eXBlcnYuaCAgICAgIHwgMzIgKysrKysrKysrKystCiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92
aXJpZGlhbi5oICAgICAgfCAxOCArKy0tLS0tCiA3IGZpbGVzIGNoYW5nZWQsIDY0IGluc2VydGlv
bnMoKyksIDE1NCBkZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs

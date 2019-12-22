Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E11A1129045
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 00:24:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijAWg-0004NM-NJ; Sun, 22 Dec 2019 23:20:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYd2=2M=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ijAWf-0004NH-GQ
 for xen-devel@lists.xenproject.org; Sun, 22 Dec 2019 23:20:41 +0000
X-Inumbo-ID: ab326414-2511-11ea-88e7-bc764e2007e4
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab326414-2511-11ea-88e7-bc764e2007e4;
 Sun, 22 Dec 2019 23:20:41 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id g17so14875241wro.2
 for <xen-devel@lists.xenproject.org>; Sun, 22 Dec 2019 15:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SOZuT5s++OmXN0mDZaTJiW41VcIDOcJTQzVU+vBKm2M=;
 b=Hp6ml9eJpwjiWKL80hNYvcCBg2WEEwPfOu5cxQP1CdgwUi7c2qjbdvoVlKdDouI6FN
 utihUwGAMxa68JYQUQU5Ko3gR4PYCzOT3iipLOT9s6xr+PZgY5iJSLb8ECUyoOHeLPGl
 fcftoh/HDkm4jdJg2xJuj6nOmDy/QP8pkacD9d8TNAg+AFVUX1NbupUgoX6yK8/qj+iO
 pG1EPTEKevPGXpqCWsGfCzmqf4v3h1vEaoepx8Tb/qBf4qrb8cOXhehEbAYxTgYkdrzl
 cDymixeilxoA6ZkhK+c9VGldE6JGArXWUUs6YdZ4PBP4shL2M1b3C47Doge1layNgBDC
 VXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=SOZuT5s++OmXN0mDZaTJiW41VcIDOcJTQzVU+vBKm2M=;
 b=XzVgpkdywUVgOzeP6WKTTuHQzcAytnCw9WO22YxVaEaJEgfc69lrg1gSSMhm5NYGPW
 uvekuPVgGJyg4JaLH8E3yw0OIvwvCSLAErGl9OzQVRWhhKx3VguFbb2l8SZt8N2gMpJ0
 nEhRjdutPadVY3TrJ0HkzJLczkBKhVYPxDW/IPMy/l0zZDYlfuAksqcOhKQh/7dNYC7V
 iAiA9we9EBK6GhVtb0oYu5Omyo9tnlQuagrgwt2+VfNftnsEWwBPzghtK9IDtZKdTpAo
 ImBN+V0FkY+IYJg2uqaUwgcIFknbxTb+3urH2onnkw8vvEVEzu65sXicq3x6YbD/EOb/
 xhng==
X-Gm-Message-State: APjAAAULKuv5y8AXXLFyqGNhTqz8zFcG65xESdLNGisAlJCHkU6pZ4rO
 R3SpbVPwRX/umLOdWBedHQjEshL9
X-Google-Smtp-Source: APXvYqynrwor9JO8+DYxWb+gtzNr3+c5kiG75MQAYE3zjrDPM6f22h4wSCKFigrmGqJZ/pKDb91XHw==
X-Received: by 2002:adf:b591:: with SMTP id c17mr26089195wre.108.1577056840088; 
 Sun, 22 Dec 2019 15:20:40 -0800 (PST)
Received: from debian.mshome.net (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id h2sm19925613wrt.45.2019.12.22.15.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2019 15:20:39 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Sun, 22 Dec 2019 23:20:32 +0000
Message-Id: <20191222232035.31613-1-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/3] More viridian code cleanup
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

VGhpcyBzZXJpZXMgY29udGFpbnMgYW4gdXBkYXRlZCBwYXRjaCBmcm9tIGxhc3QgYmF0Y2ggYW5k
IHR3byBuZXcKcGF0Y2hlcy4KCldlaSBMaXUgKDMpOgogIHg4Ni92aXJpZGlhbjogZHJvcCBhIHdy
b25nIGludmFsaWQgdmFsdWUgZnJvbSByZWZlcmVuY2UgVFNDCiAgICBpbXBsZW1lbnRhdGlvbgog
IHg4Ni92aXJpZGlhbjogZHJvcCB2aXJkaWFuX3NpbnRfbXNyCiAgeDg2L3ZpcmlkaWFuOiBkcm9w
IHZpcmlkaWFuX3N0aW1lcl9jb25maWdfbXNyCgogeGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi9z
eW5pYy5jICAgICAgIHwgMjAgKysrKystLS0tLS0KIHhlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4v
dGltZS5jICAgICAgICB8IDQ0ICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0KIHhlbi9pbmNsdWRl
L2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LXRsZnMuaCB8ICAzICstCiB4ZW4vaW5jbHVkZS9hc20teDg2
L2h2bS92aXJpZGlhbi5oICAgICAgfCAzNSArKy0tLS0tLS0tLS0tLS0tLS0tLQogNCBmaWxlcyBj
aGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCA3MCBkZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

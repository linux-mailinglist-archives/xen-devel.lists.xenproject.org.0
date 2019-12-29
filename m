Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D640312CA67
	for <lists+xen-devel@lfdr.de>; Sun, 29 Dec 2019 19:36:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ildO6-0008No-BN; Sun, 29 Dec 2019 18:34:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F+c7=2T=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ildO5-0008Ne-41
 for xen-devel@lists.xenproject.org; Sun, 29 Dec 2019 18:34:01 +0000
X-Inumbo-ID: c5358e60-2a69-11ea-a914-bc764e2007e4
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5358e60-2a69-11ea-a914-bc764e2007e4;
 Sun, 29 Dec 2019 18:33:56 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id 20so12569928wmj.4
 for <xen-devel@lists.xenproject.org>; Sun, 29 Dec 2019 10:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lzk7QT42x4Bu7yTXlGHeGQsXy2o8S3NY1hIpuuMaZPg=;
 b=jzmrxNyKaQHHXZ7zCuNwtQhbfZZGjTRm2EojYXvM+qcoB+nBkzn5gEWIol77zJ/4gl
 hRXZnqwVYCkLWg9j2cyYTAp9Zf2UTVN61Rwsu4u45uvUvT3m1wiu4gB7epwC/xo7s6f7
 cq+wv5GnLVt1avr62Zx1Ywuyq0auGOEQKWwF3yFR8pwFQzKI5voOxsgp8c2Uqh8+kabs
 2R0Pr78L/+0k13w4AbWENQW2apTT5S4/XbTMihHXDf7Vz1aDXUkkmhjSQmNzBbEw72Gn
 PAnbcRuePpaER21rP9tIj7LbLCsxwt7a9RDB4UkWpA7+ehE9ToKmw2qluUo1uFuS4GXw
 XfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Lzk7QT42x4Bu7yTXlGHeGQsXy2o8S3NY1hIpuuMaZPg=;
 b=qiXyY5twMj+OMvueAW49LzX/Kaj4Qx6Fx3uubvACY2eo4inhyFD9gk6yX37qAUs7sq
 Ur9JmFENsElXVAdzTfEa+KN4PlUktft037a6X9DaWy1l6XU2znPWPm5PMD/mA5jAjblX
 fGOBPBJZxv1Z4z2+GoiqQMYmck2A8Q/3uNSehlFIYSYgEB5omELknvKPvAmJDb2pRH/+
 F6DhMEMUg/qbeCdO5N5wHaX5zjmR9ZsUbkc7PZ/heJFQkxeNf3YeSTc90ozrtz+aOaEW
 uzi3hugQC1PZLjzsX3rse0xG449mxXf2a4Pl8djutoiqTK4KME4LXk2DB3uHNmox2Fb9
 wgiw==
X-Gm-Message-State: APjAAAXlzDxWUDiUaMrzCs1UqdroD5Js5UVcGP4ighZCPslY0yIQelPz
 ntVAqvZN7R2GdXSOlNQ/Z0ajUrY9toM=
X-Google-Smtp-Source: APXvYqw+CyT9N157GmEJ+JKv8Mub8BdU1g9V6Edu2xw7pljK08sfuhP4NowP1K84gxRwVCr34s+jYQ==
X-Received: by 2002:a7b:cbcd:: with SMTP id n13mr30034816wmi.104.1577644435103; 
 Sun, 29 Dec 2019 10:33:55 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id f207sm19667903wme.9.2019.12.29.10.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 10:33:54 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Sun, 29 Dec 2019 18:33:34 +0000
Message-Id: <20191229183341.14877-2-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191229183341.14877-1-liuwe@microsoft.com>
References: <20191229183341.14877-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/8] x86: include xen/lib.h in guest/pvh-boot.h
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgbmVlZHMgQVNTRVJUX1VOUkVBQ0hBQkxFLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1
d2VAbWljcm9zb2Z0LmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3B2aC1ib290
LmggfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9wdmgtYm9vdC5oIGIveGVuL2luY2x1ZGUvYXNtLXg4
Ni9ndWVzdC9wdmgtYm9vdC5oCmluZGV4IGI4YTc2YzRlZWQuLjQ4ZmZkMWEwYjEgMTAwNjQ0Ci0t
LSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvcHZoLWJvb3QuaAorKysgYi94ZW4vaW5jbHVk
ZS9hc20teDg2L2d1ZXN0L3B2aC1ib290LmgKQEAgLTMwLDYgKzMwLDggQEAgdm9pZCBwdmhfcHJp
bnRfaW5mbyh2b2lkKTsKIAogI2Vsc2UKIAorI2luY2x1ZGUgPHhlbi9saWIuaD4KKwogI2RlZmlu
ZSBwdmhfYm9vdCAwCiAKIHN0YXRpYyBpbmxpbmUgdm9pZCBwdmhfaW5pdChtdWx0aWJvb3RfaW5m
b190ICoqbWJpLCBtb2R1bGVfdCAqKm1vZCkKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

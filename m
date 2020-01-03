Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C9812FA1E
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 17:11:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inPVX-0005RC-Hl; Fri, 03 Jan 2020 16:09:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fV2H=2Y=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1inPVW-0005R6-KU
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 16:09:02 +0000
X-Inumbo-ID: 58a495d8-2e43-11ea-88e7-bc764e2007e4
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58a495d8-2e43-11ea-88e7-bc764e2007e4;
 Fri, 03 Jan 2020 16:08:57 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id b19so8784734wmj.4
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 08:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lzk7QT42x4Bu7yTXlGHeGQsXy2o8S3NY1hIpuuMaZPg=;
 b=gx/+v4CdSMB+xrjc75vD3ZDNiL8126npbFc9alC4qtaab8Vm58o/WqSDbzU2mf7e96
 6KWhLdK1W5a44ItW5kkY6fKssQUMpQXUH0Jq6ZOtUN2UpxToer5xd/OQRc2vzNAqXg+o
 vlEUpgq/gt6NpxDm4Q6BgMthkFmg+M0fIHM2xkFK8kOWJ1QKvvrcTLIfiy3T498podoS
 HxPQ/C1g673GjiB/gnW/fybUNeTEWfxAae+WQrQgaXduz7Ba+rjh90nOBt0b7UTivO03
 4VH9+dY+De7HnX91j4vOdh7BytkzQ3iDvSqt5P5Chr1TrW7fDFgTlShqCrViuqSm/fQI
 U/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Lzk7QT42x4Bu7yTXlGHeGQsXy2o8S3NY1hIpuuMaZPg=;
 b=TS4P6gM2dkdeBF1snmczgv/bbiItAczVJqwMO/ScMyBGDeE3rTVjZUthLVhmXscLia
 8pZjWlXtHI2UZ0CO7SgI/MQUk3IOcb5rHKfQ312NqJ0c9qIPzTWIDbSfN/R4Sl4+VUu/
 CJxfFVnMBseunLQHw7a1HG3qInX7J5eiEoyvF8Sh7EGRVuUazuDS1D6YfwslfKNSn9KP
 fga3hJLN0UBtIoGBlPrJ6YM1Id2FbGBJImWBHwfc3tjdNTrIDrR90HF0GRe25Ib0ke4v
 1JImyixo+c87NbUsZhJ4nNzW3eouAlizDEYg0pwXRj/9oB7hu0Aetnsjoof4OTa87hTl
 182w==
X-Gm-Message-State: APjAAAUHz1MzrOXcqhdptU2WmZs7rYVUZKsbJuNcZN/B61Yeg+8c9FG6
 QW+qsg6iCkPSEblqZQdH6FLrOy4BV0Syqg==
X-Google-Smtp-Source: APXvYqwVlJzNuW6gI1Cd20+TFIp4Lb9cRdIKKgrnL9ZcpvRM98xluSSt+IeUcyJZwS27AYbrAtQiJQ==
X-Received: by 2002:a1c:4c5:: with SMTP id 188mr20367174wme.82.1578067736826; 
 Fri, 03 Jan 2020 08:08:56 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id z11sm61000235wrt.82.2020.01.03.08.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 08:08:56 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri,  3 Jan 2020 16:08:18 +0000
Message-Id: <20200103160825.19377-2-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200103160825.19377-1-liuwe@microsoft.com>
References: <20200103160825.19377-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/8] x86: include xen/lib.h in
 guest/pvh-boot.h
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

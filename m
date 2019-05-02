Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6516E12482
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 00:16:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMJxw-0006XH-Q0; Thu, 02 May 2019 22:14:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o+so=TC=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hMJxv-0006Ww-4L
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 22:14:07 +0000
X-Inumbo-ID: 99557461-6d27-11e9-843c-bc764e045a96
Received: from mail-io1-f68.google.com (unknown [209.85.166.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 99557461-6d27-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 22:14:05 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id h26so3647629ioj.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2019 15:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kfZC3ZKi78+hYcm1QckJJrxmSZuf6YhT3xoFtXtED9Y=;
 b=imhIhjp4DN0jkWlnoODT5fnC/UMGM/Qici1mPShIJGzI9Z7gJw+ymdJSryhwAkEcq3
 Bw5G09jThcB1FeNZibeihiLdLDC95oZc7zw6VTsa6MJluHd9pKamtvcfcvRLHN8X8c45
 jTloZ5EeVJ+Ka5YxbGHXAXN13M6EQI6wIBm9mB/NmHBU1p54i651w5pjvsBC/si4vCXP
 s02DejBQVSO7ppQVueS5JW9LMVa6DCBJkYqeZckTGmZtX0xJivDA3FAve3+KkFNwALSB
 nfYwrETySzpvAlGPPdM2xpOXO2zRI7MnBrffsBQr3BFHi3GPvIJ+hrT3vNeNvplh7nMq
 4p+w==
X-Gm-Message-State: APjAAAWGIFfZclQmzJMFAs/J5kJPFpja6h95g+XfM+63c+4o2gvv2Irp
 jmAKv6TLIsDKhzTNwme+0AkL+Tpl
X-Google-Smtp-Source: APXvYqyqulK4xg9zaL3xQTogVmrY0jxGo0U7NB/hLt/eghkLY/b0lzSN+L8gAZoOxYk2mXPurluokQ==
X-Received: by 2002:a6b:6909:: with SMTP id e9mr4438521ioc.208.1556835244993; 
 Thu, 02 May 2019 15:14:04 -0700 (PDT)
Received: from localhost.localdomain (c-71-205-12-124.hsd1.co.comcast.net.
 [71.205.12.124])
 by smtp.gmail.com with ESMTPSA id n199sm239715itn.34.2019.05.02.15.14.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 15:14:03 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  2 May 2019 16:13:44 -0600
Message-Id: <20190502221345.18459-3-tamas@tklengyel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502221345.18459-1-tamas@tklengyel.com>
References: <20190502221345.18459-1-tamas@tklengyel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 3/4] x86/mem_sharing: enable mem_share audit
 mode only in debug builds
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW1wcm92ZXMgcGVyZm9ybWFuY2UgZm9yIHJlbGVhc2UgYnVpbGRzLgoKU2lnbmVkLW9mZi1ieTog
VGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgpDYzogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkNjOiBSb2dlciBQYXUgTW9u
bmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvbWVtX3No
YXJpbmcuaCB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbWVtX3NoYXJpbmcuaCBiL3hlbi9pbmNsdWRlL2Fz
bS14ODYvbWVtX3NoYXJpbmcuaAppbmRleCAwZTc3YjdkOTM1Li5iYjE5Yjc1MzRmIDEwMDY0NAot
LS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21lbV9zaGFyaW5nLmgKKysrIGIveGVuL2luY2x1ZGUv
YXNtLXg4Ni9tZW1fc2hhcmluZy5oCkBAIC0yNSw3ICsyNSwxMSBAQAogI2luY2x1ZGUgPHB1Ymxp
Yy9tZW1vcnkuaD4KIAogLyogQXVkaXRpbmcgb2YgbWVtb3J5IHNoYXJpbmcgY29kZT8gKi8KKyNp
Zm5kZWYgTkRFQlVHCiAjZGVmaW5lIE1FTV9TSEFSSU5HX0FVRElUIDEKKyNlbHNlCisjZGVmaW5l
IE1FTV9TSEFSSU5HX0FVRElUIDAKKyNlbmRpZgogCiB0eXBlZGVmIHVpbnQ2NF90IHNocl9oYW5k
bGVfdDsgCiAKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=

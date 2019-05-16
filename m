Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E24D621030
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 23:41:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRO4v-0000Dw-4p; Thu, 16 May 2019 21:38:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ykOh=TQ=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hRO4t-0000Dq-GM
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 21:38:15 +0000
X-Inumbo-ID: e909b1c5-7822-11e9-8980-bc764e045a96
Received: from mail-it1-f194.google.com (unknown [209.85.166.194])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e909b1c5-7822-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 21:38:14 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id g71so8723660ita.5
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 14:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=29kguvPIqID2QYtSaxUUcg0G2bgfjX7xxfa5dHdjQg4=;
 b=NzDCQI2+bRE6MNm3jeR5mpH7wjRwZd1wac0ib1PLjGNZb+fsQYk6Hj5joPrGOBweXD
 ShRAErnoyrwoFepUn9wYxnbnm51fxG72MjbyCgRif3NMX0cTpo4dxfz0vsAfgb/E3FkJ
 1fsnTAaBLfiRSwFHAOb6Exu6eHsfGwWJl1L9CwSpfF+rQiRERfQjyePFvyYHIPJJx0ff
 QMCKNOrSoY6sRc03VOwtg8pM0F4L5gii91qlvn5GAmpqAUYChQucSbNHG+qv8TruIrJT
 UAHqAKmKcJdoPmWjwtZop52OTOs1T5obQfXRiQzTMRQWECWEc+dmRVKADI+mQalhkggP
 Gr6Q==
X-Gm-Message-State: APjAAAX+hZMCPmE/OhuaFlCj50B813VhuFi70fDw6tQPe/QQwlVAKO5z
 bKE538ifbyPeOkd77dlYcCeeC6p+
X-Google-Smtp-Source: APXvYqzw4jWk8Q/Ok1a9cvBB/ke3ya1MIPLp8yBQr3u3B2LMkHlc9YLkDglMnR5zEPwo7vmJMuppVA==
X-Received: by 2002:a02:3506:: with SMTP id k6mr3785074jaa.41.1558042693969;
 Thu, 16 May 2019 14:38:13 -0700 (PDT)
Received: from localhost.localdomain (c-71-205-12-124.hsd1.co.comcast.net.
 [71.205.12.124])
 by smtp.gmail.com with ESMTPSA id j81sm2509701itj.26.2019.05.16.14.38.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 14:38:13 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 16 May 2019 15:37:51 -0600
Message-Id: <20190516213752.1701-3-tamas@tklengyel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190516213752.1701-1-tamas@tklengyel.com>
References: <20190516213752.1701-1-tamas@tklengyel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 3/4] x86/mem_sharing: enable mem_share audit
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
bS14ODYvbWVtX3NoYXJpbmcuaAppbmRleCA5ZjlmN2U5M2UzLi5hZmQwYzE3MjkyIDEwMDY0NAot
LS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21lbV9zaGFyaW5nLmgKKysrIGIveGVuL2luY2x1ZGUv
YXNtLXg4Ni9tZW1fc2hhcmluZy5oCkBAIC0yNSw3ICsyNSwxMSBAQAogI2luY2x1ZGUgPHB1Ymxp
Yy9tZW1vcnkuaD4KIAogLyogQXVkaXRpbmcgb2YgbWVtb3J5IHNoYXJpbmcgY29kZT8gKi8KKyNp
Zm5kZWYgTkRFQlVHCiAjZGVmaW5lIE1FTV9TSEFSSU5HX0FVRElUIDEKKyNlbHNlCisjZGVmaW5l
IE1FTV9TSEFSSU5HX0FVRElUIDAKKyNlbmRpZgogCiB0eXBlZGVmIHVpbnQ2NF90IHNocl9oYW5k
bGVfdDsgCiAKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=

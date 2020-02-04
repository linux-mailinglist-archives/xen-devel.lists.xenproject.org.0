Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E911517F6
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 10:36:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyub4-0001BS-W3; Tue, 04 Feb 2020 09:34:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cOUj=3Y=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iyub3-0001BK-IA
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 09:34:17 +0000
X-Inumbo-ID: 8300cce6-4731-11ea-8396-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8300cce6-4731-11ea-8396-bc764e2007e4;
 Tue, 04 Feb 2020 09:34:17 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z3so22085544wru.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2020 01:34:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=UpR89a9KTtDavfw05CL8LSZGeOkc5z/InhvuqX26S6g=;
 b=GdbmHW03Pf38Gq0zxskz90QWyQJfRuKUpg+YmE2kIAI1L3Q1dC6dlproTpCSl8bsk4
 0TA5eFQFtXgLCBRUTx8u2eRWlJExIFA/EQ+P9VenTG91kTwzwhHn2ds0E7Y/roueDgHG
 zL2CHUDkSitJpgpgK9GHhUBFjAHuONs0SldsEkVGL49kVZcLyfHmMl6J/ogO2mgGfjmS
 L66MBsIRzm5N4KzS7EvCVintRIbaqTpKEKwiq3mVZ1tznXZE/qe2HdIJwq+7zqgcV0PJ
 tG91wSYKhBIajqXVWcMwKO0rmrsfI8CTOJwrzKr9YsBGFVQTGYB25+gEfxnDV+65/c8a
 tajQ==
X-Gm-Message-State: APjAAAWlpKNLft1X7F3Jfr8D/Qq0n5X54UwotU9klCRs1SePWVubDJ4/
 +xYEkEuLHxLtQrTDjnNf8DVkRY+rrFY=
X-Google-Smtp-Source: APXvYqwrAxfayv98shWJuD9ja4Q+ZFnRCrzytJ6q6BZwwu4sVC7h9PA+pFH6KR+XVEF93HMbMCLD6g==
X-Received: by 2002:a5d:4b8f:: with SMTP id b15mr21115789wrt.100.1580808855870; 
 Tue, 04 Feb 2020 01:34:15 -0800 (PST)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id p11sm16923031wrn.40.2020.02.04.01.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 01:34:15 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Tue,  4 Feb 2020 09:34:09 +0000
Message-Id: <20200204093411.15887-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH 0/2] xen/x86: hap: Small clean-up/hardening in
 hap_enable()
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KCkhpIGFsbCwKClRoaXMgc2Vy
aWVzIGNvbnRhaW4gYSBjb3VwbGUgb2YgY2xlYW4tdXAvaGFyZGVuaW5nIGZvciB0aGUgZnVuY3Rp
b24KaGFwX2VuYWJsZSgpLgoKQ2hlZXJzLAoKSnVsaWVuIEdyYWxsICgyKToKICB4ZW4veDg2OiBo
YXA6IEZpeCBjb2Rpbmcgc3R5bGUgaW4gaGFwX2VuYWJsZSgpCiAgeGVuL3g4NjogaGFwOiBDbGVh
bi11cCBhbmQgaGFyZGVuIGhhcF9lbmFibGUoKQoKIHhlbi9hcmNoL3g4Ni9tbS9oYXAvaGFwLmMg
fCAyMSArKysrKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25z
KCspLCA4IGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F9E151AF3
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 14:09:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyxuV-0003sv-UC; Tue, 04 Feb 2020 13:06:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cOUj=3Y=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iyxuU-0003sq-CN
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 13:06:34 +0000
X-Inumbo-ID: 2a641d04-474f-11ea-8f39-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a641d04-474f-11ea-8f39-12813bfff9fa;
 Tue, 04 Feb 2020 13:06:33 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id m16so22926655wrx.11
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2020 05:06:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cvCJbZYtRAt9uo1xNe7lnenf4FFFjFs6R43/PynLhps=;
 b=aGHHEjekQldQXzarlzgVIuO1XmbXqMVAbCe7zQxudaJd8LGKvR0OFNr+AvWNQcwpKS
 dWajeRfW9c3gSNoADeWOpfEnLxcP7N/SlORZIgv7p66yXOeQz/CIjKSIufU0WdV0tCgP
 AyAFUmY5zvtwCIGnmsHQ80kbr7yM4CZ9643y3rGgxsE0H8vwM6BL21O/gGYvSdRJa/Sx
 8+q5QsESB5ZYmBsqe+0unytoowAa2WRKD9f0gnZBp4dzpPqYNHy74Lz8tDNsX+kTiYVc
 o1a1q2wfsWh/8VNtRkYc9YIu7FpYoUnwYMcinRIaVa0lnIZdSAjWw3uS7GOx3F9XKNXA
 3hAA==
X-Gm-Message-State: APjAAAWIj+f1BzgiIXNePL6qnX2GGKgIjfJLJTCLkpwp/Q/Kj+WHIgNc
 Vn+vJZVmE3u8OncNidA3pT7mKbEotJw=
X-Google-Smtp-Source: APXvYqw2jYAju4B+7V+4EQJNWp6gzhJtFFm0CSGJwwmrEuUOmNxjDQaWT6rl7T4loIoQi9vz4AveGg==
X-Received: by 2002:a5d:40d1:: with SMTP id b17mr20415505wrq.93.1580821592233; 
 Tue, 04 Feb 2020 05:06:32 -0800 (PST)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id y8sm3624776wma.10.2020.02.04.05.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 05:06:31 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Tue,  4 Feb 2020 13:06:12 +0000
Message-Id: <20200204130614.15166-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/2] xen/x86: hap: Small clean-up/hardening
 in hap_enable()
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
Cc: julien@xen.org, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBzZXJpZXMgY29udGFpbnMgYSBjb3VwbGUgb2YgY2xlYW4tdXAvaGFyZGVu
aW5nIGZvciB0aGUgZnVuY3Rpb24KaGFwX2VuYWJsZSgpLgoKQ2hlZXJzLAoKSnVsaWVuIEdyYWxs
ICgyKToKICB4ZW4veDg2OiBoYXA6IEZpeCBjb2Rpbmcgc3R5bGUgaW4gaGFwX2VuYWJsZSgpCiAg
eGVuL3g4NjogaGFwOiBDbGVhbi11cCBhbmQgaGFyZGVuIGhhcF9lbmFibGUoKQoKIHhlbi9hcmNo
L3g4Ni9tbS9oYXAvaGFwLmMgfCAyMSArKysrKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

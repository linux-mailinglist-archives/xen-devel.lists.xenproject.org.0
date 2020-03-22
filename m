Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB9818EA24
	for <lists+xen-devel@lfdr.de>; Sun, 22 Mar 2020 17:16:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jG3Ff-0004zM-Oc; Sun, 22 Mar 2020 16:15:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0EiK=5H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jG3Fe-0004xO-8L
 for xen-devel@lists.xenproject.org; Sun, 22 Mar 2020 16:15:02 +0000
X-Inumbo-ID: 39ecac9a-6c58-11ea-8134-12813bfff9fa
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39ecac9a-6c58-11ea-8134-12813bfff9fa;
 Sun, 22 Mar 2020 16:14:37 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id cf14so4284541edb.13
 for <xen-devel@lists.xenproject.org>; Sun, 22 Mar 2020 09:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=L1T44arnxUCL2r70XG7PRouN++rEfiBPPpnuW47vsAs=;
 b=b9r1GJEMIp5wYoanlWO+Et1OxnaeiqwCV4vARVB8j0d34RVz/j7kuH50zXoUvravGW
 CIlvDM8P+f5wlz/8iuYnR+h/8g/zbk9hUQzyT6QrI6Iv6/GaMgks4mZYwQifZmCTh83G
 YODZtI68E1JXYJ5+YsDopBjcgCi008jjivsC8WrhcwqY4C/EDLgcmU3CoODt15c3wbZ4
 av5KehbJ7JitHoBSTYMXhaZidP/ylP7n286T41kAMaaVD2gFNPRXUmTI8s6eJL2wyDmb
 25hH/PCPhr1UO60W6XbOB5HhbLkxCoCLxtjrdWmwY9kzNBZhDyAgInzZIAeSjgOaD2RF
 nBJw==
X-Gm-Message-State: ANhLgQ2ApvOrldFtgkkps80fCVJ0YHnfGzymyZ8TJYEWZwO29EOswREc
 Lv+JKSFbd0bDi+E5npP1p20iDUk1Br2+Og==
X-Google-Smtp-Source: ADFU+vvVWEHQJmzDAewdRV2U/X28YEJ1g1rXfLbUWXvdbBGyUKail6uIE69qnl851t0Vjcg35VadOg==
X-Received: by 2002:a17:906:7e07:: with SMTP id
 e7mr15978001ejr.135.1584893676693; 
 Sun, 22 Mar 2020 09:14:36 -0700 (PDT)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id v13sm106693edj.62.2020.03.22.09.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 09:14:36 -0700 (PDT)
From: julien@xen.org
To: xen-devel@lists.xenproject.org
Date: Sun, 22 Mar 2020 16:14:13 +0000
Message-Id: <20200322161418.31606-13-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200322161418.31606-1-julien@xen.org>
References: <20200322161418.31606-1-julien@xen.org>
Subject: [Xen-devel] [PATCH 12/17] xen/x86: p2m: Remove duplicate error
 message in p2m_pt_audit_p2m()
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCnAybV9wdF9hdWRpdF9w
Mm0oKSBoYXMgb25lIHBsYWNlIHdoZXJlIHRoZSBzYW1lIG1lc3NhZ2UgbWF5IGJlIHByaW50ZWQK
dHdpY2UgdmlhIHByaW50ayBhbmQgUDJNX1BSSU5USy4KClJlbW92ZSB0aGUgb25lIHByaW50ZWQg
dXNpbmcgcHJpbnRrIHRvIHN0YXkgY29uc2lzdGVudCB3aXRoIHRoZSByZXN0IG9mCnRoZSBjb2Rl
LgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0t
CgogICAgVGhpcyB3YXMgb3JpZ2luYWxseSBzZW50IGFzIHBhcnQgb2YgInhlbi9hcm06IFByb3Bl
cmx5IGRpc2FibGUgTTJQCiAgICBvbiBBcm0iIFsxXS4KCiAgICBDaGFuZ2VzIHNpbmNlIHRoZSBv
cmlnaW5hbCB2ZXJzaW9uOgogICAgICAgIC0gTW92ZSB0aGUgcmVmbG93IGluIGEgc2VwYXJhdGUg
cGF0Y2guCgogICAgWzFdIDwyMDE5MDYwMzE2MDM1MC4yOTgwNi0xLWp1bGllbi5ncmFsbEBhcm0u
Y29tPgotLS0KIHhlbi9hcmNoL3g4Ni9tbS9wMm0tcHQuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0tcHQuYyBi
L3hlbi9hcmNoL3g4Ni9tbS9wMm0tcHQuYwppbmRleCBjY2NiMDZjMjZlLi43NzQ1MGE5NDg0IDEw
MDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLXB0LmMKKysrIGIveGVuL2FyY2gveDg2L21t
L3AybS1wdC5jCkBAIC0xMDYxLDggKzEwNjEsNiBAQCBsb25nIHAybV9wdF9hdWRpdF9wMm0oc3Ry
dWN0IHAybV9kb21haW4gKnAybSkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIXAybV9p
c19zaGFyZWQodHlwZSkgKQogICAgICAgICAgICAgICAgICAgICAgICAgewogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBtYmFkKys7Ci0gICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJp
bnRrKCJtaXNtYXRjaDogZ2ZuICUjbHggLT4gbWZuICUjbHgiCi0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICIgLT4gZ2ZuICUjbHhcbiIsIGdmbiwgbWZuLCBtMnBmbik7CiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgUDJNX1BSSU5USygibWlzbWF0Y2g6IGdmbiAlI2x4IC0+
IG1mbiAlI2x4IgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiAtPiBn
Zm4gJSNseFxuIiwgZ2ZuLCBtZm4sIG0ycGZuKTsKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBCVUcoKTsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=

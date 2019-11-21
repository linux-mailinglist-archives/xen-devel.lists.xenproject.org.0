Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 823D0105F9A
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 06:22:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY1Jr-0006CD-L7; Fri, 22 Nov 2019 05:17:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=51Zo=ZN=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1iXrUv-0006OO-4H
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 18:48:09 +0000
X-Inumbo-ID: 7594e6dc-0c8f-11ea-b678-bc764e2007e4
Received: from mail-qv1-xf42.google.com (unknown [2607:f8b0:4864:20::f42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7594e6dc-0c8f-11ea-b678-bc764e2007e4;
 Thu, 21 Nov 2019 18:48:08 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id y18so1858617qve.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 10:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c8nVRzgB0YDtJ+y9FNkA3x/d530+qZE+NnYikZNbCrY=;
 b=Qd5DOiTEUKkAbvWWBA600R4XlxLwFyDaJa4sle8qP7489uHD80RxMqUwg5kGz940pO
 Uy/pT7lJTR4GjlFlbX7dHMDtR211secMJRkotfPvB3o5DKTw1xv6+vrmxKW2htfMcNZX
 g98vk8RHBl+DeicsPE+4EaSyMYG2IvzwUx8keHJ3qp1ecHMWoDc07wiL++XC9dFUC0uh
 07RFJvQGvxdBHY09cPELbIbfaaty+SNFMSSt86Yd256lMjQTqyMjWc/5tY2oblfPJ/m+
 EgTVEXpzneOCRxHOBITpWNP/bgT484K6eQDsihDtqabDvyYJu/4Vl0nQYvaEC/PFgMOd
 GvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c8nVRzgB0YDtJ+y9FNkA3x/d530+qZE+NnYikZNbCrY=;
 b=bLc0peUtRJZL8U7pdWWHtrQ51nmDbkELFfKUtuIIg7wnYxMOjZDVNmkN6Q0J2uFDnA
 qOoHkN5z4QnpsEDgo9JFPJQ7AWujdUX+yqV8JLnK4Eyu11CAd3D+PhOEJfAHtRg0W1Y1
 yKamubxZDosLU0L1LewKyEkyHMWwuYaC48Vt/jsi/UdSI7AJma2vRHF//jFlYt67iIAV
 u4Q7bAn9O6/EL6rzIwxHe7ZkD6C1r1Qu066PDviziB8FYyQSevfN0lgy3BLvdL5wMDXw
 exi3kXT+liiZRCaXJbDsOZEoy+wjeOsUBnvJDRBTAirjD1sWShanJggFqMLd5hfkUlK7
 sd1g==
X-Gm-Message-State: APjAAAWWNKxU/Bx2WZiXI6YpaYl6qogEbGWM1QKlaJXV5Z1sUOWrvscV
 lJ3KSLmuKxq7k7lkcPvLXvNClA==
X-Google-Smtp-Source: APXvYqwZjCYx8RRyhAGY177FzvhWk79OzV7zKnj87grfXziN6cxCQV8PczfcjMpEI7opQBzRuRrwkw==
X-Received: by 2002:a0c:f787:: with SMTP id s7mr9663802qvn.12.1574362087643;
 Thu, 21 Nov 2019 10:48:07 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net.
 [73.69.118.222])
 by smtp.gmail.com with ESMTPSA id t2sm1811634qkt.95.2019.11.21.10.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 10:48:06 -0800 (PST)
From: Pavel Tatashin <pasha.tatashin@soleen.com>
To: pasha.tatashin@soleen.com, jmorris@namei.org, sashal@kernel.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 steve.capper@arm.com, linux-arm-kernel@lists.infradead.org,
 marc.zyngier@arm.com, james.morse@arm.com, vladimir.murzin@arm.com,
 mark.rutland@arm.com, tglx@linutronix.de, gregkh@linuxfoundation.org,
 allison@lohutok.net, info@metux.net, alexios.zavras@intel.com,
 sstabellini@kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 stefan@agner.ch, yamada.masahiro@socionext.com,
 xen-devel@lists.xenproject.org, linux@armlinux.org.uk
Date: Thu, 21 Nov 2019 13:48:02 -0500
Message-Id: <20191121184805.414758-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 22 Nov 2019 05:17:22 +0000
Subject: [Xen-devel] [PATCH 0/3] Use C inlines for uaccess
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29udmVydCB0aGUgcmVtYWluaW5nIHVhY2Nlc3NfKiBjYWxscyBmcm9tIEFTTSBtYWNyb3MgdG8g
QyBpbmxpbmVzLgoKVGhlc2UgcGF0Y2hlcyBhcHBseSBhZ2FpbnN0IGxpbnV4LW5leHQuIEkgYm9v
dCB0ZXN0ZWQgQVJNNjQsIGFuZApjb21waWxlIHRlc3RlZCBBUk0gY2hhbmdlcy4KClBhdmVsIFRh
dGFzaGluICgzKToKICBhcm0vYXJtNjQveGVuOiB1c2UgQyBpbmxpbmVzIGZvciBwcml2Y21kX2Nh
bGwKICBhcm02NDogcmVtb3ZlIHVhY2Nlc3NfdHRicjAgYXNtIG1hY3JvcyBmcm9tIGNhY2hlIGZ1
bmN0aW9ucwogIGFybTY0OiByZW1vdmUgdGhlIHJlc3Qgb2YgYXNtLXVhY2Nlc3MuaAoKIGFyY2gv
YXJtL2luY2x1ZGUvYXNtL2Fzc2VtYmxlci5oICAgICB8ICAyICstCiBhcmNoL2FybS9pbmNsdWRl
L2FzbS91YWNjZXNzLmggICAgICAgfCAzMiArKysrKysrKysrKystLS0KIGFyY2gvYXJtL3hlbi9l
bmxpZ2h0ZW4uYyAgICAgICAgICAgICB8ICAyICstCiBhcmNoL2FybS94ZW4vaHlwZXJjYWxsLlMg
ICAgICAgICAgICAgfCAxNSArLS0tLS0tCiBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL2FzbS11YWNj
ZXNzLmggfCA2MCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBhcmNoL2FybTY0L2luY2x1
ZGUvYXNtL2NhY2hlZmx1c2guaCAgfCAzOCArKysrKysrKysrKysrKysrLS0KIGFyY2gvYXJtNjQv
a2VybmVsL2VudHJ5LlMgICAgICAgICAgICB8ICA2ICstLQogYXJjaC9hcm02NC9saWIvY2xlYXJf
dXNlci5TICAgICAgICAgIHwgIDIgKy0KIGFyY2gvYXJtNjQvbGliL2NvcHlfZnJvbV91c2VyLlMg
ICAgICB8ICAyICstCiBhcmNoL2FybTY0L2xpYi9jb3B5X2luX3VzZXIuUyAgICAgICAgfCAgMiAr
LQogYXJjaC9hcm02NC9saWIvY29weV90b191c2VyLlMgICAgICAgIHwgIDIgKy0KIGFyY2gvYXJt
NjQvbW0vY2FjaGUuUyAgICAgICAgICAgICAgICB8IDMxICsrKysrLS0tLS0tLS0tCiBhcmNoL2Fy
bTY0L21tL2NvbnRleHQuYyAgICAgICAgICAgICAgfCAxMiArKysrKysKIGFyY2gvYXJtNjQvbW0v
Zmx1c2guYyAgICAgICAgICAgICAgICB8ICAyICstCiBhcmNoL2FybTY0L3hlbi9oeXBlcmNhbGwu
UyAgICAgICAgICAgfCAxOSArLS0tLS0tLS0KIGFyY2gveHRlbnNhL2tlcm5lbC9jb3Byb2Nlc3Nv
ci5TICAgICB8ICAxIC0KIGluY2x1ZGUveGVuL2FybS9oeXBlcmNhbGwuaCAgICAgICAgICB8IDIz
ICsrKysrKysrKy0tCiAxNyBmaWxlcyBjaGFuZ2VkLCAxMTcgaW5zZXJ0aW9ucygrKSwgMTM0IGRl
bGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vYXNt
LXVhY2Nlc3MuaAoKLS0gCjIuMjQuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D774D105F97
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 06:22:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY1Ju-0006E4-NN; Fri, 22 Nov 2019 05:17:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5Q5S=ZO=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1iXycD-0001Fa-DF
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 02:24:09 +0000
X-Inumbo-ID: 29e67bc0-0ccf-11ea-b678-bc764e2007e4
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29e67bc0-0ccf-11ea-b678-bc764e2007e4;
 Fri, 22 Nov 2019 02:24:08 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id q8so3470870qtr.10
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 18:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hiLKK1+r4xrwDMfPVXvgdsqsmhpmz4wcDPltvr+YiPM=;
 b=juXdHl2/OTY1JDCI2WvisMRYkfyhCB9wL5baTK6u4p7eMyINED07coapH0Tt+jhDTZ
 pz0mU0Dl+9ZUlwgPMIllUSSMrvSNJvxM84FAxwu2TdgV95+/uj7U9npfrofHN2Vg2xBP
 AL/4MLKTSwV+OsUlPJVCLv+WEepm6sWacJ59AsPA0mIGJA2xvMttUK5wpHc2hbzSQDGA
 Hj46YAtBseFmPmD9OBoVcmsLYh7euLUgyIjHTJMMYCHNUy/Sp8SMj+4SiYqsNdkrb6yL
 lVFlX/JTHsJV+gxQz41tqhZFB+XZlGdmcR2A6yIShk049QI7rcWL1R1ea6zARZaR/6qg
 IrBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hiLKK1+r4xrwDMfPVXvgdsqsmhpmz4wcDPltvr+YiPM=;
 b=mk0zeHacL5bOIT06o5Q74f8AZLWkFXrOUmBR5b3ZyXtwAiqnitAe7C8HfL1MAnSXDv
 NPJ1yn4QqEHsDFULd3Kp3wn4HEg38vK+OFklAoJPgRTapMcJhpEFbqNkO41UkP0Upy8g
 WBKZpyqaNZIzoXc1zLQoYeO8J7pK33X1U7ZnaiZmzTs/L7VtJ0o0Z6zPRZpyDs0xRHrP
 MTiC72hJWMMoKDS+oJphlVIE9WyEnkMllakMQSe55l2VVy2gBaYweNS5dd+gu6UD9sMz
 4gJnt6wKTubfEw2tbewTd3vRTWWGZdz3KXqXcVbP5EEDbuRFElrJ8fgdMTVV2oaxx/EA
 aOSA==
X-Gm-Message-State: APjAAAUmFtEbre3cryv/P1Z5S6Kdk4qSrTtdopXm8eDGHnhyaLJtwBEn
 wzPhsPW55inxNV1bdS+HErN6ng==
X-Google-Smtp-Source: APXvYqzgQzCnz8RAyDKTprcdXtRBKBNV8pw9G0OGoEv3raFUYmGZAJZFgHjMZtF26RBtdnjCSFPUmw==
X-Received: by 2002:ac8:51c3:: with SMTP id d3mr1690299qtn.14.1574389448532;
 Thu, 21 Nov 2019 18:24:08 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net.
 [73.69.118.222])
 by smtp.gmail.com with ESMTPSA id z5sm2609801qtm.9.2019.11.21.18.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 18:24:07 -0800 (PST)
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
Date: Thu, 21 Nov 2019 21:24:03 -0500
Message-Id: <20191122022406.590141-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 22 Nov 2019 05:17:22 +0000
Subject: [Xen-devel] [PATCH v2 0/3] Use C inlines for uaccess
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

Q2hhbmdlbG9nCnYyOgoJLSBBZGRyZXNzZWQgUnVzc2VsbCBLaW5nJ3MgY29uY2VybiBieSBub3Qg
YWRkaW5nCgkgIHVhY2Nlc3NfKiB0byBBUk0uCgktIFJlbW92ZWQgdGhlIGFjY2lkZW50YWwgY2hh
bmdlIHRvIHh0ZW5zYQoKQ29udmVydCB0aGUgcmVtYWluaW5nIHVhY2Nlc3NfKiBjYWxscyBmcm9t
IEFTTSBtYWNyb3MgdG8gQyBpbmxpbmVzLgoKVGhlc2UgcGF0Y2hlcyBhcHBseSBhZ2FpbnN0IGxp
bnV4LW5leHQuIEkgYm9vdCB0ZXN0ZWQgQVJNNjQsIGFuZApjb21waWxlIHRlc3RlZCBBUk0gY2hh
bmdlcy4KClBhdmVsIFRhdGFzaGluICgzKToKICBhcm0vYXJtNjQveGVuOiB1c2UgQyBpbmxpbmVz
IGZvciBwcml2Y21kX2NhbGwKICBhcm02NDogcmVtb3ZlIHVhY2Nlc3NfdHRicjAgYXNtIG1hY3Jv
cyBmcm9tIGNhY2hlIGZ1bmN0aW9ucwogIGFybTY0OiByZW1vdmUgdGhlIHJlc3Qgb2YgYXNtLXVh
Y2Nlc3MuaAoKIGFyY2gvYXJtL2luY2x1ZGUvYXNtL2Fzc2VtYmxlci5oICAgICAgIHwgIDIgKy0K
IGFyY2gvYXJtL2luY2x1ZGUvYXNtL3hlbi9oeXBlcmNhbGwuaCAgIHwgMTAgKysrKysKIGFyY2gv
YXJtL3hlbi9lbmxpZ2h0ZW4uYyAgICAgICAgICAgICAgIHwgIDIgKy0KIGFyY2gvYXJtL3hlbi9o
eXBlcmNhbGwuUyAgICAgICAgICAgICAgIHwgIDQgKy0KIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20v
YXNtLXVhY2Nlc3MuaCAgIHwgNjAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGFyY2gvYXJt
NjQvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oICAgIHwgMzggKysrKysrKysrKysrKystLQogYXJj
aC9hcm02NC9pbmNsdWRlL2FzbS94ZW4vaHlwZXJjYWxsLmggfCAyOCArKysrKysrKysrKysKIGFy
Y2gvYXJtNjQva2VybmVsL2VudHJ5LlMgICAgICAgICAgICAgIHwgIDYgKy0tCiBhcmNoL2FybTY0
L2xpYi9jbGVhcl91c2VyLlMgICAgICAgICAgICB8ICAyICstCiBhcmNoL2FybTY0L2xpYi9jb3B5
X2Zyb21fdXNlci5TICAgICAgICB8ICAyICstCiBhcmNoL2FybTY0L2xpYi9jb3B5X2luX3VzZXIu
UyAgICAgICAgICB8ICAyICstCiBhcmNoL2FybTY0L2xpYi9jb3B5X3RvX3VzZXIuUyAgICAgICAg
ICB8ICAyICstCiBhcmNoL2FybTY0L21tL2NhY2hlLlMgICAgICAgICAgICAgICAgICB8IDMxICsr
KysrLS0tLS0tLS0KIGFyY2gvYXJtNjQvbW0vY29udGV4dC5jICAgICAgICAgICAgICAgIHwgMTIg
KysrKysrCiBhcmNoL2FybTY0L21tL2ZsdXNoLmMgICAgICAgICAgICAgICAgICB8ICAyICstCiBh
cmNoL2FybTY0L3hlbi9oeXBlcmNhbGwuUyAgICAgICAgICAgICB8IDE5ICstLS0tLS0tCiBpbmNs
dWRlL3hlbi9hcm0vaHlwZXJjYWxsLmggICAgICAgICAgICB8IDEyICsrKy0tLQogMTcgZmlsZXMg
Y2hhbmdlZCwgMTE1IGluc2VydGlvbnMoKyksIDExOSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL2FzbS11YWNjZXNzLmgKCi0tIAoyLjI0LjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A70E113821
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 00:24:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icdxG-00015k-8z; Wed, 04 Dec 2019 23:21:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cR3Y=Z2=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1icdxF-00015e-BL
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 23:21:09 +0000
X-Inumbo-ID: bc6fb37c-16ec-11ea-a0d2-bc764e2007e4
Received: from mail-qv1-xf42.google.com (unknown [2607:f8b0:4864:20::f42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc6fb37c-16ec-11ea-a0d2-bc764e2007e4;
 Wed, 04 Dec 2019 23:21:01 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id i3so571188qvv.7
 for <xen-devel@lists.xenproject.org>; Wed, 04 Dec 2019 15:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GKIfn1X+i6X56lqVXfyDzwPMZCzheNRzcKTaF4L1NP0=;
 b=XFyzL5rTBwrAztY5nL0Ms1sPvQucTdFNTX8M14EOWrh36IgXf4zoI522rtxEKRoa52
 iLqCy/91jRbUTDBGb3bllaMoyeqCln4xl1FZqj+b3eCzWUr5TgFGFbAmfZ/qpae4CijU
 35EW4FQh7ww/prBUP0rcMSvO++mJcfO+k+fB3+BP0A1lGoquComcKT6UDiDreQjckSUg
 k2hjQvUPo2N86qG8pbxlMAC6Kn6AAxDYJsEGt+O6B9zeTaxWSo/9qm7e42sxKv/Xabey
 MFKaBloUYjQUJ5KZCxkfZDaZn+HAuOoWlPpNu3Gh25wuUFzC7MSzHyNs/Xar9ayJQjzK
 BvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GKIfn1X+i6X56lqVXfyDzwPMZCzheNRzcKTaF4L1NP0=;
 b=T3qkBc6Q3Nb5Pweg5uI0qL6M03SueziAc35Zz+SkLMQeHZz0vlk9Vz3vaMOZ5XO1cL
 HM/XhOT2wotAChfLSme7VxpwwPfjaEzbkyR32c6B6t3Zm1rRhDEe8k0f6/U9Ja31elM9
 0tZ3aXW5py8J9/TwEOfYcOkq+VPAMTciBSjr6kREuZxGZdksxD9ae2YVnQz8lwxucMOR
 KuyhZV/hSK9uMDhmEd9NbKTQejv1mZmrNEFPlmBCpjZehtfEJdqYAvqRZqwrLTquFM3o
 VaXx0iVrgCAbFybfC/Gq+amo/RAQDOr6CFguWG/mg4LBzSXc2T9e3NfzvLNufpuTP1Ct
 +a9Q==
X-Gm-Message-State: APjAAAXrwLU8ASB4FfoYr69seN92rGvM72X+M05gWEDL869ovQGP1Q2F
 ubQDvTJIwKECMtJfwE5hRBV6RA==
X-Google-Smtp-Source: APXvYqwN8rVvbdjEWOZ3Dsr7ynba65KMLwXI/KiByr8BhvRWV22aS+4kNOZAN22diwAm+JbXcarUcQ==
X-Received: by 2002:ad4:4949:: with SMTP id o9mr4823945qvy.189.1575501661393; 
 Wed, 04 Dec 2019 15:21:01 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net.
 [73.69.118.222])
 by smtp.gmail.com with ESMTPSA id t38sm4667864qta.78.2019.12.04.15.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 15:21:00 -0800 (PST)
From: Pavel Tatashin <pasha.tatashin@soleen.com>
To: pasha.tatashin@soleen.com, jmorris@namei.org, sashal@kernel.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 steve.capper@arm.com, linux-arm-kernel@lists.infradead.org, maz@kernel.org,
 james.morse@arm.com, vladimir.murzin@arm.com, mark.rutland@arm.com,
 tglx@linutronix.de, gregkh@linuxfoundation.org, allison@lohutok.net,
 info@metux.net, alexios.zavras@intel.com, sstabellini@kernel.org,
 boris.ostrovsky@oracle.com, jgross@suse.com, stefan@agner.ch,
 yamada.masahiro@socionext.com, xen-devel@lists.xenproject.org,
 linux@armlinux.org.uk, andrew.cooper3@citrix.com, julien@xen.org
Date: Wed,  4 Dec 2019 18:20:52 -0500
Message-Id: <20191204232058.2500117-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 0/6] Use C inlines for uaccess
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

Q2hhbmdlbG9nOgoKdjQ6CgktIFNwbGl0IHRoZSBmaXJzdCBwYXRjaCBpbnRvIHR3byBhcyBKdWxp
ZW4gR3JhbGwgCgktIEFsc28gYXMgTWFyayBSdXRsYW5kIHN1Z2dlc3RlZCByZW1vdmVkIGFsdGVy
bmF0aXZlcwoJICBmcm9tIF9fYXNtX2ZsdXNoX2NhY2hlX3VzZXJfcmFuZ2UuCnYzOgoJLSBBZGRl
ZCBBY2tlZC1ieSBmcm9tIFN0ZWZhbm8gU3RhYmVsbGluaQoJLSBBZGRyZXNzZWQgY29tbWVudHMg
ZnJvbSBNYXJrIFJ1dGxhbmQKdjI6CgktIEFkZHJlc3NlZCBSdXNzZWxsIEtpbmcncyBjb25jZXJu
IGJ5IG5vdCBhZGRpbmcKCSAgdWFjY2Vzc18qIHRvIEFSTS4KCS0gUmVtb3ZlZCB0aGUgYWNjaWRl
bnRhbCBjaGFuZ2UgdG8geHRlbnNhCgpDb252ZXJ0IHRoZSByZW1haW5pbmcgdWFjY2Vzc18qIGNh
bGxzIGZyb20gQVNNIG1hY3JvcyB0byBDIGlubGluZXMuCgpUaGVzZSBwYXRjaGVzIGFwcGx5IGFn
YWluc3QgbGludXgtbmV4dC4gSSBib290IHRlc3RlZCBBUk02NCwgYW5kCmNvbXBpbGUgdGVzdGVk
IEFSTSBjaGFuZ2UKClByZXZpb3VzIGRpc2N1c3Npb25zOgp2MzogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGttbC8yMDE5MTEyNzE4NDQ1My4yMjkzMjEtMS1wYXNoYS50YXRhc2hpbkBzb2xlZW4u
Y29tCnYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTkxMTIyMDIyNDA2LjU5MDE0
MS0xLXBhc2hhLnRhdGFzaGluQHNvbGVlbi5jb20KdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xrbWwvMjAxOTExMjExODQ4MDUuNDE0NzU4LTEtcGFzaGEudGF0YXNoaW5Ac29sZWVuLmNvbQoK
UGF2ZWwgVGF0YXNoaW4gKDYpOgogIGFybS9hcm02NC94ZW46IGh5cGVyY2FsbC5oIGFkZCBpbmNs
dWRlcyBndWFyZHMKICBhcm0vYXJtNjQveGVuOiB1c2UgQyBpbmxpbmVzIGZvciBwcml2Y21kX2Nh
bGwKICBhcm02NDogcmVtb3ZlIHVhY2Nlc3NfdHRicjAgYXNtIG1hY3JvcyBmcm9tIGNhY2hlIGZ1
bmN0aW9ucwogIGFybTY0OiByZW1vdmUgX19hc21fZmx1c2hfaWNhY2hlX3JhbmdlCiAgYXJtNjQ6
IG1vdmUgQVJNNjRfSEFTX0NBQ0hFX0RJQy9fSURDIGZyb20gYXNtIHRvIEMKICBhcm02NDogcmVt
b3ZlIHRoZSByZXN0IG9mIGFzbS11YWNjZXNzLmgKCiBhcmNoL2FybS9pbmNsdWRlL2FzbS9hc3Nl
bWJsZXIuaCAgICAgICB8ICAyICstCiBhcmNoL2FybS9pbmNsdWRlL2FzbS94ZW4vaHlwZXJjYWxs
LmggICB8IDEwICsrKysKIGFyY2gvYXJtL3hlbi9lbmxpZ2h0ZW4uYyAgICAgICAgICAgICAgIHwg
IDIgKy0KIGFyY2gvYXJtL3hlbi9oeXBlcmNhbGwuUyAgICAgICAgICAgICAgIHwgIDQgKy0KIGFy
Y2gvYXJtNjQvaW5jbHVkZS9hc20vYXNtLXVhY2Nlc3MuaCAgIHwgNjEgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oICAgIHwgNTEgKysr
KysrKysrKysrKysrKystLQogYXJjaC9hcm02NC9pbmNsdWRlL2FzbS94ZW4vaHlwZXJjYWxsLmgg
fCAyOCArKysrKysrKysrKwogYXJjaC9hcm02NC9rZXJuZWwvZW50cnkuUyAgICAgICAgICAgICAg
fCAyNyArKysrKysrKystCiBhcmNoL2FybTY0L2xpYi9jbGVhcl91c2VyLlMgICAgICAgICAgICB8
ICAyICstCiBhcmNoL2FybTY0L2xpYi9jb3B5X2Zyb21fdXNlci5TICAgICAgICB8ICAyICstCiBh
cmNoL2FybTY0L2xpYi9jb3B5X2luX3VzZXIuUyAgICAgICAgICB8ICAyICstCiBhcmNoL2FybTY0
L2xpYi9jb3B5X3RvX3VzZXIuUyAgICAgICAgICB8ICAyICstCiBhcmNoL2FybTY0L21tL2NhY2hl
LlMgICAgICAgICAgICAgICAgICB8IDY4ICsrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBhcmNo
L2FybTY0L21tL2ZsdXNoLmMgICAgICAgICAgICAgICAgICB8ICAzICstCiBhcmNoL2FybTY0L3hl
bi9oeXBlcmNhbGwuUyAgICAgICAgICAgICB8IDE5ICstLS0tLS0KIGluY2x1ZGUveGVuL2FybS9o
eXBlcmNhbGwuaCAgICAgICAgICAgIHwgMTIgKystLS0KIDE2IGZpbGVzIGNoYW5nZWQsIDE0MyBp
bnNlcnRpb25zKCspLCAxNTIgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9h
cm02NC9pbmNsdWRlL2FzbS9hc20tdWFjY2Vzcy5oCgotLSAKMi4yNC4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

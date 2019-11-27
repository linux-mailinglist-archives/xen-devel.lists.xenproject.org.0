Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA59110B60B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 19:47:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia2J8-0003Ea-NU; Wed, 27 Nov 2019 18:44:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8bDK=ZT=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1ia2J7-0003EV-3C
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 18:44:57 +0000
X-Inumbo-ID: 01c47ef0-1146-11ea-83b8-bc764e2007e4
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01c47ef0-1146-11ea-83b8-bc764e2007e4;
 Wed, 27 Nov 2019 18:44:56 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id x1so5714159qkl.12
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2019 10:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F/n86b6Kh7/7bx65ohsSuhkfsrRS1fX/ghGHBMXhZiA=;
 b=iY3WGmb47fenakYk1z1uQ4/43MV+16v1SYdlJk6JAl3euekC4kAR8C4/ECW6Rz4kVJ
 cLsUVHWp7fiU24FpQ96I3EO48/XAQq9zOHMo6Z88+oUoYA2qxHZj0u0HXL9lEU30dY8Y
 ep/6IBJL7UCp1cC77ME+6B+78g9QNgLonOnUPH9yYuQX/6yAiB2YXbytWuONSaskHBTl
 LO+aA8Fj3N/cz2+KGHOx7EUjM4pzrKWWB8RcJjxbmMvaWHLPjAHHqiyL6s8xsKcjinzu
 dxrpdBh9lEOmwBD1CeekX+TeZn/pMfMPeKE4YXl9vgLYYwvwh9btiumNMmwMJzXJJu62
 L9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F/n86b6Kh7/7bx65ohsSuhkfsrRS1fX/ghGHBMXhZiA=;
 b=CLGAK4UPOQG4MYQEoS9Ta8aG0jdZRkSJlouPBuWfCnWU3vsxyMjITHAPAOTxy055Ax
 dXyYk5dnhNAsr+P6HDQd+2aBD37pqgPnrJuZGobqRkm5uXkxqbtX6VIapgfgS6DQpeNW
 SblaM1QJ1oIfL72aFE2CtZ/8NyE/oE++iH6+ieFGZNv1xiGm0+/rzB6Kgqn05cXP06Qd
 N5WRmWIRCbo+ucooi39VD4wsY0AitOi6Axy8+45Sz6as5NJZMluKkbHqErHkWkuqpQxa
 MMz5D/+Ux/0iCrHEMXsbbZ6dAFmCj2Srkz1RynObXkmPrvfafaOhA2anLH+t5eNXgaXq
 oTyA==
X-Gm-Message-State: APjAAAV3FfKmpy8WHyRDUAk/rWtg3Cu3f6T+IOjcrnPJZrOEzC1iaYAH
 v+Ntb9LJzYPM6k+Kh3NObM/rYw==
X-Google-Smtp-Source: APXvYqytTMLn9EqxEu+OgYBIR0W3UcV5QcnBL8/xWD7wWi7CQazQ0liRoDUunsojwesXXqeQBJ7PVQ==
X-Received: by 2002:a37:bd06:: with SMTP id n6mr5990382qkf.286.1574880295965; 
 Wed, 27 Nov 2019 10:44:55 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net.
 [73.69.118.222])
 by smtp.gmail.com with ESMTPSA id o62sm2748024qte.76.2019.11.27.10.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 10:44:55 -0800 (PST)
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
Date: Wed, 27 Nov 2019 13:44:50 -0500
Message-Id: <20191127184453.229321-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
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

Q2hhbmdlbG9nCnYzOgoJLSBBZGRlZCBBY2tlZC1ieSBmcm9tIFN0ZWZhbm8gU3RhYmVsbGluaQoJ
LSBBZGRyZXNzZWQgY29tbWVudHMgZnJvbSBNYXJrIFJ1dGxhbmQKdjI6CgktIEFkZHJlc3NlZCBS
dXNzZWxsIEtpbmcncyBjb25jZXJuIGJ5IG5vdCBhZGRpbmcKCSAgdWFjY2Vzc18qIHRvIEFSTS4K
CS0gUmVtb3ZlZCB0aGUgYWNjaWRlbnRhbCBjaGFuZ2UgdG8geHRlbnNhCgpDb252ZXJ0IHRoZSBy
ZW1haW5pbmcgdWFjY2Vzc18qIGNhbGxzIGZyb20gQVNNIG1hY3JvcyB0byBDIGlubGluZXMuCgpU
aGVzZSBwYXRjaGVzIGFwcGx5IGFnYWluc3QgbGludXgtbmV4dC4gSSBib290IHRlc3RlZCBBUk02
NCwgYW5kCmNvbXBpbGUgdGVzdGVkIEFSTSBjaGFuZ2UKUGF2ZWwgVGF0YXNoaW4gKDMpOgogIGFy
bS9hcm02NC94ZW46IHVzZSBDIGlubGluZXMgZm9yIHByaXZjbWRfY2FsbAogIGFybTY0OiByZW1v
dmUgdWFjY2Vzc190dGJyMCBhc20gbWFjcm9zIGZyb20gY2FjaGUgZnVuY3Rpb25zCiAgYXJtNjQ6
IHJlbW92ZSB0aGUgcmVzdCBvZiBhc20tdWFjY2Vzcy5oCgogYXJjaC9hcm0vaW5jbHVkZS9hc20v
YXNzZW1ibGVyLmggICAgICAgfCAgMiArLQogYXJjaC9hcm0vaW5jbHVkZS9hc20veGVuL2h5cGVy
Y2FsbC5oICAgfCAxMCArKysrKwogYXJjaC9hcm0veGVuL2VubGlnaHRlbi5jICAgICAgICAgICAg
ICAgfCAgMiArLQogYXJjaC9hcm0veGVuL2h5cGVyY2FsbC5TICAgICAgICAgICAgICAgfCAgNCAr
LQogYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9hc20tdWFjY2Vzcy5oICAgfCA2MSAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQogYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmggICAg
fCAzOSArKysrKysrKysrKysrKy0tCiBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL3hlbi9oeXBlcmNh
bGwuaCB8IDI4ICsrKysrKysrKysrKwogYXJjaC9hcm02NC9rZXJuZWwvZW50cnkuUyAgICAgICAg
ICAgICAgfCAyNyArKysrKysrKysrKy0KIGFyY2gvYXJtNjQvbGliL2NsZWFyX3VzZXIuUyAgICAg
ICAgICAgIHwgIDIgKy0KIGFyY2gvYXJtNjQvbGliL2NvcHlfZnJvbV91c2VyLlMgICAgICAgIHwg
IDIgKy0KIGFyY2gvYXJtNjQvbGliL2NvcHlfaW5fdXNlci5TICAgICAgICAgIHwgIDIgKy0KIGFy
Y2gvYXJtNjQvbGliL2NvcHlfdG9fdXNlci5TICAgICAgICAgIHwgIDIgKy0KIGFyY2gvYXJtNjQv
bW0vY2FjaGUuUyAgICAgICAgICAgICAgICAgIHwgNDIgKysrKysrLS0tLS0tLS0tLS0tCiBhcmNo
L2FybTY0L21tL2ZsdXNoLmMgICAgICAgICAgICAgICAgICB8ICAyICstCiBhcmNoL2FybTY0L3hl
bi9oeXBlcmNhbGwuUyAgICAgICAgICAgICB8IDE5ICstLS0tLS0tCiBpbmNsdWRlL3hlbi9hcm0v
aHlwZXJjYWxsLmggICAgICAgICAgICB8IDEyICsrLS0tCiAxNiBmaWxlcyBjaGFuZ2VkLCAxMzAg
aW5zZXJ0aW9ucygrKSwgMTI2IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gv
YXJtNjQvaW5jbHVkZS9hc20vYXNtLXVhY2Nlc3MuaAoKLS0gCjIuMjQuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

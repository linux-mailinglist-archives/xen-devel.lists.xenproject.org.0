Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 843B113047A
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2020 22:04:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inqXv-0003ED-A2; Sat, 04 Jan 2020 21:01:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vM5p=2Z=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1inqXu-0003DS-FG
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2020 21:01:18 +0000
X-Inumbo-ID: 5a0cc416-2f35-11ea-b6f1-bc764e2007e4
Received: from mail-yw1-xc42.google.com (unknown [2607:f8b0:4864:20::c42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a0cc416-2f35-11ea-b6f1-bc764e2007e4;
 Sat, 04 Jan 2020 21:01:17 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id i126so20186086ywe.7
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jan 2020 13:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=kp0yjhXvoGAtDa03wAInt5bKMdg2n7py54UW88JtNXg=;
 b=SdlAVcx2kUy8cLufVtIHSvNmEUfr8ErAVleQ9n0Ismw2Gk8o8LGduDT9Q08DHw1fHf
 Sy8O+6ikzX+TIWbfSM2+p/zSra75LqP0i0DtpJkqHPh3qa/i1fHPYL39dFbeJNJuZsPu
 So2JhGZe8QtFaglNR5kHV5gyR+Q0AVFwMGD8YI6BgGyANsjxYF8wDBNW0Xvbjgi7oBx0
 ZNoqOok94210VD6JbeC4IB3zbvXGJhGKhPqKfrYeLfuMRDQ7ti1RU+36e9avzUB1H+Jm
 NGsB4Uy2XJj1GeZxDnDcls4EoWfxndQ+T9gR4JGgObRxU/0dWQgOpBLtd/Zx3oHQrvjn
 oL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=kp0yjhXvoGAtDa03wAInt5bKMdg2n7py54UW88JtNXg=;
 b=pJKHD69z/LPDjcudQylmNghjli2KHEz4ganmOvk8wGjXLMjPPcfzeLAkDMNiYiP9SS
 T0OcAR9Qt6jz5H2/wFyos/NxQvDYF3pvs58H9MbiMGCG6QWLhSyUbZmGoALDSXuk+ASv
 RMrVj3BzW89b3OL20TS4/pr9VUwGzPMPiut6lgR6iOlPeN5ETXPYlDOzp8Y3dnwddUMa
 RojcCOKKsiudomMwJm69kMJsZH7aZzC+V0vCPJFSR8YWdx3pEkdn+Q9oQrewCjeBkWw7
 L2tVF1BqzJowYVVcnnPSkbszkh5jaJqGgALqbbNy74bDXCi/Y5VxZXnhXOL/+HY8Olg4
 OPuw==
X-Gm-Message-State: APjAAAVu9nH5ObzdJ8/cHfgDSQUtIHTvTmIGPoNb/Ion6jGR8dEvvVZw
 fHP2xqfKFzEBTpNt8n2nWVMYzAVb
X-Google-Smtp-Source: APXvYqx6r5mNKmD9lkyqmmGaaBdqJXyyKEFI7Ltdz36fx1t3eVEd6BAIKhQO544yBcDKVkNOJzZo5g==
X-Received: by 2002:a0d:c6c1:: with SMTP id
 i184mr63673109ywd.389.1578171677173; 
 Sat, 04 Jan 2020 13:01:17 -0800 (PST)
Received: from four.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id
 r10sm26366714ywr.97.2020.01.04.13.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jan 2020 13:01:16 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Date: Sat,  4 Jan 2020 16:00:50 -0500
Message-Id: <cover.1578170151.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH v5 0/3] generated Go libxl bindings using IDL
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWZ0ZXIgWGVuIHN1bW1pdCwgd2Ugc3RhcnRlZCB0aGUgZGlzY3Vzc2lvbiBpbiB0aGlzWzFdIFJG
QyB0aHJlYWQKdG8gZmlndXJlIG91dCBob3cgdG8gZ2VuZXJhdGUgR28gYmluZGluZ3MgZm9yIGxp
YnhsLiBUaGlzIHNlcmllcwppbXBsZW1lbnRzIHRoYXQgR28gY29kZSBnZW5lcmF0aW9uIHVzaW5n
IHRoZSBleGlzdGluZyBJREwsIGFuZCB1cGRhdGVzCnRoZSBleGlzdGluZyBoYW5kLXdyaXR0ZW4g
Y29kZSBpbiB4ZW5saWdodC5nbyB0byB1c2UgdGhlIGdlbmVyYXRlZApjb2RlLgoKVGhlIGdvYWwg
b2YgdGhpcyBzZXJpZXMgaXMgdG8gcHJvdmlkZSBhIGdvb2QgZm91bmRhdGlvbiBmb3IgY29udGlu
dWVkCmRldmVsb3BtZW50IG9mIHRoZSBHbyBwYWNrYWdlLgoKVGhlIHYxIHNlcmllcyBjYW4gYmUg
Zm91bmQgb24gbXkgR2l0SHViIGJyYW5jaFsyXS4KCkNoYW5nZXMgaW4gdjI6Ci0gR2l0SHViIGJy
YW5jaCBmb3IgdjIgWzNdLgotIERyb3AgcGF0Y2ggMDEvMjQgZnJvbSB2MSBzaW5jZSB3YXMgY29t
bWl0dGVkIGFzIGEgYnVnIGZpeCBmb3IgNC4xMy4KLSBUaGUgTWFrZWZpbGUgY2hhbmdlcyBpbiAy
NC8yNCBmcm9tIHYxIGhhdmUgYmVlbiBtb3ZlZCB0byB0aGUgcGF0Y2hlcwogIHdoZXJlIHRoZSBi
dWlsZCBjaGFuZ2VzIGFyZSBpbnRyb2R1Y2VkLgoKQ2hhbmdlcyBpbiB2MzoKLSBHaXRIdWIgYnJh
bmNoIGZvciB2MyBbNF0uCi0gU2ltcGxpZnkgYSBwYXR0ZXJuIGZvciBpdGVyYXRpbmcgb3ZlciBi
dWlsdGluIHR5cGVzCiAgaW4gdGhlaXIgZnJvbUMgZnVuY3Rpb25zLgotIFRyeSBub3QgdG8gZHVw
bGljYXRlIGFzIG11Y2ggY29kZSBpbiBnZW5nb3R5cGVzLnB5LCBhbmQKICB1c2UgY29uc2lzdGVu
dCBzdHlsZSBpbiBnZW5lcmF0ZWQgY29kZSB3aGVuIGNhbGxpbmcgZnJvbUMuCgpDaGFuZ2VzIGlu
IHY0OgotIEdpdEh1YiBicmFuY2ggZm9yIHY0IFs1XS4KLSBUaGUgZmlyc3QgMTYgcGF0Y2hlcyB3
ZXJlIGNvbW1pdGVkIGFmdGVyIHYzLgoKQ2hhbmdlcyBpbiB2NToKLSBHaXRIdWIgYnJhbmNoIGZv
ciB2NSBbNl0uCi0gVGhlIG9ubHkgMyBwYXRjaGVzIGxlZnQgYXJlIGZvciBnZW5lcmF0aW5nIHRv
QyBtYXJzaGFsaW5nIGZ1bmN0aW9ucy4KClsxXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDcvbXNnMDIyNTkuaHRtbApbMl0gaHR0cHM6
Ly9naXRodWIuY29tL2VucjBuL3hlbi90cmVlL2dvbGFuZy1wYXRjaGVzLXYxClszXSBodHRwczov
L2dpdGh1Yi5jb20vZW5yMG4veGVuL3RyZWUvZ29sYW5nLXBhdGNoZXMtdjIKWzRdIGh0dHBzOi8v
Z2l0aHViLmNvbS9lbnIwbi94ZW4vdHJlZS9nb2xhbmctcGF0Y2hlcy12MwpbNV0gaHR0cHM6Ly9n
aXRodWIuY29tL2VucjBuL3hlbi90cmVlL2dvbGFuZy1wYXRjaGVzLXY0Cls2XSBodHRwczovL2dp
dGh1Yi5jb20vZW5yMG4veGVuL3RyZWUvZ29sYW5nLXBhdGNoZXMtdjUKCk5pY2sgUm9zYnJvb2sg
KDMpOgogIGdvbGFuZy94ZW5saWdodDogYmVnaW4gR28gdG8gQyB0eXBlIG1hcnNoYWxpbmcKICBn
b2xhbmcveGVubGlnaHQ6IGltcGxlbWVudCBrZXllZCB1bmlvbiBHbyB0byBDIG1hcnNoYWxpbmcK
ICBnb2xhbmcveGVubGlnaHQ6IGltcGxlbWVudCBhcnJheSBHbyB0byBDIG1hcnNoYWxpbmcKCiB0
b29scy9nb2xhbmcveGVubGlnaHQvZ2VuZ290eXBlcy5weSAgfCAgMTg1ICsrKwogdG9vbHMvZ29s
YW5nL3hlbmxpZ2h0L2hlbHBlcnMuZ2VuLmdvIHwgMjI0OSArKysrKysrKysrKysrKysrKysrKysr
KysrLQogdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvICAgIHwgICA4MiArLQogMyBm
aWxlcyBjaGFuZ2VkLCAyMzk5IGluc2VydGlvbnMoKyksIDExNyBkZWxldGlvbnMoLSkKCi0tIAoy
LjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

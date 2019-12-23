Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A631297FD
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 16:20:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijPSt-0006Ji-TW; Mon, 23 Dec 2019 15:17:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o8ed=2N=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1ijPSs-0006Jd-JE
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 15:17:46 +0000
X-Inumbo-ID: 5f3fea82-2597-11ea-88e7-bc764e2007e4
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f3fea82-2597-11ea-88e7-bc764e2007e4;
 Mon, 23 Dec 2019 15:17:45 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id k6so13766252qki.5
 for <xen-devel@lists.xenproject.org>; Mon, 23 Dec 2019 07:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=gAnetQU4RSrfq5iAn4o+j+f/18rYLLK9d/q1e52laW0=;
 b=fXkJHDRezfvXU5EjHd8QGO6+UjUqvi+gsoFW2Hzxs9zjoDM7yCO6VgWAaXfpCft+zz
 4BjW04IAyxrVEra9zAzybNDAlBGO8a4j7B+nbIaMaAvl0hoyc/z+6Erl8d/xqQt+lMEl
 qaeU1+/rIYxRaGCAcRRDG3oEM/IfgXImlKAYQHZYZz8cagwGWm6NGU40IOW2XsSnPpwT
 2vCWjpMYBwFuuxefL475rfZCGrHQ9/Mg6G8pjJ50cw/mfzfd1od8/XBzSkJZX0H8mf8b
 UBtTtxUtAOvwlzf/D5yi6MOhu8auIWjIL3fCWCDjfJFkCFeGVx0vM60t5T8rG3z3D3ow
 6AhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=gAnetQU4RSrfq5iAn4o+j+f/18rYLLK9d/q1e52laW0=;
 b=kuNtjJnuA1jccPYEGM+jG6Gv4UdPafGSJbosdGsOmX2KHgIyOA8p2+JPEA6GhGOpU8
 LWFJKLBi/6nmX09S5F9yK8HaJSiehw0EGfQe8yJQgaY4RvORumol6ao4hbcRWzTJyG2J
 HJAyN5mHHEDdhoazDWP7g4esOR6cYdNwufBI0x8vGbzoH9mY0STWVWOHq6UXGKoT+PN4
 fDZi7DpC4JMp/qDtozuuS4KCXruAsgFYWn/AKUZ3uUYbHO+NuJMINBH3hk1sAa9/TJWc
 Ydu1hIkIry00pERO61K/S329pIhbv+7LBPQTFjMvspxPNtBO5EgNWVshK5EOkCws4jS5
 BTNQ==
X-Gm-Message-State: APjAAAVDa+oCA2zut11bVl42lSj+qx1uxO4HqRUaBvKDg1pPdp4YJEdi
 m5iGycLrvKDWgbfbgfN6zO9rIRQP
X-Google-Smtp-Source: APXvYqxWTVJPLW6M/gvD2xtaosF0NHrvsbDMsHjVhMQDnpDe9Dkme1hl/cr9t+HKgch59Upr+o44jQ==
X-Received: by 2002:a37:6716:: with SMTP id b22mr25902859qkc.109.1577114264985; 
 Mon, 23 Dec 2019 07:17:44 -0800 (PST)
Received: from four.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id
 u15sm5823907qku.67.2019.12.23.07.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2019 07:17:44 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 23 Dec 2019 10:17:01 -0500
Message-Id: <cover.1577111872.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH v4 0/6] generated Go libxl bindings using IDL
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
 Ian Jackson <ian.jackson@eu.citrix.com>, kerriganb@ainfosec.com,
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
ZXJlIGNvbW1pdGVkIGFmdGVyIHYzLgoKWzFdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
YXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wNy9tc2cwMjI1OS5odG1sClsyXSBodHRwczov
L2dpdGh1Yi5jb20vZW5yMG4veGVuL3RyZWUvZ29sYW5nLXBhdGNoZXMtdjEKWzNdIGh0dHBzOi8v
Z2l0aHViLmNvbS9lbnIwbi94ZW4vdHJlZS9nb2xhbmctcGF0Y2hlcy12MgpbNF0gaHR0cHM6Ly9n
aXRodWIuY29tL2VucjBuL3hlbi90cmVlL2dvbGFuZy1wYXRjaGVzLXYzCls1XSBodHRwczovL2dp
dGh1Yi5jb20vZW5yMG4veGVuL3RyZWUvZ29sYW5nLXBhdGNoZXMtdjQKCk5pY2sgUm9zYnJvb2sg
KDYpOgogIGdvbGFuZy94ZW5saWdodDogaW1wbGVtZW50IGFycmF5IEMgdG8gR28gbWFyc2hhbGlu
ZwogIGdvbGFuZy94ZW5saWdodDogYmVnaW4gR28gdG8gQyB0eXBlIG1hcnNoYWxpbmcKICBnb2xh
bmcveGVubGlnaHQ6IGltcGxlbWVudCBrZXllZCB1bmlvbiBHbyB0byBDIG1hcnNoYWxpbmcKICBn
b2xhbmcveGVubGlnaHQ6IGltcGxlbWVudCBhcnJheSBHbyB0byBDIG1hcnNoYWxpbmcKICBnb2xh
bmcveGVubGlnaHQ6IHJldmlzZSB1c2Ugb2YgQ29udGV4dCB0eXBlCiAgZ29sYW5nL3hlbmxpZ2h0
OiBhZGQgZXJyb3IgcmV0dXJuIHR5cGUgdG8gQ29udGV4dC5DcHVwb29saW5mbwoKIHRvb2xzL2dv
bGFuZy94ZW5saWdodC9nZW5nb3R5cGVzLnB5ICB8ICAyMzIgKystCiB0b29scy9nb2xhbmcveGVu
bGlnaHQvaGVscGVycy5nZW4uZ28gfCAxOTQ1ICsrKysrKysrKysrKysrKysrKysrKysrKysrCiB0
b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28gICAgfCAgMjIyICstLQogMyBmaWxlcyBj
aGFuZ2VkLCAyMjEyIGluc2VydGlvbnMoKyksIDE4NyBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

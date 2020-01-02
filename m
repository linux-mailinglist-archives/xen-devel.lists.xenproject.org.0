Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBFE12EB27
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 22:17:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in7n9-00016Z-Kl; Thu, 02 Jan 2020 21:14:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XNPw=2X=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1in7n7-000161-Q9
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 21:14:01 +0000
X-Inumbo-ID: cbfbbfe2-2da4-11ea-88e7-bc764e2007e4
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cbfbbfe2-2da4-11ea-88e7-bc764e2007e4;
 Thu, 02 Jan 2020 21:14:01 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id 21so32387206qky.4
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2020 13:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=from:to:subject:date:message-id;
 bh=MLMP74Qul+kzC8cejQXgeuw3tNFBJiGyUZucJtJ/QlY=;
 b=imrt7o+Nqx58g1O6V2mkVBF0X3mpKD7xziHHz/l8CuGj82H8zbk9o0pJKvxc8wOmXV
 VJelDvV9Sarj7pQNjxsZvXh6YCVIipLEW2vgXE2sUrAenPUIFhV6h1UMd1w2fhJlrYVy
 9Zc9EtQAARm5MWqdbkMAd9Yc2rB/6ZIUq7cwRT74dGCjbCQhVNB4m4/XOBLFQ4SzVJVt
 xdNLPyTOC5jnXobeUSmc/vhUaK5AdcHt1UHQ8I4D0Cu/XGM1TPDf4y8swfAtoywA34oy
 JsTcvvAPH6Ixw+FmxMvlmP2LLQubnM7MI4xX4QBxOKvu0SnayI4ATkyYnd1nQ/44jWYF
 XZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=MLMP74Qul+kzC8cejQXgeuw3tNFBJiGyUZucJtJ/QlY=;
 b=ad7p+5tnnhHeCQ5sOiscNM124cw+c9f9fTPu/drW5WTa5x4w/TBJkMbCzKRm3E5bhs
 FJ771GHfvTaCw9EiuCS0HuuPXk1ssL+Mlz2BkzqGHRfqcAf0GSa5wFVPQoryxKZVpnHU
 2mbOgfMzoVcYAYoxVIqEQVWz9FICNi+AQT5LSek1vbqtFMovVYa9Wa1o4hPr5V2UCM2Z
 50ixLMnBht7jluVPsj5/A4Te3g0IVeAoZ4Z4KMihGC4ch962QVZv9htnjLu4wg4OY/oZ
 RpuyZogHCQeCyjm/qtYrcZ4JjXm/OWxJ5o8gRg1JaSc0LzoMcGTkCQ8jLp4eYe9aXZmg
 siZg==
X-Gm-Message-State: APjAAAX95quTqVFP/zHYWAccIroFWtfQi5A/0TV0Dl2hDddhDwk31MkF
 Bu45U3YhO6q7Kp4wXsVEfzlTRw==
X-Google-Smtp-Source: APXvYqxe1FkmrFoyzjV9jkb3V7sY9OvDubbb64WjyE82gpvQTibRMR/HebgLizW6nByQc9Tc7zrXdA==
X-Received: by 2002:a37:e308:: with SMTP id y8mr68320580qki.347.1577999640406; 
 Thu, 02 Jan 2020 13:14:00 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net.
 [73.69.118.222])
 by smtp.gmail.com with ESMTPSA id f97sm17384185qtb.18.2020.01.02.13.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 13:13:59 -0800 (PST)
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
Date: Thu,  2 Jan 2020 16:13:51 -0500
Message-Id: <20200102211357.8042-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH v5 0/6] Use C inlines for uaccess
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2hhbmdlbG9nOgp2NToKCS0gRml4ZWQgYnVpbGQgaXNzdWUgcmVwb3J0ZWQgYnkga2J1aWxkCgkt
IFJlbW92ZWQgYSBjb21tZW50IGZpeCBmcm9tIHRoZSBmaXJzdCBwYXRjaAoJLSBBZGRlZCByZXZp
ZXdlZC1ieSdzIGZyb20gSnVsaWVuIEdyYWxsCgktIE5vdywgdGhlc2UgcGF0Y2hlcyBhcHBseSBh
Z2FpbnN0IG1haW5saW5lCnY0OgoJLSBTcGxpdCB0aGUgZmlyc3QgcGF0Y2ggaW50byB0d28gYXMg
SnVsaWVuIEdyYWxsIAoJLSBBbHNvIGFzIE1hcmsgUnV0bGFuZCBzdWdnZXN0ZWQgcmVtb3ZlZCBh
bHRlcm5hdGl2ZXMKCSAgZnJvbSBfX2FzbV9mbHVzaF9jYWNoZV91c2VyX3JhbmdlLgp2MzoKCS0g
QWRkZWQgQWNrZWQtYnkgZnJvbSBTdGVmYW5vIFN0YWJlbGxpbmkKCS0gQWRkcmVzc2VkIGNvbW1l
bnRzIGZyb20gTWFyayBSdXRsYW5kCnYyOgoJLSBBZGRyZXNzZWQgUnVzc2VsbCBLaW5nJ3MgY29u
Y2VybiBieSBub3QgYWRkaW5nCgkgIHVhY2Nlc3NfKiB0byBBUk0uCgktIFJlbW92ZWQgdGhlIGFj
Y2lkZW50YWwgY2hhbmdlIHRvIHh0ZW5zYQoKQ29udmVydCB0aGUgcmVtYWluaW5nIHVhY2Nlc3Nf
KiBjYWxscyBmcm9tIEFTTSBtYWNyb3MgdG8gQyBpbmxpbmVzLgoKVGhlc2UgcGF0Y2hlcyBhcHBs
eSBhZ2FpbnN0IG1haW5lbGluZS4gSSBib290IHRlc3RlZCBBUk02NCwgYW5kCmNvbXBpbGUgdGVz
dGVkIEFSTSBjaGFuZ2UKClByZXZpb3VzIGRpc2N1c3Npb25zOgp2NDogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGttbC8yMDE5MTIwNDIzMjA1OC4yNTAwMTE3LTEtcGFzaGEudGF0YXNoaW5Ac29s
ZWVuLmNvbQp2MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDE5MTEyNzE4NDQ1My4y
MjkzMjEtMS1wYXNoYS50YXRhc2hpbkBzb2xlZW4uY29tCnYyOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sLzIwMTkxMTIyMDIyNDA2LjU5MDE0MS0xLXBhc2hhLnRhdGFzaGluQHNvbGVlbi5j
b20KdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAxOTExMjExODQ4MDUuNDE0NzU4
LTEtcGFzaGEudGF0YXNoaW5Ac29sZWVuLmNvbQoKUGF2ZWwgVGF0YXNoaW4gKDYpOgogIGFybS9h
cm02NC94ZW46IGh5cGVyY2FsbC5oIGFkZCBpbmNsdWRlcyBndWFyZHMKICBhcm0vYXJtNjQveGVu
OiB1c2UgQyBpbmxpbmVzIGZvciBwcml2Y21kX2NhbGwKICBhcm02NDogcmVtb3ZlIHVhY2Nlc3Nf
dHRicjAgYXNtIG1hY3JvcyBmcm9tIGNhY2hlIGZ1bmN0aW9ucwogIGFybTY0OiByZW1vdmUgX19h
c21fZmx1c2hfaWNhY2hlX3JhbmdlCiAgYXJtNjQ6IG1vdmUgQVJNNjRfSEFTX0NBQ0hFX0RJQy9f
SURDIGZyb20gYXNtIHRvIEMKICBhcm02NDogcmVtb3ZlIHRoZSByZXN0IG9mIGFzbS11YWNjZXNz
LmgKCiBhcmNoL2FybS9pbmNsdWRlL2FzbS94ZW4vaHlwZXJjYWxsLmggICB8IDEwICsrKysKIGFy
Y2gvYXJtL3hlbi9lbmxpZ2h0ZW4uYyAgICAgICAgICAgICAgIHwgIDIgKy0KIGFyY2gvYXJtL3hl
bi9oeXBlcmNhbGwuUyAgICAgICAgICAgICAgIHwgIDQgKy0KIGFyY2gvYXJtNjQvaW5jbHVkZS9h
c20vYXNtLXVhY2Nlc3MuaCAgIHwgNjEgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGFyY2gvYXJt
NjQvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oICAgIHwgNTUgKysrKysrKysrKysrKysrKysrKy0t
CiBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL3hlbi9oeXBlcmNhbGwuaCB8IDI4ICsrKysrKysrKysr
CiBhcmNoL2FybTY0L2tlcm5lbC9lbnRyeS5TICAgICAgICAgICAgICB8IDI3ICsrKysrKysrKy0K
IGFyY2gvYXJtNjQvbGliL2NsZWFyX3VzZXIuUyAgICAgICAgICAgIHwgIDIgKy0KIGFyY2gvYXJt
NjQvbGliL2NvcHlfZnJvbV91c2VyLlMgICAgICAgIHwgIDIgKy0KIGFyY2gvYXJtNjQvbGliL2Nv
cHlfaW5fdXNlci5TICAgICAgICAgIHwgIDIgKy0KIGFyY2gvYXJtNjQvbGliL2NvcHlfdG9fdXNl
ci5TICAgICAgICAgIHwgIDIgKy0KIGFyY2gvYXJtNjQvbW0vY2FjaGUuUyAgICAgICAgICAgICAg
ICAgIHwgNjggKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGFyY2gvYXJtNjQvbW0vZmx1c2gu
YyAgICAgICAgICAgICAgICAgIHwgIDMgKy0KIGFyY2gvYXJtNjQveGVuL2h5cGVyY2FsbC5TICAg
ICAgICAgICAgIHwgMTkgKy0tLS0tLQogaW5jbHVkZS94ZW4vYXJtL2h5cGVyY2FsbC5oICAgICAg
ICAgICAgfCAxMiArKy0tLQogMTUgZmlsZXMgY2hhbmdlZCwgMTQ2IGluc2VydGlvbnMoKyksIDE1
MSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2luY2x1ZGUvYXNt
L2FzbS11YWNjZXNzLmgKCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

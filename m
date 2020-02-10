Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C08C156E78
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 05:38:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j10nO-00012S-UT; Mon, 10 Feb 2020 04:35:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZgKX=36=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1j10nN-00011i-T8
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 04:35:41 +0000
X-Inumbo-ID: c870dbcc-4bbe-11ea-a759-bc764e2007e4
Received: from mail-pl1-x643.google.com (unknown [2607:f8b0:4864:20::643])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c870dbcc-4bbe-11ea-a759-bc764e2007e4;
 Mon, 10 Feb 2020 04:35:37 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id t14so2296791plr.8
 for <xen-devel@lists.xenproject.org>; Sun, 09 Feb 2020 20:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1cbDJdoK8QYqxLOfQx5VCmIO7/QSEycKH+XqDTZq9Es=;
 b=R4XSIXaRV7GsmDuDAp2wkhHB9wqkOUpgdlvkLIlSFYp6Oz9Wr9dC+nacxHqQOS2YuE
 p4EnIDbCmJfbXIrvkHgZkSv4dNcwlviukQe1i6+TGHNp9FAkW35P/OdG+pCon1l11uT+
 2zH4flZvDfDIfPltjRbBnWZwgrD9l5awIIjaXUvdsLcsOw8rbazfvJTcokgJCeywxIba
 LFVa09Jk6UjhjNmcSN5H0F2OhWr/GnnKU2WYJXzRaMPsQSNqQS1peMky8KsAgjWY3KGX
 0Zwy8FfHGtmKf6mlmY4sPyap/Zl4v1Lqo6mMSbiw+WuXnxHdWzZOeyfgifXK04bBkH1M
 373A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1cbDJdoK8QYqxLOfQx5VCmIO7/QSEycKH+XqDTZq9Es=;
 b=S4+UGED2RZfUoSEQsG2RNQJlv3Z/mQ8Qx7oi/I60PlS4QhQEvkJWXhjR0qxhFMWsKn
 CGXTWmZbYOFbK2KCzxqBE97/JU+4ubImEc3Xh3eObDEaWNY7W0tmBv8WeXKebf7WR/MQ
 cvq6vJbs1sN7ol2ab98s+X0mgefocXUJ2pd+yFxhiSky3Y+D9LqGbA/vkTC2X5wIVmpY
 UUb9BfE5tN2T0VFE+2wqEkOqbaT0n7s+L2Zeyd0A3JA4UHxGnkgCEp5oz40jtLWzbJvH
 HYlVtxYqx05FAqSA6ReR+4j8alRyoiGLfL7qwb8nzqHswvvgIRniFdgACyL5qk1bdqff
 2k0w==
X-Gm-Message-State: APjAAAXbJaEfdo+rsDp60uNHbQ6Nv6HICT+xywo61y4BUEPkQMrdcMjS
 Yx0sV0Phk6yFf6kfiE4bU+Ij4OFg
X-Google-Smtp-Source: APXvYqwhN9acwKXzwXPM5FdcqdExio0g48BGDlRiLnWykzhOhAcPEhBsPNbQVTlk6gHEEnB0ww1qVw==
X-Received: by 2002:a17:902:426:: with SMTP id
 35mr10921245ple.176.1581309335944; 
 Sun, 09 Feb 2020 20:35:35 -0800 (PST)
Received: from desktop.ice.pyrology.org
 (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
 by smtp.gmail.com with ESMTPSA id l15sm9089246pgi.31.2020.02.09.20.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2020 20:35:35 -0800 (PST)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Sun,  9 Feb 2020 20:35:15 -0800
Message-Id: <20200210043516.1996-2-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210043516.1996-1-christopher.w.clark@gmail.com>
References: <20200210043516.1996-1-christopher.w.clark@gmail.com>
Subject: [Xen-devel] [PATCH 1/2] pygrub: fix python3 cross-compile: install
 with INSTALL_PYTHON_PROG
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
Cc: Rich Persaud <persaur@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW5zdGFsbCBweWdydWIgd2l0aCBJTlNUQUxMX1BZVEhPTl9QUk9HLCBhcyBwZXIgdGhlIG90aGVy
IFhlbiBweXRob24KZXhlY3V0YWJsZXMsIHRvIGVuc3VyZSB0aGF0IHRoZSBoYXNoYmFuZyBwYXRo
IHRvIHRoZSBpbnRlcnByZXRlcgppcyB3cml0dGVuIGNvcnJlY3RseSBpbiBjcm9zcy1jb21waWxl
IGJ1aWxkcywgZWcuIHdpdGggT3BlbkVtYmVkZGVkLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3Bo
ZXIgQ2xhcmsgPGNocmlzdG9waGVyLmNsYXJrNkBiYWVzeXN0ZW1zLmNvbT4KLS0tCiB0b29scy9w
eWdydWIvTWFrZWZpbGUgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvdG9vbHMvcHlncnViL01ha2VmaWxlIGIvdG9vbHMvcHlncnViL01ha2VmaWxl
CmluZGV4IDMwNjNjNDk5OGYuLmI0ZjZmMTBkZGQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3B5Z3J1Yi9N
YWtlZmlsZQorKysgYi90b29scy9weWdydWIvTWFrZWZpbGUKQEAgLTE4LDYgKzE4LDggQEAgaW5z
dGFsbDogYWxsCiAJQ0M9IiQoQ0MpIiBDRkxBR1M9IiQoUFlfQ0ZMQUdTKSIgTERGTEFHUz0iJChQ
WV9MREZMQUdTKSIgJChQWVRIT04pIFwKIAkJc2V0dXAucHkgaW5zdGFsbCAtLXJlY29yZCAkKElO
U1RBTExfTE9HKSAkKFBZVEhPTl9QUkVGSVhfQVJHKSBcCiAJCSAtLXJvb3Q9IiQoREVTVERJUiki
IC0taW5zdGFsbC1zY3JpcHRzPSQoTElCRVhFQ19CSU4pIC0tZm9yY2UKKwlybSAtZiAkKERFU1RE
SVIpLyQoTElCRVhFQ19CSU4pL3B5Z3J1YgorCSQoSU5TVEFMTF9QWVRIT05fUFJPRykgc3JjL3B5
Z3J1YiAkKERFU1RESVIpLyQoTElCRVhFQ19CSU4pL3B5Z3J1YgogCXNldCAtZTsgaWYgWyAkKGJp
bmRpcikgIT0gJChMSUJFWEVDX0JJTikgLWEgXAogCSAgICAgICAgICAgICAiYHJlYWRsaW5rIC1m
ICQoREVTVERJUikvJChiaW5kaXIpYCIgIT0gXAogCSAgICAgICAgICAgICAiYHJlYWRsaW5rIC1m
ICQoTElCRVhFQ19CSU4pYCIgXTsgdGhlbiBcCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

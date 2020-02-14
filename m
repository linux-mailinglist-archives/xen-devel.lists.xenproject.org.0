Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE4715F838
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2020 21:54:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2huj-00046N-3Q; Fri, 14 Feb 2020 20:50:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ulQC=4C=gmail.com=jbi.octave@srs-us1.protection.inumbo.net>)
 id 1j2htQ-0003O6-3u
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 20:48:56 +0000
X-Inumbo-ID: 67ea927e-4f6b-11ea-bc8e-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67ea927e-4f6b-11ea-bc8e-bc764e2007e4;
 Fri, 14 Feb 2020 20:48:51 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w12so12470372wrt.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2020 12:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xuZKU7LjmXWLYQI/wtTpyWHlvqjYehwlyKEt0Tnztc4=;
 b=fn8INV2ODKBl+bG/dtdZOpRB8nT5T8itpwEPSR0z27GWAYSVu1s+fYw6/0zv6k28a7
 tZA1dQbPfL+m+lO91btmj/u7dynyGdCwSnCvJ6+L7Wn/iOsXg9yvIeQZfugEaozwGMTO
 KNZBDqjYZRrPr750JIsMLiNvYlkEVSA84TRMO81Pt4ZsxlLYmJqsVtjCfqQem1Pgc1k1
 3wBvXxOcpBiOssy1gzPJBOv/0wJnOwPaT2qXfFT+RUHATT+PpHmZ6Ph1APJVHDn/tlez
 QUAKymRjOEDOppyFluLHU1/65qetfcs2joTiF8+4zhypXrOaqvzVmpx1LmoAg1IS/X/K
 bd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xuZKU7LjmXWLYQI/wtTpyWHlvqjYehwlyKEt0Tnztc4=;
 b=NbHYYz3IGLpdxd1nSK8411WOflWZziltFT4sRhNfzMBzqi5GOfp1eUACRVQFa7OhqX
 drNoWg8QR664gfNfAvmiR3Jn+UcT3/wXsqNr7otETnQmPXqnmxOELjGyjNsVsNKkJDlO
 UyYQ1eAI6lTuDk8vP9Py5uY7sUxugzkReab64JM8d96OcMpoeEBssgGDHW2hnjoUNuh2
 3GjdQxvfTR0XNPTjAjBCiQOIvUchO7zIo58kqld2LjXNHYs8sHnW8I0uJs8qMXAW/Mh0
 3oFeGwi8De6QfOUIndqkeZE2BF/kX7M9L0VETOriPooINYnyykxFvEMtfzAjdCYONUrx
 QR7A==
X-Gm-Message-State: APjAAAU4pu0t+YdeF31KIPPH70EXoly+xEaAaYtxioUuoMTPSpngK4p3
 mf7J50ag04g+r2B5qkxZZw==
X-Google-Smtp-Source: APXvYqyOibwoRxJ6OG/pfMQU/qnxDVxBoitUFSf/mkb3Z3bKbL8DjSkLBFHPpJm3dbdATypsCa8WcA==
X-Received: by 2002:a5d:4b88:: with SMTP id b8mr5775564wrt.343.1581713330706; 
 Fri, 14 Feb 2020 12:48:50 -0800 (PST)
Received: from ninjahost.lan (host-2-102-13-223.as13285.net. [2.102.13.223])
 by smtp.googlemail.com with ESMTPSA id y12sm8660782wmj.6.2020.02.14.12.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 12:48:50 -0800 (PST)
From: Jules Irenge <jbi.octave@gmail.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 14 Feb 2020 20:47:26 +0000
Message-Id: <20200214204741.94112-16-jbi.octave@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200214204741.94112-1-jbi.octave@gmail.com>
References: <0/30>
 <20200214204741.94112-1-jbi.octave@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 14 Feb 2020 20:50:15 +0000
Subject: [Xen-devel] [PATCH 15/30] x86/xen: Add missing annotation for
 xen_pte_unlock()
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
Cc: Juergen Gross <jgross@suse.com>, Jules Irenge <jbi.octave@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, boqun.feng@gmail.com,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3BhcnNlIHJlcG9ydHMgd2FybmluZyBhdCB4ZW5fcHRlX3VubG9jaygpCgp3YXJuaW5nOiBjb250
ZXh0IGltYmFsYW5jZSBpbiB4ZW5fcHRlX3VubG9jaygpIC0gdW5leHBlY3RlZCB1bmxvY2sKClRo
ZSByb290IGNhdXNlIGlzIHRoZSBtaXNzaW5nIGFubm90YXRpb24gYXQgeGVuX3B0ZV91bmxvY2so
KQpBZGQgdGhlIG1pc3NpbmcgX19yZWxlYXNlcyhwdGwpIGFubm90YXRpb24KClNpZ25lZC1vZmYt
Ynk6IEp1bGVzIElyZW5nZSA8amJpLm9jdGF2ZUBnbWFpbC5jb20+Ci0tLQogYXJjaC94ODYveGVu
L21tdV9wdi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL21tdV9wdi5jIGIvYXJjaC94ODYveGVu
L21tdV9wdi5jCmluZGV4IDM1MmYwYzgwY2ZjZi4uNzc3MDA4ZjhjNjY4IDEwMDY0NAotLS0gYS9h
cmNoL3g4Ni94ZW4vbW11X3B2LmMKKysrIGIvYXJjaC94ODYveGVuL21tdV9wdi5jCkBAIC03MDcs
NyArNzA3LDcgQEAgc3RhdGljIHNwaW5sb2NrX3QgKnhlbl9wdGVfbG9jayhzdHJ1Y3QgcGFnZSAq
cGFnZSwgc3RydWN0IG1tX3N0cnVjdCAqbW0pCiAJcmV0dXJuIHB0bDsKIH0KIAotc3RhdGljIHZv
aWQgeGVuX3B0ZV91bmxvY2sodm9pZCAqdikKK3N0YXRpYyB2b2lkIHhlbl9wdGVfdW5sb2NrKHZv
aWQgKnYpIF9fcmVsZWFzZXMocHRsKQogewogCXNwaW5sb2NrX3QgKnB0bCA9IHY7CiAJc3Bpbl91
bmxvY2socHRsKTsKLS0gCjIuMjQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=

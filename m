Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2551833EE
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 15:59:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCPFc-0001kY-Iy; Thu, 12 Mar 2020 14:55:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M9DE=45=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jCPFb-0001kL-2p
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 14:55:55 +0000
X-Inumbo-ID: 92191604-6471-11ea-b34e-bc764e2007e4
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92191604-6471-11ea-b34e-bc764e2007e4;
 Thu, 12 Mar 2020 14:55:53 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id p62so6667329qkb.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2020 07:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dPf84LI1UdOAWSpswTaYbpFsLsXznLnxYTCzP40ZY1k=;
 b=R/rqxDinlmG2e5rsAeCR+/RIaisag6YdlWPzvvWMeLrMzNsGJ1hd6FZDWBKZT2nY5x
 HhSX9T/bv3sdLFODGkHoxYhnkWHypWCCGb4BqYQ1wCw8qpR2JAQb2Jm9qMv0A1i7XPKO
 STW1AazTSdEmqgs0RaI14k+TswLfB3D4SqswQWlWzTLg3do9dfyudJnqRgaCy1w8KFTD
 iwCpw1QX8Si04zUJvN3QFk9aKrNM6Riq9VlsgiiFopXtdBDNgaNRcpqLGT5Tn8HK8y0x
 zsONZleP8yx/W5rXL2ARFutBAE2CbGDGyK2A/e1PEXuKG9ZOhvurwJNRwwcWHkzSYiIf
 bmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dPf84LI1UdOAWSpswTaYbpFsLsXznLnxYTCzP40ZY1k=;
 b=h7cPZP9zU8W9QPptEGcPEgC4h8P17cjs/oc7tDdKbEGAp78G1KIcrFd2bO/5e6IA1A
 j/YZbLtnL84tTb7PuCoKqaJVFqBdu2/J1SLnG89VEACSUZomAXtgcQf5ka1Bqk93LZ5W
 BhMBlUD6pMB+1rCM1cpVbv+WBSm1OnnsuKchbgpVqiY1S82NaM6zs08hD0765F9LmwoP
 53oONVK+D9YnVPCAeTIpDc1FeUHkWblpJELFR5C/Fd0v9W8aZRU29tWxjs+UT6pRRAXl
 P1p8tqxjx3Sl06vE+fCMeDioJoNbwuRWuwwebNIXSy3bC+dqafrjnbsUBEKkeNyrTODc
 DiwA==
X-Gm-Message-State: ANhLgQ35KSKYlpfqqQfmQvAm3JuFovKqcH3MbpgBxlgdQTU4193Uv0kH
 7+AzEF/JvVNMUoUZocd6wDez8GLD
X-Google-Smtp-Source: ADFU+vsgJAhwDKjms278g/QRkNmpgagdQQhlZg9GYSx5FXOJw40YRnTk6XzcvAbF+WeF/PIlbJZsTA==
X-Received: by 2002:ae9:d8c4:: with SMTP id u187mr7250955qkf.354.1584024952720; 
 Thu, 12 Mar 2020 07:55:52 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 q1sm19756442qtp.81.2020.03.12.07.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 07:55:52 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 12 Mar 2020 10:54:16 -0400
Message-Id: <20200312145417.106812-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200312145417.106812-1-jandryuk@gmail.com>
References: <20200312145417.106812-1-jandryuk@gmail.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] scripts: Replace tabs in locking.sh
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVwbGFjZSB0d28gc3RyYXkgdGFicyB3aXRoIHNwYWNlcyB0byBtYWtlIHRoZSBmaWxlIHdoaXRl
c3BhY2UKY29uc2lzdGVudC4KClNpZ25lZC1vZmYtYnk6IEphc29uIEFuZHJ5dWsgPGphbmRyeXVr
QGdtYWlsLmNvbT4KLS0tCiB0b29scy9ob3RwbHVnL0xpbnV4L2xvY2tpbmcuc2ggfCA0ICsrLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvdG9vbHMvaG90cGx1Zy9MaW51eC9sb2NraW5nLnNoIGIvdG9vbHMvaG90cGx1Zy9MaW51
eC9sb2NraW5nLnNoCmluZGV4IGM2YTdlOTZmZjkuLmJhYWFmNzM1MDggMTAwNjQ0Ci0tLSBhL3Rv
b2xzL2hvdHBsdWcvTGludXgvbG9ja2luZy5zaAorKysgYi90b29scy9ob3RwbHVnL0xpbnV4L2xv
Y2tpbmcuc2gKQEAgLTU4LDggKzU4LDggQEAgY2xhaW1fbG9jaygpCiAgICAgICAgICAgICBwcmlu
dCAieVxuIiBpZiAkZmRfaW51bSBlcSAkZmlsZV9pbnVtOwogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAnICIkX2xvY2tmaWxlIiApCiAgICAgICAgIGlmIFsgeCRyaWdodGZpbGUgPSB4eSBd
OyB0aGVuIGJyZWFrOyBmaQotCSMgU29tZSB2ZXJzaW9ucyBvZiBiYXNoIGFwcGVhciB0byBiZSBi
dWdneSBpZiB0aGUgc2FtZQotCSMgJF9sb2NrZmlsZSBpcyBvcGVuZWQgcmVwZWF0ZWRseS4gQ2xv
c2UgdGhlIGN1cnJlbnQgZmQgaGVyZS4KKyAgICAgICAgIyBTb21lIHZlcnNpb25zIG9mIGJhc2gg
YXBwZWFyIHRvIGJlIGJ1Z2d5IGlmIHRoZSBzYW1lCisgICAgICAgICMgJF9sb2NrZmlsZSBpcyBv
cGVuZWQgcmVwZWF0ZWRseS4gQ2xvc2UgdGhlIGN1cnJlbnQgZmQgaGVyZS4KICAgICAgICAgZXZh
bCAiZXhlYyAkX2xvY2tmZDwmLSIKICAgICBkb25lCiB9Ci0tIAoyLjI0LjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

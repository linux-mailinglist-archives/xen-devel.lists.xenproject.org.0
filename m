Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B18A118CF9
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 16:50:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iehkR-00035F-FV; Tue, 10 Dec 2019 15:48:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A1/D=2A=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iehkP-00034X-Ri
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 15:48:25 +0000
X-Inumbo-ID: 709bb30c-1b64-11ea-b6f1-bc764e2007e4
Received: from mail-qv1-xf42.google.com (unknown [2607:f8b0:4864:20::f42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 709bb30c-1b64-11ea-b6f1-bc764e2007e4;
 Tue, 10 Dec 2019 15:47:59 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id q19so4345845qvy.9
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2019 07:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Sxwv5A++XwWjW3r96jIpvbj5k3Ch0M30fjE7fzumV0=;
 b=pTUHbIZ/DpbwkzmQMz17B423imTwlhuSwOW23dDrhxWPxxYR7L7y8CMz0pr1I37unf
 4DtiW4b9RmcuURRn+hn2Nb5fNQDdCfimhXEdYD9UHYuNObXCfagLPsKH/jzFmEm+8Og8
 16vkqTYGnvmP4wJQomXPtVpOsuzMYN/Y3FeiTwRLq5t00OFgiOmz5q+fV8b7w0IU4jz2
 REuw7/Z7b2OBPZA5SD1uS3ORmxylxZfOttnou9PEgfrXL8L8V5VbA6YdmOFnUTPN9H/q
 WWmbyNZBSpRUp/lOBJFx/fAug1DhLX1nWaG0YXkp2HiyzaUF8IWqb/GnVVxtjImN0VXS
 ycXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Sxwv5A++XwWjW3r96jIpvbj5k3Ch0M30fjE7fzumV0=;
 b=GCPJ7UY3hbct6ZYKOE7arC1+EaD5mmM8sA1CL+ODVojSNIek5uRo3rMGX/Iz5kV3nc
 bNoCEXUI4CczjNHqJMAcTmS+QMGsaUpZCgpA9HHLRZVoAGbXzy2uvW6x9CSPlyU35Qf3
 RACCIudHvLQzUaAZhavz0OHeOPXHuafq9X0pzTzAJRe4i4bo5xWc/MKJqNsiPlLrrx/l
 f46jDCorfvzsLKw7BsFrEVUUA6cTA0vDsYxUHbsqjjc+dq2+PWzk8ejT2Oi/1OVVRQgL
 PjBoTfUm3GYbGC9myvHhbhLdWzrXyfbjLfWrFcpQ4otwPBTBhIrjqrAdD8P43yR/7woj
 sb+w==
X-Gm-Message-State: APjAAAWiK5H5vypBOzxdk6Q32LuvN0XBtMdxa3WyCnwbvlyIrgmU9fl+
 L61jO3NS1aGsufbN9tn9bkEhNcOJ
X-Google-Smtp-Source: APXvYqwK2pN/734YUERX1Hy9tqF2dVHK62qvXujL4uGZLiL2bKMtog0QHdO/rwqqjQaBI47C9hJBnQ==
X-Received: by 2002:a05:6214:983:: with SMTP id
 dt3mr29504946qvb.145.1575992878193; 
 Tue, 10 Dec 2019 07:47:58 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id m29sm1247848qtf.1.2019.12.10.07.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 07:47:57 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 10 Dec 2019 10:47:22 -0500
Message-Id: <7de569cbacb5d9869ee657bd1ae3bc7c6fe49b1a.1575990937.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1575990937.git.rosbrookn@ainfosec.com>
References: <cover.1575990937.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 07/22] golang/xenlight: define Mac builtin
 type
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KCkRlZmluZSBNYWMg
YXMgWzZdYnl0ZSBhbmQgaW1wbGVtZW50IGZyb21DLCB0b0MsIGFuZCBTdHJpbmcgZnVuY3Rpb25z
LgoKU2lnbmVkLW9mZi1ieTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4K
UmV2aWV3ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KLS0t
CkNoYW5nZXMgaW4gdjI6Ci0gRml4IHRoZSBmb3JtYXQgc3RyaW5nIGluIFN0cmluZyBmdW5jdGlv
biB0byB1c2UgJTAyeC4KLSBVc2UgYSB2YWx1ZSByZWNpZXZlciBmb3IgdGhlIHRvQyBmdW5jdGlv
bi4KQ2hhbmdlcyBpbiB2MzoKLSBJdGVyYXRlIG92ZXIgdGhlIGluZGlyZWN0IG9mIG1hYyBpbnN0
ZWFkIG9mIGNyZWF0aW5nCiAgYSBzbGljZSBmcm9tIHRoZSBDIHR5cGUuCi0tLQogdG9vbHMvZ29s
YW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29s
cy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28gYi90b29scy9nb2xhbmcveGVubGlnaHQveGVu
bGlnaHQuZ28KaW5kZXggNzJhZmMzY2YxNC4uMTdkMTQ2NzcxZSAxMDA2NDQKLS0tIGEvdG9vbHMv
Z29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCisrKyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94
ZW5saWdodC5nbwpAQCAtMTgxLDYgKzE4MSwzOSBAQCBmdW5jIChkICpEZWZib29sKSB0b0MoKSAo
Qy5saWJ4bF9kZWZib29sLCBlcnJvcikgewogCXJldHVybiBjLCBuaWwKIH0KIAorLy8gTWFjIHJl
cHJlc2VudHMgYSBsaWJ4bF9tYWMsIG9yIHNpbXBseSBhIE1BQyBhZGRyZXNzLgordHlwZSBNYWMg
WzZdYnl0ZQorCisvLyBTdHJpbmcgZm9ybWF0cyBhIE1hYyBhZGRyZXNzIHRvIHN0cmluZyByZXBy
ZXNlbnRhdGlvbi4KK2Z1bmMgKG1hYyBNYWMpIFN0cmluZygpIHN0cmluZyB7CisJcyA6PSAiJTAy
eDolMDJ4OiUwMng6JTAyeDolMDJ4OiUwMngiCisJb3B0cyA6PSBtYWtlKFtdaW50ZXJmYWNle30s
IDYpCisKKwlmb3IgaSwgdiA6PSByYW5nZSBtYWMgeworCQlvcHRzW2ldID0gdgorCX0KKworCXJl
dHVybiBmbXQuU3ByaW50ZihzLCBvcHRzLi4uKQorfQorCitmdW5jIChtYWMgKk1hYykgZnJvbUMo
Y21hYyAqQy5saWJ4bF9tYWMpIGVycm9yIHsKKwlmb3IgaSA6PSByYW5nZSAqbWFjIHsKKwkJbWFj
W2ldID0gYnl0ZShjbWFjW2ldKQorCX0KKworCXJldHVybiBuaWwKK30KKworZnVuYyAobWFjIE1h
YykgdG9DKCkgKEMubGlieGxfbWFjLCBlcnJvcikgeworCXZhciBjbWFjIEMubGlieGxfbWFjCisK
Kwlmb3IgaSwgdiA6PSByYW5nZSBtYWMgeworCQljbWFjW2ldID0gQy51aW50OF90KHYpCisJfQor
CisJcmV0dXJuIGNtYWMsIG5pbAorfQorCiB0eXBlIENvbnRleHQgc3RydWN0IHsKIAljdHggICAg
KkMubGlieGxfY3R4CiAJbG9nZ2VyICpDLnhlbnRvb2xsb2dfbG9nZ2VyX3N0ZGlvc3RyZWFtCi0t
IAoyLjE5LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16090FE5F8
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 20:48:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVhXX-0001je-Ml; Fri, 15 Nov 2019 19:45:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1SQg=ZH=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iVhXW-0001j7-HQ
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 19:45:54 +0000
X-Inumbo-ID: 7029a7b8-07e0-11ea-adbe-bc764e2007e4
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7029a7b8-07e0-11ea-adbe-bc764e2007e4;
 Fri, 15 Nov 2019 19:45:12 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id m16so9026829qki.11
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 11:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U0uRdbQ97Jci5S6T709cmAdpGm4vb5NqX8cD6aIJD1I=;
 b=luBZLGUvSEjVB1Dn+nW3uUIzXLfFmaNdimw+p46lqUV9gsVhkzBnhyzGVs2hnXH6Io
 w9XPqa2vcxxppNP0XCVQq6EfYPK3Edj6HKRK4yvjzWovG5pH52E+YbdjELB3SV7vdS5a
 9GLWz4cfJmlxp7jjJFXq+I6N4pKHlpK0EPkyEh8DXZnC7Kk6PoKD6P5Dfi+TrlvIjKk1
 MWMF6OoCgnGMos7zxssXpobtt/lI33JfObZLo9wE06/8T5NUYCScH+IfjyodHHdH1Xaa
 TNgjBj1oGH2b8AvE4Fh8hTl3eHVuHo3pJbuW0dZS+YoayUy3EuHGEsEf9Q8d4heY0wOv
 uqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U0uRdbQ97Jci5S6T709cmAdpGm4vb5NqX8cD6aIJD1I=;
 b=r2Fm22xk+QPxdylFCjOc40hHW7BuOUoT4BKq/dx3F1qBMqoiFRDYGD0ddP6bXtG1fk
 Gn+dAGOTY6a1jxc4WfkPkNQyXA509eaoe962835zA8XkDOYXXfd6m4cVVVIKJMdi27pd
 KiEc4J+UyG/v6NVgC4IAKILKNJ4gJsRZihqMdyaFUsh7mR9RfgRuTyi/682Yofx/C6t2
 DTqylrDJ2dOrkFcNEU82DCYZKrYCbBRWz9v2Ev1ZQTcyJl4NQGQU51Gnh1+GDUgcD5SH
 svH/JYVpzhPfzuT8NVZa5pGmYiXA1V4oHvrAI6Xxgq0R48Q+2s0yC0w8AWLibiMv+Roa
 xPkA==
X-Gm-Message-State: APjAAAXJnV2h4MccRFHNFUdA3u34o05zMJjApEedQ7t2ZzAzT3gWDKxN
 sSd/VQKLH4QvWq6I24YvKhASueGf
X-Google-Smtp-Source: APXvYqzDq5dlGuJKHmXdakxlK4QrBz+F0mQ1TvzF2eKtnT56y16IYWscqQKBkr/yY25kPL1hmGHaSA==
X-Received: by 2002:a37:9c52:: with SMTP id f79mr867952qke.163.1573847111708; 
 Fri, 15 Nov 2019 11:45:11 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id y10sm4649679qkb.55.2019.11.15.11.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 11:45:10 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 15 Nov 2019 14:44:18 -0500
Message-Id: <1869a722c33ba47ab86c1acec399de3c2f3e58e3.1573840474.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1573840473.git.rosbrookn@ainfosec.com>
References: <cover.1573840473.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 11/22] golang/xenlight: re-factor Uuid type
 implementation
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

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KClJlLWRlZmluZSBV
dWlkIGFzIFsxNl1ieXRlIGFuZCBpbXBsZW1lbnQgZnJvbUMsIHRvQywgYW5kIFN0cmluZyBmdW5j
dGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25AYWluZm9zZWMu
Y29tPgotLS0KIHRvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbyB8IDM3ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5s
aWdodC5nbyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbwppbmRleCA2ZjBhOTI3
OGFkLi42N2MxYmIxMjI1IDEwMDY0NAotLS0gYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGln
aHQuZ28KKysrIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCkBAIC04Niw3ICs4
Niw0MCBAQCB0eXBlIERldmlkIGludAogCiB0eXBlIE1lbUtCIHVpbnQ2NAogCi10eXBlIFV1aWQg
Qy5saWJ4bF91dWlkCisvLyBVdWlkIGlzIGEgZG9tYWluIFVVSUQuCit0eXBlIFV1aWQgWzE2XWJ5
dGUKKworLy8gU3RyaW5nIGZvcm1hdHMgYSBVdWlkIGluIHRoZSBmb3JtICJ4eHh4LXh4LXh4LXh4
LXh4eHh4eCIuCitmdW5jICh1IFV1aWQpIFN0cmluZygpIHN0cmluZyB7CisJcyA6PSAiJXgleCV4
JXgtJXgleC0leCV4LSV4JXgtJXgleCV4JXgleCV4IgorCW9wdHMgOj0gbWFrZShbXWludGVyZmFj
ZXt9LCAxNikKKworCWZvciBpLCB2IDo9IHJhbmdlIHUgeworCQlvcHRzW2ldID0gdgorCX0KKwor
CXJldHVybiBmbXQuU3ByaW50ZihzLCBvcHRzLi4uKQorfQorCitmdW5jICh1ICpVdWlkKSBmcm9t
QyhjICpDLmxpYnhsX3V1aWQpIGVycm9yIHsKKwliIDo9ICgqWzE2XUMudWludDhfdCkodW5zYWZl
LlBvaW50ZXIoJmMudXVpZFswXSkpCisKKwlmb3IgaSwgdiA6PSByYW5nZSBiIHsKKwkJdVtpXSA9
IGJ5dGUodikKKwl9CisKKwlyZXR1cm4gbmlsCit9CisKK2Z1bmMgKHUgKlV1aWQpIHRvQygpIChD
LmxpYnhsX3V1aWQsIGVycm9yKSB7CisJdmFyIGMgQy5saWJ4bF91dWlkCisKKwlmb3IgaSwgdiA6
PSByYW5nZSB1IHsKKwkJYy51dWlkW2ldID0gQy51aW50OF90KHYpCisJfQorCisJcmV0dXJuIGMs
IG5pbAorfQogCiAvLyBkZWZib29sVmFsIHJlcHJlc2VudHMgYSBkZWZib29sIHZhbHVlLgogdHlw
ZSBkZWZib29sVmFsIGludApAQCAtNDk5LDcgKzUzMiw3IEBAIHR5cGUgRG9taW5mbyBzdHJ1Y3Qg
ewogZnVuYyAoY2RpICpDLmxpYnhsX2RvbWluZm8pIHRvR28oKSAoZGkgKkRvbWluZm8pIHsKIAog
CWRpID0gJkRvbWluZm97fQotCWRpLlV1aWQgPSBVdWlkKGNkaS51dWlkKQorCWRpLlV1aWQuZnJv
bUMoJmNkaS51dWlkKQogCWRpLkRvbWlkID0gRG9taWQoY2RpLmRvbWlkKQogCWRpLlNzaWRyZWYg
PSB1aW50MzIoY2RpLnNzaWRyZWYpCiAJZGkuU3NpZExhYmVsID0gQy5Hb1N0cmluZyhjZGkuc3Np
ZF9sYWJlbCkKLS0gCjIuMTkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=

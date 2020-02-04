Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A2F151ECB
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 17:58:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz1UD-0001ZP-CF; Tue, 04 Feb 2020 16:55:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VjgO=3Y=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iz1UC-0001ZI-3y
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 16:55:40 +0000
X-Inumbo-ID: 2bed0198-476f-11ea-b211-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2bed0198-476f-11ea-b211-bc764e2007e4;
 Tue, 04 Feb 2020 16:55:39 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a6so23950598wrx.12
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2020 08:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q6Fu6hJYGLP58TqAQdMSMUYI1G0FOQ8LhqTm9zEnrmw=;
 b=gxeWrfpdTVEA6+x4vPFgU+9JZp2DznjH/HV696FXCYIKVp/3YQxqu4ic/jNXEoSvL0
 UZKexqFhkhNHc9arWq27N+ZjKllbs7hjGL2jWo44tksTGMSU3029y18S87iLDI+oj2N6
 LTPig2xca71mizcqf2hID1thDA+KHfzwtqTEHjBOhYedVEeDUVGbB82KTnNoPiqwrzi0
 dJ33vF2+TuAr1HT3FQlh3wVXk7qYSn8nWQfioClV6U13xCgp7E6eE11+oMzng1vrB+lV
 m9Z/ZBjoFIHV7aS8Lq96dpH6aveF6aqsrL3CXWDy/i0LnCE9qjnABifyxjsGH4Uwfo6Q
 P3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=q6Fu6hJYGLP58TqAQdMSMUYI1G0FOQ8LhqTm9zEnrmw=;
 b=GFy8QSoLWS45G4000xxCW/JQutfzvpADxpWsdYg9P+SGKCQc6LzwieX23v0jmzLw5c
 Q9d5DlAq6ibBy/b2WH3ahDRXxZIyTEqqXHSpLhSaQkUx8G3UO5Ep47NnR0aTY9YWSu+1
 8rkMZ98U7HrDV6VlgcMZOrsxULeoHqumhf/upIFIH+fYFVCpl2N07U3sdM4WfVGsjpDf
 s+M4mK/CgQSKsdNd7lxZBui6/zF6Ff7AxOfB4h8Qdm3HnxvsX3ummxp9q9YECUXBV5Pq
 ssKAvTSsTk0OLtmJf8BE2XozSfhOQQX7+VfaQh1ZnBkNvGQS/nYVAt6DqFVu/m76igIG
 4/2A==
X-Gm-Message-State: APjAAAUcAwIgwJBr4oNaXV66gZvgXMhbDvEOPrJvAwWf7PAzzOFeCM69
 nZIzENaTVdPrIbNrqa86irUT6rpsYv0=
X-Google-Smtp-Source: APXvYqxft+9wGltIENf9EPmdHmmjTlekwN7cHl/+IKKj+FtSzQdRxFyyPca9XW7giUGqSg1zxroi2A==
X-Received: by 2002:adf:f8c8:: with SMTP id f8mr23257312wrq.331.1580835338769; 
 Tue, 04 Feb 2020 08:55:38 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 d204sm4454842wmd.30.2020.02.04.08.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 08:55:38 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Tue,  4 Feb 2020 16:55:35 +0000
Message-Id: <20200204165535.17214-1-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86: fix off-by-one error when printing memory
 ranges
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <liuwe@microsoft.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYvZTgyMC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2U4MjAuYyBiL3hlbi9hcmNoL3g4
Ni9lODIwLmMKaW5kZXggYjlmNTg5Y2FjMy4uZDY3Mzg3ZjEzNyAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L2U4MjAuYworKysgYi94ZW4vYXJjaC94ODYvZTgyMC5jCkBAIC05NCw3ICs5NCw3IEBA
IHN0YXRpYyB2b2lkIF9faW5pdCBwcmludF9lODIwX21lbW9yeV9tYXAoc3RydWN0IGU4MjBlbnRy
eSAqbWFwLCB1bnNpZ25lZCBpbnQgZW50CiAgICAgZm9yIChpID0gMDsgaSA8IGVudHJpZXM7IGkr
KykgewogICAgICAgICBwcmludGsoIiAlMDE2THggLSAlMDE2THggIiwKICAgICAgICAgICAgICAg
ICh1bnNpZ25lZCBsb25nIGxvbmcpKG1hcFtpXS5hZGRyKSwKLSAgICAgICAgICAgICAgICh1bnNp
Z25lZCBsb25nIGxvbmcpKG1hcFtpXS5hZGRyICsgbWFwW2ldLnNpemUpKTsKKyAgICAgICAgICAg
ICAgICh1bnNpZ25lZCBsb25nIGxvbmcpKG1hcFtpXS5hZGRyICsgbWFwW2ldLnNpemUpIC0gMSk7
CiAgICAgICAgIHN3aXRjaCAobWFwW2ldLnR5cGUpIHsKICAgICAgICAgY2FzZSBFODIwX1JBTToK
ICAgICAgICAgICAgIHByaW50aygiKHVzYWJsZSlcbiIpOwotLSAKMi4yMC4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

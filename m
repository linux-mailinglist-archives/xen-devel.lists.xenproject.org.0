Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BAF10E714
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2019 09:52:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ibhOg-00074O-P2; Mon, 02 Dec 2019 08:49:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NC7n=ZY=gmail.com=tiny.windzz@srs-us1.protection.inumbo.net>)
 id 1ibhOe-00074J-KW
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2019 08:49:32 +0000
X-Inumbo-ID: a8751726-14e0-11ea-83b8-bc764e2007e4
Received: from mail-pj1-x1044.google.com (unknown [2607:f8b0:4864:20::1044])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8751726-14e0-11ea-83b8-bc764e2007e4;
 Mon, 02 Dec 2019 08:49:32 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id l4so5244682pjt.5
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2019 00:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=GMSg2v6zLFSjc8T5UfEGGPwVLcJIxE1xhcy88AKUnio=;
 b=nvIEr8JNAKMmepLtO927sN9KYwoBmz0NhmpPoz9LfqVsFEXlweE30vAlCmla0/rDeM
 ogWzkXmcxqyUNWFCJ/ly44OF5Q7LNOO392Ll7a963VAAmbwj5l+H5O3K/eE20WkbyxBp
 wxIXaTQQKXurO0HLM5k+KMl87f15WptB7Sya434yTi1wBGPgsU5kQCcB7PqM85yqvtA/
 5mvZSrI1TDsXb1UbSyWm6PxYSB7E6Nvrr+BVFFiQqk0r4jNcUqM+WIRijAk7LpOrhK1Q
 u0LU/1B0WgLb9B+0hIvje7UXKWYkSX1Hm90yFjW8pWG8nN+p8ceN9F9pnfQqD3mGT8+W
 ovpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=GMSg2v6zLFSjc8T5UfEGGPwVLcJIxE1xhcy88AKUnio=;
 b=EzhLr2G75obiybjocmoeKKaQTirbh2wA7IzxUiz2YBExECMyA7qfMU1dPZ62ftgyDd
 pTgbF6RIsJzUbyjonvyoTEKolI3YrFIuFcyU2XGcWDpsdS1O0kS/1SjUgNaUxBE5tGWI
 z5rLte/RQniPgXCtDrjNzkbv0yfp+QpiBov36F8GlTmRUqGrLYn5YZYreQRXMR2r+kCd
 TPBHGO0Jns/7rxFrUsffEKFAE8rQrEEVjpwJXchAO16b07sxzv6CE+PVHH8MUR0zWot9
 aoiH+pVmGDpNPqEtJL4M60YPmyaZ6YnJUVRBp1snC9D9QzWdO3+smqmA1nYCU2Vhs94J
 ujVw==
X-Gm-Message-State: APjAAAVNPvoqnYyVxoif1VyuyIoR5IUxVaGlevcRH0XuiZHSOBtRLZUE
 7LDzasTbmidJmtUXfB0dxVQ=
X-Google-Smtp-Source: APXvYqwTvetmassvQ9L8m/L614InPs7524qE3PJ4mSJBOZGQhXHfkqLJIZJJ9gqVUye1GmG4aip9VA==
X-Received: by 2002:a17:902:bb8c:: with SMTP id
 m12mr3578363pls.320.1575276571493; 
 Mon, 02 Dec 2019 00:49:31 -0800 (PST)
Received: from localhost ([202.182.106.211])
 by smtp.gmail.com with ESMTPSA id t8sm22570239pjr.25.2019.12.02.00.49.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Dec 2019 00:49:31 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com
Date: Mon,  2 Dec 2019 08:49:24 +0000
Message-Id: <20191202084924.29893-1-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] xen/arm: Basic support for sunxi/sun50i h6
 platform.
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
Cc: Yangtao Li <tiny.windzz@gmail.com>, xen-devel@lists.xenproject.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

YWRkaW5nIGNvbXBhdGlibGUgc3RyaW5ncyBmb3IgaDYgU29DcywgU3BlY2lmaWNhbGx5IG9yYW5n
ZXBpMy4KClNpZ25lZC1vZmYtYnk6IFlhbmd0YW8gTGkgPHRpbnkud2luZHp6QGdtYWlsLmNvbT4K
LS0tCiB4ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL3N1bnhpLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvc3Vu
eGkuYyBiL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvc3VueGkuYwppbmRleCA1NTcwNWIxNWIyLi5l
OGU0ZDg4YmVmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL3N1bnhpLmMKKysr
IGIveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9zdW54aS5jCkBAIC0xMTksNiArMTE5LDcgQEAgc3Rh
dGljIGNvbnN0IGNoYXIgKiBjb25zdCBzdW54aV92OF9kdF9jb21wYXRbXSBfX2luaXRjb25zdCA9
CiB7CiAgICAgImFsbHdpbm5lcixzdW41MGktYTY0IiwKICAgICAiYWxsd2lubmVyLHN1bjUwaS1o
NSIsCisgICAgImFsbHdpbm5lcixzdW41MGktaDYiLAogICAgIE5VTEwKIH07CiAKLS0gCjIuMTcu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

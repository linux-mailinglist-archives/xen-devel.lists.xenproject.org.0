Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A0FC23D7
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 17:03:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iExAl-00069A-HZ; Mon, 30 Sep 2019 15:01:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=m4o0=XZ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iExAk-00068o-9V
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 15:01:10 +0000
X-Inumbo-ID: 186031bc-e393-11e9-8628-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by localhost (Halon) with ESMTPS
 id 186031bc-e393-11e9-8628-bc764e2007e4;
 Mon, 30 Sep 2019 15:00:52 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id y21so13131115wmi.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2019 08:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uREt8Z5nJzR7OIiuZjnYzLQFQ7JxWM6N+fEC7IgLHk0=;
 b=tttOOIaA8l32h8h53UtQE8kxKmCmVsqtvbR7S83xuyshl+ELlQA5u0j1Y14ngSjKl4
 RSAY7FbLr987OhmNs9GiDs0RMW2ttUszHpGOWEBFmNI66xODzzQboa6m5HWPMu/O78ua
 HqjAANalJYxWj89MbKqdF3sj/gO9qyv0fL7KJLWQMuB8xtDonvisDgQQ3xB28dAm7/bf
 +rwiOmlPPB66A3eoeBDOSLyvaU2Tf4gbEJaNFRjjatbislagd+bEeLBMcX+1B0/BWx0j
 NG436K47ts2lY8RQc2Erzsnez+m3kYlGtyXsvJIPWHJtvmmjkC/SOXiQSW5xyeFSJcCR
 QN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uREt8Z5nJzR7OIiuZjnYzLQFQ7JxWM6N+fEC7IgLHk0=;
 b=V34GrZ4QH0DlglFonQfR2Le4Xxqw65Ka79/SGYIXAjpsX4dAf8jnVPckvnR+vKQQj9
 LgFzKWRP6hR+OupJua84AWqVnK29s0sanoOGaCsy4L5kcbkqOFT/HmsHnc5Gcc78rU3P
 hswl9Dbx7A9A+018Qxbe4xNUu+la8CvRIeGR9XX7AqD2TUTdC6kKXyZsr7PmImnCoc6K
 Yfp3yg/PJ8EXz5Y5L5CIANCwA95kS0uQDfuVX2oGJrXe+u/O+dM4VF3pjTLF6TNh+RxT
 6Q+wFdbC7rvfisnfPfTnA/ilH7Qn8u4Cz7oa9X4BQsUWLpwdf+naJ2RUgePPKyYECO/8
 t9qg==
X-Gm-Message-State: APjAAAXkj5zVBxTlL2XvdnwbWYL80Am+Z6WQ9xODXpGyL4VTivoX/rBa
 YYnzP9vXu6gm0nSE0MEwLhGbS3eYjqs=
X-Google-Smtp-Source: APXvYqyiW5bip7TIiPgZOaJKzQMeaGJP70CI/jnP85VTJyCHEDVTfuIRllPaACUhoZh1tvfJiTq/kg==
X-Received: by 2002:a1c:1981:: with SMTP id 123mr17182414wmz.88.1569855651629; 
 Mon, 30 Sep 2019 08:00:51 -0700 (PDT)
Received: from debian.mshome.net (207.148.159.143.dyn.plus.net.
 [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id f143sm32870852wme.40.2019.09.30.08.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2019 08:00:51 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 16:00:38 +0100
Message-Id: <20190930150044.5734-5-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190930150044.5734-1-liuwe@microsoft.com>
References: <20190930150044.5734-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next v2 4/9] x86: include xen/lib.h in
 guest/hypercall.h
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgbmVlZCBBU1NFUlRfVU5SRUFDSEFCTEUuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3
ZUBtaWNyb3NvZnQuY29tPgotLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJjYWxs
LmggfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcmNhbGwuaCBiL3hlbi9pbmNsdWRlL2FzbS14
ODYvZ3Vlc3QvaHlwZXJjYWxsLmgKaW5kZXggYzlkZWNhNmZmYy4uZDBkMmY1MDIyZCAxMDA2NDQK
LS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcmNhbGwuaAorKysgYi94ZW4vaW5j
bHVkZS9hc20teDg2L2d1ZXN0L2h5cGVyY2FsbC5oCkBAIC0xODIsNiArMTgyLDggQEAgc3RhdGlj
IGlubGluZSBsb25nIHhlbl9oeXBlcmNhbGxfc2V0X2V2dGNobl91cGNhbGxfdmVjdG9yKAogCiAj
ZWxzZSAvKiBDT05GSUdfWEVOX0dVRVNUICovCiAKKyNpbmNsdWRlIDx4ZW4vbGliLmg+CisKICNp
bmNsdWRlIDxwdWJsaWMvc2NoZWQuaD4KIAogc3RhdGljIGlubGluZSB2b2lkIHhlbl9oeXBlcmNh
bGxfY29uc29sZV93cml0ZSgKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=

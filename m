Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 079B914D1E0
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 21:23:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwtpN-0006UG-J2; Wed, 29 Jan 2020 20:20:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bu37=3S=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iwtpL-0006U8-VA
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 20:20:43 +0000
X-Inumbo-ID: d0c7aa5a-42d4-11ea-b211-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0c7aa5a-42d4-11ea-b211-bc764e2007e4;
 Wed, 29 Jan 2020 20:20:39 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g17so1091942wro.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 12:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LQqzUPBymPorZGjCWxaYwWR7iFi3Kgmiz5j6a+T8YdM=;
 b=UZSq7IgaKYltE9vVjojgpW7GA13ZN2VQAat27xCcG0QBbryzFKZDuWctHzjbeR86bo
 QDJKJJaWXfDdDgnjFmFpAsbcxORNpb9LcayDBnnPomIbT3u4ds9QTZ5fb00RI6TwkMQB
 4x+h4YNPOgZfDOzN+mG8EQKthnKHfz5G+2/my54EB4L7s5KuXCS1Ve/le6dGuRfAb5cK
 4Qs0+riIJ74kueUHMzgc/3HZFHK18nYrhNPo9InLldamkXDJFVJHR3w0EQtSBA7aWnc8
 JFd/llQC5s4nTTo+wkocKOtANzyqjzK06jn+B8uMt04frFCx/JA91P0DdE53TJcu81h0
 fm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LQqzUPBymPorZGjCWxaYwWR7iFi3Kgmiz5j6a+T8YdM=;
 b=kWTDfno9iTS2jxcRKmEvmujRrJ6Xa61FQkEnVn6pksTnIjiigRUxLtBAJBXmDnlX7z
 JVHMtPeMZ1KbN0bZsIdSn3gB9qDqZKCSVmStQowrxGhqr65RzDEzwWm/vLL8Pq0YJa3U
 aZp+4PRPWLhWOknnKymrtAi4nkC5ZQ1qHrHdlzGxkvJx+B54i7wvn+clDrBCVg0PTRUD
 ZqzN6v3B45GtQaITog3A1cZPdz0/corrU0dsNEVW1PJrCUeGzO36e2yTyVrSjpVe/Do2
 7s+fHoedRNzPc73A+IT+ZcJt2MLsKMqaMucDon0lnDqLjRM/4kIEswC8n0zNHErmpAU3
 8OWg==
X-Gm-Message-State: APjAAAXubKXX0BkGp5E8a7Nd8fFQ2E6SXbIikZu/cXy99cnol6w6DnYb
 EJrya11k+qESptjOlCKScINrcpKeSW4=
X-Google-Smtp-Source: APXvYqxnPnxwc/4ocQUAKsqSIim0R/fgW7k64kymFIDEYUSkbjNvZMPrsKfkikXlCvfutejrK4xSXA==
X-Received: by 2002:adf:eb8e:: with SMTP id t14mr605541wrn.384.1580329238558; 
 Wed, 29 Jan 2020 12:20:38 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 a22sm3564115wmd.20.2020.01.29.12.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 12:20:38 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Wed, 29 Jan 2020 20:20:23 +0000
Message-Id: <20200129202034.15052-2-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129202034.15052-1-liuwe@microsoft.com>
References: <20200129202034.15052-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 01/12] MAINTAINERS: put Hyper-V code under
 Viridian maintainership
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <liuwe@microsoft.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kIGFkZCBteXNlbGYgYXMgYSBtYWludGFpbmVyLgoKU29ydCB0aGUgbGlzdCBhbHBoYWJldGlj
YWxseSB3aGlsZSBhdCBpdC4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29m
dC5jb20+ClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Ci0tLQogTUFJTlRBSU5F
UlMgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCAxOTE1ZTA5
ZjhiLi4wNGQ5MTQ4MmNkIDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVS
UwpAQCAtNTE0LDEwICs1MTQsMTMgQEAgRjoJeGVuL2FyY2gveDg2L21tL3NoYWRvdy8KIAogWDg2
IFZJUklESUFOIEVOTElHSFRFTk1FTlRTCiBNOglQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpv
bi5jb20+CitNOglXZWkgTGl1IDx3bEB4ZW4ub3JnPgogUzoJU3VwcG9ydGVkCitGOgl4ZW4vYXJj
aC94ODYvZ3Vlc3QvaHlwZXJ2LwogRjoJeGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi8KLUY6CXhl
bi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZpcmlkaWFuLmgKK0Y6CXhlbi9pbmNsdWRlL2FzbS14ODYv
Z3Vlc3QvaHlwZXJ2LmgKIEY6CXhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LXRsZnMu
aAorRjoJeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdmlyaWRpYW4uaAogCiBYRU5UUkFDRQogTToJ
R2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBldS5jaXRyaXguY29tPgotLSAKMi4yMC4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

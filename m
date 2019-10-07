Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2763ECE719
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 17:16:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHUhO-0006hK-Ok; Mon, 07 Oct 2019 15:13:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0SFq=YA=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iHUhN-0006hE-NS
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 15:13:21 +0000
X-Inumbo-ID: fd7efd42-e914-11e9-80e3-bc764e2007e4
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd7efd42-e914-11e9-80e3-bc764e2007e4;
 Mon, 07 Oct 2019 15:13:17 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id r5so19711869qtd.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2019 08:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PPC0S7sPiHZ9eZt4eeH4dqS3WzPg9DdSZ+5hxQ5L6qo=;
 b=gw5i2YiGVNAsgJ+7sgG1/PnIL5Ksl921fiHywV95JKlXut6SXzK1s3YrtYAE6gVvgW
 R+gEhjec4MOPtDN85AV+O/qHRsEfBKJPQYV9yLVNyJQaRBmh4BZH5KncWyFxi2ubAqa7
 +SFm2uQVjyUEyQd8Nv12xiYxkNcogRNdyMWy0b+pvWC8YNO3iB8nq9Ezrb0hht2ZUHfL
 tvfTazjjag+mJXAtQw5s8EXqLV29xiz5qPfpoWA/VAkeEgYXREgFc6A2d5KziJYrFnr2
 DjW0vGzo+UmktUGnGTlnk6bWf4eRv6ohnM0XnzhKrq7+BnJSuRrBNoFtUKkzUV2s8Rl9
 ebPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PPC0S7sPiHZ9eZt4eeH4dqS3WzPg9DdSZ+5hxQ5L6qo=;
 b=VHzCo6BFa2LJyBUMb6g5PIT8+ItcwDaulYAilitni18Rp5eG5i/Hii7VSq2UxXvOjr
 C6+Vz6EYOSc8lWCNGRFckg1tDF4/yuzufQVZDI3ItjcBEgQzILWrel2r7vZjPI78axLl
 DKKlzSl3yKurBQaS9QgLAK7yaFBS7TZ3Pfe+WIMlhCeJZ5PGcsHY2Jlray8Qrxp2LhNw
 4KH6iCWOWhe1IqvDX9S+F3G4wvHXju1fEZGhr0Zgidn0jgw6Eq0ILAPORLUUJcYQ8HQx
 rF6sKNzhctMKmIaS0tYXwzrJEfx5a5boX5lSmzb1sJoQ031MgXbQHpjD8CeYYUR2/wzO
 tSMQ==
X-Gm-Message-State: APjAAAU5WUAoQ5M8+CUHbwn/rsypONCDtA6IEwAc91zn0xOC3xCf87nv
 aD9YHQRGyyWoqz8eahoZdY43XEZQ
X-Google-Smtp-Source: APXvYqyB0iq5l5KC7Ac+YCZ85JvmAsh3/gJ3776MI0mgRoRNJWDJfbxulVUJOanxJ0vwJnu/EsE69Q==
X-Received: by 2002:ac8:198b:: with SMTP id u11mr30267909qtj.108.1570461196581; 
 Mon, 07 Oct 2019 08:13:16 -0700 (PDT)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id c185sm8354313qkg.74.2019.10.07.08.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 08:13:16 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  7 Oct 2019 11:12:48 -0400
Message-Id: <5c509297c01b8931986b1d039de1c72e89e44037.1570456846.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1570456846.git.rosbrookn@ainfosec.com>
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 01/24] golang/xenlight: fix calls to
 libxl_domain_unpause/pause
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

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KClRoZXNlIGZ1bmN0
aW9ucyByZXF1aXJlIGEgdGhpcmQgYXJndW1lbnQgb2YgdHlwZSBjb25zdCAqbGlieGxfYXN5bmNv
cF9ob3cuCgpQYXNzIG5pbCB0byBmaXggY29tcGlsYXRpb24gZXJyb3JzLiBUaGlzIHdpbGwgaGF2
ZSB0aGUgZWZmZWN0IG9mCnBlcmZvcm1pbmcgdGhlc2Ugb3BlcmF0aW9ucyBzeW5jaHJvbm91c2x5
LgoKU2lnbmVkLW9mZi1ieTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4K
LS0tCkNjOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CkNjOiBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5v
cmc+CgogdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvIHwgNCArKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rv
b2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94
ZW5saWdodC5nbwppbmRleCBmNWQxNzFjMmQ1Li41OWI4MTg2YTY0IDEwMDY0NAotLS0gYS90b29s
cy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KKysrIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0
L3hlbmxpZ2h0LmdvCkBAIC0xMDExLDcgKzEwMTEsNyBAQCBmdW5jIChDdHggKkNvbnRleHQpIERv
bWFpblVucGF1c2UoSWQgRG9taWQpIChlcnIgZXJyb3IpIHsKIAkJcmV0dXJuCiAJfQogCi0JcmV0
IDo9IEMubGlieGxfZG9tYWluX3VucGF1c2UoQ3R4LmN0eCwgQy51aW50MzJfdChJZCkpCisJcmV0
IDo9IEMubGlieGxfZG9tYWluX3VucGF1c2UoQ3R4LmN0eCwgQy51aW50MzJfdChJZCksIG5pbCkK
IAogCWlmIHJldCAhPSAwIHsKIAkJZXJyID0gRXJyb3IoLXJldCkKQEAgLTEwMjYsNyArMTAyNiw3
IEBAIGZ1bmMgKEN0eCAqQ29udGV4dCkgRG9tYWluUGF1c2UoaWQgRG9taWQpIChlcnIgZXJyb3Ip
IHsKIAkJcmV0dXJuCiAJfQogCi0JcmV0IDo9IEMubGlieGxfZG9tYWluX3BhdXNlKEN0eC5jdHgs
IEMudWludDMyX3QoaWQpKQorCXJldCA6PSBDLmxpYnhsX2RvbWFpbl9wYXVzZShDdHguY3R4LCBD
LnVpbnQzMl90KGlkKSwgbmlsKQogCiAJaWYgcmV0ICE9IDAgewogCQllcnIgPSBFcnJvcigtcmV0
KQotLSAKMi4xOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==

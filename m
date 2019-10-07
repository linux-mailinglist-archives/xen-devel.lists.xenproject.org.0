Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52476CE71C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 17:16:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHUiJ-00078o-0T; Mon, 07 Oct 2019 15:14:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0SFq=YA=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iHUiG-00077R-OK
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 15:14:16 +0000
X-Inumbo-ID: 05370412-e915-11e9-80e3-bc764e2007e4
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05370412-e915-11e9-80e3-bc764e2007e4;
 Mon, 07 Oct 2019 15:13:30 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id 3so19678434qta.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2019 08:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4SAiZoZ3TDuKHeorxNwWTkai7aNXrNdRhe1wN1UxU/4=;
 b=eaQXZAFjIZIDM3XO2x2Y4+glwNvk8TwoZEKBTSqBO9hIZ/+6gII+IL5rnI6kAkTiSI
 hSY0Kc9NAp/01CzQ/NDDrn4pqZvcJvgNwet7Y5BwjPbmteL0usWmetDlkG9shXmMUTSR
 EhWwu8btnvUalJ565CDT8kWsQzl+/q2tEFAq5qkhf7RQiBvd/3d7YrCwPfymr7cbUR5F
 4mhsm4CikZx/NljVbvKQ3MzypxYD6M4w/VhfPcf0Tjzw9GdKV049NlC1lriAcpzbPeFr
 qXWRzLBuHKVQEro0g/4dJ1QALQ6XOWdf5Awbp2uKv5xbBzRBHQbBzn6L9vhyM1h6gWvF
 KlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4SAiZoZ3TDuKHeorxNwWTkai7aNXrNdRhe1wN1UxU/4=;
 b=crM5cebQk/obiJlx40troY6bHGp4Ca+E3j5yzecczewZ5SONA3bukYE0Y3CGUE6XTc
 mh19nbjLKzBUGR/ysd8pvVtHrurGbopZFSLvXCG+ocADy9fmwxI2tkBrWILXtasEfhci
 aYS6Xq7Hi54GAjZ0wbHnUajIlXC91G14XMD8ryBuQ/LVp+89EDFUVoevUFR2uyIpSGEh
 4b2VVSmbqc7+l12VekGA7Xk+1OJT2spueFGwp2wW370TM/7/qi4kbc4o9afVCpj/BWBa
 N6GGDb2EFqKA5voJW8yex7AZUGhnVG/H6L4BYcky14z0AHqsgg53GZck01qSgFjI0FA7
 rg6A==
X-Gm-Message-State: APjAAAUU/mQRyQGDUR8+qBsvY0tPxUKb44WzmReVSYA5Kih8sIMoNz5K
 H+6I8UAU/e8/yOcKRKDnT7FIm2Bg
X-Google-Smtp-Source: APXvYqyn0FSlaoAW3TtcuIzFioCAv4ncqlFrmwu4axCIKbTNLhXsIIbiyX8VSMePyzLHH5p3VQbZrA==
X-Received: by 2002:aed:3fe9:: with SMTP id w38mr30506897qth.180.1570461209709; 
 Mon, 07 Oct 2019 08:13:29 -0700 (PDT)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id c185sm8354313qkg.74.2019.10.07.08.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 08:13:29 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  7 Oct 2019 11:12:59 -0400
Message-Id: <03324a8aca83d6006977e8d6752e0a5f5250f081.1570456846.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1570456846.git.rosbrookn@ainfosec.com>
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 12/24] golang/xenlight: re-factor Uuid type
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
Y29tPgotLS0KQ2M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KQ2M6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2xA
eGVuLm9yZz4KCiB0b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28gfCAzNyArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9nb2xhbmcveGVubGlnaHQveGVu
bGlnaHQuZ28gYi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KaW5kZXggOWMzODQ0
ODVlMS4uM2UzNzUzZjkyZSAxMDA2NDQKLS0tIGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxp
Z2h0LmdvCisrKyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbwpAQCAtODYsNyAr
ODYsNDAgQEAgdHlwZSBEZXZpZCBpbnQKIAogdHlwZSBNZW1LQiB1aW50NjQKIAotdHlwZSBVdWlk
IEMubGlieGxfdXVpZAorLy8gVXVpZCBpcyBhIGRvbWFpbiBVVUlELgordHlwZSBVdWlkIFsxNl1i
eXRlCisKKy8vIFN0cmluZyBmb3JtYXRzIGEgVXVpZCBpbiB0aGUgZm9ybSAieHh4eC14eC14eC14
eC14eHh4eHgiLgorZnVuYyAodSBVdWlkKSBTdHJpbmcoKSBzdHJpbmcgeworCXMgOj0gIiV4JXgl
eCV4LSV4JXgtJXgleC0leCV4LSV4JXgleCV4JXgleCIKKwlvcHRzIDo9IG1ha2UoW11pbnRlcmZh
Y2V7fSwgMTYpCisKKwlmb3IgaSwgdiA6PSByYW5nZSB1IHsKKwkJb3B0c1tpXSA9IHYKKwl9CisK
KwlyZXR1cm4gZm10LlNwcmludGYocywgb3B0cy4uLikKK30KKworZnVuYyAodSAqVXVpZCkgZnJv
bUMoYyAqQy5saWJ4bF91dWlkKSBlcnJvciB7CisJYiA6PSAoKlsxNl1DLnVpbnQ4X3QpKHVuc2Fm
ZS5Qb2ludGVyKCZjLnV1aWRbMF0pKQorCisJZm9yIGksIHYgOj0gcmFuZ2UgYiB7CisJCXVbaV0g
PSBieXRlKHYpCisJfQorCisJcmV0dXJuIG5pbAorfQorCitmdW5jICh1ICpVdWlkKSB0b0MoKSAo
Qy5saWJ4bF91dWlkLCBlcnJvcikgeworCXZhciBjIEMubGlieGxfdXVpZAorCisJZm9yIGksIHYg
Oj0gcmFuZ2UgdSB7CisJCWMudXVpZFtpXSA9IEMudWludDhfdCh2KQorCX0KKworCXJldHVybiBj
LCBuaWwKK30KIAogLy8gZGVmYm9vbFZhbCByZXByZXNlbnRzIGEgZGVmYm9vbCB2YWx1ZS4KIHR5
cGUgZGVmYm9vbFZhbCBpbnQKQEAgLTUxNiw3ICs1NDksNyBAQCB0eXBlIERvbWluZm8gc3RydWN0
IHsKIGZ1bmMgKGNkaSAqQy5saWJ4bF9kb21pbmZvKSB0b0dvKCkgKGRpICpEb21pbmZvKSB7CiAK
IAlkaSA9ICZEb21pbmZve30KLQlkaS5VdWlkID0gVXVpZChjZGkudXVpZCkKKwlkaS5VdWlkLmZy
b21DKCZjZGkudXVpZCkKIAlkaS5Eb21pZCA9IERvbWlkKGNkaS5kb21pZCkKIAlkaS5Tc2lkcmVm
ID0gdWludDMyKGNkaS5zc2lkcmVmKQogCWRpLlNzaWRMYWJlbCA9IEMuR29TdHJpbmcoY2RpLnNz
aWRfbGFiZWwpCi0tIAoyLjE5LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs

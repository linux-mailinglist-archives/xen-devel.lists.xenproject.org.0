Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77403CE71F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 17:17:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHUht-0006sX-1D; Mon, 07 Oct 2019 15:13:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0SFq=YA=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iHUhr-0006s4-NT
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 15:13:51 +0000
X-Inumbo-ID: 01a48838-e915-11e9-96dc-bc764e2007e4
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01a48838-e915-11e9-96dc-bc764e2007e4;
 Mon, 07 Oct 2019 15:13:24 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id i26so2647377qtm.8
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2019 08:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x6JGuVoR7EXpvX1Eyn2HjZht2i/5NyzftbPM9QkorXQ=;
 b=pxr13ILiir8WEMJ4gFxv70t61cLWLhJie4SDBlSrMhJKoi100fA8WW3P4VDVTDoHVg
 BA8CaQENFFWnNf7gw8V1LciQ5ZoXT2vKJR8L66MGWLx1//dRSWYVCDCDBv0KSj+Zp0H7
 06aofXOaUFFDrHG1cKqc/4Bomr6CcgW35je4v7MwnCxWDfQr1wE23APpRj+c33dyDR4C
 3eP5/rPgJ5lC0EhZiB1Iq6gZrqSfY5W5ZfWJT11gkSK4Zb//wXQJ0bcO9kBFmbq5vCVj
 hJQd9vsW6flfHvsteGSJcu56tjMCuL2m36Eg3NeDPQqWchavc6PMDnxzoPvhlBmpUsWI
 /1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x6JGuVoR7EXpvX1Eyn2HjZht2i/5NyzftbPM9QkorXQ=;
 b=cbT+BL2SK7ZWuYBxV9d4mUpWZAkW7PFdmOoy0gZ1PaJM1ozPP8x4ahOF8a32FJoNS4
 vhr++EtmUfRzM1SXIvmGrSowlzURAjrtNZPUEbWf7I3jbpSC0dkZ8yF+dzsf9P7VC/3G
 LMF5Uazj3YCkO8kN5aM+9m8RklSDJYAA01POHWBdi/UHcgSit4NHK5NIz3eaCwUkH/x4
 IjeR4TcVhXqQmeHnTMCtN7RJvl/G87zmlYw/dWCxPaKgkOTKBTcb+0h+R8si1Odq8413
 AeUHywCvQvg+uNqZV5yR1+SlQdFmpSg3yo954/Y357pk55W0vqhfu1I5sD+FbSyQCCU0
 izoQ==
X-Gm-Message-State: APjAAAV6i4gX9CgA5fvevSVHXGGK+yb+eDp+DVIXvabt3SG61VP4i/Qj
 jYzvCrQ3pGbV0xbp9XGgvyfm8ivX
X-Google-Smtp-Source: APXvYqzt8npUM/Zb/KWEetdN45k+WfbIfHqr19m2vq9VclNfNJXfc1DGyDZIKlbBVeZgBP08fZ2iUA==
X-Received: by 2002:ac8:5046:: with SMTP id h6mr30894932qtm.13.1570461203690; 
 Mon, 07 Oct 2019 08:13:23 -0700 (PDT)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id c185sm8354313qkg.74.2019.10.07.08.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 08:13:23 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  7 Oct 2019 11:12:54 -0400
Message-Id: <1644cc12566ebdbcaddde8994a65dde029d0226a.1570456846.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1570456846.git.rosbrookn@ainfosec.com>
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 07/24] golang/xenlight: define StringList
 builtin type
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

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KCkRlZmluZSBTdHJp
bmdMaXN0IGFzIFtdc3RyaW5nIGFuIGltcGxlbWVudCBmcm9tQyBhbmQgdG9DIGZ1bmN0aW9ucy4K
ClNpZ25lZC1vZmYtYnk6IE5pY2sgUm9zYnJvb2sgPHJvc2Jyb29rbkBhaW5mb3NlYy5jb20+Ci0t
LQpDYzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgpDYzogSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3Jn
PgoKIHRvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbyB8IDI5ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbyBiL3Rvb2xzL2dvbGFuZy94
ZW5saWdodC94ZW5saWdodC5nbwppbmRleCAwOWZjZGNhNWQxLi5hM2ExODM2ZDMxIDEwMDY0NAot
LS0gYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KKysrIGIvdG9vbHMvZ29sYW5n
L3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCkBAIC0yMzQsNiArMjM0LDM1IEBAIGZ1bmMgKGt2bCBLZXlW
YWx1ZUxpc3QpIHRvQygpIChDLmxpYnhsX2tleV92YWx1ZV9saXN0LCBlcnJvcikgewogCXJldHVy
biBja3ZsLCBuaWwKIH0KIAorLy8gU3RyaW5nTGlzdCByZXByZXNlbnRzIGEgbGlieGxfc3RyaW5n
X2xpc3QuCit0eXBlIFN0cmluZ0xpc3QgW11zdHJpbmcKKworZnVuYyAoc2wgU3RyaW5nTGlzdCkg
ZnJvbUMoY3NsICpDLmxpYnhsX3N0cmluZ19saXN0KSBlcnJvciB7CisJc2l6ZSA6PSBpbnQoQy5s
aWJ4bF9zdHJpbmdfbGlzdF9sZW5ndGgoY3NsKSkKKwlsaXN0IDo9ICgqWzEgPDwgMzBdKkMuY2hh
cikodW5zYWZlLlBvaW50ZXIoY3NsKSlbOnNpemU6c2l6ZV0KKworCXNsID0gbWFrZShbXXN0cmlu
Zywgc2l6ZSkKKworCWZvciBpLCB2IDo9IHJhbmdlIGxpc3QgeworCQlzbFtpXSA9IEMuR29TdHJp
bmcodikKKwl9CisKKwlyZXR1cm4gbmlsCit9CisKK2Z1bmMgKHNsIFN0cmluZ0xpc3QpIHRvQygp
IChDLmxpYnhsX3N0cmluZ19saXN0LCBlcnJvcikgeworCXZhciBjaGFyICpDLmNoYXIKKwlzaXpl
IDo9IGxlbihzbCkKKwljc2wgOj0gKEMubGlieGxfc3RyaW5nX2xpc3QpKEMubWFsbG9jKEMudWxv
bmcoc2l6ZSkgKiBDLnVsb25nKHVuc2FmZS5TaXplb2YoY2hhcikpKSkKKwljbGlzdCA6PSAoKlsx
IDw8IDMwXSpDLmNoYXIpKHVuc2FmZS5Qb2ludGVyKGNzbCkpWzpzaXplOnNpemVdCisKKwlmb3Ig
aSwgdiA6PSByYW5nZSBzbCB7CisJCWNsaXN0W2ldID0gQy5DU3RyaW5nKHYpCisJfQorCisJcmV0
dXJuIGNzbCwgbmlsCit9CisKIC8vIEJpdG1hcCByZXByZXNlbnRzIGEgbGlieGxfYml0bWFwLgog
Ly8KIC8vIEltcGxlbWVudCB0aGUgR28gYml0bWFwIHR5cGUgc3VjaCB0aGF0IHRoZSB1bmRlcmx5
aW5nIGRhdGEgY2FuCi0tIAoyLjE5LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs

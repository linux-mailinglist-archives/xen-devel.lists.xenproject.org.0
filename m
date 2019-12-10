Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 507C6118D00
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 16:50:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iehkM-00032A-5u; Tue, 10 Dec 2019 15:48:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A1/D=2A=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iehkK-00031j-S6
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 15:48:20 +0000
X-Inumbo-ID: 6fe772f2-1b64-11ea-a1e1-bc764e2007e4
Received: from mail-qv1-xf42.google.com (unknown [2607:f8b0:4864:20::f42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6fe772f2-1b64-11ea-a1e1-bc764e2007e4;
 Tue, 10 Dec 2019 15:47:57 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id o18so4362170qvf.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2019 07:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LI98nKVqVPVJ264Gwu280nugbkHUVeryCxnErgot7XQ=;
 b=TtKXJkMEp5aXVuwJn+B49mebLdzJu/zKFtdZYdLXQbgcsk/jiQnURaVor81rxqVTb9
 KPwZIlXHa/ofY31DqPMkwuDfGYfrvuNfFJlgKw07FbpJNjz0Xhmf1WBWgy7btudsqac1
 oYgMuDOg2JJFjgA8Lb7fwJwoVpLVnYMDa/UQXa+ohE7WIxVxLgvkBUiIvYEuGUYx/u/e
 HwdgGZYqRqRwQqhwrjChMaskUDRYeNpfAW39fbtMmyTnrbluCHSMlKqE5/pcxR3lD9Xi
 pVfAmf0jWgMZzW69Lnfu38yFLOQzhC0TLMAxG8K4n5bae0Sg3qRdcsLXqEd4vyZ40oV2
 I+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LI98nKVqVPVJ264Gwu280nugbkHUVeryCxnErgot7XQ=;
 b=JLYdbo7TdI01tqpZG2XCcbUEBCmu+MHCyirbcAUS0KQrlxxpPmsgFtZh9MUbmAPnhI
 Fy9Y/7qkSf/gmeDo1PtB4NDTDxshi5jdZh/xac9ktYOl78fUFjIM13YVz3+yhnUGjmdX
 hvW2JPtG5MX4N1Mrip1i5jqsjG5d/w9+TKZVRxwU321RrVhc5OlpmvgaeQymg6tyIJv3
 9HYaY65ckxi7R/G/Qp2GbzNeVcKpXmYyE3YwTRy71K7qklUrCGRrTTPmVVD4rPI0qhq3
 W9BXnVWLeartTFoLfXAezOxQ7C5sfOGbLAx7OnqTm3ClyOd/om1YB7H2VIx0WKbgWYMi
 ToQw==
X-Gm-Message-State: APjAAAWKfwZSpIta/ompBDBbOHNL688Wk0sK6kOjR/p3WwUf6PcVCmF3
 t02sBu901vJKy0Pv/eP3jP+D7t/M
X-Google-Smtp-Source: APXvYqyhKJwJ4aID2FLPRTM2Ag3jog5KMtO1TPYhCBceOCItIr7Mm6ee7fu+x7PJuTQT04WGE/Muew==
X-Received: by 2002:ad4:436d:: with SMTP id u13mr10048515qvt.171.1575992876969; 
 Tue, 10 Dec 2019 07:47:56 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id m29sm1247848qtf.1.2019.12.10.07.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 07:47:56 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 10 Dec 2019 10:47:21 -0500
Message-Id: <68236a9fc20a48988703da4eb0ab19821b59d271.1575990937.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1575990937.git.rosbrookn@ainfosec.com>
References: <cover.1575990937.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 06/22] golang/xenlight: define StringList
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
ClNpZ25lZC1vZmYtYnk6IE5pY2sgUm9zYnJvb2sgPHJvc2Jyb29rbkBhaW5mb3NlYy5jb20+ClJl
dmlld2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ci0tLQpD
aGFuZ2VzIGluIHYyOgotIERlZmluZSBmcm9tQyB3aXRoIGEgcG9pbnRlciByZWNlaXZlciBzaW5j
ZSBhIG5ld2x5LWFsbG9jYXRlZCBzbGljZQogIGlzIGJlaW5nIGFzc2lnbmVkIHRvIHRoZSBTdHJp
bmdMaXN0LgotLS0KIHRvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbyB8IDI5ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbyBiL3Rvb2xz
L2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbwppbmRleCAxYzVlM2MwY2M3Li43MmFmYzNjZjE0
IDEwMDY0NAotLS0gYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KKysrIGIvdG9v
bHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCkBAIC0yMTIsNiArMjEyLDM1IEBAIHR5cGUg
S2V5VmFsdWVMaXN0IHN0cnVjdHt9CiBmdW5jIChrdmwgS2V5VmFsdWVMaXN0KSBmcm9tQyhja3Zs
ICpDLmxpYnhsX2tleV92YWx1ZV9saXN0KSBlcnJvciAgICAgIHsgcmV0dXJuIG5pbCB9CiBmdW5j
IChrdmwgS2V5VmFsdWVMaXN0KSB0b0MoKSAoY2t2bCBDLmxpYnhsX2tleV92YWx1ZV9saXN0LCBl
cnIgZXJyb3IpIHsgcmV0dXJuIH0KIAorLy8gU3RyaW5nTGlzdCByZXByZXNlbnRzIGEgbGlieGxf
c3RyaW5nX2xpc3QuCit0eXBlIFN0cmluZ0xpc3QgW11zdHJpbmcKKworZnVuYyAoc2wgKlN0cmlu
Z0xpc3QpIGZyb21DKGNzbCAqQy5saWJ4bF9zdHJpbmdfbGlzdCkgZXJyb3IgeworCXNpemUgOj0g
aW50KEMubGlieGxfc3RyaW5nX2xpc3RfbGVuZ3RoKGNzbCkpCisJbGlzdCA6PSAoKlsxIDw8IDMw
XSpDLmNoYXIpKHVuc2FmZS5Qb2ludGVyKGNzbCkpWzpzaXplOnNpemVdCisKKwkqc2wgPSBtYWtl
KFtdc3RyaW5nLCBzaXplKQorCisJZm9yIGksIHYgOj0gcmFuZ2UgbGlzdCB7CisJCSgqc2wpW2ld
ID0gQy5Hb1N0cmluZyh2KQorCX0KKworCXJldHVybiBuaWwKK30KKworZnVuYyAoc2wgU3RyaW5n
TGlzdCkgdG9DKCkgKEMubGlieGxfc3RyaW5nX2xpc3QsIGVycm9yKSB7CisJdmFyIGNoYXIgKkMu
Y2hhcgorCXNpemUgOj0gbGVuKHNsKQorCWNzbCA6PSAoQy5saWJ4bF9zdHJpbmdfbGlzdCkoQy5t
YWxsb2MoQy51bG9uZyhzaXplKSAqIEMudWxvbmcodW5zYWZlLlNpemVvZihjaGFyKSkpKQorCWNs
aXN0IDo9ICgqWzEgPDwgMzBdKkMuY2hhcikodW5zYWZlLlBvaW50ZXIoY3NsKSlbOnNpemU6c2l6
ZV0KKworCWZvciBpLCB2IDo9IHJhbmdlIHNsIHsKKwkJY2xpc3RbaV0gPSBDLkNTdHJpbmcodikK
Kwl9CisKKwlyZXR1cm4gY3NsLCBuaWwKK30KKwogLy8gQml0bWFwIHJlcHJlc2VudHMgYSBsaWJ4
bF9iaXRtYXAuCiAvLwogLy8gSW1wbGVtZW50IHRoZSBHbyBiaXRtYXAgdHlwZSBzdWNoIHRoYXQg
dGhlIHVuZGVybHlpbmcgZGF0YSBjYW4KLS0gCjIuMTkuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

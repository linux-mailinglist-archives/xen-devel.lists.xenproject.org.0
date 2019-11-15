Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41191FE5EE
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 20:47:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVhWe-0001F4-MP; Fri, 15 Nov 2019 19:45:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1SQg=ZH=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iVhWd-0001EI-Ep
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 19:44:59 +0000
X-Inumbo-ID: 68120fac-07e0-11ea-b678-bc764e2007e4
Received: from mail-qt1-x832.google.com (unknown [2607:f8b0:4864:20::832])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68120fac-07e0-11ea-b678-bc764e2007e4;
 Fri, 15 Nov 2019 19:44:58 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id o3so12010586qtj.8
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 11:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H0GThlBVCX7zZEsO+PwEo+2sXbUNMNKzCdZVo2LBwSA=;
 b=UrvxpE+pcppWqFaP4AvXVHJsBz7ZmTpbu1y5Xcl/Pzz2XpHtRnPi5N/lVpqcR3Y8OH
 dmvkZeVnG6jYhtqoOf9lP59ghMX6xUdgQvt7cjynWYZJEVEjcDTrfUwuchysaFoz0+qI
 zFMGGvZEEzueHCrBxNokyQbYT8HfrdRAyn1PgPlTxL96o8AeOkfYbNbk4CWkr1cs88Em
 /iiYmbZHdyZyUdFeSSMBRRRgrcLafpe/m9oascIKj6t9CrThAdEjwYgoJjYkirCb63Ts
 z8QQqJaDVLw2MokygXxv57UBpj5x/K0PpA6UI9JEY1Lvsf72fNNsfZ4JWwmK4LlEeBcX
 HA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H0GThlBVCX7zZEsO+PwEo+2sXbUNMNKzCdZVo2LBwSA=;
 b=skdvxZapsIfl2LJyZgE85difrmcx2KBNZj0Nu6Zq1aDQXwi5TnLfliU7I0syVocJyM
 33E+jonFr2lovm5ZxWPUWuQf6ns7Rbm8bHUjmoye+dglBTXK4Zh4o7omVOLISXcRmhVQ
 OdwYEfPdq7nFLTMkUHJKGLLfyKvgz2itQ4q++gVd3SV83XlirhDdeQtlpisjDfpGKg3q
 nojVoH/SMM/ZwtO8SmSdHGL/rB9m8FLnmnYAsSKn/WgUCEA5q6ZtB8ChM9yO7Fm9zeED
 l8pjuYRuNDBvbWpzTMfgmTAkIgwJTvz49/UxYLwOrjqW9HaUuPTvRD3Mx4Deg6xCwO+g
 /iBA==
X-Gm-Message-State: APjAAAXGKV/6I3wLzOghCBpXtDD6FIFFEWNdUivdQJDVOsljrg9ILph4
 lQsHgAdUgCQQIfq2qhF0xPtTJfia
X-Google-Smtp-Source: APXvYqzSHeQJ3ziLCV/+16n6OAYA/1DxNubH9wIu3zrSO5JA2AG90gIXs/k6OtT1U7y/4bIsHq3XFQ==
X-Received: by 2002:aed:3f63:: with SMTP id q32mr16177893qtf.340.1573847098033; 
 Fri, 15 Nov 2019 11:44:58 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id y10sm4649679qkb.55.2019.11.15.11.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 11:44:57 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 15 Nov 2019 14:44:07 -0500
Message-Id: <cover.1573840473.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 00/22] generated Go libxl bindings using IDL
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

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KCkFmdGVyIFhlbiBz
dW1taXQsIHdlIHN0YXJ0ZWQgdGhlIGRpc2N1c3Npb24gaW4gdGhpc1sxXSBSRkMgdGhyZWFkCnRv
IGZpZ3VyZSBvdXQgaG93IHRvIGdlbmVyYXRlIEdvIGJpbmRpbmdzIGZvciBsaWJ4bC4gVGhpcyBz
ZXJpZXMKaW1wbGVtZW50cyB0aGF0IEdvIGNvZGUgZ2VuZXJhdGlvbiB1c2luZyB0aGUgZXhpc3Rp
bmcgSURMLCBhbmQgdXBkYXRlcwp0aGUgZXhpc3RpbmcgaGFuZC13cml0dGVuIGNvZGUgaW4geGVu
bGlnaHQuZ28gdG8gdXNlIHRoZSBnZW5lcmF0ZWQKY29kZS4KClRoZSBnb2FsIG9mIHRoaXMgc2Vy
aWVzIGlzIHRvIHByb3ZpZGUgYSBnb29kIGZvdW5kYXRpb24gZm9yIGNvbnRpbnVlZApkZXZlbG9w
bWVudCBvZiB0aGUgR28gcGFja2FnZS4KClRoZSB2MSBzZXJpZXMgY2FuIGJlIGZvdW5kIG9uIG15
IEdpdEh1YiBicmFuY2hbMl0uCgpDaGFuZ2VzIGluIHYyOgotIEdpdEh1YiBicmFuY2ggZm9yIHYy
IFszXS4KLSBEcm9wIHBhdGNoIDAxLzI0IGZyb20gdjEgc2luY2Ugd2FzIGNvbW1pdHRlZCBhcyBh
IGJ1ZyBmaXggZm9yIDQuMTMuCi0gVGhlIE1ha2VmaWxlIGNoYW5nZXMgaW4gMjQvMjQgZnJvbSB2
MSBoYXZlIGJlZW4gbW92ZWQgdG8gdGhlIHBhdGNoZXMKICB3aGVyZSB0aGUgYnVpbGQgY2hhbmdl
cyBhcmUgaW50cm9kdWNlZC4KClsxXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hp
dmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDcvbXNnMDIyNTkuaHRtbApbMl0gaHR0cHM6Ly9naXRo
dWIuY29tL2VucjBuL3hlbi90cmVlL2dvbGFuZy1wYXRjaGVzLXYxClszXSBodHRwczovL2dpdGh1
Yi5jb20vZW5yMG4veGVuL3RyZWUvZ29sYW5nLXBhdGNoZXMtdjIKCk5pY2sgUm9zYnJvb2sgKDIy
KToKICBnb2xhbmcveGVubGlnaHQ6IGdlbmVyYXRlIGVudW0gdHlwZXMgZnJvbSBJREwKICBnb2xh
bmcveGVubGlnaHQ6IGRlZmluZSBEZWZib29sIGJ1aWx0aW4gdHlwZQogIGdvbGFuZy94ZW5saWdo
dDogZGVmaW5lIERldmlkIHR5cGUgYXMgaW50CiAgZ29sYW5nL3hlbmxpZ2h0OiBkZWZpbmUgS2V5
VmFsdWVMaXN0IGFzIGVtcHR5IHN0cnVjdAogIGdvbGFuZy94ZW5saWdodDogcmUtbmFtZSBCaXRt
YXAgbWFyc2hhbGluZyBmdW5jdGlvbnMKICBnb2xhbmcveGVubGlnaHQ6IGRlZmluZSBTdHJpbmdM
aXN0IGJ1aWx0aW4gdHlwZQogIGdvbGFuZy94ZW5saWdodDogZGVmaW5lIE1hYyBidWlsdGluIHR5
cGUKICBnb2xhbmcveGVubGlnaHQ6IGRlZmluZSBNc1ZtR2VuaWQgYnVpbHRpbiB0eXBlCiAgZ29s
YW5nL3hlbmxpZ2h0OiBkZWZpbmUgRXZMaW5rIGJ1aWx0aW4gYXMgZW1wdHkgc3RydWN0CiAgZ29s
YW5nL3hlbmxpZ2h0OiBkZWZpbmUgQ3B1aWRQb2xpY3lMaXN0IGJ1aWx0aW4gdHlwZQogIGdvbGFu
Zy94ZW5saWdodDogcmUtZmFjdG9yIFV1aWQgdHlwZSBpbXBsZW1lbnRhdGlvbgogIGdvbGFuZy94
ZW5saWdodDogcmUtZmFjdG9yIEh3Y2FwIHR5cGUgaW1wbGVtZW50YXRpb24KICBnb2xhbmcveGVu
bGlnaHQ6IGdlbmVyYXRlIHN0cnVjdHMgZnJvbSB0aGUgSURMCiAgZ29sYW5nL3hlbmxpZ2h0OiBy
ZW1vdmUgbm8tbG9uZ2VyIHVzZWQgdHlwZSBNZW1LQgogIGdvbGFuZy94ZW5saWdodDogYmVnaW4g
QyB0byBHbyB0eXBlIG1hcnNoYWxpbmcKICBnb2xhbmcveGVubGlnaHQ6IGltcGxlbWVudCBrZXll
ZCB1bmlvbiBDIHRvIEdvIG1hcnNoYWxpbmcKICBnb2xhbmcveGVubGlnaHQ6IGltcGxlbWVudCBh
cnJheSBDIHRvIEdvIG1hcnNoYWxpbmcKICBnb2xhbmcveGVubGlnaHQ6IGJlZ2luIEdvIHRvIEMg
dHlwZSBtYXJzaGFsaW5nCiAgZ29sYW5nL3hlbmxpZ2h0OiBpbXBsZW1lbnQga2V5ZWQgdW5pb24g
R28gdG8gQyBtYXJzaGFsaW5nCiAgZ29sYW5nL3hlbmxpZ2h0OiBpbXBsZW1lbnQgYXJyYXkgR28g
dG8gQyBtYXJzaGFsaW5nCiAgZ29sYW5nL3hlbmxpZ2h0OiByZXZpc2UgdXNlIG9mIENvbnRleHQg
dHlwZQogIGdvbGFuZy94ZW5saWdodDogYWRkIGVycm9yIHJldHVybiB0eXBlIHRvIENvbnRleHQu
Q3B1cG9vbGluZm8KCiB0b29scy9nb2xhbmcveGVubGlnaHQvTWFrZWZpbGUgICAgICAgfCAgIDIw
ICstCiB0b29scy9nb2xhbmcveGVubGlnaHQvZ2VuZ290eXBlcy5weSAgfCAgNzE5ICsrKysrKwog
dG9vbHMvZ29sYW5nL3hlbmxpZ2h0L2hlbHBlcnMuZ2VuLmdvIHwgMzQwOCArKysrKysrKysrKysr
KysrKysrKysrKysrKwogdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3R5cGVzLmdlbi5nbyAgIHwgMTIy
NCArKysrKysrKysKIHRvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbyAgICB8ICA5MDkg
KysrLS0tLQogNSBmaWxlcyBjaGFuZ2VkLCA1NzQ0IGluc2VydGlvbnMoKyksIDUzNiBkZWxldGlv
bnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9nb2xhbmcveGVubGlnaHQvZ2VuZ290eXBl
cy5weQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2dvbGFuZy94ZW5saWdodC9oZWxwZXJzLmdl
bi5nbwogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2dvbGFuZy94ZW5saWdodC90eXBlcy5nZW4u
Z28KCi0tIAoyLjE5LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs

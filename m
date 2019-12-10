Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C94B118CFF
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 16:50:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iehku-0003Rz-ML; Tue, 10 Dec 2019 15:48:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A1/D=2A=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iehkt-0003Rb-Rk
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 15:48:55 +0000
X-Inumbo-ID: 757fa158-1b64-11ea-a1e1-bc764e2007e4
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 757fa158-1b64-11ea-a1e1-bc764e2007e4;
 Tue, 10 Dec 2019 15:48:07 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id l124so4839905qkf.8
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2019 07:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0TURsPZc+1/SmVXD/EyiheO2ykqzwRquClSd3SbIosQ=;
 b=h84yTtVmUxwtJaAcNNpoBjVacQCFLHyxF7k36Y0+m8yvhxQtS2Ed3oOPYiQfQUdGMk
 XWpDkahoYyqgrysVUuJtiyimnGVknkUqjIkZ1tL91hu4Ei3NAbbYWDbxckaYmQvbnT2M
 74paNWdgY4vNzFybwMDhHBWHI9vpALEf2VwnBcqyQljSzBtBuIDQfq16O/POqa6U8EQX
 /XtojjqaKZFJESd7pTKri+nwwC3UvVs9JYJNIzFJ61D2Ier+HifkY9nNoASNO3QtEC6d
 SPRQdGWrg2JBcpm9CNLhRNOpHzGCKBEY+lIUJZVJto2zdZywYOcaicGBKU4YDq/x6qqL
 vEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0TURsPZc+1/SmVXD/EyiheO2ykqzwRquClSd3SbIosQ=;
 b=EEWlasJvRKjDqmaidDV/xz7+ZtNyUwDWqgLEWvCE9UhsgldYxlEsmoP2hGN9PBRtmF
 OW2EAhFHA3aIdsl9n/mY6OBGYKHb8unJh04F5EGzak4WVbQRLaYgpDZU9g2S5z9l56J0
 DZhufm1/nlGRSRpcPumfobh6EV9DNIIPs8pyS3/PLV1Nkkw3i2KZ6TrwO3ALESMTN07f
 8KJkCFn51Emzs+TyjXdxQGrId/9SMaf5RZM5oXYT5bQ305sKc9MEneWi68Kc87mREorn
 scBTXjZRdHhha5I7gbDKmI6IA3z0f5WfgAW2/GP8z+Hsl2tT+SDVkrGVWLK+T43kpJxz
 Tn0Q==
X-Gm-Message-State: APjAAAUHoZg0pO2xj7FTXvQlOnK7XQUjozR7/0HnwetNPwKermECf4Nd
 kvcx98REpB63eNqWwKHJhehcyleD
X-Google-Smtp-Source: APXvYqwVONuQ5qQupjSW0e2xsvADiPlWYvyV0/uegvWp7ArPVHnSyZxEOHXh5i6Zmmv78dN0L2u/6Q==
X-Received: by 2002:a05:620a:795:: with SMTP id
 21mr4965079qka.60.1575992886409; 
 Tue, 10 Dec 2019 07:48:06 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id m29sm1247848qtf.1.2019.12.10.07.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 07:48:05 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 10 Dec 2019 10:47:29 -0500
Message-Id: <c50413821186c2dcc57ad81231f90d8eeb75d355.1575990937.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1575990937.git.rosbrookn@ainfosec.com>
References: <cover.1575990937.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 14/22] golang/xenlight: remove no-longer used
 type MemKB
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

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KClNpZ25lZC1vZmYt
Ynk6IE5pY2sgUm9zYnJvb2sgPHJvc2Jyb29rbkBhaW5mb3NlYy5jb20+CkFja2VkLWJ5OiBHZW9y
Z2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvZ29sYW5nL3hl
bmxpZ2h0L3hlbmxpZ2h0LmdvIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvIGIvdG9vbHMv
Z29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCmluZGV4IDhmNDEwNDc3MjYuLmZiMWM2ZDllNTEg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbworKysgYi90b29s
cy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KQEAgLTgzLDggKzgzLDYgQEAgdHlwZSBEb21p
ZCB1aW50MzIKIC8vIERldmlkIGlzIGEgZGV2aWNlIElELgogdHlwZSBEZXZpZCBpbnQKIAotdHlw
ZSBNZW1LQiB1aW50NjQKLQogLy8gVXVpZCBpcyBhIGRvbWFpbiBVVUlELgogdHlwZSBVdWlkIFsx
Nl1ieXRlCiAKLS0gCjIuMTkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=

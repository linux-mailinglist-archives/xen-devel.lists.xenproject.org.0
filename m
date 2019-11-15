Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A08FE5FC
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 20:48:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVhXh-0001t1-CR; Fri, 15 Nov 2019 19:46:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1SQg=ZH=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iVhXg-0001sS-HK
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 19:46:04 +0000
X-Inumbo-ID: 728c0ffa-07e0-11ea-9631-bc764e2007e4
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 728c0ffa-07e0-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 19:45:16 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id z16so9056648qkg.7
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 11:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QsraxSVXdgtBX7P3uApVFEMeK6rMsH3ykMhDIyasI84=;
 b=Vl15rK8Rb6zyYpkE3Wh481z+0aHCNbRs5olhT5buX1uwi4L8ZZmmhfkZVKFMp4AklX
 zvpvoxOIBzZ8WYN3twyw19C3b+JKe/YAPiH16GtqBr4mGEzyUyOu7jR04aYbukq5nZDr
 FWQZsjWFcgo1kSJn4v1b26Ctql7om/Ygvlhki/8TqAoxIaI/7jnws4TVswPyifRbwBXy
 vvoLtsH6Uyq6E1tCI2s6M8B5fPeL7TIg31E014i6T6Bo9NPuMEUl0626iS2uNUCC5kvT
 +lhse0ios+Sm4JhB8Gf0qRilSRY8RSblDQ8/rx31mKd3cB+ydS0icc6qWkHML+Rv8Xbh
 I1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QsraxSVXdgtBX7P3uApVFEMeK6rMsH3ykMhDIyasI84=;
 b=lTLMkfAbvd8UqCLFir5yJfULG9qcYhJ4z3Vk5u7xoLYZEeaLoUQv+zJUBzWDr/KZE7
 zkckFig5vJI8FqDWltaJ8MliZYA89XDhGDqcaPhEKChkEudnjMMPl2kn/Zq6eHSLYnrK
 YTHMoovN8HZFODEsk32Y0yiapwzpyhtYBElTx+WM+dLAMPoTrJVpqeAIh/dVYt58dMuI
 HnAXvO3SXRKawa7+uOQwZIySLtE4JF4ghUwy+CaDX9rMqJQBWMbdPXipetilkiAmKj0I
 gptbdgH0sKqmudECuSvRZo0fd6rRa364l2wDfbLPNvPB4SzE5P0hBvIPRdGi71kNAXO1
 hy/w==
X-Gm-Message-State: APjAAAXsJI40qG6w+IG8NC9W1ZbGC+M5VV+e1c4sYVbMHuuJzr3J4dau
 Qj3jzq+mLRB7t/fCTk0gJUM7b/cI
X-Google-Smtp-Source: APXvYqw+W8OfWLIYm6FWPVwzzT3d5sJx1h3IB5DcVSjdEAaA8f1xxtIB2a+uQ6LaXxivr3AkY+vItw==
X-Received: by 2002:a37:630e:: with SMTP id x14mr14543664qkb.296.1573847115699; 
 Fri, 15 Nov 2019 11:45:15 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id y10sm4649679qkb.55.2019.11.15.11.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 11:45:14 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 15 Nov 2019 14:44:21 -0500
Message-Id: <076ae2a0881485b645c62877b0778932dcf88b27.1573840474.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1573840473.git.rosbrookn@ainfosec.com>
References: <cover.1573840473.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 14/22] golang/xenlight: remove no-longer used
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
Z29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCmluZGV4IGMyNzY0YWYyNzcuLjk0MjAxOTdiZmIg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbworKysgYi90b29s
cy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KQEAgLTgzLDggKzgzLDYgQEAgdHlwZSBEb21p
ZCB1aW50MzIKIC8vIERldmlkIGlzIGEgZGV2aWNlIElELgogdHlwZSBEZXZpZCBpbnQKIAotdHlw
ZSBNZW1LQiB1aW50NjQKLQogLy8gVXVpZCBpcyBhIGRvbWFpbiBVVUlELgogdHlwZSBVdWlkIFsx
Nl1ieXRlCiAKLS0gCjIuMTkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=

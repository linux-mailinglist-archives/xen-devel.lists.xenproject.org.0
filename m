Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9433E7865
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 19:25:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP9f1-0000ln-I5; Mon, 28 Oct 2019 18:22:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZIpA=YV=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1iP9ez-0000lZ-Lf
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 18:22:33 +0000
X-Inumbo-ID: e5e30b78-f9af-11e9-beca-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5e30b78-f9af-11e9-beca-bc764e2007e4;
 Mon, 28 Oct 2019 18:22:28 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id f5so8569541lfp.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2019 11:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=x6gcVv6ZDlEFCzeVFBOyHJn95rgYFyAe3I5FPXjfjEA=;
 b=gm9/ZNAnpUx4H9Rr2W+ONu8mpYfWjjCE+5YtaFBb/PDpUTno1M1Se96QcGazv54bE4
 JdYD1ZmXnAtYyiJf3juMo/s5Wbp0BOijruWqpDt3Cvm9YSUYZLTnM1ljfWQRBV76EFs/
 fAjNexz2V3ZoNpXyKaHY08cMHjUN3OCV38sUfPsuWn1kcvLytIVwCHr+lAAxZjiQQzGp
 uL1Wuz4WTW2RYZuZrE4kQmttgs4EBY9LPSEDCqRFgwnxuk8N9IqqwuCdajk0LHY9mQXo
 xd8RDyrEpGOTZmIlsUDN2PP/OF3syX3nlHjRsMglKL5WD+d72nzuVWYEgUMCNZ85OgfH
 iYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=x6gcVv6ZDlEFCzeVFBOyHJn95rgYFyAe3I5FPXjfjEA=;
 b=qLS0aboEyKQ6PeubNtW2IXvDXhodJAG6RrR4W8iBLj+Ciegi2viaUqk5pWA2viFR7F
 s1SdBh3dQ/PM5KGYAAGjbJ0UNa9bqvHIJ5F3QundBYHHj3hF/nfmQnR8OCDAfU5MTgFJ
 ywUy3Gp+fdyKt8EiscJRWzccyldq8mIULkFBI/T/fgfBWnMPqF7KbUtAxotQf6WDx8Yh
 C1lUP9/CTkcd3l5WZsTMJLz9J/63gs+DKH+jqPzwN/xg+W5qFxiI4q8InNhBP2NqtXiZ
 EgiesdTnsC4T/PbQOEtJJAhnxv3sY8+TWouSIlNfB0EpDpzyqUejPhejZS96sIgABPWF
 7xgg==
X-Gm-Message-State: APjAAAVYW27Ln2OADx2bCyO9W29LzMzEd4oV6+YCyFpmLY2NeaCs6j6L
 x9TJu1Yj6cvLZ/zC0qiWlp01lBHXsiEGuw==
X-Google-Smtp-Source: APXvYqy9PMJSmzxNlHHRH056OzSqJbgI3Jr5398D0qOOjW0KtKJbSv8w7pcGWuZYBap7tdRJrI/FQA==
X-Received: by 2002:ac2:43b6:: with SMTP id t22mr5557400lfl.126.1572286947621; 
 Mon, 28 Oct 2019 11:22:27 -0700 (PDT)
Received: from al1-pc.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id p86sm7474522lja.100.2019.10.28.11.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 11:22:27 -0700 (PDT)
From: Oleksandr Grytsov <al1img@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 28 Oct 2019 20:22:16 +0200
Message-Id: <20191028182216.3882-2-al1img@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191028182216.3882-1-al1img@gmail.com>
References: <20191028182216.3882-1-al1img@gmail.com>
Subject: [Xen-devel] [PATCH v1 1/1] libxl/gentypes: add range init to array
 elements in json parsing
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
Cc: anthony.perard@citrix.com, Oleksandr Grytsov <oleksandr_grytsov@epam.com>,
 julien.grall@arm.com, ian.jackson@eu.citrix.com, wl@xen.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVwYW0uY29tPgoKQWRk
IGluaXRpYWxpemF0aW9uIG9mIGFycmF5IGVsZW1lbnRzIGluIHBhcnNlIGpzb24gZnVuY3Rpb24u
CgpDdXJyZW50bHksIGFycmF5IGVsZW1lbnRzIGFyZSBpbml0aWFsaXplZCB3aXRoIGNhbGxvYy4g
V2hpY2ggbWVhbnMKaW5pdGlhbGl6ZSBhbGwgZWxlbWVudCBmaWVsZHMgd2l0aCB6ZXJvIHZhbHVl
cy4gSWYgZW50cmllcyBhcmUgbWlzc2VkIGluCmpzb24gZm9yIHN1Y2ggZmllbGRzLCBpdCB3aWxs
IGJlIGVxdWFsIHRvIHplcm8gaW5zdGVhZCBvZiBkZWZhdWx0IHZhbHVlcy4KVGhlIGZpeCBpcyB0
byBhZGQgcmFuZ2UgaW5pdCBmdW5jdGlvbiBiZWZvcmUgcGFyc2luZyBhcnJheSBlbGVtZW50IGZv
cgpzdHJ1Y3R1cmVzIHdoaWNoIGhhdmUgZGVmaW5lZCByYW5nZSBpbml0IGZ1bmN0aW9uLgoKU2ln
bmVkLW9mZi1ieTogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVwYW0uY29t
PgotLS0KIHRvb2xzL2xpYnhsL2dlbnR5cGVzLnB5IHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2dlbnR5cGVzLnB5IGIvdG9v
bHMvbGlieGwvZ2VudHlwZXMucHkKaW5kZXggNjQxN2M5ZGQ4Yy4uNGZmNWQ4YTJkMCAxMDA2NDQK
LS0tIGEvdG9vbHMvbGlieGwvZ2VudHlwZXMucHkKKysrIGIvdG9vbHMvbGlieGwvZ2VudHlwZXMu
cHkKQEAgLTQ1Niw2ICs0NTYsOCBAQCBkZWYgbGlieGxfQ190eXBlX3BhcnNlX2pzb24odHksIHcs
IHYsIGluZGVudCA9ICIgICAgIiwgcGFyZW50ID0gTm9uZSwgZGlzY3JpbWluYQogICAgICAgICBz
ICs9ICIgICAgICAgIGdvdG8gb3V0O1xuIgogICAgICAgICBzICs9ICIgICAgfVxuIgogICAgICAg
ICBzICs9ICIgICAgZm9yIChpPTA7ICh0PWxpYnhsX19qc29uX2FycmF5X2dldCh4LGkpKTsgaSsr
KSB7XG4iCisgICAgICAgIGlmIHR5LmVsZW1fdHlwZS5pbml0X2ZuIGlzIG5vdCBOb25lIGFuZCB0
eS5lbGVtX3R5cGUuYXV0b2dlbmVyYXRlX2luaXRfZm46CisgICAgICAgICAgICBzICs9IGluZGVu
dCArICIgICAgIisiJXNfaW5pdCgmJXNbaV0pO1xuIiAlICh0eS5lbGVtX3R5cGUudHlwZW5hbWUs
IHYpCiAgICAgICAgIHMgKz0gbGlieGxfQ190eXBlX3BhcnNlX2pzb24odHkuZWxlbV90eXBlLCAi
dCIsIHYrIltpXSIsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5kZW50
ICsgIiAgICAiLCBwYXJlbnQpCiAgICAgICAgIHMgKz0gIiAgICB9XG4iCi0tIAoyLjE3LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AF7156E79
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 05:39:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j10nU-00012n-8z; Mon, 10 Feb 2020 04:35:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZgKX=36=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1j10nS-00012g-TD
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 04:35:46 +0000
X-Inumbo-ID: c96d1158-4bbe-11ea-a759-bc764e2007e4
Received: from mail-pg1-x52f.google.com (unknown [2607:f8b0:4864:20::52f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c96d1158-4bbe-11ea-a759-bc764e2007e4;
 Mon, 10 Feb 2020 04:35:38 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id z12so3217793pgl.4
 for <xen-devel@lists.xenproject.org>; Sun, 09 Feb 2020 20:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=v9HnCkKPrsIqlJxzhjJpBoHtcZFvnXPakVq0tT3Ud7Q=;
 b=Zxs+zpS/meXh6ktIfnQ3bVGPtqmPnBj+VAUpXc3rzqYdu4boh/fE/vf4Dy9LePJoaP
 hjiB1mgwxpc15P8lte/Et5Z+hYYGYJ6AavrFLDPU4bXgxVATjMr0hAQi2QJgS5I54Erw
 IfNXoDuNcrO/7gKaJA4fzKPhodxEi8/cIr+gdXAxHxqs0yNdZ1YmVBHk0A4E+IdI3JkM
 l1FLxyexRglJpT5BMOGPF0k2VEY/A0W+UxDuP8swpmdaskB4obZDroZJaDOZyc6SalbD
 OMql6Zv6T48wrByZK7KtPhBatQw07ym0gKicNEJevinXt23RAX9MCoaLIP1RmM67NEvx
 ho8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=v9HnCkKPrsIqlJxzhjJpBoHtcZFvnXPakVq0tT3Ud7Q=;
 b=gFHaD4+rHk9CmX7nkWNJfHhpejf3kISct+w8wua2d29+h6Hl0Ajkl08Y65DLocU9ZQ
 jtgyGtJ10hM3GdLR5c8jb2JmOecuA+ZT2i4g6SUelMCTwSY+ecQQ0SrZzkMNBdX9Hk1w
 lTBgD17Q03los07FUAed5dIYYcGA0U1Ejwt45saSaasBUc4yTpFkSypXE9HpIYvbgU9c
 ATKHVfcIkgORRstGaOK4DLNx+2KOCog+iLztNYVUsLaESfJUeIYG95MjeZHqiGlDICUU
 jXS9K547pVXFTqp3VQLQLpzE9lR4xly91+hkAVlVYcAmJSzZZhp1Owtn5Yw3lsEuNbJZ
 SW0g==
X-Gm-Message-State: APjAAAUQOOHsxjFZmEM99A9qspa1WCEhXk3DHGRmqR24fgwuvcRLWgM4
 oyt7Sl07gBHrdJ3uSlt8OoO6msRc
X-Google-Smtp-Source: APXvYqyk9VwzGTq0ta/Y6swk/uNnlIBvC86pvKototwXzA4TRdO0/oJ49t8t/u5NVW2gzWCkXXs6Yg==
X-Received: by 2002:aa7:9205:: with SMTP id 5mr11351460pfo.213.1581309337457; 
 Sun, 09 Feb 2020 20:35:37 -0800 (PST)
Received: from desktop.ice.pyrology.org
 (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
 by smtp.gmail.com with ESMTPSA id l15sm9089246pgi.31.2020.02.09.20.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2020 20:35:36 -0800 (PST)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Sun,  9 Feb 2020 20:35:16 -0800
Message-Id: <20200210043516.1996-3-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210043516.1996-1-christopher.w.clark@gmail.com>
References: <20200210043516.1996-1-christopher.w.clark@gmail.com>
Subject: [Xen-devel] [PATCH 2/2] python,
 pygrub: pass DISTUTILS env vars as setup.py args
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
Cc: Rich Persaud <persaur@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, Wei Liu <wl@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxsb3cgdG8gcmVzcGVjdCB0aGUgdGFyZ2V0IGluc3RhbGwgZGlyIChQWVRIT05fU0lURVBBQ0tB
R0VTX0RJUikKYXMgd2VsbCBhcyBvdGhlciBwYXJhbWV0ZXJzIHNldCBieSB0aGUgT3BlbkVtYmVk
ZGVkIGJ1aWxkIHN5c3RlbS4KVGhpcyBpcyBlc3BlY2lhbGx5IHVzZWZ1bCB3aGVuIHRoZSB0YXJn
ZXQgbGliZGlyIGlzIG5vdCB0aGUgZGVmYXVsdCBvbmUKKC91c3IvbGliKSwgYnV0IGZvciBleGFt
cGxlIC91c3IvbGliNjQuCgpTaWduZWQtb2ZmLWJ5OiBNYWNpZWogUGlqYW5vd3NraSA8bWFjaWVq
LnBpamFub3dza2lAM21kZWIuY29tPgoKVGhpcyBlbmFibGVzIHRoZSBkaXN0cm8gYnVpbGQgc3lz
dGVtIHRvIHBhc3MgYWRkaXRpb25hbCBhcmdzIHRvIHRoZQpweXRob24gc2V0dXAucHkgYnVpbGQg
YW5kIGluc3RhbGwgY29tbWFuZHMuClNpZ25lZC1vZmYtYnk6IENocmlzdG9waGVyIENsYXJrIDxj
aHJpc3RvcGhlci5jbGFyazZAYmFlc3lzdGVtcy5jb20+Ci0tLQpPcmlnaW5hbCBwYXRjaCBmcm9t
IHRoZSBZb2N0by9PcGVuRW1iZWRkZWQgbWV0YS12aXJ0dWFsaXphdGlvbiBsYXllci4KUmV3cmFw
cGVkIGFuZCByZWJhc2VkIG9udG8gdGhlIGFkamFjZW50IGNvbW1pdCBzdWJtaXR0ZWQgaW4gdGhp
cyBzZXJpZXMuCgogdG9vbHMvcHlncnViL01ha2VmaWxlIHwgNiArKysrLS0KIHRvb2xzL3B5dGhv
bi9NYWtlZmlsZSB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvcHlncnViL01ha2VmaWxlIGIvdG9vbHMv
cHlncnViL01ha2VmaWxlCmluZGV4IGI0ZjZmMTBkZGQuLjQzMGNlZWVkMTYgMTAwNjQ0Ci0tLSBh
L3Rvb2xzL3B5Z3J1Yi9NYWtlZmlsZQorKysgYi90b29scy9weWdydWIvTWFrZWZpbGUKQEAgLTEw
LDE0ICsxMCwxNiBAQCBJTlNUQUxMX0xPRyA9IGJ1aWxkL2luc3RhbGxlZF9maWxlcy50eHQKIGFs
bDogYnVpbGQKIC5QSE9OWTogYnVpbGQKIGJ1aWxkOgotCUNDPSIkKENDKSIgQ0ZMQUdTPSIkKFBZ
X0NGTEFHUykiIExERkxBR1M9IiQoUFlfTERGTEFHUykiICQoUFlUSE9OKSBzZXR1cC5weSBidWls
ZAorCUNDPSIkKENDKSIgQ0ZMQUdTPSIkKFBZX0NGTEFHUykiIExERkxBR1M9IiQoUFlfTERGTEFH
UykiICQoUFlUSE9OKSBcCisJCXNldHVwLnB5IGJ1aWxkICQoRElTVFVUSUxTX0JVSUxEX0FSR1Mp
CiAKIC5QSE9OWTogaW5zdGFsbAogaW5zdGFsbDogYWxsCiAJJChJTlNUQUxMX0RJUikgJChERVNU
RElSKS8kKGJpbmRpcikKIAlDQz0iJChDQykiIENGTEFHUz0iJChQWV9DRkxBR1MpIiBMREZMQUdT
PSIkKFBZX0xERkxBR1MpIiAkKFBZVEhPTikgXAogCQlzZXR1cC5weSBpbnN0YWxsIC0tcmVjb3Jk
ICQoSU5TVEFMTF9MT0cpICQoUFlUSE9OX1BSRUZJWF9BUkcpIFwKLQkJIC0tcm9vdD0iJChERVNU
RElSKSIgLS1pbnN0YWxsLXNjcmlwdHM9JChMSUJFWEVDX0JJTikgLS1mb3JjZQorCQkgLS1yb290
PSIkKERFU1RESVIpIiAtLWluc3RhbGwtc2NyaXB0cz0kKExJQkVYRUNfQklOKSAtLWZvcmNlIFwK
KwkJJChESVNUVVRJTFNfSU5TVEFMTF9BUkdTKQogCXJtIC1mICQoREVTVERJUikvJChMSUJFWEVD
X0JJTikvcHlncnViCiAJJChJTlNUQUxMX1BZVEhPTl9QUk9HKSBzcmMvcHlncnViICQoREVTVERJ
UikvJChMSUJFWEVDX0JJTikvcHlncnViCiAJc2V0IC1lOyBpZiBbICQoYmluZGlyKSAhPSAkKExJ
QkVYRUNfQklOKSAtYSBcCmRpZmYgLS1naXQgYS90b29scy9weXRob24vTWFrZWZpbGUgYi90b29s
cy9weXRob24vTWFrZWZpbGUKaW5kZXggZTk5Zjc4YTUzNy4uMjk0ZjhlZTRkZCAxMDA2NDQKLS0t
IGEvdG9vbHMvcHl0aG9uL01ha2VmaWxlCisrKyBiL3Rvb2xzL3B5dGhvbi9NYWtlZmlsZQpAQCAt
MTAsNyArMTAsNyBAQCBJTlNUQUxMX0xPRyA9IGJ1aWxkL2luc3RhbGxlZF9maWxlcy50eHQKIAog
LlBIT05ZOiBidWlsZAogYnVpbGQ6Ci0JQ0M9IiQoQ0MpIiBDRkxBR1M9IiQoUFlfQ0ZMQUdTKSIg
JChQWVRIT04pIHNldHVwLnB5IGJ1aWxkCisJQ0M9IiQoQ0MpIiBDRkxBR1M9IiQoUFlfQ0ZMQUdT
KSIgJChQWVRIT04pIHNldHVwLnB5IGJ1aWxkICQoRElTVFVUSUxTX0JVSUxEX0FSR1MpCiAKIC5Q
SE9OWTogaW5zdGFsbAogaW5zdGFsbDoKQEAgLTE4LDcgKzE4LDcgQEAgaW5zdGFsbDoKIAogCUND
PSIkKENDKSIgQ0ZMQUdTPSIkKFBZX0NGTEFHUykiIExERkxBR1M9IiQoUFlfTERGTEFHUykiICQo
UFlUSE9OKSBcCiAJCXNldHVwLnB5IGluc3RhbGwgLS1yZWNvcmQgJChJTlNUQUxMX0xPRykgJChQ
WVRIT05fUFJFRklYX0FSRykgXAotCQktLXJvb3Q9IiQoREVTVERJUikiIC0tZm9yY2UKKwkJLS1y
b290PSIkKERFU1RESVIpIiAtLWZvcmNlICQoRElTVFVUSUxTX0lOU1RBTExfQVJHUykKIAogCSQo
SU5TVEFMTF9QUk9HKSBzY3JpcHRzL2NvbnZlcnQtbGVnYWN5LXN0cmVhbSAkKERFU1RESVIpJChM
SUJFWEVDX0JJTikKIAkkKElOU1RBTExfUFJPRykgc2NyaXB0cy92ZXJpZnktc3RyZWFtLXYyICQo
REVTVERJUikkKExJQkVYRUNfQklOKQotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

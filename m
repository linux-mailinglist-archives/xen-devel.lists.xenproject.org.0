Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E949BCE718
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 17:16:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHUiD-00075A-L5; Mon, 07 Oct 2019 15:14:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0SFq=YA=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iHUiB-00074C-Nv
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 15:14:11 +0000
X-Inumbo-ID: 04896cb2-e915-11e9-9bee-bc764e2007e4
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04896cb2-e915-11e9-9bee-bc764e2007e4;
 Mon, 07 Oct 2019 15:13:29 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id u22so19591325qtq.13
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2019 08:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cCZaglVTgcfWai9fgB2qXpyY4KTejoKlJVlB2MGtgNA=;
 b=R3ikUzlOnHnUwpPCc9S6M79b93ZhUErSjhNERWcuOhd2l33GpgIPJjL4bytWYnzrx8
 lKOAVLJNqv0vVNW2tWAbbq1lJEKc4hOd5r427eX6GScevroOEFoPPf6Zy3PT+p3MfSQ5
 nRiMUjzeqowf3OXXk+27ll4jllXEx0CCHlkcZXHwDDkxhnxSc/rOQwh7N3Byf/x/AVPd
 aV7htl32Q5xvN56UWvKO6w7wGCfk1WiFmK59qiNIagYKrpirtK3t9O+x5tAFI3IsOBfP
 +0RdD+oktvlwNuxzPqdJZfYhfE3y472rpKIyjbXj2jV77dRjvYiBgR6K8+IhFnI1DnuR
 rq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cCZaglVTgcfWai9fgB2qXpyY4KTejoKlJVlB2MGtgNA=;
 b=RGFrfz7ddzSoLXa1SgCgI8bwMeJufvJ6UIJ1XHgcr5gmqxgHiBrnEsRD1muUYc+W/s
 O3lNunLXPoy9uJZh50dxYsHXoEuX3Zh0loWvV4yybjo79abrtf70fQRN9d26xNLyA+Kg
 p78RmT4cxxWG2vitjv5jV3CgpU/eDupdb7aZK3u8eTpmEqbO4MOGyrMSYpfwpu1LJ7xC
 VvduquJOdsMrhgqJ8hxWlOyUg51Fizc0/k22zMs2T4EZe0HJFvp8krCKQ4+V6PnKQYob
 WT0XYFYKRuwrQm48l7Zf8oVPWO64MAry0M6KElceevlW//HLlRzmAVxT2Q/FVPHeglR/
 rctQ==
X-Gm-Message-State: APjAAAU/75tY8ja3MC08o4B4MUkv2ot1DkHpkY4CNXIfwnFP1ipphgwP
 e6QSWHYB/K2nVXVzpPAet7Ci6GGh
X-Google-Smtp-Source: APXvYqyNmbmKjZz4gIwyT7oZgrx4nUmjRTEBQh2m4z3pxVyMowjhft6MebAtY/vKVHOTTFHq5mMyPg==
X-Received: by 2002:aed:32c6:: with SMTP id z64mr29400427qtd.202.1570461208556; 
 Mon, 07 Oct 2019 08:13:28 -0700 (PDT)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id c185sm8354313qkg.74.2019.10.07.08.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 08:13:27 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  7 Oct 2019 11:12:58 -0400
Message-Id: <5773984ae9308500183adde21cf25837bba39f7f.1570456846.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1570456846.git.rosbrookn@ainfosec.com>
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 11/24] golang/xenlight: define CpuidPolicyList
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

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KCkRlZmluZSBDcHVp
ZFBvbGljeUxpc3QgYXMgYSB3cmFwcGVyIHN0cnVjdCB3aXRoIGZpZWxkIHZhbCBvZiB0eXBlCipD
LmxpYnhsX2NwdWlkX3BvbGljeV9saXN0IGFuZCBpbXBsZW1lbnQgZnJvbUMgYW5kIHRvQyBmdW5j
dGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25AYWluZm9zZWMu
Y29tPgotLS0KQ2M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KQ2M6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2xA
eGVuLm9yZz4KCiB0b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28gfCAyMCArKysrKysr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28gYi90b29scy9nb2xhbmcveGVu
bGlnaHQveGVubGlnaHQuZ28KaW5kZXggZDQxZGUyNTNmMy4uOWMzODQ0ODVlMSAxMDA2NDQKLS0t
IGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCisrKyBiL3Rvb2xzL2dvbGFuZy94
ZW5saWdodC94ZW5saWdodC5nbwpAQCAtMjQ5LDYgKzI0OSwyNiBAQCB0eXBlIEV2TGluayBzdHJ1
Y3R7fQogZnVuYyAoZWwgKkV2TGluaykgZnJvbUMoY2VsICpDLmxpYnhsX2V2X2xpbmspIGVycm9y
ICAgICAgeyByZXR1cm4gbmlsIH0KIGZ1bmMgKGVsICpFdkxpbmspIHRvQygpIChjZWwgQy5saWJ4
bF9ldl9saW5rLCBlcnIgZXJyb3IpIHsgcmV0dXJuIH0KIAorLy8gQ3B1aWRQb2xpY3lMaXN0IHJl
cHJlc2VudHMgYSBsaWJ4bF9jcHVpZF9wb2xpY3lfbGlzdC4KK3R5cGUgQ3B1aWRQb2xpY3lMaXN0
IHN0cnVjdCB7CisJdmFsICpDLmxpYnhsX2NwdWlkX3BvbGljeV9saXN0Cit9CisKK2Z1bmMgKGNw
bCAqQ3B1aWRQb2xpY3lMaXN0KSBmcm9tQyhjY3BsICpDLmxpYnhsX2NwdWlkX3BvbGljeV9saXN0
KSBlcnJvciB7CisJY3BsLnZhbCA9IGNjcGwKKwlyZXR1cm4gbmlsCit9CisKK2Z1bmMgKGNwbCAq
Q3B1aWRQb2xpY3lMaXN0KSB0b0MoKSAoQy5saWJ4bF9jcHVpZF9wb2xpY3lfbGlzdCwgZXJyb3Ip
IHsKKwlpZiBjcGwudmFsID09IG5pbCB7CisJCXZhciBjIEMubGlieGxfY3B1aWRfcG9saWN5X2xp
c3QKKwkJcmV0dXJuIGMsIG5pbAorCX0KKwljY3BsIDo9ICgqQy5saWJ4bF9jcHVpZF9wb2xpY3lf
bGlzdCkodW5zYWZlLlBvaW50ZXIoY3BsLnZhbCkpCisKKwlyZXR1cm4gKmNjcGwsIG5pbAorfQor
CiB0eXBlIENvbnRleHQgc3RydWN0IHsKIAljdHggICAgKkMubGlieGxfY3R4CiAJbG9nZ2VyICpD
LnhlbnRvb2xsb2dfbG9nZ2VyX3N0ZGlvc3RyZWFtCi0tIAoyLjE5LjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

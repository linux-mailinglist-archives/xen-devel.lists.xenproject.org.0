Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E26BCE712
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 17:16:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHUiX-0007L8-IE; Mon, 07 Oct 2019 15:14:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0SFq=YA=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iHUiV-0007Jr-PU
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 15:14:31 +0000
X-Inumbo-ID: 0750196e-e915-11e9-96dc-bc764e2007e4
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0750196e-e915-11e9-96dc-bc764e2007e4;
 Mon, 07 Oct 2019 15:13:33 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id f16so12889286qkl.9
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2019 08:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FF8EHtJTUabvw0XIHNU02Jl2jqTcH6xTb18CUG7t3co=;
 b=XITvf6FN9UaQrSkUQiq9iTANBLu87Vbbaa4GwfojEU6fQLIxM38uVMp3Vt3ke96E24
 1P6uBU79bCrfKZ+QVcitiS9whqTYwu4uw7w7SASJqB0vPzZx69OZk/xkLIIRrMNjW6nv
 1BTnpA1YK14Xrh7GUJrQVa7rjXYjdYpRIdd55BPD7gq0SNAJelCQJt9ZQpgEMxJHWtvk
 X7wOkrE2nC+lzx+fTAhKVCsUnr+JHk5TDt50rOXTT+/oCwjlmSVJh+iJZnR2GXiPog1g
 UmSkenS9sMUVCjQILwpu8IFP/27HpCXp641vF44PIEOgpSSpuLQ/Uj35uarSdg4v+8dY
 cT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FF8EHtJTUabvw0XIHNU02Jl2jqTcH6xTb18CUG7t3co=;
 b=I1DqlLLx6zBpvW+EypKDQ5WK2LVCgFhrG1uYnh/85MgY8nfj2okftOLy+ImZLJK9Yz
 /qw7R7WC6Ksa1HpZNKJRqFHxiBfuigI2LQvNi5HEG2wP96uYziIA6S/HboFDSvO4GDwk
 WxXlWIWpTVLt0L5RdKnUfFQ+i1LHQgFCj//WCRR+UZ8Cdiw3rmrv9PUSLg4M3bKh22WB
 xQ4Gm4XW98FZUFq9Sd9otGkV1Dnks71iDqRQPw9fuzdF5bK28cXAiyXsX9stSSA0X9rv
 ZTvuvIgGyXIUmqj3yhYXOT0GDfDVZLN0dKTDnLuMhZ4wb4I4hQYPbJ9i2zypFrxqP9T0
 kTtA==
X-Gm-Message-State: APjAAAVBb3b5FVXLdTmSP8MulBXM7JZxYh/vMQVbsdy6GVLouG5/eVwB
 uKM2y0+fQt6NIjN80t6LPGyrngRZ
X-Google-Smtp-Source: APXvYqypPWtX/KW2owI6ub38bsqRJp5jwCyF02CWbk6ZM94gstZqcYx+9qHP4GBDIiXQ/ggGlXccZw==
X-Received: by 2002:ae9:e20f:: with SMTP id c15mr23407620qkc.122.1570461213211; 
 Mon, 07 Oct 2019 08:13:33 -0700 (PDT)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id c185sm8354313qkg.74.2019.10.07.08.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 08:13:32 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  7 Oct 2019 11:13:02 -0400
Message-Id: <1a70b780cb940fcebd2888d0353cc0fcba388174.1570456846.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1570456846.git.rosbrookn@ainfosec.com>
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 15/24] golang/xenlight: remove no-longer used
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
Ynk6IE5pY2sgUm9zYnJvb2sgPHJvc2Jyb29rbkBhaW5mb3NlYy5jb20+Ci0tLQpDYzogR2Vvcmdl
IER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5q
YWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKIHRvb2xzL2dv
bGFuZy94ZW5saWdodC94ZW5saWdodC5nbyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbyBi
L3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbwppbmRleCAwYWRiMTJkMWJmLi5mOTFj
MGQyYmUyIDEwMDY0NAotLS0gYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KKysr
IGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCkBAIC04Myw4ICs4Myw2IEBAIHR5
cGUgRG9taWQgdWludDMyCiAvLyBEZXZpZCBpcyBhIGRldmljZSBJRC4KIHR5cGUgRGV2aWQgaW50
CiAKLXR5cGUgTWVtS0IgdWludDY0Ci0KIC8vIFV1aWQgaXMgYSBkb21haW4gVVVJRC4KIHR5cGUg
VXVpZCBbMTZdYnl0ZQogCi0tIAoyLjE5LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

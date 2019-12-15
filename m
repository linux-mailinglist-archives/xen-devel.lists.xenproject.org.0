Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 652BC11FAD1
	for <lists+xen-devel@lfdr.de>; Sun, 15 Dec 2019 20:45:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igZly-0001OS-2a; Sun, 15 Dec 2019 19:41:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tCJy=2F=netronome.com=jakub.kicinski@srs-us1.protection.inumbo.net>)
 id 1igZlw-0001ON-BI
 for xen-devel@lists.xenproject.org; Sun, 15 Dec 2019 19:41:44 +0000
X-Inumbo-ID: ec110e8a-1f72-11ea-a1e1-bc764e2007e4
Received: from mail-pg1-x541.google.com (unknown [2607:f8b0:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec110e8a-1f72-11ea-a1e1-bc764e2007e4;
 Sun, 15 Dec 2019 19:41:43 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id k3so2416284pgc.3
 for <xen-devel@lists.xenproject.org>; Sun, 15 Dec 2019 11:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=Lji5rc5oRoeIVgFMKgJ1S6HCLAhlBppwFI0mo3XGwLs=;
 b=ABd2KxBCvCtitidd4X4lyO6QmLU1Kn3vuhoxh34gkyCub4ef0LpMK0y9bF6EjUThTr
 lSFSktVMOlEGp+3Xv+04QrPZrToUoHTATF3iPyji9FtfF/oIHSa5sBmNv2eVYyw80p3o
 usnhp7w9qrDytJVz/d+DGB74auilmBYm9Q3HFxDWyu/WDHvMeJm4tzRFGtS5RcJuijQp
 ELg8hRXW0Xu/5dPhVik09K81H+uoPi7120FYTPFckBcv7fdV79BDiLRxlfjd7jUDriyu
 vdgX71UqETiKAAqUfF+jhjYxe65wsWMfDOXE37lum2s2xVktdVZjdWjx7sII6CEw4fE1
 CDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=Lji5rc5oRoeIVgFMKgJ1S6HCLAhlBppwFI0mo3XGwLs=;
 b=N7QjgrKVMYrBQ5AjBU3NEp+ZQFgGZf6s4jL6DqM1Cj8wrTvoTwYlXL84SjGxpalX4U
 UHz+Mx8VpFlgEPpzVy2wzidsc4vffD+5zMnJQDlffJHZnAS0plHEd211vsafBIQq8D5o
 KKYdXpZlFNPYT1862xnagkPuO15qAGYwCTFqgizVnC+viiN8RlKjsScDiq71Umacegcg
 NTc9gFPaVAhnCzuc+jqDco05Mye1uUUOiF3ZoVgPB7zum9pB0hM8Z2+VKcFLX0aGsLFu
 3m/ighLe310x5eZRH7jb0BKKVecFciIonQfyq4VrvZ2XtgwYk3GBPDjGKC6yscMNSJ/t
 3vfw==
X-Gm-Message-State: APjAAAVE/gfM8Mu2dKr9hjkP5UbWEwsP42Ke9nHckdb8j4y8PMHtJKpX
 XFAKJHp3tOXz5YKoJ6+YhQoOnw==
X-Google-Smtp-Source: APXvYqwO1kxy24gYDG8jZH6lc+wfwsq1T/YgDVVyLVhgAtpGNCuID54ncQaY4dC2vFzHwxjn0oPlwg==
X-Received: by 2002:a63:cb09:: with SMTP id p9mr10771521pgg.105.1576438903199; 
 Sun, 15 Dec 2019 11:41:43 -0800 (PST)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net.
 [73.202.202.92])
 by smtp.gmail.com with ESMTPSA id j22sm16335515pji.16.2019.12.15.11.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2019 11:41:43 -0800 (PST)
Date: Sun, 15 Dec 2019 11:41:39 -0800
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20191215114139.34f0d24e@cakuba.netronome.com>
In-Reply-To: <20191213132040.21446-1-pdurrant@amazon.com>
References: <20191213132040.21446-1-pdurrant@amazon.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH net v2] xen-netback: avoid race that can
 lead to NULL pointer dereference
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAxMyBEZWMgMjAxOSAxMzoyMDo0MCArMDAwMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+
IEluIGZ1bmN0aW9uIHhlbnZpZl9kaXNjb25uZWN0X3F1ZXVlKCksIHRoZSB2YWx1ZSBvZiBxdWV1
ZS0+cnhfaXJxIGlzCj4gemVyb2VkICpiZWZvcmUqIHF1ZXVlLT50YXNrIGlzIHN0b3BwZWQuIFVu
Zm9ydHVuYXRlbHkgdGhhdCB0YXNrIG1heSBjYWxsCj4gbm90aWZ5X3JlbW90ZV92aWFfaXJxKHF1
ZXVlLT5yeF9pcnEpIGFuZCBjYWxsaW5nIHRoYXQgZnVuY3Rpb24gd2l0aCBhCj4gemVybyB2YWx1
ZSByZXN1bHRzIGluIGEgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGluIGV2dGNobl9mcm9tX2ly
cSgpLgo+IAo+IFRoaXMgcGF0Y2ggc2ltcGx5IHJlLW9yZGVycyB0aGluZ3MsIHN0b3BwaW5nIGFs
bCB0YXNrcyBiZWZvcmUgemVyby1pbmcgdGhlCj4gaXJxIHZhbHVlcywgdGhlcmVieSBhdm9pZGlu
ZyB0aGUgcG9zc2liaWxpdHkgb2YgdGhlIHJhY2UuCj4gCj4gRml4ZXM6IDJhYzA2MWNlOTdmNCAo
Inhlbi9uZXRiYWNrOiBjbGVhbnVwIGluaXQgYW5kIGRlaW5pdCBjb2RlIikKPiBTaWduZWQtb2Zm
LWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Cgo+IHYyOgo+ICAtIEFkZCAn
Rml4ZXMnIHRhZyBhbmQgcmUtd29yayBjb21taXQgY29tbWVudAoKSSd2ZSBhZGRlZCBXZWkncyBB
Y2sgZnJvbSB2MSwgaWYgdGhlIGNvZGUgZG9lc24ndCBjaGFuZ2Ugc3Vic3RhbnRpYWxseQpwbGVh
c2Uga2VlcCBwZW9wbGUncyBBY2tzLgoKQXBwbGllZCwgdGhhbmtzLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D70CF143486
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 00:45:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itgfx-0002YD-Qd; Mon, 20 Jan 2020 23:41:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JMHZ=3J=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1itgfv-0002Y4-Lt
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 23:41:43 +0000
X-Inumbo-ID: 69637fbc-3bde-11ea-b833-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69637fbc-3bde-11ea-b833-bc764e2007e4;
 Mon, 20 Jan 2020 23:41:43 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 203so619758lfa.12
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2020 15:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gun8DVWITAOQuAZ6B4bWHrDAuPK69Km+G5Nnop2VKec=;
 b=jSuTmZWSapBZdi5tBKaTQuASeTrCzOPD8pzTlQYqF1HQ2d3g45MzmBwLPWF4afjpJi
 jmJHNOZ9R7Pj80DFZI7wp5SVkn6ilZHrNElUse0Iq31lEBoy7zyEn7xdJ3WFb/xZpVrP
 0BWoiUSAPjkvgzV3s6v6YuwKzNNNlfmQoz0vUdS3L5AH5Bekaub2LAH+uS0Au25vGvp2
 jUpomd+tr0bZqFUGwzT9UlwBPBzBWP0VIpB30zUDxjLNK2dxvciHniCXHVtlDSlDTrJL
 yWcp/Q4JwokDuoIBbXD7hnNy8Q/6xUgz3ep8QytWjWoW8rLobikclqRex/0uh+g04cvD
 76Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gun8DVWITAOQuAZ6B4bWHrDAuPK69Km+G5Nnop2VKec=;
 b=TWDh5wvVRfWaLSWROBtuvA1ySGMQnksovHlDsbwQX01MK6miO2fm8T77hin3lg27dy
 1qZNzW1yxfY+JeE5sKz6pfCRN+H3riTxOFYmdZ2JErNv00TU3KUidTZOA5vFRw+hUq7x
 foZsQ46Y95CD6i1+BXu66Lo8LvVgmFC3p+Wmxvv4G7Un/s+GuuvBGOWM7t54wZ+qz+5p
 FJe0XVfjRqxWkvmw1LWBzofgf51wqfcg+WQN7nNFPJgYwg8Rd6jwS4iHtThGSr5Is+CK
 ZyeWCbwCVvibSZl/aSyI/oFrwVzYwfi4ut0l8/r7qDNDvdx4714tB7l4WSd9Rl59Lu9P
 15jg==
X-Gm-Message-State: APjAAAXMMNMFLzEhG5TkNRaQOb3Ma4hsRj0zIvs1r32MH34RUFae1ien
 IRgw2iIbkKwW4DV9ytXIctNRWRASAhLqN3wlQnc=
X-Google-Smtp-Source: APXvYqzMf/MuST6Uj4Y/vRVUfCCGesDAq33ey8vQR6aVrOQ8SbaAkMTkXn4md+NQZdxy5X3WqdCHwOOcTmt0xQe93Mo=
X-Received: by 2002:ac2:43c6:: with SMTP id u6mr926921lfl.191.1579563702196;
 Mon, 20 Jan 2020 15:41:42 -0800 (PST)
MIME-Version: 1.0
References: <20200117155734.1067550-1-george.dunlap@citrix.com>
 <20200117155734.1067550-5-george.dunlap@citrix.com>
In-Reply-To: <20200117155734.1067550-5-george.dunlap@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Mon, 20 Jan 2020 18:41:30 -0500
Message-ID: <CAEBZRSeChqy9QTDccEu_caRG2CkryPKHBsXbQ+tmQ3RgP2LNVw@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v3 5/8] golang/xenlight: Default loglevel to
 DEBUG until we get everything working
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
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBUaGUgb3RoZXIgb3B0aW9uIHdvdWxkIGJlIHRvIGV4cG9zZSB0aGUgWFRMIGxvZ2dpbmcgbGV2
ZWxzIGFuZCBsZXQgdGhlCj4gY2FsbGVyIHNldCB0aGVtIHNvbWVob3cuCkkgdGhpbmsgdGhpcyBp
cyBmaW5lIGZvciBub3cuCgpGb3IgdGhlIGZ1dHVyZSwgSSBsaWtlIHVzaW5nIHRoZSAiZnVuY3Rp
b25hbCBvcHRpb24iIHBhdHRlcm4gZm9yIHRoaXMKc29ydCBvZiB0aGluZy4gVGhhdCB3YXksIGlm
IGEgdXNlciB3YW50ZWQgdG8gc2V0IGEgbm9uLWRlZmF1bHQgbG9nCmxldmVsLCB0aGV5IGNvdWxk
IGRvOgoKY3R4LCBlcnIgOj0geGVubGlnaHQuTmV3Q29udGV4dCh4ZW5saWdodC5XaXRoTG9nTGV2
ZWwobHZsKSkKCmJ1dCBpZiB0aGV5IGRvIG5vdCBuZWVkIHRvIHNwZWNpZnkgYW55IG9wdGlvbnMs
IGl0J3Mgc3RpbGwganVzdDoKCmN0eCwgZXJyIDo9IHhlbmxpZ2h0Lk5ld0NvbnRleHQoKQoKLU5S
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4C014347B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 00:35:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itgVa-0001Rm-Ox; Mon, 20 Jan 2020 23:31:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JMHZ=3J=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1itgVY-0001Rh-Mf
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 23:31:00 +0000
X-Inumbo-ID: e9f6a16a-3bdc-11ea-b833-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9f6a16a-3bdc-11ea-b833-bc764e2007e4;
 Mon, 20 Jan 2020 23:31:00 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id m30so618441lfp.8
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2020 15:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xSHRyoKndeBoBKuibyARnmMeQVtNyFBkBI1T0U19sLE=;
 b=m2s69evXFTzP0NcFZ65QrkIpWvkaROoia4f+IWCoZ1qtFAOLQnghDoxBACW/5tRe03
 zESCtHYxnHvi8TwAIU9g5A+ouFVoHXJsHvn58OulFGsosyuikgD3nd30my+gc4q6NAn8
 sdXh9Z4FDxhmYIFmFcKvIe7a0zPb+WF6rmBnX30/PrhCaW1F0wc0lnlJTGA0ND5TcP/A
 fo3msW0iEYvj+++7jJobHdQrxze8P7GCLqwjVDjjqZbYJzutzsc4u8a3b+47jLEfprT4
 aHpKvM6qdAlkBEQLntIcBkR0zbaqAJ3T/Wv4b56qbptENYnLvotadTVhodWLcMH6WjJe
 mnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xSHRyoKndeBoBKuibyARnmMeQVtNyFBkBI1T0U19sLE=;
 b=C7jaexO4HUfCS/4OaRYU+TsFHoAkBpkKcgnhlrQU6/i9C0ZK/qB1UVlbkyDcj22qxP
 wuuN6W3dvv6/Wrao+IwJUM2gd7AbKW+hQ7/C1G5rCQaCXqo0E57jwMohivNLF7nyLlpA
 PDpls3xrI6R4VRklgZVDbI1XndRQq0PSSVDK/bztpdq3IbIWsZLRf6rektIzzFAeAPYT
 jwQiiO0M9hvEx8/iThDpjqjGX5LOkcwycSb3hbxUbkM3rPYLJU91IrmkIk2PPJl7ipdw
 vVIwsMbxTj+SsC5fojTrtC11RE2IXikpz4C8BOxj0iORKifdl7WxcObocHE8lj1IoPJO
 H4jw==
X-Gm-Message-State: APjAAAU2kl54YeApJmmaYfDPTwF1J1JkSrR6HgyY9WPz222eTs4wo+g3
 gksVu/cuBMc/XOXG7TDIildpKcyjwYr1pxD6Vgs=
X-Google-Smtp-Source: APXvYqwdxpL5YwueAcEjPLI16TTGOBbFa5e4Z57kt1b7lVZu8TM+WD0aGEQusopltAiQ6fu69ZgOkQSLflAZ36cFm70=
X-Received: by 2002:ac2:5a43:: with SMTP id r3mr931021lfn.150.1579563058796;
 Mon, 20 Jan 2020 15:30:58 -0800 (PST)
MIME-Version: 1.0
References: <20200117155734.1067550-1-george.dunlap@citrix.com>
 <20200117155734.1067550-2-george.dunlap@citrix.com>
In-Reply-To: <20200117155734.1067550-2-george.dunlap@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Mon, 20 Jan 2020 18:30:46 -0500
Message-ID: <CAEBZRSdYL2W=HQG_bNJyRuG1LcGzz1d781thKiHxhyvrrhxVhw@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v3 2/8] go/xenlight: Fix CpuidPoliclyList
 conversion
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

PiBFbXB0eSBHbyBzdHJpbmdzIHNob3VsZCBiZSBjb252ZXJ0ZWQgdG8gYG5pbGAgbGlieGxfY3B1
aWRfcG9saWN5X2xpc3Q7Cj4gb3RoZXJ3aXNlIGxpYnhsX2NwdWlkX3BhcnNlX2NvbmZpZyBnZXRz
IGNvbmZ1c2VkLgo+Cj4gQWxzbywgbGlieGxfY3B1aWRfcG9saWN5X2xpc3QgcmV0dXJucyBhIHdl
aXJkIGVycm9yLCBub3QgYSAibm9ybWFsIgo+IGxpYnhsIGVycm9yOyBpZiBpdCByZXR1cm5zIG9u
ZSBvZiB0aGVzZSBub24tc3RhbmRhcmQgZXJyb3JzLCBjb252ZXJ0Cj4gaXQgdG8gRXJyb3JJbnZh
bC4KPgo+IEZpbmFsbHksIG1ha2UgdGhlIGZyb21DKCkgbWV0aG9kIHRha2UgYSBwb2ludGVyLCBh
bmQgc2V0IHRoZSB2YWx1ZSBvZgo+IENwdWlkUG9saWN5TGlzdCBzdWNoIHRoYXQgaXQgd2lsbCBn
ZW5lcmF0ZSBhIHZhbGlkIENwdWlkUG9saWN5TGlzdCBpbgo+IHJlc3BvbnNlLgo+Cj4gU2lnbmVk
LW9mZi1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgpSZXZpZXdl
ZC1ieTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

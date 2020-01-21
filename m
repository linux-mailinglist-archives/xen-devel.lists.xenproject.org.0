Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1671445EB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 21:28:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu06B-0002Gg-Es; Tue, 21 Jan 2020 20:26:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bw8Q=3K=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1iu069-0002GW-IF
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 20:26:05 +0000
X-Inumbo-ID: 3f46073c-3c8c-11ea-b833-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f46073c-3c8c-11ea-b833-bc764e2007e4;
 Tue, 21 Jan 2020 20:26:05 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id v201so3396865lfa.11
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 12:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QdX6itrOk0jvT+VRkJGsqyhr7QyPCVcUCe0CwJ1alr8=;
 b=V+iXPSfvX/z1LhAeMSvCku8paz731BmqPov5lwpDZSywSqunHtQp+q6brbFXsEkYET
 qDyGatxwcT6FnK9aRBohAl/YnQzhhfN+/z+qnUjMzupLA+ljleVNq1/3XoxCoRvOK2Oo
 shPc4aHI7Z0TZLlu/n/lbQAx4HoFTtK5TWOoD0yKSclqL65CoUp0M7ju81C919qQYODx
 9YZMGXWiHBTQwr0NVb8sccmoSME0wEiMx7xbNnVaGwh/EI5HBrhIvq9zWtqYdFQBRZ44
 n7BWE3RQiXhfnD9/CDQHjhyhoEVPKo+4CQXuHuG16g6svVUwLLX6i7O247qLpARUcy91
 d6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QdX6itrOk0jvT+VRkJGsqyhr7QyPCVcUCe0CwJ1alr8=;
 b=meJMVyPl1WKVA+9wv76WnzDtHIHkUBYfWQBP75jkzJzeuZLzKxTz4vGIBcjj2cCLYw
 rLfg80iMobFLl44D/+JYvsfKf3SsJxDJqPxadJcc1POXmvcTrrMOVAGjWnZxuEA08ygl
 /akZJNPH+/xANmpz/DL46+pPksifq1FuarISiAsjBTQs/vLXzbzTW4GKgUsuLrVlWwNK
 4aJ8ouFDSP24zU9QcigrBP3maeipTOEHikJJkqnraXPBKA+lw94iEp4DEhgAN7nIcJ2u
 dTB+m9gccGwPPbjyMhwSm/3QcjUYEahsu+t8rGbqMvvnOO/cScFZ/+W3AG6z8P/vKpW2
 MUJQ==
X-Gm-Message-State: APjAAAXxsRvduqdHMrJ2VV+CRmFbzw3bsDlQKWFYqFc8kmCRtnbveHZh
 VuWqL8HgRbzgHXpdJrJrlYBYbRtKjQKzuRtVJ3w=
X-Google-Smtp-Source: APXvYqwONdHEWctLK9j56lj9ZGKVKlm4pvaq0x/ZbxgTPwipPQI0ZKaJaFfpX2jqZwOkQOZhQ3Y3yUgWFdPNLvG9xVY=
X-Received: by 2002:ac2:44a2:: with SMTP id c2mr3657676lfm.105.1579638363921; 
 Tue, 21 Jan 2020 12:26:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <13e463d7e4e797a215e8f2c5437a9499af6fd92c.1579055705.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <13e463d7e4e797a215e8f2c5437a9499af6fd92c.1579055705.git-series.marmarek@invisiblethingslab.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 21 Jan 2020 15:25:52 -0500
Message-ID: <CAKf6xpvmU7E9TABDuMg6L9GEk8cR89We=BGw=po+xh2Z3CnXdA@mail.gmail.com>
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [Xen-devel] [PATCH v4 16/16] libxl: consider also qemu in
 stubdomain in libxl__dm_active check
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMTQsIDIwMjAgYXQgOTo0MiBQTSBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kKPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+Cj4gU2luY2UgcWVt
dS14ZW4gY2FuIG5vdyBydW4gaW4gc3R1YmRvbWFpbiB0b28sIGhhbmRsZSB0aGlzIGNhc2Ugd2hl
bgo+IGNoZWNraW5nIGl0J3Mgc3RhdGUgdG9vLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgTWFy
Y3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPgoKUmV2
aWV3ZWQtYnk6IEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNvbT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

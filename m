Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5367A148EEC
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 20:54:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iv4zJ-0003gw-Vn; Fri, 24 Jan 2020 19:51:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=266H=3N=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iv4zI-0003gr-RP
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 19:51:28 +0000
X-Inumbo-ID: e8b8cdb0-3ee2-11ea-b833-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8b8cdb0-3ee2-11ea-b833-bc764e2007e4;
 Fri, 24 Jan 2020 19:51:28 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y4so3849252ljj.9
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2020 11:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2sKriZ+jWK16hqLM0/Fb5NGaA3aBvQtRUHo7u+XbYXI=;
 b=t1OeCYbBgVznYSMAUeD7PjVNiiVUdoi4B20iqkbCWmeGYbDANxCVLg8uWIcPAB+DLy
 23iD81RRjvM/hFZJTGoi0htnoW8Yput6GOI4zvHt4Q1xo5yiMrxlE86MlwUj3Xn3sxTX
 cp5l9MQ1pRfh5DQrs4ZW77l3PgMJ69Up3B3ioSHTrSEdoxZN+4mD+Vw1ALq3JauPgw47
 hwixt21iIQmd5U983HthL0LVhNrcrY2sJYABLI4jiuhN0tekFw2WnpbJtcYUCjctWgS1
 Dib7sNzdkI6CtXBP9l91FDMxhgtWap0Wg0Wl1nnfmvj1GBb3mEJtaVJlSr1l+K0aXf1C
 gV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2sKriZ+jWK16hqLM0/Fb5NGaA3aBvQtRUHo7u+XbYXI=;
 b=JN/vT+mwl2Mz/pqjUuOd7M764ycBbmBXsEGBUIZBIVI7gHX0mKncJLcb/aZnJB/pGk
 +quJ1ZJNBOpwRCiTilUnQ9Qx6dhT9fIgvU+c77ESk3ay2uJ+6gZ3U3mqx017ITaHctmy
 ofwguyjQq+esCgCuUJWjSDU/9N2JLcecv6G7hhoDmX/qWQEz8R4DJnM1eZ6Q/taqplbq
 K2axaD3hOw4OpSfyu8EcURoeGDDxWhdAyrwrUBL+WYhp5bihYiVSfFfkSOXGnfMjRksU
 /UyvDOXoRF77hwK6LuSWkDCi1gvG49EeuUvlVOaXFzK7UBm4mqq1aM/zaKRuJD2JF8Jg
 PRqg==
X-Gm-Message-State: APjAAAXSDMzGw3HiyuKMEoPQ29MDbuBiATtkSeOZgEYcdYb7vjwCQePC
 0CuRl/caPjxa8L+yRPJwztOEIzqiGMbd818GHmo=
X-Google-Smtp-Source: APXvYqzciC2xnyegRMd0ZrwglmD6ILkz3yR2c/sZjxJAR2swmQj5uRo9kNyNBQpmkyUwndyHnBEnvIxcbsQ/qledawQ=
X-Received: by 2002:a2e:9a51:: with SMTP id k17mr2974982ljj.206.1579895487126; 
 Fri, 24 Jan 2020 11:51:27 -0800 (PST)
MIME-Version: 1.0
References: <20200117155734.1067550-1-george.dunlap@citrix.com>
 <20200117155734.1067550-5-george.dunlap@citrix.com>
 <CAEBZRSeChqy9QTDccEu_caRG2CkryPKHBsXbQ+tmQ3RgP2LNVw@mail.gmail.com>
 <C58CCF43-A9B8-4B2A-A90C-59B74603D8EA@citrix.com>
In-Reply-To: <C58CCF43-A9B8-4B2A-A90C-59B74603D8EA@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Fri, 24 Jan 2020 14:51:16 -0500
Message-ID: <CAEBZRSd49qcmqyG4rL1q49AoK1S+1wT9bdrirrVi_iVufrSycA@mail.gmail.com>
To: George Dunlap <George.Dunlap@citrix.com>
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

PiBCdXQgcmVhbGx5LCB3ZSBuZWVkIGEgd2F5IHRvIGFjdHVhbGx5IGNyZWF0ZSBhIGxvZ2dlciBw
cm9wZXJseS4gIEFwcGFyZW50bHkgb25lIHRoaW5nIGxpYnZpcnQgZG9lcyBpcyB0byBjcmVhdGUg
YSBsb2dnZXIgdG8gYSBmaWxlIGZvciBlYWNoIGd1ZXN0LiAgVGhhdOKAmXMgc29tZXRoaW5nIG91
ciBwYWNrYWdlIHVzZXJzICBtaWdodCB3YW50IHRvIGRvIGF0IHNvbWUgcG9pbnQuCgpZZXMsIEkg
dGhpbmsgcGFja2FnZSB1c2VycyB3aWxsIHdhbnQgbG9nZ2luZyB0byBiZSBwcmV0dHkgZmxleGli
bGUuIEkKdGhpbmsgd2UgY2FuIGNvdmVyIG1vc3Qgb2YgdGhvc2UgY2FzZXMgd2l0aCBDb250ZXh0
IG9wdGlvbnMsIG9yIG1heWJlCndlIG1ha2UgYSBMb2dnZXIgdHlwZSB0aGF0IHByb3ZpZGVzIGFu
IGFic3RyYWN0aW9uIGZvciBYVEwuCgotTlIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=

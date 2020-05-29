Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B5E1E8375
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 18:18:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jehiC-0005Br-A0; Fri, 29 May 2020 16:18:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U2UY=7L=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jehiB-0005Bm-3w
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 16:18:23 +0000
X-Inumbo-ID: 03f6fc76-a1c8-11ea-9dbe-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03f6fc76-a1c8-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 16:18:22 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id m21so2128233eds.13
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2020 09:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mbMuxJHVPAc7Wx25YihDuP2TpUDE5CiHWoqylZyuUYQ=;
 b=j6uuToaoEO44uxSdHBmKJZUIdlCUIM7YnjCwnm+5yfMyNqC+LHKN2V7aUk5NRN4pMt
 lrzaVozgncjjNnwd3HLbbaz5R/7lACk7mBF3DgA7lq2LDWjXOx+oMpDmYAHYwOJj6F5k
 JmyHZv0DzWX84QN7eYxzWHmIhytTJbSKb0ix6DJysst2toyJiL/VhBGupI7S30vdA9BY
 I35bWsasMG8kEffFPmvFl1MkZ457/hIJOP7iuvfb8d2pwjPM+jHQPWMi5YuOB/Qyl8F/
 G/796pMgd0tO8QXRa3twQL1il6qkkLsZZ+M5KjfDXC8bDjP6WF4hHiEla7s23vR7wE61
 VTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mbMuxJHVPAc7Wx25YihDuP2TpUDE5CiHWoqylZyuUYQ=;
 b=I4ICNI6jSeGtQ9mcxZiepLcMerbB4JzInryxt38GHJ5Ur7NP7pAExwy1TJen8Ou638
 ck+3oEaHOfUenuz6FTWYtkbSmnJVTb6EfzBndSJG4XPgLhzttxGkZHpXQD5yJXCR3sD9
 +cUNT7oCRhwHjo12ccWEUtn9yd8Us0IcaN+rDo3+A0di8QR8IYLdYJoO6dMbeOXj9MGI
 qDWFoiJTGQd1pKMsVr9ahRcPFK07XtiOw3Dq3/4pEfXBZUGO2BDN7MJP2ccSy5b/85ac
 3MYoYuuf9j5/yB3f9reURxbDZTmsDbEjFllvPmz5idAGM1dSm/B1uwBduJHTNbQQO5Yc
 henQ==
X-Gm-Message-State: AOAM531nC7qcuZ5bmxJZoUXnF8iRt/c4thfOhoEBYAfeWGPgm5UKEUFH
 khzDzp5lrMicSYg9ZeXwAVF5S9iAM/I=
X-Google-Smtp-Source: ABdhPJwQz42PMmtDccUntyHIAsoraoBhP75XfY12Sgkd4yJ94+Jjs2/881q4KhZf+UPOOFn8kk6mCw==
X-Received: by 2002:a05:6402:1770:: with SMTP id
 da16mr8774636edb.122.1590769101539; 
 Fri, 29 May 2020 09:18:21 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46])
 by smtp.gmail.com with ESMTPSA id r18sm6009683eds.29.2020.05.29.09.18.21
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2020 09:18:21 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id j10so4300149wrw.8
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2020 09:18:21 -0700 (PDT)
X-Received: by 2002:adf:e648:: with SMTP id b8mr9718468wrn.386.1590769100791; 
 Fri, 29 May 2020 09:18:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200529160621.3123-1-tamas@tklengyel.com>
 <69225f69-3ca0-c759-03a5-60d6464a7eb4@citrix.com>
In-Reply-To: <69225f69-3ca0-c759-03a5-60d6464a7eb4@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 29 May 2020 10:17:45 -0600
X-Gmail-Original-Message-ID: <CABfawhkeo+5t+ofGs25pzVhR0RO6QYaYQbQv0f-baB+i9uAOxg@mail.gmail.com>
Message-ID: <CABfawhkeo+5t+ofGs25pzVhR0RO6QYaYQbQv0f-baB+i9uAOxg@mail.gmail.com>
Subject: Re: [PATCH for-4.14] tools/libxl: fix setting altp2m param broken by
 1e9bc407cf0
To: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 29, 2020 at 10:15 AM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 29/05/2020 17:06, Tamas K Lengyel wrote:
> > The patch 1e9bc407cf0 mistakenly converted the altp2m config option to a
> > boolean. This is incorrect and breaks external-only usecases of altp2m that
> > is set with a value of 2.
> >
> > Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
>
> Urg yes.  Sorry.
>
> However, this doesn't build because there is another use of the altp2m
> variable between the two hunks below, for compatiblity with the older
> altp2mhvm option.

Eh, so much for hastily sending a patch with last minute changes.

>
> I think changing its type just to int out to suffice?

Indeed, that would work as well. Let me just resend with that.

Tamas


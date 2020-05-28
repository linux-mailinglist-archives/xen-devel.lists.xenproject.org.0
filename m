Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B3B1E5451
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 05:01:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1je8mA-0003qG-5m; Thu, 28 May 2020 03:00:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=reLY=7K=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1je8m8-0003qB-Hs
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 03:00:08 +0000
X-Inumbo-ID: 560e2500-a08f-11ea-9dbe-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 560e2500-a08f-11ea-9dbe-bc764e2007e4;
 Thu, 28 May 2020 03:00:07 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id q2so31462410ljm.10
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2020 20:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=39PNVTFoufuahtg+OEmF+7P6d2E+Q8LB1HHd8dgo6c4=;
 b=dIsS5pv9ldHUSyqQhe3PuZSdaE0qiOZWJMyINANYtoqGNFnmQltwY3csbDkrHh+aP9
 +dt4ka1TYkezdbz+D96x0oeIDnL/d9z03/9uks4+EtGoLIE0/r0Y9/qpyT0ObBxlSg1y
 q84PZgTYaA00SGpWKfg2Fy6tF7++KCYUxLWY67kQUDpVfPTVpQg0tNCwCYa7KcejoAX3
 ySQPewQakA0kO2JqS/NXueVhMOWkm9hGD3EsKRXQvMEXExqToO6L5/O0yxF0hzVSxLgG
 9BgBXtV1CCvdSNvuS5s7FUiNcKTjqupyWbRWLvhVvWKh9t08RvUbKtI7ukitTz3knkeR
 6yUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=39PNVTFoufuahtg+OEmF+7P6d2E+Q8LB1HHd8dgo6c4=;
 b=pBr+3R4BX3uHYDkInKfYZ1xtsZEpX8ni6XN2NsKL1d3DzDunnMXmJX9KZabzG0YChA
 o7BKh58K0b0YXZ4XPG5YyBZHmGSncHvhIC/aMBSFyq+fqStmmaJb46MoFZXGhP5gzKZ4
 vXOvshJBcrF+vkqL3FQp14LLUxObkuho09WcSlSG/+c00FkUgMIh/K7uTclc7eFB8mHA
 ZlvtZWIjvBeX8ADxx4rJhoZIqoYfqDy30LnnikPSgzwmVCf5Ocb3wTQ75X/uW+weEmyE
 PA8FcdvngchHUkNGgnmZ6eKHJ+X7MYPrtW8e92srHXoae9CbHJOO+jdI4MbcpJKhYgWK
 G/Fw==
X-Gm-Message-State: AOAM530fECdkGAVi5JD0QrL17Uj/qkfMZ8wtbH7UaNeY6PNWajB3Tc3k
 UH6S25br6JB7QVmV2lw4lkEvj2v3GrDrtXg3AaKUAA==
X-Google-Smtp-Source: ABdhPJzhtr+pUC1bNj4/UXGUaxlVw+mPgImwreR0E/xW9PJZu/vgSIHbUAEZlEuc1iyCE2QZCpi8roDGRUscuipbofY=
X-Received: by 2002:a2e:7f04:: with SMTP id a4mr381146ljd.114.1590634806613;
 Wed, 27 May 2020 20:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200525024955.225415-1-jandryuk@gmail.com>
 <CAKf6xpvRxeUdOOogacDvncC3yogcTN4gALVWO+V8ZJ8x__RafA@mail.gmail.com>
In-Reply-To: <CAKf6xpvRxeUdOOogacDvncC3yogcTN4gALVWO+V8ZJ8x__RafA@mail.gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 27 May 2020 22:59:55 -0400
Message-ID: <CAKf6xps9j=bszbw5SAYeZdrGS9jP-3Hu9RCGT45ifNR6qdAX3Q@mail.gmail.com>
Subject: Re: [PATCH 0/8] Coverity fixes for vchan-socket-proxy
To: xen-devel <xen-devel@lists.xenproject.org>
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, May 25, 2020 at 6:36 PM Jason Andryuk <jandryuk@gmail.com> wrote:
>
> On Sun, May 24, 2020 at 10:50 PM Jason Andryuk <jandryuk@gmail.com> wrote:
> >
> > This series addresses some Coverity reports.  To handle closing FDs, a
> > state struct is introduced to track FDs closed in both main() and
> > data_loop().
>
> I've realized the changes here are insufficient to handle the FD
> leaks.  That is, the accept()-ed FDs need to be closed inside the for
> loop so they aren't leaked with each iteration.  I'll re-work for a
> v2.

So it turns out this series doesn't leak FDs in the for loop.  FDs are
necessarily closed down in data_loop() when the read() returns 0.  The
only returns from data_loop() are after the FDs have been closed.
data_loop() and some of the functions it calls will call exit(1) on
error, but that won't leak FDs.

Please review this series.  Sorry for the confusion.

Regards,
Jason


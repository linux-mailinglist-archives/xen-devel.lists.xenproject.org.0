Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCD91F3AB3
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 14:34:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jidRX-0003gT-0J; Tue, 09 Jun 2020 12:33:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eBKE=7W=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jidRV-0003gO-Sj
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 12:33:25 +0000
X-Inumbo-ID: 6977fb30-aa4d-11ea-8496-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6977fb30-aa4d-11ea-8496-bc764e2007e4;
 Tue, 09 Jun 2020 12:33:25 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id i27so13860923ljb.12
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 05:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=U8Eb2mLb5U/+FkB5qnpVGhGGBV1jxFTMfBhLagA3qt4=;
 b=FQcHlHxxW4ElxyJlfW3MDGdOjSJQMW5MAnSgYAxLksRJTiN4o44cSDc3i0OGM9xE9u
 0k6MvhSZq/RSEAHralDqMToAMSewtFq2/nPysTMazkjdgqJw3ajFnEnPiNze9+aHWke3
 opPyap3mAis/QMs2IkYi3X3DI94I79mqBHGAp9p6uc84zbPWpCbKiSkLA0UFIUk2kfib
 1eWQwuwD4ek3Pk37DeqAicrsInJhO4wqCJZVSE7IYt33lqnphZu4czCbKLjBIKqt9BbA
 s0ZXtkgMcdxlCwztitCOgV4EOCKvLApmGC82ztq4TDc80QtYWkIhotxQZWYUyaWdV8I7
 5GhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U8Eb2mLb5U/+FkB5qnpVGhGGBV1jxFTMfBhLagA3qt4=;
 b=PJOeN+ss/4NYqyFgnOrQ8IPAiEsGZeNnL38AuG5wOmAsU0jvvVQdBj9PrN5he5LLGb
 YyvxdlAxfXjKMzMXxNyaTJJQzAsIEqBSanPA/Wl/azQgFRDngnXHmDC7o876rvJyR/vM
 IMUgTcazUBFT1Iw9BmyKP/s2rMMXHNw0wAvh80DaMVzPet/3uevdzrixOY6edDd2exyy
 9laC31LEmQ+Ve2WpgFPiaq8HYeTDB8AWOjrrW8xZqyoYVmE2WVhG+B4FoYZdl5UAlinY
 CyO4VDm3SARH9hd3K0tCki8etgMrs6qrWYGZgm0i4bdK/vlPHYtQcEAGMnqlJF4FPkUm
 i05g==
X-Gm-Message-State: AOAM532e7hp7YK8SnaWge9wwP7/8mwB/ybHfx0cbco9VEWLPuo8f+YrZ
 2NvF5yG8fuoXTPAAOCcZtOeNqDELydtMmXzs8aNkNw==
X-Google-Smtp-Source: ABdhPJwzzj6KxQ7V7tvAausIZrT3l6YmTBYOldxoNicSCnwD56SOpdxC3+ErMoiDp00xoaMWYeDj7Oi4ioeIR4b4W5Y=
X-Received: by 2002:a2e:9a59:: with SMTP id k25mr578947ljj.114.1591706004138; 
 Tue, 09 Jun 2020 05:33:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200608072855.26589-1-olaf@aepfle.de>
 <20200608100051.16be834e.olaf@aepfle.de>
 <24286.6790.983312.672969@mariner.uk.xensource.com>
 <CAKf6xpusrQaMb3ET_HJyrreSPvvogEQORSWUG1X2H5oa-HUZiA@mail.gmail.com>
 <20200608161111.26c2cdd4.olaf@aepfle.de>
In-Reply-To: <20200608161111.26c2cdd4.olaf@aepfle.de>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 9 Jun 2020 08:33:12 -0400
Message-ID: <CAKf6xptNnyEvOu-skpf0Hh_n4d-9LpYKX_5Z7vmA5uoe4oF7Hw@mail.gmail.com>
Subject: Re: [PATCH v1] tools: fix usage of strncpy
To: Olaf Hering <olaf@aepfle.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 8, 2020 at 10:11 AM Olaf Hering <olaf@aepfle.de> wrote:
>
> Am Mon, 8 Jun 2020 08:43:50 -0400
> schrieb Jason Andryuk <jandryuk@gmail.com>:
>
> > I added a length check in this patch:
>
> gcc will not recognize such runtime checks and will (most likely) complai=
n about the strncpy usage anyway, just as it does now in libxl__prepare_soc=
kaddr_un. While the usage in libxl__prepare_sockaddr_un is fatal due to -We=
rror, libvchan is apparently built without -Werror.

gcc complaining about strncpy after the length check is unfortunate.
Do you know if gcc would complain if strcpy is used?  It would be okay
since we just checked the length.

What version of gcc are you using?  I was using 9.x and it didn't warn
from what I can remember.

Regards,
Jason


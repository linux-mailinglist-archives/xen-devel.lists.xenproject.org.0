Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A88F27C951
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 14:09:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125.265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNES6-0004zO-Io; Tue, 29 Sep 2020 12:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125.265; Tue, 29 Sep 2020 12:09:50 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNES6-0004yz-Ft; Tue, 29 Sep 2020 12:09:50 +0000
Received: by outflank-mailman (input) for mailman id 125;
 Tue, 29 Sep 2020 12:09:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p+So=DG=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1kNES4-0004yu-KG
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 12:09:48 +0000
Received: from mail-ua1-x941.google.com (unknown [2607:f8b0:4864:20::941])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a27f8076-2278-4005-8adb-1116d97f9d84;
 Tue, 29 Sep 2020 12:09:47 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id g16so3361185uan.5
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 05:09:47 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=p+So=DG=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
	id 1kNES4-0004yu-KG
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 12:09:48 +0000
X-Inumbo-ID: a27f8076-2278-4005-8adb-1116d97f9d84
Received: from mail-ua1-x941.google.com (unknown [2607:f8b0:4864:20::941])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a27f8076-2278-4005-8adb-1116d97f9d84;
	Tue, 29 Sep 2020 12:09:47 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id g16so3361185uan.5
        for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 05:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9JPwRxOZpiuGc8LaSwFRkiWTX4cPQZfECJ4CU5S5FmE=;
        b=l5BVRnMpNnf24f0Xa+xdLil3jpVOI7oRxWJKNiq+dcno64b0SXSPDQjfW3MpeNZze8
         7Ofb/GIZmArCQh3T/MVYbmc6dm3PU18dajRaJoeYtKp8w/eJKawbswcuEAXWaPRXrHxc
         44AvJx2PgrJq7YccVqY+qJO1T+7uJWAPzfXbipLO9vItl/i/a9uong7HzjGMSCFwpvTs
         ea9sJqvN+MReekCeFcorH8PKXPY8DuzPD7bxqQ/CGrEeK9aV0Cwz7F1YNzZWdhGALlxS
         YTCwMGiRKL7KMGBapK8EOOYFsw2P7VRp5Q+Acn5Ypuluu/7MIBCRYaCuo0u2DJNP4vNR
         OgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9JPwRxOZpiuGc8LaSwFRkiWTX4cPQZfECJ4CU5S5FmE=;
        b=NJ7ZPpUX7M/8BiLpMYOF6u5Toww/2mf6xyA60qL2z3lIlz5UuljQYJjGldGj54Ab6Z
         9zurwfKqJrsgwZcP1FoJyD292jfiKmOrvEmzKJ1zYliXzimm689UAj+MyQZBEDhvgDpZ
         3TXzSUBZphabioK1nudXeIpC5YZPAPYzW7Z095Q66bbN3Gz4Q7RrD4Pro0UEMqGi4i6m
         FOCUQYOSmU9xFrmXYcF484OElLUJFDyPCQxKMQx0rfqZdxSKzQ/PCpANrVeJWBMCbL7v
         0eIsDYpTeU332K5w7Qpd1GEa4ZEJhg445fUAX/tG8jn5IMACNyoSKjn5XfMMzEvVWep8
         p+IA==
X-Gm-Message-State: AOAM533oC+rLivTphxC4vqxWq9TsR5iCMbp6/bJtWA4Jq93haekDzoy6
	V5KyNVRB2vH3dFstuHQ8ZudPwv8gfK1IAXWSw6s=
X-Google-Smtp-Source: ABdhPJx1Kc802JZNGkERygyfBhPjfvFOk+klvm3rkq6LLHBMgMmSCTmhZBIAlNN3HcYU0JC8U0d3QkqVFuZFqiIttug=
X-Received: by 2002:ab0:134:: with SMTP id 49mr3343890uak.118.1601381387518;
 Tue, 29 Sep 2020 05:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <1599375114-32360-1-git-send-email-jrdr.linux@gmail.com>
 <1599375114-32360-2-git-send-email-jrdr.linux@gmail.com> <8a608871-af25-fee6-24ea-24d78010cd6c@oracle.com>
In-Reply-To: <8a608871-af25-fee6-24ea-24d78010cd6c@oracle.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Tue, 29 Sep 2020 17:39:36 +0530
Message-ID: <CAFqt6zbKdzFDq6TTadQqQhwZPsZKJLW0LE9ER-qTHm7y3raw9w@mail.gmail.com>
Subject: Re: [PATCH 2/2] xen/gntdev.c: Convert get_user_pages*() to pin_user_pages*()
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, xen-devel@lists.xenproject.org, 
	linux-kernel@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 11, 2020 at 8:12 PM <boris.ostrovsky@oracle.com> wrote:
>
>
> On 9/6/20 2:51 AM, Souptick Joarder wrote:
> > In 2019, we introduced pin_user_pages*() and now we are converting
> > get_user_pages*() to the new API as appropriate. [1] & [2] could
> > be referred for more information. This is case 5 as per document [1].
> >
> > [1] Documentation/core-api/pin_user_pages.rst
> >
> > [2] "Explicit pinning of user-space pages":
> >         https://lwn.net/Articles/807108/
> >
> > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> > Cc: John Hubbard <jhubbard@nvidia.com>
> > Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> > Cc: Juergen Gross <jgross@suse.com>
> > Cc: David Vrabel <david.vrabel@citrix.com>
>
>
> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>

Are these 2 patches queued for 5.10-rc1 ?
>
>


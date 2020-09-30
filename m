Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3D827DE61
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 04:15:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405.1198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNRdd-00029u-Cm; Wed, 30 Sep 2020 02:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405.1198; Wed, 30 Sep 2020 02:14:37 +0000
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
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNRdd-00029Y-8k; Wed, 30 Sep 2020 02:14:37 +0000
Received: by outflank-mailman (input) for mailman id 405;
 Wed, 30 Sep 2020 02:14:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5M2l=DH=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1kNRdb-00029T-6I
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 02:14:35 +0000
Received: from mail-vk1-xa42.google.com (unknown [2607:f8b0:4864:20::a42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c954a631-f1f8-4e22-84aa-6df0374e4981;
 Wed, 30 Sep 2020 02:14:29 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id c63so61054vkb.7
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 19:14:29 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5M2l=DH=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
	id 1kNRdb-00029T-6I
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 02:14:35 +0000
X-Inumbo-ID: c954a631-f1f8-4e22-84aa-6df0374e4981
Received: from mail-vk1-xa42.google.com (unknown [2607:f8b0:4864:20::a42])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c954a631-f1f8-4e22-84aa-6df0374e4981;
	Wed, 30 Sep 2020 02:14:29 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id c63so61054vkb.7
        for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 19:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JUU/C8onyKlPySCRSWT+QTeeD0ZR4lGerEsMoIi67e4=;
        b=K2WoCboVWCFeycF6Cel1OxgEYyPECxfD4z6C6iz6yw4uA4s2K9sv3S1wAWR85Vk+gG
         qg06ACp4f9siDISwnA27+75sDaZLCpNq0gCfsduvOb59OJHIsgnlhbc66FSI1OFcVOl+
         yvZLTVs2IsolT45igftD4Z0i4rhGNXjMVeFh9ARzdfLA6lblkSfQVR5letffC8THPpp6
         7psdUWlY4zZwHIZLhkdfMQku0UCt9TedPW4WgyLm/QyT6t5QFrX6nYjJ9TkO+wa3C7+d
         7kScSZb0f78h+ELxUrXK1e+D9sxGNzqbdDgSXUs0JUXoIkqYEZz0g79Tj7b2crnzr5Wi
         Lv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JUU/C8onyKlPySCRSWT+QTeeD0ZR4lGerEsMoIi67e4=;
        b=qBA/NqIffFofXuVX1EdBBIBZdSPfhdEBn+HLKv4wYJSGxEFnvBadRJG0nvMeDes1jY
         VgadPxl4J9uT7Zvt7o9wT+uG11r7sooDeaIvi51fF7Ttw7lIVjbFo2GQlSwxP4mYFqYE
         1UeqqQ9lXV2L9Ny2NQqRBkgrJihiVGpDELpbYOtBMxKwpTM15vORKaB0E7MHmpiVBXFS
         qoEylfXROWIGVG/gTmEeNynApG2D1sJq0MhRNVJColWur2r9O9ZswRPbWolRHgwMcar4
         0ZszRayztPr5hx6rnX7eNezrK3H8y2pLzkhFxjwWJ1famAQmDFW9/OBT8/zU1VGkP5/s
         v/Gg==
X-Gm-Message-State: AOAM532qRYHQPO/knhW9+HHppwTs9kM6cUugI8EeDXAkky2gEWVytfkQ
	CiNYCVhpE22ja9xFnYG6sl6AlwGr7+CzdAIgxUc=
X-Google-Smtp-Source: ABdhPJx5O7kvI1mEB2B2sDiokcvWeYJVvanpoDMf53buvyuf9FBFg/1rOW24ZgAQCBoagEqAxE7FaHmtZ0S/kyBf7z0=
X-Received: by 2002:a1f:9bc2:: with SMTP id d185mr194775vke.23.1601432069317;
 Tue, 29 Sep 2020 19:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <1599375114-32360-1-git-send-email-jrdr.linux@gmail.com>
 <1599375114-32360-2-git-send-email-jrdr.linux@gmail.com> <8a608871-af25-fee6-24ea-24d78010cd6c@oracle.com>
 <CAFqt6zbKdzFDq6TTadQqQhwZPsZKJLW0LE9ER-qTHm7y3raw9w@mail.gmail.com> <a3df6cac-4d29-a5cf-2bb2-35a8834aef64@oracle.com>
In-Reply-To: <a3df6cac-4d29-a5cf-2bb2-35a8834aef64@oracle.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Wed, 30 Sep 2020 07:44:17 +0530
Message-ID: <CAFqt6za1JzbnxK1nuYZhGaj_MxRc33cbTXo7MyP+CgXTfYRXfg@mail.gmail.com>
Subject: Re: [PATCH 2/2] xen/gntdev.c: Convert get_user_pages*() to pin_user_pages*()
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, xen-devel@lists.xenproject.org, 
	linux-kernel@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 29, 2020 at 6:00 PM <boris.ostrovsky@oracle.com> wrote:
>
>
> On 9/29/20 8:09 AM, Souptick Joarder wrote:
> > On Fri, Sep 11, 2020 at 8:12 PM <boris.ostrovsky@oracle.com> wrote:
> >>
> >> On 9/6/20 2:51 AM, Souptick Joarder wrote:
> >>> In 2019, we introduced pin_user_pages*() and now we are converting
> >>> get_user_pages*() to the new API as appropriate. [1] & [2] could
> >>> be referred for more information. This is case 5 as per document [1].
> >>>
> >>> [1] Documentation/core-api/pin_user_pages.rst
> >>>
> >>> [2] "Explicit pinning of user-space pages":
> >>>         https://lwn.net/Articles/807108/
> >>>
> >>> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> >>> Cc: John Hubbard <jhubbard@nvidia.com>
> >>> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> >>> Cc: Juergen Gross <jgross@suse.com>
> >>> Cc: David Vrabel <david.vrabel@citrix.com>
> >>
> >> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> > Are these 2 patches queued for 5.10-rc1 ?
>
>
> Yes, I am preparing the branch. (BTW, your second patch appears to have been either manually edited or not generated on top of the first patch. Please don't do this next time)

I created it on top of the first one and didn't edit manually.
I was able to apply it in my local repository.
What was the error ?


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A2552BDA6
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 17:02:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332325.556007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrLBX-0000wf-Rp; Wed, 18 May 2022 15:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332325.556007; Wed, 18 May 2022 15:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrLBX-0000uM-P3; Wed, 18 May 2022 15:01:59 +0000
Received: by outflank-mailman (input) for mailman id 332325;
 Wed, 18 May 2022 15:01:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oo/d=V2=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1nrLBW-0000tx-N5
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 15:01:58 +0000
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [2001:4860:4864:20::34])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7609198b-d6bb-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 17:01:57 +0200 (CEST)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-f16a3e0529so3061567fac.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 May 2022 08:01:57 -0700 (PDT)
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
X-Inumbo-ID: 7609198b-d6bb-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fc9KK8mYc1+nLTwXELTaMM6fHsqZOc9DbC5HpaJouSY=;
        b=b0TLgXfC2tijMOf18Jk3aTgbT1yh+56hExJkFuaVmDSpmhpkEu2nJBEAzLrzXIpAzy
         hCk1UWlRzY6QUaliXfXdZVgRRZNXj+ALBd7IhvfFg1Cn/7aUHGC5mjRIvKJtrDXhaFUH
         80xB4fkc1X/MEm0RBwdjfKg+8+q/rsm/G0bBgmBb6TsAl8b+A0FaoWrqc2Bi/TWmMwZM
         9LwBTI9Uy+TlogX5eiS0qKJGKqjqXp2fe2ALRvU0jYpph0rFYKKLci02PGbVKPgSlzzW
         onfVVWssP9LWANN0toivq8LiLbSoyWnYafBVDEBuRu7OU19+S5/nbIWPVMy98BDDwHgW
         JGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fc9KK8mYc1+nLTwXELTaMM6fHsqZOc9DbC5HpaJouSY=;
        b=bav/ajwzKRiiau3LPIE/nhNIfofIwNZPk4v4CjpKMf6PvMtzvy+Otlhe5pyNar6Xvs
         qPiccAv+ILMwBcVV1TkmXoaP0krUopBJB9B2n5ctVsDGk7Fm+5AWIdIktVibXc/YJTCH
         A1MFURM1IpPSQ0SOicDl0NnkY1ctQA2G22c/SErbDomQaWIhQhPLE3u9WhrqxteB90Ya
         6h6hbHzOP4GMoBvENjWMxAYNKOMvKN/Nef+G+huOcGRxorve5CQ6k9Wv/WzjpDzlmtiw
         CMeutYSXZle/ky3q8nzqdOd8HB/TwrxVlUDq3+TyEJR+mIHlqxyPKafpVK40cj0O/iG/
         utTA==
X-Gm-Message-State: AOAM533mWOlLK9v76knCTWJcRGSXA6qrqyvebN9LL0le8rc0JigF8vZs
	n2gcG/CDchQfVfItGeJFVl167IgO3kyfWbPh68o=
X-Google-Smtp-Source: ABdhPJyJMavZbnwU/jCc0Et++pGd+ikS696vUKPFNjYxAdkgM0qnhCKQqwlAg36Hlcjjq6z8zbVYcqQ1I820TTAwlb4=
X-Received: by 2002:a05:6870:ea8d:b0:e6:135c:1a2e with SMTP id
 s13-20020a056870ea8d00b000e6135c1a2emr268714oap.9.1652886116451; Wed, 18 May
 2022 08:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <7f03387eebf9de474f404ef661f80133e3725365.1651073086.git.tamas.lengyel@intel.com>
 <f3fdd4e99892549dc68e7511f2d84f51af446e86.1651073086.git.tamas.lengyel@intel.com>
 <YnOIEb9sNfshZwtZ@Air-de-Roger> <CABfawh=WnQtGehg2mX4Lnz9y3AyAnaUjUyc4FNxjGvoc_YcOBg@mail.gmail.com>
In-Reply-To: <CABfawh=WnQtGehg2mX4Lnz9y3AyAnaUjUyc4FNxjGvoc_YcOBg@mail.gmail.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 18 May 2022 11:01:19 -0400
Message-ID: <CABfawh=2wHwxGuihNY=ecKcdx8ZapmWnNzx=O6nRxm1ENpr62g@mail.gmail.com>
Subject: Re: [PATCH 2/3] tools/libxc: change xc_memshr_fork_reset API to match hypervisor
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, xen-devel@lists.xenproject.org, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 12, 2022 at 9:46 AM Tamas K Lengyel
<tamas.k.lengyel@gmail.com> wrote:
>
> On Thu, May 5, 2022 at 4:27 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com=
> wrote:
> >
> > On Wed, Apr 27, 2022 at 11:34:19AM -0400, Tamas K Lengyel wrote:
> > > Need to separately specify if the reset is for the memory or for the =
VM state,
> > > or both.
> > >
> > > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> >
> > Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>
> Patch ping. Can this patch be merged please?

Patch ping.

Tamas


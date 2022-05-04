Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF7451A07C
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 15:11:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320722.541594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmEmT-0001vf-3X; Wed, 04 May 2022 13:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320722.541594; Wed, 04 May 2022 13:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmEmT-0001tj-0Z; Wed, 04 May 2022 13:11:01 +0000
Received: by outflank-mailman (input) for mailman id 320722;
 Wed, 04 May 2022 13:10:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wBjO=VM=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1nmEmR-0001tb-3V
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 13:10:59 +0000
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [2001:4860:4864:20::34])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2dad2e8-cbab-11ec-a406-831a346695d4;
 Wed, 04 May 2022 15:10:58 +0200 (CEST)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so1101639fac.7
 for <xen-devel@lists.xenproject.org>; Wed, 04 May 2022 06:10:58 -0700 (PDT)
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
X-Inumbo-ID: a2dad2e8-cbab-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lf+X08kiFKGHmXOfN6LM+PkgLDzpqNGCHdD4Kk3iQOM=;
        b=Ij1NfEjZccriCrwIDseFnx1SrsjQHM/SaEmJLeJWRs/yGvosNgcQ2/tyj1hwQ4ZoyN
         G4cjJiy+ewMRVjw4+x7FxnV4JjNKYddAY0B0FHgXjAuDQtKx/0vyzAAYSrMG8uJaDSV8
         0WRaGEcATSZoMaenS52OjI/LEmzg99h51r422RbmpWC0ustbF7i18jHRjxQZ35yaOnXd
         X5ch8EUwuZB9KAIfIiCylu1tDcwrD6RrzBTuJDOF7ildsZOCRVU4sD6CIUUPQesx2pIp
         SqkYqEmxSDoq+vfNH5Rw4/70bjJJe3Dn5RhH3qGJc62ocRib78yxIXAcRLSKlYeXnz6N
         Le4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lf+X08kiFKGHmXOfN6LM+PkgLDzpqNGCHdD4Kk3iQOM=;
        b=jzP+UU0kZtq7mNj4EqN1R8rLZVpaJ+LrFt0yILOFC5V9AHpK54lu6oLy42SlGY74O9
         yYMVON/fs3uWkdO5EDGkr7CItYDxgZaC94XKEibJzd81psjI4LohqaJzekZ4Jdq8eVVF
         b7dJOqyr30HB8895j4x2VKO+OuJtQqXw3qMO1QJVLqgmPyC3EEIh45IJNABujugcTB32
         xNMMC66Bw75qfKasq0lPNljn/HL1wR5ZueJGTNhcJLBTCzw1jiUtAiTqRhjk84gs7IHO
         18E+Ry/i1aOU+nXMq2/Ba66N+DlJEYJiegfZvaI/Om9Y8omaDIz6tOKoPP1E0osvBiZG
         SRug==
X-Gm-Message-State: AOAM530btuqDjrGwEU1liIfmTsIbLfVYlOQdAo2DvMkagm0zTYEYcN6v
	lhymHGHkM56xP4ex+gguKrTziUfKhBTj4rBIdQ4=
X-Google-Smtp-Source: ABdhPJyixgBB9PH8W0hTe1IZshr6QZP7uRJJMKenoe25BGU8vVX0BFmjDSUqlkxGyT5MujPNJmfJeOh8IB3pov3Kf60=
X-Received: by 2002:a05:6870:3288:b0:ec:9da8:22c3 with SMTP id
 q8-20020a056870328800b000ec9da822c3mr3729320oac.128.1651669856830; Wed, 04
 May 2022 06:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <7f03387eebf9de474f404ef661f80133e3725365.1651073086.git.tamas.lengyel@intel.com>
 <f3fdd4e99892549dc68e7511f2d84f51af446e86.1651073086.git.tamas.lengyel@intel.com>
In-Reply-To: <f3fdd4e99892549dc68e7511f2d84f51af446e86.1651073086.git.tamas.lengyel@intel.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 4 May 2022 09:10:21 -0400
Message-ID: <CABfawhnw3kc6PncexpofJ0_yLOiSQQBvjDiBV74-i9GF9Qw-GA@mail.gmail.com>
Subject: Re: [PATCH 2/3] tools/libxc: change xc_memshr_fork_reset API to match hypervisor
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 27, 2022 at 11:52 AM Tamas K Lengyel
<tamas.lengyel@intel.com> wrote:
>
> Need to separately specify if the reset is for the memory or for the VM state,
> or both.
>
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> ---
> v5: split from the hypervisor-side patch

Patch ping. Could a toolstack maintainer please take a look at this?
The hypervisor side is already merged.

Thanks,
Tamas


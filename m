Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7954D6A0CAA
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 16:14:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500531.771968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVDIZ-0003tb-A5; Thu, 23 Feb 2023 15:14:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500531.771968; Thu, 23 Feb 2023 15:14:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVDIZ-0003qS-6y; Thu, 23 Feb 2023 15:14:19 +0000
Received: by outflank-mailman (input) for mailman id 500531;
 Thu, 23 Feb 2023 15:14:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nxRn=6T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pVDIY-0003qM-LO
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 15:14:18 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc9ca4a3-b38c-11ed-a82a-c9ca1d2f71af;
 Thu, 23 Feb 2023 16:14:16 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id a10so11206325ljq.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Feb 2023 07:14:16 -0800 (PST)
Received: from [192.168.8.199] (46.204.108.92.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.92]) by smtp.gmail.com with ESMTPSA id
 m1-20020a056512014100b004d862e9b453sm957569lfo.196.2023.02.23.07.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 07:14:15 -0800 (PST)
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
X-Inumbo-ID: bc9ca4a3-b38c-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2L1XNo3Xf9uzeL3XkLJCsa9J3b4NGed2pzh5eIQihwc=;
        b=TCfHmwXGkioWVxyfjZDTM4vJ+CigP7XaKYGB7ehvHnB3H8HJV2tg2PqJg5geUcrYK7
         LuUwiMVT8hYYkbqxML6j3CSH+msADclnHKa8vbqZTePTBqpwMMjcBJTdz5kNlHQ72u9g
         89/fAfotlLGsErm8qKjo8Dh6MrbPtAN6R2LuM9ztmy1i9dzo2BNtmkkigwx0gGHoOQ/2
         GKkJ792N1KUrvRaiN0EG9Uvj1xgycaggNFRqloSZQB83cRJu7Eiz3ZQUwhznSfrrw7t2
         3FubYkC1ZdoN+QnQbAySqUu1v7bfIGeTekfytFi21oaPsg/gxq1pPASgiKbITHf5LOJd
         fzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2L1XNo3Xf9uzeL3XkLJCsa9J3b4NGed2pzh5eIQihwc=;
        b=HvTrqkT6g/qHEP5zIBpYW3pkcMT9koRPHaA7ug5+2Lqxu/IMbU3cfijEUWSBrMOWZ3
         v4QpnaI0FGsuJmrNUmZTMAn/+jDpBefdq0GoBVA6fqpy04116yDI9n37G4vfcWQfRo+1
         dAUWqfEa9DnIi8dfsJ+DhR54Zhgp+zU4B/nrMtNLkXA5Zmyeygk+jCpEOjxQ9uFK/SX8
         ZClWtSm2BtsmxdtvTWihbJKBYQxEHi/jDw0uP+cZXGxOXXIVy7sY7CHqfs4iz3MCX66g
         lNxgEwKzt7marEFM0GITPM5hz6GwEhiPz7fMupFSetm05NIhWmhV+jzwPIuiTd1D6OYY
         qnqw==
X-Gm-Message-State: AO0yUKXvov3JnjEj7UCt0lZm22XBA0DxamUYCC9pnbO092wOfNTjh7w4
	3oAPBgT6YKUCA6IoiHxnvyE=
X-Google-Smtp-Source: AK7set/oWn+kgzbZoo7rGE0QC6/jPrpNOKv2mweOM9YXraMxPTvwoK6dCLeDFhjIq2Y3235fPyXuAA==
X-Received: by 2002:a2e:9a87:0:b0:294:70ba:1f37 with SMTP id p7-20020a2e9a87000000b0029470ba1f37mr5231445lji.3.1677165255429;
        Thu, 23 Feb 2023 07:14:15 -0800 (PST)
Message-ID: <c157bc8e1400b618984b0b07e63ec2f13bfb7a90.camel@gmail.com>
Subject: Re: [PATCH v2 2/4] xen: change <asm/bug.h> to <xen/bug.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,  Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Date: Thu, 23 Feb 2023 17:14:13 +0200
In-Reply-To: <de552beb-9fcc-a0b6-ac87-b7c1c0dd06b9@suse.com>
References: <cover.1676909088.git.oleksii.kurochko@gmail.com>
	 <e21f8b59f22cc8bdb425a5002ed6e1473090b16f.1676909088.git.oleksii.kurochko@gmail.com>
	 <de552beb-9fcc-a0b6-ac87-b7c1c0dd06b9@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Thu, 2023-02-23 at 14:34 +0100, Jan Beulich wrote:
> On 20.02.2023 17:40, Oleksii Kurochko wrote:
> > --- a/xen/include/xen/lib.h
> > +++ b/xen/include/xen/lib.h
> > @@ -24,12 +24,12 @@
> > =C2=A0
> > =C2=A0#ifndef __ASSEMBLY__
> > =C2=A0
> > +#include <xen/bug.h>
> > =C2=A0#include <xen/inttypes.h>
> > =C2=A0#include <xen/stdarg.h>
> > =C2=A0#include <xen/types.h>
> > =C2=A0#include <xen/xmalloc.h>
> > =C2=A0#include <xen/string.h>
> > -#include <asm/bug.h>
> > =C2=A0
> > =C2=A0#define BUG_ON(p)=C2=A0 do { if (unlikely(p)) BUG();=C2=A0 } whil=
e (0)
> > =C2=A0#define WARN_ON(p)=C2=A0 ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>=20
> As just said in reply to patch 1 - I can't see how this would build
> at this point. There looks to be an ordering problem; you first need
> to remove from asm/bug.h what's now also available from xen/bug.h.
> Possibly parts of patches 3 and 4 need to move here.
Yeah, you are right as I answared to your reply to patch 1. I missed
that because I tested only RISC-V and didn't run tests for all
architectures.

I'll remove generic parts from patches 3 and 4 to patch 2 and will add
define BUG_FRAME_STRUCT to asm/bug.h specific headers.
>=20
> Jan
~ Oleksii



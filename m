Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4423784F269
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 10:41:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678609.1056052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYNNI-0007El-0Z; Fri, 09 Feb 2024 09:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678609.1056052; Fri, 09 Feb 2024 09:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYNNH-0007CK-U6; Fri, 09 Feb 2024 09:40:47 +0000
Received: by outflank-mailman (input) for mailman id 678609;
 Fri, 09 Feb 2024 09:40:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qnec=JS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rYNNH-0007Bz-Am
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 09:40:47 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c5f0482-c72f-11ee-98f5-efadbce2ee36;
 Fri, 09 Feb 2024 10:40:45 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2cf3ed3b917so7266291fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 01:40:45 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a2e88c6000000b002d0c34de739sm177438ljk.105.2024.02.09.01.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 01:40:44 -0800 (PST)
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
X-Inumbo-ID: 4c5f0482-c72f-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707471645; x=1708076445; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nMIWIk8UrRRacEEuL0vZEYRkZB38ASc7SyjxbcTn3AU=;
        b=Jy0veO4dlENiRNAlyGC7Y2irXiK+jsKkccfl2eydz1zEiBGg/a9unYk+THrWQg/haJ
         i0vinAiO/NXFHZjasK9Peq0YujwbpSjJTkcyZCasjcjkwiM5R3ADfkr0LIcAhwjtzhIT
         MmaPE4+0j4+ja8wo2dcyWPbBCphFsUrQzTx0Dm4XbOIsCU1ir6fadrez/wkDAKGml+wF
         DJAe1zk2wHey3lWfkg4B9+hTLyDlY3gkKceWEkYJHh5d3qUEco7RIDSh+xazM3WqWpCC
         1F/YDPLXNZEA/RQtM4MBNRNLRxJnl3/R5ySjHrwO2zXzOqTdqSzluglDM7yhXLXDdhb2
         H4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707471645; x=1708076445;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nMIWIk8UrRRacEEuL0vZEYRkZB38ASc7SyjxbcTn3AU=;
        b=vgqxrRQbh6GAjgqUAWd+RWQBasVq5R/XZ2hZmOHz027v7Xfp49pJ1pc54AEWJShs9r
         6B99nSX+tvVoyi++yYOxyGyqFUC1Z2jY3dfSBXV1W1AHBs65O/rU6/iHY9FinVKDdNEX
         Udwpct6Qi/U0uNoms7Wgzdx4DV8UNh2/77HP8RZtIQV4NVqI3ETitBKcJ44sWLToXeEI
         BRGVU3AHePCku547qTGR+vVq7vA4LufWLqlwVJb2jECIbWkAVy1SWuA0H9Q5V3X1XmbP
         URyeWVKdIGzuDmi3FZNa8mF+GC8G254D9CjkTwM5NdMoGEPAPZ4tDJVtjV6pvRMka0Sk
         Zl5Q==
X-Gm-Message-State: AOJu0YyNRJnY6Pot7QuASG/6xLM9AoC6CXSdnC4P04hXp/Z364qoC2A2
	juKyxMg8Ib6dUc5xIs7Pwe9I+lEd321RyyMoBfUlyaYICeCqUPgo
X-Google-Smtp-Source: AGHT+IH4mqRFBjZxoDil7XDFslrGlZtiEmW3p5aKqaA72XsAf0//uQdPo1b8TgPlszCI5pJeJswWXw==
X-Received: by 2002:a2e:b616:0:b0:2d0:b3c4:5113 with SMTP id r22-20020a2eb616000000b002d0b3c45113mr1027651ljn.11.1707471644980;
        Fri, 09 Feb 2024 01:40:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUbpAX5B/Q4W5sTtQATc+u0xmXMqrVC9Xc20JpKktz5DkvnijQzfc5XHKySVgT4qN8Y+6fHQHwz1yvboKpiV3h57JLc844kJoBdVpBVX+aZyYZBzT+Y9+YXK8jx014Ut47fhKCuakjJ2AEIKzlIhTMzNdqdUUOOedyRYjRGmh3YxRLJBg7uUYBmSSykalZQfUoPqhEOnK0htVTrvHApbD0SDsUDO3XajCUSpEojgv1k21ct7F5W+bmYsVN7RRJR6qt+CSVdfVRoRrTqE6f5C8GAjRjerTo3fqGdxET03FjfdU1yhuPU0UbIyNK+AujZoekb3TxN1Lih1SiHqPrKwzvRGferXBc2+aOoXuEk5OMHQNeV/MRb4Yi43U5VTHLG2kY/Ye9B4/iiTIkUuSrsScmVmvQD9z0J4xXqiQlobjiHbQ0Ho9aVRO2LMRnpsLMwPO/wbqnIP9CR9p0TQ9lQGPwkUJgwO7fTpNBw9rkz3VfvhqRX38cXgbs=
Message-ID: <9d1cadd4e918960d38426a8a4d83d18dbd4aa07e.camel@gmail.com>
Subject: Re: [PATCH] xen: move BUG_ON(), WARN_ON(), ASSERT(),
 ASSERT_UNREACHABLE() to xen/bug.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,  Shawn Anastasio
 <sanastasio@raptorengineering.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>,  Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,  "Daniel P. Smith"
 <dpsmith@apertussolutions.com>
Date: Fri, 09 Feb 2024 10:40:43 +0100
In-Reply-To: <07e4b9b0-5ddd-4499-b280-bd5d583b8b8c@xen.org>
References: 
	<4887b2d91a4bf2e8b4b66f03964259651981403b.1706897023.git.oleksii.kurochko@gmail.com>
	 <07e4b9b0-5ddd-4499-b280-bd5d583b8b8c@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-02-08 at 21:30 +0000, Julien Grall wrote:
> Hi Oleksii,
Hi Julien,

>=20
> On 02/02/2024 18:03, Oleksii Kurochko wrote:
> > Move the macros mentioned in the commit subject to their
> > appropriate
> > locations.
> > Additionally, eliminate the dependency of xen/lib.h from xen/bug.h
> > and
> > include "xen/bug.h" in files where xen/bug.h macros are utilized.
> >=20
> > Most of the changes were made because a file requires macros from
> > xen/bug.h,
> > except for some files for Arm which require definitions of
> > BUG_OPCODE,
> > BUG_INSTR, BUG_FN_REG.
> >=20
> > xen/lib.h was added to list-sort.c ( otherwise compilation errors
> > related
> > to {d}printk occur during compilation of list-sort.c. ) as
> > xen/lib.h was
> > removed from xen/list.h. Since nothing in xen/list.h depends on
> > xen/lib.h
> > functionality and only xen/bug.h is needed.
> >=20
> > cpufeature.h requires the inclusion of <xen/cache.h>;
> > otherwise, the following error will occur:
> > ld:
> > common/monitor.o:/build/xen/./arch/x86/include/asm/cpufeature.h:41:
> > multiple definitions of `__cacheline_aligned';
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Acked-by: Julien Grall <jgrall@amazon.com>
Thanks.

~ Oleksii



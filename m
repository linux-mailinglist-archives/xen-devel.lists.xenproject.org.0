Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D03A912414
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 13:41:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745241.1152398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKcdD-0000lW-E5; Fri, 21 Jun 2024 11:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745241.1152398; Fri, 21 Jun 2024 11:40:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKcdD-0000it-BT; Fri, 21 Jun 2024 11:40:39 +0000
Received: by outflank-mailman (input) for mailman id 745241;
 Fri, 21 Jun 2024 11:40:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Iemj=NX=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sKcdC-0000in-41
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 11:40:38 +0000
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [2607:f8b0:4864:20::c33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12eb76cc-2fc3-11ef-b4bb-af5377834399;
 Fri, 21 Jun 2024 13:40:36 +0200 (CEST)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-5b53bb4bebaso1037816eaf.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jun 2024 04:40:36 -0700 (PDT)
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
X-Inumbo-ID: 12eb76cc-2fc3-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718970035; x=1719574835; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yaHhB7H1P0V+QSwciRSnhP8rzF3ubJ+4eGBfElpPIo=;
        b=KtnzNnRdHOZkJkWpjjnY8tcTd3FYD9qAuCA+LKqtoZ0GrA+w/1AYlJ2agnW2eAkIVh
         9dcKHuKrjvaqoO/Syb4hNbl0rlemGyXCt6SCG1xShJFm/R/GIGAy2SOMY0lgidolUiLe
         VvweHnIHIWkw37XiGUElQ+qieroozyl58sQ8M5vNd+J+js+odK9rbQdZRT3Cudb5BfQM
         PPsQP1Dyq/UA8Fdd0x0b+doAjdF/VQv8EoqMocbApOwhFDbROqTtBSvhhTOp/Eyi75aP
         jRJJaozu8K9mO6KO+z63rGP390+3YlYHoGdEafvceDHixuEK+B8nfXlfXHrGfjq0R6ai
         9dRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718970035; x=1719574835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1yaHhB7H1P0V+QSwciRSnhP8rzF3ubJ+4eGBfElpPIo=;
        b=paT9Ntpr15/JLYMWuQyN1ZMOnBoe8LFwBRGWVZLUesvwV5XZaTa4MvOVrs8Q/88sAo
         hIkUkZ+QeUuqJ7fkzk9+IWc5/o+Idm61HrzmDJ85p9oWz6ZTCk2i9buZ/F6rurUG8cwP
         M94JVkhFf8I12vf+blj1G5bHtwiXnpzYQ/SUDKTg9zptTvsltYFTKbnJ2+QxGvwb7ARp
         IWGjgNdXoTnsrFsM3SqI285OIkIRJE7peTYt7UM6l9/H1xVHm6iy9EP2PnZyld19jcW7
         Gw3NrxeQ9QBM0mXHuIxyxyTY4KOSTGgatjaAZNEfip2ToVNQzE2pmtsm8am4c16Pv0XX
         aHFw==
X-Forwarded-Encrypted: i=1; AJvYcCUJSKZAAnRX64dn63umaxpMhCXh7FyNxVECO+YbRTd68J+C1+eD2E5p2pul+19hOZRr3JUNNLKAPV5Tk6o+lQ8Xfxk0FvRaeUtI1mccy/g=
X-Gm-Message-State: AOJu0YwJ7P+JBXi/iCruu9YBIAIVAZv0YgzFsgaY/R8yOdADiP1cRY9r
	yeOdoyNCsdjJTgktfja7pIv4YecBpygkXEcQa1gfnznooIdNZWmOXnxyiW1iUaLGO0UNP38Zwn9
	Qtk7MeYt8ikxYwwLHmOFiqccRt7c=
X-Google-Smtp-Source: AGHT+IE200lHfcn6EP/q0c3YeC+W7wRpR+wFUbZbYgI3JVeO7Hkv89H4Cc6NYsDDEiK4/jCgHn1bWm1iCreJKCBDmtM=
X-Received: by 2002:a05:6870:160d:b0:25c:bc3f:f924 with SMTP id
 586e51a60fabf-25cbc3ffa32mr4466368fac.35.1718970034771; Fri, 21 Jun 2024
 04:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1718038855.git.w1benny@gmail.com> <fee20e24a94cb29dea81631a6b775933d1151da4.1718038855.git.w1benny@gmail.com>
 <4a49fe9b-66fd-4a32-ad01-14ed4c5fc34c@suse.com> <CAKBKdXgUKYoJfB1mG+6JSaV=jWpmRmS1UbQ6N4JNZ774rP_PoQ@mail.gmail.com>
 <4cf14abe-881e-4328-9083-bd04afd6b307@suse.com>
In-Reply-To: <4cf14abe-881e-4328-9083-bd04afd6b307@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Fri, 21 Jun 2024 13:40:24 +0200
Message-ID: <CAKBKdXg5jCJwW2n2rkWS1aeHTN4X7-z-STft8n4xJ59JCTDhYA@mail.gmail.com>
Subject: Re: [PATCH for-4.19? v6 6/9] xen: Make the maximum number of altp2m
 views configurable for x86
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 9:25=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
> Not exactly. You may not assert on idx. The assertion, if any, wants to
> check d->nr_altp2m against MAX_EPTP.

In addition to the check in arch_sanitize_domain? As a safeguard?

> You're again comparing cases where we control the index (in the loop) wit=
h
> cases where we don't (hypercall inputs).

So, replacing strictly the occurrences where we don't control the
index, and leave everything else as is. Okay.

P.


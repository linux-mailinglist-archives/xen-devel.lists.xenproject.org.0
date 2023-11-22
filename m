Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD597F4C66
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 17:31:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638908.995864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5q8I-0000jx-EX; Wed, 22 Nov 2023 16:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638908.995864; Wed, 22 Nov 2023 16:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5q8I-0000iD-Bp; Wed, 22 Nov 2023 16:31:22 +0000
Received: by outflank-mailman (input) for mailman id 638908;
 Wed, 22 Nov 2023 16:31:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SplL=HD=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1r5q8H-0000i7-4H
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 16:31:21 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9088ef9f-8954-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 17:31:19 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c6b30aca06so86403881fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 08:31:19 -0800 (PST)
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
X-Inumbo-ID: 9088ef9f-8954-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700670678; x=1701275478; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZjXjbJLvS85ELtACuewF8Ry2/WObRnhQy9tqgKovCg=;
        b=hr2fiJ71N8VS+fIYmahDjh3l8mUJNmnv/nI+z+znai/1fyD1r8k1Pb2pv9t3EIso2m
         kIaTcuNKwjB1UOkyqZRxdkemPLWch7OadLeA3OVnYU0DOR/XAzzB1Z2eZuyQyEVN60At
         EdBWhmliDSG9lOJCkgd6IjFAO0X+80kpNOrsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700670678; x=1701275478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZjXjbJLvS85ELtACuewF8Ry2/WObRnhQy9tqgKovCg=;
        b=mCYSRDjw7rlXPm2wDbsHMEMwBc69pNZeHkYwr1rX+Wlh4mDAS5OVv3uaoNAwlR8J7R
         USzbVmiVb6U8SrArH9Dcep0ERpJbdPMJdWWIeRNGxH4IFCIMXyP8gHOX9E1HNigBfa0U
         SiGx4KO76I9snRsugataGd7XGlPR6b1pXapeJ9Ol2Gieldjv3scJch752urxt3H488zC
         TcCPREZFNiceEkKMb+6qP/WTeS+5AEzlM4JUGOQPk12xiOAjcVTRgEFBpRg1mHC0jRi8
         66+WAt4HhSbJEmhe/huhVes3JFjKcue11Nuy9NgSRPR37KgRMK6T7g6N+U4rWvTrF9H9
         WvNQ==
X-Gm-Message-State: AOJu0YwuHdvV3zPRkeJv/YwD2J7Fd+69hw2ZaENVlxj9qXxWdgnd51vT
	4r/bcCHFUoHu7YhmEOZ/vaKGHyal1XtzMIqPtI3K
X-Google-Smtp-Source: AGHT+IHSFqgCQfZIIdiEd2IzP5hhoABndMUfCegQV5DWfUcTTTerQ7dr/J1Kd5xOqDGTxDuCHzcrKmOitdYoNun4e7Y=
X-Received: by 2002:a2e:9f4e:0:b0:2c8:7ffe:573f with SMTP id
 v14-20020a2e9f4e000000b002c87ffe573fmr1942084ljk.5.1700670678622; Wed, 22 Nov
 2023 08:31:18 -0800 (PST)
MIME-Version: 1.0
References: <20231116115841.71847-1-roger.pau@citrix.com> <d6634601-5006-475c-b386-97a1e53c5279@suse.com>
 <ZVYfHQD1AEmNVY3h@macbook.local>
In-Reply-To: <ZVYfHQD1AEmNVY3h@macbook.local>
From: Ross Lagerwall <ross.lagerwall@cloud.com>
Date: Wed, 22 Nov 2023 16:31:07 +0000
Message-ID: <CAG7k0Eo=p6sn0-p=JWGDTuN9u8B2=d9K13qpWUoAqJfX0uhcLA@mail.gmail.com>
Subject: Re: [PATCH] livepatch: do not use .livepatch.funcs section to store
 internal state
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 1:54=E2=80=AFPM Roger Pau Monn=C3=A9 <roger.pau@cit=
rix.com> wrote:
>
> On Thu, Nov 16, 2023 at 01:39:27PM +0100, Jan Beulich wrote:
> > On 16.11.2023 12:58, Roger Pau Monne wrote:
> > > --- a/xen/include/public/sysctl.h
> > > +++ b/xen/include/public/sysctl.h
> > > @@ -991,10 +991,7 @@ struct livepatch_func {
> > >      uint32_t new_size;
> > >      uint32_t old_size;
> > >      uint8_t version;        /* MUST be LIVEPATCH_PAYLOAD_VERSION. */
> > > -    uint8_t opaque[LIVEPATCH_OPAQUE_SIZE];
> > > -    uint8_t applied;
> > > -    uint8_t patch_offset;
> > > -    uint8_t _pad[6];
> > > +    uint8_t _pad[39];
> >
> > Should this be LIVEPATCH_OPAQUE_SIZE+8 and ...
>
> Hm, I'm not sure that's any clearer.  In fact I think
> LIVEPATCH_OPAQUE_SIZE shouldn't have leaked into sysctl.h in the first
> place.
>
> If we later want to add more fields and bump the version, isn't it
> easier to have the padding size clearly specified as a number?

I prefer using the number as it makes it clear that this padding is not
(anymore) related to the size of the instruction buffer in livepatch_fstate=
.

Do you think it would be better to call livepatch_fstate.opaque
something like livepatch_fstate.insn_buffer instead (and rename
the constant accordingly) since it is internal to Xen and is not
hiding something from tools building live patches?

(Otherwise this patch looks generally fine to me.)

Ross


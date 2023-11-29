Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 281627FD700
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 13:41:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643897.1004437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Jsw-0003NC-2v; Wed, 29 Nov 2023 12:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643897.1004437; Wed, 29 Nov 2023 12:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Jsv-0003KF-VD; Wed, 29 Nov 2023 12:41:45 +0000
Received: by outflank-mailman (input) for mailman id 643897;
 Wed, 29 Nov 2023 12:41:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LZl0=HK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r8Jsv-0003K9-0U
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 12:41:45 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6416fad-8eb4-11ee-9b0e-b553b5be7939;
 Wed, 29 Nov 2023 13:41:43 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50bc743c7f7so501027e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Nov 2023 04:41:43 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 b22-20020a056512071600b0050bc059f535sm388425lfs.112.2023.11.29.04.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 04:41:42 -0800 (PST)
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
X-Inumbo-ID: a6416fad-8eb4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701261702; x=1701866502; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SfgfV21wd0b8TXs2r60JlUvLeEStshnt1PcnHlBjQFE=;
        b=lWGl+27HekZHiw4pT6ZtxzRrVCnyDeUXwx1NIN7OR8oNCIhYuo6NUS0mdmPkRI079M
         DwxPRVPv5tkyPG+9ygc/FPKjZH/aY7TwXfDtCz7D4/6Q+jqC9Rk6TuIF3BYLKBl7qx+5
         no37d0QVkP+RGKs05S27ASgDEKNbZilkPZiy3FO4S3hV0MqDVdFklPPnZ0LvuBLeFp2Y
         o6QR8+w/AYh+L6oEK5HhfTFS/oPJljHxaD9H5HWk+w3+k22Dwg0t/yVuh9EYuNaVnMcZ
         9/hSOGMgypyEoqN6ffqG5QOKO0qOJWHlR6PEFqKr2I6N8Ivn/65KjfFRh5PfAlEJ9dMr
         1e6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701261702; x=1701866502;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SfgfV21wd0b8TXs2r60JlUvLeEStshnt1PcnHlBjQFE=;
        b=tWx9Mv1K8jtkP5pD3poc68j7UyFsXpc6fBFDr+NZ08KaiUVb3HvjS2dOa7RsxBackR
         gcx8+bm3zr9GcYJsNAHR5Ci0EVglP6RJ57cQVxswaQJpqc2aQyrdw2t6mq1BI6olRffU
         8nCwG8Qm0Skc0o6o9s2YywOl6C6fEfvGoH5Mjh0MEduxsZIZI54YYCnPQVYXOOaZYLOE
         kZ4eombH9z9T5zPxKpX20/5paG8y1CGT2n05ynBOT6XZSU1zoibCieioh7/v+yYlzjTe
         wS72SYTmAZBvpswP7BFM7OPL9zKFPWFAlhzk0K/y+BG29b7zBg1Ti/THeALCyH9JuztS
         3/ww==
X-Gm-Message-State: AOJu0Yw2rtYHwHqZQFdtzPJHJNw03unsVwMYOkzvybI/3rC4W35EmVZP
	frCCPqDcZxLUx2nPbOBxsTWWsfAjUQbcRg==
X-Google-Smtp-Source: AGHT+IESUeQqpq9dZsnSYNiCFnH20ABnq6/OqkN4IAJN4Lz4fLMlDQUebRpj2iip9Rxt7hf0FqP7Og==
X-Received: by 2002:a05:6512:465:b0:507:9fa0:e244 with SMTP id x5-20020a056512046500b005079fa0e244mr11259999lfd.65.1701261702263;
        Wed, 29 Nov 2023 04:41:42 -0800 (PST)
Message-ID: <95765836bfbb596851bbef7819d2abba834ce94f.camel@gmail.com>
Subject: Re: [PATCH v4 10/14] xen/asm-generic: introduce stub header
 monitor.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Shawn Anastasio
	 <sanastasio@raptorengineering.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila
	 <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	xen-devel@lists.xenproject.org
Date: Wed, 29 Nov 2023 14:41:41 +0200
In-Reply-To: <8350624b-a889-4258-b0e7-0d3ad021b3cd@suse.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
	 <83e16ccc588d35042b804e0d56ebdb5fe710695b.1701093907.git.oleksii.kurochko@gmail.com>
	 <22ffed63-8f05-477f-b37c-c660410c2ce6@raptorengineering.com>
	 <77169e15-f1ce-485c-a7be-45901708056d@suse.com>
	 <8350624b-a889-4258-b0e7-0d3ad021b3cd@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

On Wed, 2023-11-29 at 09:21 +0100, Jan Beulich wrote:
> On 29.11.2023 09:19, Jan Beulich wrote:
> > On 28.11.2023 23:21, Shawn Anastasio wrote:
> > > On 11/27/23 8:13 AM, Oleksii Kurochko wrote:
> > > > --- a/xen/arch/ppc/include/asm/monitor.h
> > > > +++ /dev/null
> > > > @@ -1,43 +0,0 @@
> > > > -/* SPDX-License-Identifier: GPL-2.0-only */
> > > > -/* Derived from xen/arch/arm/include/asm/monitor.h */
> > > > -#ifndef __ASM_PPC_MONITOR_H__
> > > > -#define __ASM_PPC_MONITOR_H__
> > > > -
> > > > -#include <public/domctl.h>
> > > > -#include <xen/errno.h>
> > > > -
> > > > -static inline
> > > > -void arch_monitor_allow_userspace(struct domain *d, bool
> > > > allow_userspace)
> > > > -{
> > > > -}
> > > > -
> > > > -static inline
> > > > -int arch_monitor_domctl_op(struct domain *d, struct
> > > > xen_domctl_monitor_op *mop)
> > > > -{
> > > > -=C2=A0=C2=A0=C2=A0 /* No arch-specific monitor ops on PPC. */
> > > > -=C2=A0=C2=A0=C2=A0 return -EOPNOTSUPP;
> > > > -}
> > > > -
> > > > -int arch_monitor_domctl_event(struct domain *d,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xen_domctl_monitor_op
> > > > *mop);
> > > > -
> > > > -static inline
> > > > -int arch_monitor_init_domain(struct domain *d)
> > > > -{
> > > > -=C2=A0=C2=A0=C2=A0 /* No arch-specific domain initialization on PP=
C. */
> > > > -=C2=A0=C2=A0=C2=A0 return 0;
> > > > -}
> > > > -
> > > > -static inline
> > > > -void arch_monitor_cleanup_domain(struct domain *d)
> > > > -{
> > > > -=C2=A0=C2=A0=C2=A0 /* No arch-specific domain cleanup on PPC. */
> > > > -}
> > > > -
> > > > -static inline uint32_t arch_monitor_get_capabilities(struct
> > > > domain *d)
> > > > -{
> > > > -=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > >=20
> > > I'm not sure how I feel about this assertion being dropped in the
> > > generic header. In general my philosophy when creating these stub
> > > headers was to insert as many of these assertions as possible so
> > > we
> > > don't end up in a scenario where during early bringup I miss a
> > > function
> > > that was originally stubbed but ought to be implemented
> > > eventually.
> > >=20
> > > Looking at ARM's monitor.h too, it seems that this function is
> > > the only
> > > one that differs from the generic/stub version. I'm wondering if
> > > it
> > > would make sense to leave this function out of the generic
> > > header, to be
> > > defined by the arch similar to what you've done with some other
> > > functions in this series. That would also allow ARM to be brought
> > > in to
> > > using the generic variant.
> >=20
> > Yet then where would that function live, if not in
> > arch/*/include/asm/monitor.h?
>=20
> Hmm, maybe implicitly you're proposing that
> arch/*/include/asm/monitor.h
> include include/asm-generic/monitor.h in such a case, and define this
> one
> function on top?
I think it can be a solution. The same I suggest in my direct reply to
Shawn message ( I didn't see your answer ).

If everyone is OK with such solution, I can apply it for the next
version of patch series.

~ Oleksii



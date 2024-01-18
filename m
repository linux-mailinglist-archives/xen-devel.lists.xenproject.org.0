Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 561D7831B53
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 15:28:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668793.1041246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQTMr-0001uY-Rj; Thu, 18 Jan 2024 14:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668793.1041246; Thu, 18 Jan 2024 14:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQTMr-0001rD-Oe; Thu, 18 Jan 2024 14:27:41 +0000
Received: by outflank-mailman (input) for mailman id 668793;
 Thu, 18 Jan 2024 14:27:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e3ci=I4=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rQTMq-0001pz-5h
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 14:27:40 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba92a309-b60d-11ee-9b0f-b553b5be7939;
 Thu, 18 Jan 2024 15:27:37 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-55a035669d5so904240a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2024 06:27:37 -0800 (PST)
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
X-Inumbo-ID: ba92a309-b60d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1705588057; x=1706192857; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ATOEwHQaRR2PkYYqvStDGMDYP60Rfc3JolItsE76LQ=;
        b=L2rOXzlrnu5CB/KEQeqp4clqDJMyycPLDMWeFdV+0TpP7pGf+7OT5Je1kdyKQ0cX5j
         Ydc5aLC7Q1MdTtJfqLDLPq+gKCVZBqntZvcgB+tMzGuDawBRxZclWnT30HKZxK4RaAQd
         0KK2Jbz2akjc8p9D0Oh0BgCGA6nsdnqlC+d6UoGPGNVoCRNHf5+CylnDXgNPsgpeuJcQ
         uUlKKNyvESOpU34NmOFlxmE5XxdqiWKcLN07nsBKDk/ctBCbHjwTIq4YgJXcRk0jYU+C
         ZO2QEhIR3ob5zhtTOgvGOM8CutIB8LSqQOWTB9E7u927NydXhnZS0AyRO8vnuXqYpxNi
         TTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705588057; x=1706192857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ATOEwHQaRR2PkYYqvStDGMDYP60Rfc3JolItsE76LQ=;
        b=t86VBiDwHDET51NWNZE2x6plW4jy/kmdKNB10w+nxlnXOnCoGTMr7Ku0tyj0s8FHfT
         MRBG2cooYRFcuwe+fN8t8/oJYxbQFkUO1zxREw0UK3Jrb3TstBS3JXK2lVCufSZiScy3
         nhBgkTZQiS6TL6oEsBnzn4viFU1n52/z3EMmwAv6zkuHQidgQAe+mu4vTCgVI+bghi4Q
         hReMp2T+zHfEj8GvwW6XfuphS5AxGNIe0/s9GNTuHoiBWQEoliqZM0KdMbk5OBvGS7VT
         cBdzbu/aRh68WsMJ32ZEGU+AC8f4TNJ8nQmzQUFhYLmllKlqdlUiK3IjpeIpqx70qoTV
         tDzw==
X-Gm-Message-State: AOJu0YyegaETyJLwv7isP+D1g2UPjvK+2H5CSlRVf2xpekxejYR9sJcY
	7TLX0O5yb5rcJybLiOxHI+Oy1MPGY9Wy6hssBNQkIFDvcKrpIjliTblTfGkqi6oeXC03x7PwzrO
	VrBWKG9wl4oa4/khHHJdmFO0PsKt6PNTF5YDKVQ==
X-Google-Smtp-Source: AGHT+IH5rADIiODtX1T9cNFKFjTNZBXG1wvHIhFopsvz0sTCJga4NXok6BE2xgqTLVMCv2j0xazwXaXi1UNjAs8aPWI=
X-Received: by 2002:aa7:c989:0:b0:55a:92f:8320 with SMTP id
 c9-20020aa7c989000000b0055a092f8320mr564035edt.4.1705588057295; Thu, 18 Jan
 2024 06:27:37 -0800 (PST)
MIME-Version: 1.0
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-10-carlo.nonato@minervasys.tech> <7fbe9526-60cf-4844-8b48-58ab69ec1b29@suse.com>
 <101c638c-03ee-471b-a6c8-9c2c10772001@suse.com>
In-Reply-To: <101c638c-03ee-471b-a6c8-9c2c10772001@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 18 Jan 2024 15:27:26 +0100
Message-ID: <CAG+AhRXctKrh8UcLsygA8aoiVkc8HaOqG-gNOwtmJyjebhDU2A@mail.gmail.com>
Subject: Re: [PATCH v5 09/13] xen: add cache coloring allocator for domains
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Tue, Jan 9, 2024 at 11:33=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 09.01.2024 11:28, Jan Beulich wrote:
> > On 02.01.2024 10:51, Carlo Nonato wrote:
> >> v5:
> >> - Carlo Nonato as the new author
> >> - the colored allocator balances color usage for each domain and it se=
arches
> >>   linearly only in the number of colors (FIXME removed)
> >
> > While this addresses earlier concerns, meanwhile NUMA work has also
> > been progressing. What's the plan of interaction of coloring with it?
>
> Thinking of interactions - what about static memory? Is coloring incompat=
ible
> with that? If so, should the two features be excluded to both be used at =
the
> same time?

This was done in one of the earlier revisions. Then it was dropped because
we thought that it would have been better to have a binary that supported b=
oth
static memory and coloring. The only checks are done at runtime.

> Jan

Thanks.


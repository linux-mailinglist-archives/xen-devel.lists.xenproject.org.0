Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B7791A618
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 14:02:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750015.1158276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMnpq-0006uh-Ks; Thu, 27 Jun 2024 12:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750015.1158276; Thu, 27 Jun 2024 12:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMnpq-0006sU-Gy; Thu, 27 Jun 2024 12:02:42 +0000
Received: by outflank-mailman (input) for mailman id 750015;
 Thu, 27 Jun 2024 12:02:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8NqD=N5=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sMnpo-0006rT-UB
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 12:02:40 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26d466b2-347d-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 14:02:40 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57d07673185so1710243a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 05:02:40 -0700 (PDT)
Received: from localhost ([160.101.139.1]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-584d0c9db1csm783231a12.13.2024.06.27.05.02.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jun 2024 05:02:39 -0700 (PDT)
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
X-Inumbo-ID: 26d466b2-347d-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719489759; x=1720094559; darn=lists.xenproject.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X9JgqsrnYL4gqd6bzHldK3PBIc55az4D0y+TZMTcpFI=;
        b=NHEMmgCYEwkSAVTp4lVHzw1MLex7zOQ58gmweWkU7PDqYFBnLcNQkxvTqxAr4DujGL
         nwaZi4w8Lk5tl3e6B/XOnjD1uc7k3eZKvZuNtjwgJT8XvGUNbexNC94pNAwElBPfyGKE
         GvtT7ek9U5HBO2smdDBsoVfSrnVjMLwHcr9Js=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719489759; x=1720094559;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X9JgqsrnYL4gqd6bzHldK3PBIc55az4D0y+TZMTcpFI=;
        b=J2Y39+7gMylJfO7xi7zPMVnhG3LW95gEnmY5tha311cJixRQ2MQdTe+74EeQ2otIwk
         dy6DDtB4CoxkCJqWNYBf9YgR7IkYunNevY4kEGvan4mh7rX+NDlWxA11PpcU8odFzfmR
         CAji8osjQjC0ot+l17T7Oj+LgeXkYSwHJrfd2mI1z0veBegjeo2pD5Xy60qdxuiUcz97
         Rtr+OrP0QV0hy0nZaVnh/7Ex1JdJC2BLcTHlDUAdZkAuYJwSEiA6OM1kwzKRmtjXhq5m
         mN85q95d9G/ho7MzYVKhzAol4sBJd8eqecMJOgxGTMGxNK+OQ3a+PQFTk4t4HF5rFkQj
         22UA==
X-Forwarded-Encrypted: i=1; AJvYcCWFmb2w24bMJKVbjETPYUhn2LPXbt3fXdI/7xkMHN4K3dose5LQ6+eIZSjyDM8vXJJw+Ix96cp8VW17QmXnrKITv5gET7aJ7n7g2i2QYzM=
X-Gm-Message-State: AOJu0Yywa/tZHMjtpnVszP1Idc44DRz1OTa9Fii80Ht96V+h3HK/dAoG
	L2LWI7YQhDPUqr5DftBjyqyiISrx+qDyNo5nhfHudBqT7ytW+4HXQ4wOWM6PshU=
X-Google-Smtp-Source: AGHT+IF/XoiggOr2fov/DFwO1VFgZ0smjAEzWCGAyWa8Aaf9hqheRxlSk2IXEZpCaEQ8HL5RoH5wQA==
X-Received: by 2002:a50:8e4f:0:b0:57c:6234:e95b with SMTP id 4fb4d7f45d1cf-57d4a273a55mr10984201a12.5.1719489759428;
        Thu, 27 Jun 2024 05:02:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Jun 2024 13:02:37 +0100
Message-Id: <D2AS8XQPR3TS.TDT0A6SPW47G@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross"
 <jgross@suse.com>, "Xen-devel" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH v4 06/10] tools/libguest: Make setting MTRR registers
 unconditional
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
X-Mailer: aerc 0.17.0
References: <cover.1719416329.git.alejandro.vallejo@cloud.com>
 <2c55d486bb0c54a3e813abc66d32f321edd28b81.1719416329.git.alejandro.vallejo@cloud.com> <fe255839-f8ab-4dd1-abe8-8ec834099a8d@suse.com>
In-Reply-To: <fe255839-f8ab-4dd1-abe8-8ec834099a8d@suse.com>

On Thu Jun 27, 2024 at 10:42 AM BST, Jan Beulich wrote:
> On 26.06.2024 18:28, Alejandro Vallejo wrote:
> > This greatly simplifies a later patch that makes use of HVM contexts to=
 upload
> > LAPIC data. The idea is to reuse MTRR setting procedure to avoid code
> > duplication. It's currently only used for PVH, but there's no real reas=
on to
> > overcomplicate the toolstack preventing them being set for HVM too when
> > hvmloader will override them anyway.
>
> Yet then - why set them when hvmloader will do so again?

To keep the toolstack complexity tractable, essentially. This way I can sen=
d N
hypercalls (for N vCPUs) rather than 2*N and have a single hvmcontext struc=
t
rather than several.

In truth though, I could simply write back the old MTRRs taken from bsp_ctx=
 on
HVM.

> Is it even guaranteed
> to be no change in (guest) behavior to do so?

hvmloader overrides those values, so there is no change by the time BIOS or=
 OVMF
start running. As I mentioned before though, I can actually upload back the=
 old
values in the HVM case.

>
> Plus what about a guest which was configured to have the CPUID bit for MT=
RRs
> clear?
> I think we ought to document this as not supported for PVH (we may

By "this" do you mean PVH _must_ have MTRR support? I would agree.

> actually choose to refuse building such a guest), but in principle the MT=
RR
> save/load operations should simply fail for a HVM guest in said configura=
tion.

What use cases does that cover? With the adjustment I mention at the top th=
at
should be sorted. I'm wondering why we allow !mtrr at all.

> Making such a change in Xen now would, afaict, be benign to the tool stac=
k.
> After this adjustment it would result in a perceived regression, when the=
re
> shouldn't be any.

Fair point.

>
> Thinking about it, even for PVH it may make sense to allow CPUID.MTRR=3D0=
, as
> long as CPUID.PAT=3D1, thus forcing it into PAT-only mode. I think we did=
 even
> discuss this possible configuration before.
>
> Jan

Is PAT-only an existing real HW configuration? Can't say I've seen any.

Cheers,
Alejandro



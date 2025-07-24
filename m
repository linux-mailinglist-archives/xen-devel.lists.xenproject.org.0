Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A84CB10F4E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 18:00:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056319.1424547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueyMP-0002PR-Gu; Thu, 24 Jul 2025 15:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056319.1424547; Thu, 24 Jul 2025 15:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueyMP-0002MK-Dg; Thu, 24 Jul 2025 15:59:57 +0000
Received: by outflank-mailman (input) for mailman id 1056319;
 Thu, 24 Jul 2025 15:59:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v1w5=2F=cloud.com=aidan.allen1@srs-se1.protection.inumbo.net>)
 id 1ueyMN-0002Lx-Oa
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 15:59:55 +0000
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [2607:f8b0:4864:20::1136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d12a308-68a7-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 17:59:55 +0200 (CEST)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-7183fd8c4c7so13679187b3.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 08:59:54 -0700 (PDT)
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
X-Inumbo-ID: 3d12a308-68a7-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753372793; x=1753977593; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJ3QeMp2De97qVCnB6GryfgAIigcXoSp5PJMFjc70io=;
        b=SMb6I1d08XLDylm0FD5kVr6GTG+Uyc6AV84l7XKtozcrRFHxDC2m2V2oR69wvZbXs9
         qgo5muUv/F+GXf+vWbQ6GX9JGigKRMTOKCdP+mMtjhR3gok7MLt5RlZ2z8wfvaqoFZQe
         p+IUG5WYhUnNzhuuoQsDR3UWwPsT8q138xHlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753372793; x=1753977593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJ3QeMp2De97qVCnB6GryfgAIigcXoSp5PJMFjc70io=;
        b=gm+MxUjwtcYR6HrcW87uc+B5XnL4u0sjZh3cBkZkA9RNjVlR8mhSHvRkg++LjsOyj1
         soKDlNTi50mBYYw/7LRROewG7cLqObaoxfKYiL/LAyq2SgBbaZm+4NmOpQfFS15XLfSO
         DhszhZi6QcAlqJi3SvNoK8w3iZip8E87uBJYZi3lMs7F4mRpehxMa8cRcpnrdMU5gjYd
         ZaENIMhcQtBO7IgeMYyOtuhtDVqSBhys+CwR4HBSZdccMOMIMSiv0E3AIEevZTtsHsr+
         VnQxwU8Ubq82Y2dSdbhdXdfNTm0IXTu4jTwgot0Km7tdJHyndSL1S5dq0NkfNx25LjLI
         tdlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIa+ap5eUn/NiHsBcf+gTwd7KgcKfccasC+63OVK3CI++vUA6Ltoir/MCgA6rwhgfC5kiSiHTjjpA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw458FpxcqTw/jlSXBYqERohC7/ukPVEuOffZkKv9Nz7+6msQd3
	W/q7XP689MuPeEkQX9yWxeP0WNXiWwQ7lgsifNfpw/7mmTPxf0XU+rqWQzjMFss9gj6XXEJC4Z+
	ZQe8YePIQIw2eVxL1JFK3MDjQ7zJHxfw0eq2ZQLiu6w==
X-Gm-Gg: ASbGnctwFHido0S7iHxtm34BkIpaF4vBH5f/bOQjO/xyUu4AXirV1OD8UBkmZI6sv5n
	XwK0UxTtx/q7KHnzI2pCGfLu5pnAPqGAxeHO7+hBGscfxCRJ6qZ4LBKEB9Smz0wvd86N4Gj3XEr
	O8JEhV7S3dP6dNYNiYCY9G8hJHNtyy/lzqHi0ZAM+EJzSK9ZzuVLQzCyXG2QzrsMQPBbcDyDS0j
	e9I4sec
X-Google-Smtp-Source: AGHT+IHvNfhpUyp5Xi/s5ryQ//Aw7W9wKJ3zky1xPAIEyPl+3lqYRgaMaTQMVhmp+PG9ztZ1DCfN3G0kOZDr16z+rg8=
X-Received: by 2002:a05:690c:9a0c:b0:70e:2ba2:659d with SMTP id
 00721157ae682-719b420cf85mr90054777b3.23.1753372793308; Thu, 24 Jul 2025
 08:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <CANgacT8YrH66iUEPr60AVytXYMivPzxC0SO4_RPohjk1Vo2w8Q@mail.gmail.com>
 <a0892208-84c5-4cd6-b246-869e38ecf73c@suse.com>
In-Reply-To: <a0892208-84c5-4cd6-b246-869e38ecf73c@suse.com>
From: Aidan Allen <aidan.allen1@cloud.com>
Date: Thu, 24 Jul 2025 16:59:42 +0100
X-Gm-Features: Ac12FXyt2Y47HJ752tUF1U9T56RUcemk9EdlOnm4y1k_EPgW3IazHO_dcW3VM54
Message-ID: <CANgacT_idZJtjxo2v5RFBf3rBL6fmz1drtWt9o5y8yGJNc15ZQ@mail.gmail.com>
Subject: Re: [PATCH] x86/domain: Dump domain paging pool sizes with the rest
 of the pageframe info
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bernhard Kaindl <Bernhard.Kaindl@cloud.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 12:52=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 24.07.2025 13:40, Aidan Allen wrote:
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -253,6 +253,10 @@ void dump_pageframe_info(struct domain *d)
> >                 page->count_info, page->u.inuse.type_info);
> >      }
> >
> > +    printk("    Domain paging pool: total: %d, free: %d, p2m: %d\n",
> > +           d->arch.paging.total_pages, d->arch.paging.free_pages,
> > +           d->arch.paging.p2m_pages);
>
> Should this perhaps be gated, to avoid printing all zeroes for domains no=
t
> using an paging mode? Whether to use paging_mode_enabled() to do so I'm n=
ot
> sure, as a domain with no paging mode enabled could still have a paging
> pool configured.
>

Hi Jan,
I can gate this on total_pages > 0 if that would address your concern
with paging_mode_enabled().

However, regarding the gating itself, I don't believe that the line
saved by not printing this
is worth the potential confusion of somebody looking for this
information and not finding
it, I would prefer to leave it printing all zeroes.

Best, Aidan.


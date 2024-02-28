Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD5286B1E9
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 15:35:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686679.1068982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfL1B-0006ju-25; Wed, 28 Feb 2024 14:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686679.1068982; Wed, 28 Feb 2024 14:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfL1A-0006hV-VA; Wed, 28 Feb 2024 14:34:44 +0000
Received: by outflank-mailman (input) for mailman id 686679;
 Wed, 28 Feb 2024 14:34:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4Dg=KF=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rfL19-0006hL-U7
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 14:34:43 +0000
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [2607:f8b0:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81fa8732-d646-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 15:34:42 +0100 (CET)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6e56d594b31so219702b3a.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 06:34:42 -0800 (PST)
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
X-Inumbo-ID: 81fa8732-d646-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709130880; x=1709735680; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULSlAjwWXGhSHuHX6N2FXR6xOtwfEQECei5WCk+WRwc=;
        b=PFszrlCbC1PvdFzYSVPlbJ+oRm/nBemKSIwuAsucUC/NgzSSbU1uOEmNn2eeTYiOSW
         dh78zl6v4DHVnn2jfJCtwF/QUK0MnRXpprmRJRZHNh7bOWHtKCOjvOTD1IeuhxFY4YS6
         PiRqQTLqQDrL40z6rd+a7hvKMvr68SD3pIjUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709130880; x=1709735680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ULSlAjwWXGhSHuHX6N2FXR6xOtwfEQECei5WCk+WRwc=;
        b=PYD1Xw/LCwKEpXmC3FrjK1K3CXhYzTlFzP1Xe5kGHflGJOKiNAH++W5tt41IAzXaim
         1yP6WcmYhWSOzqgywLTRrK3nKQSoWoXuyG9Jy6WiJjkrYox8RrWYdyW65VFI80V9DuQH
         c+Bx1XuFLlpOiuMvB/+g3ufk85HKK1u/41xWMc/l+KwZp22r0flNFSxNTQocWoz84nIg
         0JvW8DiMzXw+nQQd3W9+IqyRAwo5w8wzUkf/BMpMMwhU1y4dBLxxAevgk+MQJROLhpRL
         CQkGtEE/KD/E8YCKOwyychnTUEhE/lBzqxQHBpHMuaatwfCJjXro9oAfCGSNuhC1vOeV
         8Jwg==
X-Forwarded-Encrypted: i=1; AJvYcCV6Sh/9kalGGD95MuvSBKILPGD5qnkmp+TLH5EQt3mtFlBzvd4SgmYeYlkPXb9SYwId3VQ+XWr35Myxi74TzxC8T/7RDEQRo6tToZLTWPk=
X-Gm-Message-State: AOJu0YyFRmyET8J1EJi0PLDHJriny9K4i6Tq7s89+w+pUm7OrA/90gNZ
	anJhjsjtSQOjTvyF94sx3N2feEZBY01cimCjaoEgiGJLt9692SPJ/0adPxHHaJnJmWElpjKl2QC
	blRE6PJRuqlzA2Srod+zv1T1Tx66Op9dkK93s2RFeoxYCRdxCIXRt
X-Google-Smtp-Source: AGHT+IF1r0nIc/BifAyhN/P28DHFrRL6E2dBy5ugOhljUKrfcMZYVvHTIwO3zE8vsqmhBOTbll6cVVlYAZCa3u7pa1k=
X-Received: by 2002:a17:90b:14a:b0:29a:6c13:f0a with SMTP id
 em10-20020a17090b014a00b0029a6c130f0amr10654397pjb.16.1709130880490; Wed, 28
 Feb 2024 06:34:40 -0800 (PST)
MIME-Version: 1.0
References: <20240227112528.4540-1-roger.pau@citrix.com> <20240227112528.4540-2-roger.pau@citrix.com>
 <e8ffdaa2-0786-4f9b-b4c4-03fe88e5c72b@citrix.com>
In-Reply-To: <e8ffdaa2-0786-4f9b-b4c4-03fe88e5c72b@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Wed, 28 Feb 2024 14:34:29 +0000
Message-ID: <CAG7k0Eq8V3v6Jc3Z5d=mxzWuJ6DSHW5XZ1=D5MCw67W2LDY3sw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] xen/livepatch: register livepatch regions when loaded
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 1:08=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 27/02/2024 11:25 am, Roger Pau Monne wrote:
> > diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
> > index ddac5c9147e5..e3a4dc8540df 100644
> > --- a/xen/common/virtual_region.c
> > +++ b/xen/common/virtual_region.c
> > <snip>
> >
> > +#ifdef CONFIG_LIVEPATCH
> >  void unregister_virtual_region(struct virtual_region *r)
> >  {
> > -    /* Expected to be called from Live Patch - which has IRQs disabled=
. */
> > -    ASSERT(!local_irq_is_enabled());
> > -
> >      remove_virtual_region(r);
> > +
> > +    /* Assert that no CPU might be using the removed region. */
> > +    rcu_barrier();
> >  }
> >
> > -#if defined(CONFIG_LIVEPATCH) && defined(CONFIG_X86)
> > +#ifdef CONFIG_X86
> >  void relax_virtual_region_perms(void)
> >  {
> >      const struct virtual_region *region;
> > @@ -117,6 +106,7 @@ void tighten_virtual_region_perms(void)
> >      rcu_read_unlock(&rcu_virtual_region_lock);
> >  }
> >  #endif
> > +#endif
>
> Can we please have:
>
> #endif /* CONFIG_X86 */
> #endif /* CONFIG_LIVEPATCH */
>
> before this gets any more complicated to follow.  Can be fixed on commit.
>

LGTM with this suggested change.

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>


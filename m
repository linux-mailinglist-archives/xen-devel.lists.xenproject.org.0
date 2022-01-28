Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E573D49FE63
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 17:51:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262101.454192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDUSQ-0003ap-Kb; Fri, 28 Jan 2022 16:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262101.454192; Fri, 28 Jan 2022 16:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDUSQ-0003Xp-Go; Fri, 28 Jan 2022 16:50:42 +0000
Received: by outflank-mailman (input) for mailman id 262101;
 Fri, 28 Jan 2022 16:50:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BgXU=SM=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nDUSO-0003Xj-Ol
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 16:50:40 +0000
Received: from MTA-13-4.privateemail.com (mta-13-4.privateemail.com
 [198.54.127.109]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69fc1891-805a-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 17:50:39 +0100 (CET)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
 by mta-13.privateemail.com (Postfix) with ESMTP id C81F018000A3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jan 2022 11:50:34 -0500 (EST)
Received: from mail-yb1-f175.google.com (unknown [10.20.151.178])
 by mta-13.privateemail.com (Postfix) with ESMTPA id 9E9AC18000A8
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jan 2022 11:50:34 -0500 (EST)
Received: by mail-yb1-f175.google.com with SMTP id 23so20206269ybf.7
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jan 2022 08:50:34 -0800 (PST)
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
X-Inumbo-ID: 69fc1891-805a-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1643388634;
	bh=2gOTaKu5OJW0q3pN4afbReMvy9fxCsLuFD6TdYYeVEc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZS8csAY0j4SgUkJ9gCA1pp0MFb6dYSWERWH+PwQInQIL77eMCkG6nYdBT6PUPgvC6
	 CGiKWFK2Igm9gNyJc1z9SS17EtnT4du/IlH1BilKqkpzE2333MmO6yKrHnwnTmVnxa
	 aGzK1GC+j3Cmg81ZLubdWECZCQCc1YjJeZANKV6UEjG+RDStHir3zr6MNA7tpVmGU8
	 gaFkXPRtHHP8W8c84qfnz+OM2hPbJB/u74cpcSiOLmlCYm+itpCeBdjv7Emvls8hWu
	 huDK9dWOsvLqu+f8/74Vld7nSju/IVyFQ+xjrXqDJ3ifhBajMROnycAT5DHYcxI1wL
	 atLz/JQB4ce9g==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1643388634;
	bh=2gOTaKu5OJW0q3pN4afbReMvy9fxCsLuFD6TdYYeVEc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZS8csAY0j4SgUkJ9gCA1pp0MFb6dYSWERWH+PwQInQIL77eMCkG6nYdBT6PUPgvC6
	 CGiKWFK2Igm9gNyJc1z9SS17EtnT4du/IlH1BilKqkpzE2333MmO6yKrHnwnTmVnxa
	 aGzK1GC+j3Cmg81ZLubdWECZCQCc1YjJeZANKV6UEjG+RDStHir3zr6MNA7tpVmGU8
	 gaFkXPRtHHP8W8c84qfnz+OM2hPbJB/u74cpcSiOLmlCYm+itpCeBdjv7Emvls8hWu
	 huDK9dWOsvLqu+f8/74Vld7nSju/IVyFQ+xjrXqDJ3ifhBajMROnycAT5DHYcxI1wL
	 atLz/JQB4ce9g==
X-Gm-Message-State: AOAM533HKomO5MMcKTlO2vyD84wJKQ175gFQZDz/KVDlNQepV7zVO/PH
	X0sYjELDA5Y7p9I6Dlk8Y+rfDvMttMvOVazv+CU=
X-Google-Smtp-Source: ABdhPJxbyU2ABOdpmmUvetiK33osOv5PkI39+hac/yMtnQr9B7lWlFfc9MaTyRq5e6rK7OPGFcF+RSO8qhBqjFDJ6y8=
X-Received: by 2002:a5b:2ce:: with SMTP id h14mr11860232ybp.572.1643388633788;
 Fri, 28 Jan 2022 08:50:33 -0800 (PST)
MIME-Version: 1.0
References: <2c421077-81c2-a45e-f7c3-9827d3cb1abf@suse.com>
In-Reply-To: <2c421077-81c2-a45e-f7c3-9827d3cb1abf@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 28 Jan 2022 11:49:58 -0500
X-Gmail-Original-Message-ID: <CABfawhk0qDnOdO9DOKLPPNW=FtpGSJvJQAzmKRxxdkwjfeGSYA@mail.gmail.com>
Message-ID: <CABfawhk0qDnOdO9DOKLPPNW=FtpGSJvJQAzmKRxxdkwjfeGSYA@mail.gmail.com>
Subject: Re: [PATCH v3] x86/altp2m: p2m_altp2m_propagate_change() should honor
 present page order
To: Jan Beulich <JBeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, Jan 27, 2022 at 10:07 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> For higher order mappings the comparison against p2m->min_remapped_gfn
> needs to take the upper bound of the covered GFN range into account, not
> just the base GFN. Otherwise, i.e. when dropping a mapping overlapping
> the remapped range but the base GFN outside of that range, an altp2m may
> wrongly not get reset.
>
> Note that there's no need to call get_gfn_type_access() ahead of the
> check against the remapped range boundaries: None of its outputs are
> needed earlier, and p2m_reset_altp2m() doesn't require the lock to be
> held. In fact this avoids a latent lock order violation: With per-GFN
> locking p2m_reset_altp2m() not only doesn't require the GFN lock to be
> held, but holding such a lock would actually not be allowed, as the
> function acquires a P2M lock.
>
> Local variables are moved into the more narrow scope (one is deleted
> altogether) to help see their actual life ranges.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Note that this addresses only half of the problem: get_gfn_type_access()
> would also need invoking for all of the involved GFNs, not just the 1st
> one.
> ---
> v3: Don't pass the minimum of both orders to p2m_set_entry() (as was the
>     case in the original code). Restore get_gfn_type_access() return
>     value checking.
>
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -2534,9 +2534,6 @@ int p2m_altp2m_propagate_change(struct d
>                                  p2m_type_t p2mt, p2m_access_t p2ma)
>  {
>      struct p2m_domain *p2m;
> -    p2m_access_t a;
> -    p2m_type_t t;
> -    mfn_t m;
>      unsigned int i;
>      unsigned int reset_count = 0;
>      unsigned int last_reset_idx = ~0;
> @@ -2549,15 +2546,16 @@ int p2m_altp2m_propagate_change(struct d
>
>      for ( i = 0; i < MAX_ALTP2M; i++ )
>      {
> +        p2m_type_t t;
> +        p2m_access_t a;
> +
>          if ( d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
>              continue;
>
>          p2m = d->arch.altp2m_p2m[i];
> -        m = get_gfn_type_access(p2m, gfn_x(gfn), &t, &a, 0, NULL);
>
>          /* Check for a dropped page that may impact this altp2m */
> -        if ( mfn_eq(mfn, INVALID_MFN) &&
> -             gfn_x(gfn) >= p2m->min_remapped_gfn &&
> +        if ( gfn_x(gfn) + (1UL << page_order) > p2m->min_remapped_gfn &&
>               gfn_x(gfn) <= p2m->max_remapped_gfn )

Why are you dropping the mfn_eq(mfn, INVALID_MFN) check here?

Tamas


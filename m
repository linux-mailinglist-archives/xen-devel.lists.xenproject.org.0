Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0695ABD599
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 12:54:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990639.1374577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHKbm-0005yF-VY; Tue, 20 May 2025 10:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990639.1374577; Tue, 20 May 2025 10:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHKbm-0005vu-Sr; Tue, 20 May 2025 10:54:06 +0000
Received: by outflank-mailman (input) for mailman id 990639;
 Tue, 20 May 2025 10:54:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aDZd=YE=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uHKbl-0005vo-QE
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 10:54:05 +0000
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [2607:f8b0:4864:20::c2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bddd5681-3568-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 12:54:03 +0200 (CEST)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-601ad30bc0cso4527703eaf.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 03:54:03 -0700 (PDT)
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
X-Inumbo-ID: bddd5681-3568-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747738442; x=1748343242; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGVwrBMgdBsxlnizpiLyvWOkFnjHtdjObKHW6G+TjR4=;
        b=AYxyVNcaIQxOokA7O7Ve4KBZOAO1pOL0FrYwMCd1NQTNmE8BH837Rx8cCN8/4NMqO7
         aHvo23fn40Ch/erKWIsJWmctdVz4na4hCMX5Xj6avKBydaDFHC7/mqaurKg+1MuDSkWw
         vGTSk6QkoNRyc72fY99kySDGy1r2MZvEy4KFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747738442; x=1748343242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGVwrBMgdBsxlnizpiLyvWOkFnjHtdjObKHW6G+TjR4=;
        b=diM3KVc702wFC3x+KTkNuApzsLsteS15PfGmAv3AyObudd16B+6yk2osKD45IhOM1K
         Sr2aTWZRf22Enhi6RjqFHSxHPGLud2pjd+qkjvt0tfuQqRbZ0uAFKROw1szrJ1m8x4pA
         OLkAUPR/QxwPXzB/owERz3WmbazqeFbcVpenvxZO0usljonXuimdi2vh32ou0t43PP15
         aatHb2T1RcHbRFqNjfWQGjwzRKF6VqEvRu3ZXer94nIxk+3cu9nA4qPEfV0XQpBbN/+N
         2rIfhxdqDvZ5J0i8GSfWNIQhZwEjMyIjh/ztTsa9j4rl5OhuBgDMsZPVITKVM+Kwi4cF
         nlXw==
X-Gm-Message-State: AOJu0YxDBpRfNzdmoy0apzKk6HrEijtwKL6zAHnqNGNWMf/nO+4OPqkj
	hj8TVaR5dYuQoZZMoglEnTATxymttLF43TJa34u5U5YaLQ7i8dyPyYVRynhD954KEGYEDFGotvo
	/VMzm1kcsBGSqpdrwcqG5bGP7atEOmz8NmXaOTzZMgW5yLMSkKkvoNg==
X-Gm-Gg: ASbGncvB+tocPMlGGXXS5PCHiOrq5CMqGnfF4aMJfwbk8rj1Q+GEcvT2SH2TJulf+8h
	NiC7f5Cz1aJg1YCEEzjBOPFMJfkcq5nLIWNC/7JLUf1k2XoeI9SQ0QEr3rG9jBfym4Wze3Z67GV
	wBmyP3W+kaXJL5aN+eTLK23xGtDoZBo8w=
X-Google-Smtp-Source: AGHT+IFuQOj3S3pNtduZiarIFmLlJlJ1KXTXmEGZzD637yphG81T/AackFlkcxXZEcds3x0fZcdi08ZDHc7Hm+3ZSQI=
X-Received: by 2002:a4a:ec43:0:b0:603:f809:ce19 with SMTP id
 006d021491bc7-609f38b5d20mr8515684eaf.3.1747738442026; Tue, 20 May 2025
 03:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250512144656.314925-1-ross.lagerwall@citrix.com>
 <20250512144656.314925-2-ross.lagerwall@citrix.com> <204e177c-beba-41a1-93bf-3ae6454875cc@suse.com>
In-Reply-To: <204e177c-beba-41a1-93bf-3ae6454875cc@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Tue, 20 May 2025 11:53:51 +0100
X-Gm-Features: AX0GCFtrwzoYOnZoUGt8Lfv8goLG49nSFPprLdbqQR1YewUINpoSBO_ypMvy_lE
Message-ID: <CAG7k0EqeXPiBZ8AJG2VuszCPvcQAiVh25B8=3SfLsECk-FYs3g@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] x86/pmstat: Check size of PMSTAT_get_pxstat buffers
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 3:27=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 12.05.2025 16:46, Ross Lagerwall wrote:
> > Check that the total number of states passed in and hence the size of
> > buffers is sufficient to avoid writing more than the caller has
> > allocated.
> >
> > The interface is not explicit about whether getpx.total is expected to
> > be set by the caller in this case but since it is always set in
> > libxenctrl it seems reasonable to check it.
>
> Yet if we start checking the value, I think the public header should also
> be made say so (in a comment).
>
> > --- a/xen/drivers/acpi/pmstat.c
> > +++ b/xen/drivers/acpi/pmstat.c
> > @@ -103,8 +103,10 @@ int do_get_pm_info(struct xen_sysctl_get_pmstat *o=
p)
> >
> >          cpufreq_residency_update(op->cpuid, pxpt->u.cur);
> >
> > -        ct =3D pmpt->perf.state_count;
> > -        if ( copy_to_guest(op->u.getpx.trans_pt, pxpt->u.trans_pt, ct*=
ct) )
> > +        ct =3D min_t(uint32_t, pmpt->perf.state_count, op->u.getpx.tot=
al);
>
> With this, ...
>
> > +        if ( ct <=3D op->u.getpx.total &&
>
> ... this is going to be always true, isn't it? Which constitutes a violat=
ion
> of Misra rule 14.3.
>
> Also it would be nice if the min_t() could become a normal min(), e.g. by
> "promoting" op->u.getpx.total to unsigned int via adding 0U. This way it'=
s
> clear there's no hidden truncation (or else there might be an argument fo=
r
> keeping the check above).
>
> > +             copy_to_guest(op->u.getpx.trans_pt, pxpt->u.trans_pt, ct =
* ct) )
> >          {
> >              spin_unlock(cpufreq_statistic_lock);
> >              ret =3D -EFAULT;
>
> Why would you constrain this copy-out but not the one just out of context
> below here? (The question is of course moot if the condition was dropped.=
)
>

Oh, I had intended this condition to be...

    if ( ct =3D=3D op->u.getpx.total &&

... based on your previous comment about the difficulties of partially
copying a 2d array.

> An option may be to document that this array is copied only when the
> buffer is large enough.

I left the other alone since partially copying a 1d array makes sense.

If you would prefer, I can drop the condition and just let the caller
deal with the partially copied 2d array?

Thanks,
Ross


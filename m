Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFA2AE2061
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 18:50:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021049.1397096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSewW-0001Xp-Dd; Fri, 20 Jun 2025 16:50:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021049.1397096; Fri, 20 Jun 2025 16:50:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSewW-0001Ve-Ar; Fri, 20 Jun 2025 16:50:20 +0000
Received: by outflank-mailman (input) for mailman id 1021049;
 Fri, 20 Jun 2025 16:50:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sh1O=ZD=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uSewU-0001VY-Qe
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 16:50:18 +0000
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [2607:f8b0:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4ac5cca-4df6-11f0-a30e-13f23c93f187;
 Fri, 20 Jun 2025 18:50:17 +0200 (CEST)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-735a9e65471so1352018a34.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jun 2025 09:50:17 -0700 (PDT)
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
X-Inumbo-ID: a4ac5cca-4df6-11f0-a30e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750438216; x=1751043016; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HEQFGKNlvnV0WWWe+o2xBNWZHoaIv+2Wj2ukolubR4=;
        b=BT5wDAqO/uuxuRd7/4AwEE24YhevFg2J9kbfjRAFWNkoIaQAFNgB8jvaoNcyanzGqA
         aUZqA/PBtJoo91eJ2oMKeWB5c0C64K0rxfHHgcI8+BwFtOBRvXZ0YWvacceGKZhYfhgI
         cGFjrWNDn0rczB6muJmxlR2RvOk4WlIuFZdUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750438216; x=1751043016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5HEQFGKNlvnV0WWWe+o2xBNWZHoaIv+2Wj2ukolubR4=;
        b=dCkvZ77BjAqalGeQ04W96uX0Xeim5x0VyhZqqf/Enz3OR1VcWXVoPhlVyR8g2oB+q2
         yYiKWPnMtwFfBzQae8yZ1DC+rLHHLElIHhfS0oC/X9hS99D+ndTXn/meCd/w7Qqd1b9K
         12Q9svYRx3HHU1a8JhT52X+kY82DdP0NE2YTjSFbu6MXStUDQSpvSp5F4d551hNvy261
         pCI8pNfgp6vaQk+QjeYDgVJOxGG5IrYLNPsFz2g8RgeRHE+Ahe6ZJnztRYocqWSdEaBF
         twFHWdo56b5nf6jfUfLuQoVcQgT/RR9uu99ub5Dxi1D3e/elB4RnDfYWfA75Eiif5PZ4
         Uq5Q==
X-Gm-Message-State: AOJu0YzbVBtPFuaPdvCJV/ek0hNqmaUlE0s8TZpFtABSUxgk8WNLAxv2
	ANW9KeB/MY5J/aThy/wcImMJHDuTnyz/QKo+YwUlSCbNneUU9wbw/u/s0da++cRmrhwdzUbTcgN
	aoAi9aCcp06O1xfOnO47xpP3GDj6GE19AKsgwvpZN
X-Gm-Gg: ASbGncu2TDknQ+yC0ZCM7UBEwXuzkW6USn1WVBA0YZZUGXqs5L9wYoQW4joUBuD9TeI
	PaN3TN3y8rFYx8r8T8JmyJ35NILTdsgR77Wt/yEV1DNZHbhv5VWl0mhgH3TVbRBxXp2AO04ad21
	2iWt/EIwuIvQ5LPxX+uIQDgxyOoYx956oj2thqWxAiwQ==
X-Google-Smtp-Source: AGHT+IErRfGjIiVPjVRJ4pLvOCxkMsfFKO8Qu1Gz1bCsphQVU47jSbcqm04sk7ACue/CLY7vpT9SPZu+l0MKlJSsPJI=
X-Received: by 2002:a05:6871:2109:b0:2bc:6933:4a9f with SMTP id
 586e51a60fabf-2eeee4dab69mr2416712fac.25.1750438216132; Fri, 20 Jun 2025
 09:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250602133639.2871212-1-ross.lagerwall@citrix.com>
 <20250602133639.2871212-6-ross.lagerwall@citrix.com> <aFU4csM2UFNeCykO@macbook.local>
In-Reply-To: <aFU4csM2UFNeCykO@macbook.local>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Fri, 20 Jun 2025 17:50:03 +0100
X-Gm-Features: Ac12FXzoMzHZeEJY_80h4ToJuAOXkENN-PTXRc7FOsZs2OIWW-M-QnGPuhnOqDQ
Message-ID: <CAG7k0Eo=vUtP0G3qh8TAcpah3REneMdZhgsXzKSx-RVOMZKPeA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] livepatch: Verify livepatch signatures
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 11:31=E2=80=AFAM Roger Pau Monn=C3=A9 <roger.pau@ci=
trix.com> wrote:
>
> On Mon, Jun 02, 2025 at 02:36:37PM +0100, Ross Lagerwall wrote:
> > From: Jennifer Herbert <jennifer.herbert@cloud.com>
> >
> > Verify livepatch signatures against the embedded public key in Xen.
> > Failing to verify does not prevent the livepatch from being loaded.
> > In future, this will be changed for certain cases (e.g. when Secure Boo=
t
> > is enabled).
> >
> > Signed-off-by: Jennifer Herbert <jennifer.herbert@cloud.com>
> > Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> > ---
> >
> > In v3:
> >
> > * Minor style fixes
> >
> >  xen/common/livepatch.c          | 103 ++++++++++++++++++++++++++++++++
> >  xen/common/livepatch_elf.c      |  55 +++++++++++++++++
> >  xen/include/xen/livepatch.h     |  10 ++++
> >  xen/include/xen/livepatch_elf.h |  18 ++++++
> >  4 files changed, 186 insertions(+)
> >
> > diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> > index 92d1d342d872..56a3d125483f 100644
> > --- a/xen/common/livepatch.c
> > +++ b/xen/common/livepatch.c
> > @@ -14,6 +14,7 @@
> >  #include <xen/mpi.h>
> >  #include <xen/rsa.h>
> >  #include <xen/sched.h>
> > +#include <xen/sha2.h>
> >  #include <xen/smp.h>
> >  #include <xen/softirq.h>
> >  #include <xen/spinlock.h>
> > @@ -525,6 +526,106 @@ static int check_xen_buildid(const struct livepat=
ch_elf *elf)
> >      return 0;
> >  }
> >
> > +#ifdef CONFIG_PAYLOAD_VERIFY
> > +static int check_rsa_sha256_signature(void *data, size_t datalen,
> > +                                      void *sig, uint32_t siglen)
>
> I think both data and sig could be const here?
>
> > +{
> > +    struct sha2_256_state hash;
> > +    MPI s;
> > +    int rc;
> > +
> > +    s =3D mpi_read_raw_data(sig, siglen);
> > +    if ( !s )
> > +    {
> > +        printk(XENLOG_ERR LIVEPATCH "Failed to mpi_read_raw_data\n");
> > +        return -ENOMEM;
> > +    }
> > +
> > +    sha2_256_init(&hash);
> > +    sha2_256_update(&hash, data, datalen);
> > +
> > +    rc =3D rsa_sha256_verify(&builtin_payload_key, &hash, s);
> > +    if ( rc )
> > +        printk(XENLOG_ERR LIVEPATCH "rsa_sha256_verify failed: %d\n", =
rc);
> > +
> > +    mpi_free(s);
> > +
> > +    return rc;
> > +}
> > +#endif
> > +
> > +static int check_signature(const struct livepatch_elf *elf, void *raw,
> > +                           size_t size)
> > +{
> > +#ifdef CONFIG_PAYLOAD_VERIFY
> > +#define MAX_SIG_NOTE_SIZE 1024
> > +    static const char notename[] =3D "Xen";
> > +    void *sig;
> > +    livepatch_elf_note note;
> > +    int rc;
> > +
> > +    rc =3D livepatch_elf_note_by_names(elf, ELF_XEN_SIGNATURE, notenam=
e, -1,
> > +                                     &note);
> > +    if ( rc )
> > +    {
> > +        dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Signature not present\n",
> > +                elf->name);
> > +        return rc;
> > +    }
> > +
> > +    /* We expect only one signature, find a second is an error! */
> > +    rc =3D livepatch_elf_next_note_by_name(notename, -1, &note);
> > +    if ( rc !=3D -ENOENT )
> > +    {
> > +        if ( rc )
> > +        {
> > +            printk(XENLOG_ERR LIVEPATCH
> > +                   "Error while checking for notes! err =3D %d\n", rc)=
;
> > +            return rc;
> > +        }
> > +        else
> > +        {
> > +            printk(XENLOG_ERR LIVEPATCH
> > +                   "Error, found second signature note! There can be o=
nly one!\n");
>
> FWIW, it's a nit, but I think there are too many exclamation marks in
> the error message above:
>
> "Error, multiple signatures found\n"
>
> Would be better.
>
> I'm also wondering, would it make sense to allow multiple signatures
> to be present?  I guess not because livepatches are built for specific
> Xen binaries, and then we know exactly which key is embedded there.  A
> livepatch would never apply to two different builds with different
> keys.

I agree that while it could be possible, I don't really see a valid use
for it.  This restriction could be relaxed in future if it is deemed
useful.

>
> > +            return -EINVAL;
> > +        }
> > +    }
> > +
> > +    if ( SIGNATURE_VERSION(note.type) !=3D LIVEPATCH_SIGNATURE_VERSION=
 ||
> > +         SIGNATURE_ALGORITHM(note.type) !=3D SIGNATURE_ALGORITHM_RSA |=
|
> > +         SIGNATURE_HASH(note.type) !=3D SIGNATURE_HASH_SHA256 )
> > +    {
> > +        printk(XENLOG_ERR LIVEPATCH
> > +               "Unsupported signature type: v:%u, a:%u, h:%u\n",
> > +               SIGNATURE_VERSION(note.type), SIGNATURE_ALGORITHM(note.=
type),
> > +               SIGNATURE_HASH(note.type));
> > +        return -EINVAL;
> > +    }
> > +
> > +    if ( note.size =3D=3D 0 || note.size >=3D MAX_SIG_NOTE_SIZE )
> > +    {
> > +        printk(XENLOG_ERR LIVEPATCH "Invalid signature note size: %u\n=
",
> > +               note.size);
> > +        return -EINVAL;
> > +    }
> > +
> > +    sig =3D xmalloc_bytes(note.size);
> > +    if ( !sig )
> > +        return -ENOMEM;
> > +
> > +    memcpy(sig, note.data, note.size);
> > +
> > +    /* Remove signature from data, as can't be verified with it. */
> > +    memset((void *)note.data, 0, note.size);
> > +    rc =3D check_rsa_sha256_signature(raw, size, sig, note.size);
> > +
> > +    xfree(sig);
> > +    return rc;
> > +#else
> > +    return -EINVAL;
>
> EOPNOTSUPP would be more accurate here.
>
> > +#endif
> > +}
> > +
> >  static int check_special_sections(const struct livepatch_elf *elf)
> >  {
> >      unsigned int i;
> > @@ -1162,6 +1263,8 @@ static int load_payload_data(struct payload *payl=
oad, void *raw, size_t len)
> >      if ( rc )
> >         goto out;
> >
> > +    check_signature(&elf, raw, len);
>
> Wouldn't it make more sense to unconditionally fail here if
> CONFIG_PAYLOAD_VERIFY is enabled and signature verification fails?
>
> IOW: if you built an hypervisor with PAYLOAD_VERIFY enabled signature
> verification needs to be enforced.

As per the commit message, this doesn't actually enforce anything yet.
The intention is to tie signature enforcement to lockdown mode once
those patches have been merged.

Ross


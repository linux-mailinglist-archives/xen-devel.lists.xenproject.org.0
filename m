Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFF72FA20B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 14:48:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69678.124864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1UtN-0000D6-F7; Mon, 18 Jan 2021 13:48:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69678.124864; Mon, 18 Jan 2021 13:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1UtN-0000Ch-BZ; Mon, 18 Jan 2021 13:48:25 +0000
Received: by outflank-mailman (input) for mailman id 69678;
 Mon, 18 Jan 2021 13:48:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k63/=GV=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1l1UtM-0000Cb-01
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 13:48:24 +0000
Received: from MTA-11-4.privateemail.com (unknown [198.54.127.104])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c884cdc1-78d6-4e60-be0b-0a493accc7d8;
 Mon, 18 Jan 2021 13:48:22 +0000 (UTC)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id 10E968007E
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 08:48:22 -0500 (EST)
Received: from mail-wr1-f54.google.com (unknown [10.20.151.219])
 by mta-11.privateemail.com (Postfix) with ESMTPA id CDD6D80072
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 13:48:21 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id d13so16488185wrc.13
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 05:48:21 -0800 (PST)
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
X-Inumbo-ID: c884cdc1-78d6-4e60-be0b-0a493accc7d8
X-Gm-Message-State: AOAM531Ryk2VdwtGfP6EUybDjgh9INKaPLZjEZndoBKu4hDghQh4GxbB
	Oe89v4qg0duBAq9r8hhWnKjyXhSDbXVYI0A4W1o=
X-Google-Smtp-Source: ABdhPJy44NM872ForGdmYJgLAoR7KYzkr03gDNeeQs9tLdxgcZVAejA9VmP6fMzdqiB5MI4KPlEnZXQlybj1Bt7tKPg=
X-Received: by 2002:a05:6000:c9:: with SMTP id q9mr25270789wrx.259.1610977700395;
 Mon, 18 Jan 2021 05:48:20 -0800 (PST)
MIME-Version: 1.0
References: <7536d7bd92337933e6e23be359ca981deab50016.1609699565.git.tamas@tklengyel.com>
 <0405f97f-ee4f-6379-c0f4-3db149386bc2@citrix.com> <CABfawhnGC2S3StnzcCkS0bQr3h_J1=i6LE7ma8vkZYJK_WoQuQ@mail.gmail.com>
 <CABfawh=7A8HAU9Jh5MU9UPApUOLJM1VbdghVC7PGn2VbodRdLw@mail.gmail.com> <857cda4e-e31e-c98c-cd67-c9175d3f6cc4@suse.com>
In-Reply-To: <857cda4e-e31e-c98c-cd67-c9175d3f6cc4@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 18 Jan 2021 08:47:44 -0500
X-Gmail-Original-Message-ID: <CABfawh=uaXkwdpjWmw2dWhBRdNhPo7ywGi1_fKKbYFdiamgUtQ@mail.gmail.com>
Message-ID: <CABfawh=uaXkwdpjWmw2dWhBRdNhPo7ywGi1_fKKbYFdiamgUtQ@mail.gmail.com>
Subject: Re: [PATCH] x86/mem_sharing: silence ubsan warning
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	George Dunlap <george.dunlap@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Jan 18, 2021 at 4:10 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 18.01.2021 02:38, Tamas K Lengyel wrote:
> > On Mon, Jan 4, 2021 at 12:21 PM Tamas K Lengyel <tamas@tklengyel.com> w=
rote:
> >>
> >> On Mon, Jan 4, 2021 at 7:31 AM Andrew Cooper <andrew.cooper3@citrix.co=
m> wrote:
> >>>
> >>> On 03/01/2021 18:47, Tamas K Lengyel wrote:
> >>>> Running Xen compiled with UBSAN produces a warning for mismatched si=
ze. It's
> >>>> benign but this patch silences the warning.
> >>>>
> >>>> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> >>>> ---
> >>>>  xen/arch/x86/mm/mem_sharing.c | 5 ++++-
> >>>>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sha=
ring.c
> >>>> index c428fd16ce..6920077dbf 100644
> >>>> --- a/xen/arch/x86/mm/mem_sharing.c
> >>>> +++ b/xen/arch/x86/mm/mem_sharing.c
> >>>> @@ -1638,7 +1638,10 @@ static int fork_hap_allocation(struct domain =
*cd, struct domain *d)
> >>>>      rc =3D hap_set_allocation(cd, mb << (20 - PAGE_SHIFT), &preempt=
ed);
> >>>>      paging_unlock(cd);
> >>>>
> >>>> -    return preempted ? -ERESTART : rc;
> >>>> +    if ( preempted )
> >>>> +        rc =3D -ERESTART;
> >>>> +
> >>>> +    return rc;
> >>>
> >>> I can't repro this at all, even with some simplified examples.
> >>>
> >>> -ERESTART is int (it is an enum constant in C files), as is rc, so I
> >>> can't spot a legitimate UBSAN complaint here.
> >>>
> >>> Which compiler, and/or do you have the exact complaint available?
> >>
> >> It was with gcc-7 on debian buster but can't recreate it after a make
> >> clean & make, it's now gone =C2=AF\_(=E3=83=84)_/=C2=AF, seems like it=
 was just a bad
> >> build. Sorry for the noise.
> >
> > In a recent build with gcc-10 I got the warning again:
> >
> > (XEN) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > (XEN) UBSAN: Undefined behaviour in mem_sharing.c:1659:34
> > (XEN) load of value 6 is not a valid value for type '_Bool'
>
> Isn't this rather referring to the value found in "preempted"?
> After all neither 6 nor -6 is related to ERESTART. If so, your
> proposed change would paper over an issue elsewhere and the
> issue would be liable to show up again when the if() gains
> similar treatment to the conditional operator by the compiler.
>
> And indeed, looking at the two functions the issue appears to
> be that hap_set_allocation() only ever writes "true" to
> *preempted, while fork_hap_allocation() fails to initialize
> its variable to "false".

That would actually make sense and explain why the warning pops up
only intermittently. I suspected the ?: op was the culprit for some
bizarre compiler reason that was not entirely clear to me. Testing it
with this patch and not seeing the warning was most likely purely
chance that it got preempted and thus not trigger the warning. Thanks
for deciphering it! Will send v2 shortly.

Tamas


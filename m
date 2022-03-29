Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D627D4EAD4A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 14:41:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295826.503559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZB8y-0000N6-7Z; Tue, 29 Mar 2022 12:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295826.503559; Tue, 29 Mar 2022 12:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZB8y-0000KT-4V; Tue, 29 Mar 2022 12:40:16 +0000
Received: by outflank-mailman (input) for mailman id 295826;
 Tue, 29 Mar 2022 12:40:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOEZ=UI=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nZB8w-0000KN-8R
 for xen-devel@lists.xenproject.org; Tue, 29 Mar 2022 12:40:14 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f4d4140-af5d-11ec-8fbc-03012f2f19d4;
 Tue, 29 Mar 2022 14:40:10 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id bn33so23257754ljb.6
 for <xen-devel@lists.xenproject.org>; Tue, 29 Mar 2022 05:40:13 -0700 (PDT)
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
X-Inumbo-ID: 5f4d4140-af5d-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=meoRQkZFMTcXV6JEU42Ih4CZwHdsdW0FOEJqDoWzoCc=;
        b=jKqelk7xly3U8m2iKGY9D6gxBSZmMOw86kq8vnc/hTpXeqBPfg5STGToFWkaRV70V4
         gKdifA1ru+ffMzOdnHIoq/Xwa/t1+bPr79q/ilO7BNxaNxvo57rj9jYT6AkL7ph6H0C2
         OSeNl7RrH4bZmmpWUu03vAaxFR0uCCrwOY4+PV6/UeE13Y6Y0Z1Bg5BR/EQoKm4mRZXO
         lnb6PYEcimK7KdURawYlyd1KcdoFza8WoU9TBrVyPfxTzCmY7ZCVuY+vvSZJYaNs6Evi
         ZeG74/FEm9D5vdocA7M7RVN28VjVn9EHmE1YYup8NeNUB15N2PGRIKthvseSqg5CrMxn
         artQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=meoRQkZFMTcXV6JEU42Ih4CZwHdsdW0FOEJqDoWzoCc=;
        b=JxCjQJB3IwedOjN9VE3urrDx7kUXFEhebdeooORkMUsf1yCCQFzhE1O7X/lJT+wk4A
         KSfaBLm12HiKlSa07AjvGcYSUleQl4hDY0ner/G1uhRQuOc/buVblRNJ9E8o/ssM4aiX
         yAP8AU9XzXtCG+ZuSWLJkc8Uog0MRZbioq6FivCP5EBhq/k6zUNFSZkXDDEWGkOCqJLQ
         m8kWBLCDcotJnFGtG8ebz1qm8XLhGpPW/T4dJDKkimorQ/x6IzsaOyNXuZqNAWyeowxm
         0/ipBe/+BcED4zAIkaV7CQ6uJ1RKpWb8m5WK+knno0+m75e7y2QVcgYx3/sENd8RXwSm
         0Stw==
X-Gm-Message-State: AOAM531MKU5mOxKk1tFvhVvljjJc+LI914xoIBVNu/iKmx7lMt3ol/8t
	aUO/9gXRBVorn4N7+2Fao3aBQ68QRNc8foM5/iQ=
X-Google-Smtp-Source: ABdhPJzw5TUfnxbH3kJJlGwC3uc6mcAGuIqTatg+mNmLEATcp75fI/yhyfltbnlrYmK2a0PHtxmObmc7UJbhaAEnQPY=
X-Received: by 2002:a2e:a372:0:b0:249:7108:6778 with SMTP id
 i18-20020a2ea372000000b0024971086778mr2500477ljn.403.1648557612514; Tue, 29
 Mar 2022 05:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220325141826.16245-1-jandryuk@gmail.com> <YkGevRlIpAlCDox7@Air-de-Roger>
 <7ee0889c-c9ae-c11f-7308-25e7d5a14815@suse.com>
In-Reply-To: <7ee0889c-c9ae-c11f-7308-25e7d5a14815@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 29 Mar 2022 08:40:00 -0400
Message-ID: <CAKf6xpswv187bfJ2MTFSO4azmM0V_xSa=U5pcF1Qibzo6NFHrQ@mail.gmail.com>
Subject: Re: [PATCH] x86/physdev: Call xsm_unmap_domain_irq earlier
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Wei Liu <wl@xen.org>, "Daniel P. Smith" <dpsmith.dev@gmail.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 28, 2022 at 8:44 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 28.03.2022 13:40, Roger Pau Monn=C3=A9 wrote:
> > On Fri, Mar 25, 2022 at 10:18:26AM -0400, Jason Andryuk wrote:
> >> Pull the XSM check up out of unmap_domain_pirq into physdev_map_pirq.
> >>
> >> xsm_unmap_domain_irq was seen denying unmap_domain_pirq when called fr=
om
> >> complete_domain_destroy as an RCU callback.  The source context was an
> >> unexpected, random domain.  Since this is a xen-internal operation,
> >> going through the XSM hook is inapproriate.
> >>
> >> Move the XSM hook up into physdev_unmap_pirq, which is the
> >> guest-accessible path.  This requires moving some of the sanity check
> >> upwards as well since the hook needs the additional data to make its
> >> decision.  Since complete_domain_destroy still calls unmap_domain_pirq=
,
> >> replace the moved runtime checking with assert.  Only valid pirqs shou=
ld
> >> make their way into unmap_domain_pirq from complete_domain_destroy.
> >>
> >> This is mostly code movement, but one style change is to pull `irq =3D
> >> info->arch.irq` out of the if condition.
>
> And why is this better? You now have an extra conditional expression
> there.

It's better because it is clearer.  The location is more readily
visible when scanning the code.  It fits the pattern of `variable =3D
something`.  Assigning inside the if condition makes it harder to see
where a variable is assigned, which is why I made the change.

This is the non-movement diff:

     info =3D pirq_info(d, pirq);
-    if ( !info || (irq =3D info->arch.irq) <=3D 0 )
+    irq =3D info ? info->arch.irq : 0;
+    if ( !info || irq <=3D 0 )
     {

But given comments below, it seems this movement is not going to
happen, so this change will be dropped.

> >> Label done is now unused and removed.
> >>
> >> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> >> ---
> >> unmap_domain_pirq is also called in vioapic_hwdom_map_gsi and
> >> vpci_msi_disable.  vioapic_hwdom_map_gsi is a cleanup path after going
> >> through map_domain_pirq, and I don't think the vpci code is directly
> >> guest-accessible.  So I think those are okay, but I not familiar with
> >> that code.  Hence, I am highlighting it.
> >
> > Hm, for vpci_msi_disable it's not technically correct to drop the XSM
> > check. This is a guests accessible path, however the value of PIRQ is
> > not settable by the guest, so it's kind of OK just for that reason.

Right, that's why I was figuring it was okay.  If Xen is handling it
internally, it doesn't have to worry about untrusted data.

> Kind of - perhaps. But better to avoid if possible.

But I can also see how it is safer to leave the check in place.  It's
better to go through an unnecessary XSM check than to not have a check
at all.

> Hence I would prefer
> the ->is_dying alternative you suggest at the end.

I had not considered the ->is_dying option.  At first glance, it seems
like it would work.

I was hoping that we could determine that only sanitized data would
make it into unmap_domain_pirq.  Then we can restructure the code
instead of adding a condition to skip the XSM hook.  But if this
function is guest accessible via vpci, then the XSM check should
remain.

Regards,
Jason


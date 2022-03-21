Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B0A4E2B07
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 15:40:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293037.497723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWJCO-0005rm-St; Mon, 21 Mar 2022 14:39:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293037.497723; Mon, 21 Mar 2022 14:39:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWJCO-0005p1-Py; Mon, 21 Mar 2022 14:39:56 +0000
Received: by outflank-mailman (input) for mailman id 293037;
 Mon, 21 Mar 2022 14:39:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XmvP=UA=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1nWJCM-0005ov-Ra
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 14:39:54 +0000
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [2607:f8b0:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4e89029-a924-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 15:39:53 +0100 (CET)
Received: by mail-ot1-x32f.google.com with SMTP id
 o20-20020a9d7194000000b005cb20cf4f1bso10633137otj.7
 for <xen-devel@lists.xenproject.org>; Mon, 21 Mar 2022 07:39:53 -0700 (PDT)
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
X-Inumbo-ID: c4e89029-a924-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n9vdLkepYhH8pJ4ZLskSMq6h6bfSGE5tB2JbORvIeZI=;
        b=IIfr1lA4BFZ2voxQitQzCzOXm9ZxjG+A98Y/3fYuIr+wGad5I39zhEV2ujfAvw3sGe
         nZ7ZZMYxIhVUqCIfbFQ4OvnSWLs75RNbPGdymAkNAerpJjou9n21aKid2RDdfOZt76lj
         NQKodl2g4lnepcLesisz18gj6yv5fivUOjuZAR7kpykCbRwg8LQ6bOFOPGAYBNASo/Ls
         jRrI/tu5zBkw9GZP+9dmsqw08vOhgPOiGIQok3TNt48l5khH7gz+c5rOlNZMDY6vEdcj
         0LRpFeVf7Dq9F82zUPdygzw0hKC1J/YsrvnqmllwWOJoVfX07c0gbaEC1TYrZcDj2OGn
         JNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n9vdLkepYhH8pJ4ZLskSMq6h6bfSGE5tB2JbORvIeZI=;
        b=40iCl3JVB0rxjojQ6QrQ/CoZ8JnyyT0qVA9wibVaLDoElm3is8UMPNcJ756WE/h804
         qIfUYz5lZCGCrIAHG2puCVam8XgYPlLQp4tqWxGNAXaI+CM9pLCoV4cK5koFEOK/4gwL
         wJgvn5iZ5ab1LoegkINQ9IaBqQaDI7UTFWRzN1nC1sZBbPWEnxZGk9aMXn5CNH8ej4Ct
         iP3FwI2keUxnbwT/hXTHEf3l5LNYaI4VOhBtGYnekkhsSmvsxdWzIm+EP5WnXqDlCt9b
         FoLW2T+SdjkCKY4wvnrLJWaahFnOy/tXSwu3kTdpdOHmKy7VP10pDOWTCG0h6Q54/Pyl
         PQ3g==
X-Gm-Message-State: AOAM530HCvZTLOnyngCASCIIT0H04qeer6smg39bcIMtSOg2diVt8nqD
	dhkn4IRBOss/G7f6atPFgDNwwnjOXP90aMyp0ZI=
X-Google-Smtp-Source: ABdhPJxCjV1I/pZOGEEiYxDZot2NNOxp78ANiXTPr7WP94QLZm7B3RM0KMgnh+s5OvKreQFb9VoX2jbN3mZqgGCiVhk=
X-Received: by 2002:a05:6830:2b29:b0:5af:ea52:f5ca with SMTP id
 l41-20020a0568302b2900b005afea52f5camr7836556otv.157.1647873592309; Mon, 21
 Mar 2022 07:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <e79bd13acfd73c105ee1399295c99cec153258c2.1647532323.git.tamas.lengyel@intel.com>
 <ca8f13e5-5e3e-e64f-2711-4730883a24fc@suse.com>
In-Reply-To: <ca8f13e5-5e3e-e64f-2711-4730883a24fc@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 21 Mar 2022 10:39:16 -0400
Message-ID: <CABfawhn3-zRJ+m9nJsOGBL=8gkVmzOyE_ttuWJcSLd4UseLzXQ@mail.gmail.com>
Subject: Re: [PATCH v2] x86/vmx: save guest non-register state in hvm_hw_cpu
To: Jan Beulich <JBeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, 
	Kevin Tian <kevin.tian@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 21, 2022 at 8:16 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 17.03.2022 16:57, Tamas K Lengyel wrote:
> > During VM forking and resetting a failed vmentry has been observed due
> > to the guest non-register state going out-of-sync with the guest register
> > state. For example, a VM fork reset right after a STI instruction can trigger
> > the failed entry. This is due to the guest non-register state not being saved
> > from the parent VM, thus the reset operation only copies the register state.
> >
> > Fix this by including the guest non-register state in hvm_hw_cpu so that when
> > its copied from the parent VM the vCPU state remains in sync.
> >
> > SVM is not currently wired-in as VM forking is VMX only and saving non-register
> > state during normal save/restore/migration operation hasn't been needed.
>
> Given that it was pointed out that e.g. STI- and MOV-SS-shadow aren't
> VMX specific and also aren't impossible to hit with ordinary save /
> restore / migrate, I'm not convinced of this argumentation. But of
> course fixing VMX alone is better than nothing. However, ...
>
> > @@ -166,6 +167,11 @@ struct hvm_hw_cpu {
> >  #define XEN_X86_FPU_INITIALISED         (1U<<_XEN_X86_FPU_INITIALISED)
> >      uint32_t flags;
> >      uint32_t pad0;
> > +
> > +    /* non-register state */
> > +    uint32_t activity_state;
> > +    uint32_t interruptibility_state;
> > +    uint64_t pending_dbg;
> >  };
>
> ... these fields now represent vendor state in a supposedly vendor
> independent structure. Besides my wish to see this represented in
> field naming (thus at least making provisions for SVM to gain
> similar support; perhaps easiest would be to include these in a
> sub-structure with a field name of "vmx"), I wonder in how far cross-
> vendor migration was taken into consideration. As long as the fields
> are zero / ignored, things wouldn't be worse than before your
> change, but I think it wants spelling out that the SVM counterpart(s)
> may not be added by way of making a VMX/SVM union.

I wasn't aware cross-vendor migration is even a thing. But adding a
vmx sub-structure seems to me a workable route, we would perhaps just
need an extra field that specifies where the fields were taken
(vmx/svm) and ignore them if the place where the restore is taking
place doesn't match where the save happened. That would be equivalent
to how migration works today. Thoughts?

Tamas


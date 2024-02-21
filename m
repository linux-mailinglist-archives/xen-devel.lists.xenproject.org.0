Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A146885D0D1
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 08:03:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683811.1063423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcgcc-0000Dy-Mi; Wed, 21 Feb 2024 07:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683811.1063423; Wed, 21 Feb 2024 07:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcgcc-0000Bd-K5; Wed, 21 Feb 2024 07:02:26 +0000
Received: by outflank-mailman (input) for mailman id 683811;
 Wed, 21 Feb 2024 07:02:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CeSM=J6=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rcgcb-0000BX-OV
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 07:02:25 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29a5dbdf-d087-11ee-98f5-efadbce2ee36;
 Wed, 21 Feb 2024 08:02:23 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-512b29f82d1so4404510e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 23:02:23 -0800 (PST)
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
X-Inumbo-ID: 29a5dbdf-d087-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708498943; x=1709103743; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZDuYmCw68tSZSZV15ysOk1bl/+jDWERuA9QV+0SCDw=;
        b=f7WWbUHlfp/jFxA+/VbPZqVyqhlbDTxJhPa6wtaKtFwwIY2QkQ96Y6KwkOgwFRtO1J
         PFCzccyatNLy9tY5vVoEr7UdZ8VtqGkB9ZmBoHQm1eM8lgO8S9h55pE/TutN5zVLxdgA
         w/V0wPlcnpFQnHZYkijsmr4QfFZw7qUEjOpww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708498943; x=1709103743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZDuYmCw68tSZSZV15ysOk1bl/+jDWERuA9QV+0SCDw=;
        b=TV+pF8w2h/WJ1PfiwynZhhaltV7kgnMxpDkCo8x3+IdOqWkiFmr8HWViErdcWbXEyZ
         ULmQjkq57WYsYWszP4pCaC58CXpXj8g9BpwaEY8rHXsZ6MiB4dVE/0hNpvm/VauzSCFB
         ncG6JBOlw1Ak4B5f6oCs0BaXSYz1VMe7wr+uMdfr6QpDS3Sp7uU7pAHMWsCzwD4JdThx
         +2HREd5sDyVe9vsvgseUFlkSmcfhsALhG21PTFohL3K91vO7NTfgS6XAGvYfy2L7i5+i
         X1xHXZkodNmD8jbMyUkm621leK2pQ9Pp0OMcjX6CyW2iklUXAkXHOdMZC8y3CyeB5lRo
         I8Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXFnwHeZj3i2/SM65z8mfpq9dRhYZSR2XuryaH490k7UqST3ayTWCCunuXiT5mN7k8mYhVVc6dFxaE7ikBy8V5FojgMbCHcxTZmM+111Ls=
X-Gm-Message-State: AOJu0YzdqiCKBtpcNEctoKaYx6yiexUMy66ZdN10i7kagVzXqN96q+mk
	XeWSaVDg7RGch5+nbXuHEvm0W1KEDZkM5DKU7qm4Mvgg8bmLYH2WGGLvzX/vR2vYK+VJFtUOXm8
	OG84eWtZfwRDgK1EQFYKT0z2OMlusCtDnXMrT6g==
X-Google-Smtp-Source: AGHT+IEuPx0Dxmb1fEwJS9ag9XvHSGKUCqc9RozVlhurOAtTecM0QJqWBIaAKTY30AbN6O2OBLFLCXL6ddtpkVnzj6Y=
X-Received: by 2002:ac2:4f8a:0:b0:511:7259:370d with SMTP id
 z10-20020ac24f8a000000b005117259370dmr10189457lfs.33.1708498942856; Tue, 20
 Feb 2024 23:02:22 -0800 (PST)
MIME-Version: 1.0
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
 <20240206012051.3564035-2-george.dunlap@cloud.com> <66962dfc-db89-40bc-8411-9b92f9458b16@suse.com>
In-Reply-To: <66962dfc-db89-40bc-8411-9b92f9458b16@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 21 Feb 2024 15:02:11 +0800
Message-ID: <CA+zSX=ZwUT4Wf7eY3DFyp=Bf_MndExoKCZBVGEhF-ByaOEH7tw@mail.gmail.com>
Subject: Re: [PATCH 1/6] xen/hvm: Convert hap_capabilities into a bitfield
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 9:36=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 06.02.2024 02:20, George Dunlap wrote:
> > hvm_function_table is an internal structure; rather than manually
> > |-ing and &-ing bits, just make it a boolean bitfield and let the
> > compiler do all the work.  This makes everything easier to read, and
> > presumably allows the compiler more flexibility in producing efficient
> > code.
> >
> > No functional change intended.
> >
> > Signed-off-by: George Dunlap <george.dunlap@cloud.com>
>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> > ---
> > Questions:
> >
> > * Should hap_superpage_2m really be set unconditionally, or should we
> >   condition it on cpu_has_svm_npt?
>
> That's HAP capabilities; there's not going to be any use of HAP when
> there's no NPT (on an AMD system). IOW - all is fine as is, imo.

Basically there are two stances to take:

1. hap_superpage_2m always has meaning.  If there's no HAP, then there
are no HAP superpages, so we should say that there are no superpages.

2. hap_superpage_2m only has meaning if hap is enabled.  If there's no
HAP, then the question "are there superpages" is moot; nobody should
be paying attention to it.

The second is not without precedent, but is it really the best stance?
 It means that before reading hap_superpage_2m, you have to first
check hap; and it introduces a risk (no matter how small) that someone
will forget to check, and end up doing the wrong thing.

Not a huge deal, but overall my vote would be #1.  I may send a patch
at some point in the future.

> > * Do we really need to "!!cpu_has_svm_npt"?  If so, wouldn't it be
> >   better to put the "!!"  in the #define, rather than requiring the
> >   user to know that it's needed?
>
> Considering that hap_supported is bool now, the !! can simply be
> dropped. We've been doing so as code was touched anyway, not in a
> concerted effort.

Right, forgot to actually delete this para after adding a patch to address =
it.

> > --- a/xen/arch/x86/hvm/vmx/vmcs.c
> > +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> > @@ -113,8 +113,8 @@ static int cf_check parse_ept_param_runtime(const c=
har *s)
> >      int val;
> >
> >      if ( !cpu_has_vmx_ept || !hvm_funcs.hap_supported ||
> > -         !(hvm_funcs.hap_capabilities &
> > -           (HVM_HAP_SUPERPAGE_2MB | HVM_HAP_SUPERPAGE_1GB)) )
> > +         !(hvm_funcs.caps.hap_superpage_2mb ||
> > +           hvm_funcs.caps.hap_superpage_1gb) )
> >      {
> >          printk("VMX: EPT not available, or not in use - ignoring\n");
>
> Just to mention it: The conditional and the log message don't really
> fit together. (I was first wondering what the 2mb/1gb checks had to
> do here at all, but that's immediately clear when seeing that the
> only sub-option here is "exec-sp".)

So you mean basically that the checks & error message are poorly
factored, because there's only a single sub-option?  (i.e., if there
were options which didn't rely on superpages, the check would be
incorrect?)

Let me know if there's something concrete you'd like me to do here.

> > @@ -104,8 +96,11 @@ struct hvm_function_table {
> >      /* Hardware virtual interrupt delivery enable? */
> >      bool virtual_intr_delivery_enabled;
> >
> > -    /* Indicate HAP capabilities. */
> > -    unsigned int hap_capabilities;
> > +    struct {
> > +        /* Indicate HAP capabilities. */
> > +        bool hap_superpage_1gb:1,
> > +            hap_superpage_2mb:1;
>
> Nit: Would be nice imo if the two identifiers aligned vertically with
> one another.

Done.

 -George


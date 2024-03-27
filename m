Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBD288EBFD
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 18:02:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698667.1090651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpWeZ-0001Go-AD; Wed, 27 Mar 2024 17:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698667.1090651; Wed, 27 Mar 2024 17:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpWeZ-0001EU-6f; Wed, 27 Mar 2024 17:01:31 +0000
Received: by outflank-mailman (input) for mailman id 698667;
 Wed, 27 Mar 2024 17:01:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2pd=LB=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rpWeX-0001EO-GN
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 17:01:29 +0000
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [2607:f8b0:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a61b6126-ec5b-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 18:01:27 +0100 (CET)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6e6db4dfd7aso15210a34.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 10:01:27 -0700 (PDT)
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
X-Inumbo-ID: a61b6126-ec5b-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711558886; x=1712163686; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/J8NnohPidyv2JMlXynv53vP943syT1DKaOVUdktVE=;
        b=ji5FbKwdw6J2xdll5ty59yCjlOSCbxzN6LHHD+leIJ5CC58qYrb5fayVJwKU/q272p
         NiyLiqEcc4G5SavSsAV6dyWNuv4WnpI61zsEOh68A+BjYQ8IghUx+JJ1HyDnQWM5rdUN
         tzmJmITJpYrC4vRXeICKa+Gm5/0klQXqJPERA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711558886; x=1712163686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/J8NnohPidyv2JMlXynv53vP943syT1DKaOVUdktVE=;
        b=KXmipXm/3P9hhGvZfLvW1ZmatVeBeJBT/+Y/PnLyMEnzmGzJd9auXN08DcuEd/ZQKH
         PfSgC7WSQGpbDB/tPEDp/oX8eoLxT5FxPv48Lwlz6gQctCeAWXjfBimUQGm6C6LaYui7
         CyUIOqX7bgzeJKFZsCBNekoMNm8KO62azU2M6SWhZ87k/5PsIcOMrct20ai3P5mTNNfk
         Wa+p8fqyDkYJWhverDWPtIN3QWhLD3x9tVp9sgZkWKSywETU7tNKcshjqRWZQ5mP3uUc
         eSbzKHNCDbt+uVrFG1+2m9cXHX1W5rb9mt/xmaaORzsEc13F6gNKszeb4L1b83cjipR0
         Km/w==
X-Forwarded-Encrypted: i=1; AJvYcCXC42qM0QI2PEQ/VMyrqLhCH4LLEvcVtvkmdOZLjbQyDIEWm1lfWl2FLPzZGiS+Jbg4E0CQwXztLQ9iuDPkaIbSwfPvLstXy4oxPOtYz3M=
X-Gm-Message-State: AOJu0YwO4LauXk+2qVNVgbITsVXYTE0mf/uazR0VretfaN9vqj1BEoql
	09wAQ4ipqrPgb6C0nZ3iRqK5FAKw1SfQeYLMrsrB7LqUTj+qClXcLmCoyy5wLAVjs2o34PgjoiZ
	jK9Hnk6eql1HokbpbT01tcQFRfVTb1Y/ZdeBhiw==
X-Google-Smtp-Source: AGHT+IEFM/eVBZ9PId3adXdbFBM3MfZ63Wkb2nHIIlSI9DptAo8mvYDP9HtbTpONTe1WcQXTcwJXfpRNxCRAc7f2TxI=
X-Received: by 2002:a05:6871:608:b0:220:9eeb:b4a2 with SMTP id
 w8-20020a056871060800b002209eebb4a2mr269446oan.29.1711558886241; Wed, 27 Mar
 2024 10:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240313122454.965566-1-george.dunlap@cloud.com>
 <20240313122454.965566-4-george.dunlap@cloud.com> <7a5b3ec3-c122-479a-b714-529e150bf4c0@suse.com>
In-Reply-To: <7a5b3ec3-c122-479a-b714-529e150bf4c0@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 27 Mar 2024 17:01:15 +0000
Message-ID: <CA+zSX=ZE6uLf12o3WDUpNuZ6Kost=JEfWH0HugGqD43QGPsJ1A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] svm/nestedsvm: Introduce nested capabilities bit
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2024 at 2:17=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 13.03.2024 13:24, George Dunlap wrote:
> > In order to make implementation and testing tractable, we will require
> > specific host functionality.  Add a nested_virt bit to hvm_funcs.caps,
> > and return an error if a domain is created with nested virt and this
> > bit isn't set.  Create VMX and SVM callbacks to be executed from
> > start_nested_svm(), which is guaranteed to execute after all
>
> Nit: nestedhvm_setup() (or, with different wording, start_nested_{svm,vmx=
}()).

Oops, fixed.

> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -673,6 +673,12 @@ int arch_sanitise_domain_config(struct xen_domctl_=
createdomain *config)
> >           */
> >          config->flags |=3D XEN_DOMCTL_CDF_oos_off;
> >
> > +    if ( nested_virt && !hvm_nested_virt_supported() )
> > +    {
> > +        dprintk(XENLOG_INFO, "Nested virt requested but not available\=
n");
> > +        return -EINVAL;
> > +    }
> > +
> >      if ( nested_virt && !hap )
> >      {
> >          dprintk(XENLOG_INFO, "Nested virt not supported without HAP\n"=
);
>
> As mentioned in reply to v1, I think what both start_nested_{svm,vmx}() c=
heck
> is redundant with this latter check. I think that check isn't necessary t=
here
> (yet unlike suggested in reply to v1 I don't think anymore that the check=
 here
> can alternatively be dropped). And even if it was to be kept for some rea=
son,
> I'm having some difficulty seeing why vendor code needs to do that check,=
 when
> nestedhvm_setup() could do it for both of them.

I'm having a bit of trouble resolving the antecedents in this
paragraph (what "this" and "there" are referring to).

Are you saying that we should set hvm_funcs.caps.nested_virt to 'true'
even if the hardware doesn't support HAP, because we check that here?

That seems like a very strange way to go about things; hvm_funcs.caps
should reflect the actual capabilities of the hardware.  Suppose at
some point we want to expose nested virt capability to the toolstack
-- wouldn't it make more sense to be able to just read
`hvm_funcs.caps.nested_virt`, rather than having to remember to && it
with `hvm_funcs.caps.hap`?

And as you say, you can't get rid of the HAP check here, because we
also want to deny nested virt if the admin deliberately created a
guest in shadow mode on a system that has HAP available.  So it's not
redundant: one is checking the capabilities of the system, the other
is checking the requested guest configuration.

As to why to have each vendor independent code check for HAP -- there
are in fact two implementations of the code; it's nice to be able to
look in one place for each implementation to determine the
requirements.  Additionally, it would be possible, in the future, for
one of the nested virt implementations to enable shadow mode, while
the other one didn't.  The current arrangement makes that easy.

> > --- a/xen/arch/x86/hvm/nestedhvm.c
> > +++ b/xen/arch/x86/hvm/nestedhvm.c
> > @@ -150,6 +150,16 @@ static int __init cf_check nestedhvm_setup(void)
> >      __clear_bit(0x80, shadow_io_bitmap[0]);
> >      __clear_bit(0xed, shadow_io_bitmap[1]);
> >
> > +    /*
> > +     * NB this must be called after all command-line processing has be=
en
> > +     * done, so that if (for example) HAP is disabled, nested virt is
> > +     * disabled as well.
> > +     */
> > +    if ( cpu_has_vmx )
> > +        start_nested_vmx(&hvm_funcs);
> > +    else if ( cpu_has_svm )
> > +        start_nested_svm(&hvm_funcs);
>
> Instead of passing the pointer, couldn't you have the functions return
> bool, and then set hvm_funcs.caps.nested_virt from that? Passing that
> pointer looks somewhat odd to me.

For one, it makes start_nested_XXX symmetric to start_XXX, which also
has access to the full hvm_funcs structure (albeit in the former case
because it's creating the structure).  For two, both of them need to
read caps.hap.  For three, it's just more flexible -- there may be
future things that we want to modify in the start_nested_*()
functions.  If we did as you suggest, and then added (say)
caps.nested_virt_needs_hap, then we'd either need to add a second
function, or refactor it to look like this.

> Is there a reason to use direct calls here rather than a true hook
> (seeing that hvm_funcs must have been populated by the time we make it
> here)? I understand we're (remotely) considering to switch away from
> using hooks at some point, but right now this feels somewhat
> inconsistent if not further justified.

Again it mimics the calls to start_vmx/svm in hvm_enable.  But I could
look at adding a function pointer to see if it works.

 -George


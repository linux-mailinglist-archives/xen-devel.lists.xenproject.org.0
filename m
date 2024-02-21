Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2F585D2D3
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 09:50:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683880.1063504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rciHQ-0001bx-AN; Wed, 21 Feb 2024 08:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683880.1063504; Wed, 21 Feb 2024 08:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rciHQ-0001Zq-7N; Wed, 21 Feb 2024 08:48:40 +0000
Received: by outflank-mailman (input) for mailman id 683880;
 Wed, 21 Feb 2024 08:48:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CeSM=J6=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rciHO-0001Zk-Bl
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 08:48:38 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00e43bc8-d096-11ee-8a53-1f161083a0e0;
 Wed, 21 Feb 2024 09:48:37 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-512b13bf764so3934029e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Feb 2024 00:48:37 -0800 (PST)
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
X-Inumbo-ID: 00e43bc8-d096-11ee-8a53-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708505317; x=1709110117; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqkHSlulIprfbeRURSygRzcZQTs86nWaFlFZb9d2gL4=;
        b=Am9FAffZKV6+ZhA54AkCQ7F58QhiM+L0nQtXVGVcYYDSg6UHKwZFgBT6UIvyGJUWJd
         FxxALCCijgm2oc8x9hPq8CvA7nbH5jLFNNl/uTi/I/yayVWkupaQoAqRKDgDd8vHlvRh
         KQlBDd7fOJ9dP4MyUXooSnef55+8pCSdMumBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708505317; x=1709110117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SqkHSlulIprfbeRURSygRzcZQTs86nWaFlFZb9d2gL4=;
        b=QW6tk8+mY9en4Fh/qDZCQeUUQ3qHmBVsIPSZUEMPNObkhYQIdgeLtOMHvO9WlFaYZL
         FOS/UQU/3AHJ/g8E2XUe9HeQ+EwK9BWit7sxjuAcMCP0CzD3HWUVPw5C8IsuEPoklerQ
         u9s6If0C81piX/MbddsLdU9EX1uq2l5ZL4rsuV/MiOYH20ZnYkV3zdsBmwZOFsQ/4qFb
         jXwRi1ch9F/v6CEkuIe6tTj1YJN+V1DaPn552C7ZjgzTt14iPUo7VOovE7XoVfCvhgE7
         2FUVfSzAqdWkCw20izClOh1irjsB3i0Nm0niwQn37wSXIXSu17ylwwFNHtOsGTEE/nVO
         XGgg==
X-Forwarded-Encrypted: i=1; AJvYcCXoSctGKfYqgsmGRDlD02GtdbBVipMoljFdRuL52zVrFj+IF/LH4EipUBufJ1PWniVjV3wzW5b8bsKFlY5Bbp6Uu3bdC6J45btsUKpv9L4=
X-Gm-Message-State: AOJu0Yw6Rje8A3uo4pL3OrDnX64da9kYBsUYrQFDArFnIvXh4qVmtYPm
	6h+7NeZHijfsmcvP4MrGL9ueqTsr1LfQapHm1PsYZtOr0wvjOxGRx+QE535eC6WAyLWFIPZv761
	qQ+tsuAkwk27Zh6J2X4lInuzwziRNQ0lCiq1khg==
X-Google-Smtp-Source: AGHT+IEZP5lkOhf+MRS12LtEfR6Tc68lk2YllWkU9FD+bDklc3PcPKYDsBSdYTYmS24BkzbKuCTCz0WgJEYQUSBwH2I=
X-Received: by 2002:a05:6512:ba6:b0:512:be4d:36f1 with SMTP id
 b38-20020a0565120ba600b00512be4d36f1mr7090163lfv.21.1708505316863; Wed, 21
 Feb 2024 00:48:36 -0800 (PST)
MIME-Version: 1.0
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
 <20240206012051.3564035-5-george.dunlap@cloud.com> <c5f3a78c-4a2b-499b-93bb-11f60b0afcc0@suse.com>
In-Reply-To: <c5f3a78c-4a2b-499b-93bb-11f60b0afcc0@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 21 Feb 2024 16:48:25 +0800
Message-ID: <CA+zSX=acH-4B01=vUBstAbsNBMVgcRe_A5v0eXn66BdsuPtgiA@mail.gmail.com>
Subject: Re: [PATCH 4/6] nestedsvm: Disable TscRateMSR
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 11:22=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 06.02.2024 02:20, George Dunlap wrote:
> > For now, just disable the functionality entirely until we can
> > implement it properly:
> >
> > - Don't set TSCRATEMSR in the host CPUID policy
>
> This goes too far: This way you would (in principle) also affect guests
> with nesting disabled. According to the earlier parts of the description
> there's also no issue with it in that case. What you want to make sure
> it that in the HVM policy the bit isn't set.
>
> While presently resolving to cpu_has_svm_feature(), I think
> cpu_has_tsc_ratio really ought to resolve to the host policy field.
> Of course then requiring the host policy to reflect reality rather than
> having what is "always emulated". IOW ...
>
> > --- a/xen/arch/x86/cpu-policy.c
> > +++ b/xen/arch/x86/cpu-policy.c
> > @@ -407,8 +407,7 @@ static void __init calculate_host_policy(void)
> >                                 (1u << SVM_FEATURE_PAUSEFILTER) |
> >                                 (1u << SVM_FEATURE_DECODEASSISTS));
> >          /* Enable features which are always emulated. */
> > -        p->extd.raw[0xa].d |=3D ((1u << SVM_FEATURE_VMCBCLEAN) |
> > -                               (1u << SVM_FEATURE_TSCRATEMSR));
> > +        p->extd.raw[0xa].d |=3D (1u << SVM_FEATURE_VMCBCLEAN);
>
> ... this likely wants replacing altogether by not overriding what we
> found in hardware, which would apparently mean moving the two bit
> masks to the earlier "clamping" expression.
>
> But then of course Andrew may know of reasons why all of this is done
> in calculate_host_policy() in the first place, rather than in HVM
> policy calculation.

It sounds like maybe you're confusing host_policy with
x86_capabilities?  From what I can tell:

*  the "basic" cpu_has_X macros resolve to boot_cpu_has(), which
resolves to cpu_has(&boot_cpu_data, ...), which is completely
independent of the cpu-policy.c:host_cpu_policy

* cpu-policy.c:host_cpu_policy only affects what is advertised to
guests, via {pv,hvm}_cpu_policy and featureset bits.  Most notably a
quick skim doesn't show any mechanism by which host_cpu_policy could
affect what features Xen itself decides to use.

Not sure exactly why the nested virt stuff is done at the
host_cpu_policy level rather than the hvm_cpu_policy level, but since
that's where it is, that's where we need to change it.

FWIW, as I said in response to your comment on 2/6, it would be nicer
if we moved svm_feature_flags into the "capabilities" section; but
that's a different set of work.

 -George


 -George


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B17E96CC4C4
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 17:08:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515938.799323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phAvs-000299-Ny; Tue, 28 Mar 2023 15:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515938.799323; Tue, 28 Mar 2023 15:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phAvs-00026q-Kj; Tue, 28 Mar 2023 15:08:20 +0000
Received: by outflank-mailman (input) for mailman id 515938;
 Tue, 28 Mar 2023 15:08:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IY7/=7U=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1phAvq-0001cu-IZ
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 15:08:18 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ebaeb5a-cd7a-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 17:08:17 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id ek18so51069269edb.6
 for <xen-devel@lists.xenproject.org>; Tue, 28 Mar 2023 08:08:17 -0700 (PDT)
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
X-Inumbo-ID: 5ebaeb5a-cd7a-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680016097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftgbVGitq94O4TdWMnnAmTJwugrFTeka2OPr4Eje9HI=;
        b=esyqpFQmet9E1YfQaeHaiSCScZccc8DQ1E9VqXZ8CQq21x/CZMGdbJgqMuR0uCQ5Xo
         UnzXpuRCA9XVZKR3yWDuiVJPw8GNUetBUyAIL2fEx25Sfn/vpePsduxTxpVG67WEX3ip
         hjcK55hliJ7y1mlzJddQiFkqnyXH+g4ExUIxYCWzVdG4yHBsQPt2Ip0RqSMXWaO1cLNn
         nTfWsQzQeNm3Ru6cRscKIe+LcsEGqPnvbgIAJHFbw80O55AxiebZu7wPwKd1PaMUhyQ/
         +gmmqd2T5tqX1b08TFcPp4vk4TZANZxXZ/aHCDP9fRSgg60zdkgSpoCKbnzzgd6NnJXU
         RM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680016097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftgbVGitq94O4TdWMnnAmTJwugrFTeka2OPr4Eje9HI=;
        b=RG+Em1Z9o8woeeP9uX25/IVKbZbqCHyQwjGlSW3L6jmYipOrnlMzz5CnB9LDtR1SnH
         hKM1WJ8xfhQtaK/7tuHXvAibT9yXv6RSaXRPmOL6awuNwvv0vXpMBvveHoYGhdH1o2d3
         0f2Gt3+fzlIWfjCEBaC7wnGBng4XJBWWnpL6xNHhJvnaTnNF2IsRGcNmvJ2FN+aKBoHO
         dUSCZ2U/nlHNDsSOowIi8Bz2q0OeUOw9tJLKwUK63O4ASqw6one8imZTK1zmjJUwUfp8
         hBlvUVtmyDyzRxkl9gFlgTklOwWLgK/W5HXCR1l7GQFsEv8O8gSwTz4JCc/UfOxPn9/5
         0sww==
X-Gm-Message-State: AAQBX9d9nw12AwyXuazNOgZU8DezjoZ/XHHFmUQ+FZ7jJyMm3X17mFGq
	YdPIKq9I2PpBsQcf1KxwkJogbmWnHXG59wjnegY=
X-Google-Smtp-Source: AKy350bokq2a/IaXVBM1JXw+RMbif3Ln/22rcUKV18Tb29UKxoz2ORFwqSRFZjHPd56ri6L2TSdKPWd3VgrGY0zuTCE=
X-Received: by 2002:a17:906:ee8b:b0:93e:739f:b0b8 with SMTP id
 wt11-20020a170906ee8b00b0093e739fb0b8mr6819627ejb.3.1680016097170; Tue, 28
 Mar 2023 08:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <20230325024924.882883-3-marmarek@invisiblethingslab.com> <5cfcfb7a-df50-fbe4-89e6-611a83991790@suse.com>
 <ZCLl3ePLgrmFTViV@mail-itl> <1b530e63-de12-f953-1fb5-4e3c3ea69fea@suse.com>
 <ZCLrX2TmYlg2kMxL@Air-de-Roger> <CAKf6xptXovH5-OwuuJ4cNz4JxG-mw3mcwRBJf4PuTwjBA12fSA@mail.gmail.com>
 <6d4c11c3-31f1-48bc-b7b6-0ad0b73fc09c@suse.com> <CAKf6xptkHRcda5DPs4e2+7sgq8ck4-wKZhTHNC+43XWHZy_2TQ@mail.gmail.com>
 <dcba169e-9243-3e7c-f1fa-400af444f158@suse.com>
In-Reply-To: <dcba169e-9243-3e7c-f1fa-400af444f158@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 28 Mar 2023 11:08:05 -0400
Message-ID: <CAKf6xpu1DriHyknidr=o3YqWBQFEDjMndUYKpF1iW4BAhTmHNA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] x86/msi: clear initial MSI-X state on boot
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2023 at 9:54=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 28.03.2023 15:43, Jason Andryuk wrote:
> > On Tue, Mar 28, 2023 at 9:35=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 28.03.2023 15:32, Jason Andryuk wrote:
> >>> On Tue, Mar 28, 2023 at 9:28=E2=80=AFAM Roger Pau Monn=C3=A9 <roger.p=
au@citrix.com> wrote:
> >>>> On Tue, Mar 28, 2023 at 03:23:56PM +0200, Jan Beulich wrote:
> >>>>> On 28.03.2023 15:04, Marek Marczykowski-G=C3=B3recki wrote:
> >>>>>> On Tue, Mar 28, 2023 at 02:54:38PM +0200, Jan Beulich wrote:
> >>>>>>> On 25.03.2023 03:49, Marek Marczykowski-G=C3=B3recki wrote:
> >>>>>>>> Some firmware/devices are found to not reset MSI-X properly, lea=
ving
> >>>>>>>> MASKALL set. Xen relies on initial state being both disabled.
> >>>>>>>> Especially, pci_reset_msix_state() assumes if MASKALL is set, it=
 was Xen
> >>>>>>>> setting it due to msix->host_maskall or msix->guest_maskall. Cle=
aring
> >>>>>>>> just MASKALL might be unsafe if ENABLE is set, so clear them bot=
h.
> >>>>>>>
> >>>>>>> But pci_reset_msix_state() comes into play only when assigning a =
device
> >>>>>>> to a DomU. If the tool stack doing a reset doesn't properly clear=
 the
> >>>>>>> bit, how would it be cleared the next time round (i.e. after the =
guest
> >>>>>>> stopped and then possibly was started again)? It feels like the i=
ssue
> >>>>>>> wants dealing with elsewhere, possibly in the tool stack.
> >>>>>>
> >>>>>> I may be misremembering some details, but AFAIR Xen intercepts
> >>>>>> toolstack's (or more generally: accesses from dom0) attempt to cle=
an
> >>>>>> this up and once it enters an inconsistent state (or rather: start=
s with
> >>>>>> such at the start of the day), there was no way to clean it up.
> >>>>>
> >>>>> Iirc Roger and you already discussed that there needs to be an
> >>>>> indication of device reset having happened, so that Xen can resync
> >>>>> from this "behind its back" operation. That would look to be the
> >>>>> point/place where such inconsistencies should be eliminated.
> >>>>
> >>>> I think that was a different conversation with Huang Rui related to
> >>>> the AMD GPU work, see:
> >>>>
> >>>> https://lore.kernel.org/xen-devel/ZBwtaceTNvCYksmR@Air-de-Roger/
> >>>>
> >>>> I understood the problem Marek was trying to solve was that some
> >>>> devices where initialized with the MASKALL bit set (likely by the
> >>>> firmware?) and that prevented Xen from using them.  But now seeing t=
he
> >>>> further replies on this patch I'm unsure whether that's the case.
> >>>
> >>> In my case, Xen's setting of MASKALL persists through a warm reboot,
> >>
> >> And does this get in the way of Dom0 using the device? (Before a DomU
> >> gets to use it, things should be properly reset anyway.)
> >
> > Dom0 doesn't have drivers for the device, so I am not sure.  I don't
> > seem to have the logs around, but I believe when MASKALL is set, the
> > initial quarantine of the device fails.  Yes, some notes I have
> > mention:
> >
> > It's getting -EBUSY from pdev_msix_assign() which means
> > pci_reset_msix_state() is failing:
> >     if ( pci_conf_read16(pdev->sbdf, msix_control_reg(pos)) &
> >          PCI_MSIX_FLAGS_MASKALL )
> >         return -EBUSY;
>
> Arguably this check may want skipping when moving to quarantine. I'd
> still be curious to know whether the device works in Dom0, and
> confirmation of device reset's effect on the bit would also be helpful.

echo 1 > /sys/.../reset does not clear MASKALL.

Regards,
Jason


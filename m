Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7D7A6D8C3
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 12:00:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925349.1328215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twfXf-0000iU-7Y; Mon, 24 Mar 2025 11:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925349.1328215; Mon, 24 Mar 2025 11:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twfXf-0000fM-4S; Mon, 24 Mar 2025 11:00:27 +0000
Received: by outflank-mailman (input) for mailman id 925349;
 Mon, 24 Mar 2025 11:00:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g89S=WL=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1twfXe-0000fG-0D
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 11:00:26 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30027b1c-089f-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 12:00:24 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-549967c72bcso4976854e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 04:00:24 -0700 (PDT)
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
X-Inumbo-ID: 30027b1c-089f-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742814024; x=1743418824; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQcF2vHVnM0PyuipsWnc8UCgridVdo/qqWI6XlBnT+c=;
        b=azUt0B5unbuReCWVaEvMS0u4Dgf6tGodxt3SKkbTdrVbv9uQCODRM0+3tFsvOXnE6K
         /vaXxTUd3p+mQjfc5nM0dFWHl8t6MLppLIteJCF3ITv+PZxaRWNTiLo1hQIelq+KxUrh
         q63O3LqNZY190HGXOUAsAq2SsCVKYanOH4X1dyI9e98uhTwj5/Fip3oqUOCI/k9WKRfA
         oeY8EixJePuM78sPMKNxNUwdb+aEtNCFeKFlHRaheFK0P0Gl2jhPFf5s0ORQ2Jrl0CYL
         49bKHxR5EI/0uXJCxIBWjAOA2qbaIOGTPvdmRslxwLC4rz/gMp2wgPVOGzMXhayCOVOB
         PsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742814024; x=1743418824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQcF2vHVnM0PyuipsWnc8UCgridVdo/qqWI6XlBnT+c=;
        b=bWdU40+dFNL0gr2pbOh82eRbpRvVtXi3YZSsOVYYlJ+FEPCMWu4toszDSkjNvfGdi6
         jCE8w34VDPjmqrIbLUBs99pH1zxlG0KeIovdcYWnrergcghuuhpU6owsh50Nnxc5Pooe
         OiNZdnKa46x1qL/wjO6hL88na9unq29Xlf+Sl9ZHh0g4W7iIAbYNaobGN/Nt+El9RubH
         xrSkIvpKXCxAeDqF4IJABctAh1Kfi7Qo/liFnZGBcx5zZTAItG11zc8PH6mV6qsccxvH
         mx/mFAEDDBJXgaQk+5IRBkRzMhDjoNSmKzXaLhShZmaCDSznm/IvTNA3TAjTgNSgvU0B
         clmg==
X-Forwarded-Encrypted: i=1; AJvYcCUjvnrohwTRdElkKf+acZngW/sYvqyPUhoXOk3NYZtGDowZebigUmwMc5gYji0vD8688ITVVEegLXw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAm8K53NVBpnlA/hTBGT4QVOs6tFnqOPLYPFb/OwSRcsMF+mE4
	4Gk6DKLuFzR/7quv3dFjHMibLpMAvqmA4lXK20AMfFIvi7+QwIhLakNdB5xxgc3ppKfTIDYSXER
	KWBdLU3vg0lxO0vSWpNnmM/O5eqo=
X-Gm-Gg: ASbGncvlltq+9YqrEBouVrHAcB0RUb1xoiTDMDvL1IoJrTHwSB4mOW0DgUEVUZhFvgc
	0IpAHDCp2xLayPPeKpI4mPZlLjL5WT8KfUy7DsstqEaeQ5R3nesYSfbkG/19GdNtwqK/bhZCrc1
	7sxbeYOWE7MLYkQYDjP91AlLgWaw==
X-Google-Smtp-Source: AGHT+IFgaMS1lKiOLZTsAxU6Ga0d4BBGszAAFHmHOdvAHfkQxEJ6ktZBs73Adl9NsjF2XIbgnlKGnsbydGB0B3hq9bA=
X-Received: by 2002:a05:6512:239e:b0:545:d27:e367 with SMTP id
 2adb3069b0e04-54ad64f82e1mr3785816e87.42.1742814023808; Mon, 24 Mar 2025
 04:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741164138.git.xakep.amatop@gmail.com> <15604985aae5333670467a84cccbaaa403a10000.1741164138.git.xakep.amatop@gmail.com>
 <428f538a-0761-4d06-9c4f-ba74cf441b0d@suse.com> <CAGeoDV9Tgd1MhVutbKhWRJkMMMix5yFVRcA6vX=fP=fzqFdV1w@mail.gmail.com>
 <da301d1e-a6c7-49e1-be57-db844915ef09@suse.com>
In-Reply-To: <da301d1e-a6c7-49e1-be57-db844915ef09@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 24 Mar 2025 13:00:12 +0200
X-Gm-Features: AQ5f1JqkSdh80bdn7QRoNIKSWc1YhPP6A9I77U3LWdYRMbOWdNQ7oPpZUjGsUD4
Message-ID: <CAGeoDV-2cHiLSXSZLd+Fz7G+Fw6N9Uh5u9v3Emb1ZT8U_1pdxQ@mail.gmail.com>
Subject: Re: [PATCH 08/16] xen/arm: add watchdog domain suspend/resume helpers
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Dario Faggioli <dfaggioli@suse.com>, 
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Mirela Simonovic <mirela.simonovic@aggios.com>, 
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Mykyta Poturai <mykyta_poturai@epam.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 4:04=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 21.03.2025 10:50, Mykola Kvach wrote:
> > On Thu, Mar 13, 2025 at 5:34=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >> On 05.03.2025 10:11, Mykola Kvach wrote:
> >>> +void watchdog_domain_resume(struct domain *d)
> >>> +{
> >>> +    unsigned int i;
> >>> +
> >>> +    spin_lock(&d->watchdog_lock);
> >>> +
> >>> +    for ( i =3D 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
> >>> +    {
> >>> +        if ( test_bit(i, &d->watchdog_inuse_map) )
> >>> +        {
> >>> +            set_timer(&d->watchdog_timer[i].timer,
> >>> +                      NOW() + SECONDS(d->watchdog_timer[i].timeout))=
;
> >>
> >> The timeout may have almost expired before suspending; restoring to th=
e
> >> full original period feels wrong. At the very least, if that's indeed
> >> intended behavior, imo this needs spelling out explicitly.
> >
> > It takes some time to wake up the domain, but the watchdog timeout is
> > reset by a userspace daemon. As a result, we can easily encounter a
> > watchdog trigger during the  resume process.
>
> Which may mean the restoring is done too early, or needs doing in two
> phases.
>
> > It looks like we should
> > stop the watchdog timer from the guest, and in that case, we can drop
> > all changes related to the watchdog in this patch series.
>
> Except that then you require a guest to be aware of host suspend. Which
> may not be desirable.

I think this is not a problem; at least, I don't see how the guest
could be aware of the host suspend.

For now, we have three cases:

1) The guest is suspended (actually paused) because the system
suspends, and we pause all non-hardware domains.
2) The guest is suspended via the `xl` tool (x86 only, at least for now).
3) The guest requests S2R via `echo mem > /sys/power/state` or
`systemctl suspend`.

Let's review all these cases:

1) There is no action required here; it should be handled correctly by
domain pause. However, I think it is not handled properly right
now=E2=80=94but that is not an issue with the current patch series.
2) There are potential problems here. We should either notify the
domain that it will be suspended (which is hard to implement and the
guest will be aware of the host suspending) or suspend watchdog
directly during the execution of `xl` commands (more preferable).
3) As far as I know, if `watchdogd` is running, we can simply add an
action to it on suspend/resume events (need to review not Linux kernel
cases). In the case of the Linux kernel driver, it already handles
suspending/resuming the Xen watchdog correctly.

So, if I am not mistaken, we can drop all patches related to watchdog
suspend in Xen until `xl suspend/resume` for ARM64 is implemented. For
other cases, we should handle suspend/resume of the watchdog via the
`watchdogd` service.

Note: As far as I know, only the control domain has `watchdogd`
(though we could potentially set it up for other domains). DomUs can
only use the Xen watchdog Linux kernel driver.

>
> Jan

~Mykola


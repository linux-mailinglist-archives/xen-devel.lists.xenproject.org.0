Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2461F71FB
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 03:58:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjYwB-0008CL-JR; Fri, 12 Jun 2020 01:56:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oAPF=7Z=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jjYwA-0008CG-54
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 01:56:54 +0000
X-Inumbo-ID: fc87e6d4-ac4f-11ea-bb8b-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc87e6d4-ac4f-11ea-bb8b-bc764e2007e4;
 Fri, 12 Jun 2020 01:56:53 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 9so9266977ljv.5
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2020 18:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FBDI/B5IB0vJjCABbmkQCbB6328dkyQOgPMlgLV2if8=;
 b=HByEA72btsocDdS7+l7sAReQrchL5YHwOhpdg3Nn2IBiL7J26LM9GsQoQTycLW0hbc
 5hW7+7pDBacPR086QIYo54pjWv6OOTQ6tOzHRkUeUfMfNhS6tWXvIlV0NgzMKO0i0XDG
 WgTe6CA7zUi1Ky0Wg5H0wwlAsxFLytSDAKXq2/M+57BASjqR6TlWSmsvmu9aZaxpAQW2
 FA+ZQqywt0itYlt45GfNWViQXPpH9aCxYzWP3ROg+LudC4NDMjOc6mclQxSc0Lsx92iC
 sf8VNhsMSKqYXHf1tjTCVfm/opS5Q2CUVUTZcVAa3yBJ7MyzDH2FOLxoGdBx7sT831GY
 P5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FBDI/B5IB0vJjCABbmkQCbB6328dkyQOgPMlgLV2if8=;
 b=lAGL15R3VmXAbklAUYM2yeHEPbH+ONh3yJAPJQ5QVTPnZLMs8YKNN2arfww9jEJXGe
 WWLcg2nfxMRg+Ug935heE5VZ3OH2uqvrPZByb7N0Pm+tAzpX0EPJTgFRj1m1qgEV6kRT
 sIU7wz2PNwxyn8rvk7SxaNEzPfGmeyoU+C/cVQZeXQ/lcPedQHfk5GS8wn3P1G9xeYcd
 hbWIBSDvX59Qyau2lDUbtTyJJy0iq901vtLdI/prvKGcfkTkPjylCZjACkfv7YPTjHtG
 Stw49iDfZLXtLIiHSsAW3SIWngTG37hGLOimQ/4Yb3GsICfZpENf4KiuBj0/CCr6WuKf
 v0ug==
X-Gm-Message-State: AOAM533ZN2wKlyQ2QpHlK8xr2U3E6xpJs9WB1Gca5mKVbhWYeVWHNIXS
 YNEEPoZim38Q4jRQWzzmDLLEhr0yisX7q8QTYrY=
X-Google-Smtp-Source: ABdhPJwD2LCbadd+slSnQ4kdRR5uQAa3UebuN48BTBToDhoYhS7i9ROTG0ZtFDGKGwVRx01GS3ZmkGTYsauRh9QFhzo=
X-Received: by 2002:a2e:b88c:: with SMTP id r12mr5609398ljp.266.1591927012154; 
 Thu, 11 Jun 2020 18:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAKf6xpvu6rMbBpxWUdDZ-W3ZL+6TTNad3tx6bwtieNkhjXeF6w@mail.gmail.com>
 <a31e3768-fa0b-de24-0603-31b01b058644@linux.ibm.com>
In-Reply-To: <a31e3768-fa0b-de24-0603-31b01b058644@linux.ibm.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 11 Jun 2020 21:56:40 -0400
Message-ID: <CAKf6xpsbfzaK-YnDB9kXkA534Rp3BUV8_z1SsuNE=7_vksts7Q@mail.gmail.com>
Subject: Re: Seabios Xen TPM check
To: Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Quan Xu <quan.xu0@gmail.com>,
 seabios@seabios.org, Emil Condrea <emilcondrea@gmail.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 11, 2020 at 10:32 AM Stefan Berger <stefanb@linux.ibm.com> wrote:
>
> On 6/11/20 8:36 AM, Jason Andryuk wrote:
> > Hi,
> >
> > SeaBIOS commit 67643955c746 (make SeaBios compatible with Xen vTPM.)
> > made tpm_start() exit before calling tpm_startup().  The commit
> > message has no explanation why this change was made.  Does anyone
> > remember why it was made?
> >
> > The code today means SeaBIOS will not populate PCRs when running on
> > Xen.  If I revert the patch, SeaBIOS populates PCRs as one would
> > expect.  This is with a QEMU-emulated TPM backed by swtpm in TPM 1.2
> > mode (qemu & swtpm running in a linux stubdom).
> >
> > Any insight is appreciated.
>
> My guess would be that for some reason the TPM 1.2 was already started
> up through other means and didn't need the SeaBIOS tpm_startup() to run.

Hmmm, yes.  Thanks, Stefan.  The mini-os vtpm stubdom calls
TPM_Startup and it looks like the Berlios tpm_emulator returns an
error when called twice.

From a little bit of googling, Quan and Emil (added to CC) were
working on an interface from QEMU to the vtpm stubdom, but it looks
like it didn't get merged into upstream QEMU?  It doesn't seem to be
there now.

Anyway, the mini-os vtpm stubdom calls TPM_Startup since a PV guest
doesn't have firmware to make the call.  SeaBIOS could make a
tpm_startup error non-fatal for Xen.  Or better - detect a vtpm
stubdom and only then skip initialization.  vtpm stubdom could also be
changed to skip TPM_Startup for HVM - not sure if that would be
problematic.  That would let SeaBIOS drop the Xen condition.

Regards,
Jason


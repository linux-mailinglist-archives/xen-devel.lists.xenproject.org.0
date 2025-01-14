Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF563A10A14
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 15:59:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871450.1282443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXiNP-0001gU-Hr; Tue, 14 Jan 2025 14:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871450.1282443; Tue, 14 Jan 2025 14:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXiNP-0001e8-F2; Tue, 14 Jan 2025 14:58:43 +0000
Received: by outflank-mailman (input) for mailman id 871450;
 Tue, 14 Jan 2025 14:58:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iLru=UG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tXiNO-0001e2-Jr
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 14:58:42 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a738c4e-d288-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 15:58:41 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5d9f0a6adb4so2933652a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 06:58:40 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c905f0b3sm636754266b.21.2025.01.14.06.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 06:58:39 -0800 (PST)
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
X-Inumbo-ID: 0a738c4e-d288-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736866720; x=1737471520; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UoLRmHzqLuX1KEnrPA06X9xkODfSUFTM9ow3hNLjjDA=;
        b=nU9JkQEq5x9BpOaRv40i6QBK8e71KISLh4sfvko+taH+JNkiEUVZf9lHIPDNryMc8K
         s7oYl4q6f4wJcfSU33fUwfR4h2B/wH1H5PgRgDSLp+sVjuN3lA5g0YRGshzwyG8EFwnu
         NSP7e0vLRDCtmdbek+l5ctVD513mhrxgxudnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736866720; x=1737471520;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UoLRmHzqLuX1KEnrPA06X9xkODfSUFTM9ow3hNLjjDA=;
        b=D91htbHjWoJkyCAp3IR3QLQRffyXE/sry7Wcl7euVeukwW6uPS7sEWByqyrMDCSLYb
         CUf8CMrbmuwJn8ndSZqxVdiUsmTtCvWHg4XQ/Q3vJlHRxD+iXnBT4PmMKZ1v61HQt0Iu
         1daPWvjMLIz2SbE2AyB2psisTBsTJfvyVh1Cp9C88Vrd5x9Wu/m4SriqXuifpdqLLTrF
         fkkgNQAS2jYoIVPQRFKorFw2IqHUsby3deg1bY2ZDRhjCLA035OUh0zuxKrMZIwU/zj9
         NIeHTwv9nHypQ2HYOwNgoasWt0L3+qm75uZxoARnHHfGhTIeHih5+PjqUecMWTDdVFDy
         LCbw==
X-Forwarded-Encrypted: i=1; AJvYcCUE1SIGUPEM0F1L7bkZW9ss3muDfZmKf1rrehCTguZVwjGWbaWIUDUEpDo13iv8BbXSZnSndigHJi4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyoLd6fZOD+Z5jJ/2O1nfKTP6OQLkZEpcodLXhxViWZIlElgJ6X
	Ax40dk9i7fVTqhn6fl5kx+fwOzaL/bIaM7iv8bUz4tpIkXcAO3yZ4jrcnAFPGGw=
X-Gm-Gg: ASbGncstHM2AWMsBXoq/EFLU0W65sHEUi4A/PrqfsV5QOJaD9/djfTsp5w0+sST2sSt
	tQ6hsisAhVa7pC5zL1BX4WUVlwX0qeuAVoiMHX47Em0EmF0EApClhep3gVu0BTwWqczpQCJjysu
	PDngL0z5vud4X1nOENO7zb0uD3p7klUPxl3a5Ns2wUl1ifPWj257+qCXheG2yRvC21P8JdJV5HK
	z5WjFda8TkbfYOploOOTSZQQRbejqBwodVBm64WU7C+TN9tDL1S1laiy1/eGg==
X-Google-Smtp-Source: AGHT+IG6mhN/XZYcbgvOjXoI2wpDb4WCMM8HX+x7QIiY7TISjkYK3twnu890dAKxdxFAX1Br6CbMow==
X-Received: by 2002:a17:906:9c8c:b0:ab2:c3ef:ed1e with SMTP id a640c23a62f3a-ab2c3efee73mr1894055966b.10.1736866719884;
        Tue, 14 Jan 2025 06:58:39 -0800 (PST)
Date: Tue, 14 Jan 2025 15:58:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v7 1/2] x86/time: introduce command line option to select
 wallclock
Message-ID: <Z4Z7njl5RBznoaxM@macbook.local>
References: <20240913075907.34460-1-roger.pau@citrix.com>
 <20240913075907.34460-2-roger.pau@citrix.com>
 <Z4U6WxtmaqGkqOqe@mail-itl>
 <Z4VS88REbzn5uasy@macbook.local>
 <49a2404f-0c45-4397-9094-a4189131832f@gmail.com>
 <Z4ZKINmJXw5T2dsM@macbook.local>
 <78e09ccb-65b7-4022-b9fc-7874e34c1a99@gmail.com>
 <9288f0de-945f-4056-9934-16b2b1704fb1@gmail.com>
 <Z4ZU_uvCe5lu0aMv@macbook.local>
 <481e1955-783a-48d0-8604-ec8554f50fc5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <481e1955-783a-48d0-8604-ec8554f50fc5@gmail.com>

On Tue, Jan 14, 2025 at 03:23:21PM +0100, Oleksii Kurochko wrote:
> 
> On 1/14/25 1:13 PM, Roger Pau Monné wrote:
> > On Tue, Jan 14, 2025 at 12:44:39PM +0100, Oleksii Kurochko wrote:
> > > On 1/14/25 12:40 PM, Oleksii Kurochko wrote:
> > > > 
> > > > On 1/14/25 12:27 PM, Roger Pau Monné wrote:
> > > > > On Tue, Jan 14, 2025 at 12:12:03PM +0100, Oleksii Kurochko wrote:
> > > > > > On 1/13/25 6:52 PM, Roger Pau Monné wrote:
> > > > > > > On Mon, Jan 13, 2025 at 05:07:55PM +0100, Marek Marczykowski-Górecki wrote:
> > > > > > > > On Fri, Sep 13, 2024 at 09:59:06AM +0200, Roger Pau Monne wrote:
> > > > > > > > > Allow setting the used wallclock from the command line.  When the option is set
> > > > > > > > > to a value different than `auto` the probing is bypassed and the selected
> > > > > > > > > implementation is used (as long as it's available).
> > > > > > > > > 
> > > > > > > > > The `xen` and `efi` options require being booted as a Xen guest (with Xen guest
> > > > > > > > > supported built-in) or from UEFI firmware respectively.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Roger Pau Monné<roger.pau@citrix.com>
> > > > > > > > Reviewed-by: Marek Marczykowski-Górecki<marmarek@invisiblethingslab.com>
> > > > > > > Thanks for the review.
> > > > > > > 
> > > > > > > Oleksii, can I get your opinion as Release Manager about whether this
> > > > > > > (and the following patch) would be suitable for committing to staging
> > > > > > > given the current release state?
> > > > > > > 
> > > > > > > It's a workaround for broken EFI implementations that many downstreams
> > > > > > > carry on their patch queue.
> > > > > > Based on your commit message, I understand this as addressing a bug ( but not very critical
> > > > > > as IIUC downstreams have the similar patch on their side ). Therefore, if it has been properly
> > > > > > reviewed and tested, we should consider including it in the current release.
> > > > > IIRC at least Qubes, XenServer and XCP-ng have a patch that achieves
> > > > > the same behavior as proposed here.
> > > > > 
> > > > > > IIUC, setting the wallclock to EFI should align with the behavior Xen had previously.
> > > > > > It might be preferable to use that argument as the default for a while, allowing others to verify the "auto"
> > > > > > value over time. After that, we could consider making "auto" the default.
> > > > > > That said, I am not particularly strict about following this approach.
> > > > > We cannot really set efi as the default, as it would break when
> > > > > booting on legacy BIOS systems.
> > > > > 
> > > > > We could take only patch 1 and leave patch 2 after Xen 4.20 has
> > > > > branched, but at that point I would see little benefit in having just
> > > > > patch 1.
> > > > I don't see a lot of benefit of comitting only the one patch either.
> > > > 
> > > > 
> > > > > I don't have a strong opinion, but downstreams have been complaining
> > > > > about Xen behavior regarding the usage of EFI_GET_TIME, so it might be
> > > > > good to not ship yet another release with such allegedly broken
> > > > > behavior.
> > > > Agree with that. As  I mentioned above I consider it as a bug and based on
> > > > that several mentioned above downstreams have the similar patch I could consider
> > > > that as tested approach so ..
> > > > > Let me know what you think, as I would need a formal Release-Ack if
> > > > > this is to be committed.
> > > > ... R-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>.
> > > Sorry for the noise.
> > > 
> > > I missed to add that it would also be nice to mention IMO ( that now we have wallclock parameter )
> > > in CHANGELOG so downstreams will receive "notification" that Xen provides a workaround for the mentioned
> > > issue in the patch series.
> > Indeed.  Would you be OK with adding the following chunk to patch 2?
> > 
> > diff --git a/CHANGELOG.md b/CHANGELOG.md
> > index 8507e6556a56..1de1d1eca17f 100644
> > --- a/CHANGELOG.md
> > +++ b/CHANGELOG.md
> > @@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >      leaving this to the guest kernel to do in guest context.
> >    - On x86:
> >      - Prefer ACPI reboot over UEFI ResetSystem() run time service call.
> > +   - Prefer CMOS over EFI_GET_TIME as time source.
> >      - Switched the xAPIC flat driver to use physical destination mode for external
> >        interrupts instead of logical destination mode.
> > @@ -24,6 +25,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >      - Support for LLC (Last Level Cache) coloring.
> >    - On x86:
> >      - xl suspend/resume subcommands.
> > +   - `wallclock` command line option to select time source.
> 
> What about of adding word 'Add' before `wallclock`?

It's in the "Added" section, so I thought it would be redundant.

> Other LGTM: Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Let me know if you would still like me to prepend "Add" to the above
item.

Thanks, Roger.


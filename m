Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF3BA1841B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 19:03:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875662.1286108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taIaI-0007hj-N9; Tue, 21 Jan 2025 18:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875662.1286108; Tue, 21 Jan 2025 18:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taIaI-0007fd-KN; Tue, 21 Jan 2025 18:02:42 +0000
Received: by outflank-mailman (input) for mailman id 875662;
 Tue, 21 Jan 2025 18:02:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jEc5=UN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1taIaG-0007fX-VF
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 18:02:41 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6924a69-d821-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 19:02:38 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ab39f84cbf1so719639666b.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 10:02:38 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384f86272sm783077866b.131.2025.01.21.10.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 10:02:35 -0800 (PST)
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
X-Inumbo-ID: e6924a69-d821-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737482558; x=1738087358; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GJk/G0s9PSVIMmLyL9Z6K7hA1vh4XdMlLF14FiECGDo=;
        b=l+qQgJH2uisqQAZTtXzxpQkeyFqpm7PeopeiWjPxxQ75sw0nUImA+uT8ezYj2CfIhN
         FpxqPhVPKZfKnr7nLtEH7kHfAITeBw89V1hEammYS4vnQhX/CrsTGsrt6/CCX9GYLOEq
         0Go5p/exeYiV8MlkvAjjPoaFxCKJIMYTnUEYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737482558; x=1738087358;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GJk/G0s9PSVIMmLyL9Z6K7hA1vh4XdMlLF14FiECGDo=;
        b=kRLMhRJeZTak2BVlP1r84VeoUobacLy3c3P/V9fYxD6wuceSCEInustOSUd7XrVU8z
         pgfh8skQoZ7lu7tvCNAWikssH0AosGnfdguSleGVkkGSLj1GmAe48LjLolgW3Hj4I2Tq
         Wlcfu3RIZ8cDLPsXGG7Gz3f+9tLxttBnPUX3vD2GGx6zxuo0yK1BZ2E4Wuh2amPYNyP/
         9M3ni5MITn1JQC6qcOfhWiDlwvxT/o8yyeTysTXEZfZIusNJw1ma5fZUOxzAoxzvfYAB
         LWFqAxenFd3CGBp/mOTdK0mDwL2Afhs096RZ1oBOBHAOWs6YOOdiW9RlWsn71PW2BVr8
         nR4g==
X-Forwarded-Encrypted: i=1; AJvYcCUYnUZe+kTqDHdfAtwrEvJaAou6dQeUOWSC0Tpa/3fUuwo9CEdJoHwBKwKuuS9qqP6b7AWb+NiwwNY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxfm1BUTlJp8qbwA6cLAX5OsatE0IBD3JysU626Eg0yFuDuiuNo
	0/A65EZApfJsDEEqMQKiWcdlJn3Xd22i/nBDpBNP8BlEcEjTleJps5deXcA1v9w=
X-Gm-Gg: ASbGncvPeKK+AJFhrRVWbwJ/6hwzisK1o4ISyd1cXBbU8alMshkccmGCA8crKchVcrT
	mzCcxrSiGgsK+jDZsSzzUwgsyegw2B7/A/kdpjNN+ozg6f6gjmeWmFAOIc7D1Ju+pZ8TcJVPFI3
	WRAec520dlBmwFKz6BWKsmDKxdRV/74as+F5GRME4pr5kWL2IAmbxCADDXuWWzILt52QjzqwoSB
	nImCnxCRydFHLITquJ9//LbWLihLtvnc0F2J1fLPDKrSwkNOK8YfK7bzZIJlZqWY6ibNw6KGDY=
X-Google-Smtp-Source: AGHT+IEX/pcZDUDZCmo0FxPsa1DFtDpMkew0eUS2Md/SqwLoEM2qmXnWuROzFUJZvz6Hx+j4T9GeEA==
X-Received: by 2002:a17:907:969f:b0:aa6:8dcb:365c with SMTP id a640c23a62f3a-ab38b3ce55fmr2026298066b.49.1737482556484;
        Tue, 21 Jan 2025 10:02:36 -0800 (PST)
Date: Tue, 21 Jan 2025 19:02:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
	sergiy_kibrik@epam.com
Subject: Re: [PATCH v2 1/4] x86: provide an inverted Kconfig control for
 shim-exclusive mode
Message-ID: <Z4_hOmi01AkiYH_k@macbook.local>
References: <Z4oxZSUQ6VARiR0H@macbook.local>
 <D74CH4RDRRR9.ZR6RL8U6PQ56@cloud.com>
 <6285f86d-f2d2-4040-999d-01aed3e72a36@suse.com>
 <alpine.DEB.2.22.394.2501171430570.2684657@ubuntu-linux-20-04-desktop>
 <f8c1e2c2-ceb5-4200-a304-e2d824a171a8@citrix.com>
 <40c9d806-000d-43e7-a804-ad4e84209b2f@suse.com>
 <alpine.DEB.2.22.394.2501201527090.11086@ubuntu-linux-20-04-desktop>
 <bae48627-fa5b-48b6-b74e-267285175eff@suse.com>
 <Z49gQBkxCbXIO84D@macbook.local>
 <41859184-bd9c-420f-96c1-65abe379b81e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41859184-bd9c-420f-96c1-65abe379b81e@suse.com>

On Tue, Jan 21, 2025 at 11:35:42AM +0100, Jan Beulich wrote:
> On 21.01.2025 09:52, Roger Pau Monné wrote:
> > On Tue, Jan 21, 2025 at 09:13:38AM +0100, Jan Beulich wrote:
> >> On 21.01.2025 00:27, Stefano Stabellini wrote:
> >>> On Mon, 20 Jan 2025, Jan Beulich wrote:
> >>>> On 18.01.2025 00:41, Andrew Cooper wrote:
> >>>>> On 17/01/2025 10:43 pm, Stefano Stabellini wrote:
> >>>>>> On Fri, 17 Jan 2025, Jan Beulich wrote:
> >>>>>>> On 17.01.2025 13:24, Alejandro Vallejo wrote:
> >>>>>>>> On Fri Jan 17, 2025 at 10:31 AM GMT, Roger Pau Monné wrote:
> >>>>>>>>> On Thu, Jan 16, 2025 at 04:31:46PM -0800, Stefano Stabellini wrote:
> >>>>>>>>>> On Wed, 1 Mar 2023, Jan Beulich wrote:
> >>>>>>>>>>> While we want certain things turned off in shim-exclusive mode, doing
> >>>>>>>>>>> so via "depends on !PV_SHIM_EXCLUSIVE" badly affects allyesconfig: Since
> >>>>>>>>>>> that will turn on PV_SHIM_EXCLUSIVE, other options will be turned off as
> >>>>>>>>>>> a result. Yet allyesconfig wants to enable as much of the functionality
> >>>>>>>>>>> as possible.
> >>>>>>>>>>>
> >>>>>>>>>>> Retain PV_SHIM_EXCLUSIVE as a prompt-less option such that first of all
> >>>>>>>>>>> C code using it can remain as is. This isn't just for less code churn,
> >>>>>>>>>>> but also because I think that symbol is more logical to use in many
> >>>>>>>>>>> (all?) places.
> >>>>>>>>>>>
> >>>>>>>>>>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>>>>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>>>>>>>>>
> >>>>>>>>>>> ---
> >>>>>>>>>>> The new Kconfig control's name is up for improvement suggestions, but I
> >>>>>>>>>>> think it's already better than the originally thought of
> >>>>>>>>>>> FULL_HYPERVISOR.
> >>>>>>>>>> I think the approach in general is OK, maybe we can improve the naming
> >>>>>>>>>> further. What about one of the following?
> >>>>>>>>>>
> >>>>>>>>>> NO_PV_SHIM_EXCLUSIVE
> >>>>>>>>>> PV_SHIM_NOT_EXCLUSIVE
> >>>>>>>>> IMO negated options are confusing, and if possible I think we should
> >>>>>>>>> avoid using them unless strictly necessary.
> >>>>>>>> The problem is that the option is negative in nature. It's asking for
> >>>>>>>> hypervisor without _something_. I do agree with Stefano that shim would be
> >>>>>>>> better in the name. Otherwise readers are forced to play divination tricks.
> >>>>>>>>
> >>>>>>>> How about something like:
> >>>>>>>>
> >>>>>>>>     SHIMLESS_HYPERVISOR
> >>>>>>>>
> >>>>>>>> That's arguably not negated, preserves "shim" in the name and has the correct
> >>>>>>>> polarity for allyesconfig to yield the right thing.
> >>>>>>> Except that a hypervisor with this option enabled isn't shim-less, but permits
> >>>>>>> working in shim as well as in non-shim mode.
> >>>>>> First, let's recognize that we have two opposing requirements. One
> >>>>>> requirement is to make it as easy as possible to configure for the user.
> >>>>>> Ideally without using negative CONFIG options, such as
> >>>>>> NO_PV_SHIM_EXCLUSIVE. From the user point of view, honestly,
> >>>>>> PV_SHIM_EXCLUSIVE is a pretty good name. Better than all of the others,
> >>>>>> I think.
> >>>>>>
> >>>>>> On the other hand, we have the requirement that we don't want
> >>>>>> allyesconfig to end up disabling a bunch of CONFIG options. Now this
> >>>>>> requirement can be satisfied easily by adding something like
> >>>>>> NO_PV_SHIM_EXCLUSIVE. However, it would go somewhat against the previous
> >>>>>> requirement.
> >>>>>>
> >>>>>> So we need a compromise, something that doesn't end up disabling other
> >>>>>> CONFIG options, to make allyesconfig happy, but also not too confusing
> >>>>>> for the user (which is a matter of personal opinion).
> >>>>>>
> >>>>>> In short, expect that people will have different opinions on this and
> >>>>>> will find different compromises better or worse. For one, I prefer to
> >>>>>> compromise on "no negative CONFIG options" and use
> >>>>>> PV_SHIM_NOT_EXCLUSIVE. Because it serves the allyesconfig goal, and
> >>>>>> while it is not as clear as PV_SHIM_EXCLUSIVE, is still better than a
> >>>>>> completely generic FULL_HYPERVISOR option, which means nothing to me.
> >>>>>>
> >>>>>> I cannot see a way to have a good and clear non-negated CONFIG option,
> >>>>>> and also satisfy the allyesconfig requirement. So I prefer to compromise
> >>>>>> on the "non-negated" part.
> >>>>>
> >>>>> Debating the naming is missing the point.
> >>>>>
> >>>>>
> >>>>> The problem here is the wish to have PV_SHIM_EXCLUSIVE behave in a way
> >>>>> that Kconfig is not capable of expressing.  Specifically, what is broken
> >>>>> is having "lower level" options inhibit unrelated "higher level" options
> >>>>> when the graph gets rescanned[1].  That's why we're in the laughable
> >>>>> position of `make allyesconfig` turning off CONFIG_HVM.
> >>>>>
> >>>>> Jan, you want "echo PV_SHIM_EXCLUSIVE=y >> .config && make" to mean
> >>>>> "reset me back to a PV Shim".
> >>>>
> >>>> Isn't this an independent goal? Or is this a statement on what you see
> >>>> my change (kind of) doing, indicating you consider this wrong?
> >>>
> >>> The way I understood it, it is the latter
> >>>
> >>>
> >>>>> Kconfig spells this "make $foo_defconfig" for an appropriately given foo.
> >>>>>
> >>>>>
> >>>>> There should be:
> >>>>>
> >>>>> 1) an option called PV_SHIM_EXCLUSIVE which does *nothing* other than
> >>>>> making the boolean be a compile time constant.
> >>>>
> >>>> I fear it remains unclear to me what exactly you mean here. It feels like
> >>>> you may be suggesting that all other uses of PV_SHIM_EXCLUSIVE should be
> >>>> dropped, without replacement. That seems wrong to me, though. In
> >>>> particular I'm of the opinion that besides using "make pvshim_defconfig"
> >>>> people ought to also have the option to properly configure a shim build
> >>>> from scratch (or from any random .config they hold in hands), requiring
> >>>> respective "depends on" and/or "select" / "imply" to be in place.
> >>>
> >>> That should be done with "make pvshim_defconfig"
> >>
> >> Why? Specifically, why should people use only one entirely nailed down
> >> configuration for a shim. Like a "normal" hypervisor, there are aspects
> >> which very well can be left to the person doing the configuration.
> > 
> > But nothing prevents a user from starting from a shim defconfig, and
> > then tweaking it as desired:
> > 
> > $ make pvshim_defconfig
> > $ make menuconfig
> > 
> > Or there's something I'm missing here?
> 
> Well, no, you don't. But if the above is okay, why would not starting from
> pvshim_defconfig not also be okay? Plus whichever way tweaks are done,
> sensible dependencies should still be enforced imo.

Not starting from pvshim_defconfig should always be OK, as the
defconfig file is just a set of options that the user can otherwise
enable manually.

There are two different things that PV_SHIM_EXCLUSIVE accomplishes:
 - Use to remove code blocks or change defines:  for example
   short-circuiting PG_log_dirty to 0.  This should likely be done
   using a different more fine grained set of Kconfig options.
 - Convert pv_shim to a compile time constant: this is the tricky part
   IMO, as such conversion will force DCO and thus make the resulting
   Xen binary no longer what a user would expect when using
   allyesconfig.

> >>>> Or else they may end up with a lot of dead code. (Just consider e.g.
> >>>> HVM=n: We also don't permit HVM-only stuff to be enabled in that case,
> >>>> as any of that would again be dead code then.)
> >>>
> >>> It will always be possible to come up with poor configurations. I do not
> >>> believe it is necessarily our responsibility to go out of our way to
> >>> prevent them.
> >>
> >> Well - if so, why would we do this in some cases but not in others?
> >> You may recall that I'm a proponent of consistency and predictability.
> >>
> >>>>> 2) a pvshim_defconfig target which expresses what a pvshim ought to look
> >>>>> like.
> >>>>
> >>>> We have this file already. I consider it debatable though whether this file
> >>>> should really force PV_SHIM_EXCLUSIVE=y. People may read "pvshim" in the
> >>>> name as either "works just as shim" or "can also work as shim".
> >>>
> >>> If I understood it right, I like Andrew's suggestion. He is suggesting
> >>> to do the following:
> >>>
> >>> - turning PV_SHIM_EXCLUSIVE into something that does nothing
> >>
> >> FTAOD - you mean Kconfig-wise? Andrew clearly didn't say "nothing", but
> >> "nothing other than making the boolean be a compile time constant".
> > 
> > Won't making the boolean a compile time constant would also result in
> > DCO kicking in and removing a fair amount of code?  So even if you
> > have enabled everything in Kconfig, the resulting hypervisor would
> > only be suitable to be used as a shim?
> 
> Of course.

Then what's the point of this approach?  Options will be enabled in
Kconfig, but the resulting hypervisor build when using allyesconfig
would have a lot of them short-circuited, making it even worse than
currently?  As options will get effectively build-time disabled due
to DCO while enabled in Kconfig.

Overall I think PV_SHIM_EXCLUSIVE should be excluded from
allyesconfig, even with Andrew's proposed change.  Otherwise the
purpose of allyesconfig is defeated if enabling PV_SHIM_EXCLUSIVE
makes the resulting hypervisor build PV shim only.  IIRC we can
provide a default alllyes.config with CONFIG_PV_SHIM_EXCLUSIVE=n.

Thanks, Roger.


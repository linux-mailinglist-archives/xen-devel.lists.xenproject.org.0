Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CEC918A3D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 19:42:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749395.1157478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMWf9-0003nl-FI; Wed, 26 Jun 2024 17:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749395.1157478; Wed, 26 Jun 2024 17:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMWf9-0003kk-By; Wed, 26 Jun 2024 17:42:31 +0000
Received: by outflank-mailman (input) for mailman id 749395;
 Wed, 26 Jun 2024 17:42:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=evFT=N4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sMWf7-0003hq-FY
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 17:42:29 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7417fc57-33e3-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 19:42:27 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52cd80e55efso9491732e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 10:42:27 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fe779bc80sm515114666b.174.2024.06.26.10.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 10:42:26 -0700 (PDT)
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
X-Inumbo-ID: 7417fc57-33e3-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719423746; x=1720028546; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aye+kJexgftmI7DoGF7ISR/b5pwbzdvkf9SkYl1FV14=;
        b=GdgDo+V38KdmYMbayBMTd/f29eIUF1LUMUlQz01IZtE3G8nYdRtuXBXB4teUS76fZO
         WDfb6sXYUUyvuahVsa5TgM8lTEU1G/lGmtSZBofgSrbUT5bVxUuKbHeT8m62S9Vq2uhF
         MEaexqjGhmVk3PnIBjNk61JZLncKkMYcdDrjjej/kKpG9eABwM48RqlPA4Z6ewd2z0kE
         ae9xio8OxLPoE1MJR1YfFnUIPL6XPMQhhhMrS1h8mJ0Y0GbkdJks+EnR3KOrDmqXwEGx
         VcZGn+2K4QB9fXEi9ZmrC+xIJa5oAqZBm6RFye4pTGuggD9vEDMssEEMoMblcuV12Tau
         LTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719423746; x=1720028546;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aye+kJexgftmI7DoGF7ISR/b5pwbzdvkf9SkYl1FV14=;
        b=lAz3XVTJKKj7NS+I9/LF8sdd/23Sys+trXnJr9Fg42x2nsZEl82HJvqFqnXkROLiZt
         +c+pLO2T4R7g/XrYF78tbKOQTmjUxHYP97QkvmUdrri5X76nDBbELyeKe0MFT/mgsuUi
         aWiuIsNpx0JEZpQbpjESHnsCpUsRhPw4NZh94658hPFkGHxUCvFui2GYPZJSwUrsF6wh
         eykB4TdKjJ2ZSzl6nqaE3+RWEyRwe2mTVcbHvwRTJmtMcCSToahOu2xq1+8IQgUyXa0u
         JPrDJqPGcmb1Qsl4OkJT1uq3ocYIkWaFMpEjsM26df51kQ4gx0CPC2C/XmQ72rye0JP6
         jQvA==
X-Gm-Message-State: AOJu0YxeO/QA9w433yNbYNj4USzmxqz8wjGnpBh7XVdSpZ9R38G2QEdg
	HLVnvqWO7ABNpnRrFrJNvZk8bZRivtqRNeAhMR1hp94uw8S2O2jt
X-Google-Smtp-Source: AGHT+IGSZZ2NfovW5WlFKsopSOVg4+MBdHHq/kKbuDMYwRSqz9FY2WJi7CuH6vbn0tXeFwer7MEEbg==
X-Received: by 2002:ac2:41c5:0:b0:52c:e17c:cd7b with SMTP id 2adb3069b0e04-52ce1832abdmr8550465e87.22.1719423746381;
        Wed, 26 Jun 2024 10:42:26 -0700 (PDT)
Message-ID: <9814c00d116f14a1ce238b131b9eba19fa130986.camel@gmail.com>
Subject: Re: [XEN PATCH v2 0/6][RESEND] address violations of MISRA C Rule
 20.7
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com,  Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
 Julien Grall <julien@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Date: Wed, 26 Jun 2024 19:42:24 +0200
In-Reply-To: <88127f41-a3e3-4d05-b9f2-3e4117bf1503@suse.com>
References: <cover.1718378539.git.nicola.vetrini@bugseng.com>
	 <alpine.DEB.2.22.394.2406241743480.3870429@ubuntu-linux-20-04-desktop>
	 <88127f41-a3e3-4d05-b9f2-3e4117bf1503@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-06-25 at 08:39 +0200, Jan Beulich wrote:
> On 25.06.2024 02:47, Stefano Stabellini wrote:
> > I would like to ask for a release-ack as the patch series makes
> > very few
> > changes outside of the static analysis configuration. The few
> > changes to
> > the Xen code are very limited, straightforward and makes the code
> > better, see patch #3 and #5.
>=20
> While continuing to touch automation/ may be okay, I really think
> time has
> passed for further Misra changes in 4.19, unless they're fixing
> actual bugs
> of course. Just my personal view though ...
I am not quite sure I understand the concern. From my perspective, the
patch series addresses several MISRA violations without introducing any
functional changes. It seems safe to incorporate these MISRA changes
even at this stage of the release.

~ Oleksii
>=20
> Jan
>=20
> > On Mon, 17 Jun 2024, Nicola Vetrini wrote:
> > > Hi all,
> > >=20
> > > this series addresses several violations of Rule 20.7, as well as
> > > a
> > > small fix to the ECLAIR integration scripts that do not influence
> > > the current behaviour, but were mistakenly part of the upstream
> > > configuration.
> > >=20
> > > Note that by applying this series the rule has a few leftover
> > > violations.
> > > Most of those are in x86 code in xen/arch/x86/include/asm/msi.h .
> > > I did send a patch [1] to deal with those, limited only to
> > > addressing the MISRA
> > > violations, but in the end it was dropped in favour of a more
> > > general cleanup of
> > > the file upon agreement, so this is why those changes are not
> > > included here.
> > >=20
> > > [1]
> > > https://lore.kernel.org/xen-devel/2f2c865f20d0296e623f1d65bed25c083f5=
dd497.1711700095.git.nicola.vetrini@bugseng.com/
> > >=20
> > > Changes in v2:
> > > - refactor patch 4 to deviate the pattern, instead of fixing the
> > > violations
> > > - The series has been resent because I forgot to properly Cc the
> > > mailing list
> > >=20
> > > Nicola Vetrini (6):
> > > =C2=A0 automation/eclair: address violations of MISRA C Rule 20.7
> > > =C2=A0 xen/self-tests: address violations of MISRA rule 20.7
> > > =C2=A0 xen/guest_access: address violations of MISRA rule 20.7
> > > =C2=A0 automation/eclair_analysis: address violations of MISRA C Rule
> > > 20.7
> > > =C2=A0 x86/irq: address violations of MISRA C Rule 20.7
> > > =C2=A0 automation/eclair_analysis: clean ECLAIR configuration scripts
> > >=20
> > > =C2=A0automation/eclair_analysis/ECLAIR/analyze.sh=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 3 +--
> > > =C2=A0automation/eclair_analysis/ECLAIR/deviations.ecl | 14
> > > ++++++++++++--
> > > =C2=A0docs/misra/deviations.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> > > =C2=A0xen/include/xen/guest_access.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 4 ++--
> > > =C2=A0xen/include/xen/irq.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > =C2=A0xen/include/xen/self-tests.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 8 ++++----
> > > =C2=A06 files changed, 22 insertions(+), 12 deletions(-)
> > >=20
> > > --=20
> > > 2.34.1
> > >=20
>=20



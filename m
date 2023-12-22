Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F404481CA80
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 14:08:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659344.1028902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGfGR-0006xT-7q; Fri, 22 Dec 2023 13:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659344.1028902; Fri, 22 Dec 2023 13:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGfGR-0006ud-5J; Fri, 22 Dec 2023 13:08:31 +0000
Received: by outflank-mailman (input) for mailman id 659344;
 Fri, 22 Dec 2023 13:08:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGfGP-0006tG-DF
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 13:08:29 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32aec430-a0cb-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 14:08:28 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2cca502e642so14700691fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 05:08:28 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a2eb052000000b002cc6c35aa5bsm591095ljl.128.2023.12.22.05.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 05:08:27 -0800 (PST)
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
X-Inumbo-ID: 32aec430-a0cb-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703250508; x=1703855308; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BpfZoUJsLcdNVgi5hoqXo8LU3P8PtMz6VDcGAieGAIk=;
        b=XNB5dqIsXgb3OyOYQ9tps22K20RH9qVwTXnSjLE8UGMgpXr/FNerzpgZtpmkPF9LtX
         VY8qz1zBiNB0ow07mF0niDcZdRuE1c3ysYFWNzcHtQf4Ri2USPsBPHCh22KS4eaFaV4M
         rXkicessaNw6tEhPIMnsw0MwRTKZwmLBG/2Zui7L+qBXqtcMaHTj/M6QiJZ9GC7+6Avn
         26Z018mi4AMYo2ckOuucSKDlAXuIdNSC8TrbzU2V2B3FgkBMf0d4IFWkTd2d70xOUOE3
         X+PszIDX2QQ3fMvVpJh/nSG2BF/uQlq5jW6ZD15a1KEonTa74IqUQq91b6ESJ4+gZ/Qi
         nwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703250508; x=1703855308;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BpfZoUJsLcdNVgi5hoqXo8LU3P8PtMz6VDcGAieGAIk=;
        b=d2XuxBRRJaBg8i39JqWfICOkLG6vDHNDEPTTB9KIfJnibHFkhDpp6B2PbhGdKp9S8z
         k4hjKQ/Ro4GGJg8RJhuNJwnyniV9YTA1h28ZSypJXGvHGWJHbzuIv6daEVTqpmjWRHB2
         4Vbph3fPPjUgxzWzxUuZvRsrVgNllVNtjaqtPHF3Qhk7apgE1Fj5zT12xulY7pG0Sby3
         JBG8ZYXnSzPobAdGxJnUQnpGXsZkV2W5cyLa4md75j/iFOWA7a2fgsvvGzjqFkoo8izC
         vUpQfq/TlRIcSV4MeTpvRHnykAQP/3KsAVVbTvfIK3FbdtHJ0P7o77/BT2ZdwgU/arD4
         iUaA==
X-Gm-Message-State: AOJu0YwAhz5eMAjfgZztPDVNDcnuT5NtsBVXdu5QwWu5/0DKvbHEObwj
	NDUWr+5kV6at3H/7RnxDPDg=
X-Google-Smtp-Source: AGHT+IGyUkF4yfpfvl4cURCvPQrkBhQQbCApQMsqPT+bTF/6NuO57Zcu8pwooOuIg0q3EU00J3pLgg==
X-Received: by 2002:a2e:7303:0:b0:2cc:9e0e:5a22 with SMTP id o3-20020a2e7303000000b002cc9e0e5a22mr320875ljc.70.1703250507996;
        Fri, 22 Dec 2023 05:08:27 -0800 (PST)
Message-ID: <ec31b9d929e98cf236d6af91e6633ba8228a61a9.camel@gmail.com>
Subject: Re: [PATCH v6 7/9] xen: ifdef inclusion of <asm/grant_table.h> in
 <xen/grant_table.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,  Shawn Anastasio
 <sanastasio@raptorengineering.com>
Date: Fri, 22 Dec 2023 15:08:26 +0200
In-Reply-To: <3c5cb645-66c3-4abe-985f-19b787887ff3@xen.org>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
	 <e49bae656ed6c0fe689703f78df4e815b955f5b2.1703072575.git.oleksii.kurochko@gmail.com>
	 <cc26db95-c141-4392-a948-52ea3cb917c8@xen.org>
	 <3c5cb645-66c3-4abe-985f-19b787887ff3@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

Hi Julien,

On Thu, 2023-12-21 at 19:20 +0000, Julien Grall wrote:
>=20
>=20
> On 21/12/2023 19:19, Julien Grall wrote:
> > Hi Oleksii,
> >=20
> > On 20/12/2023 14:08, Oleksii Kurochko wrote:
> > > Ifdef-ing inclusion of <asm/grant_table.h> allows to avoid
> > > generation of empty <asm/grant_table.h> for cases when
> > > CONFIG_GRANT_TABLE is not enabled.
> >=20
> > It would have been nice to explain the reason of this change. Is
> > this a=20
> > compilation error or just a nice thing to have?
> >=20
> > The reason I am asking is...
> >=20
> > >=20
> > > The following changes were done for Arm:
> > > <asm/grant_table.h> should be included directly because it
> > > contains
> > > gnttab_dom0_frames() macros which is unique for Arm and is used
> > > in
> > > arch/arm/domain_build.c.
> > > <asm/grant_table.h> is #ifdef-ed with CONFIG_GRANT_TABLE in
> > > <xen/grant_table.h> so in case of !CONFIG_GRANT_TABLE
> > > gnttab_dom0_frames
> > > won't be available for use in arch/arm/domain_build.c.
> >=20
> > ... I find rather ugly that we require domain_build.c to include
> > both=20
> > asm/grant_table.h and xen/grant_table.h.
> >=20
> > Right now, I don't have a better approach, so I would be ok so long
> > the=20
> > rationale of the change is explained in the commit message.
>=20
> Urgh, I just realized that this is explained in the commit message.=20
> Please ignore my comment about expanding the commit message. Sorry
> for=20
> the noise.
It's OK.
Thanks for review!

~ Oleksii


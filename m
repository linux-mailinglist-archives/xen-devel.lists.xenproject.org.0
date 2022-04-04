Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0EB4F15D6
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 15:26:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298344.508210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbMiZ-0006fF-Lq; Mon, 04 Apr 2022 13:26:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298344.508210; Mon, 04 Apr 2022 13:26:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbMiZ-0006cb-Hk; Mon, 04 Apr 2022 13:26:03 +0000
Received: by outflank-mailman (input) for mailman id 298344;
 Mon, 04 Apr 2022 13:26:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oEUQ=UO=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nbMiX-0006cV-HK
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 13:26:01 +0000
Received: from MTA-06-4.privateemail.com (mta-06-4.privateemail.com
 [198.54.122.146]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c39c0cd0-b41a-11ec-a405-831a346695d4;
 Mon, 04 Apr 2022 15:26:00 +0200 (CEST)
Received: from mta-06.privateemail.com (localhost [127.0.0.1])
 by mta-06.privateemail.com (Postfix) with ESMTP id E7C1F18000A7
 for <xen-devel@lists.xenproject.org>; Mon,  4 Apr 2022 09:25:57 -0400 (EDT)
Received: from mail-oi1-f179.google.com (unknown [10.20.151.144])
 by mta-06.privateemail.com (Postfix) with ESMTPA id C316718000A4
 for <xen-devel@lists.xenproject.org>; Mon,  4 Apr 2022 09:25:57 -0400 (EDT)
Received: by mail-oi1-f179.google.com with SMTP id j83so10055449oih.6
 for <xen-devel@lists.xenproject.org>; Mon, 04 Apr 2022 06:25:57 -0700 (PDT)
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
X-Inumbo-ID: c39c0cd0-b41a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1649078758;
	bh=7vUzavakaGaO6E0zlDOAogK+8n1PQfQHDvi1VXpo9lA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SMWiQ0tZSxzXtsOGHwFr4Vg++40rQH+orMfP0ei8GlAnzXEycK4thigyst03DPm0X
	 qSU3eI/sjVC8yCbY+dCGMesP86ALk6a7nzhKt7hZxtF6eN6QnN/+ktUDS7WpZEB060
	 nePUunLGUDKjidKtgBgXUQg+QvpBsMtylThkiHvvAcUR+YnaKu0+Hpi5lG4yxOknHH
	 Ejl4Zd3CBlSiN9JhmNqa3rC6ljBWKYLFxKubsfZ9zMoiM51Q+X8cYMxfV6FK4qMI1I
	 J0EYkVM9nucbcRTvIZqAk83Cxs/t3BfTOFHVbM4l9h08Bueb2NKKKkAK0uo5jkdsUN
	 nd3NGhuG8IohA==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1649078757;
	bh=7vUzavakaGaO6E0zlDOAogK+8n1PQfQHDvi1VXpo9lA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YGgMWaar1wOT3v8cxJy+XO4+c7kaGgRHsCF5KAF+F5vKQOg7V0gfrHQdt22JlNMVD
	 qMjMr2T7Od3FjweEv8FYVZ6dn3zOf3AGLCBYjTbg5Dw+idaVJ18wMdMjD6L1Kbk+nh
	 c7fgp8c84y2s35zjUd1miZ6zWERzJtTEO/QwKHm74Z5XkJ3GOxASDoiig4SFjx8sZ/
	 5qGu5M2KKtwMT0JE7DPq55R+kVNCpQtKJgXzqNLNhVEANdBxn4gLsk2aQUDtRo/aOj
	 Md3NWoB44lOD8AlBSUyEtols6e43BKmRvFgTvR74MbZfBwjofqyG/Hp5PmcOTzyGFZ
	 tsQMK9DzI7RYQ==
X-Gm-Message-State: AOAM531lz0txodGU4sJ4vPlelCTPBxptuTXGTnZ1OnFE0pAVwOEB5c8F
	XxQIwlhk1xKxImxO68Sz8XVPh6Oc4jNSgcl8nf4=
X-Google-Smtp-Source: ABdhPJwt6Sihf1ZRBCb4vZTtGgqM7CG+L4hpxcjIUU1JHhhIpKBBQpz/jN9aEppAtFx27EwyGDOhfQGxN4SYY6A3svo=
X-Received: by 2002:a05:6808:128e:b0:2da:6d08:8704 with SMTP id
 a14-20020a056808128e00b002da6d088704mr9938987oiw.9.1649078757370; Mon, 04 Apr
 2022 06:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <e57797cbc2c0706c03363cc7fa1b3e234921fee5.1648214955.git.tamas.lengyel@intel.com>
In-Reply-To: <e57797cbc2c0706c03363cc7fa1b3e234921fee5.1648214955.git.tamas.lengyel@intel.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 4 Apr 2022 09:25:21 -0400
X-Gmail-Original-Message-ID: <CABfawhmZAZ5Y29Gbd2KgKj9Xp8bECX4zo7_eh6HqYCynag+QmA@mail.gmail.com>
Message-ID: <CABfawhmZAZ5Y29Gbd2KgKj9Xp8bECX4zo7_eh6HqYCynag+QmA@mail.gmail.com>
Subject: Re: [PATCH v5] x86/vmx: add hvm functions to get/set non-register state
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: xen-devel@lists.xenproject.org, Jun Nakajima <jun.nakajima@intel.com>, 
	Kevin Tian <kevin.tian@intel.com>, Jan Beulich <JBeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Fri, Mar 25, 2022 at 9:34 AM Tamas K Lengyel <tamas.lengyel@intel.com> wrote:
>
> During VM forking and resetting a failed vmentry has been observed due
> to the guest non-register state going out-of-sync with the guest register
> state. For example, a VM fork reset right after a STI instruction can trigger
> the failed entry. This is due to the guest non-register state not being saved
> from the parent VM, thus the reset operation only copies the register state.
>
> Fix this by adding a new pair of hvm functions to get/set the guest
> non-register state so that the overall vCPU state remains in sync.
>
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> ---
> v5: Switch to internal-only hvm funcs instead of adding to hvm_hw_cpu

Patch ping.


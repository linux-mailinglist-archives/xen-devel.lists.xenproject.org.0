Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8215640BBC
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 18:06:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452172.709989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p19Un-0000UC-Da; Fri, 02 Dec 2022 17:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452172.709989; Fri, 02 Dec 2022 17:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p19Un-0000SC-AU; Fri, 02 Dec 2022 17:06:41 +0000
Received: by outflank-mailman (input) for mailman id 452172;
 Fri, 02 Dec 2022 17:06:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gvms=4A=gmail.com=rjwysocki@srs-se1.protection.inumbo.net>)
 id 1p19Um-0000S6-Cc
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 17:06:40 +0000
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af4a6673-7263-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 18:06:39 +0100 (CET)
Received: by mail-qt1-f175.google.com with SMTP id h24so5985555qta.9
 for <xen-devel@lists.xenproject.org>; Fri, 02 Dec 2022 09:06:39 -0800 (PST)
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
X-Inumbo-ID: af4a6673-7263-11ed-91b6-6bf2151ebd3b
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xh9kgJLINYmxV8g3qTi7szoV+9siNmymyIdCpJv+cBQ=;
        b=l0WKND0dKK3uRz01u5rfqemeAYMCUUT4kSpDi96Vrvxm8A7ln2ma+RY8Ff1BI6QAk1
         KVvtV2dOpl1rFTbLjsw4AMAlqAJxePeIYZ5oVv8s8bXCKppsWRn+XJ2i1jc93ZbSR1JJ
         Xu4cy1330Whj04o5Xrlj8WRE4vE5gY9vPLZBscUGMFBcmCGHak76h4X3IXQ/mvE0Snwp
         aZ+AC6Bo+9vQbAHJT1Tg8emquu/xseY8zjGQQdIddev9ZDrYs6uTp71qjQD+kt+T7l7M
         HavZ9Yqxh2QrU8SGmQ9yCx7+Ax3HgfWVjQb1Tmta3d2Qjgkr7OPreUEGutPc4n8PBLB/
         1Q8g==
X-Gm-Message-State: ANoB5pnU6Q0WR9mJ13Bn7jO7jRSc1PiBxDhtqhfGnGPHcDhB3t8L96jw
	O0HK5F+bQNUHEGJuob+H4SeznPVFP+iTmaciXzY=
X-Google-Smtp-Source: AA0mqf7fLL+ryfJc9gdlygwZFMKAW1X4WWvlOUNEoVLLyu7iJ7lEwsoaHA2t1RhbtGz9hRYHOwN5y8/jp/Ex9zi8Yls=
X-Received: by 2002:ac8:4818:0:b0:3a6:a0d7:e1f7 with SMTP id
 g24-20020ac84818000000b003a6a0d7e1f7mr1208911qtq.153.1670000798144; Fri, 02
 Dec 2022 09:06:38 -0800 (PST)
MIME-Version: 1.0
References: <20221121102113.41893-1-roger.pau@citrix.com> <20221121102113.41893-2-roger.pau@citrix.com>
 <6b212148-4e3f-3ef6-7922-901175746d44@intel.com> <Y4d8cm97hn5zuRQ1@Air-de-Roger>
 <4a0e9f91-8d8b-84bc-c9db-7265f5b65b63@intel.com> <Y4nugxKV1J/BqhBt@Air-de-Roger>
 <93fd7ed0-5311-d6db-4d8b-b992a8f78ada@intel.com> <Y4opuLnLIT3v9Aa7@Air-de-Roger>
In-Reply-To: <Y4opuLnLIT3v9Aa7@Air-de-Roger>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 2 Dec 2022 18:06:26 +0100
Message-ID: <CAJZ5v0hrdwUNOELXM5zxtTeavp+_o7TbkCRBjZVqvQVxt4QBnA@mail.gmail.com>
Subject: Re: [PATCH 1/3] acpi/processor: fix evaluating _PDC method when
 running as Xen dom0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Dave Hansen <dave.hansen@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, jgross@suse.com, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Len Brown <lenb@kernel.org>, Alex Chiang <achiang@hp.com>, 
	Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 2, 2022 at 5:37 PM Roger Pau Monn=C3=A9 <roger.pau@citrix.com> =
wrote:
>
> On Fri, Dec 02, 2022 at 08:17:56AM -0800, Dave Hansen wrote:
> > On 12/2/22 04:24, Roger Pau Monn=C3=A9 wrote:
> > > On the implementation side, is the proposed approach acceptable?
> > > Mostly asking because it adds Xen conditionals to otherwise generic
> > > ACPI code.
> >
> > That's a good Rafael question.

Sorry for joining late, but first off _PDC has been deprecated since
ACPI 3.0 (2004) and it is not even present in ACPI 6.5 any more.

It follows from your description that _PDC is still used in the field,
though, after 18 years of deprecation.  Who uses it, if I may know?

> > But, how do other places in the ACPI code handle things like this?
>
> Hm, I don't know of other places in the Xen case, the only resource
> in ACPI AML tables managed by Xen are Processor objects/devices AFAIK.
> The rest of devices are fully managed by the dom0 guest.
>
> I think such special handling is very specific to Xen, but maybe I'm
> wrong and there are similar existing cases in ACPI code already.
>
> We could add some kind of hook (iow: a function pointer in some struct
> that could be filled on a implementation basis?) but I didn't want
> overengineering this if adding a conditional was deemed OK.

What _PDC capabilities specifically do you need to pass to the
firmware for things to work correctly?

What platforms are affected?


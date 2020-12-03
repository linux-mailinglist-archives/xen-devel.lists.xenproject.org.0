Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CBC2CDB3D
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 17:31:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43843.78730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkrVY-0001xh-Br; Thu, 03 Dec 2020 16:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43843.78730; Thu, 03 Dec 2020 16:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkrVY-0001xI-8G; Thu, 03 Dec 2020 16:31:04 +0000
Received: by outflank-mailman (input) for mailman id 43843;
 Thu, 03 Dec 2020 16:31:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mrnM=FH=gmail.com=andy.shevchenko@srs-us1.protection.inumbo.net>)
 id 1kkrVW-0001xD-BV
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 16:31:02 +0000
Received: from mail-pj1-x102f.google.com (unknown [2607:f8b0:4864:20::102f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 573f792d-73c7-473b-940a-86ec540a72e4;
 Thu, 03 Dec 2020 16:31:01 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id f14so1377289pju.4
 for <xen-devel@lists.xenproject.org>; Thu, 03 Dec 2020 08:31:01 -0800 (PST)
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
X-Inumbo-ID: 573f792d-73c7-473b-940a-86ec540a72e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UUlsCpyemxPUGQpIBc3drhb3sc/Fkh4PtlzYbjVQNa8=;
        b=HZ6E/ni9UlGIxxR2BMbpyFFrvxiyLLK/RkdhroUMEVqnOWKmVXyd9TZmPMSfFUiNe2
         BCXQhAC+V52TJMomN/Y3bN74/vuS4dIRpmRLM5l0NrZmyhQFlUL6tpnRHXqGCeh5Htwu
         FSPGqArFMdbtiIMrB/2MxotpFJWUIfEFnsm6rtlkL2RisaEVCIMrwl6eeV8ex4CmavCb
         E1UbVC3eRxmq/0VcQHcrxfMnvmO8mitkiqwbiSmNwcT7BYmgzBWFyyA4AzvULuotN+XY
         W2JdAPYMGXHpnY6QS+75KG+QsnepLi8V6AUYw2qCGQ0lfVrI2G/MfrlyFcPfOWC1b6XY
         ceLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UUlsCpyemxPUGQpIBc3drhb3sc/Fkh4PtlzYbjVQNa8=;
        b=Lk0bBiSpxjnbW7vM/+Wp2bqH8xJ2+O2XN7q/BowBwOeooD57DQXRjcqb538UxI6Y4E
         B+Emnevc8j4xDN262vGAv9urZw+XK/Pd5h0qohh9A+xoO645kPejERakXG6TG61Ws/B2
         /3suHnKtITkAgy8TwyIc2qe+wGgK3/Ek7EgLc6vBffwDZTRgaCohLR999Lt6KXfvTFBp
         XL54PR8jKkQ63L0+z+8aqzvtQbSKLV70uvKbLZDJOU4gxsf+MIFtwNjoKBXemqOWvXeW
         lz41Fie26UL0xO6Q/Q4GujfztEgxSAwWzZF2HNE8Xdl5TlLWlsqZdixUYJNC82ZBuXPh
         ayhQ==
X-Gm-Message-State: AOAM530BpzdvRkotynu4ufI6nt85YRiN9N9Ta1BL5CjzO9loHk+k1Rzk
	4/rcSw+z3+kH81SGkFCHkROW4kiKmTWdQaJjgS0=
X-Google-Smtp-Source: ABdhPJyGpaBbPYigJz61z6dE/n5rsekW4wIydbSaYp/wf1bKc73V+I0B8uhEJRMvQA5TE3/pm31rBwrkVMh+3O6XPns=
X-Received: by 2002:a17:90a:34cb:: with SMTP id m11mr3783185pjf.181.1607013060896;
 Thu, 03 Dec 2020 08:31:00 -0800 (PST)
MIME-Version: 1.0
References: <20201113235242.k6fzlwmwm2xqhqsi@tomti.i.net-space.pl>
In-Reply-To: <20201113235242.k6fzlwmwm2xqhqsi@tomti.i.net-space.pl>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 3 Dec 2020 18:31:49 +0200
Message-ID: <CAHp75Ve4jSBXfeyMQHn1=T21Dkf4q4DF7DWPTc2U_QO79Pn_TQ@mail.gmail.com>
Subject: Re: [SPECIFICATION RFC] The firmware and bootloader log specification
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: coreboot@coreboot.org, grub-devel@gnu.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, systemd-devel@lists.freedesktop.org, 
	trenchboot-devel@googlegroups.com, U-Boot Mailing List <u-boot@lists.denx.de>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, xen-devel@lists.xenproject.org, alecb@umass.edu, 
	alexander.burmashev@oracle.com, allen.cryptic@gmail.com, 
	andrew.cooper3@citrix.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>, btrotter@gmail.com, 
	dpsmith@apertussolutions.com, eric.devolder@oracle.com, 
	eric.snowberg@oracle.com, "H. Peter Anvin" <hpa@zytor.com>, hun@n-dimensional.de, 
	Javier Martinez Canillas <javierm@redhat.com>, joao.m.martins@oracle.com, kanth.ghatraju@oracle.com, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, krystian.hebel@3mdeb.com, 
	Leif Lindholm <leif@nuviainc.com>, lukasz.hawrylko@intel.com, 
	Andy Lutomirski <luto@amacapital.net>, michal.zygowski@3mdeb.com, 
	Matthew Garrett <mjg59@google.com>, mtottenh@akamai.com, phcoder@gmail.com, 
	piotr.krol@3mdeb.com, Peter Jones <pjones@redhat.com>, 
	Paul Menzel <pmenzel@molgen.mpg.de>, roger.pau@citrix.com, ross.philipson@oracle.com, 
	tyhicks@linux.microsoft.com
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 14, 2020 at 2:01 AM Daniel Kiper <daniel.kiper@oracle.com> wrote:

...

> The log specification should be as much as possible platform agnostic
> and self contained. The final version of this spec should be merged into
> existing specifications, e.g. UEFI, ACPI, Multiboot2, or be a standalone
> spec, e.g. as a part of OASIS Standards. The former seems better but is
> not perfect too...

With all respect... https://xkcd.com/927/


-- 
With Best Regards,
Andy Shevchenko


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A787D3607
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 14:02:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621421.967880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qutdt-0003zO-6h; Mon, 23 Oct 2023 12:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621421.967880; Mon, 23 Oct 2023 12:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qutdt-0003wm-3K; Mon, 23 Oct 2023 12:02:45 +0000
Received: by outflank-mailman (input) for mailman id 621421;
 Mon, 23 Oct 2023 12:02:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cIbe=GF=gmail.com=andy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1qutdr-0003rw-Ge
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 12:02:43 +0000
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [2001:4860:4864:20::2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 112186fc-719c-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 14:02:41 +0200 (CEST)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1e19cb7829bso2441127fac.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 05:02:41 -0700 (PDT)
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
X-Inumbo-ID: 112186fc-719c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698062560; x=1698667360; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiFbfs7BErHq09w7bwsMK4yHlj0qVMvyV1tXDfbJ0tE=;
        b=AwJG8vlX3VgVU/Me5T1s8j9UkxiY2vJqce4/TGNpspg0hVeEFysftpRURLOS7kpA2P
         O9TL5uIa0xwbZAR7eGmKDQWZUdRbD7TdTiZDHlr+c3aVogugKRAKm8xVbyvs1GpaEBKW
         BC2YnHmoYKO3C4lvo/roLdjGVLUCGyVNHBbmncrYx7+ytkkFFjgt0z9G7KlvYSXyb7IF
         EKX+rgDuMYkSczpQolKRUWQLAl0fuvzKeRrgivr262yanFr2zmdw0GFO/lUbf+D1QYc+
         J1ZDjNUyBoSuIXalrFiLVsncnNjbunFcISjzvF/gJm8s3gq/K90anFu0H6+P03+Mm1gj
         vmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698062560; x=1698667360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BiFbfs7BErHq09w7bwsMK4yHlj0qVMvyV1tXDfbJ0tE=;
        b=fiJbuWCpfhY8XANRv47IaRYsv7uFdtIApmpoy9Y2CBzQYoi2qq0LbejrrXWVkOyz15
         Rzp2kUtXI2QAbqwoZahgl/CG2sRCO7T0wnWOkmpQWpJ4qWT+XXp5IBCgsLfUJzARVssQ
         /GszDHg96RjdO6m1vi38hRURNmysIpoKIPydhznQNDJwBjmUd3RrN39eqNyeoK0gsw72
         XaXAvkK3mx/zHPrBMIMiRF5XsG/tt/n8dn0WSpmDPge6kCzBe3r1B+8GpCmqKfNO9yLc
         JPF4pIUO5ODviqVwx97WtfnvNHLtjExSFtMGAitf2MEK/Y/ZN/aS4+uZJYVrS2lpIqfH
         kqAg==
X-Gm-Message-State: AOJu0YyrXxOc4Y2SjnWNY9tg0fm7/MDtFt5G2fRylRH1t50VrQTZLm2G
	O+gEE3TO3xhziEzwrasE8puJ2y3hs+frBaGhMGo=
X-Google-Smtp-Source: AGHT+IFDOjlPFNxZH+TNCPyOYk/jnYswfxhuW97975JVJB/tFTnE1b6fAO88ZlsiSm8o9UQpuYj3Gyb4/cbuXv7G1A8=
X-Received: by 2002:a05:6870:3e09:b0:1e9:beae:947d with SMTP id
 lk9-20020a0568703e0900b001e9beae947dmr12410358oab.19.1698062558907; Mon, 23
 Oct 2023 05:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1698051454.git.houwenlong.hwl@antgroup.com> <90df6cf5674241a85ac7dfe0a1558f1fd025cc17.1698051454.git.houwenlong.hwl@antgroup.com>
In-Reply-To: <90df6cf5674241a85ac7dfe0a1558f1fd025cc17.1698051454.git.houwenlong.hwl@antgroup.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 23 Oct 2023 15:02:02 +0300
Message-ID: <CAHp75VeXiOprRDNakewo2iSe==EeLUxfxuPYS3R+ZsY2KDmQBQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/xen/pvh: Set up percpu for stack canary in 32-bit
 kernel entry
To: Hou Wenlong <houwenlong.hwl@antgroup.com>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Darren Hart <dvhart@infradead.org>, 
	Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	"moderated list:XEN HYPERVISOR X86" <xen-devel@lists.xenproject.org>, 
	"open list:X86 PLATFORM DRIVERS - ARCH" <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 12:10=E2=80=AFPM Hou Wenlong
<houwenlong.hwl@antgroup.com> wrote:
>
> In a 32-bit SMP kernel, the stack canary is a percpu variable accessed
> as %fs:__stack_chk_guard. However, the ABI for PVH entry does not
> specify the %fs register state. It currently works because the initial
> %fs register is 0x10 for QEMU, which is the same as $PVH_DS_SEL.

> %However, for added safety, the percpu should be set up explicitly
> %before calling xen_prepare_pvh(), which accesses the stack canary.

Stray leading % in two lines above.

--=20
With Best Regards,
Andy Shevchenko


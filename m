Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2626CAB34DD
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 12:26:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981157.1367550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQMP-0002lp-3s; Mon, 12 May 2025 10:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981157.1367550; Mon, 12 May 2025 10:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQMP-0002kL-12; Mon, 12 May 2025 10:26:13 +0000
Received: by outflank-mailman (input) for mailman id 981157;
 Mon, 12 May 2025 10:26:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zSlO=X4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uEQMN-0002Fh-M6
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 10:26:11 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8642c65a-2f1b-11f0-9eb5-5ba50f476ded;
 Mon, 12 May 2025 12:26:11 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5fd32c133ccso1581111a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 03:26:11 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5fc9d70d8casm5471243a12.66.2025.05.12.03.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 03:26:10 -0700 (PDT)
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
X-Inumbo-ID: 8642c65a-2f1b-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747045571; x=1747650371; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6ywf0azExOO5Doi1XVTmAOt0kUjtWQbeNjCZ7lEvoB4=;
        b=Y1WT02Mf4VE1v08HCQ5fPJoP2U2vmxtor8iSfmRAcI81ut4HZH662y2g4nUrO1YBFu
         g9afhAZbkFrIAqAE8WzXn/AXC9DnQ3yEbgUSllC2xgATMmZ0zp+diBPHLEvTBRvRIZjV
         o9pzuQjG3OPbWl8EFj7WpN61T0sAZb0IcNrWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747045571; x=1747650371;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ywf0azExOO5Doi1XVTmAOt0kUjtWQbeNjCZ7lEvoB4=;
        b=A8dKGymdSZ9LqxzdgvfvBqkSPTbjwGgE7Przd3P7z87UhfSnsTO+coDDHCewV6ADAM
         bHFbNdXxFeZe939Ca3epu6npAoNLkY+1mO6r+PpVWZwGBkqAJ2uxuITUeCuYb85T+23m
         e+0Vph1YpzFiAq+rw9rpkwUkT4z5nvgb2rbEoKtOefzFj4XwWXlyFhI4dik4dD/eRAl/
         Zyhh5hJfu877KrNg0xuXr9LALLpyBDMDOkONI+G5hJh6AUo4qM7tIZkJnQie+DQTuO5K
         Fx4e9T8FRdri6f+FNvvYNExk1gzZl8U04NFWS94BOA5U42SueLc5e1Dj6BpTd0lc5GEb
         Ps6Q==
X-Gm-Message-State: AOJu0Yzyl6rwkAYclV5pNxanmKuy/wzofq1nxIWs02liiCMtp9tqKw12
	Gw88NIrOcOiMhjZXvJeLHecqTo/LPHYf8Lkb92ZuzDbp48qNh8V2c6UKL5rDnRVkYonDHlq7FYW
	q
X-Gm-Gg: ASbGncsZ8X8AJd/BQ5WAJzDRai3aoB+4lii4KmD3dWlaIJqSzmMi9zJ9hw9GlscG6Zr
	1x2097SzQhY0j0dXYXMDMsYOGX+OftLNwFgntOJzT11xoL2y3T09Y59f3pFX9RYPBZY1lWY+8+g
	F8nChmjEOZpgeeZXON4TbM5fSfDrs1FByENDsp/7+uupAlIG2gh8y9H2UyFEeTDsC2lhaDnAmco
	qbrNxxe1xJB6G79+p8bS31NDhieF9QlFcnsjirQ8Dwm5/5xAeWw5m3SGgnyv4TQeTn78Z6HNrvz
	XE6+wmK32asqxKu5NLyPWBKbLXX7IgKh6zsRTQVZMxRCMtRQDZGN/hMZ
X-Google-Smtp-Source: AGHT+IHIeO5g2riRZCFJSa2cKXYQWd14SmsECC1BeBlZHq5s/G8KOqrcq9wdV95c3naQG/llcUX0EA==
X-Received: by 2002:a05:6402:370d:b0:5fc:d2d2:193d with SMTP id 4fb4d7f45d1cf-5fcd2d252e6mr6668958a12.15.1747045570460;
        Mon, 12 May 2025 03:26:10 -0700 (PDT)
Date: Mon, 12 May 2025 12:26:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Issues on Zen4 (hw12) runner
Message-ID: <aCHMwWd7cq-ZIMOl@macbook.lan>
References: <aB0XtEor2rCxBKWR@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aB0XtEor2rCxBKWR@mail-itl>

On Thu, May 08, 2025 at 10:44:36PM +0200, Marek Marczykowski-Górecki wrote:
> Hi,
> 
> I wanted to post another revision of the series adding hw12 runner,
> hoping that all known issues are fixed now, but unfortunately there is
> still something broken. I've rebased my series on top of staging
> (ed9488a0d) and got this pipeline:
> 
> https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1807819142
> (note due to some added debugging, some tests are incorrectly marked as
> success even if they failed...)
> 
> 1. USB ethernet doesn't work on PVH dom0: https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9978694739
> There supposed to be an USB ethernet device connected to the USB
> controller at c3:00.4. In the PV dom0 case it's detected as:
> 
>     [    3.911555] usb 7-1.4: new high-speed USB device number 3 using xhci_hcd
>     [    4.004201] usb 7-1.4: New USB device found, idVendor=0bda, idProduct=8153, bcdDevice=30.00
>     [    4.004675] usb 7-1.4: New USB device strings: Mfr=1, Product=2, SerialNumber=6
>     [    4.005079] usb 7-1.4: Product: USB 10/100/1000 LAN
>     [    4.005349] usb 7-1.4: Manufacturer: Realtek
>     [    4.005599] usb 7-1.4: SerialNumber: 684D35
> 
> But it's not there on PVH. The USB controller itself is detected, just
> not device(s) connected to it. This applies to other controllers too
> (there should be about 3 or 4 other USB devices - none of them show up).
> 
> 2. There is a bunch of "unhandled memory read" errors during PVH dom0
> startup: https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9978694739
> 
>     (XEN) [    4.026323] arch/x86/hvm/emulate.c:417:d0v0 unhandled memory read from 0xfedc0020 size 1
>     (XEN) [    4.026789] arch/x86/hvm/emulate.c:417:d0v0 unhandled memory read from 0xfedc0021 size 1
>     (XEN) [    4.027247] arch/x86/hvm/emulate.c:417:d0v0 unhandled memory read from 0xfedc0020 size 1
>     (XEN) [    4.027671] arch/x86/hvm/emulate.c:417:d0v0 unhandled memory read from 0xfedc0021 size 1
>     ...
> 
> This repeats several times. Could be related to the USB issue above?

Can you try with dom0=pf-fixup?  Those unhandled accesses might be the
cause of the USB issues.

> There is also, likely related:
> 
>     (XEN) [    5.002036] arch/x86/hvm/vmsi.c:845:d0v9 0000:c1:00.1: PIRQ 2484: unsupported address 0
>     (XEN) [    5.002365] arch/x86/hvm/vmsi.c:845:d0v9 0000:c1:00.1: PIRQ 2484: unsupported address 0
>     (XEN) [    5.002693] arch/x86/hvm/vmsi.c:845:d0v9 0000:c1:00.1: PIRQ 2484: unsupported address 0

Is this at shutdown? (doesn't look like by the timestamps).  There are
cases where Linux zeroes the MSR entries while the capability is still
enabled, and that results in those messages.  They are usually benign.

> 
> 3. Sometimes it fails to print anything on the console, like here: https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9977761447
> This is likely some boot issue before Xen starts (possibly the power button
> is pressed to early). Anyway, I need to fix it before adding the runner.

That needs further debug, I'm afraid I can't provide much suggestions.

Thanks, Roger.


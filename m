Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F221689E106
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 19:04:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702569.1097692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruEtA-0002rw-EW; Tue, 09 Apr 2024 17:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702569.1097692; Tue, 09 Apr 2024 17:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruEtA-0002pe-9v; Tue, 09 Apr 2024 17:04:04 +0000
Received: by outflank-mailman (input) for mailman id 702569;
 Tue, 09 Apr 2024 17:04:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mUTu=LO=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ruEt8-0002nf-Eh
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 17:04:02 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29079bfd-f693-11ee-94a3-07e782e9044d;
 Tue, 09 Apr 2024 19:04:00 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-516cbf3fe68so7216459e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2024 10:04:00 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 m1-20020a05600c4f4100b0041665d968f1sm9141653wmq.47.2024.04.09.10.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 10:03:59 -0700 (PDT)
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
X-Inumbo-ID: 29079bfd-f693-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712682240; x=1713287040; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=egatvpYLsqeiB+vTmfKHdX0l32AmU3FIzRbxdVFw57U=;
        b=jGYyytzV5znfyQa9FWIA6ZQwbjjq6Usmc1rWQklny7PemqOVOW9/sIAKu6SxQJsAzB
         vyUCUYnMKMmCstO673snc/fvQSM1Vmue+t2tIvvPPbM/KYgJynXsqkI15dFcUNHnH3zU
         cMRD7rQ5Vn/jcsWnRPhdwBIyOQnjuXLp3vbt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712682240; x=1713287040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egatvpYLsqeiB+vTmfKHdX0l32AmU3FIzRbxdVFw57U=;
        b=IG+uMuLnQ1u+3Vk2OsuHzl+StgeRkZfgFUnzs0qWa2BfhHswAxYndLm0uf6Ou1NlEo
         UxDGLRwdNRdCeIhHpKKWElXwboM0qdoH91/p4JFsOupRhdkdlJtr6wxCny87r3RDakth
         zgNLxsi37m1tbFQAsjjU/rKYbgkX51WOED0ljNRXhJbQAiiGbNVFXifbQay3a6UEkx9h
         EKOqfTf47VhgFEggSMybIRvwo7nJCxvUX83zCQHbp2LOSQlfLnG1fxF3BYYeEwnEKGPs
         +vN5J+GXa94JNKy2tHipmGuA5b8nGFc2JYzRZUwI7rr4vjunz6Dv6XX4V5+cloB9B7m6
         6j8Q==
X-Gm-Message-State: AOJu0Yy2UHYnpkrGQYfxRhd6ovo2YXsosdwBiRftJryMLMSq3xkRkWeU
	AwRF11Tb4nmTg0nj2jbMvdabL85PDKg0pqhGGetWXi0SckDnME6MCtsmkKtwggM=
X-Google-Smtp-Source: AGHT+IFzJ8i5TZ15zmtmVd+mLmjziOATF1hWoV1BuyCV6azXz1UbLhwnAmiLUKUaSZ4wXgM7jHnaKQ==
X-Received: by 2002:a2e:9ece:0:b0:2d8:5084:f5b9 with SMTP id h14-20020a2e9ece000000b002d85084f5b9mr203105ljk.28.1712682239866;
        Tue, 09 Apr 2024 10:03:59 -0700 (PDT)
Date: Tue, 9 Apr 2024 18:03:58 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: leigh@solinno.co.uk
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	slack@rabbit.lu
Subject: Re: [PATCH v2 6/6] docs/man: Add xenwatchdog manual page
Message-ID: <8e8ed151-696f-47df-a458-4d84dfe043bc@perard>
References: <20240329111056.6118-1-leigh@solinno.co.uk>
 <20240329111056.6118-7-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329111056.6118-7-leigh@solinno.co.uk>

On Fri, Mar 29, 2024 at 11:10:56AM +0000, leigh@solinno.co.uk wrote:
> diff --git a/docs/man/xenwatchdogd.8.pod b/docs/man/xenwatchdogd.8.pod
> new file mode 100644
> index 0000000000..2f6454f183
> --- /dev/null
> +++ b/docs/man/xenwatchdogd.8.pod
> @@ -0,0 +1,54 @@
> +=head1 NAME
> +
> +xenwatchdogd - Xen hypercall based watchdog daemon
> +
> +=head1 SYNOPSIS
> +
> +B<xenwatchdogd> [ I<OPTIONS> ] <I<TIMEOUT>> [ <I<SLEEP>> ]
> +
> +=head1 DESCRIPTION
> +
> +B<xenwatchdogd> arms the Xen watchdog timer to I<TIMEOUT> every I<SLEEP>
> +seconds. If the xenwatchdogd process dies or is delayed for more than
> +I<TIMEOUT> seconds, then Xen will reboot the domain.

Xen will not reboot the domain, it will just kill the domain with
watchdog as explanation. I think the toolstack is in charge of rebooting
the domain. There's a setting for `xl` created VM named
on_watchdog="ACTION", which by default is "destroy". So it's more likely
that the domain will be killed rather than rebooted.

So something like:
    Depending on the configuration for the guest, the domain might be
    destroyed, rebooted, or other. See B<on_watchdog> in xl.cfg(5)

> + If the domain being
> +rebooted is domain 0, the whole system will reboot.

Maybe something like "if B<xenwatchdogd> is running in dom0, the whole
system will reboot". I'm not sure if the host reboot in this case by
default, probably.

> +=head1 SIGNALS
> +
> +B<SIGUSR1> Will cause the program to disarm the watchdog timer and exit,
> +regardless of whether the safe exit option was passed.

"whether B<--safe-exit> option" ..

I think it's better to call-out the option explicitly.

Thanks,

-- 
Anthony PERARD


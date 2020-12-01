Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B4A2CA0E9
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 12:07:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41839.75325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk3V0-0006SA-3j; Tue, 01 Dec 2020 11:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41839.75325; Tue, 01 Dec 2020 11:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk3V0-0006Rl-0b; Tue, 01 Dec 2020 11:07:10 +0000
Received: by outflank-mailman (input) for mailman id 41839;
 Tue, 01 Dec 2020 11:07:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=na+5=FF=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1kk3Uy-0006Rb-6O
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 11:07:08 +0000
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6a13458-f542-48e3-a73e-be88b2a35611;
 Tue, 01 Dec 2020 11:07:07 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k14so2023307wrn.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Dec 2020 03:07:07 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n123sm2377452wmn.7.2020.12.01.03.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 03:07:05 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6E9221FF7E;
 Tue,  1 Dec 2020 11:07:04 +0000 (GMT)
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
X-Inumbo-ID: a6a13458-f542-48e3-a73e-be88b2a35611
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version:content-transfer-encoding;
        bh=rLmjP5UhMJ1kEFPMl6GYP6epgRPpProrvcEKGiCfUx0=;
        b=Lfpnpkn2moZhpzzzFZam7Mg58M6Vy2AnDoF0tO8I6PvyBAt3JEff3yY5QGFOaUm13/
         XbO+gAoY8amBDq58YR4C46niAq1nU6bIU/rnRRIZZYf0VFEi+rvaVzvVJt1QHpYVMZ7+
         9zQN8/fPfG90oi2Wg207Ab1dWlsWBDLnW1XzZkHcZoT5aCJPt3TiBD7NjFx4545s3T5P
         9oevgB3P2wJuLLpg5WAc1N5G38R9G9o8v/7V+Zw420TV4gnjCrkmkVDPT5Qqa6sys2Sr
         RtbFJieJoRqQfbIBc5VAneAfkyWog5yofIaVB+fcBqdEPStWUJBO4b+qK4JmkLIZNKRf
         BV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
        bh=rLmjP5UhMJ1kEFPMl6GYP6epgRPpProrvcEKGiCfUx0=;
        b=RaoNr2ptH4tY46qKUKEFlIWR1Q0aLUMfEfrV157uKq7YFnJHZzFJNkkuYNe+lwXPUP
         XcXVTuCop/tmCPY+H87oeM0GlDzFkgsDxrekJVSKIQzI+PO4d9z88tqwtRZzohYVR5H8
         LKaw8rlnPa9dqn0EZ9jY43Ud/H0H2nMHQXZCOM6aazC3W/48w0ldJLpmE999TbSrSXzq
         Tv25nQslRqeshr9/VnXXntrfzoiBSBYz/2gdG86vNktqckmfz5t0tR8bgdqfLCX3pHEP
         uNMKQg2/Q/rqSxrtSCu/ZfVjr1xmRw+CgHJJhK+cQK51+utMhrQo2VGUjjeX9aTVbXIx
         nfYg==
X-Gm-Message-State: AOAM5334FiBeqCubaDz4JAqnDhNb8XORqz0O+xJ81VNKJ+tPF2s+OAIW
	siqk3cD912blICIJdLMt2JPf0/uSTRZf0Q==
X-Google-Smtp-Source: ABdhPJwn+ZJyJsXJfEsjhqssWibgFvZYhPhfk3oz/Szk3804uVDQYagg7P0sXVZm6CdiUJ0LGJiuPQ==
X-Received: by 2002:adf:f888:: with SMTP id u8mr3049207wrp.381.1606820826755;
        Tue, 01 Dec 2020 03:07:06 -0800 (PST)
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-3-git-send-email-olekstysh@gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Paul Durrant
 <paul@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei
 Liu <wl@xen.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH V3 02/23] x86/ioreq: Add IOREQ_STATUS_* #define-s and
 update code for moving
In-reply-to: <1606732298-22107-3-git-send-email-olekstysh@gmail.com>
Date: Tue, 01 Dec 2020 11:07:04 +0000
Message-ID: <87blfdu6nb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Oleksandr Tyshchenko <olekstysh@gmail.com> writes:

> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> This patch continues to make some preparation to x86/hvm/ioreq.c
> before moving to the common code.
>
> Add IOREQ_STATUS_* #define-s and update candidates for moving
> since X86EMUL_* shouldn't be exposed to the common code in
> that form.
>
> This support is going to be used on Arm to be able run device
> emulator outside of Xen hypervisor.
>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


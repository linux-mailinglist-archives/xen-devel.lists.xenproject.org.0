Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B18F12FCD0C
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 10:01:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71272.127507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l29M7-0005Ph-FA; Wed, 20 Jan 2021 09:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71272.127507; Wed, 20 Jan 2021 09:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l29M7-0005PI-Bk; Wed, 20 Jan 2021 09:00:47 +0000
Received: by outflank-mailman (input) for mailman id 71272;
 Wed, 20 Jan 2021 09:00:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e+JE=GX=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1l29M5-0005PD-TF
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 09:00:45 +0000
Received: from mail-ej1-x62e.google.com (unknown [2a00:1450:4864:20::62e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf4f3385-47ef-4700-9802-828b7422bed2;
 Wed, 20 Jan 2021 09:00:45 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id a10so15820825ejg.10
 for <xen-devel@lists.xenproject.org>; Wed, 20 Jan 2021 01:00:45 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id he16sm578765ejc.76.2021.01.20.01.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 01:00:43 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 71E381FF7E;
 Wed, 20 Jan 2021 09:00:42 +0000 (GMT)
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
X-Inumbo-ID: cf4f3385-47ef-4700-9802-828b7422bed2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=XAHkBNQc2T01TqTncGklTZxGswbytYkr2/NcQAmgqzE=;
        b=lDSdiDjN//4bQcOw2r4NWRHy+j9jiCTeRRi2h0LvMRagdLMOPFPDY9vhEYZa4RUGQ8
         0WNv1yOh14VYR3y063G6jtOLzbvhYg5ThBYhiFhgodYcXQvTMb9PUbdjiatoqJDCweTN
         2pvPJQOfvoQQEgaEMAW2G14ZvEDMKgYwv6if2oWHMVjDR717mRxhoNaU1kwuaRWpoFs+
         Wd20T4wy7HGUHisrFJQDrGSLziu+ZNWQEnKXzCxKK0o3kkN42JOuseqToksFF5wiXs7l
         qul6TE8/LBYtrBBlBRoxQYBaHdBnanpZU7mgGx2GZOJ4pjLnodvBLIUnd8mbWaQB/K3G
         uznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=XAHkBNQc2T01TqTncGklTZxGswbytYkr2/NcQAmgqzE=;
        b=rQbBGlinzNsfYRqf0EpTEdfX3yRPGOXToTIWITXzJu/5/nLrRdDjbTHFlzMDEKOawm
         pmaFbvxRO2aVeiPfdVC97qycBBD0RUj+14Rn+ZxNRvxLVNjWHzy7KBe31byJxCIhCGvu
         LC1w/BrK2rNs0rHRTwRZIaI10GdWYHax+Xmw4yr6DXVxHwxhPRD7xhcS45/vH92dHTwx
         tjVpctCj5gQgLwlBWZsqF1p0MbmKQSf3beeDhqJ7nmag99jbi6wUFrVlQaV+3qQZlhMd
         iJM6ulClx9E+ASTylUDOMI00jRS8scxA812DPs+BNWj0Nx6nVaifdjCGBz0uNLTxToZb
         +OYA==
X-Gm-Message-State: AOAM531SazTNyIOkYE2Ch+iv5jkkv0aSV/RsVzV4R68l9lJ1x9ixwKKf
	FfVZRDXhv7C1YaW6w6S1kcRMJQ==
X-Google-Smtp-Source: ABdhPJzz8LE8rHJQTO2p34ztUNdWl4inDSVTAmH2bOd1qkSKohmyLWxcrwAkqi0JBRGzAAlkuto14A==
X-Received: by 2002:a17:906:a84d:: with SMTP id dx13mr5498913ejb.275.1611133244319;
        Wed, 20 Jan 2021 01:00:44 -0800 (PST)
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-9-git-send-email-olekstysh@gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Paul Durrant
 <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau =?utf-8?Q?Monn?=
 =?utf-8?Q?=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH V4 08/24] xen/ioreq: Move x86's ioreq_server to struct
 domain
Date: Wed, 20 Jan 2021 09:00:37 +0000
In-reply-to: <1610488352-18494-9-git-send-email-olekstysh@gmail.com>
Message-ID: <87mtx4t22t.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Oleksandr Tyshchenko <olekstysh@gmail.com> writes:

> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> The IOREQ is a common feature now and this struct will be used
> on Arm as is. Move it to common struct domain. This also
> significantly reduces the layering violation in the common code
> (*arch.hvm* usage).
>
> We don't move ioreq_gfn since it is not used in the common code
> (the "legacy" mechanism is x86 specific).
>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien.grall@arm.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


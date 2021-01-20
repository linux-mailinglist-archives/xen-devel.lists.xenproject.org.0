Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 252022FCCFF
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 09:57:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71264.127482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l29Io-0004I6-6E; Wed, 20 Jan 2021 08:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71264.127482; Wed, 20 Jan 2021 08:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l29Io-0004Hj-37; Wed, 20 Jan 2021 08:57:22 +0000
Received: by outflank-mailman (input) for mailman id 71264;
 Wed, 20 Jan 2021 08:57:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e+JE=GX=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1l29Im-0004H9-Ca
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 08:57:20 +0000
Received: from mail-ej1-x62e.google.com (unknown [2a00:1450:4864:20::62e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aae6d96b-00ab-4d80-9b4c-53a28cca53d9;
 Wed, 20 Jan 2021 08:57:17 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id g3so13042841ejb.6
 for <xen-devel@lists.xenproject.org>; Wed, 20 Jan 2021 00:57:17 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id oq7sm599154ejb.63.2021.01.20.00.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 00:57:15 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E6BDD1FF7E;
 Wed, 20 Jan 2021 08:57:14 +0000 (GMT)
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
X-Inumbo-ID: aae6d96b-00ab-4d80-9b4c-53a28cca53d9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=JGTIksuqiQGNqeZN2O+R2N92WfiVGrxt7/9m4IS+T4k=;
        b=PDHJQHYZAEpipJ54gLEdzRBW8GudRZL9Th7iMY4bgLI+NjAUPoAmFPnaiyTj9CW/ck
         i8b+tyVHOrSWw+air8RlWhWNkiO6xys+OCJSvNqqo/sqqzqcGQ+/8yEixufvB+0PTtrR
         reow0wyvvpEFnewPcj9sFCqHkOmdFOAaEFPMBlH0scL3Fv3gDnUa6T/dJGVcPnoItbLE
         4ViB2k7JACYQANMDda73zLly5BcDwUbgU7oPneH+/1Tq8FzvOXNF2dnhoBslV/OBZO25
         p8nNDdo+StRu6ii6AlTAoQE2Ee9RkX8AJ09GHu+XVyNb5pvV8G3oBXQ1PN3e0we/Z1Eu
         4JMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=JGTIksuqiQGNqeZN2O+R2N92WfiVGrxt7/9m4IS+T4k=;
        b=dfPoHgnFWo/r/6Z1d22W103hRObA+iwuOniUEYDrhEX9Z4a/St0uDy3BB2H3bk8LjU
         2vXDnuwo819M4NH7/pAO+gj/VfAfuRln6LJDp84Y08GwWgUHLI0cPvgCXgZWq6vlHo14
         ApForJUdbI1h2HPMOm32PvrXZ7uKNbe2ElmdVxstgpv8HNmhx+jIa9x3/RL1iLH9lDeG
         wPFOf1+xrC8iqipmTFBFwqXYpLrdRcRcHHzMQAFjES4uzddKbPynhG6xeS3YEdgewBbb
         K986sWOLnMdN6LZ65nEF72BamxK2ZprgWIsOw+xdBahLGOpUrUgnqkb8Qb4wTMU+qMc0
         Ic3g==
X-Gm-Message-State: AOAM532wKQoVVf+BgMCCzhuO8lgTiK/oNRy68efv3fYEON3C7VulDHue
	gvph83DXCSfwh7X+wUjr3O/eEA==
X-Google-Smtp-Source: ABdhPJwNgzZdfu6n+BuoPmFI7M2OUhnvUFdSsmYK8Hi5CzPDGZhrTf4q6tDRgWz0uAB0+7RT57y/GQ==
X-Received: by 2002:a17:906:6087:: with SMTP id t7mr5684041ejj.90.1611133036692;
        Wed, 20 Jan 2021 00:57:16 -0800 (PST)
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-7-git-send-email-olekstysh@gmail.com>
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
Subject: Re: [PATCH V4 06/24] xen/ioreq: Make x86's
 hvm_mmio_first(last)_byte() common
Date: Wed, 20 Jan 2021 08:57:09 +0000
In-reply-to: <1610488352-18494-7-git-send-email-olekstysh@gmail.com>
Message-ID: <87sg6wt28l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Oleksandr Tyshchenko <olekstysh@gmail.com> writes:

> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> The IOREQ is a common feature now and these helpers will be used
> on Arm as is. Move them to xen/ioreq.h and replace "hvm" prefixes
> with "ioreq".
>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Paul Durrant <paul@xen.org>
> CC: Julien Grall <julien.grall@arm.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


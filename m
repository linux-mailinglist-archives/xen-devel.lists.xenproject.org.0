Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9DD2F7EA9
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 15:57:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68227.122101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0QXN-0005NC-B6; Fri, 15 Jan 2021 14:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68227.122101; Fri, 15 Jan 2021 14:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0QXN-0005Mn-7T; Fri, 15 Jan 2021 14:57:17 +0000
Received: by outflank-mailman (input) for mailman id 68227;
 Fri, 15 Jan 2021 14:57:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XE9r=GS=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1l0QXL-0005Mh-PB
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 14:57:15 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83205f9e-5bf6-423f-9c97-aacd4aad2709;
 Fri, 15 Jan 2021 14:57:14 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d26so9549717wrb.12
 for <xen-devel@lists.xenproject.org>; Fri, 15 Jan 2021 06:57:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s1sm15716422wrv.97.2021.01.15.06.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 06:57:10 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6550F1FF7E;
 Fri, 15 Jan 2021 14:57:10 +0000 (GMT)
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
X-Inumbo-ID: 83205f9e-5bf6-423f-9c97-aacd4aad2709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=jBAVQdWfTvoD+1gnfoIuv6xKVSuhqLyAYa66vCiHy5k=;
        b=j9Sz4APRLtPIWo9eO2evt/iKIuS/E+KMr+t0bBkMlHaIQu7Wem9977ynpPrJ1kfo5P
         eSSb91XFp+sBSMCYKfnF9teUuIRMcDAU0ILbzj5bJ7xoIXrQoLFUkBYdWYXMMzpDKePS
         g3vdblaVbSBnwfCu53j6dJSyBVNRokW/1ufChN5QAqmp4RGpK2raAF2TkIzSW+0LPvMf
         sPGE6pVXxUnI5RU74rKjo7mLmEkHCh6MYf1YW8rD+HdqioShoELWZDrGwFPEIBdiOey3
         z88uod82vCJ2HoWPfAj9mg859QLY+dyZt/RGtHkohsyrOTlmJi8dRWHcC6es2p5t08of
         rmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=jBAVQdWfTvoD+1gnfoIuv6xKVSuhqLyAYa66vCiHy5k=;
        b=CGANnjXc6SfC00lKASogjf4A0vnzWvRl/hTpgi317nkU/UfzOFUd0j13zZFkTO9vE3
         tJkMybVCw9nXvnBZRWBDGNVqG4ZEWWc/DR+IonArPORSWgmOBwAub+9jMu5RJXuPes8S
         +a+WsGul7J5i++YG+iNJmLLjnLUwZFVGfIATYl/viWaB2mGvT4szNnkhMXkVN4l2KNb0
         lnWegLIJaOQd8whiI5jbnPHy+k3QBbTJWbrO95NMfN6K+L2HEXsQEn8H5MwDH1eME2LU
         bBppQnZ3LxZ0juHpzZgzQf9MHX0kvAbjqAz1IyQcJmjZcIkNdqhamH6CLHtVC52JJm2R
         eq8g==
X-Gm-Message-State: AOAM530pADqQmtEqba3hS2O0I9X9YxzLNwUUZvUWdYabOPFechoAZG8o
	Ab4Mx1/tkT04Wk0R7ZzdYWdcCw==
X-Google-Smtp-Source: ABdhPJw3WkyPoaWAFhdo75d+wBoMQ+eZxQ2mVvU6lDKL2nU11PGh92HJ1qs33eHbiuuTQ+AXaRG/MA==
X-Received: by 2002:adf:8145:: with SMTP id 63mr13200498wrm.8.1610722633094;
        Fri, 15 Jan 2021 06:57:13 -0800 (PST)
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-5-git-send-email-olekstysh@gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant
 <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
 <kevin.tian@intel.com>, Tim Deegan <tim@xen.org>, Julien Grall
 <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH V4 04/24] xen/ioreq: Make x86's IOREQ feature common
Date: Fri, 15 Jan 2021 14:55:12 +0000
In-reply-to: <1610488352-18494-5-git-send-email-olekstysh@gmail.com>
Message-ID: <87y2gujlix.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Oleksandr Tyshchenko <olekstysh@gmail.com> writes:

> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> As a lot of x86 code can be re-used on Arm later on, this patch
> moves previously prepared IOREQ support to the common code
> (the code movement is verbatim copy).
>
> The "legacy" mechanism of mapping magic pages for the IOREQ servers
> remains x86 specific and not exposed to the common code.
>
> The common IOREQ feature is supposed to be built with IOREQ_SERVER
> option enabled, which is selected for x86's config HVM for now.
>
> In order to avoid having a gigantic patch here, the subsequent
> patches will update remaining bits in the common code step by step:
> - Make IOREQ related structs/materials common
> - Drop the "hvm" prefixes and infixes
> - Remove layering violation by moving corresponding fields
>   out of *arch.hvm* or abstracting away accesses to them
>
> Also include <xen/domain_page.h> which will be needed on Arm
> to avoid touch the common code again when introducing Arm specific bits.
>
> This support is going to be used on Arm to be able run device
> emulator outside of Xen hypervisor.
>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>
>
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
>
> ***
> Please note, this patch depends on the following which is
> on review:
> https://patchwork.kernel.org/patch/11816689/
> ***

Just a note on process because I got tripped up again after applying the
series to a clean branch.

I tend to just include any pre-requisite patches in my series just to
make them easy to apply as a standalone series even if I'm expecting the
master version of the patch to get merged before my series. It usually
disappears on the next re-base ;-)

--=20
Alex Benn=C3=A9e


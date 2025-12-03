Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFC3C9F337
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 14:56:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176823.1501285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQnLG-0001Im-1l; Wed, 03 Dec 2025 13:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176823.1501285; Wed, 03 Dec 2025 13:56:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQnLF-0001HI-V7; Wed, 03 Dec 2025 13:56:25 +0000
Received: by outflank-mailman (input) for mailman id 1176823;
 Wed, 03 Dec 2025 13:56:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qm2A=6J=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vQnLE-0001Gk-37
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 13:56:24 +0000
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [2607:f8b0:4864:20::c35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2688b43-d04f-11f0-9d1a-b5c5bf9af7f9;
 Wed, 03 Dec 2025 14:56:10 +0100 (CET)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-656b8ca52e8so3062788eaf.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Dec 2025 05:56:10 -0800 (PST)
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
X-Inumbo-ID: d2688b43-d04f-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764770169; x=1765374969; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKWaL5gCfpXMlcxhMeqVo5bl8hb0oKqK3zPOGUyqrOY=;
        b=AsorDzxgKD+u+aUXmWLRD/DC/wPuF1zjNf8t0yWkv4P+rS+TjxXvUeNLLzYXKMAh1K
         rs+RBT0ruTXbquGrgLBMW/KYe/YA/Q6EMzNadZIEUufWvNtd0Jo8npaRYIoSJKeQRACa
         9Vjzim8viXcNOnTcoy43QYYHMH3Ybn7jEz+s4F/RbB+hu68tATxdsdSRPZoqoi9fjim0
         ImaMRsWJkulGdVyjqGcmERxRirNcT0Z5kb7sMEX4kJZJWcmH19/FCIa+qNxOYSbj+Kdc
         YtcYm+412lCO2jRzLLnSxFkH/WDscY9HxPjc5hurldRQqDEEZ64/yTr77cfFw9nZU98n
         roGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764770169; x=1765374969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UKWaL5gCfpXMlcxhMeqVo5bl8hb0oKqK3zPOGUyqrOY=;
        b=FJDuiPiFTSH06VdVJmLSlognqy2ithrwodjG891xSgVublm0J69snu0gsO5sYJByyC
         PIMPGlR7XxTb+NZrniQBCaLKTYTpifuSf8JdOKRv/dbM1wOs6wwn7TEgt+ENfGSbl2YW
         S2Qkv0iy8t8iYS1UZL/Tq2r+sGoQebl65DCIwKcomI737eV2gUZeu8OFYzo1Jr9jxBUR
         0IYndMmRCtHbwuAJlLxOoPh60nB46WSUniyvHLWm2dUoTqZ2lyPmCLTd4Jc1Zabbk7OW
         GgkhKEprv9Pw+gm+JcCRlzO3ELx1D0L9AZQ5gm+wvkj3T82OqeJ8PIId7150Fjsbkfnz
         8f9A==
X-Gm-Message-State: AOJu0Yxl2P0LcVy1eBWDkM6qb5VPXIEIAITD4bL50lgapsutoopa9+Cs
	BUkc8lMQACEYlzfsaQgQ0R3uirok3t7+7xk5y8XnDfJ8Jscd9z324kkyAHmwA65DUkfD2+LpMGb
	7Xq6k4/Zh3tDieZIF4oIb+ZKPxywx1Am/OkHNf/uYISWQiNZuohUbn776og==
X-Gm-Gg: ASbGncsoEdRzTp6WyyAMFED/d+PCBVym4Lc9/8JTC85TPKvOQb0SfBsKlVS44kyDUwe
	3Yhtlb7VQjS6TIK3TVzIso2KXMqL2VK1G+QbsfLEBTp4L0NHerQfRfRNiqzsqHXpm7yeCtNLt8g
	4xQjt4218b9fty4NOkpyAgi7LQKT0OZ60CezueC2DE5kWIEULAxReid0S2InS/K1OXErfLe/wF+
	vQb1oWZv8zUT5vH6LvnPBwo7mnXA+K91FUcA3LH7pLsrqc3hQoXtA2f6rj3T3Ny7CbkWQlpQrcy
	0XflQ80tHjEjk3HwXcJtrwmaJw==
X-Google-Smtp-Source: AGHT+IFY8l88TPjcaXyVr3ElJfsgCxVlF26knyY5+jJPiIIx7KBXG4SbCampcFTof5phslJvhPxH8iaXwCarEW+fPOM=
X-Received: by 2002:a05:6830:3bc6:b0:7c7:5991:3c7b with SMTP id
 46e09a7af769-7c94dcefb1cmr1192486a34.30.1764770169338; Wed, 03 Dec 2025
 05:56:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764254975.git.bertrand.marquis@arm.com> <b13dfa489f41d5b72a25f40d6e45d38ad1b93051.1764254975.git.bertrand.marquis@arm.com>
In-Reply-To: <b13dfa489f41d5b72a25f40d6e45d38ad1b93051.1764254975.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 3 Dec 2025 14:55:58 +0100
X-Gm-Features: AWmQ_bnYs8CL9YDCS78bczklvUanfgufxxqKX3ZNkA1Ge2Sc5CNqpMn2J4hCjBk
Message-ID: <CAHUa44EJdyBV0Uy9yY8xo7YuJPLfUM6v0RtfpRiEqUu=o1ig6g@mail.gmail.com>
Subject: Re: [PATCH 07/10] xen/arm: ffa: refactor direct requests via RUN helper
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Thu, Nov 27, 2025 at 4:53=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Share the SMCCC plumbing used by SEND_DIRECT and RUN via a common
> ffa_finish_direct_req_run() helper so canonical success and error cases
> are handled in one place.
>
> The dispatcher now routes FFA_RUN through ffa_handle_run(), and direct
> requests bail out early if a guest targets itself or a non-secure
> endpoint. This simplifies the direct path and prepares the mediator for
> the wider v1.2 register ABI.

From the above, it sounds like FFA_RUN was already supported, but I
don't see how.

>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa.c         |   3 +
>  xen/arch/arm/tee/ffa_msg.c     | 111 ++++++++++++++++++++++++---------
>  xen/arch/arm/tee/ffa_private.h |   1 +
>  3 files changed, 84 insertions(+), 31 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 7392bb6c3db9..92cb6ad7ec97 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c

FFA_RUN should be removed from the list of unsupported FF-A interfaces
close to the top of this file.

The rest looks good.

Cheers,
Jens


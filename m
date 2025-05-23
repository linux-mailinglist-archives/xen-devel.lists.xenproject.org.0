Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F185AC1D67
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 08:59:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995238.1377781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIMNP-0005wP-9t; Fri, 23 May 2025 06:59:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995238.1377781; Fri, 23 May 2025 06:59:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIMNP-0005ty-7A; Fri, 23 May 2025 06:59:31 +0000
Received: by outflank-mailman (input) for mailman id 995238;
 Fri, 23 May 2025 06:59:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JqHe=YH=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1uIMNN-0005ts-GH
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 06:59:29 +0000
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [2607:f8b0:4864:20::c35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 772c869f-37a3-11f0-b892-0df219b8e170;
 Fri, 23 May 2025 08:59:27 +0200 (CEST)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-6063462098eso5297859eaf.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 23:59:27 -0700 (PDT)
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
X-Inumbo-ID: 772c869f-37a3-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747983566; x=1748588366; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzv5Uzo3oVDQWCbe0urs8nyJkbsNIvksTp0BxiMzQZw=;
        b=DP9w3zIcr1eYeR4AYT7Tm3ZN67NjdVjnn02KJ2nX9V6s/VJXgPzG8Kjf2L5IjpF+WT
         nCe6HHwvd/aBbD1Ts4c+4pzmPUicbTrOThkGFwtkFgq2s/I9yBKFph12ZvacEsEqWAVQ
         uoP57YeJTvQk88IHk6t4tvl8XUyU67e3Fvn8bsa3IBMVY00RAKDS9PSv+eRMbXz+uKUF
         EJ9+72CWMZy9KOKCWYggdTalrPDM3r8fT+M/sKXP5lmcoOk6txCQINA1gHCCsLATguoU
         w7+eSwgoYNCX2pC6d3NZVrlEWhOGdS4aRsXpWptvkY9eoM1GJL4ZXY3m1GpG7Fqzxg+q
         8Alw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747983566; x=1748588366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pzv5Uzo3oVDQWCbe0urs8nyJkbsNIvksTp0BxiMzQZw=;
        b=dTkbLvjiVdnMJQ/GozSwLY9nmkA5akz48MJ8/DHos1ul+JUVRa5mLqZoxR2VaEdRyV
         ZYjmiaI/Ukqm5pPCp2odzLAbDpoSDS3I6H6iKt0/qk/yW1gvPsValzMFPGZNb/i7Zg6w
         URf1RJjTsvG7XrGqUkBzXL36IH5d86BxfHEflDonni4ZA4cenqN9xRmlusMtJUEBMTQ/
         0bNTJccNeRHteF+KXYDq09/sjXjQuEfUb6y6+fAAmnEOrBZM+O2g6km8/Vectua+dg1h
         i6V+EuxP93SqHz7dmSm2X8ZcHRBzaar/r+1EAs64koV6bfZc9k3f5OSwyhZu09BR9xKx
         GiJg==
X-Gm-Message-State: AOJu0YyDYCnSRwBChiu6L8dtcZYFTQmusfY9WtPxPw9P3DGOFmSVdflx
	APZSvgWYbqP/CfqsGupAYMg9HAJxGmNZ9oZJy1pHfBOYCFTo5QA17HVcR9ugmdDS93gSybDRWQy
	xJkkCT//Qw8JJtHo4BkVnENomtsyl53yG84uGRUnJzA==
X-Gm-Gg: ASbGncsyBxOnCTg/4YEy1V8KAuejj8vjbQ1QpU6MDyq99azjnzl2hzn3iPVQZJyBQ7L
	wlMfJy0qEi6ZDcREfL8CLMKwvDGUsahUyBWArG31jpoKyysFaomnCc8b2qQ4xSH00eGzz1NKcM6
	HGgV4N8B6SdSQs+Czmnk3lQm3Ty5g5l6M84LgK2xgCT0r2
X-Google-Smtp-Source: AGHT+IGaQBeM73r2QZ8edujeAX3PLx+H/hd3tEUcuHnfA3fDC1BVTxGNdf8omk3HSd99MGGsL1x2wuXFivhnWwtf4+c=
X-Received: by 2002:a05:6820:c8a:b0:60b:814a:c1c1 with SMTP id
 006d021491bc7-60b95418911mr922104eaf.8.1747983566190; Thu, 22 May 2025
 23:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1747925287.git.bertrand.marquis@arm.com> <6e85a4a2de01aee23a366f33b3a856b52171bc40.1747925288.git.bertrand.marquis@arm.com>
In-Reply-To: <6e85a4a2de01aee23a366f33b3a856b52171bc40.1747925288.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 23 May 2025 08:59:14 +0200
X-Gm-Features: AX0GCFtiffptfe235zSBaeBOpm4bf6J6-DRrePRsoTyS9vxzwRJrlQb7IpjPlus
Message-ID: <CAHUa44E=9zkAS4BxOWkZW1OFxDe6+n-b3970fL_mD-oHyXk5UQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] xen/arm: ffa: Enable VM to VM without firmware
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Thu, May 22, 2025 at 5:08=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> When VM to VM support is activated and there is no suitable FF-A support
> in the firmware, enable FF-A support for VMs to allow using it for VM to
> VM communications.
> If there is OP-TEE running in the secure world and using the non FF-A
> communication system, having CONFIG_FFA_VM_TO_VM could be non functional
> (if optee is probed first) or OP-TEE could be non functional (if FF-A is
> probed first) so it is not recommended to activate the configuration
> option for such systems.
>
> To make buffer full notification work between VMs when there is no
> firmware, rework the notification handling and modify the global flag to
> only be used as check for firmware notification support instead.
>
> Also split probe function into one for firmware and one for vm to vm to
> make the implementation clearer.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Looks good!

Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens


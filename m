Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8318499947C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 23:32:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816487.1230695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sz0lv-00064Y-9u; Thu, 10 Oct 2024 21:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816487.1230695; Thu, 10 Oct 2024 21:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sz0lv-000626-6h; Thu, 10 Oct 2024 21:32:35 +0000
Received: by outflank-mailman (input) for mailman id 816487;
 Thu, 10 Oct 2024 21:32:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5QbA=RG=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sz0lt-0005YS-LG
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 21:32:33 +0000
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [2607:f8b0:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27986c9b-874f-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 23:32:32 +0200 (CEST)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-3e3dfc24a80so911695b6e.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 14:32:32 -0700 (PDT)
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
X-Inumbo-ID: 27986c9b-874f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728595950; x=1729200750; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6Eo4aTvu7l32z4QqJt51KfMawdqxbFISshn7oTVWQY=;
        b=McD1ehNKGtwaDYqEtvrZfqToey9DKhk7b1PqVbPBRAahbE71b0AWB4BSW+CNwySaPT
         dyBQSGQDzUgp+s5rZhi31VgClvXpNyHBVWhKgYi21a3hBXffPTVfAQbxvOH/I73wFpCU
         P+G7PYN9AITUG8J7iA6c6BTUGSpCMqSA1lmBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595950; x=1729200750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6Eo4aTvu7l32z4QqJt51KfMawdqxbFISshn7oTVWQY=;
        b=mY7bs7JCBGEuEEbKOfkVwnXx0eeVHD5Gd1YEIyzUbSkV+Q5njdEDxci2v0/IpaUL5W
         bgWgWZb5cF4+NlTWBa39X1vME23T2LQnXCjioP7J32Pqw5HlXzu5X8TI82XdB4xVjYXw
         7hjJPT9vCiAfjal8ehPtgKslx+8OGC7Cx1EossZy1Di0RZUToddPQnNUm0vwcTrZsxLl
         t/ckervjpjRThcRFFWeiYBthaEySPbgLdjbXjHtV2s21xdXM4mSjUKD+YT00HFU8Kov9
         01phAIrRpzi6PkYGqdZAwk4yJBooy1QhBERPR8eQ5ervhyD4J1I6jdRK5bvKOo23M3ZB
         PCzQ==
X-Gm-Message-State: AOJu0YwnfQCq1fsqn81P91IbOrPwqnyzNMPsagOm5Mw12E3DvY3vzqR3
	vvMQh4apcKL5uCygmndLDkpoT7a9OFmDS7jBedZjegrqNoWeiPLwLDAlzY3yI4g4+8cBer/PuaJ
	wNHw9702D/Hl2OkoiPR51+umAiCO0iAal4FYcRg==
X-Google-Smtp-Source: AGHT+IHM9CkrJp7tjJwN7tBFyH0hAPxSigBqWLEeFdkN9oNKZQ1F9O+zwbs6wS9Fi0wARTuMeArkBcEBbTtEBoW3v4Y=
X-Received: by 2002:a05:6871:729a:b0:287:b9:349 with SMTP id
 586e51a60fabf-2886df888ebmr542749fac.36.1728595950233; Thu, 10 Oct 2024
 14:32:30 -0700 (PDT)
MIME-Version: 1.0
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com> <20241010140351.309922-2-ayan.kumar.halder@amd.com>
In-Reply-To: <20241010140351.309922-2-ayan.kumar.halder@amd.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 10 Oct 2024 22:32:19 +0100
Message-ID: <CACHz=ZjbEPYkWegdxieCS9NGvVacN=3aHj75_X=tUj2oGzHFrQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] xen/arm: Skip initializing the BSS section when it
 is empty
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 3:05=E2=80=AFPM Ayan Kumar Halder
<ayan.kumar.halder@amd.com> wrote:
>
> If the BSS section is empty, then the function can just return.
>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from :-
>
> v1..v2 - New patch introduced in v3.
>
>  xen/arch/arm/arm64/head.S | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 14c3720d80..72c7b24498 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -346,6 +346,8 @@ FUNC_LOCAL(zero_bss)
>          PRINT("- Zero BSS -\r\n")
>          ldr   x0, =3D__bss_start       /* x0 :=3D vaddr(__bss_start) */
>          ldr   x1, =3D__bss_end         /* x1 :=3D vaddr(__bss_end)   */
> +        cmp   x1, x0
> +        beq   skip_bss
>
>  1:      str   xzr, [x0], #8
>          cmp   x0, x1

Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Frediano


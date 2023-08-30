Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CC578D6AA
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 16:54:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593034.925926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbMaH-00077e-7Q; Wed, 30 Aug 2023 14:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593034.925926; Wed, 30 Aug 2023 14:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbMaH-00074I-4X; Wed, 30 Aug 2023 14:54:17 +0000
Received: by outflank-mailman (input) for mailman id 593034;
 Wed, 30 Aug 2023 14:54:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dW4Y=EP=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qbMaF-00074C-FC
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 14:54:15 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15ecf408-4745-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 16:54:14 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fe27849e6aso8882282e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Aug 2023 07:54:14 -0700 (PDT)
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
X-Inumbo-ID: 15ecf408-4745-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1693407253; x=1694012053; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGnmIH2HqoCVEaQnSg8N0G+Xk/nCtGm8PvaC3Vm1rK8=;
        b=IgfIXzpo+UWJ9DjvqR7qoG+qKSpw48bYMMziLhuFGvA5rRUx9l+XwLnsfASW1e2dap
         NdXuX5vXdJ4XQwqme+QS0hoh+RzjotgxECAnGWIwv/24QUPb+iT/UpAFyz8Q5g0CnuS1
         UFgwyc/tpPJW2qZlheYWRteShDb/HDsg8C9rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693407253; x=1694012053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGnmIH2HqoCVEaQnSg8N0G+Xk/nCtGm8PvaC3Vm1rK8=;
        b=N1FLlsnzw8vc/c/88MV/5ZurLJn/JFza8x9jbpZn3GIWJWbOQPLA7ajQtTG+B1oRwH
         l9OnwjgVUmGhZhOZpt61i68mH2geKpvrIR1tyfoJMy08OS3Lgv/C3l4Oo2oeWI4TvjSX
         PLIkybBo6MDFgNYcKtq+rpQHyeAKzQGsnFvd4LYoe77Dlq9MR3h7zCWmyMv4cLJR0Q4S
         fzgefvsbcpQBTb4ziCIFD/IswYiEUvhXP4f3fBGu+Faeq0zapMD/vQrscy5L032kVSoJ
         tQ7aYypWmGC3oD2/dbVGPA1Ee5m/rh1hil1UEQwkMXJh2ly5w2KnXXJxuI+ZlfPaMgaS
         Y6Xg==
X-Gm-Message-State: AOJu0YxeHCkEw3AqHsd7/rZRwGKbKYQYP6KcEVG3Pkv3zUXO3XRzClrj
	NqXCCNFI4YT6tTuc6cDtSgd1Oea5qFQxn76Rk2or8Q==
X-Google-Smtp-Source: AGHT+IGFOphCyuI/Hm9ceu1QJeqaYHpZRoaKGin72ArSiVF1go6IeRv2+eMkmkreqRPKiRY4dC/lCXqIvW4AGuf1qTc=
X-Received: by 2002:a05:6512:33d2:b0:4fe:551:3d3c with SMTP id
 d18-20020a05651233d200b004fe05513d3cmr2316127lfg.36.1693407253583; Wed, 30
 Aug 2023 07:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693228255.git.simone.ballarin@bugseng.com> <8f2179f60335edcf97a04e1c35c7f4bb574c2145.1693228255.git.simone.ballarin@bugseng.com>
In-Reply-To: <8f2179f60335edcf97a04e1c35c7f4bb574c2145.1693228255.git.simone.ballarin@bugseng.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 30 Aug 2023 15:54:02 +0100
Message-ID: <CA+zSX=YhSS12WucZ04TvUe7vZEgbgA6FUAttXQKgnBTySDkgfA@mail.gmail.com>
Subject: Re: [XEN PATCH 11/13] xen/sched: address violations of MISRA C:2012
 Directive 4.10
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
	sstabellini@kernel.org, Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2023 at 2:20=E2=80=AFPM Simone Ballarin
<simone.ballarin@bugseng.com> wrote:
>
> Add inclusion guards to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
>
> Mechanical change.
>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Reviewed-by: George Dunlap <george.dunlap@cloud.com>


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E64808723
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 12:56:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649811.1014758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBCzl-0004vy-9m; Thu, 07 Dec 2023 11:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649811.1014758; Thu, 07 Dec 2023 11:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBCzl-0004uB-6W; Thu, 07 Dec 2023 11:56:45 +0000
Received: by outflank-mailman (input) for mailman id 649811;
 Thu, 07 Dec 2023 11:56:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ri6x=HS=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rBCzk-0004ty-4L
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 11:56:44 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae92c8f2-94f7-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 12:56:40 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ca0c36f5beso8090941fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 03:56:40 -0800 (PST)
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
X-Inumbo-ID: ae92c8f2-94f7-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701950200; x=1702555000; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LpZx0VJvyJ/1VaWPPGGVlmzWdVT+P07/SID6L3m2qlc=;
        b=Onl0ayDD2Lp/JCDpDbyRmAnT533+1VcRsUeF6UOWtGljrEwWQMuBFh06CD8TfZotYg
         MLUIYZcQZyZusBKBPwYIiJPmMNqeKcVO8ZP2zWKbKrkwMdpSHNnmFTbq82uRM95oAJfL
         VIL70uzrPPasNeaAGt35WlA7+veQMlP+vnuMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701950200; x=1702555000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LpZx0VJvyJ/1VaWPPGGVlmzWdVT+P07/SID6L3m2qlc=;
        b=gIAuRpVSTlHyfSX+r9/BFmEeVfsixGGJJ5p4qqEChY88JbfG+dEbSl5+Ak8Uzgxt6z
         fQi4Spi/yetXDlr4/bPWfDKVj/7cTMwPte3504XbiimVLTyxNqJu9WTW47zfIGaU37Wa
         CrU1uuXQg2b0Lz1fjRK1Ts29jfFjnkjpe+H6DXzHTfnrp8bX/HNdreHiZ/YKmo2YIdHD
         sDUd3XVTqIBUD9PWJ84VItABrZQFV5tAzr21blOn9hxKCKDhEY/tJZaY8eBAxmBdi3RN
         PRcOWf1Xh373kBVNJp2EEn5FRi+39mzHHQutGOUKFrwbRYHxgNfdJuG7kY0VCQXGEbvM
         9Ddw==
X-Gm-Message-State: AOJu0YwTP4Qu6emAjHFJTl87dbjKjCTEn+9yAE73WVYbuSgwWCxfi+gk
	2Hi1DCq5nK66VmZt90tjXO1aNpaASUvj89JnM/Y0/w==
X-Google-Smtp-Source: AGHT+IFzpC2z5yH7vIkG4FTi51MYUUoUr8Av/Lxnof939N2Uamdz26258/MI/oj55CzXVUw37il92JQWHHKSo7Cg3gs=
X-Received: by 2002:a2e:87d7:0:b0:2ca:ac6:9f94 with SMTP id
 v23-20020a2e87d7000000b002ca0ac69f94mr1333945ljj.86.1701950199804; Thu, 07
 Dec 2023 03:56:39 -0800 (PST)
MIME-Version: 1.0
References: <20231204152321.16520-1-jgross@suse.com> <20231204152321.16520-3-jgross@suse.com>
 <c1438011-6f26-4ab6-b7ae-ac273a1beee0@suse.com>
In-Reply-To: <c1438011-6f26-4ab6-b7ae-ac273a1beee0@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 7 Dec 2023 11:56:29 +0000
Message-ID: <CA+zSX=bSQtKZWjxjj6M-cM1Vh66f6g0x1nmcTc9bv5aLgzqUdw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] xen/sched: fix sched_move_domain()
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>, 
	=?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 4:56=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 04.12.2023 16:23, Juergen Gross wrote:
> > Do cleanup in sched_move_domain() in a dedicated service function,
> > which is called either in error case with newly allocated data, or in
> > success case with the old data to be freed.
> >
> > This will at once fix some subtle bugs which sneaked in due to
> > forgetting to overwrite some pointers in the error case.
> >
> > Fixes: 70fadc41635b ("xen/cpupool: support moving domain between cpupoo=
ls with different granularity")
> > Reported-by: Ren=C3=A9 Winther H=C3=B8jgaard <renewin@proton.me>
> > Initial-fix-by: Jan Beulich <jbeulich@suse.com>
> > Initial-fix-by: George Dunlap <george.dunlap@cloud.com>
> > Signed-off-by: Juergen Gross <jgross@suse.com>
>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Still not a fan of removing the "out:" label, but anyway:

Acked-by: George Dunlap <george.dunlap@cloud.com>


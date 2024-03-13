Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1818F87AAF1
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 17:11:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692593.1079918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkRCR-0000db-1Z; Wed, 13 Mar 2024 16:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692593.1079918; Wed, 13 Mar 2024 16:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkRCQ-0000Xj-Tv; Wed, 13 Mar 2024 16:11:26 +0000
Received: by outflank-mailman (input) for mailman id 692593;
 Wed, 13 Mar 2024 16:11:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5AcA=KT=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rkRCP-0000UR-Cd
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 16:11:25 +0000
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [2001:4860:4864:20::2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 557e58db-e154-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 17:11:23 +0100 (CET)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-221ce6cac3aso32427fac.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 09:11:23 -0700 (PDT)
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
X-Inumbo-ID: 557e58db-e154-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710346282; x=1710951082; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qa+JtwuG1/muOjjdLS6ORMUHx5CqOTSRnGW/7l8J48k=;
        b=SiIDJooFeq3c9V4CUpY2PXxLF6bOaHbVQF47sKcrKiB+qVQjKCr7xc4IGhzUmHUg2r
         g763kgQc5Y+aEJRWA4phDWOMKqCUf3XCi95dkreYFL69qmmAy2hS7wXcGh6VREaRmjQa
         hD0oSEJYnjZ9S0HwbTf4rHZiwPcAjzdEpCyTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710346282; x=1710951082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qa+JtwuG1/muOjjdLS6ORMUHx5CqOTSRnGW/7l8J48k=;
        b=OIuHJ+CRJR/bNjVsiAEekJFunJ12ay1E6eaf/30mWqvo7r2BZ1KSt5OjMAW04bqQbE
         DWjkKSnEC93MYOa/1sbtbVBShrBv+nhAefICnAChQwfzcGWEiimRTonwYGH5MjC0HWo4
         k8Q9Og60OyWLTLuaQbj1TXjhIRLyfhukJG+MU2qLCX9Rh/anVCWMKkEQvjHWSqPhoQoV
         e7x9mjkh9r7+5KNKzEOYwPUsDGeH5kk/UW80LF5c/LqDVqoe+zADGHT2ICQfxM+fz57O
         nymXpY+bgcye2wYZLeez6lCn5GnLKwseXs5w0a/jtvflsiDuRoCAf9D9SFdnKEXxYuB7
         ePlQ==
X-Gm-Message-State: AOJu0Yyxil87J3geaNMoaHTrefY7QtsxDbVhIjX+UtrwynGlxNEdDVeo
	aSa3ZPUgwOddKO+sT8RaCiqgLeY18hSboKvuma/dFvrkbplo+5y/CLma8QlaSjKMgAQGcHsbndW
	q9Z3sczKcZxgurGbL0cte7qrknDCTIR84eoHX9RA/QOjGr96A
X-Google-Smtp-Source: AGHT+IEa1XtG3OA1SjJ9vvTyYsS0bqy3yGjFPEnoQs3oKWDkme/oM1HsKBJ3UJ06kfKoEaqU6oOT7MsGPVbyr6dJBAI=
X-Received: by 2002:a05:6871:687:b0:221:42a1:9457 with SMTP id
 l7-20020a056871068700b0022142a19457mr12657581oao.9.1710346281915; Wed, 13 Mar
 2024 09:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAO-mL=xXRaQUHh0HOnqm8d2FtNo8dsm8Dn1oX6Wb=qJ_4a-YNw@mail.gmail.com>
In-Reply-To: <CAO-mL=xXRaQUHh0HOnqm8d2FtNo8dsm8Dn1oX6Wb=qJ_4a-YNw@mail.gmail.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 13 Mar 2024 16:11:11 +0000
Message-ID: <CA+zSX=a+j97TG35YDikq22Qjd4LJBQvPdNgD8RxkPkdBy-rNeQ@mail.gmail.com>
Subject: Re: Mailing list changes
To: Kelly Choi <kelly.choi@cloud.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org, 
	advisory-board@lists.xenproject.org, committers@xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2024 at 2:59=E2=80=AFPM Kelly Choi <kelly.choi@cloud.com> w=
rote:
>
> Hi everyone,
>
> We recently discussed some mailing list changes in our last community cal=
l.
>
> Issue:
>
> Lists.xenproject.org software is outdated, DKIM, DMARC, ARC is no longer =
sufficient, and there's no clear update path from Mailman2 to Mailman3.
>
> Potential solution:
>
> Host them at https://subspace.kernel.org/ due to us being part of the Lin=
ux Foundation
> No additional cost to the project

It should also be pointed out that the list address wouldn't change;
on our end we'd point the MX for lists.xenproject.org to kernel.org's
mail servers (or something like that).

 -George


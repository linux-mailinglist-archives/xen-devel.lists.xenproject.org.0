Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 387E27D9B59
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 16:27:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624524.973123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwNnw-0003le-Ov; Fri, 27 Oct 2023 14:27:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624524.973123; Fri, 27 Oct 2023 14:27:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwNnw-0003im-Lh; Fri, 27 Oct 2023 14:27:16 +0000
Received: by outflank-mailman (input) for mailman id 624524;
 Fri, 27 Oct 2023 14:27:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jK+m=GJ=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qwNnv-0003ic-1Z
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 14:27:15 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec22e4b5-74d4-11ee-98d6-6d05b1d4d9a1;
 Fri, 27 Oct 2023 16:27:14 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c518a1d83fso34293701fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Oct 2023 07:27:14 -0700 (PDT)
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
X-Inumbo-ID: ec22e4b5-74d4-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698416833; x=1699021633; darn=lists.xenproject.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRiw93aQFfv7gbdGIdLaIQ5MUlo/KpjukHKGlCJoozg=;
        b=GOW7+eVw4+AMUiJ5Lm7Q7p3qYvi3ZiaeCeIwNHFoN4HSZQ8v7/g+aihsxXGJjUsKRH
         NEfunD8OqZBR2fbTVB1Qu0fs3TvcYYG2GXJRvNWvkNM5oJdE2z2F6ArQbFRC/6TzmpRq
         bx6+hBNMJCtWua+5rVhA3+TfkPpREAap+erPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698416833; x=1699021633;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRiw93aQFfv7gbdGIdLaIQ5MUlo/KpjukHKGlCJoozg=;
        b=wx09zc54LJ5cgSBu+8oX2nky6/IrJsDpYOKpNEbDEFv/iigVK9YUNioHegpWyYsPxu
         Q/SeKNE253LzBlzhMVuoyAJNDTDjiRocWqOjTl/fPnm7at+GD8Ytcq/XvjYH6sTntf8/
         v1OnuVcVf/cEdyLwKTyaE3YtLd4cqUbTEKfVMqm74bAITNFnW3aGDI21lIdZWZViQWHp
         ji8qJ5vJiwmMolk8LCXZ9FRx5hshcjapKvyK3IwmWU0hpYgDG0prFr1YGVYpgbsqKmXm
         miJeJu7o+QXktHPKoh+X0QgPHN70IBMfx4PBOmS82Fp/90p+kUXYpOlFYf+AbgDqfEP6
         nZWw==
X-Gm-Message-State: AOJu0YyovXQE/uZZl6alvJMQSSyodeLSO84inIO3SZbh7Ev2suYn5FiT
	OA96DgaYGalWFUJwzVEkD7Nma00valjV1E9LekL6cUcoTqar7SSvugI=
X-Google-Smtp-Source: AGHT+IFltHb9j0GV+G88ObVR1RI+/Z03OUll19E2LQGnl6WPFujIIPahsGUBqRyRt/xvQq83rrueynJ5+4h+K44tGlA=
X-Received: by 2002:a2e:b0da:0:b0:2c5:1bd9:f946 with SMTP id
 g26-20020a2eb0da000000b002c51bd9f946mr2473627ljl.9.1698416833197; Fri, 27 Oct
 2023 07:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231027142602.57037-1-george.dunlap@cloud.com>
In-Reply-To: <20231027142602.57037-1-george.dunlap@cloud.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 27 Oct 2023 15:27:01 +0100
Message-ID: <CA+zSX=besyZPfZ83QmEd_JXCvL6thjC1rv5=Jsr-1Fzu59EZWw@mail.gmail.com>
Subject: Re: [PATCH] security-process.pandoc: Statement on issuing XSAs for
 older versions of Xen
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 27, 2023 at 3:26=E2=80=AFPM George Dunlap <george.dunlap@cloud.=
com> wrote:
>
> We recently had a situation where a security issue was discovered
> which only affected versions of Xen out of security support from an
> upstream perspective.  However, many downstreams (including XenServer
> and SUSE) still had supported products based on the versions affected.
>
> Specify what the security team will do in this situation in the
> future.  As always, the goal here is to be fair and helpful, without
> adding to the workload of the security team.  Inviting downstreams to
> list versions and ranges, as well as expecting them to be involved in
> the patch, gives organizations without representation in the security
> team the opportunity to decide to engage in the security process.  At
> the same time, it puts he onus of determining which products and which
> versions might be affected, as well as the core work of creating and
> testing a patch, on downstreams.
>
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>
> ---
> The entire security-process.pandoc file can be found here:
>
> https://gitlab.com/xen-project/people/gdunlap/old-governance

...and you can see this as a pull request here:

https://gitlab.com/xen-project/people/gdunlap/old-governance/-/merge_reques=
ts/1

 -George


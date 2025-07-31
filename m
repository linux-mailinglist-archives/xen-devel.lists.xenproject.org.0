Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDFCB16E18
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:03:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065110.1430443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPC6-0003HF-QF; Thu, 31 Jul 2025 09:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065110.1430443; Thu, 31 Jul 2025 09:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPC6-0003EM-Mq; Thu, 31 Jul 2025 09:03:22 +0000
Received: by outflank-mailman (input) for mailman id 1065110;
 Thu, 31 Jul 2025 09:03:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X87O=2M=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uhPC4-0003EE-RW
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:03:20 +0000
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [2001:4860:4864:20::2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3341d775-6ded-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 11:03:19 +0200 (CEST)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-2ffaeff98bfso135467fac.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 02:03:19 -0700 (PDT)
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
X-Inumbo-ID: 3341d775-6ded-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753952598; x=1754557398; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5Sos21ePi0tLnhyvnuLV/njrOdpJ+RDR7PnZcae5A8=;
        b=RmmksG0ahWwwWrcyIYfxJxNvHbQIZDGFYT+dr+6NvYIQcw/OvuoX89DlFnXehOd5xE
         HYvWZiyMBQSgQipoReplMpzFN8e6PueWUGvgvCImFTF/xsbhzcq7pGJslrYLy87Jh365
         R3dYrAXuzUE5FeHi0D6yzc5a2eTIieeTgbpOg+p4RalS117VlHDbpWQQVTkegGd5Kt5l
         ANFP/mwCOY16YdpN8+qrmMUumjK6NsIZK8fBT6hLuAJAI3YLgAzVXbTrKkKhWMv0wah9
         4NmSsME71Ly3vCwbLLGjEuj3B+AVYKFCHPdZCtg7FwRgXPgn5TjUzaJHSq1FgWfrNH7S
         NBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753952598; x=1754557398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5Sos21ePi0tLnhyvnuLV/njrOdpJ+RDR7PnZcae5A8=;
        b=oo6ksxoU4mC/mbnjmYVKWLqXXZCSz3laygY8/haP4x2wq+HhHL+kFoX38j4LrJQjTv
         iiI4pkiMnCZPOd8++tgbKkwIncl/NrfZIZtlGt29coAlRusx+DPCTA9DpN6S/wgtZZXu
         FRZbzsPZftIpxZg8wKvWUJFdvh0rbUnNBiJoQDRQtUC0+tPj47EB9d7HKy69HxiUg7cu
         y+R3pMFdGvMt2RnHZEVvo5pCjA1qz6ZpBM7R78M4vat8DrWFivk/lJrmn0q8Ui+k59pP
         a/GjCER7Gpgupj5xgdKBXoPGHbjjSGle7HFGcyBwt+m6VxZ42p9ZAmc2ngLuvxxHzBl4
         dQpA==
X-Forwarded-Encrypted: i=1; AJvYcCV2gQkg2RwMFT5/6tVpjhkpfDPSmdLY8I71FJtRcdBz4sW8L28T0WXcgcJMHYoFZ0NyL7JgHmbOVos=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwhvX+QdJIST7tAb9uk15rA+sjBusd+Fa3zDpqjsDjrv8KvMgW1
	HkPDg7JCGaK/+Dm6v6kc11FX7W9H5Jtg0oDDjJtKzOvMNiENOXiDfOKuv3gHxJhtUXrMDG97Qeu
	qrkQX/wcy50eXKv9p/EVzGCVgAl8yd+Bo+HQO
X-Gm-Gg: ASbGncv8ZOeU7ywOZVeiCf3CWw7e7c/lKl0Lb0+kjp+cb82cwdToNWKKl9I3ga19grw
	5mhBWnyETwXJO+FP0lymanmhwJNwPbQQHNeWYF8wwwCuPu0xvcHfTix5ddD2Vh5Xl6qCR+9/AeH
	uHhiHsOGYcZld5qy53PG0P7JRquNJvpXVYEAj9kOAKYkGHQ6/RVVBqJkxXvrrV9HYbIQ2MosRzp
	qe8/2Vw0JKyyJqiEiHxgQa32N8MmgTLNk19n+9qdJrfK1WSZoSg
X-Google-Smtp-Source: AGHT+IGxtXJrrOQMB33Mqa5YzoHUSSmV4TnYQOGGco9ibqplfzMBhvsdfB1WXycqZSIt2fXeF4ElWTVrl/3I+fwaOp0=
X-Received: by 2002:a05:6808:50a8:b0:409:1073:47c with SMTP id
 5614622812f47-4319b82335emr1528195b6e.6.1753952597489; Thu, 31 Jul 2025
 02:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753871755.git.w1benny@gmail.com> <ee9b656301dfc7dbe09a729ff8c2febbfddb61c7.1753871755.git.w1benny@gmail.com>
 <4156db18-349f-4832-a609-3a778521a44c@suse.com>
In-Reply-To: <4156db18-349f-4832-a609-3a778521a44c@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Thu, 31 Jul 2025 11:03:07 +0200
X-Gm-Features: Ac12FXytY_yTqlRqmY8sU87xTYlj580JuLIeDanu-v9Uktmp2p8QuPcQsHOUAw8
Message-ID: <CAKBKdXjH3Ot=h9i=Ev=nXgZ9f4ZV2QwU5aNN1AoqwQMUb8uRLg@mail.gmail.com>
Subject: Re: [PATCH v11 1/6] altp2m: Drop p2m_altp2m_check() stubs on non-x86,
 move prototype, and guard uses
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Connor Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 10:54=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
> s/following/subsequent/ - the series may go in piecemeal, after all.
>
> Happy to make the adjustment while committing, provided other necessary
> acks trickle in.

Agreed with the change. Feel free to make the adjustment while
committing. Thank you.

P.


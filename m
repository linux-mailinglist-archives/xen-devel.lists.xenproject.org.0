Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB8E7823B2
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 08:28:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587280.918614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXyNn-0006b0-7I; Mon, 21 Aug 2023 06:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587280.918614; Mon, 21 Aug 2023 06:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXyNn-0006Xo-4W; Mon, 21 Aug 2023 06:27:23 +0000
Received: by outflank-mailman (input) for mailman id 587280;
 Mon, 21 Aug 2023 06:27:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/hii=EG=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qXyNm-0006Xi-3F
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 06:27:22 +0000
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [2607:f8b0:4864:20::929])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c807f069-3feb-11ee-8782-cb3800f73035;
 Mon, 21 Aug 2023 08:27:20 +0200 (CEST)
Received: by mail-ua1-x929.google.com with SMTP id
 a1e0cc1a2514c-799761430c2so832983241.2
 for <xen-devel@lists.xenproject.org>; Sun, 20 Aug 2023 23:27:20 -0700 (PDT)
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
X-Inumbo-ID: c807f069-3feb-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692599239; x=1693204039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3HEhziiMoRq8W+iz0cEqn9W08+Qli95DYLv6cEuSnY=;
        b=X5paJG+12fla41xVVoY7NvDb6EtN/SVGH2deq6rIztGbwz3pthUAAPC/2J7ik0brKd
         DRsJnlT1nthvz6krd5SBg2HSqXuV0kimoaGqiWfKFFg5Gorw1LbbBve+Cbh4Ii1fxAHs
         QvVrtQdyZ1FNd01gAqDAJVt/Yd+TFbvEmrvVdhc+0tuNF/YUT7FDfpMDW5lm7cfad1RR
         si4TDmNg/La2IZDQNod8IExo+2YpiQfU3wg8hhbO1o3ZliO0lTndkkvbw3+0LmOYXo8l
         12y3SpyYznkngnURKxda8b19pNixgw557SZsg14mjubBsn0TnfAu9iRTy1nVVVqXlVMk
         rncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692599239; x=1693204039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3HEhziiMoRq8W+iz0cEqn9W08+Qli95DYLv6cEuSnY=;
        b=Vws2qKN8/y1eEQLXZy7kGqJS1Okz7DzZpPcuZWWRBi9U2lx64aOoWENHgqi70adC+z
         9qaJcjcB5T/4t4oxt+WWTvN9HxRyqQfTrBt5Edi0/0913wrknf2YtatRBhmo6yrhhBEr
         Vfj2kb6eQkD2DXTYC+3CDkZsXOjS6mBGsEahUjPZFVr+OrbhaPhDbuVJykUQVeyWoJS5
         MQN81OP7VlztbEMfEmwWl91tOE3wQc8s8QhCh9Rkl20p4uw2+QhlBdtbUKD/6W+jcNUz
         075pkXuTNt706Zmtfme2IawDvRemVm3ENnTyg60LQaxTcz1bJzEWUZsrEPIAsfJhC+IK
         2Utw==
X-Gm-Message-State: AOJu0YxVfUaTaSk1co/kyTEnvt2WIx+Ueiore8rHJmw7lruRnRYrZlXy
	wSQpVf41AEwdu3KsdMsJuDEc3+Fjl4R1IkbHmJdXMQ==
X-Google-Smtp-Source: AGHT+IEBFaw+H2Pu/Q7Qzq8+pmK3GmRwVJC5nABLokpWQnMzwL0+z6jwMQBoHsv+0Hgk2AEyAU6mJTJINMNy4akm0Kw=
X-Received: by 2002:a67:f603:0:b0:445:1e73:3742 with SMTP id
 k3-20020a67f603000000b004451e733742mr4748077vso.4.1692599239679; Sun, 20 Aug
 2023 23:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230731121536.934239-1-jens.wiklander@linaro.org> <e4b538d7-447b-4b4d-8c3a-bfb452cb76a8@xen.org>
In-Reply-To: <e4b538d7-447b-4b4d-8c3a-bfb452cb76a8@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 21 Aug 2023 08:27:08 +0200
Message-ID: <CAHUa44ERDnPw_0E=KAGn7x77utObEzD7Z5q20ZNkRhgxCWKTzg@mail.gmail.com>
Subject: Re: [XEN PATCH v11 00/14] Xen FF-A mediator
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, 
	Marc Bonnici <marc.bonnici@arm.com>, Achin Gupta <achin.gupta@arm.com>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Henry Wang <Henry.Wang@arm.com>, Community Manager <community.manager@xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Fri, Aug 18, 2023 at 10:32=E2=80=AFAM Julien Grall <julien@xen.org> wrot=
e:
>
> Hi Jens,
>
> On 31/07/2023 13:15, Jens Wiklander wrote:
> > Jens Wiklander (14):
> >    xen/arm: ffa: add direct request support
> >    xen/arm: ffa: map SPMC rx/tx buffers
> >    xen/arm: ffa: send guest events to Secure Partitions
> >    xen/arm: ffa: support mapping guest RX/TX buffers
> >    xen/arm: ffa: support guest FFA_PARTITION_INFO_GET
> >    xen/arm: move regpair_to_uint64() and uint64_to_regpair() to regs.h
> >    xen/arm: ffa: add defines for sharing memory
> >    xen/arm: ffa: add ABI structs for sharing memory
> >    xen/arm: ffa: support sharing memory
> >    xen/arm: ffa: add support to reclaim shared memory
> >    xen/arm: ffa: improve lock granularity
> >    xen/arm: ffa: list current limitations
> >    tools: add Arm FF-A mediator
> >    docs: add Arm FF-A mediator
>
> The series is now committed. Note, I had to resolve a context conflict
> in the CHANGELOG.md.

Thanks for the update, and a big thank you to all of you who have
helped me to get this into a committable state.

Cheers,
Jens

>
> Cheers,
>
> --
> Julien Grall


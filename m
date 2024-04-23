Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4398AE9BC
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 16:43:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710719.1110101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHMr-0005z6-Qx; Tue, 23 Apr 2024 14:43:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710719.1110101; Tue, 23 Apr 2024 14:43:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHMr-0005vs-OG; Tue, 23 Apr 2024 14:43:33 +0000
Received: by outflank-mailman (input) for mailman id 710719;
 Tue, 23 Apr 2024 14:43:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nbx+=L4=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1rzHMq-0005uu-9T
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 14:43:32 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dae55597-017f-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 16:43:31 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-51bae805c56so786769e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 07:43:31 -0700 (PDT)
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
X-Inumbo-ID: dae55597-017f-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713883411; x=1714488211; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vz7IkZGrmWBOqz5pqoOo7iSNq0wtc0CcGjgCgxPAiCo=;
        b=JH75vmSLREB/rkFT6LgWNkM6TaXzJoGqa81dRldr0vt1PlyqnrYWo4VvEdTUOO+i9i
         ixmTT8QhG4ph4BvSt/kz91YJ7CAbEu0VrzcO2Emq68E3FmXwBdDJx3/M2c+/ipMUFD2I
         vGpLe2JrDQfUF6+gd8jhPgugW+pmD4eMjqTDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713883411; x=1714488211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vz7IkZGrmWBOqz5pqoOo7iSNq0wtc0CcGjgCgxPAiCo=;
        b=bVcb2EmGsSGb+ctEosb8GqUSqcrKzkkocJr2a/mT0KelDILpzgXgVp6n/vtTsCLJps
         N4XcpCugMcaNLANt8ALF61f10zW0/vvgz9vqQig598wHzndihbfsBJXMiwl0l7szpxOK
         CktfeXc54+rwbdusC4KAGy0j7aDhtJ9294NUS1KixqYYVaW6I31B+I0IylS0z41HnEKS
         +sAqFRAEqjY8b1CwEVLadYXypGU0615nsIsUCj0KAN0SJnC+71VN9SeTIRqRA+Mj6L4Q
         CoVMVlRsBFPu601hRNJIEFhQzpIKFv74Nbnyz2QehImwbiWaLrWlnNFtZ5meLEtKJp64
         mgZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv++NY+2DAMO60nWimrEFkA5JPQZMD47p49In1C1OjGpxZg0GV63Mnmt26yex8mW+Fogcwe6QZhfe0nSRs7bxp6MfWnwfDr1Zk2vBXQcI=
X-Gm-Message-State: AOJu0YzrtxQHmsHj+soGxrSTid8imlWcHzxBhTw5cUkO5lcRmYzU1McC
	UlEinoYyiB36DpQuhoKMuzqtja/LHM91HMgGEaPm7I+v7VdE/sW0JdAIw+4P7DpoOTttBll3Xhv
	2tVlPT2H1b4mvdBueHKxfR/ZTx7mqtOXissrFmA==
X-Google-Smtp-Source: AGHT+IH8RgoGMQCcEJmGLSWjcDPDgbogMBhW24HuU95gxq4LiZq/qQutaDf2/IdrSbnShWkuNS9g2putIJYVn4CbSbc=
X-Received: by 2002:a05:6512:b0b:b0:51b:398f:ce40 with SMTP id
 w11-20020a0565120b0b00b0051b398fce40mr4801446lfu.10.1713883411079; Tue, 23
 Apr 2024 07:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240416091546.11622-1-fouad.hilly@cloud.com> <20240416091546.11622-3-fouad.hilly@cloud.com>
 <9600cd58-3530-4037-bf3c-aa6038b18fa5@suse.com>
In-Reply-To: <9600cd58-3530-4037-bf3c-aa6038b18fa5@suse.com>
From: Fouad Hilly <fouad.hilly@cloud.com>
Date: Tue, 23 Apr 2024 15:43:19 +0100
Message-ID: <CAJKAvHZNANZ_E1tEs0Op_LvWD7W1RzW34bPNNBu8VWB1O97NNQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] x86: Refactor microcode_update() hypercall with flags
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 3:18=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 16.04.2024 11:15, Fouad Hilly wrote:
> > Refactor microcode_update() hypercall by adding flags field.
> > Introduce XENPF_microcode_update2 hypercall to handle flags field.
> > struct xenpf_microcode_update updated to have uint32_t flags at
> > the end of the sturcture.
> >
> > [v2]
> > 1- Update message description to highlight interface change.
> > 2- Removed extra empty lines.
> > 3- removed unnecessary define.
> > 4- Corrected long lines.
> > 5- Removed ternary operator.
> > 6- Introduced static ucode_update_flags, which will be used later to de=
termine local ucode_force_flag.
>
> Non-style comments on v1 have remained un-addressed. Specifically, to
> give an example, while 1 says you now highlight the interface change,
> the request was to explain why changing an existing structure is okay
> (hint: it likely isn't, as the structure size changes for compat [aka
> 32-bit] callers).

I see your point now, I will keep the stable ABI as is.
>
> I'm not going to give the same comments again; I'll rather expect you to
> respond to them by either adjustments to the patch (or its description),
> or by verbal replies.
I will respond to your V1 comment on the previous email to keep things inli=
ned
>
> Jan

Thanks,

Fouad


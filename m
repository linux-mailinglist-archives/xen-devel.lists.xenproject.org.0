Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 380CD7DFAE0
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 20:26:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626968.977738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qydJy-0000mv-OO; Thu, 02 Nov 2023 19:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626968.977738; Thu, 02 Nov 2023 19:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qydJy-0000kp-Lo; Thu, 02 Nov 2023 19:25:38 +0000
Received: by outflank-mailman (input) for mailman id 626968;
 Thu, 02 Nov 2023 19:25:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Af+B=GP=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qydJx-0000kQ-Vv
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 19:25:37 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 990b2632-79b5-11ee-9b0e-b553b5be7939;
 Thu, 02 Nov 2023 20:25:36 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5230a22cfd1so2228090a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Nov 2023 12:25:36 -0700 (PDT)
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
X-Inumbo-ID: 990b2632-79b5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698953135; x=1699557935; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sI3NNmtBMGkEdi8DCS8PFyqpcNw/YewEffJ8wf5Mcpk=;
        b=VyVgccL6PAZUe9TLOPkGcEkeICsmzrjfc+F2qPBzj1FrSc1bqExQimP4T7U9141cqF
         9RyDX2ZId3VRpJiKCo3hz8HHcFfyoV51fJ9rJeoZS0Ge4ckLh8IzplMUqXLPh/6K9sB3
         s/0cGJnhNkXOQbM67El9xXuqztP8qTp0IzC2r2rqa+eii+viXjJajQV13/spC6jI4QZ4
         hn41o+hOXnCLmKsknbfJXZNUBk16SNB87BOTqG2NhzgzoWqvPUe1Wf9qiJtfumF74/7M
         1upJCAN7Lz2WSC5N0i7VUxHQJugHSDKMpl5MKVhP6/Z7JFKKNLbP+6tz9jB/8DHO0xsw
         jJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698953135; x=1699557935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sI3NNmtBMGkEdi8DCS8PFyqpcNw/YewEffJ8wf5Mcpk=;
        b=KUPLT0n/j3RKD+B9R04w9GV0KeJsoqXpmZr6CGyblxNqvjf1xDcIbu0Ux0uF5CIkRr
         O9q53ITc/Vl6A3+KnfAzYWuxJSmaqr7kuJIsm/zZ33KLjZcM+qymUp8jtk40rOUJTYNS
         UZTvMmadGXmmufNixVcO7dibxOidwq5k77pWOwysZgnZm+xM412v8Vc45egPF61lUIYP
         TvY0HNvgjHpVF1L5gZ+vW03JqMP9ma8SfGCh0x/uDRsGGchs/ZsNEXAjOYdoo4HJqLVq
         JYeDyQtLpq+Wq73YUi5p2c5EIE0LR6a/2Cq+yQFBCa6GxAvsFvGf29AJ1qIlpxQ6PS+/
         mDoA==
X-Gm-Message-State: AOJu0Yz1l0b27Gd5p2Xsuj/UtlhV3abzsthlS2igju1XFPL2JFtU6SLm
	vviSOMWUqOw8wZK80HgueoUVlsWJ1RcEPKIU6LQ=
X-Google-Smtp-Source: AGHT+IGEXJbRPvEJF2AA+rz1qCWtFyL0YzX42peVrcvFviGVxWzAJIpN/yUR9Vplz/zNpTSc1TZQuFKEk6nuaDrX0bE=
X-Received: by 2002:a05:6402:31ee:b0:540:77f8:240 with SMTP id
 dy14-20020a05640231ee00b0054077f80240mr14955225edb.14.1698953135329; Thu, 02
 Nov 2023 12:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-7-jgross@suse.com>
In-Reply-To: <20231101093325.30302-7-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 2 Nov 2023 15:25:23 -0400
Message-ID: <CAKf6xpvGcHJuCE2ZK8vZc=kyW_2CLJOa0s2RFBnh8e2=JECheA@mail.gmail.com>
Subject: Re: [PATCH 06/29] tools/xenlogd: add 9pfs version request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 5:54=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add the version request of the 9pfs protocol. For the version use the
> "9P2000.u" variant, as it is supported by Mini-OS and Linux.
>
> For the request parsing add all format items needed even in future in
> order to avoid code churn for those additions later.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>


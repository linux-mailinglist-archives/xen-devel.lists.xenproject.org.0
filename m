Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CCE89BFB9
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 15:00:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701947.1096590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtobq-0000hp-5d; Mon, 08 Apr 2024 13:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701947.1096590; Mon, 08 Apr 2024 13:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtobq-0000fP-2o; Mon, 08 Apr 2024 13:00:26 +0000
Received: by outflank-mailman (input) for mailman id 701947;
 Mon, 08 Apr 2024 13:00:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zErk=LN=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rtobo-0000fI-Bi
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 13:00:24 +0000
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [2607:f8b0:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3edfe42-f5a7-11ee-b7f7-5d6b493b22b9;
 Mon, 08 Apr 2024 15:00:21 +0200 (CEST)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6eaf9565e6bso3133445b3a.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 06:00:20 -0700 (PDT)
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
X-Inumbo-ID: f3edfe42-f5a7-11ee-b7f7-5d6b493b22b9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712581219; x=1713186019; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q714Nm8ZXiiNOCBkZLSgaliRMxIwh9vQdiua8gm1DEY=;
        b=uciPRyQ6oFhSIRPnpqZ+X2miRRO73eDKzwS1RNzdh7/Lwq2xESSLlIJSZyluNrItYD
         r/gg960oeVf4/EA9dI5GV3j+cB/SKtM5l+KIkP7QYSRutd0kEpgMhf4uW11ZI++eF0F3
         /6fXg1BSVAsjVLAwFH9duuMp9fbjkZ3a9FCD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712581219; x=1713186019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q714Nm8ZXiiNOCBkZLSgaliRMxIwh9vQdiua8gm1DEY=;
        b=LHa4fy1OKnvoXq6gtxBV8ZSI6NDvWqhj6u+/MiCF+GyRToSf4sPrwQdAyBh8JL5yy5
         FYRVFO71UJjNqLFRWrM9DClB+rQvYRmHQfs2KkxOaEeBHQVTeOI/K8hyGkkqQFtPLWIa
         YeI5lm6ZP8b91vIMC1K1oO2yJeTJQQcc9JyclgVmrAk3hLxrLeQbEcScxSBpCKiEb8vA
         w1TsfiwDE1wyF1zCFEU7ubOc3hxLcHEZItg8rmpUnbVknkZRUQENdzTcwvi1GXvjlJ4E
         5jhOumC2lriFVc0KNk9zX2Z0PtZXFq3L/5UFsVlO2lYjIqsBrTLFo3EnZ5O21ENc8xDH
         Z5kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxrdWQ4xIdxfuK/tM+ma/ESKGKzjX9N5aEi6PDgiH+uggfY8p6+Hi34fXadv7ge4ZDj8mOaqDzeYK3AZKa3bobE66cBwTmYPT62tMPWaA=
X-Gm-Message-State: AOJu0Ywi6OkKxSZgKiX/nVNE7FpYI2lEpTEKPGS/pNP46nqcgNs789qC
	4FEcLTqsyNpAxaVNTM1rc38g5boOy70Pf7RkF4JPeK9n44FSgjnBg7JWFUlOC88Lmc/eY4Ee72R
	zElazedvQ/TH3gfjO35MlfNnA4a2mI61ukMpyj75IClytvgMVXg==
X-Google-Smtp-Source: AGHT+IGOQK5Q/iV+vLPvm6a80+xbazHGAgGRWtRhX4Ai4j+kQswxdaL01v/QNZT38gEUJu8sNtf0/rKTLFEvRKTaDNk=
X-Received: by 2002:a05:6a20:7355:b0:1a7:42b1:f18 with SMTP id
 v21-20020a056a20735500b001a742b10f18mr8358272pzc.52.1712581218689; Mon, 08
 Apr 2024 06:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240404140833.1557953-1-ross.lagerwall@citrix.com> <6fad8151-4bde-4a02-96fb-27b99d93757f@gmail.com>
In-Reply-To: <6fad8151-4bde-4a02-96fb-27b99d93757f@gmail.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Mon, 8 Apr 2024 14:00:06 +0100
Message-ID: <CAG7k0EqEwfS75n8FCncrr_VzPtJZk46KrLiYaMDfWfrZ6CEApg@mail.gmail.com>
Subject: Re: [PATCH] xen-hvm: Avoid livelock while handling buffered ioreqs
To: paul@xen.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, 
	xen-devel@lists.xenproject.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 6, 2024 at 11:58=E2=80=AFAM Durrant, Paul <xadimgnik@gmail.com>=
 wrote:
>
> On 04/04/2024 15:08, Ross Lagerwall wrote:
> > A malicious or buggy guest may generated buffered ioreqs faster than
> > QEMU can process them in handle_buffered_iopage(). The result is a
> > livelock - QEMU continuously processes ioreqs on the main thread withou=
t
> > iterating through the main loop which prevents handling other events,
> > processing timers, etc. Without QEMU handling other events, it often
> > results in the guest becoming unsable and makes it difficult to stop th=
e
> > source of buffered ioreqs.
> >
> > To avoid this, if we process a full page of buffered ioreqs, stop and
> > reschedule an immediate timer to continue processing them. This lets
> > QEMU go back to the main loop and catch up.
> >
>
> Do PV backends potentially cause the same scheduling issue (if not using
> io threads)?
>

From what I can tell:

xen-block: It reads req_prod / req_cons once before entering the loop
so it should be fine, I think.

xen_console: Same as xen-block

xen_nic: It reads req_prod / req_cons once before entering the loop.
However, once the loop ends it checks for more requests and if there
are more requests it restarts from the beginning. It seems like this
could be susceptible to the same issue.

(These PV backends generally aren't used by XenServer's system QEMU
so I didn't spend too much time looking into it.)

Thanks,
Ross


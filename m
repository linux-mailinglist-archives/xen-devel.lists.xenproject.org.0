Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD47A82A2B4
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 21:48:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665756.1036064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNfUs-0004AA-UJ; Wed, 10 Jan 2024 20:48:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665756.1036064; Wed, 10 Jan 2024 20:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNfUs-00047i-R0; Wed, 10 Jan 2024 20:48:22 +0000
Received: by outflank-mailman (input) for mailman id 665756;
 Wed, 10 Jan 2024 20:48:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CWwH=IU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rNfUr-00046K-DQ
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 20:48:21 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96b36eb0-aff9-11ee-98f0-6d05b1d4d9a1;
 Wed, 10 Jan 2024 21:48:20 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-553ba2f0c8fso5274164a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 12:48:20 -0800 (PST)
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
X-Inumbo-ID: 96b36eb0-aff9-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704919700; x=1705524500; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNg12l2WC8xUYpIuBjLtpZgo+PLGNFiRlM/cKGQJ/lg=;
        b=DKklJUhlHF5vAAZBd6irMapTKL10UhpG6+AI/cRgd8Ckr03QT62wVpCP1tJ8odU2U0
         yrEykCUpRLyJuT141717QRPWy+tkfkMdPtGNuMfaXNVggc2iJQ5ZzCMckMWKuOjlWSqI
         4ZIOy6wlcWt/4Howzp9bltwZ8XqBy0ORSCvhnZP24ZVmsBubLEZGlAojo7MGzwqU0Qda
         Gqp6GmlFFbwYvBhoYBXGVsIbDKK8LO931r3K/OKla9pm/spEAvcPWgZYLJ9Glj46GnFO
         CeJch2hqMsan7p2pQDQDObdB9w1N8OJNrEaS9xaLRYK+sUFAF7OO6GP5U2vn4S0ck5Y/
         hWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704919700; x=1705524500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNg12l2WC8xUYpIuBjLtpZgo+PLGNFiRlM/cKGQJ/lg=;
        b=G9EzT2zxd6i5a+AO/4ujBYGL9XX7ZtOY8Zk36IsbO8o5tATgderblw31U2nmll6Jd2
         fsqh6KrHHPwIUzFX+y2UlXV5pwTjiAOrMKvQ4g7tqNBFBzEveHDKCdppNo8thfrb4460
         utyebpjsfn/Cj7ImdE4zn3RRdxiNfWG8suv4cyQZlRtaHwo8nvYmTuUGpBlVWGX68e8W
         CCKy7P1HcXE2LwD3/8eXKpQ3bFXNKQcWfNETIiEH8UnvTIrh9JIowwHuXzZAir/xfPcA
         jk+SaSblP6uliDHIj3u7m15cFf95ejZuSJrxLEEyQmMZz6j0IlsMqqC+KJJLPP2GMM08
         2grQ==
X-Gm-Message-State: AOJu0YyEuvQuPntfHUUd9fVSra3kuy9sQdho3mkNf3uQWQJeeXoVaaIZ
	AaDT6w5R43Qh4Tqvwt91Ge9EzY1U1nb2gyKh53E=
X-Google-Smtp-Source: AGHT+IE2t6kGp/M1zuAPHsXj79SM2kRZgQksfp0Frg54H9qVZab7J0FU9Fe6oX/UiNOStr+SM8Ic3c7Oh55RmALy8pM=
X-Received: by 2002:a05:6402:1488:b0:557:63be:c867 with SMTP id
 e8-20020a056402148800b0055763bec867mr17450edv.105.1704919700150; Wed, 10 Jan
 2024 12:48:20 -0800 (PST)
MIME-Version: 1.0
References: <20240104090055.27323-1-jgross@suse.com> <20240104090055.27323-27-jgross@suse.com>
In-Reply-To: <20240104090055.27323-27-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 10 Jan 2024 15:48:08 -0500
Message-ID: <CAKf6xpvAqKjAj99Msf1EHQ9nY5quWZFrBD4TS0m_M5YzDNzm0Q@mail.gmail.com>
Subject: Re: [PATCH v3 26/33] tools/xenstored: get own domid in stubdom case
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 4:34=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Obtain the own domid when running as stubdom.

Maybe "Obtain own domid when running as stubdom."?

>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>


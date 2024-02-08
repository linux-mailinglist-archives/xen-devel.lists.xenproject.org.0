Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD09484D745
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 01:45:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677912.1054829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXsW8-0006MA-P7; Thu, 08 Feb 2024 00:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677912.1054829; Thu, 08 Feb 2024 00:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXsW8-0006Jz-MQ; Thu, 08 Feb 2024 00:43:52 +0000
Received: by outflank-mailman (input) for mailman id 677912;
 Thu, 08 Feb 2024 00:43:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jwf=JR=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rXsW8-0006Jr-1o
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 00:43:52 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fb4d451-c61b-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 01:43:49 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-55f0b2c79cdso1619217a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 16:43:49 -0800 (PST)
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
X-Inumbo-ID: 1fb4d451-c61b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707353029; x=1707957829; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIFfhiRwdxKtdU4NZEKTXEA42OX90qSEYfkjrTn0SAQ=;
        b=ZmARkC2D9J9qS/p4giaxn3rnzdFBzNJTI5/m4yCRtzNQenJrLwSzwY2zeyOSQxQYHF
         ee6QYnOz2lAClIp+z8HZMWKfWMUXGoSpjGIkDUcxXQElY5O+KhNscL4jjb8FxxVe7mNz
         a3BY0fH14jRcgaG2rpl2/gAqhV8CPXfgww88TIJ475758P9RcfLVgA0poXapXJUQQWhR
         kTQcV3bLoE9m4L3e1lswjDaaeizjuKonafji3z5F5D8ShtZGtU1Enma8IQUqfqYfhZRR
         HFG07/lz1nAO3bO2divA61+It4OvNSCsknvY4idRMwiDcy9DNxfpEhzRVlYyq8FgZogy
         d8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707353029; x=1707957829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIFfhiRwdxKtdU4NZEKTXEA42OX90qSEYfkjrTn0SAQ=;
        b=jbTdSSYY32v9UCVR8GIBUku71g//Js8lX+8vlnkkZhVrADH+jgWp3Qig3nnMLAA+B9
         K+zz1Wdr4NsODYb0pasH0f1k7WBbyVzR46vsgV8su9brIN3hCYbcvehsO0DeQNayJWgV
         FcIwhrpwsx9OXkRW7XMTEcbAlYiLhZqjO1WGJTE9qp7g07CpOt7W74/zxcT36YYGkfCD
         kT/Dw85EPD9rxo53isZtYQ4shlzJZI3Y9iKijOKjemHho0oY2J7AVKcWHJpj1P9bkCW7
         IBkm30UZNL9YChv8QK9Rqz97mk+XiW2pzWfpNs80ipB4JIRVNx4F/wwD19ofJNsI6qtA
         ND3A==
X-Gm-Message-State: AOJu0YwLTAxS9ZR1jmUAyl/jDmhyAEkEeqadUmi8wS7jQtiSj8/17qi7
	au5Z/utCrMjv/7G8EqnYXzPEj83PfnwWIjKQrCiue2fhzXqYEAlQr7vNgsJj+J0JuMVvY0ZX1Jz
	ppSfF/asxrXZNRBHo6S/7n+nBjjs=
X-Google-Smtp-Source: AGHT+IHu//4l07Yk35hWdmp3FDyoPYisNXZc9i3MB/MMuWp9YUTprBwOdolCDrnYDcYEewXzJFGflGULGLcE1t1W/8w=
X-Received: by 2002:aa7:d047:0:b0:560:c6a8:e7dc with SMTP id
 n7-20020aa7d047000000b00560c6a8e7dcmr3169063edo.1.1707353028600; Wed, 07 Feb
 2024 16:43:48 -0800 (PST)
MIME-Version: 1.0
References: <20240205105001.24171-1-jgross@suse.com> <20240205105001.24171-6-jgross@suse.com>
In-Reply-To: <20240205105001.24171-6-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 7 Feb 2024 19:43:36 -0500
Message-ID: <CAKf6xpty1OJ5Tq+oZJCny=rbW-JszojoGAp-PoJziz+s90NWTA@mail.gmail.com>
Subject: Re: [PATCH v4 05/32] tools/xen-9pfsd: add 9pfs response generation support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 5:50=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add support for generation a 9pfs protocol response via a format based
> approach.
>
> Strings are stored in a per device string buffer and they are
> referenced via their offset in this buffer. This allows to avoid
> having to dynamically allocate memory for each single string.
>
> As a first user of the response handling add a generic p9_error()
> function which will be used to return any error to the client.
>
> Add all format parsing variants in order to avoid additional code churn
> later when adding the users of those variants. Prepare a special case
> for the "read" case already (format character 'D'): in order to avoid
> adding another buffer for read data support doing the read I/O directly
> into the response buffer.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>


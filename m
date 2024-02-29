Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8011186CFEE
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 18:01:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687354.1070721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjmH-0001tX-VA; Thu, 29 Feb 2024 17:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687354.1070721; Thu, 29 Feb 2024 17:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjmH-0001rw-Ru; Thu, 29 Feb 2024 17:01:01 +0000
Received: by outflank-mailman (input) for mailman id 687354;
 Thu, 29 Feb 2024 17:01:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ygh/=KG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rfjmG-0001rq-LD
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 17:01:00 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cdb7e6d-d724-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 18:00:59 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-565a2c4cc1aso1794793a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 09:00:59 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 fi12-20020a056402550c00b005661badcccesm756429edb.87.2024.02.29.09.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 09:00:58 -0800 (PST)
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
X-Inumbo-ID: 1cdb7e6d-d724-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709226059; x=1709830859; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MlQ9zW/t7TnZhS7Gp5cDrlNdJ1O1m19wbjUu/KGR9Nk=;
        b=etsHvKbDubXOrzIuAupMpu2TlQrzFkUiYLNYso/+7uQ1xU0WV8ntrq4VT9Kxi7KDnY
         w8yzX+B98nPPeDSYGZnn/21vgQay/pzjt6wAP1Tn7CWZ174Xz1J3jS6t6K3qC1RRAUtg
         WPVfsm1WDZzHsLIsbMIRcBi6fOJxk0cfOKDZjCHnRBZjeGGMV8u9z8sm+kbex9BKSxSx
         UTZtoJ0DKOcrfyLcvePKkytbAGNsVzFz9wssIfH3EgjRon7pKd4UmbI9l+VI3CGF6WPF
         ckoFDHicj/nyYWqxKV8WYO83eeyGZ29kyJKvNqZ6XiPC1fLO+J2HehnB4L3wkadQWoBG
         yuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709226059; x=1709830859;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MlQ9zW/t7TnZhS7Gp5cDrlNdJ1O1m19wbjUu/KGR9Nk=;
        b=EjyyLKK/oqhqIwq3EiZDS9Fq/epfvTIuY5EZYVALnn9kcy37OoONShMAog6x/zGLpb
         U9BlouKJIop8vQBkBksboIqW/hbcCPloINHu49sFbiJC7FnCTTwVpBytdUSBmhMSvpRK
         UoI5gtol3o4wOF0bkm6jmjvBAdcshdDf8HQm4kOMV0GwJwCilpKCb31mqfNPpOVoatbs
         +J1s7MTNa5LTOi4voj5//4TOkpoM7OsyXu/DIWMB7PC/lyNSE0seyvzWITPvLLzBRLVM
         C6wZZalNyuxwOaDdezviZ907Cw3nnkuZIRI8v+35QgELM7gTLP5um6+kseZ4UMyA5eZh
         cZ6g==
X-Forwarded-Encrypted: i=1; AJvYcCUGeBnYBbarW9m6i8W4TQ4QOuXw6AXTp/3oXYsa8BFZIDemxyxpjlx16xnzrkEVyWTEeMZYtKZU/qIhuqULEeotMH9PrwSRq/pOcICO9aw=
X-Gm-Message-State: AOJu0YzKMN1dUxB7aXaxCszf/5KBULMNdYBTDHUZXOOl8AqN/8rWipW6
	Dk1l3c6q8880MKwxmLfuM4IOEoByanT0KWQB7vHCi3BqEJlKYgWv
X-Google-Smtp-Source: AGHT+IH7hqSC+NL8tElsWBARAoEY4Atamd/8E+rTNpdbOmpEL5zMO6i3C/bamFWzJjDtFGrKAPUoVg==
X-Received: by 2002:a05:6402:b59:b0:566:ab45:e6c5 with SMTP id bx25-20020a0564020b5900b00566ab45e6c5mr1361625edb.28.1709226059069;
        Thu, 29 Feb 2024 09:00:59 -0800 (PST)
Message-ID: <93854992e2828f692d1d50c19d1f19a4e065d6cb.camel@gmail.com>
Subject: Re: [PATCH v5 23/23] xen/README: add compiler and binutils versions
 for RISC-V64
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall
 <julien@xen.org>,  Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org,  Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>
Date: Thu, 29 Feb 2024 18:00:57 +0100
In-Reply-To: <d0afb4d6-9fbc-49de-9f07-f76e4aeda8c1@citrix.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
	 <ebaa05ded3cfddb1e3f7c87cd806b866312878fb.1708962629.git.oleksii.kurochko@gmail.com>
	 <73a38d85-0798-4cfa-8625-0f8c9e05b2a3@suse.com>
	 <80fb8091-9a26-40a4-b2e7-371df9411861@xen.org>
	 <d0afb4d6-9fbc-49de-9f07-f76e4aeda8c1@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Wed, 2024-02-28 at 23:11 +0000, Andrew Cooper wrote:
> Furthermore, Linux has regularly been bumping minimum toolchain
> versions
> due to code generation issues, and we'd be foolish not pay attention.
Do they document that?

It looks like their doc is pretty old, because in Documentation/Changes
it is mentioned:
   GNU C                  5.1              gcc --version

And RISC-V support in GCC wad added after 7.0 or so...

But there is also the following words:

   This document is originally based on my "Changes" file for 2.0.x
   kernels
   and therefore owes credit to the same people as that file (Jared
   Mauch,
   Axel Boldt, Alessandro Sigala, and countless other users all over
   the
   'net).

Probably the doc wasn't updated for a long time, but at the same time
there is a line with Rust:
  =20
   Rust (optional)        1.62.0           rustc --version
  =20
~ Oleksii





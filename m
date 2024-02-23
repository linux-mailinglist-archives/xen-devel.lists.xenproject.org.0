Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46100860EF5
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 11:12:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684742.1064815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdSXH-0007O7-F7; Fri, 23 Feb 2024 10:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684742.1064815; Fri, 23 Feb 2024 10:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdSXH-0007Kx-CT; Fri, 23 Feb 2024 10:12:07 +0000
Received: by outflank-mailman (input) for mailman id 684742;
 Fri, 23 Feb 2024 10:12:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8H=KA=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rdSXG-0007Ki-92
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 10:12:06 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id feeca44a-d233-11ee-8a57-1f161083a0e0;
 Fri, 23 Feb 2024 11:12:05 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4128cfb6c1aso4170955e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 02:12:05 -0800 (PST)
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
X-Inumbo-ID: feeca44a-d233-11ee-8a57-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708683125; x=1709287925; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tud49X6dABoy6o/VSHh9Xymi32eP9RvcgR36vgY0Oyw=;
        b=Z4bbhH4JeJGoyghkedVIHHq+sfrbMWtGxbk5OLh5XEeNzBscD4P8hUA+bQe2Ie1a5C
         X0PCJeC7ld1U3zIb4CA8/vwP4nBfTMjkPmUTY8sPGdit7caIZ5cm+KhVIMPdEQBwl59V
         91vreLWd37oRi5Zz/MiA9MghYvmudi3hNNRNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708683125; x=1709287925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tud49X6dABoy6o/VSHh9Xymi32eP9RvcgR36vgY0Oyw=;
        b=b4/67KfNtzjAXLrUHjcls65+3V22zJlbjse4tARp4X4tsIFFM7+MA53jTBfQVUTvdC
         P+3D2DIk8ni8/UFW8/YSI7ROTcDURZ9lw7UqYHhgdDYwOJsSgIApI1jYE5prOlj4Bcmz
         6Dqukyvl2vAZrUYasVvP9aphaVN5NX1otql2QgKYFU0+BGGJFS0w+s/QLCNwBODzYJCu
         Rccx3au1APb/O0B27DkffDv0sPM7IxuYvbTBXmD7jmPF1vjP1p8XFUL4AHzhgnLG8p+W
         RbKZzPShBfbJgzn+rbY6hzGa9XkJEXJdRbAJY6GLpv+6BsAC1EwN4xYyaeOiUyngUJrL
         rWFA==
X-Gm-Message-State: AOJu0Yx6mdWT6Rt96Casfr4WSgmOODEYCnLeBILsyXlXXabY8H25X4ht
	qKYtNNgl7wXSOUWb8ld6QAqJJ1Rkam9onJ1Pz1LxqZIqViSfgDAKp/UuHwvf1vJ0GnHloQpwAPn
	pG+kg04lAnZ4L25atteHnkdIAPb9lHanUQzUN
X-Google-Smtp-Source: AGHT+IF+KpkcUfbRCrtj0JvxarGhXAeaGdOZ/RSFgUOG5AiGhlzz98xeRMDmmwzG9GntKY3PsIGG1a8KOf074jZ/k4w=
X-Received: by 2002:a05:600c:358a:b0:412:73f5:3aa5 with SMTP id
 p10-20020a05600c358a00b0041273f53aa5mr4675737wmq.16.1708683125315; Fri, 23
 Feb 2024 02:12:05 -0800 (PST)
MIME-Version: 1.0
References: <20231130142944.46322-1-roger.pau@citrix.com> <20231130142944.46322-3-roger.pau@citrix.com>
In-Reply-To: <20231130142944.46322-3-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Fri, 23 Feb 2024 10:11:54 +0000
Message-ID: <CAG7k0EphLJwEoR5cx7hBTHhB+dRGtBuKFPxf+f4scWopKMrj7g@mail.gmail.com>
Subject: Re: [PATCH 2/5] xen/livepatch: search for symbols in all loaded payloads
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 2:30=E2=80=AFPM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
>
> When checking if an address belongs to a patch, or when resolving a symbo=
l,
> take into account all loaded livepatch payloads, even if not applied.
>
> This is required in order for the pre-apply and post-revert hooks to work
> properly, or else Xen won't detect the intruction pointer belonging to th=
ose
> hooks as being part of the currently active text.
>
> Move the RCU handling to be used for payload_list instead of applied_list=
, as
> now the calls from trap code will iterate over the payload_list.
>
> Fixes: 8313c864fa95 ('livepatch: Implement pre-|post- apply|revert hooks'=
)
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>


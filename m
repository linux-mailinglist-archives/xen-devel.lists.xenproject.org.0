Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68653AD9E79
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 19:26:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015735.1393269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQUdd-0002MQ-Cj; Sat, 14 Jun 2025 17:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015735.1393269; Sat, 14 Jun 2025 17:25:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQUdd-0002KL-AB; Sat, 14 Jun 2025 17:25:53 +0000
Received: by outflank-mailman (input) for mailman id 1015735;
 Sat, 14 Jun 2025 17:25:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=duY6=Y5=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1uQUdb-0002IU-Hs
 for xen-devel@lists.xenproject.org; Sat, 14 Jun 2025 17:25:51 +0000
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [2607:f8b0:4864:20::112f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d455559-4944-11f0-a309-13f23c93f187;
 Sat, 14 Jun 2025 19:25:50 +0200 (CEST)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-70e64b430daso32320337b3.3; 
 Sat, 14 Jun 2025 10:25:50 -0700 (PDT)
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
X-Inumbo-ID: 9d455559-4944-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749921949; x=1750526749; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbnfxk0YQih9gvujZsNzCTqGTQ55nvK5zq1+UHCuDB0=;
        b=IiiXgsLe3anz/V8kYXQ73EONJwrHUXN7TjjcThAqcfMlbQelF+yS7ZCAK04itpOLts
         /izRUdR5+OdF4DTFM6p/UPvDFGbI3k/mwh8knRUrw+O9RiEZ/K08KXgO4bEVNoeYLT7q
         Bmdr5NDgyZKQzAiNCY5u70UgrK+2tEa69zN58o6K/4ZdJJMONWJ7FpdCvCrmjubZbFI1
         ilPgpWnk0kGU1ij+Xy56uL6DLiJ+BT5x5yUbtPXoC8v7SLOUmvcEH2sZoZ66p5TO6qlI
         JvVeIpKvEaE77abys+gogagokJtonYrxf/Pmj9pM3nmcc0vxGo2gTJw+uSe0TvK6dpHw
         zXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749921949; x=1750526749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbnfxk0YQih9gvujZsNzCTqGTQ55nvK5zq1+UHCuDB0=;
        b=lDmRc4rSkUc6zZBC8R2fFqJA4heKUSuhXcoJ/iGZXjSZ46s2hTC7aGzoXIQyK3Unoo
         NIVwyqDgsfRJiaqm+ij+bm9NcrLAxisW0QANw4k7Z+4x7YCuMAPKbZZUd10uY3h9iQge
         /XObR6++d7rRkH/JSYc1J4cYFgmrsi3VLA3FRn5BaADJ2tKPogBJ7XJZuSKz8LXzKmfU
         iFeKboaeuN9N5hx9HO5wOie4JAKevWRJBNnCNP8JKmO/K1Gt9VNbXQ0W/U24pVnMch2v
         ncfxjAoU/FohoCAW8LKzWEkgLINDoZ9dEMqBD36Omm1BzSlMn+fKgZbrlHii04ZMomJg
         O8cg==
X-Forwarded-Encrypted: i=1; AJvYcCWDWoOM8GjFWsrS2iyiXlgNGMMfcI9pPqEsKbcNFvbZvQ9KVwATpJu7eiF8xZ05Mj1hLKPjBDlS2Fw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7f+hjJWrJOAl7HbW0xkFE7AQgYqknPG1rBs9jOTYYoatUl16z
	ZRA2OyI0EJwwq1o3TuUhcOU8FGuJpKXAfSRj6B2WYO3oJPOBdS0IUWeJjOcSyRJjjmITIFN8Krt
	lx4LsG4f1LgjmfOfNTEg8LtpZhHx2/e0=
X-Gm-Gg: ASbGncs97AHcZc5DeQ0O1HUgyLjTDs0uJ5EITTkB8q3xwM2Z6vkNUTiEnF1eS/xeHzy
	QJYDUYT1BibNg1vouUuq7ffCTdYVMCUhRgNCGqgUQYQDzWmiTBa4CCa5YV7C4Fk5HSj6uyvQYcZ
	OjmJBHgesUXis3PrcM/llEu89lWPzimtV+wNd+V2xI
X-Google-Smtp-Source: AGHT+IFsm2tvurGpV6S9c/mffNQzY7lacVCeLiBr9sF1kqRLjiaOobxR/tppTikGRjkS75pY5iAZl/fWZH4Yt0GumWA=
X-Received: by 2002:a05:690c:dc2:b0:70f:253d:f278 with SMTP id
 00721157ae682-711753bfb1amr56955057b3.15.1749921948798; Sat, 14 Jun 2025
 10:25:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250321092451.17309-1-jgross@suse.com> <20250321092451.17309-10-jgross@suse.com>
In-Reply-To: <20250321092451.17309-10-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sat, 14 Jun 2025 13:25:37 -0400
X-Gm-Features: AX0GCFurZKeqceyFP1qWkjYxiZaE69qGk71jjZj86ABOSfJdhRWdqne40IdwWk8
Message-ID: <CAKf6xpuKsAsFWtOySAfN-O6hCw4SbgvQbSignMVo4xBSxXWE=w@mail.gmail.com>
Subject: Re: [MINI-OS PATCH 09/12] mm: change set_readonly() to change_readonly()
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, 
	samuel.thibault@ens-lyon.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 5:31=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:
>
> Rename set_readonly() to change_readonly() and add a parameter
> specifying whether it should set the kernel to readonly or to writable.
> At the same time move the boundary setting from the only caller into
> the function itself, avoiding the need to use the same boundaries in
> future, when it will be called to set the kernel to writable again.
> Make the function globally visible in order to allow calling it from
> kexec coding later.
>
> Merge clear_bootstrap() into change_readonly() and undo its setting of
> page 0 to invalid when setting the kernel writable.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>


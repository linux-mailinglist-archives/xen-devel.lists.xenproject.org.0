Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A4085E416
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 18:11:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684129.1063839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcq7a-0006qY-1y; Wed, 21 Feb 2024 17:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684129.1063839; Wed, 21 Feb 2024 17:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcq7Z-0006na-VI; Wed, 21 Feb 2024 17:11:01 +0000
Received: by outflank-mailman (input) for mailman id 684129;
 Wed, 21 Feb 2024 17:11:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6My=J6=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rcq7Y-0006nU-BY
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 17:11:00 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ee6d943-d0dc-11ee-8a53-1f161083a0e0;
 Wed, 21 Feb 2024 18:10:59 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a30f7c9574eso875309966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Feb 2024 09:10:59 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 cw4-20020a170907160400b00a3e45a18a5asm4302508ejd.61.2024.02.21.09.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 09:10:58 -0800 (PST)
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
X-Inumbo-ID: 2ee6d943-d0dc-11ee-8a53-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708535459; x=1709140259; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cs7RnsYILH+rArcNup3mExB8svxqC+WstkwV98sQgS4=;
        b=dsQpH/u63ZVjr7CU9RQS+L3m4IceEeLQjcOLiVzkk83id9bf74Vv7f8eIShTfB9XEf
         /V+JvOmhLiurDA9qhyR8RvmDtbwIoGeyhBxZFHtWpGGYu6ESFZO4XftcLQiq2xFYMUjm
         VOpVDCfg5zUSim7abobl5cEljCJIBrVg/P7B0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708535459; x=1709140259;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cs7RnsYILH+rArcNup3mExB8svxqC+WstkwV98sQgS4=;
        b=Q7xcAEIIvOnHGUGy1tDZmzHjObt3UxRUmt+kBP3zK+xoNCr0k2rJdhmLLXp0RXOMcD
         lXj57zZFWuTwNywI3DQjyOjZJC79pTrYe7Z0gJYMZxPbjvMxgrcK13TbZwOvCT471zT2
         hUofP3Xv+LtfcnLqdYu54c4ef2LAAR+1aN+n6nKQGKHIVludd8pG+2kBrZLZz6NtlDSw
         pP9Mlq0aemgM8kHWIyiMEUp/Xg/yNaPwxzPeQNpU9vsSA4Ik2FP4SPU5zj5O1zIlXDDL
         n0h78Bg4SWhPU9qQTFsi/6zyqhh331YtESwhhvssf6hM2rzKECEqJbJtGoTmJavaXswM
         A02w==
X-Forwarded-Encrypted: i=1; AJvYcCXxhtr0KUtWti6THe4AkYtgv4xntNRd9TeaVZUrRg8EmG6b1AImGLcODeM/mwK+QhHB66sF9huS/BB6x/ZqvzrN4WCAT7pqSekEAaI53vQ=
X-Gm-Message-State: AOJu0Yy+XZB8M/vPK881PyxIj8u95j4FKDB1XRW3Cnz05rRTmdw4IkPD
	x6iphxF3jvcBoCQThYMuE0CkdhixU1rLBdjiI0GaUqXpnT6DP4NLjkjBXqmjc0U=
X-Google-Smtp-Source: AGHT+IFxik8yBEUOqNWyWl0K1/hJtildBCKKylIhwwPL53CFiUXCI82BUqp2CnKsfb4IQQoZG09OrQ==
X-Received: by 2002:a17:906:2990:b0:a3f:218b:444d with SMTP id x16-20020a170906299000b00a3f218b444dmr2644387eje.6.1708535459005;
        Wed, 21 Feb 2024 09:10:59 -0800 (PST)
Date: Wed, 21 Feb 2024 17:10:58 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org, Neowutran <xen@neowutran.ovh>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] libxl: Disable relocating memory for qemu-xen in
 stubdomain too
Message-ID: <5ce1bb5a-9605-49ff-a783-44e90ef3df06@perard>
References: <20231227023544.1253277-1-marmarek@invisiblethingslab.com>
 <CAKf6xpsa_8nRyR-dY8sTQ6HsywZBmDvu29WwerxNkvJFqHq+fQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKf6xpsa_8nRyR-dY8sTQ6HsywZBmDvu29WwerxNkvJFqHq+fQ@mail.gmail.com>

On Wed, Dec 27, 2023 at 07:18:12PM -0500, Jason Andryuk wrote:
> On Tue, Dec 26, 2023 at 11:49 PM Marek Marczykowski-Górecki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > According to comments (and experiments) qemu-xen cannot handle memory
> > reolcation done by hvmloader. The code was already disabled when running
> > qemu-xen in dom0 (see libxl__spawn_local_dm()), but it was missed when
> > adding qemu-xen support to stubdomain. Adjust libxl__spawn_stub_dm() to
> > be consistent in this regard.
> >
> > Reported-by: Neowutran <xen@neowutran.ovh>
> > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD


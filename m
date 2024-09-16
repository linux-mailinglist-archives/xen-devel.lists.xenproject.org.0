Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE1C979EB2
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 11:50:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799372.1209369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq8Mu-0001TT-Uc; Mon, 16 Sep 2024 09:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799372.1209369; Mon, 16 Sep 2024 09:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq8Mu-0001Pn-RZ; Mon, 16 Sep 2024 09:50:04 +0000
Received: by outflank-mailman (input) for mailman id 799372;
 Mon, 16 Sep 2024 09:50:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CfyS=QO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sq8Mu-0001Eg-7C
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 09:50:04 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bb7a47e-7411-11ef-a0b6-8be0dac302b0;
 Mon, 16 Sep 2024 11:50:03 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2f75c6ed428so27933941fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 02:50:03 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f79d3254a0sm7303371fa.60.2024.09.16.02.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 02:50:01 -0700 (PDT)
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
X-Inumbo-ID: 0bb7a47e-7411-11ef-a0b6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726480203; x=1727085003; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ysfPOL1Ics1l3O22ctGA9jO/0yJCXJSQsMlw1/0A5dw=;
        b=OClNoaFySPKsN8g7TF3K12jO/jcrk5o6FsJgiWF4PSIeY7ft8FKGne5UBtI87jiav3
         QQ0mrYY3yFjlsMElNOd4l82KeioHNYfqaJfE/gWhOPBUYBvasPIF3VRo3mRGP2iUOk+e
         ai2pe06bL/YjWTVM+HdlR8cx8T1DaASQXZ0Z/Obltojfx/PTrHdmFlqdY7BYhzSenS8m
         T0I3zM3Vkns3J4A5Bkb7cVF8JnJtHq2eNX0PYgAyStG0JhpQ1HnvZYQXtplRdeFz71L0
         ECzuOlB7Nn9Teey2bu7gcF/w2UWzKBuAoJ05tJVc9bcPGmpqhLxdxrj5wnxHWD9ROav8
         bMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726480203; x=1727085003;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ysfPOL1Ics1l3O22ctGA9jO/0yJCXJSQsMlw1/0A5dw=;
        b=XXqq4CKuP3pakbqOao3ONWEuBh+bw/hbQBHZvexK5SNB3Tbk+Ge/1yWm6jZVBzQExA
         qZiDQ8VC/upDpt2yCmJLuOfo+Q3D6q9xwCdJg9tfc5B/ck4JDJLOqliXkp5lWM09ineq
         X/FasBzuTXduPHhmWthvdjlmC47AG0IggZsFyqmMvqqiFxT0u5xqC1c9GxrrSkmi0CHM
         Rvq5fnb+1zQXAQb4MxeR0uAq6LzsxVsMdtzeS0u/SyE2JLmYD2YtO5CrO3Lgx+TzdZxu
         UYF4Y5ZENrtaHMhoUgi/LdZorh5bmvJctdGYLFRECk2hJULSF1+JwJE67p9FH+Z3lgZh
         9fGA==
X-Forwarded-Encrypted: i=1; AJvYcCVUcsK4R7kxG3h09DnWfABROZQWj9bF1d+QRF4mznEeDnGWpm3Do/DkZ7OrjwQCUxF8RI8rb8FUlIQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcKTESNzDh77Gh0SaLaX0zc5VzcYFNNv1ATd9najRUSmiG21qQ
	sxedQp1/g1YDYlE81HR8I0DnrD1zjBb6s9PM99/z+ybeFk8sllMI
X-Google-Smtp-Source: AGHT+IHGC+G7x7Xv4C50yZZ4asVSMDH29gItdXMXY+VaXjM4/Wgv4+iPqUZIarTYTXcuveUNyAhDZg==
X-Received: by 2002:a05:651c:b0f:b0:2f7:51c2:fb08 with SMTP id 38308e7fff4ca-2f79190779bmr48747951fa.12.1726480202177;
        Mon, 16 Sep 2024 02:50:02 -0700 (PDT)
Message-ID: <20c2ebafcdb5e036969f02dd7dac39ff8a6b9dd4.camel@gmail.com>
Subject: Re: [PATCH v7 3/8] xen/riscv: set up fixmap mappings
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Mon, 16 Sep 2024 11:50:01 +0200
In-Reply-To: <1b62f8bf-1dab-47a7-9016-b495757132f9@suse.com>
References: <cover.1726242605.git.oleksii.kurochko@gmail.com>
	 <779334f22d3770f7de6a630d2e6ace20c95bb32b.1726242605.git.oleksii.kurochko@gmail.com>
	 <1b62f8bf-1dab-47a7-9016-b495757132f9@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-09-16 at 08:32 +0200, Jan Beulich wrote:
> On 13.09.2024 17:57, Oleksii Kurochko wrote:
> > Set up fixmap mappings and the L0 page table for fixmap support.
> >=20
> > {set, clear}_fixmap() is expected to be implemented using
> > map_pages_to_xen(), which, in turn, is only expected to use
> > arch_pmap_map().
>=20
> Now you've left out what you actually mean to justify here: The
> exposure / direct access to xen_fixmap[]. I'd also suggest to
> drop "only" - I guess I used that in a reply to v6 to emphasize
> what I wanted to get across, but it makes not as much sense here.
> Instead adding "during early boot" at the end of the sentence may
> provide additional context.

Agree, it will be better to  return details:
   Modify the PTEs (xen_fixmap[]) directly in arch_pmap_map() instead
   of using set_fixmap() which is expected to be implemented using
   map_pages_to_xen(), which, in turn, is expected to use
   arch_pmap_map() during early boot, resulting in a loop.

Probably it would be better just:
   Modify xen_fixmap[] ...

>=20
> > Define new macros in riscv/config.h for calculating
> > the FIXMAP_BASE address, including BOOT_FDT_VIRT_{START, SIZE},
> > XEN_VIRT_SIZE, and XEN_VIRT_END.
> >=20
> > Update the check for Xen size in riscv/lds.S to use
>=20
> Nit: xen.lds.S
>=20
> > XEN_VIRT_SIZE instead of a hardcoded constant.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> With the adjustments (again doable while committing)
That would be great.

> Acked-by: Jan Beulich <jbeulich@suse.com>
Thanks a lot.

~ Oleksii


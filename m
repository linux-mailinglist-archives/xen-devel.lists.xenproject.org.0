Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0EE80EEED
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 15:37:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653176.1019517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD3s9-00029x-CM; Tue, 12 Dec 2023 14:36:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653176.1019517; Tue, 12 Dec 2023 14:36:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD3s9-000271-9e; Tue, 12 Dec 2023 14:36:33 +0000
Received: by outflank-mailman (input) for mailman id 653176;
 Tue, 12 Dec 2023 14:36:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=28/Z=HX=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1rD3s7-00026t-Qh
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 14:36:31 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d709c7f1-98fb-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 15:36:30 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-54f4b31494fso8713978a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 06:36:30 -0800 (PST)
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
X-Inumbo-ID: d709c7f1-98fb-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702391790; x=1702996590; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jfu+d5q+ATVBjZRGtGSVS6+3GtIPGgV5XHh9rm3Ob0M=;
        b=u8hvRlQg9cRpXxdKNci7OFR+QTboYfSsQ1sYvqodFkSklcTujXJ22dzTVpaqKIKYGz
         lNiPB00JI3vAO3tzgH+0TuIwDI+NhE86wurtqxg6MeytFJNz96jKpjFylkHx81LbDQA5
         ywlAA1LKEcgbztfFkP9RpGxriAtmjgVn0kgZuxsldsoxTPtr5DGB23LncHEPuJyKgVoz
         VoD9fkoJhJHjvQND/5+HrpPE8a2tMb1+Cd74HiugSoE8JHMnhL6KmuR+BCs7qsfhSW2T
         eV03273gYiJkCJ9AVQecTC0r2OGE0ODCK+Dj6APRpcm55p0rkIcrS9CgHTUyVYITTeJO
         G9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391790; x=1702996590;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jfu+d5q+ATVBjZRGtGSVS6+3GtIPGgV5XHh9rm3Ob0M=;
        b=Wnx2+efnuFIvsmvBq+pJ3qqXwpg2igmN7/ZjfNkAvu7opFSk8NaY4hFgEQj8ejc/z7
         TS4DmKBJsK73EM5jC4A4/Hy9JcRr3h9FhY4cJjm7by7YH6bTVE+iZR6NO73Bm8ARwB/e
         TiMIywSRqoBm2ymzx/C7Kb9hPFJayAZg99nGHKfycVo+/Med9s2kpwDs+THO2rnlQIN9
         sbbuYgzj+JM2rlIAchTnEa7gWEjefcooT/tvncDw13PWJH8n1w4LHl8JGxSjJYDNL3L8
         8rlXntq9RkGAnakGN40neRI476sqjPAojG3nQ1ZNp/SsOfLG9tri3Pgt6VWKyo/hQTng
         C5wQ==
X-Gm-Message-State: AOJu0YzOq2iKYRgRaLtOTE78utBVkM0AH9CQp7eQAmVePzmdMcRMLywb
	A41/jawSly7tdwKJ+r7tEoX/E6GYJSxuVArJGFh5Vg==
X-Google-Smtp-Source: AGHT+IGhq9e48cyEEjI8jFQhQfihQASqsNz1kSvcg0h9SepYEIBOPXeynJFJJItwP/dGfKFoACADRfw1c/HXJuBVdNo=
X-Received: by 2002:a50:d652:0:b0:551:cf4a:7956 with SMTP id
 c18-20020a50d652000000b00551cf4a7956mr393108edj.19.1702391790190; Tue, 12 Dec
 2023 06:36:30 -0800 (PST)
MIME-Version: 1.0
References: <277e21fc78b75ec459efc7f5fde628a0222c63b0.1701989261.git.m.a.young@durham.ac.uk>
 <ZXLg_YCHM-P6drQV@redhat.com> <alpine.DEB.2.22.394.2312081422490.1703076@ubuntu-linux-20-04-desktop>
 <8be72952-88b6-4c74-b696-fecfa8313c96@perard>
In-Reply-To: <8be72952-88b6-4c74-b696-fecfa8313c96@perard>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2023 14:36:19 +0000
Message-ID: <CAFEAcA_1cKWJbjbhnX3A0kjzf_qp7A2rVqPZFHo21dVLb9DutQ@mail.gmail.com>
Subject: Re: [PATCH] fix qemu build with xen-4.18.0
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Vikram Garhwal <vikram.garhwal@amd.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Michael Young <m.a.young@durham.ac.uk>, qemu-devel@nongnu.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Dec 2023 at 14:20, Anthony PERARD <anthony.perard@citrix.com> wrote:
> Building qemu with something like:
>     ./configure --enable-xen --cpu=x86_64
> used to work. Can we fix that? It still works with v8.1.0.
> At least, it works on x86, I never really try to build qemu for arm.
> Notice that there's no "--target-list" on the configure command line.
> I don't know if --cpu is useful here.

You should almost never need to specify --cpu : configure
will work out your host CPU architecture by looking at what
the host compiler defines.

thanks
-- PMM


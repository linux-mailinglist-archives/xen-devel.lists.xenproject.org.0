Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BA06AB66E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 07:40:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506645.779728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ4Vx-0008WA-HD; Mon, 06 Mar 2023 06:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506645.779728; Mon, 06 Mar 2023 06:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ4Vx-0008S4-Dq; Mon, 06 Mar 2023 06:40:05 +0000
Received: by outflank-mailman (input) for mailman id 506645;
 Mon, 06 Mar 2023 06:40:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jcWU=66=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pZ4Vv-00087y-Qo
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 06:40:03 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b971db0a-bbe9-11ed-96b4-2f268f93b82a;
 Mon, 06 Mar 2023 07:40:03 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id z5so8497002ljc.8
 for <xen-devel@lists.xenproject.org>; Sun, 05 Mar 2023 22:40:03 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.189.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.189]) by smtp.gmail.com with ESMTPSA id
 o1-20020a05651238a100b004deead111f5sm1500787lft.289.2023.03.05.22.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 22:40:02 -0800 (PST)
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
X-Inumbo-ID: b971db0a-bbe9-11ed-96b4-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678084803;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jx2kT/6gKG1S1vNI57RuAVKVW0rSCySr2R/KQymdUjk=;
        b=LYmgRFbDfbFubTfwdk+cEkr6THb63x+BzBVz/Hub4ySZPJiEN9BEsddFvVeR6vMBWC
         5Yjxp5OmkEO/NZnxUCkUEj++/ypGZQv31x8b7qbn4873X/Hel8uWBg4kwtoYX1poB46n
         b/lT/3S3Zh8tGAiA1hUx1NwNoxu3p02s3H9e8gjo9V5QbvoyyGkyh53A6/Z5Efa9Xh4P
         Z2iA6s65GUkyWKDyTx2KCvAmtkQNKIMbtQZ58kBnrgL/FoJrS5YtMXy8Mro9dzbGb8B7
         B4gG1YtQgVMbQAtSaRsMuAZ8q78KMe+kQ/E73QjC/lm5LEKf3MzKex3+t9JAv2dfXJlR
         2Jaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678084803;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jx2kT/6gKG1S1vNI57RuAVKVW0rSCySr2R/KQymdUjk=;
        b=DWlk5XzdXZtGUfbXhc/PIy2UQ8cTsidDhLAG1VVw0KMMv4TB3rwWsTvhWvhCEuMctP
         EBy2NmEgJRiw7wqFOgXQNT52T5EScluSL9u3PSdzJVN7Lg11vUPXwtLfoJAjYxe0Ylcg
         LeJpOoLbf+X9flZ2GWdXQUSI53H1prXbttx7OzpMlm8T1cq+hL1r2DaLAOB82wz78Vec
         pxFiSZtSaDZiHsZH3/J9i6ihFXbb3dBqP+BtX/tE2i0Os8S7ocUdmED9SahqAyyA0hAz
         j7tOfaYDcUoWkz0uJP7TY2bUTTxlgibOrCUJ9L1Iia9oLzDEWlrbgWYvzxOwBwJFJfym
         X0pg==
X-Gm-Message-State: AO0yUKVfG02ZP9WIV8ktXleWFg81Ax1QbE1KyfI3qBe35s1NDgBKcgUU
	Jwvt7iY1ftp52u7hW4SRbBk=
X-Google-Smtp-Source: AK7set9OC+7fyEIAEpZI+rb19qhrFqZJjva/Ip92LgLcNsQUX0HdGZeT6bBbSJhEbqDycFuw3ElbJQ==
X-Received: by 2002:a2e:b00e:0:b0:293:50e7:3d07 with SMTP id y14-20020a2eb00e000000b0029350e73d07mr2658526ljk.14.1678084802603;
        Sun, 05 Mar 2023 22:40:02 -0800 (PST)
Message-ID: <4d82290b38d21dc4cc7a0c8a3ce87eb2a86536cd.camel@gmail.com>
Subject: Re: [PATCH v1 1/3] xen/riscv: introduce setup_initial_pages
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>,
 xen-devel@lists.xenproject.org
Date: Mon, 06 Mar 2023 08:39:59 +0200
In-Reply-To: <a37cdfda-f516-2098-2b1a-bb8a69a049ae@suse.com>
References: <cover.1677250203.git.oleksii.kurochko@gmail.com>
	 <a145fbbfb166d9f6bd4859b669d23a1f52004b2b.1677250203.git.oleksii.kurochko@gmail.com>
	 <fcd149ee-b95e-4488-c1c1-c2122843fa5b@suse.com>
	 <a37cdfda-f516-2098-2b1a-bb8a69a049ae@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-02-27 at 16:19 +0100, Jan Beulich wrote:
> On 27.02.2023 16:12, Jan Beulich wrote:
> > On 24.02.2023 16:06, Oleksii Kurochko wrote:
> > > +static void __attribute__((section(".entry")))
> > > +_setup_initial_pagetables(pte_t *second, pte_t *first, pte_t
> > > *zeroeth,
> >=20
> > Why the special section (also again further down)?
>=20
> Looking at patch 2 it occurred to me that you probably mean __init
> here.
Yes, you are right.
>=20
> Jan



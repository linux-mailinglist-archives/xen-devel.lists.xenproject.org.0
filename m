Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD519989C6A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 10:15:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807084.1218285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svBYH-00075c-Rq; Mon, 30 Sep 2024 08:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807084.1218285; Mon, 30 Sep 2024 08:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svBYH-00073r-P9; Mon, 30 Sep 2024 08:14:41 +0000
Received: by outflank-mailman (input) for mailman id 807084;
 Mon, 30 Sep 2024 08:14:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdoV=Q4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1svBYG-00073l-4V
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 08:14:40 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08627ac9-7f04-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 10:14:37 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5398939d29eso2685103e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 01:14:37 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-538a044176csm1163125e87.269.2024.09.30.01.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 01:14:35 -0700 (PDT)
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
X-Inumbo-ID: 08627ac9-7f04-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727684076; x=1728288876; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Biu9VC/O+lb92Qibt/YkD9f5jj583OG9ZN7gKlLCUWE=;
        b=h0K41LwS2jYUDH8tEoR2WOvRZHi6QhsV99UQkYXuxkIUrldenRA/ahBUZrynRhVgfu
         mtXDNx8IVpTRg9eHoPQ993Otv8msyPpCnF0GGQWFLRy7gVokJrhZVJ+q9td2OXH0tnvI
         roZ47lwl+QAsqilT+MBK1yiWHRKlOnBoUJI5ljmfj8AVKdSEUiDx6F3QwW6V86Vv7Klp
         CtyfrcXCjlHHQwqmI2AwYZGaw6Jnxnyh1/Xuf5CwBEfjJPO65d1p6tW+qpZgAL9TnDnh
         0uihk3iFcgaTRZ+AaWKn/a2LRDkijWWAPZDmJQjYKro7m9G7w9Ou+0kabFYKxtlEd8MP
         tdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727684076; x=1728288876;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Biu9VC/O+lb92Qibt/YkD9f5jj583OG9ZN7gKlLCUWE=;
        b=Tx2To+8bLz9JYqTGEyO7Q4oheAY3zDHUxPUgasnPES2AwpTmzC6WrEHSN69elz2yQ/
         c7QcRqzvYEC7tcJaAzdJvE2ZHL52r+Mo/uhgwPixCKSTqnIzqEobINg2Rx5YsctVkezJ
         ZR59pJ9J0F9WOnhIolCWOyeKG1K2llUyj7AA/HISfn6O9UcWGTtKS19dBeWEvLqkcMKn
         DCBOUAlFOC5pRXv73vWFKV0wqHmVbSD+8BkDod++rf23ycg9ahNU799OpqCt4JdQ3APz
         jz5Jsflv4KEH7haV+zmaGHEKav//f8dspMs2pxctJsOXwoL/P+7m/vaHIUYq41ZkYdSw
         zPdQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2e7bwZq3F31qfAgNm5aJb3dOhJtnsHv7vodZZ/BxE85Ho8jsj45Qr3I44pmH4Wd4sk0ynNHfVjfY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwolLB/1IgkWP0gF4pOigD0Uqy8mmPFb7ejG3zfZH1xXcOVLDQK
	VQOoQuD+rrl8kdoq8xJYdzVRv8CB+JJnVj7JLYu8Jvi1YKGI/t+A
X-Google-Smtp-Source: AGHT+IG1HintTBuYtsRQnf5zu0h3q/ae7teZVadipCYWN2PVGjGynYrULG/1be6LOe/Z2uwp2Mc1hg==
X-Received: by 2002:a05:6512:ad2:b0:52c:cc2e:1c45 with SMTP id 2adb3069b0e04-5389fc3c274mr4980088e87.15.1727684076042;
        Mon, 30 Sep 2024 01:14:36 -0700 (PDT)
Message-ID: <ce42c8d7bee27917b7ed48f8cf1039a4f5c78dfa.camel@gmail.com>
Subject: Re: [PATCH v8 0/7] device tree mapping
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Mon, 30 Sep 2024 10:14:35 +0200
In-Reply-To: <db29de6d-5feb-4972-b60a-012f0dd9a307@suse.com>
References: <cover.1727449154.git.oleksii.kurochko@gmail.com>
	 <db29de6d-5feb-4972-b60a-012f0dd9a307@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-09-30 at 09:27 +0200, Jan Beulich wrote:
> On 27.09.2024 18:33, Oleksii Kurochko wrote:
> > Current patch series introduces device tree mapping for RISC-V
> > and necessary things for that such as:
> > - Fixmap mapping
> > - pmap
> > - Xen page table processing
> >=20
> > ---
> > Changes in v8:
> > =C2=A0- The following patch was merged to staging:
> > =C2=A0=C2=A0=C2=A0=C2=A0 [PATCH v5 1/7] xen/riscv: use {read,write}{b,w=
,l,q}_cpu() to
> > define {read,write}_atomic()
> > =C2=A0- All other changes are patch specific so please look at the
> > patch.
>=20
> Except that afaics none of the patches has any revision log.
Would it be helpful if I will send revision log as a reply to each
patch? Or it would be better just to re-send the patch series?

~ Oleksii


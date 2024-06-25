Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D519169C9
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 16:03:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747805.1155309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM6lA-0005ud-TB; Tue, 25 Jun 2024 14:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747805.1155309; Tue, 25 Jun 2024 14:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM6lA-0005sN-Q4; Tue, 25 Jun 2024 14:03:00 +0000
Received: by outflank-mailman (input) for mailman id 747805;
 Tue, 25 Jun 2024 14:03:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sI+y=N3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sM6lA-0005sC-92
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 14:03:00 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a07293f6-32fb-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 16:02:58 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a6f8ebbd268so1088704866b.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 07:02:58 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fe3d2a8e7sm399821266b.111.2024.06.25.07.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 07:02:57 -0700 (PDT)
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
X-Inumbo-ID: a07293f6-32fb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719324178; x=1719928978; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5Z9ygOOdPx7D8HTx4hL6hIuzyJCQomPtIrQdtQbh/JE=;
        b=bUrTvYM2XX4OhGPgnqew/uXTaB4FkkDT1f6oi2Ew/EosF2VERRJa4zkkSEosil4odi
         K99nS5p0QfWmM4/UCxuZ/SIjRr8rj2FmxUhgMjZc5hA+HO8mPq0gL/50pHF+kTvDyKJs
         mDo+q8k/kQk8p0zfgNU4mzkT4ihaUtbUzGcbzxan3FAQ+ZyxHB/y+IeuVOtjyCYmZhCi
         Srbeq2Gq+OcHT46B8SNXqEQNRaV+cAJwiIvPVd4qrUW4keN4iLGLjcSQlCI5rEmEnLFQ
         pRUyLspElp6pO5fuYoEj9Z5Ci5RRAG+M4xJt6cSeju9wz+9f3YpGcAuDrEX6CpLrh7vr
         /+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719324178; x=1719928978;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Z9ygOOdPx7D8HTx4hL6hIuzyJCQomPtIrQdtQbh/JE=;
        b=Impz4SOBopPaeaVbTDbbyz1qw7AujDOOp3MSSUyh97uYIP2d5MTQIJAhuWibNelSun
         rvcnFd85GRb3CWjk+kmC0ZdhCd3VWB/O5p4USpeLl2q3yTPmK/X2koX3JPmdTzmmotQk
         TFIPD6kDAcARFQHauBDLU5pcHPUQn4O99NjlJXCqKVIm6NMkKaOEAlZCueAPX71ynPWA
         xLeev/B68JAMkKP4xQYOXf+gk6dYXf7bc5OVS28CcXTNjXVyc17oLBeFFHs0rh3DpHR4
         Fc5y+a+2cKgmlFFtU2stXvY59zEtYY4z2H2qdbvHI/NSLuDDsQFKCKk4XtvKN4n5zoOv
         kULw==
X-Forwarded-Encrypted: i=1; AJvYcCWK95NQl4IFRe0TwMRK65Lt3PZXFrlibVKsy6ncDurT1c9xhiKc8naRp0v/EnJj3e7keUbENqWBpsDQNJHE5TyKgzUKzDfN6aRuBzGXxIk=
X-Gm-Message-State: AOJu0YwN+Oh34b3NBOzFzlkF8JwJiwQ8GudEl5Cyq5hYgtbTdith/SJW
	5a7GJOm6aWq8MD4ZoHlC2y9GoqxFi4PvPCv5kMw2ySGiU0b6OUE/
X-Google-Smtp-Source: AGHT+IH1mLt1AhRgskzYMQDxS0jQXQTC2f4ReMwn5kbBAJh9IS/Bz6BKCJHjBQeP9wpllg6pglGcxw==
X-Received: by 2002:a17:907:d1a:b0:a6f:6337:1ad5 with SMTP id a640c23a62f3a-a727fc7a97cmr34145666b.27.1719324177536;
        Tue, 25 Jun 2024 07:02:57 -0700 (PDT)
Message-ID: <60b60f2cb8f44126b442259fbc1c878b8166b7dc.camel@gmail.com>
Subject: Re: [PATCH for-4.19?] Config.mk: update MiniOS commit
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Samuel Thibault
 <samuel.thibault@ens-lyon.org>,  Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Date: Tue, 25 Jun 2024 16:02:56 +0200
In-Reply-To: <c0519803-8753-4933-8193-fa036f626b36@suse.com>
References: <a98ab069-407b-4dee-9052-40ab72890d47@suse.com>
	 <52373e0cea119ff04ebb997f3d0aea6bd3c9dc41.camel@gmail.com>
	 <c0519803-8753-4933-8193-fa036f626b36@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-06-25 at 10:26 +0200, Jan Beulich wrote:
> On 25.06.2024 10:10, Oleksii wrote:
> > On Tue, 2024-06-25 at 09:57 +0200, Jan Beulich wrote:
> > > Pull in the gcc14 build fix there.
> > >=20
> > > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > > ---
> > > Probably nice to reference a gcc14-clean MiniOS tree from what is
> > > going
> > > to be 4.19.
> > I would like to ask what do you mean by gcc14-clean here?
>=20
> Being able to build successfully with (recently released) gcc14, out
> of
> the box.
Sorry for not asking that in initial reply.

I am still confused with "from what is going to be 4.19".

Are this words about gcc version used by Xen itself?
If yes, then before this patch gcc version of Xen and MiniOS was the
same?

~ Oleksii


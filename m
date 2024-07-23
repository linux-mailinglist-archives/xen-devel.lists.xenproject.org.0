Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECBF93A0B3
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 14:58:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763164.1173408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWF5k-0003OU-Oc; Tue, 23 Jul 2024 12:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763164.1173408; Tue, 23 Jul 2024 12:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWF5k-0003MW-Lf; Tue, 23 Jul 2024 12:58:08 +0000
Received: by outflank-mailman (input) for mailman id 763164;
 Tue, 23 Jul 2024 12:58:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v/3h=OX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWF5j-0003MO-G7
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 12:58:07 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33c017b8-48f3-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 14:58:05 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2f029e9c9cfso751871fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 05:58:05 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c95088fsm533833666b.212.2024.07.23.05.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 05:58:04 -0700 (PDT)
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
X-Inumbo-ID: 33c017b8-48f3-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721739485; x=1722344285; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eLjU1GrQIEeME2On3WmG/n+4CYiWPby0mGCJwnoMmx0=;
        b=TP/GBJTYHLQ6ubWljoXC0jWgwBr37t8RYni4+9mG+a/06GRLqTHNWvef9wP4OIoA9z
         Du41ex1/N9kWgBuaiw2rlfnHAx7a0UhJFR/6kpsl0NauU8BYuJxRlx6Rc2x3QV1p9ghX
         Ia6jYHKBtfTToMuNTs12/iP7IJHLrQ05TZZ5HyBoBpDQ9xBlQPI0AAPZWrlH8ua4ynYB
         7NmoaeEPJ1uZMNVb2P4LB7a6I621Fg6r3pcrLkJWNSLApG9gD3yol+qJ2erx49YaBT1r
         +DkVkvpF1IY1nDWUb9BzvtD9TEQmjS7m26LAaZKAmxMkx9NO5f/Z+F253bhGlEfSrHXz
         GYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721739485; x=1722344285;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eLjU1GrQIEeME2On3WmG/n+4CYiWPby0mGCJwnoMmx0=;
        b=VSjnzEVI1mQ/3KujxwZTZAYLGC1a9KQ9pz6PDz7w/vclQc4C1y7CVp0l9P9szGDn4f
         4lAerq0YvV0v/dyuWaQnShXvzrQvwQPgDROemvTZZx6xrHVdQ+8xWr1nwVTwYHt2WPys
         PK9TZYobRrka72S7uq4bJkA9i9Hy12pNoPvTlDP/Stt95OTUrdhqx5dDXjDV2hmlm3qO
         0e3Py6LKQdin3jPRxaycOrUolBnQKAf6Z3Tb0LGPv8dMRnSEE8JwPsUSO6sxU7iqk3Ee
         vLrHujFU18VQPeZ1Oau8xO3gIqMSUx8+Pr5pTG+TEY+L9R4f1H09qKkoHJsthbk8TCz8
         nIVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCqcePfXlLQbzpa9Msy1YkWhVEu+tr8CkXFj3DnjYZkSgSdCbv0BAQoAxw6Ot+qurE5QydOUH97oHCIxf10iU/tXeTdphEGx8zDy97V6M=
X-Gm-Message-State: AOJu0Yxlbirkbo3/yp7nzogPv5F0WBRXJo/7dX4Oyn+jDBKPzbsLzfEh
	cWirPWNQK2+tCkchS6ulM1qk61EUspq/suiKE7K8FUgWAINt7G9A
X-Google-Smtp-Source: AGHT+IE9Se+nkDKMQrGgONUEaVncIJvgJdzx0LUGIN05FVWT4lVSokVzP8PFSjR+5upHKewu5XQwgQ==
X-Received: by 2002:a05:651c:1a2c:b0:2ef:2b65:1d03 with SMTP id 38308e7fff4ca-2ef2b651e57mr76036571fa.49.1721739484651;
        Tue, 23 Jul 2024 05:58:04 -0700 (PDT)
Message-ID: <819ec33e568b54aba355bc2189b3d760ec294fb0.camel@gmail.com>
Subject: Re: [PATCH v2 4/8] xen/riscv: setup fixmap mapping
From: oleksii.kurochko@gmail.com
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Date: Tue, 23 Jul 2024 14:58:03 +0200
In-Reply-To: <8fd1cc2c-9dda-4e74-b242-fe8aa862955d@xen.org>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
	 <b1776fb20603cb56b0aea17ef998ea951d2bbda9.1720799926.git.oleksii.kurochko@gmail.com>
	 <8fd1cc2c-9dda-4e74-b242-fe8aa862955d@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

Hi Julien,

On Sun, 2024-07-21 at 09:46 +0100, Julien Grall wrote:
> > +/* Fixmap slots */
> > +#define FIX_PMAP_BEGIN (0) /* Start of PMAP */
> > +#define FIX_PMAP_END (FIX_PMAP_BEGIN + NUM_FIX_PMAP - 1) /* End of
> > PMAP */
>=20
> ... here is seems to be inclusive. Furthermore if you had 32-bit
> address=20
> space, it is also quite easy to have to create a region right at the
> top=20
> of it. So when END is exclusive, it would become 0.
>=20
> So on Arm, we decided to start to get rid of "end". I would consider
> to=20
> do the same on RISC-V for new functions.
I assume that you wrote here just as an example of confusion occurs
because of using *_END but just to be clear I have to leave
FIXMAP_MAP_END as-is because it is used now by common code.

~ Oleksii



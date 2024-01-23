Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 484BB839571
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 17:54:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670543.1043412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSK2l-0008E2-Ob; Tue, 23 Jan 2024 16:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670543.1043412; Tue, 23 Jan 2024 16:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSK2l-0008BH-Ll; Tue, 23 Jan 2024 16:54:35 +0000
Received: by outflank-mailman (input) for mailman id 670543;
 Tue, 23 Jan 2024 16:54:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OrDF=JB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rSK2k-0008BB-4m
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 16:54:34 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15032c54-ba10-11ee-98f4-6d05b1d4d9a1;
 Tue, 23 Jan 2024 17:54:33 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-55a44bb66d3so5146614a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 08:54:33 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a170906380900b00a26ac037ff3sm14566974ejc.132.2024.01.23.08.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 08:54:32 -0800 (PST)
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
X-Inumbo-ID: 15032c54-ba10-11ee-98f4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706028872; x=1706633672; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3yBPwjjf3tOsodoSZNCQO0JkgQh8fcuZFMGoslrropY=;
        b=FBiHUHdymYa/I1oYXUDBvAuN84uc1tYnI7gh47hOenKss4fa8YddK4yj1BYgKYYVxN
         dPJv7lImWdplOmIKUsVPXGVDV76pmRvm4jp33SVsBoHFoECC8dNvNGjOAEOsR5vMIzr1
         9qqaOpJGxyXP82SvikJ0CTZ1ZdP23COhAQicfe3ztf0TdQh1uqJ324onWkNK9iwIz2qf
         TAMltmpapBQSyC+Ot1Eh8tCGJ1cF9RPJBqTAfDq+kqKH8gicPNMPHbh2GuxLMRUmX6xG
         sUN7X0CGfPYrt9KATvFmPYJLBfg1XlGzaE3cVOLyUJXLHweMl1zHqkPqu4a/lbIdl/Tb
         n4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706028872; x=1706633672;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3yBPwjjf3tOsodoSZNCQO0JkgQh8fcuZFMGoslrropY=;
        b=PBpn+F8VS/aQNYAv8jsvvf+J/OFOeFI8v1Ah7yb7cr5MdNrNgAMZXOV4sBx4bTUcS6
         bu4EwFp1YxJoejGDckyBKuLnZ8EKTRBp+rAjIr9btC1edniCBf3xDl8qzVqzwASrkPB3
         1FRZ7WjGk8utRKAjiYsj51WyQBa8S1cuIa8b0H45MKg4EyjHVb53tlqvWOcVfoty4ffA
         GLb6EUguHWpFjjWh/KT6qKNUdj6y5uc23l+5ZRaniG4429z3pjkMM4Fzo323MLXFgPpJ
         EqW6SUre/KdPTGQVw1lsgpgoDYTCsID9BWDuhfcpxXa+WW1C6v3ncUd4yrRvNxKuRj9e
         xYzg==
X-Gm-Message-State: AOJu0YwwNvMgvaucpzk27xG9RBbnpriQv1DI/990fC/hK1j0vl3GKwaY
	4oZn8LX14B4H+wHJOu7uDWLzzDvAC3ovmTba7An8eOMkLERJ1YWkOnthe5ESn4I=
X-Google-Smtp-Source: AGHT+IFqWLFxBywy5Tu8MKwIDTucD1dcC3aIyvzUdgMFV0lWlQZKPc0K6qfD0FpJxU9MgtBtnY8Uhg==
X-Received: by 2002:a17:907:9054:b0:a2d:7bb:8810 with SMTP id az20-20020a170907905400b00a2d07bb8810mr63597ejc.155.1706028872581;
        Tue, 23 Jan 2024 08:54:32 -0800 (PST)
Message-ID: <c7004f13d082535cebd50fbe0e2446e3af78e48d.camel@gmail.com>
Subject: Re: [PATCH v3 29/34] xen/riscv: add minimal stuff to page.h to
 build full Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 23 Jan 2024 18:54:06 +0200
In-Reply-To: <0740cab9-be2e-4aae-8b03-e3ec95d0b0ef@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <7aa26bdad9bf923fd57f7a90e41c049cab0cd5bd.1703255175.git.oleksii.kurochko@gmail.com>
	 <0740cab9-be2e-4aae-8b03-e3ec95d0b0ef@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-01-23 at 12:36 +0100, Jan Beulich wrote:
> On 22.12.2023 16:13, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > Acked-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > Changes in V3:
> > =C2=A0- update the commit message
>=20
> Once again I find this puzzling, considering there's no commit
> message
> at all.
By the I meant that asm/page.h was changed to page.h

~ Oleksii


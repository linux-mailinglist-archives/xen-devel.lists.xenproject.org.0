Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7D0838E73
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 13:25:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670434.1043202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSFqQ-0007oN-1y; Tue, 23 Jan 2024 12:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670434.1043202; Tue, 23 Jan 2024 12:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSFqP-0007ln-SL; Tue, 23 Jan 2024 12:25:33 +0000
Received: by outflank-mailman (input) for mailman id 670434;
 Tue, 23 Jan 2024 12:25:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OrDF=JB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rSFqO-0007lS-F1
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 12:25:32 +0000
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [2607:f8b0:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ef270c5-b9ea-11ee-9b0f-b553b5be7939;
 Tue, 23 Jan 2024 13:25:30 +0100 (CET)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-361b0f0f971so11336785ab.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 04:25:30 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a634750000000b005c21c23180bsm10079813pgk.76.2024.01.23.04.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 04:25:28 -0800 (PST)
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
X-Inumbo-ID: 7ef270c5-b9ea-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706012729; x=1706617529; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4OmCmFMKBTihaNEJ6ZgHoztuSwIbY/vbwPP4+PSVKAI=;
        b=bGmcpQi4i8QMM1aEAvQjWvA8wGdEBburqSrhUlbwIrB0ZdUfwu/OpyvyRKRgT9bc2N
         ujBBTgerjN91nLogXra4gDQqTWyI8w47a9F1m3Q8QpG+jJra6f/Vr7a5KIWKJT4ZJHuU
         bSB4sHql8TwlyLvWbOoX7N10W380JQXYiexZPKwC8AvZ67LavgYi7V69xpO2a+YTP10W
         t7CgEn60lv7dxdHUGxNDa1AC7RqTQ0Y4nKKQikEO1Rbju1OIbwkxy8lREcCx/w1Qmjr/
         StmreHVimVX3HrYcPrySA6n0NkplzJndugMQgNBWew2tBrz0EBCDGXsZnGM/yiZvnVS5
         Iabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706012729; x=1706617529;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4OmCmFMKBTihaNEJ6ZgHoztuSwIbY/vbwPP4+PSVKAI=;
        b=lOAMw778vXOWVZBfWhxRqBQf9H0QDQltCn8LlrHw6QnKpVsRAe9JXPwMnzIflIAm9g
         k3qvG11ydbGldXo3VsPK9LJCsABJN3ge+5v0z3OlWFwB6CR+0PditMoIKr88AkOhkwEv
         sCDjohpHBJHOpMSW7MMisW6b7SMT83GDfH1rTITUhbQMNEEVPzVtdbKY/Ha1uPPKQR2v
         vgYTq+vvxLSA4+E2d9j+D/aTJYYFBADy2oogqVbC1nXY4na9K8rVgttnkoHS2N3HpFve
         4KvdOcziyRZJoyRNGUJiFavcR6ze79gIuZj+scupKR0wbRxWjWg/1B3tGmuTJ9MFHw0r
         q21w==
X-Gm-Message-State: AOJu0YyET9kixssL3UL4c7eyTQI21+zmSHFU7BC7+jLw+/QXje4kWwCI
	0sBPUAJ52zjpHnKRxHynBJKRx/ruqBj2vSpb37nQzwDDP4YfMdQz
X-Google-Smtp-Source: AGHT+IGubLR4N/FqV7UTy3KaOXItqgB1rVXqH01h597cOTcFIuzsW/SAfe92kMr4FFvE9ytdYPypDg==
X-Received: by 2002:a92:c08c:0:b0:361:a88b:33f9 with SMTP id h12-20020a92c08c000000b00361a88b33f9mr7368684ile.19.1706012729325;
        Tue, 23 Jan 2024 04:25:29 -0800 (PST)
Message-ID: <b355bf2d404fba4c866433cac8805c508275e98a.camel@gmail.com>
Subject: Re: [PATCH v3 20/34] xen/riscv: introduce irq.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 23 Jan 2024 14:25:24 +0200
In-Reply-To: <a9e80aeb-67e1-453f-b8be-1c6295d95dff@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <11613eb5a0378315d70fc2f4d4f744ede579cca3.1703255175.git.oleksii.kurochko@gmail.com>
	 <a9e80aeb-67e1-453f-b8be-1c6295d95dff@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-01-23 at 12:18 +0100, Jan Beulich wrote:
> On 22.12.2023 16:13, Oleksii Kurochko wrote:
> > +static inline void arch_move_irqs(struct vcpu *v)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +}
>=20
> As I think you said you're doing the conversion already - with this
> becoming the "canonical" BUG_ON("unimplemented"):
> Acked-by: Jan Beulich <jbeulich@suse.com>
Missed that, I'll update that in my next patch version.

Thanks.

~ Oleksii


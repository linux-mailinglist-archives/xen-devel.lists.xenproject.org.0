Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D23BF6620A3
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 09:53:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473391.733962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEnuL-0008Th-1n; Mon, 09 Jan 2023 08:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473391.733962; Mon, 09 Jan 2023 08:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEnuK-0008R9-Uz; Mon, 09 Jan 2023 08:53:28 +0000
Received: by outflank-mailman (input) for mailman id 473391;
 Mon, 09 Jan 2023 08:53:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GnCm=5G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pEnuK-0008R3-41
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 08:53:28 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 144c49ba-8ffb-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 09:53:25 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id y25so11876765lfa.9
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 00:53:25 -0800 (PST)
Received: from [192.168.0.145] ([195.234.76.149])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a0565120c0300b004cb03999979sm1512441lfu.40.2023.01.09.00.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 00:53:24 -0800 (PST)
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
X-Inumbo-ID: 144c49ba-8ffb-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H6FchQyf5CB5ussTRx2mN0jjbocnfHQbf5QwEa2tL0Y=;
        b=nJdRXNf8vbCPVbpIkHSGAj+BncCPktEt1FFZFDhkFlWUSp/46Xz0t0kYD0AMEnU5Hh
         7VKFy+ejJjJ8O2xoY4G6qIoTWCq960QLSAuMc0AeA7oi9N573ruGZ8MSaL/79baUfYUm
         pz4wraEETJPub4TQ6t/26Ga1IjVKwLeq9zdj/DLklOjYqPURBA/YONUzOeHjrvTYPdQS
         mi8lcbd6MYJOEodkfxY0xp9K4Oipbyz7syXE42cJZVEMM4rkm3Etm2ZQ41k13Gf6A2UY
         xAsCClpVFss8ZN4x7teE6SrsMZ7zmUnilSaUETeGsX7Z+haIaoNMNXAo4m3jSQF2JEcZ
         wmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H6FchQyf5CB5ussTRx2mN0jjbocnfHQbf5QwEa2tL0Y=;
        b=fmx32kq4aQJIzbrNYunDSxdJfEtUQ/d53k7r4qGKUvVkHbgexeLb5izgVGVGxatQz5
         PJ3dUiIRmRQoRJStD/Ns4AZ5yZIBIOjGHZU+LQZchn9Wj7AH0e5CVftovYmSgTdJxd9A
         5l67X7+w3sAkJiK5w3lgQqrV5dG2o4yWqz0fEiOOSOa/6rLjOmaQUcQQ0mLuXou6cHmS
         H1P5D9sOS48TLHf3jbf4ZAR6tPFJvDFjf5EW5J4m7NHIeigw6LdC0GyvM1rmYcSt15qV
         miju8wzQ3rK3OJzV0S0Crsddb2E1kK2haLQaRG95o6MFFeDiQI0g5lPnUrp7NcMWvfU2
         c6LQ==
X-Gm-Message-State: AFqh2kr2kfH2RRT4nBOK07tTfbmQ38BfwIJxE+3GvXCvAJLAZj2iaWsh
	cJHoPh/hoffplXztXry5ky4=
X-Google-Smtp-Source: AMrXdXubr6vT7bcQ32NP1PlkH/uhp5KzoNbS5xjBB8VIi3OOeIREPdxCN9KnYVG44Z2h0/NGVjTeIQ==
X-Received: by 2002:a05:6512:1049:b0:4b6:edce:a192 with SMTP id c9-20020a056512104900b004b6edcea192mr20185277lfb.4.1673254405308;
        Mon, 09 Jan 2023 00:53:25 -0800 (PST)
Message-ID: <58d868b003f4a64922f3947cbf293c953471d8eb.camel@gmail.com>
Subject: Re: [PATCH v1 1/8] xen/riscv: introduce dummy asm/init.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>
Date: Mon, 09 Jan 2023 10:53:24 +0200
In-Reply-To: <0da22900-63f0-b8fa-00b6-855e2a94485d@xen.org>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
	 <cb2f0751d717774dfe065727c87b8f62f588ca17.1673009740.git.oleksii.kurochko@gmail.com>
	 <0da22900-63f0-b8fa-00b6-855e2a94485d@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

Thanks for the comments. I'll update commit message in the next
patch series.

~Oleksii
On Fri, 2023-01-06 at 13:42 +0000, Julien Grall wrote:
> On 06/01/2023 13:14, Oleksii Kurochko wrote:
>=20
> I am guessing this is necessary because you will use <xen/init.h>
> will=20
> be used later on.
>=20
> If so, then I think it would be useful for mention it in the commit
> message.
>=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Reviewed-by: Julien Grall <jgrall@amazon.com>
>=20
> Cheers,
>=20



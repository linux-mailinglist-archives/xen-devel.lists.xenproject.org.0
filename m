Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DED3A662F1D
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 19:31:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473972.734847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEwvf-0001tg-Ub; Mon, 09 Jan 2023 18:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473972.734847; Mon, 09 Jan 2023 18:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEwvf-0001qy-Rd; Mon, 09 Jan 2023 18:31:27 +0000
Received: by outflank-mailman (input) for mailman id 473972;
 Mon, 09 Jan 2023 18:31:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GnCm=5G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pEwve-0001qq-DM
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 18:31:26 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2a547a0-904b-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 19:31:25 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id bq39so14412048lfb.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 10:31:25 -0800 (PST)
Received: from [192.168.0.145] ([195.234.76.149])
 by smtp.gmail.com with ESMTPSA id
 x28-20020a056512131c00b004b549ad99adsm1723527lfu.304.2023.01.09.10.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 10:31:24 -0800 (PST)
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
X-Inumbo-ID: d2a547a0-904b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VcxOyx9+PmxK4qZSaoSOrWjjYSYft//gzQqweATZcy8=;
        b=oynIdUOT+KjJkD8zZLtAql3p2xI2v2o2kGwq+YKPCoznCZxcI7TiQ6gTgWsrDKRtkc
         s9r01t/jiGI+Pj6eCiPpKLQgHY4eeVFNa1Lxm3LL8tgqr65+mIcEIiyhFNEeAkz3t9h+
         dcDUbrMDXJwFBTcA+eltL8YtGeMPs8+fo0zE5KEwBtPyu+semx796a0X/QsPM7HAuYZK
         J88VvQqlBIPcjvMhkJamNGcIXYQvqSu60RRWIyCI66bCYUCkP09+u1lX2paTQXPq9zuA
         r+Eq7Br93Sh2U7SchoBxfOlwxSFuXJPDSCSuxkTAeQU9m1czOi7JS36GtN6T4ZtbGraE
         bldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VcxOyx9+PmxK4qZSaoSOrWjjYSYft//gzQqweATZcy8=;
        b=aa/oNhNpUZir2qKkWJecOOKckD/0KCLyt8VGMxcEFsICVbl2bvg6y4IolIU2HvebIA
         poHJXRUI+qIs08zKw1yfkAjbXrdxpXGwKRpjTdiA0KYvfesARXkUAuYaPkGNtWLye7sY
         e5YIL4fcltyO1xNybwGPyX4mOrFmcohO8CygayP1heBXbHqzMkY5JCSKo9tpTxnvN4/u
         wJv7dViOhTJmJioCC2BylYNExGCaTiWuspqutjAZuclGcv4ASIerNk42MhvraW7eHFrp
         K8sz7O9aRdnloQICYbqxWCt3Syv2+LQtf3Bd00PYZC5ghNndg7tUO/hy1rQblpolJQMX
         9DuQ==
X-Gm-Message-State: AFqh2kqvIEyPQHCa0kZaeyUwQTzFNSxEeZwvV8JP3iyb5dUEo3vBFEUP
	UNTBwwqG0ww8byf40c0tW8U=
X-Google-Smtp-Source: AMrXdXvWxnbV6EwtbOnYEE5/iFtjNgu+m0d/Ad9RiZJUwW5+8u79+XbokHa7+XHlCg7Pt/DXY3KZhw==
X-Received: by 2002:ac2:5f46:0:b0:4c2:7049:5fae with SMTP id 6-20020ac25f46000000b004c270495faemr15867776lfz.20.1673289084514;
        Mon, 09 Jan 2023 10:31:24 -0800 (PST)
Message-ID: <3075b5f9b180c72bb6736640c54efafcb840d571.camel@gmail.com>
Subject: Re: [PATCH] automation: add qemu-system-riscv to riscv64.dockerfile
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, 
	"xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	 <gianluca@rivosinc.com>, Doug Goldstein <cardoe@cardoe.com>
Date: Mon, 09 Jan 2023 20:31:22 +0200
In-Reply-To: <a089f748-bd2c-a286-935e-78fa6b66a4f9@citrix.com>
References: 
	<8badde729e97ef6508204c5229199b7247c7a3da.1673257832.git.oleksii.kurochko@gmail.com>
	 <a089f748-bd2c-a286-935e-78fa6b66a4f9@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-01-09 at 17:53 +0000, Andrew Cooper wrote:
> On 09/01/2023 9:50 am, Oleksii Kurochko wrote:
> > qemu-system-riscv will be used to run RISC-V Xen binary and
> > gather logs for smoke tests.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> I've committed this, and rebuilt the container.=C2=A0 Subsequent Gitlab-C=
I
> runs should be able to run the RISC-V smoke tests.
>=20
Thanks a lot. Will check soon.
> ~Andrew
~Oleksii



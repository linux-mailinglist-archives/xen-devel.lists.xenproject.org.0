Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A804927417
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 12:31:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753660.1161840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPJjn-0003Fj-4v; Thu, 04 Jul 2024 10:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753660.1161840; Thu, 04 Jul 2024 10:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPJjn-0003DU-1r; Thu, 04 Jul 2024 10:30:51 +0000
Received: by outflank-mailman (input) for mailman id 753660;
 Thu, 04 Jul 2024 10:30:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EPo+=OE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sPJjl-0003DM-DC
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 10:30:49 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a0beb82-39f0-11ef-8776-851b0ebba9a2;
 Thu, 04 Jul 2024 12:30:47 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-58d24201934so850933a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jul 2024 03:30:47 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58ebce189d0sm287924a12.97.2024.07.04.03.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 03:30:46 -0700 (PDT)
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
X-Inumbo-ID: 7a0beb82-39f0-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720089047; x=1720693847; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SdI35+PphY3lQkQzcGi9WQtoQ5J6YgV32H84xZ/h2tM=;
        b=kv0CwZG6WczfgfQj2WbzoiL72nFheKeCc7TR8FpqpidorZdlOn+0Rwf+MlMR8KAbME
         mG+2MHNZvhE2rqMsAK6+tHM8AMTf4KW2nlc7RExc1/JBzGMy1m0ce2mmmuVVOzxvKcPH
         qG7MOLFjUmFwcfLwTcQ6kDqyzETU5wKET7vS1GpX0pidlATwiUxzp+2rEWiyY6S7x+zr
         8L0k8G/dQfqvaQalYrSuO1SayGcxqf/DHbbI4ngIH19wLrdoyYJSwSEs6G6aYAdMu4Rc
         pyhJaHi2Expz1Hdk2UO54mJsbDdrfhpJ/9vgvbKi1IqhgeLTDrWUQeVxgC2f9fIQ72rQ
         h9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720089047; x=1720693847;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SdI35+PphY3lQkQzcGi9WQtoQ5J6YgV32H84xZ/h2tM=;
        b=HBLONTPouCXLApHhjl532CYsX6lRuqdFZzTaBRb0EJcOVhgxD503xQVu8n5A7IECfM
         LcdCoby10Y38nEx157/U1lAmTozVgOFFSnpyO71CkFvBckneD4R/bVJVIdPT5zfLkvV1
         XGiI6bTdYQHNSn92azR3W1tMJ4Cp9XVDFxsCAzQGMwxVg2+4KzAsk9iP1stQsDGXdVFO
         sN0+8IjaJLveyGxParLJ0e2P6IHbw/wSZ8JQD9HPuU5eZDjst2JCw7FNa/3jKwy+b0UQ
         jbWHl2dRZFsP/icpeZwiVia6z5kU9Z4NC0C5Xnu6oH+b8dA+UuYHTDLwTzSIqmkRL/mv
         VjlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFMt+gSodExE32CbMFHHO8QqdCb8Shcn3+TnOU/lBLwQxg7hzUqMDq44nVUUt6dKZuTl6VYkMjjhGk6HvhV6Vm/je2i3XzSwkunJkdHpo=
X-Gm-Message-State: AOJu0Ywo+Jmpv4zMfqE0hAmL7596YS7rcpwP+VJoxlBuJAA8v+W6ctD6
	1soXgzU4YyX7HqXBg2VBbkQI5W+EUv+X4FfR6HlGz8G0xG9i2pme
X-Google-Smtp-Source: AGHT+IGKRI1BANmlgYGIFEPzNLt59aV/MwYiolBBaBjS0OsBBMueu7j9L8aga1HMmDYiKi6y0gIdZw==
X-Received: by 2002:a05:6402:2696:b0:57c:7f3a:6c81 with SMTP id 4fb4d7f45d1cf-58e7b1198dbmr776507a12.8.1720089046732;
        Thu, 04 Jul 2024 03:30:46 -0700 (PDT)
Message-ID: <ba59aeea0adeb0768ab5273790b837864eef1e5b.camel@gmail.com>
Subject: Re: [PATCH v4] xen/riscv: PE/COFF image header for RISC-V target
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Milan Djokic <milandjokic1995@gmail.com>
Cc: milan.djokic@rt-rk.com, Alistair Francis <alistair.francis@wdc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
 Nikola Jelic <nikola.jelic@rt-rk.com>, xen-devel@lists.xenproject.org
Date: Thu, 04 Jul 2024 12:30:45 +0200
In-Reply-To: <0481c78f-ccad-4c65-b104-6b787b79f1d8@suse.com>
References: 
	<2bbb65fcda57f2609f0967f9050a91415059026c.1719942341.git.milan.djokic@rt-rk.com>
	 <21a1bbe9308b72eac6d218235f5211c7a1c90454.1719964980.git.milan.djokic@rt-rk.com>
	 <0481c78f-ccad-4c65-b104-6b787b79f1d8@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-07-03 at 17:55 +0200, Jan Beulich wrote:
> So, first: Please Cc all applicable maintainers. It would probably be
> prudent
> to also Cc Oleksii, who's doing most of the RISC-V work now (but
> Oleksii,
> please correct me if you don't want to be Cc-ed).
Thanks for adding me and I will be happy for be Cc-ed for RISC-V
related patches.

I will take a look at the patch next week. Sorry for delay.

~ Oleksii



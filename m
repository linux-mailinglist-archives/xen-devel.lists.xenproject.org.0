Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2417F809F26
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 10:21:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650466.1016024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBX3F-0003TH-T1; Fri, 08 Dec 2023 09:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650466.1016024; Fri, 08 Dec 2023 09:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBX3F-0003R0-PI; Fri, 08 Dec 2023 09:21:41 +0000
Received: by outflank-mailman (input) for mailman id 650466;
 Fri, 08 Dec 2023 09:21:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=atw2=HT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rBX3E-0003Qs-8M
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 09:21:40 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 309c3b4f-95ab-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 10:21:38 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a1ceae92ab6so248263266b.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Dec 2023 01:21:38 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 ci13-20020a170906c34d00b00a0988d69549sm752744ejb.189.2023.12.08.01.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 01:21:37 -0800 (PST)
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
X-Inumbo-ID: 309c3b4f-95ab-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702027298; x=1702632098; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j5j2b+y42pfp1xZvblYb4ELWtXTnopjlVU6C4tgu4N8=;
        b=KaS8pOp4Rrs4sjaEwsPcigpSidX9/aaOcSRz+d3FTQrdeH++o2UuAqYPH3thVKFOGw
         Xs4zWhr9YNy1DeOD1fnSr7evSJ1AaGGR9R5VVY3WygWjVxoBViruQ+MmtJgiZ+GHSuCC
         Sv4eNbvf7LIRdFXDtoj1oGPNltZyPY4Gp7kxCaSczRndnZNCd70WhsjvXNpHLqMdkvR4
         UQ5yav6hOinbwBBaBQFKo3mffIb+LZy7Xyj9vMSH02dTFdRMgwdPkulL7JvNnPWCjIUw
         BUbCsFSwiJHRHiiagumIiouv5wi0e1MQvQlyGlv35G+y3MLLijNO5tV/uVnSNpbZ+BlV
         TYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702027298; x=1702632098;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j5j2b+y42pfp1xZvblYb4ELWtXTnopjlVU6C4tgu4N8=;
        b=TqCN9NEUurU+q38SVIPLLAqM4fWWWiwsLd+llxpLQGrY8iZszqM5nfn79i6EVUMcES
         kaxyEvuGk7SBYf8gXxTDP58s+AcwoGjgjVBycA15TeqZgSl3fcO5Ic1dx4ADMPNOHEa7
         2j6vLpEhzSxxgDZWciQRnpBhDwivengZN15JNOv7RqpW3rlsyWzFRZOY28CnFjrdYdze
         VX32cdLLsKF1K6X+9iDkCjZ6FEtnILtR4uo7RTuIOPGpgdw78r7GYHN7QOGrYxfkYXgF
         W1YQxwIB4we+8IoqH8kTm4pze9TaziwuIC46Ain1oiuJqEOGKFk+UAbaB9LVanzmZHOE
         Yc3Q==
X-Gm-Message-State: AOJu0YzPeYMQyfhhkCBL7W5hwoBL8BhTmLq9D0v2Q5bpelxin6O0Xxqn
	GbZczWK4SjfUyKApKqDVZMo=
X-Google-Smtp-Source: AGHT+IGLrw9p/vhUR4Vw/MRXcn4GJ01bdbCEV8S3k4foLm0zT+ssbJBX/I9+dyWGJqbMd7gNFIIMUw==
X-Received: by 2002:a17:906:a397:b0:a02:54fa:4f2f with SMTP id k23-20020a170906a39700b00a0254fa4f2fmr2376113ejz.53.1702027297681;
        Fri, 08 Dec 2023 01:21:37 -0800 (PST)
Message-ID: <cb53226b525d49a552207ce84e21ee0c33f13903.camel@gmail.com>
Subject: Re: [PATCH v2 08/39] xen/riscv: introduce asm/cpufeature.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Fri, 08 Dec 2023 11:21:30 +0200
In-Reply-To: <3f43ced8-9437-4e88-a84f-0dd4edcdf5aa@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <b8fcdd22462ffa71a058e63dbf874dfc858264df.1700761381.git.oleksii.kurochko@gmail.com>
	 <3959501d-9696-4791-bf04-d394af255bd2@suse.com>
	 <3f43ced8-9437-4e88-a84f-0dd4edcdf5aa@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-07 at 15:25 +0100, Jan Beulich wrote:
> On 07.12.2023 15:19, Jan Beulich wrote:
> > On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >=20
> > Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
> Actually - with an SPDX header added. I only now realize that I
> committed the earlier two patches without paying attention to this
> aspect. I'd appreciate if in the next version you could include an
> incremental change. And obviously in all other new headers such a
> comment (and perhaps also a formatting footer) wants introducing
> as well.
Thanks a lot. I'll add SPDX headers.

~ Oleksii


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA28736AE2
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 13:24:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551695.861352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZTN-0004vY-0i; Tue, 20 Jun 2023 11:24:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551695.861352; Tue, 20 Jun 2023 11:24:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZTM-0004t2-St; Tue, 20 Jun 2023 11:24:32 +0000
Received: by outflank-mailman (input) for mailman id 551695;
 Tue, 20 Jun 2023 11:24:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3UYS=CI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qBZTL-0004sG-F6
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 11:24:31 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0588aa35-0f5d-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 13:24:29 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b47354c658so35961311fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 04:24:29 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a2e9054000000b002b0488ef239sm368553ljg.93.2023.06.20.04.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:24:28 -0700 (PDT)
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
X-Inumbo-ID: 0588aa35-0f5d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687260269; x=1689852269;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UQSLpkNQq6LkTsL7POn4PolhQdeTdtRs0XnvlQafO0s=;
        b=bMcOaQ35F6T3LK9zLqz0l6KyM60tftVvm1aOLncH4vJS0QRjGSl2nFrbAmJg6MicVc
         ue3Czm7twc9c40v4XiaOwAbSUsyzSfJJeYuQx39jaVxpnmr0LBT3RJXkhy8wGKWeuwjN
         gOvPbrmrZdd98Tr+TP/Ljx31kShjYlSi1RQUg3CloK1g30JMrXP9a0niuOGe9jklE6Th
         Fu6HnI1pRWCcBCRi4VboChyiW0j+/GvtfySmrjNVTbAzgX42pZg/oA/CqYVyw6UHBsYP
         gW+Xtf7k7yQSF8bto79QkgZPAYfsTLgVQE/CJsK/Un+QcaUbCPBIjB8JdO/JoT1xGEqh
         aQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687260269; x=1689852269;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UQSLpkNQq6LkTsL7POn4PolhQdeTdtRs0XnvlQafO0s=;
        b=bkchRaNPWSK+kkxb7KoLUW0Ip606eZjIOTKagAYLM8gNFhqTu3bI/tghvJeaC2EDHL
         gEv3yIxxGUinv1WmUw8S+b8m/Nc+CAnR1c95uhHnfsN0f5xSZJwm/xY4WIgbpJCVE7DN
         ZGSxqFihh/FoOUL/qCATKKRxz0KWEfM2CQt8yHd7J9v8ppeL5sP/IdxXsLYOTtJLQR6b
         HKJR2RMX3LoJYqP7W+1CMEidXqWpPPs1HurMgZG3kElkOEr2dccZ6tRhSN7xp1n4x36h
         W9FP0fVxC1eWGCF09+FaGGmOE2Yqu8dxd20Y+2REmq/3M6o2/LGciPYxRrxXxZlNtew9
         irkw==
X-Gm-Message-State: AC+VfDwtgNb/QUyhBHZCTJdabqxsseNigZr2lfT1c4qDcrf7HIAWbrh2
	XqxCMOb4MFMIMAKoZ3X/Cw8=
X-Google-Smtp-Source: ACHHUZ6+ur27RDHozV6R+j+6wfj7FCt/pNXpucfpdmqrH/4+GMLfFn0m5cvLUkV9q+QpaE57Axqk4Q==
X-Received: by 2002:a2e:9c55:0:b0:2b3:4ae6:8cff with SMTP id t21-20020a2e9c55000000b002b34ae68cffmr7016098ljj.0.1687260268609;
        Tue, 20 Jun 2023 04:24:28 -0700 (PDT)
Message-ID: <d7fa80899d0ee9a00a2c4d87f2c5f28413401e18.camel@gmail.com>
Subject: Re: [PATCH] build: Drop CONFIG_$ARCH_$(XEN_OS) definitions
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
 Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Shawn
 Anastasio <sanastasio@raptorengineering.com>
Date: Tue, 20 Jun 2023 14:24:27 +0300
In-Reply-To: <20230619180614.3610284-1-andrew.cooper3@citrix.com>
References: <20230619180614.3610284-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-06-19 at 19:06 +0100, Andrew Cooper wrote:
> These aren't used, and are not obvious useful either.
>=20
> tools/ does have some logic which works on $(XEN_OS) directly, and
> some on
> CONFIG_$(XEN_OS) too, but this isn't how we typically refer to
> things.
>=20
> The only user ever of this scheme was introduced in c0fd920e987
> (2006) and
> deleted in fa2244104b4 (2010).
>=20
> No functional change.

Looks fine to me.

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii




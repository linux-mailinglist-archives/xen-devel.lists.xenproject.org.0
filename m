Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7627D7D3003
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 12:34:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621289.967636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusGS-0006Tl-Kg; Mon, 23 Oct 2023 10:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621289.967636; Mon, 23 Oct 2023 10:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusGS-0006Rg-Hb; Mon, 23 Oct 2023 10:34:28 +0000
Received: by outflank-mailman (input) for mailman id 621289;
 Mon, 23 Oct 2023 10:34:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RLV=GF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qusGQ-0006Ko-VV
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 10:34:26 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc3d9ca4-718f-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 12:34:24 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-507b96095abso4582883e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 03:34:24 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 v25-20020ac25939000000b00507a89ef9bbsm1637783lfi.166.2023.10.23.03.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 03:34:24 -0700 (PDT)
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
X-Inumbo-ID: bc3d9ca4-718f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698057264; x=1698662064; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TDb4ASx8/jcCu8conPyrxb2iF1ZWlz7syBLytdyVXP4=;
        b=eN/3kZk3820/9RuOnWgEP/OflLdT2JXys2lVgdkdWBCnQ+MHeiQ+IKPDq+hCMDbDFa
         z0Tr0ST9HUYMOAAFmv3S3V2goOBxNPpWy9RqfqPz1mHJ1E2ciEGn0swIMS+TA4eTaxCi
         Xl7VmUBnZabJSFwfTYBN/81bWgr+b0VcA3vId1zbDazW6sxuMzDmazSo/pg0mAG1Cz3a
         TgEGsGQzrzmCZfRwzUmmficpzDCV2IOXHI8WQGxNsYTThIIvBRLVEGlHJoxy50VMhfH4
         awDpscNeDtQSeKCRMpIy3tieNoVqgsDLU4hq2KJ0xWB7PWjzkAMIxUEo6iVewCY5Rvzl
         xRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698057264; x=1698662064;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TDb4ASx8/jcCu8conPyrxb2iF1ZWlz7syBLytdyVXP4=;
        b=OHoiJ2ZsBC03v5uMeUeKI80S/gKJl8RRh2/0YrsZMHc9LLKpeSfcw4wM5vTAi1rBFY
         yEVL21kerPfOQ9c1K1hL/5wo8HSHAJZhony5+63ONPO5WO5TtuquMJzq+41Y8KZhyshr
         kQtfcIfwj330ov7CFeKy37ar8QWBKuZo8lg8LVmTiLWq8IaIqI+67bNw6dmHsUoYewAa
         TW/1wxwKE7X9AZc55oAQr0fX1Eqyedd87tBnLqm/WQ1Uqj7AGFDWz8Kbtn0GYUSW1NOh
         PduYncHZ6bl2dsla0Ev62rieLGrZNMIRJHYHeIDVnCdpfPobiTCY08EfACOa2oXzRPhI
         ilHg==
X-Gm-Message-State: AOJu0YzoaGYyX12kZ+J4rxnVE/qGH1S4rwwAvPa2Ex7UkVCsLA+0pPoe
	qeS07R5sWSBGE+1O1Z7WYJT+L7Ipchs=
X-Google-Smtp-Source: AGHT+IECeiz17WPHXF766H/+MKkPIS8uEeN5nPXhI/M+UWJhPy0Js6XqiCV8T+Pqrq12Jar/vUaXBw==
X-Received: by 2002:a05:6512:3b3:b0:507:ab5b:7b6c with SMTP id v19-20020a05651203b300b00507ab5b7b6cmr6066738lfp.36.1698057264267;
        Mon, 23 Oct 2023 03:34:24 -0700 (PDT)
Message-ID: <b6078a353be7c02865f2e75dc6149a932d5f9eed.camel@gmail.com>
Subject: Re: [PATCH v1 08/29] xen/asm-generic: introduce stub hypercall.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Mon, 23 Oct 2023 13:34:23 +0300
In-Reply-To: <f7293722-c708-947f-19ab-6c3b753f6dda@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <bd57ae1fd448b7d2f4188ff705bb5f537ac48521.1694702259.git.oleksii.kurochko@gmail.com>
	 <f7293722-c708-947f-19ab-6c3b753f6dda@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-10-19 at 11:24 +0200, Jan Beulich wrote:
> On 14.09.2023 16:56, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/include/asm-generic/hypercall.h
> > @@ -0,0 +1,14 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_GENERIC_HYPERCALL_H__
> > +#define __ASM_GENERIC_HYPERCALL_H__
> > +
> > +#endif /* __ASM_GENERIC_HYPERCALL_H__ */
>=20
> This lacks the "should not be included directly" guard that x86 and
> Arm
> headers have.
Thanks. I'll add it.

~ Oleksii


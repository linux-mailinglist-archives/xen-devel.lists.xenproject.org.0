Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E41B29CFF
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 11:02:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085756.1444046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvkp-0003xp-Tn; Mon, 18 Aug 2025 09:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085756.1444046; Mon, 18 Aug 2025 09:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvkp-0003vH-Qg; Mon, 18 Aug 2025 09:02:11 +0000
Received: by outflank-mailman (input) for mailman id 1085756;
 Mon, 18 Aug 2025 09:02:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HFvU=26=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1unvaV-0005Kq-NX
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 08:51:31 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89378507-7c10-11f0-a329-13f23c93f187;
 Mon, 18 Aug 2025 10:51:31 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-55ce521f77bso3917262e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 01:51:31 -0700 (PDT)
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
X-Inumbo-ID: 89378507-7c10-11f0-a329-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755507091; x=1756111891; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QSbj+JGTa3eJnS7j2Msd+i52iC+7MQffEyC40Z4ExU=;
        b=JTyuLxwLJow9JTnZFHv2IRjXLZ3S98VP/zrMLSNuhxc1oN7ApXa0Uok2vYUYPXSuya
         0sitB7iGUCjcsPkXrDuqvMbxYf2C/1tYhSLi1QJ+KJ/vBC6u0INBrvx99CML6kmykPt1
         aJgtdFztbmxtOY8bnAdGWtJpZQ7xG802Inm3ZIAq2fJTWq0W6FKyLDGIInwZL1HYizRS
         LZo1Fp/UK3G/01LjDNLBbXNlHBFHjvdrbeLhmSKbho7mNhoayYlypXlfmkZD+TAPvyYn
         ni0/OOJoPh6OGmqHqqMrtkQIu1UN4uyR0UcbsKWm6cLGIz6jN2YrrQzxGFWoLPxXA/L9
         IgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755507091; x=1756111891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/QSbj+JGTa3eJnS7j2Msd+i52iC+7MQffEyC40Z4ExU=;
        b=CkrdU/6+lMhtqMu7HhhS7Z6WzBqBLT6Da5uiY9wKKyFiZdJhTZXQeqpXQeedx27lry
         jboA2NtYZMkBpdB5Bu+nrGkw6R2DK5q/FIsQe7/rM947NWA8tm20TXBpE+/hgyJJsFXp
         r9/GV7ZC9JvJYcLfQBjNWcdEjzQDJrZwBzWP4iExDsgbO+L/dbPujggG/ONi2+NUDqXI
         LP2FLIC0qRy0CEMxAgAOGqRST5wTmuhHsqfW1kWQoc9bq+OtMMtUzljKx5F7eESOOv9I
         OtRLHVzmVLRxE7ninb/J6jMJ0vBUD85JpgUBeU24GuiqpWkrStsmHk1hNAFhhsh1f0Ty
         ICow==
X-Gm-Message-State: AOJu0YwreEG7aRTmwKk4oWwoQ9m7nmmyDGX8cHpQshCIBY4Lzz1ShgPe
	r8zg38dhZW27B6IUiOSTuQUueZAXZs7xoZpeh/bpFd3ZCO/k7+0jPRa84rz9SZE9twBVizNtRi8
	M/bQmX/gQOWrQiWDyt8W0C46nYH+wQM9VvkYg
X-Gm-Gg: ASbGncuGFcHB5he+du57b186p9LgDZ2NIwXEMVuBPastzlxQnYLOfwkhL/5FpEwSFmU
	L2TDmhYaWX18ZBXvStrFXXSzpdbk/3Uog0GfE4dqUv8fis+9ZcZtkXt3BRBgC8yU8o/Cx63/grq
	/+ufmYarbRydCNS1WD1dxnAZD3ezK+OTLLGeGdd6yNnLgaG3qIW30ky0MbHeKObgd7i+/D8P1QX
	eicWEsFu542DhM6
X-Google-Smtp-Source: AGHT+IEu+jWTuFu2NvTwAVONkBCjWjEW5amOEb8ENfY6rAV8VS3VnsxOeW7Es7xxgilAqT9YRUNDcnfNkvPwEnGJgV8=
X-Received: by 2002:a05:6512:3986:b0:55b:83b3:6764 with SMTP id
 2adb3069b0e04-55ceebb062cmr2749829e87.51.1755507090622; Mon, 18 Aug 2025
 01:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <f983bb7c3c9f0912da7e7f2fc22384ce1081a7a3.1754901835.git.mykola_kvach@epam.com>
 <1a51ba8c-93c5-4cfb-b76e-26e318c0b22d@xen.org> <7ff1a083-d9f2-46c3-b347-d26e11d2310f@xen.org>
In-Reply-To: <7ff1a083-d9f2-46c3-b347-d26e11d2310f@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 18 Aug 2025 11:51:19 +0300
X-Gm-Features: Ac12FXyYLy7axp54eZy5-EryqeN8LxwHCcD0XdpiLIRSG8ufv7tvUhy2XIvaSBE
Message-ID: <CAGeoDV-=4Y66hjOwGhDsu-SHStZRedBbzknjuGtmcrqmDyHS9g@mail.gmail.com>
Subject: Re: [PATCH v2] xen/arm: irq: add missing spin_unlock() in
 init_local_irq_data() error path
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Denis Mukhin <dmukhin@ford.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 2:07=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
>
>
> On 11/08/2025 18:28, Julien Grall wrote:
> > Hi Mykola,
> >
> > On 11/08/2025 09:45, Mykola Kvach wrote:
> >> From: Mykola Kvach <mykola_kvach@epam.com>
> >>
> >> If init_one_irq_desc() fails, init_local_irq_data() returns without
> >> releasing local_irqs_type_lock, leading to a possible deadlock.
> >>
> >> Release the lock before returning to ensure proper cleanup.
> >>
> >> Fixes: 2bb32b809250 ("xen/irq: Propagate the error from
> >> init_one_desc_irq() in init_*_irq_data()")
> >> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> >> Reviewed-by: Denis Mukhin <dmukhin@ford.com>
> >
> > Acked-by: Julien Grall <jgrall@amazon.com>
> >
> > I will commit the patch soon.
>
> This is now merged.

Thanks everyone for the reviews and merging!

Best regards,
Mykola

>
> Cheers,
>
> --
> Julien Grall
>


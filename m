Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 618FD6A1CE0
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 14:18:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501044.772619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVXyB-0001AH-FT; Fri, 24 Feb 2023 13:18:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501044.772619; Fri, 24 Feb 2023 13:18:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVXyB-00018P-CV; Fri, 24 Feb 2023 13:18:39 +0000
Received: by outflank-mailman (input) for mailman id 501044;
 Fri, 24 Feb 2023 13:18:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zq+K=6U=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pVXy9-00018J-KN
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 13:18:37 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be1bb5b4-b445-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 14:18:35 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id l25so13480784wrb.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 05:18:35 -0800 (PST)
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
X-Inumbo-ID: be1bb5b4-b445-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bZMZWljjINbt3cbT8XvI8FDvFGZuMTOtIROv06JT5e8=;
        b=YrxrMEESeyWJv6DgP5n7pbFRLiSTIsXyQU8bOR1xG4Z9ENi5FKzm407nHECiPzIKxQ
         mOhY1Dzf6SHoSHbwyOW8H6hNz4uvU3yDHm01Mur/NaVcXkZGimUAKGRm0Aybomh4qcbA
         RK7GkWsgfk2p6dJ5wa35GGrW6ZpS0KXufLw/ajXVzhI6vvKmnPk2raYBoKe4ebVkwIRA
         s/atD4sQqH5FrTOkym/ZBWPm3l9EIKo2bIqI8LPG2yB1v6zNxuhM3qQsHQJYEAXP8Kom
         9Z4K7516qIPcHQ9I4tOXxYUBtTLr0Z9xkkTAnJV2DAdpE6bAzAMlSTg7sCcHCkBluWSr
         Q65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZMZWljjINbt3cbT8XvI8FDvFGZuMTOtIROv06JT5e8=;
        b=6FJl5Wwy93q2Gv1mYeu74PHcXhYanYUNuQm3x04rZk5y8sltIwgfljmihtcmJd4vnE
         5mmMgF+zp4lCnlF9HTsYwNJ9RCIbHFfDlLXNYVdFO+L8nc1VOab2bvwIC4AQsXtqDaku
         j1c/eUH/Qw3tZetvPwE+KAw0BseQ/HzrPr25b3qHZPQvsdQ1AfUMNHWi4F055Bme1+XE
         9AfXtaOYWt7EyZzQ7uJ9+g/qWEzpcJFwSIX+DUPrUZJal9Iv8i8hPkHwRGToZdP/U0F2
         sVo1zZDnJr5VCNnSnzbJTu+LTOMggz6BRYuC1jHSY7IJCHSsC3ZpV2NMiTESR0jbp1zd
         i/Rg==
X-Gm-Message-State: AO0yUKUSUfGLVoTCzilAw10EpCwMdN9PRnVJeGtxGZVZrQwX/6bk5Iqb
	O3GDv7X7zegZTRefrDKjjsmBmvXWzfSRZaO6s50sFA==
X-Google-Smtp-Source: AK7set+DBzCY5Ru6dJrnynKF/H65JA8NtfVUfLf/+RDDrTa9eiM+lJbBaaG1wdDYYw6MxN1poR1cuQ5F+MWpayqlY8o=
X-Received: by 2002:a05:6000:15c1:b0:2c7:cc8:7825 with SMTP id
 y1-20020a05600015c100b002c70cc87825mr1398138wry.3.1677244714968; Fri, 24 Feb
 2023 05:18:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <a3f70753dc853c2fb81efad72321ec00accf3f27.1677079672.git.jens.wiklander@linaro.org>
 <6B714A07-F3D0-4F27-BA66-078433430B3D@arm.com>
In-Reply-To: <6B714A07-F3D0-4F27-BA66-078433430B3D@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 24 Feb 2023 14:18:24 +0100
Message-ID: <CAHUa44F=Zp+=iStkAxAVk2D5thj7vdyyJ-b3SkgETkS4udz0Ag@mail.gmail.com>
Subject: Re: [XEN PATCH v7 06/20] xen/arm: ffa: add flags for FFA_PARTITION_INFO_GET
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bertrand,

On Fri, Feb 24, 2023 at 10:30 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> >
> > Defines flags used for the function FFA_PARTITION_INFO_GET.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> > xen/arch/arm/tee/ffa.c | 26 ++++++++++++++++++++++++++
> > 1 file changed, 26 insertions(+)
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index aa6cdbe0a4f9..f4562ed2defc 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -56,6 +56,32 @@
> > #define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
> >                                                  FFA_MY_VERSION_MINOR)
> >
> > +/*
> > + * Flags used for the FFA_PARTITION_INFO_GET return message:
>
> This is somehow no completely precise.
> Could I suggest to use what the doc says:
> Flags to determine partition properties in FFA_PARTITION_INFO_GET return message

OK

>
>
> > + * BIT(0): Supports receipt of direct requests
> > + * BIT(1): Can send direct requests
> > + * BIT(2): Can send and receive indirect messages
> > + * BIT(3): Supports receipt of notifications
> > + * BIT(4-5): Partition ID is a PE endpoint ID
>
> You describe all bits until 5 but not 6,7 and 8.
> Please describe all of them to be coherent.

OK

>
> > + */
> > +#define FFA_PART_PROP_DIRECT_REQ_RECV   BIT(0, U)
> > +#define FFA_PART_PROP_DIRECT_REQ_SEND   BIT(1, U)
> > +#define FFA_PART_PROP_INDIRECT_MSGS     BIT(2, U)
> > +#define FFA_PART_PROP_RECV_NOTIF        BIT(3, U)
> > +#define FFA_PART_PROP_IS_PE_ID          (0U << 4)
> > +#define FFA_PART_PROP_IS_SEPID_INDEP    (1U << 4)
> > +#define FFA_PART_PROP_IS_SEPID_DEP      (2U << 4)
> > +#define FFA_PART_PROP_IS_AUX_ID         (3U << 4)
> > +#define FFA_PART_PROP_NOTIF_CREATED     BIT(6, U)
> > +#define FFA_PART_PROP_NOTIF_DESTROYED   BIT(7, U)
> > +#define FFA_PART_PROP_AARCH64_STATE     BIT(8, U)
>
> bits definitions are coherent with the standard
>
> > +
> > +/*
> > + * Flag used as parameter to FFA_PARTITION_INFO_GET to return partition
> > + * count only.
> > + */
> > +#define FFA_PARTITION_INFO_GET_COUNT_FLAG BIT(0, U)
>
> same here.

Thanks,
Jens

>
> Cheers
> Bertrand
>
> > +
> > /* Function IDs */
> > #define FFA_ERROR                       0x84000060U
> > #define FFA_SUCCESS_32                  0x84000061U
> > --
> > 2.34.1
> >
>


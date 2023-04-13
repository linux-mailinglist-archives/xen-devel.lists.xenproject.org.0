Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 503BE6E0FCF
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 16:19:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520807.808829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmxn5-000272-Ua; Thu, 13 Apr 2023 14:19:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520807.808829; Thu, 13 Apr 2023 14:19:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmxn5-000244-Qr; Thu, 13 Apr 2023 14:19:11 +0000
Received: by outflank-mailman (input) for mailman id 520807;
 Thu, 13 Apr 2023 14:19:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmxn4-00023y-PM
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 14:19:10 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27657f9d-da06-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 16:19:08 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id e7so4259531wrc.12
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 07:19:08 -0700 (PDT)
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
X-Inumbo-ID: 27657f9d-da06-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681395548; x=1683987548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jnxv1d+DPOzXFsYGT8fPh7cpyORkn3S4h2c0JMmojyY=;
        b=i2RrQtWy/A7bUtrdoyr5sTSUySe67dRrSsliXVPVJc/P2sLIqZjAucxTPd1GrskY7t
         AKOya4TNVorwCxcjKxsY3bDh5J3cZPlS7GdSC8V0LlnAP5AqLO2SHv+kvdEZ4X55Jdlp
         wcRhIYABuH1Q9Ug1rftjC8JUWTAm9sDAHI62WrU/T7SlBySVbacE/zxmlz7qpT5H6LM0
         eAQ3dVtXMC509lNLWU7FZoyUAvluUs2A9YB1yNWXJzww3Ca0e10nPos1ztyOrYxnR3cO
         OFC7oNXJHLaJvvEgTVlKZ0rQ0tzu7wAWAFG5VNZSXQ4mneGgrt7A0oDxJFJNG/EocKGJ
         wZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681395548; x=1683987548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jnxv1d+DPOzXFsYGT8fPh7cpyORkn3S4h2c0JMmojyY=;
        b=jmPFvFi/Z8GmHbaXrMiqltcuIiHmqtgV0sTItBS7bz4YPKS72AcuuQ2jB/zrqQj0/Y
         F+EGei1ouZEpoq6jw7mP/gPrmCVCTi6PtS4L/At5HdAsRXfgd2ZD8GJ0Iz9IkaVhkkij
         lXQENRtrcMIZeUSOx5Z0BVR6eQu1BifNE25VyGrgSsIHlLULh5vSUyTVY5FsB2pEP1X0
         nMI2I5vzp1qq3XepfBDNRTQNwtObIt9+P97bAHl/mOeCkkfBmPbAvoHju61oVCGCPorS
         KenqRxhvQNI6vr7S9SIzOeR8VhhP04G8vh9lKWuAxSSXyyKLjE1R0mNKc6HcTKRSt5gX
         IhKQ==
X-Gm-Message-State: AAQBX9fSvJIrHc2gBqQo/+nuMHgP3Z9UuYR2hB/ojMRKTAP/RulE5V3t
	wntVGlHhSDjdoitxrmiueUdMmUzUtRPhr06FQbjpUg==
X-Google-Smtp-Source: AKy350adar8VeKRFQ5PBoxwjPmgqVh84AAZAOPLUj5qBijC4tUca+gUdapTJ2ICBQ76nii1wCwNo/0k9Tk968+K4MJA=
X-Received: by 2002:a5d:6881:0:b0:2f5:6a2f:660f with SMTP id
 h1-20020a5d6881000000b002f56a2f660fmr466484wru.3.1681395547982; Thu, 13 Apr
 2023 07:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-16-jens.wiklander@linaro.org> <AS8PR08MB799188B36D51EF5BB367590D92989@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To: <AS8PR08MB799188B36D51EF5BB367590D92989@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 13 Apr 2023 16:18:56 +0200
Message-ID: <CAHUa44FbU2qjckQ2DL+U7yuZ893nnbcUgaZdYJ-8YVi5r6P-_g@mail.gmail.com>
Subject: Re: [XEN PATCH v8 15/22] xen/arm: ffa: add defines for sharing memory
To: Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Henry,

On Thu, Apr 13, 2023 at 1:47=E2=80=AFPM Henry Wang <Henry.Wang@arm.com> wro=
te:
>
> Hi Jens,
>
> > -----Original Message-----
> > Subject: [XEN PATCH v8 15/22] xen/arm: ffa: add defines for sharing mem=
ory
> >
> > Adds defines needed for sharing using the function FFA_MEM_SHARE and
> > friends.
>
> Same as my comments in previous patches, I would suggest to also mention
> the references in commit message.

OK, I'll add something.

>
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  xen/arch/arm/tee/ffa.c | 60
> > ++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 60 insertions(+)
> >
> > + * FF-A doesn't have any direct requirments on GlobalPlatform or vice
>
> Typo: s/requirements/requirements/

OK

>
> > + * versa, but an implementation can very well use FF-A in order to pro=
vide
> > + * a GlobalPlatform interface on top.
> > + *
> > + * Global Platform specification for TEE requires that any TEE
> > + * implementation should allow to share buffers with size of at least
> > + * 512KB, defined in TEEC-1.0C page 24, Table 4-1,
> > + * TEEC_CONFIG_SHAREDMEM_MAX_SIZE.
> > + * Due to align issue mentioned above, we need to increase this
>
> s/align issue/alignment issue/ ?

Yes, I'll make it "the alignment issue".

>
> > + * value with one.
> > + */
> > +#define FFA_MAX_SHM_PAGE_COUNT          (SZ_512K / FFA_PAGE_SIZE + 1)
> > +
> > +/*
> > + * Limits the number of shared buffers that guest can have at once. Th=
is
> > + * is to prevent case, when guests tricks XEN into exhausting its own
>
> Typo: s/tricks/trick/

OK

>
> > + * memory by allocating many small buffers. This value has been chosen
> > + * arbitrary.
>
> Typo: s/ arbitrary/arbitrarily/

OK

>
> > + */
> > +#define FFA_MAX_SHM_COUNT               32
> > +
> > +/* FF-A-1.1-REL0 section 10.9.2 Memory region handle, page 167 */
> > +#define FFA_HANDLE_HYP_FLAG             BIT(63, ULL)
> > +#define FFA_HANDLE_INVALID              0xffffffffffffffffULL
> > +
> > +/*
> > + * Memory attributes: Normal memory, Write-Back cacheable, Inner
> > shareable
> > + * Defined in FF-A-1.1-REL0 Table 10.18 at page 175.
> > + */
> > +#define FFA_NORMAL_MEM_REG_ATTR         0x2fU
> > +/*
> > + * Memory access permissions: Read-write
> > + * Defined in FF-A-1.1-REL0 Table 10.15 at page 168.
> > + */
> > +#define FFA_MEM_ACC_RW                  0x2U
> > +
> > +/* FF-A-1.1-REL0 section 10.11.4 Flags usage, page 184-187 */
> > +/* Clear memory before mapping in receiver */
> > +#define FFA_MEMORY_REGION_FLAG_CLEAR            BIT(0, U)
> > +/* Relayer may time slice this operation */
> > +#define FFA_MEMORY_REGION_FLAG_TIME_SLICE       BIT(1, U)
> > +/* Clear memory after receiver relinquishes it */
> > +#define FFA_MEMORY_REGION_FLAG_CLEAR_RELINQUISH BIT(2, U)
> > +/* Share memory transaction */
> > +#define FFA_MEMORY_REGION_TRANSACTION_TYPE_SHARE (1U << 3)
> > +
>
> I confirm the values introduced in this patch are consistent with in-code
> comments on top of them. Thanks for the pointer :)

:-)

>
> With the typos corrected:
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Great.

Thanks,
Jens

>
> Kind regards,
> Henry
>
>
> >  /*
> >   * Flags and field values used for the MSG_SEND_DIRECT_REQ/RESP:
> >   * BIT(31): Framework or partition message
> > --
> > 2.34.1
> >
>


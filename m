Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 348926E23B7
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 14:55:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521126.809462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnIwW-0007M0-G4; Fri, 14 Apr 2023 12:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521126.809462; Fri, 14 Apr 2023 12:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnIwW-0007J6-Cf; Fri, 14 Apr 2023 12:54:20 +0000
Received: by outflank-mailman (input) for mailman id 521126;
 Fri, 14 Apr 2023 12:54:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZM4c=AF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pnIwU-0007J0-9w
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 12:54:18 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77265b7a-dac3-11ed-b21e-6b7b168915f2;
 Fri, 14 Apr 2023 14:54:17 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id j12so1143964wrd.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Apr 2023 05:54:17 -0700 (PDT)
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
X-Inumbo-ID: 77265b7a-dac3-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681476857; x=1684068857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QItX4kx36BzpBSoyjOqYoLsNvoaJtFnUqdCC7RP/lNI=;
        b=v3Bg82ZImQ85yF/zvQQywf+xe/LxE6fcNLtLBfXkEFkt+slxSyw0AYQnY4xLiJ7WST
         OWHoZ6uYNcDTI5setzhlVl5E7F4cryv3v67nPwdEBVNwZcg47ouKUTdGmAe3vBYtzxee
         F9YpgJaXmNFYUqWNHei0UIpfRrDxmPX+O1gJrIQ9mNWqJPG3357jesn5VoYEodN6kmJx
         uOxx3bieA0qw5iy9LGgZkjMm7/NjU2wx77Rb4dKhlgsdCwuoKER94kiRLXG4cNWbHxea
         klMUEEXG5xy2bw8tf6qp5ODrhWX597LmRu4BHYIIAkSlzUwEdJlfqTDQu1B/trYxDEyA
         KK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681476857; x=1684068857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QItX4kx36BzpBSoyjOqYoLsNvoaJtFnUqdCC7RP/lNI=;
        b=L8MkJ/DESRMV9dyTw2uCTVL90Lp+p1ZG6l/7Sm8iqhohlE/xX/WD/ecC1z7vvM+s57
         Yvb0ufQK1zSdHSKiCRW52+8lem9ME00PaQUTSTOCh3cJLakLKsWbaMjlAi6inGgJHAfg
         IlKW22iAbC68vW6zYulNZIzuN6ODy2UPhp1YkCWL6ONN8cO8/AqaH0eUX4STAl/KsggT
         gutUD/Qs/huqjz1oaAnhjKdcuUIkuEhP3UWUMJAe1tt9gVCOx4EXOFWYg1/bGDwAxsqi
         8Qkz2YrU4Rw05K4UffPLyyff88MHIwROhsQiFWOktKsz+G6rZdVBKu4VGtcPCX8ryDU0
         6YPg==
X-Gm-Message-State: AAQBX9ewyVBeZJxqXF24iOS/MC9R9Mz5bz/owowncGYjfS0kGXDkHp/T
	mXNdoLwC+GyCRxnlc2QtaxUxvPZiaBbx+7NsFVxPhw==
X-Google-Smtp-Source: AKy350ayl0OXgBaZesP3BYAgSJQPytVASLtqXN7bM9l2pkthiM5eJbwvddimiJgzQOEjbx7BRVkFi2ni0E1JtF44erQ=
X-Received: by 2002:adf:df83:0:b0:2f4:1214:d5b4 with SMTP id
 z3-20020adfdf83000000b002f41214d5b4mr1062374wrl.3.1681476856678; Fri, 14 Apr
 2023 05:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-22-jens.wiklander@linaro.org> <c2ef841e-fe3a-a283-2c83-225e02d588d2@xen.org>
In-Reply-To: <c2ef841e-fe3a-a283-2c83-225e02d588d2@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 14 Apr 2023 14:54:05 +0200
Message-ID: <CAHUa44EFqNW_SJcWb=Lbjz1g41TA4Y2f+h8a+xdVG-5yCLpusg@mail.gmail.com>
Subject: Re: [XEN PATCH v8 21/22] xen/arm: ffa: list current limitations
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, 
	Marc Bonnici <marc.bonnici@arm.com>, Achin Gupta <achin.gupta@arm.com>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Thu, Apr 13, 2023 at 10:57=E2=80=AFPM Julien Grall <julien@xen.org> wrot=
e:
>
> Hi Jens,
>
> On 13/04/2023 08:14, Jens Wiklander wrote:
> > Adds a comments with a list of unsupported FF-A interfaces and
> > limitations in the implemented FF-A interfaces.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >   xen/arch/arm/tee/ffa.c | 32 ++++++++++++++++++++++++++++++++
> >   1 file changed, 32 insertions(+)
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index 0948cc636871..6424c222c885 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -13,6 +13,38 @@
> >    *                https://developer.arm.com/documentation/den0077/e
> >    * TEEC-1.0C: TEE Client API Specification version 1.0c available at
> >    *            https://globalplatform.org/specs-library/tee-client-api=
-specification/
> > + *
> > + * Notes on the the current implementstion.
> > + *
> > + * Unsupported FF-A interfaces:
> > + * o FFA_MSG_POLL and FFA_MSG_SEND - deprecated in FF-A-1.1-REL0
> > + * o FFA_MEM_RETRIEVE_* - Used when sharing memory from an SP to a VM
> > + * o FFA_MEM_DONATE_* and FFA_MEM_LEND_* - Used when tranferring owner=
ship
> > + *   or access of a memory readion
> > + * o FFA_MSG_SEND2 and FFA_MSG_WAIT - Used for indirect messaging
> > + * o FFA_MSG_YIELD
> > + * o FFA_INTERRUPT - Used to report preemption
> > + * o FFA_RUN
> > + *
> > + * Limitations in the implemented FF-A interfaces:
> > + * o FFA_RXTX_MAP_*:
> > + *   - Maps at most 32 4k pages large RX and TX buffers
> > + *   - RT/TX buffers must be normal RAM
>
> Can you explain why this is a problem?

Good catch, I can't. I must have added it by mistake. I'll remove it.

Thanks,
Jens

>
> > + *   - Doesn't support forwarding this call on behalf of an endpoint
> > + * o FFA_MEM_SHARE_*: only supports sharing
> > + *   - from a VM to an SP
> > + *   - with one borrower
> > + *   - with the memory transaction descriptor in the RX/TX buffer
> > + *   - normal memory
> > + *   - at most 512 kB large memory regions
> > + *   - at most 32 shared memory regions per guest
> > + * o FFA_MSG_SEND_DIRECT_REQ:
> > + *   - only supported from a VM to an SP
> > + *
> > + * There are some large locked sections with ffa_tx_buffer_lock and
> > + * ffa_rx_buffer_lock. Especially the ffa_tx_buffer_lock spinlock used
> > + * around share_shm() is a very large locked section which can let one=
 VM
> > + * affect another VM.
> >    */
> >
> >   #include <xen/bitops.h>
>
> Cheers,
>
> --
> Julien Grall


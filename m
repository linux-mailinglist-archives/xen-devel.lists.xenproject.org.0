Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CDA7BD7AC
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 11:52:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614254.955252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpmvV-0007L7-Dy; Mon, 09 Oct 2023 09:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614254.955252; Mon, 09 Oct 2023 09:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpmvV-0007JG-B4; Mon, 09 Oct 2023 09:51:49 +0000
Received: by outflank-mailman (input) for mailman id 614254;
 Mon, 09 Oct 2023 09:51:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F0fN=FX=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1qpmvT-0007JA-Sz
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 09:51:47 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74f67017-6689-11ee-9b0d-b553b5be7939;
 Mon, 09 Oct 2023 11:51:45 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-32329d935d4so3904003f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Oct 2023 02:51:45 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n9-20020adff089000000b0031ad2f9269dsm9117293wro.40.2023.10.09.02.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 02:51:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 47D0E1FFBB;
 Mon,  9 Oct 2023 10:51:44 +0100 (BST)
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
X-Inumbo-ID: 74f67017-6689-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696845105; x=1697449905; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAHGsTZCeUxfPqrrTshtCf2/Bq/A/OJTigVgFiLPkAI=;
        b=Y9RTNj1JW8GWrHbQ5PbQcFiefenhFERipDfGmz/iTuA3sCJdDbe3+OxMeR7cjDg/gC
         eQH7XpHs1lI7j+alFfMffyb7q+yCz0PLoehx+tffSUjYqLugX74GbutzlKSIA7uE0ujh
         SnbP+qP0+3W5T9vnRVAhvYvE/97aLhHpofw2LOQDRnkvry14kBV1kzId8mMRm/6YUbqt
         e6ObaO/kTcV6f/I5orY8nXa4RcWwQYCiHQzF5Ws7t7ommt2l1Bv8Y5nxWFe9qyYhN5Am
         yobWCFeuG3V0bc+uIWmpYWatdP40YghQDzpWHOL+yvRAZFLxeZ2KVfxlRMemR5tuTrAH
         5POw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696845105; x=1697449905;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NAHGsTZCeUxfPqrrTshtCf2/Bq/A/OJTigVgFiLPkAI=;
        b=DRss+ALpoLg6e+xJuyc8GnvUj2bX+LgUpA+ePXqOjH07L/T5b7I3MMJiFmtPhCTDFt
         NyFrF4SuYJR2tefOjQXFocWWqUh1iqZ8BtGoLoq/RduFT7OwcFXSRTT5jMLyA7aCRew5
         h3vVhKpxmcYft87qjHR8kPuRL8o+iVo3q7YoyU51trSQ1OaCBH8nETWi9YFfanj4TlkE
         cf5M4eLmBNxlO30EUaEXC1I42V8AUlkSEXCs156cDAJ8Gtmb+6BOwxrTCg2MJA84a1j4
         NBjY1vkL1ZeHgBn95+MuEb0YecsmVTIWRUZJcrZrXcyBN49wqoCNbaGQNTqVGs5CI38A
         vVQw==
X-Gm-Message-State: AOJu0YwSkRBg4wSmxlfQjyXNMecKZjPgR8CdjphySK54M8oFM+TkMCdg
	q5kblahlrYE6ThdM0uBE+ryMBA==
X-Google-Smtp-Source: AGHT+IFmkRg7YbI2Ea7JVADPY1W3RJWHoMKWbT5uycw7piPqswo1SNCfaKYsHAeYee6tgLPbqHLkgQ==
X-Received: by 2002:a05:6000:1758:b0:329:6d09:61f7 with SMTP id m24-20020a056000175800b003296d0961f7mr6094220wrf.48.1696845105028;
        Mon, 09 Oct 2023 02:51:45 -0700 (PDT)
References: <cover.1693311370.git.viresh.kumar@linaro.org>
 <52b07a3861a34fb0deb6251bae8bd885815c6944.1693311370.git.viresh.kumar@linaro.org>
 <fb79fa9a-e91c-4bb7-8aee-c384b99df953@suse.com>
 <20231005063231.vqwhfnlc64phwmto@vireshk-i7>
User-agent: mu4e 1.11.22; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, stratos-dev@op-lists.linaro.org, Erik
 Schilling <erik.schilling@linaro.org>, Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] xen: privcmd: Add support for ioeventfd
Date: Mon, 09 Oct 2023 10:40:48 +0100
In-reply-to: <20231005063231.vqwhfnlc64phwmto@vireshk-i7>
Message-ID: <877cnwqg27.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Viresh Kumar <viresh.kumar@linaro.org> writes:

> On 29-09-23, 07:46, Juergen Gross wrote:
>> On 29.08.23 14:29, Viresh Kumar wrote:
>> > +static irqreturn_t ioeventfd_interrupt(int irq, void *dev_id)
>> > +{
>> > +	struct ioreq_port *port =3D dev_id;
>> > +	struct privcmd_kernel_ioreq *kioreq =3D port->kioreq;
>> > +	struct ioreq *ioreq =3D &kioreq->ioreq[port->vcpu];
>> > +	struct privcmd_kernel_ioeventfd *kioeventfd;
>> > +	unsigned int state =3D STATE_IOREQ_READY;
>> > +
>> > +	if (ioreq->state !=3D STATE_IOREQ_READY ||
>> > +	    ioreq->type !=3D IOREQ_TYPE_COPY || ioreq->dir !=3D IOREQ_WRITE)
>> > +		return IRQ_NONE;
>> > +
>> > +	smp_mb();
>> > +	ioreq->state =3D STATE_IOREQ_INPROCESS;
>> > +
>> > +	mutex_lock(&kioreq->lock);
>> > +	list_for_each_entry(kioeventfd, &kioreq->ioeventfds, list) {
>> > +		if (ioreq->addr =3D=3D kioeventfd->addr + VIRTIO_MMIO_QUEUE_NOTIFY =
&&
>> > +		    ioreq->size =3D=3D kioeventfd->addr_len &&
>> > +		    (ioreq->data & QUEUE_NOTIFY_VQ_MASK) =3D=3D kioeventfd->vq) {
>> > +			eventfd_signal(kioeventfd->eventfd, 1);
>> > +			state =3D STATE_IORESP_READY;
>> > +			break;
>> > +		}
>> > +	}
>> > +	mutex_unlock(&kioreq->lock);
>> > +
>> > +	smp_mb();
>>=20
>> Is this really needed after calling mutex_unlock()? I think you are tryi=
ng to
>> avoid any accesses to go past ioreq->state modification. If so, add a co=
mment
>> (either why you need the barrier, or that you don't need it due to the u=
nlock).
>
> Right, want all writes to finish before updating state.

I thought generally sync points act as full barriers. Doing a bunch of
grepping I think ends at:

  static __always_inline bool __mutex_unlock_fast(struct mutex *lock)
  {
          unsigned long curr =3D (unsigned long)current;

          return atomic_long_try_cmpxchg_release(&lock->owner, &curr, 0UL);
  }

so you should already have completed your writes by that point.

>
>> In general, shouldn't the state be checked and modified in the locked ar=
ea?
>
> The handler runs separately for each vcpu and shouldn't run in parallel f=
or the
> same vcpu. And so only one thread should ever be accessing ioreq port str=
ucture.
>
> The lock is there to protect the ioeventfds list (as mentioned in struct
> declaration) against parallel access, as threads for different vcpus may =
end up
> accessing it simultaneously.


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


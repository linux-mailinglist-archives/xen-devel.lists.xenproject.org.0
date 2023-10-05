Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4A27B9B1A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 08:33:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612843.952967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoHua-00069O-KH; Thu, 05 Oct 2023 06:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612843.952967; Thu, 05 Oct 2023 06:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoHua-00066E-GW; Thu, 05 Oct 2023 06:32:40 +0000
Received: by outflank-mailman (input) for mailman id 612843;
 Thu, 05 Oct 2023 06:32:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGTv=FT=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1qoHuZ-000668-5A
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 06:32:39 +0000
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [2607:f8b0:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f894974e-6348-11ee-9b0d-b553b5be7939;
 Thu, 05 Oct 2023 08:32:36 +0200 (CEST)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-690d2441b95so500358b3a.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Oct 2023 23:32:36 -0700 (PDT)
Received: from localhost ([122.172.81.92]) by smtp.gmail.com with ESMTPSA id
 e18-20020aa78c52000000b0068fb8080939sm592379pfd.65.2023.10.04.23.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 23:32:33 -0700 (PDT)
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
X-Inumbo-ID: f894974e-6348-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696487555; x=1697092355; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/5eX5GBp7k2hHn5lrQWKK4MymvEqMThCeZQ6rRZTrco=;
        b=aZvdvlGLjSdrMhuCNrAzrVYCODESBQyidWQ5YKiU6B4xF0ntpvdMfox/Oj9hQoaLqF
         yt7SAU45T4XrLZRfHq3+7Okno/UxgoTDLJmkaPcEd9lbMq891AxBSGZmOFb6JS/0km5O
         +fNtK8d5fZKXPlIPTgaNiN2m8zTcYX92deOoJInGWzyOvmKO49mokIaAZRTuMgJKN4g0
         HoNJSzoP9lAZQ6AsCVCdAbUXsWCSCChfI0zYJvJ8qOXdVElup35VGodEERM0JSwgZTcs
         uS0oT2nlvltOZ20bSChMZgNFL2AJfEXDo8+KjqdF0/aNBif8Tduow1LBuhCoIwTJxo2p
         uKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696487555; x=1697092355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5eX5GBp7k2hHn5lrQWKK4MymvEqMThCeZQ6rRZTrco=;
        b=ZIdv+/nA44xK6dbsD6PJvV28cm1DAVTVRyoPKQ6QNtNwyi8HNICvaTFS/iBIXGs6y7
         8q+hmvUg+GbwpA6PYMUTOMNe0teCQi+2Kx46qHBpwY4cPFXsEZ9wOJQi80SSJIwTu/BA
         sCy9t5l3mNME2Ajwej1XGBsa9k/swLlEVp+b4hr01fdltspmNiESJR1tM4nXFBx+EYJw
         R3BGFTKmScUZlLifR+/HDGXWv8oUtTVuwS8JlMWESYqpIcUtue0wCFJfrGIwb0tBmcqZ
         sAu439Szhfy7QxaONaWOJxDdXOeS+HSgHIjCJYZntTN+XR8eEKtytjEwQzPKd1vXwP3E
         9evw==
X-Gm-Message-State: AOJu0YzhcyuFRgV/zjrV3mDF+erqoxrqdRQuOm8tjKvxtDYnz7BAVMLe
	RCK5r68U1ehu1+2C1TyHZDKt+Q==
X-Google-Smtp-Source: AGHT+IGb+mCHo4FRpXitGXCKr5LQdAZTu+neO70o7JLurE2biwBEnclAQiw0CsTWJXIF841T9qLiXw==
X-Received: by 2002:a05:6a00:3a18:b0:691:27b:15b4 with SMTP id fj24-20020a056a003a1800b00691027b15b4mr820494pfb.5.1696487554588;
        Wed, 04 Oct 2023 23:32:34 -0700 (PDT)
Date: Thu, 5 Oct 2023 12:02:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Erik Schilling <erik.schilling@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] xen: privcmd: Add support for ioeventfd
Message-ID: <20231005063231.vqwhfnlc64phwmto@vireshk-i7>
References: <cover.1693311370.git.viresh.kumar@linaro.org>
 <52b07a3861a34fb0deb6251bae8bd885815c6944.1693311370.git.viresh.kumar@linaro.org>
 <fb79fa9a-e91c-4bb7-8aee-c384b99df953@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb79fa9a-e91c-4bb7-8aee-c384b99df953@suse.com>

On 29-09-23, 07:46, Juergen Gross wrote:
> On 29.08.23 14:29, Viresh Kumar wrote:
> > +static irqreturn_t ioeventfd_interrupt(int irq, void *dev_id)
> > +{
> > +	struct ioreq_port *port = dev_id;
> > +	struct privcmd_kernel_ioreq *kioreq = port->kioreq;
> > +	struct ioreq *ioreq = &kioreq->ioreq[port->vcpu];
> > +	struct privcmd_kernel_ioeventfd *kioeventfd;
> > +	unsigned int state = STATE_IOREQ_READY;
> > +
> > +	if (ioreq->state != STATE_IOREQ_READY ||
> > +	    ioreq->type != IOREQ_TYPE_COPY || ioreq->dir != IOREQ_WRITE)
> > +		return IRQ_NONE;
> > +
> > +	smp_mb();
> > +	ioreq->state = STATE_IOREQ_INPROCESS;
> > +
> > +	mutex_lock(&kioreq->lock);
> > +	list_for_each_entry(kioeventfd, &kioreq->ioeventfds, list) {
> > +		if (ioreq->addr == kioeventfd->addr + VIRTIO_MMIO_QUEUE_NOTIFY &&
> > +		    ioreq->size == kioeventfd->addr_len &&
> > +		    (ioreq->data & QUEUE_NOTIFY_VQ_MASK) == kioeventfd->vq) {
> > +			eventfd_signal(kioeventfd->eventfd, 1);
> > +			state = STATE_IORESP_READY;
> > +			break;
> > +		}
> > +	}
> > +	mutex_unlock(&kioreq->lock);
> > +
> > +	smp_mb();
> 
> Is this really needed after calling mutex_unlock()? I think you are trying to
> avoid any accesses to go past ioreq->state modification. If so, add a comment
> (either why you need the barrier, or that you don't need it due to the unlock).

Right, want all writes to finish before updating state.

> In general, shouldn't the state be checked and modified in the locked area?

The handler runs separately for each vcpu and shouldn't run in parallel for the
same vcpu. And so only one thread should ever be accessing ioreq port structure.

The lock is there to protect the ioeventfds list (as mentioned in struct
declaration) against parallel access, as threads for different vcpus may end up
accessing it simultaneously.

-- 
viresh


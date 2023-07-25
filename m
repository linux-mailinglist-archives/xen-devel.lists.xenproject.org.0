Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B46E760B34
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 09:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569473.890259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOCAc-00021S-T1; Tue, 25 Jul 2023 07:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569473.890259; Tue, 25 Jul 2023 07:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOCAc-0001zU-Ol; Tue, 25 Jul 2023 07:09:22 +0000
Received: by outflank-mailman (input) for mailman id 569473;
 Tue, 25 Jul 2023 07:09:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QXT9=DL=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1qOCAa-0001zO-Oz
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 07:09:20 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b48b868-2aba-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 09:09:18 +0200 (CEST)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1b890e2b9b7so26217995ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jul 2023 00:09:18 -0700 (PDT)
Received: from localhost ([122.172.87.195]) by smtp.gmail.com with ESMTPSA id
 l2-20020a170902f68200b001b89536974bsm10201845plg.202.2023.07.25.00.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 00:09:16 -0700 (PDT)
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
X-Inumbo-ID: 2b48b868-2aba-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690268957; x=1690873757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JIQ8MXgj79FPzxbU+Oz451tZts6uK1mso7WDqsxExFY=;
        b=VfntkoCSVssXo9LyVkGrt2TjunbWhF2qI/ykhbvzXpC9QmOrjiIdmtvZR/ssn8+Q1W
         uKQI3M1s0Uo8nufkszQL5PlNxyQrSbsDGQqFJBErhYh4k0XjilNPlVjWbvs1kGU9ymvt
         LPdeD7WxsbmnJDmAJSFZgj3y+nQlv1qn85ECPP47p5eMhWBffwI5DiGHmFBU4QTLouax
         UYG2osFUGhVt6Py0/Bo8TrqsjEXtKadDvJxf0sRLJwCT8UCtvfyTHRk2S3kW+qoVSWCv
         QwGo+WsR7TlD5JRpQyoD2EXZgk6dMbMVrXrDwFeQR1gbY2Rz7jly+gL0qfmRAHTCtJ/m
         IV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690268957; x=1690873757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIQ8MXgj79FPzxbU+Oz451tZts6uK1mso7WDqsxExFY=;
        b=XXj/X41ngn0ebrxYdI216AJQQ3FP1Nzhtgoxroe/R7KL9u+uMKykM3R5Yuz/rCTdvn
         4YQTUnIvkOFPPqTwS4MCZv+wEVmGExY6maUY6YANnGIJeggvIR9QAaX6IuDWrjdPoHaG
         /ToaDdNS1dQDbnaBrkSXe9Q2/1/nNsn2ndIb57UG3PWAuZLewueWMsLuymhNrGh9rDw6
         1fbh5jhdoEulxyJE06DWjsL3qkD6VwC+Uv1nOHC/wjOUjuJ9ugx4W/mA3qGzOrR8w6kN
         8gPJhrAs0I81BZaRa3KzMz+h5wZRTFEJ4HSrr1L92TLoV49l5ANjep1SIZyZgaVyo8hw
         HCPw==
X-Gm-Message-State: ABy/qLY3wbers+uEinNAqk1CuDKW1wSnd3r+ceXX/EE3MCNIeq9LQzkC
	V5r+s0zFnFXLhRH363ZFL7RcvQ==
X-Google-Smtp-Source: APBJJlH8GuZfYFneyMg85Bl3e/BeTCnIRoDterkLPKXOwUe47EpC07JsTIRlFxwn8ihA2rpmJFhqeQ==
X-Received: by 2002:a17:902:ea04:b0:1b8:b3f9:58e5 with SMTP id s4-20020a170902ea0400b001b8b3f958e5mr12453743plg.38.1690268956688;
        Tue, 25 Jul 2023 00:09:16 -0700 (PDT)
Date: Tue, 25 Jul 2023 12:39:14 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Erik Schilling <erik.schilling@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH V3 1/2] xen: Update dm_op.h from Xen public header
Message-ID: <20230725070914.m3dxlokedrgjlgcu@vireshk-i7>
References: <ffae9d7021829fea19fd93fda3c30b52b0af923e.1690190453.git.viresh.kumar@linaro.org>
 <1498bef6-ded0-1b1f-a5ca-e8755800b489@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1498bef6-ded0-1b1f-a5ca-e8755800b489@suse.com>

On 25-07-23, 09:04, Jan Beulich wrote:
> On 25.07.2023 08:47, Viresh Kumar wrote:
> > +struct xen_dm_op {
> > +    uint32_t op;
> > +    uint32_t pad;
> > +    union {
> > +        struct xen_dm_op_create_ioreq_server create_ioreq_server;
> > +        struct xen_dm_op_get_ioreq_server_info get_ioreq_server_info;
> > +        struct xen_dm_op_ioreq_server_range map_io_range_to_ioreq_server;
> > +        struct xen_dm_op_ioreq_server_range unmap_io_range_from_ioreq_server;
> > +        struct xen_dm_op_set_ioreq_server_state set_ioreq_server_state;
> > +        struct xen_dm_op_destroy_ioreq_server destroy_ioreq_server;
> > +        struct xen_dm_op_track_dirty_vram track_dirty_vram;
> > +        struct xen_dm_op_set_pci_intx_level set_pci_intx_level;
> > +        struct xen_dm_op_set_isa_irq_level set_isa_irq_level;
> > +        struct xen_dm_op_set_irq_level set_irq_level;
> > +        struct xen_dm_op_set_pci_link_route set_pci_link_route;
> > +        struct xen_dm_op_modified_memory modified_memory;
> > +        struct xen_dm_op_set_mem_type set_mem_type;
> > +        struct xen_dm_op_inject_event inject_event;
> > +        struct xen_dm_op_inject_msi inject_msi;
> > +        struct xen_dm_op_map_mem_type_to_ioreq_server map_mem_type_to_ioreq_server;
> > +        struct xen_dm_op_remote_shutdown remote_shutdown;
> > +        struct xen_dm_op_relocate_memory relocate_memory;
> > +        struct xen_dm_op_pin_memory_cacheattr pin_memory_cacheattr;
> > +        struct xen_dm_op_nr_vcpus nr_vcpus;
> > +    } u;
> > +};
> 
> Is sync-ing for the sake of sync-ing really useful? For example, are any
> of the ioreq server elements halfway likely to ever be used in the kernel?

The only field, out of the union, I am using for now is:

        struct xen_dm_op_set_irq_level set_irq_level;

I am not sure if some of the others are going to be used or not in the
future.

FWIW, I am also looking at solving a similar problem for Ioeventfds
(kick from guest to backend) and may end up using a few more of these.
But they can very well be contained in that patchset.

-- 
viresh


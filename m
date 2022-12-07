Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B4E64504A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 01:22:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455727.713285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2iC1-0005aU-Jt; Wed, 07 Dec 2022 00:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455727.713285; Wed, 07 Dec 2022 00:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2iC1-0005YM-GZ; Wed, 07 Dec 2022 00:21:45 +0000
Received: by outflank-mailman (input) for mailman id 455727;
 Wed, 07 Dec 2022 00:21:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QqWv=4F=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p2iC0-0005YG-MW
 for xen-devel@lists.xen.org; Wed, 07 Dec 2022 00:21:44 +0000
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [2607:f8b0:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fd0d1ad-75c5-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 01:21:43 +0100 (CET)
Received: by mail-pg1-x535.google.com with SMTP id s196so14852042pgs.3
 for <xen-devel@lists.xen.org>; Tue, 06 Dec 2022 16:21:43 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 n2-20020a622702000000b00575467891besm8590343pfn.136.2022.12.06.16.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 16:21:40 -0800 (PST)
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
X-Inumbo-ID: 1fd0d1ad-75c5-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gmKSXzYaWuqWi0vndGsNYD8jskOqYOcLpfPluMuhPq8=;
        b=kjT2+KimRkRzbeIMcxUKrPUecD/3AAIXLNpKKTlM9aInpDS73K+UBRK+xMJmA0TNAB
         bvZ01H2vGrAPTMICdSeliaJ0PzbbEscrtWl/tFS5gYDn57Lu1X9A1tRevfOUBNrzkRrH
         vpfRkl0LrgmWgK0pI/14C5ad55ZapZClIGQXoydG2QB8+jACCCX0RIxpUZiYvxwoe4YG
         E2c++zgh74SjRhfEPtfP7CC0YV2MAAyeH2XJcfmmSGK4/uUV8Vn2SK0/nepvdVmf7WAv
         2OW3P2TPxSOWM87bFWfabYHcAIg9nN+ZXQuakk8oPVdIcwafx+4TpMGMlghCpJvT0ro3
         i2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmKSXzYaWuqWi0vndGsNYD8jskOqYOcLpfPluMuhPq8=;
        b=vEgYbx4OWfWhJKOROV81ocPtHh5qzrjx+EZz5fIXY3ZejsLfJyige1UDxRAM/Rc7+a
         Z7q+GEo1BPmqPkgG5Tda8Y3On1gmdX62yJEjGJtII1eNOHrON+ZFSYenyx+BCcqQboxZ
         9048BrOB8glxov5C9h183GPp7hgVmfBhdloTCZKR5BBGjqfzS4T8O8v+/niDbrnTqU66
         HovzyMqkP6yE7pJKzlBaX+VSBYMR4MfXls9q1/9wodta/pO98GfRPzrG4CJQAKqtwwU4
         nyIcFeXQwiQqtkoPuZS/P91QtSRtO2E5CJpQ9WiauW85FDnOH0Y6tvvjGT0vLXx/0zfM
         Ln5Q==
X-Gm-Message-State: ANoB5pn4LNlbMO9DQtGk1vV6bz7OYWFipWXJMJeQGKr7NLV7TUinCAQg
	4zD2Ge0lMPFTkZXbA1+J2T0ObQ==
X-Google-Smtp-Source: AA0mqf40KA5i0MhQcXAaTa7YIqw0IAn7ekRi9iID1PGNUAxPegYpjaNks+uqzAz0m9ugflxU+T+QBA==
X-Received: by 2002:a63:f406:0:b0:477:cc1f:204 with SMTP id g6-20020a63f406000000b00477cc1f0204mr54779368pgi.592.1670372501401;
        Tue, 06 Dec 2022 16:21:41 -0800 (PST)
Date: Wed, 7 Dec 2022 05:51:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xen.org
Subject: Re: Virtio-disk updates for latest Xen ?
Message-ID: <20221207002138.qulrlav3z3heozk4@vireshk-i7>
References: <CAKohpo=u7qp4URjRRAMM4xEytmZoKZAJOZLw4v0HTk13BrK-fw@mail.gmail.com>
 <CAPD2p-kfhaygmNNutUdk-mApR7z1YDSTYCEhtLgLsXi+-wbv8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPD2p-kfhaygmNNutUdk-mApR7z1YDSTYCEhtLgLsXi+-wbv8A@mail.gmail.com>

+list

On 06-12-22, 13:40, Oleksandr Tyshchenko wrote:
> On Tue, Dec 6, 2022 at 1:15 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > Hi Oleksandr,
> Hello Viresh
> >
> > I found that my rust counterpart [1] of virtio-disk repository broke
> > with this commit:
> >
> > commit 3a96013a3e17 ("tools/xenstore: reduce number of watch events")
> >
> > And so was wondering if you have already fixed that for
> > virtio-disk or not. And I can just copy what you have changed :)
> >
> 
> Interesting, I am not aware of that issue. I haven't tried virtio-disk with
> recent (latest) Xen, I was mostly playing with Qemu backends. Thanks for
> letting me know, I will re-check once I have access to my hardware again.

Hmm, moved a little closer :)

We look at the watch events here [2] one by one and wait for the
directory one to come ("backend/disk" in your case I think, it is
"backend/virtio" with my latest patches). This is the second directory
event which used to come after the directory is finalized.

Earlier the events were read for following paths:

"backend/virtio"
"backend/virtio/1/0"
"backend/virtio/1"
"backend/virtio"

and on the last event, we used to go ahead and look at the directory
to find the FE domid.

With the new changes, the events I am getting are:

[src/xs.rs:164] &name = "backend/virtio"
[src/xs.rs:164] &name = "backend/virtio/1/0"
[src/xs.rs:164] &name = "backend/virtio/1/0/frontend"
[src/xs.rs:164] &name = "backend/virtio/1/0/frontend-id"
[src/xs.rs:164] &name = "backend/virtio/1/0/online"
[src/xs.rs:164] &name = "backend/virtio/1/0/state"
[src/xs.rs:164] &name = "backend/virtio/1/0/irq"
[src/xs.rs:164] &name = "backend/virtio/1/0/base"
[src/xs.rs:164] &name = "backend/virtio/1/0/type"
[src/xs.rs:164] &name = "backend/virtio/1/0/transport"

Here the second event for "backend/virtio" never comes and so we fail.

I am not sure how to get this working, as there is no finalizing event
for the directory. Maybe our design is broken from the start and we
need to do it properly in some recommended way ?
 
> >
> > The guest kernel crashes for me during boot, while
> > accessing MMIO registers, because the backend side isn't
> > properly initialized now with changes in the watch events
> > due to above commit.
> >
> > Thanks in advance.
> >
> > --
> > Viresh
> >
> > [1] https://github.com/vireshk/xen-vhost-frontend
> 
> -- 
> Regards,
> 
> Oleksandr Tyshchenko

-- 
viresh

[2] https://github.com/otyshchenko1/virtio-disk/blob/virtio_grant/xs_dev.c#L424


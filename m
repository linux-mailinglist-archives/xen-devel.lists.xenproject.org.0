Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6174248C66A
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 15:49:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256695.440639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ewN-00060e-S7; Wed, 12 Jan 2022 14:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256695.440639; Wed, 12 Jan 2022 14:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ewN-0005yR-NW; Wed, 12 Jan 2022 14:49:31 +0000
Received: by outflank-mailman (input) for mailman id 256695;
 Wed, 12 Jan 2022 14:49:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sYkP=R4=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1n7ewM-0005yL-MN
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 14:49:30 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d89e29a5-73b6-11ec-9c70-5536b2d1e4e1;
 Wed, 12 Jan 2022 15:49:29 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id e3so6219837lfc.9
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jan 2022 06:49:29 -0800 (PST)
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
X-Inumbo-ID: d89e29a5-73b6-11ec-9c70-5536b2d1e4e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WHIhYC3gdGHJzmUDZAG5gqn0GnXChwnbc6O3EbCtFfc=;
        b=jcaa8ErfJbccwYJphiAjSxgVCWfLWkmggHrTvn7XmCaq+8j1PMTCjS0iUmoyYoDMcM
         ffK00pLGkX39dzhzbrzcWFJ2PirDvgIj4omSgrJSrJ01wolu/Qu26EU0Tr7pQN72f/ew
         dr5davtMbbEyNK7DkzeD8CP7HzBYt5Ytx7IKRMPrfU3oT1fYRqIFnwQMVeY2RJAIsD38
         co5/9jyebFoRh/x7Vai9XQ4mDogZI/Q6yFnJmhemq5yc+oITj/BC7WOeQUt/gFruY1if
         iwmaLZIGKMWpxUzrd5HxAyWBDRt6UUN0gCAfnuVLM04R3o3e8KnRKMeug8KDR/vtdb1x
         QeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WHIhYC3gdGHJzmUDZAG5gqn0GnXChwnbc6O3EbCtFfc=;
        b=Aw3JHj5qqtbUWHm7705mAdam0DjksHNkyd6lRfScrmWvU/+K6ywJPUnXw90uafABKN
         M+6lGZ2Jo2hvrqOaskwZbuIMf6jnvyPQ+K6PBKmSaUSxDHnx7PsMR8ae4Ru1L92Clidi
         sDTYH+eYtL9lgOx4JMJBxqiW3QOn/iSrw7XawJuSwm1qvrp9T1oq+28avPVyc3mMUy7s
         WtsWKvFK5uXDWAO2o+BQZB9cYSpgADwzOgnwcg+0G8Q2MKfBMwTIxiRaYPrsNPTIQldw
         RmEpZHUPWuXVz/W4M5r0XAZvZqZkUjDNCWnzoJrhyPK1qU9uwZYZH0NAONdDvcEjJxSO
         JyhA==
X-Gm-Message-State: AOAM531kAEYoWDhxZl2shWk4PdBHw+gqR07qy6yIys0xGxIgSP6txOg1
	iQDXz0Lstm4TNCRfqJpPsDLfCVMQPyKOIZ0Vrg0=
X-Google-Smtp-Source: ABdhPJw7OzWywl9Yw+IvZBUVTBVTL8Tl6l339VAIuGh5FFoA1LdWumzPf4FpgyK4C13YFiVrsTeY6J9gWtFTu5oIgPk=
X-Received: by 2002:a05:6512:3a8f:: with SMTP id q15mr89442lfu.128.1641998969412;
 Wed, 12 Jan 2022 06:49:29 -0800 (PST)
MIME-Version: 1.0
References: <8b95ffea-d664-ce87-e386-73a06c265cac@web.de>
In-Reply-To: <8b95ffea-d664-ce87-e386-73a06c265cac@web.de>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 12 Jan 2022 09:49:17 -0500
Message-ID: <CAKf6xpuuNVV_2g+hDTvHMPg3-QWxP_jABCUi3i4c245SkLtg0g@mail.gmail.com>
Subject: Re: device model: spawn failed (rc=-3)
To: Ronny Wagner <starchip2000@web.de>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 12, 2022 at 9:20 AM Ronny Wagner <starchip2000@web.de> wrote:
>
> Hello,

Hi

> i restart my windows domU today.
>
> And now, the domU don't start. Have anyone a idea, why? I am not change
> any config on the Host.
>
> Thank you for helping!
>
> Fail-Message:
> root@server ~ # xl create -f /etc/xen/domU.cfg
> Parsing config from /etc/xen/domU.cfg
> libxl: error: libxl_dm.c:3131:device_model_spawn_outcome: Domain
> 24:domain 24 device model: spawn failed (rc=-3)
> libxl: error: libxl_dm.c:3351:device_model_postconfig_done: Domain
> 24:Post DM startup configs failed, rc=-3
> libxl: error: libxl_create.c:1867:domcreate_devmodel_started: Domain
> 24:device model did not start: -3
> libxl: error: libxl_aoutils.c:646:libxl__kill_xs_path: Device Model
> already exited
> libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain
> 24:Non-existant domain
> libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain
> 24:Unable to destroy guest
> libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain
> 24:Destruction of domain failed

Look in /var/log/xen/qemu-dm-domU.log (domU matching the domain's
name) to see why QEMU exited.

Regards,
Jason


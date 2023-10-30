Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B08B7DBE0F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 17:37:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625318.974513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxVGi-0002nl-3k; Mon, 30 Oct 2023 16:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625318.974513; Mon, 30 Oct 2023 16:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxVGi-0002lF-0l; Mon, 30 Oct 2023 16:37:36 +0000
Received: by outflank-mailman (input) for mailman id 625318;
 Mon, 30 Oct 2023 16:37:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3VkP=GM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qxVGh-0002l9-6y
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 16:37:35 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fea0c78-7742-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 17:37:33 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9d2c54482fbso261529366b.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Oct 2023 09:37:33 -0700 (PDT)
Received: from localhost ([213.195.118.109]) by smtp.gmail.com with ESMTPSA id
 r23-20020a170906365700b009aa292a2df2sm6246691ejb.217.2023.10.30.09.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 09:37:32 -0700 (PDT)
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
X-Inumbo-ID: 9fea0c78-7742-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698683852; x=1699288652; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tlNly9ZP+NGfbt2hySpMNPj3rxIySBkhl8v30f0zE90=;
        b=i3EcO5oBib/nRfVusbqlX0RYiTKhbmBwwhtTyq7gRvBhAlaIHFn/qwfTBq2Woi3CTi
         jWcn91swpzTPhjtqK+5A5kncog2jCer51oF4cvpsoZTqGjwvhkbshfty7m8iMhCGxIuy
         yVPLNHmeOxZo+CayqYr/oKCTiPvHuVlfp6kow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698683852; x=1699288652;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tlNly9ZP+NGfbt2hySpMNPj3rxIySBkhl8v30f0zE90=;
        b=J7mwi4F9LAJ2dy12NHow0tn17/lpm1gHPrVfawRU+so45nSfGuEPzsDrmaDPm8CQW1
         7SvjEaQH6NJhxOdnWmYUHJfkA2T6nqMQDbwEwFSHulSFLTkySYJ6n9hAnvzAawsyg8Od
         aeoE3qm5XSH3y34iY4WnLBlqT2D0x7KHhsOCi+niXb0s+VqBt3//bTWfh+PeaoEFNCCt
         MbRn+0DlNx+9QlKCeiVViS6XjqYGoaQ0trgG1LEfWct5CJ2qUGQZrYSuD4ZjK3vxcmOt
         0k9nwzQoriLlY0fjSCg+RgxMoTJNk6zv1jopxqSRzDQ3YF2Co2f9qHqjqpwdl5UScvQA
         g3ig==
X-Gm-Message-State: AOJu0Yy/JMXRDA9LChqu5xvvMtQ4fZNzaZqV/DdeoAOYzMtp41QcYxvR
	GM66rd4zOIxJnp9suVYjzp/3Og==
X-Google-Smtp-Source: AGHT+IHDQC6PJXSU78oJOHaFHgG9+nm8R7d5VWS0uk7xK9HphBw0eJK8IHUJ7MDD8jD/fh5jf8oS0w==
X-Received: by 2002:a17:907:7ba0:b0:9af:9c4f:b579 with SMTP id ne32-20020a1709077ba000b009af9c4fb579mr10822975ejc.18.1698683852612;
        Mon, 30 Oct 2023 09:37:32 -0700 (PDT)
Date: Mon, 30 Oct 2023 17:37:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86/hvm/dom0: fix PVH initrd and metadata placement
Message-ID: <ZT_by3lesO5TWdy_@macbook>
References: <20231030133240.116758-1-xenia.ragiadakou@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231030133240.116758-1-xenia.ragiadakou@amd.com>

On Mon, Oct 30, 2023 at 03:32:40PM +0200, Xenia Ragiadakou wrote:
> Given that start < kernel_end and end > kernel_start, the logic that
> determines the best placement for dom0 initrd and metadata, does not
> take into account the three cases below:
> (1) start > kernel_start && end > kernel_end
> (2) start < kernel_start && end < kernel_end
> (3) start > kernel_start && end < kernel_end
> 
> In case (1), the evaluation will result in end = kernel_start,
> i.e. end < start, and will load initrd in the middle of the kernel.
> In case (2), the evaluation will result in start = kernel_end,
> i.e. end < start, and will load initrd at kernel_end, that is out
> of the memory region under evaluation.
> In case (3), the evaluation will result in either end = kernel_start
> or start = kernel_end but in both cases will be end < start, and
> will either load initrd in the middle of the image, or arbitrarily
> at kernel_end.
> 
> This patch reorganizes the conditionals to include so far unconsidered
> cases as well, uniformly returning the lowest available address.

It would be good to mention that this was discovered because Zephyr
has multiple loaded segments in non-contiguous ranges, so that we know
what triggered the change and how we could test further improvements
(like the usage of a rangeset).

> 
> Fixes: 73b47eea2104 ('x86/dom0: improve PVH initrd and metadata placement')
> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

With the commit message adjusted preferably.

Thanks, Roger.


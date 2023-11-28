Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F05287FBCAD
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 15:25:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643249.1003238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7z1Z-00027w-DR; Tue, 28 Nov 2023 14:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643249.1003238; Tue, 28 Nov 2023 14:25:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7z1Z-00025Y-Ae; Tue, 28 Nov 2023 14:25:17 +0000
Received: by outflank-mailman (input) for mailman id 643249;
 Tue, 28 Nov 2023 14:25:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PT6c=HJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r7z1X-00025S-Bc
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 14:25:15 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f189ea29-8df9-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 15:25:13 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40b4f6006d5so3467835e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 06:25:13 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 u4-20020a05600c138400b004065e235417sm18384941wmf.21.2023.11.28.06.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 06:25:12 -0800 (PST)
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
X-Inumbo-ID: f189ea29-8df9-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701181513; x=1701786313; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eBh6DRsosWy2QUl1WoyyGDk5mSjieb4+YhhSeYKF1Mw=;
        b=eMgWDPUN/mmWa3ASsFvzaZ98/Xs0iLwOrKW+NxETemlux4cPqVZENftx8S9h0MM+e+
         W+a9juKAnVgpfOznPgIyfQZL2xui0hhG/vsmlY2G6Tmu5OapTYKVsWst1l3IbX2D62zz
         MRVeFb+7Aew094+fzMeKRRkYq8mCldGc+nvR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701181513; x=1701786313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBh6DRsosWy2QUl1WoyyGDk5mSjieb4+YhhSeYKF1Mw=;
        b=bLrjwXU7GHjsISPLP7qFo5rXtal+6NtpNtPcKgEb6W2T4NhWgsAd/I+Mp3+jEhgPC9
         P4lAKtoan8nLIBI2u/I6bcC/jSQMxKOu64c/9+vD2/YKkKMnqIbfQat92Z8D1Y9BRg5o
         g4cB2fq6Z/JtA+W5LJBRU7iCFK59+c58stD2UItK7WFyrsp8h+bEL7totaM5u/CEUudg
         7wvZDzifW768YTxmLtmM2O1Me1W98uWv4JPgqP8N5nKgATWfF9R6cUmSWLyFsjN3AAyg
         TT/7bMqHdpa3dVBzwyaGWPFBc2+ug8Pe3HAyIU/4xrVguesZKDAT44qvXFCbO7vj0xAH
         DCuw==
X-Gm-Message-State: AOJu0Yz/CR2p9/3ntA6I63hkYLbwCNj0VCr9j9o/t/55MMf9S8z0EaUo
	YBFlp0/05FJF3d66XAUSIl4bzw==
X-Google-Smtp-Source: AGHT+IHe0MPO8nPyZ/8M3LQxyesFeGywGLMICn+H5RoaDQA510JLU/smF8UTk4G47mVU4RChNe7Hgg==
X-Received: by 2002:a05:600c:524a:b0:40b:4ba1:c502 with SMTP id fc10-20020a05600c524a00b0040b4ba1c502mr1737243wmb.37.1701181513012;
        Tue, 28 Nov 2023 06:25:13 -0800 (PST)
Date: Tue, 28 Nov 2023 15:25:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Alex Deucher <Alexander.Deucher@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Huang Rui <Ray.Huang@amd.com>,
	Honglei Huang <Honglei1.Huang@amd.com>,
	Julia Zhang <Julia.Zhang@amd.com>
Subject: Re: [RFC XEN PATCH v2 3/3] tools: Add new function to get gsi from
 irq
Message-ID: <ZWX4R9UEE6oXiqaz@macbook>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-4-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231124104136.3263722-4-Jiqian.Chen@amd.com>

On Fri, Nov 24, 2023 at 06:41:36PM +0800, Jiqian Chen wrote:
> In PVH dom0, it uses the linux local interrupt mechanism,
> when it allocs irq for a gsi, it is dynamic, and follow
> the principle of applying first, distributing first. And
> if you debug the kernel codes, you will find the irq
> number is alloced from small to large, but the applying
> gsi number is not, may gsi 38 comes before gsi 28, that
> causes the irq number is not equal with the gsi number.
> And when we passthrough a device, QEMU will use its gsi
> number to do mapping actions, see xen_pt_realize->
> xc_physdev_map_pirq, but the gsi number is got from file
> /sys/bus/pci/devices/xxxx:xx:xx.x/irq in current code,
> so it will fail when mapping.
> And in current codes, there is no method to translate
> irq to gsi for userspace.

I think it would be cleaner to just introduce a new sysfs node that
contains the gsi if a device is using one (much like the irq sysfs
node)?

Such ioctl to translate from IRQ to GSI has nothing to do with Xen, so
placing it in privcmd does seem quite strange to me.  I understand
that for passthrough we need the GSI, but such translation layer from
IRQ to GSI is all Linux internal, and it would be much simpler to just
expose the GSI in sysfs IMO.

Thanks, Roger.


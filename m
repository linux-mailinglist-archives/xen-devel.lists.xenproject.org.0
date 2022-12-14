Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C37CD64C366
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 06:06:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461647.719764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5JyT-0006iL-IV; Wed, 14 Dec 2022 05:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461647.719764; Wed, 14 Dec 2022 05:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5JyT-0006gU-Fj; Wed, 14 Dec 2022 05:06:33 +0000
Received: by outflank-mailman (input) for mailman id 461647;
 Wed, 14 Dec 2022 05:06:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XtkE=4M=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p5JyR-0006gO-Et
 for xen-devel@lists.xen.org; Wed, 14 Dec 2022 05:06:31 +0000
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 112a09d0-7b6d-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 06:06:30 +0100 (CET)
Received: by mail-pj1-x1036.google.com with SMTP id
 k88-20020a17090a4ce100b00219d0b857bcso5880374pjh.1
 for <xen-devel@lists.xen.org>; Tue, 13 Dec 2022 21:06:29 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 i9-20020a17090332c900b00188ef3ea2b6sm742702plr.262.2022.12.13.21.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 21:06:27 -0800 (PST)
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
X-Inumbo-ID: 112a09d0-7b6d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0/e3VnvaypkEGOcyYVVqy9UzmHR2Tbcq2TMUw0UAtS0=;
        b=tttKxr+5b7nXn2BnzFtE48zxHoC9IYZbEqxhOmjl6HZ107q8BT3JG9xT4CnPHKgWss
         lRwv3YEFZiQjAdarwXiAi9qHsP0CTFBl5wY69KYGzpJrmkDY4SiPV8S0OdEaIwF9imf8
         jcwkYYH9KNuccSJ9SlKxM2VJfnpv+UPl/VtRlEbf8AgkbFzviZ/vaPqe/F0Nwit1X/ze
         iOCg1CIV+F0qQ05wWwS5u2SADo4ggTuZXSUCC1qoeO++OERB6m3CUXh3MRvFnrDE/Cqq
         sb2anosBPVnlZIkd0i6ZL0WvFkWSGEFD+yFLUVeKrZ8MN/jBR985YtO7dNTSYWScHCgW
         uglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/e3VnvaypkEGOcyYVVqy9UzmHR2Tbcq2TMUw0UAtS0=;
        b=cBwSoSMTXCLxO5HBgPoHZCh+uyuSXaOUX+1vd1RWecTnPb9z41USf8PDY8VKJFGr18
         6DVcxtB750KH1PAbdFGaJbcEkiNWYUVK8TW4s+aBqae1qOU4HwfETwv14DgxzmPau3N2
         m0aXrtrnHkjdlWeSMMhQDHKVSbF5i40Kv/cNh0JbB9bDq1es1IEMBGIzVdL1kBGtHOlg
         cuSJ5zCg+XoswJpDyFxSzuD9QjyDLd9XG7ZuXHK0dWWA4IQbJSuQnkiALigl2uFa3K7X
         MJ4TQYrKyinlgZ0gV7V/w2KVklduFj2y9UQlR1+AZYs0sqSK6yBZC1EfocoRMkwx/5Mj
         NMFw==
X-Gm-Message-State: ANoB5pkF8bZ4z0kMyF0yfV2vEtGKzyjCMEeg9dfOetpCNfgu16Nt+QPQ
	ckP+43wNX93+zKfnn7idgWYFCQ==
X-Google-Smtp-Source: AA0mqf6zNb0AnZcjFqGeoeUhCmc+qlyJcvV3hpD/yURMrOxCJc7zGwJ8vZQjCVxTYukODt3heJUtSA==
X-Received: by 2002:a05:6a20:8e1a:b0:ad:c97f:1c1b with SMTP id y26-20020a056a208e1a00b000adc97f1c1bmr9379780pzj.0.1670994388197;
        Tue, 13 Dec 2022 21:06:28 -0800 (PST)
Date: Wed, 14 Dec 2022 10:36:25 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Julien Grall <julien@xen.org>, stratos-dev@op-lists.linaro.org,
	Anthony PERARD <anthony.perard@citrix.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	xen-devel@lists.xen.org,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH V9 1/3] libxl: Add support for generic virtio device
Message-ID: <20221214050625.fvz3gllsyvtrzf4u@vireshk-i7>
References: <cover.1670925998.git.viresh.kumar@linaro.org>
 <01dfa7692457a7f40255645f5239f74797e6db3a.1670925998.git.viresh.kumar@linaro.org>
 <c86ac2ad-3fc3-7250-052e-45936c807dbd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c86ac2ad-3fc3-7250-052e-45936c807dbd@gmail.com>

On 13-12-22, 13:45, Oleksandr Tyshchenko wrote:
> On 13.12.22 12:08, Viresh Kumar wrote:
> > +/* Virtio device types */
> > +#define VIRTIO_DEVICE_TYPE_GENERIC   "virtio,device"
> > +#define VIRTIO_DEVICE_TYPE_GPIO      "virtio,device22"
> > +#define VIRTIO_DEVICE_TYPE_I2C       "virtio,device29"
> 
> 
> Sorry for pointing this out only now, I have just realized that this doesn't
> match device-tree bindings. According to the bindings they should be the
> other way around:
> 
> #define VIRTIO_DEVICE_TYPE_I2C      "virtio,device22"
> #define VIRTIO_DEVICE_TYPE_GPIO       "virtio,device29"

That's a shocker, as I definitely tested this.

Now that I went back and looked at how it didn't break my system, I
found the reason. The string passed in domu.conf in my case is the
valid one: "virtio,device22", which ended up creating a GPIO node
eventually, but with the compatible value of I2C. The kernel didn't
complain as for I2C only the compatible string is checked currently.

-- 
viresh


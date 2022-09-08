Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 926A55B13B3
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 06:25:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402623.644447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oW95w-00089P-Ek; Thu, 08 Sep 2022 04:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402623.644447; Thu, 08 Sep 2022 04:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oW95w-000875-Bf; Thu, 08 Sep 2022 04:24:52 +0000
Received: by outflank-mailman (input) for mailman id 402623;
 Thu, 08 Sep 2022 04:24:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jDMa=ZL=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oW95u-00086z-Ol
 for xen-devel@lists.xen.org; Thu, 08 Sep 2022 04:24:50 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c12726b-2f2e-11ed-af93-0125da4c0113;
 Thu, 08 Sep 2022 06:24:48 +0200 (CEST)
Received: by mail-pl1-x635.google.com with SMTP id s14so7036942plr.4
 for <xen-devel@lists.xen.org>; Wed, 07 Sep 2022 21:24:48 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 f21-20020a623815000000b0053e99f2bf16sm1415633pfa.78.2022.09.07.21.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 21:24:46 -0700 (PDT)
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
X-Inumbo-ID: 2c12726b-2f2e-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=2dYDB2qplmHcNTsNK7OMk+fttLBR+5cDoNS68j8PPJY=;
        b=zr+8eWuqyv5saeH7jeEHJlhWlWAnsz1VoxbFCvzme4nLUwD8qS+IyzGm51xmVlKEtO
         MSOJxdvYsoPXP1ZravsWWsiy0WBtzUQa+hI3kzIo/g4lnfQ8w+lraH//cJ+4W+nbvVdP
         qx9XbCJq9On+/gPQh5KPX7AAGS5eMiZf9/UOc62RO66UhBZSabUvqRsgBFo9Pmb+6X6K
         edNc6HgxR6jn44m5dBAn9RhYq1qEsu9al9wW9h3ef6xiz8FAoTsE9y1JxUDx86kCDH+l
         9ohPJ2Lbnt1p6SGqLHZ3qNc37CJyrl1rP0nM7JoWHVxDxFjJxfSTV+uM6+gCxSiGiVja
         x4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=2dYDB2qplmHcNTsNK7OMk+fttLBR+5cDoNS68j8PPJY=;
        b=G0K3vhSGimB/gublrvX7WZqNMQ19GCQIMWNOpa0tJkAuKJYAv7ZhpTsMKVGZqbc2lM
         9bxlUAKGaDIAxvBZXCBveuK9CtDHMNNm09yAY21hemcmyO8e8m82RmjQHX/vOfduULwn
         Sc4cKHKnUQGHyhW85SalmEx+eYw4yXnKFA/ymt33b9AtBa6nO1zewknwrcR2xoMlFne/
         T1DFQe6knexG2mzxPqg0ZZbtdHQ4T4cy5X3xRllOfqvb10rQ3JcqO59ynj9jZhTK/5Ou
         lXsj8FMIA5dzBsLXUFUU7RPg+c+LHtjI5bJYhm+a/fgUOELkX1hUWyzfQPmou2+v9yBO
         coyg==
X-Gm-Message-State: ACgBeo12E75ua2zXfw1b98rEUkLquW5cUdJJ1iILvAk6DKb4sJhDOuNl
	4l1TF0R5jdPdJ8aASQIhgJAjjw==
X-Google-Smtp-Source: AA6agR68YqpJq/h1Rafd2QqDKIBcsCdIKV0f5e63Qw2Wd3WtA+g+HLqAuZWIx7m7fcdbOpUrZ2G57A==
X-Received: by 2002:a17:902:6ac8:b0:175:44b5:5264 with SMTP id i8-20020a1709026ac800b0017544b55264mr7204163plt.19.1662611086639;
        Wed, 07 Sep 2022 21:24:46 -0700 (PDT)
Date: Thu, 8 Sep 2022 09:54:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xen.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH V5 1/6] libxl: Add support for Virtio I2C device
Message-ID: <20220908042442.7sa6p23qqhuik6ai@vireshk-i7>
References: <cover.1661159474.git.viresh.kumar@linaro.org>
 <8b47d98cec83ca33a2b409c9371356820dd91b7a.1661159474.git.viresh.kumar@linaro.org>
 <YxdyGXxois95bNdI@perard.uk.xensource.com>
 <20220907123224.rz7vvope37l6l6mg@vireshk-i7>
 <402d1abf-85f6-b13a-8a6e-80cb1792c2ee@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <402d1abf-85f6-b13a-8a6e-80cb1792c2ee@xen.org>

On 07-09-22, 18:49, Julien Grall wrote:
> Looking at this series, you will add ~250 lines (assuming your new patch)
> for the i2c and then likely the same amount for GPIO.
> 
> I am assuming that for every new virtio device (e.g. gps, sound,
> display...), we would also need to 250 lines of code. I am worry that we
> will end up to bloat libxl with duplicated code and or for device that are
> barely used.

I agree.

> I think it would be better to find a generic way to add new virtio device
> without adding code (very limited) in libxl. The advantage is someone will
> be able to create a new virtio device with less effort.
> 
> The approach I can think of is something along the lines:
> 
> virtio = ["type=<compatible>,transport=<transport>,..."]

It sounds good and yeah it will save a lot of trouble.

> where the compatible is the one that should be written in the DT and
> transport is mmio or pci. the [...] refers to specific parameters that would
> need to be passed to the backend (it is not clear how you provide them
> today?).

The backend doesn't need lot of parameters to be passed right now, the host
specific ones (like which devices on a bus to share to the guests) are passed by
its command line. The backends in our case are hypervisor agnostic and are run
independently as daemons, they just need to know base/irq, which we get from xen
libraries.

> AFAICT, the GPIO one may need some tweaking because it requires specific
> properties. I think it would be more acceptable as this will be only a few
> lines (compare to 250 lines today).

Right.

If everyone agrees, I will be happy to work towards this.

-- 
viresh


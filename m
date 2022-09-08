Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ACC5B142B
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 07:45:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402673.644513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWAKk-0003EC-Ix; Thu, 08 Sep 2022 05:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402673.644513; Thu, 08 Sep 2022 05:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWAKk-0003Ba-GM; Thu, 08 Sep 2022 05:44:14 +0000
Received: by outflank-mailman (input) for mailman id 402673;
 Thu, 08 Sep 2022 05:44:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jDMa=ZL=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oWAKj-0003BU-BM
 for xen-devel@lists.xen.org; Thu, 08 Sep 2022 05:44:13 +0000
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [2607:f8b0:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42e8628a-2f39-11ed-af93-0125da4c0113;
 Thu, 08 Sep 2022 07:44:11 +0200 (CEST)
Received: by mail-pf1-x434.google.com with SMTP id y127so16845040pfy.5
 for <xen-devel@lists.xen.org>; Wed, 07 Sep 2022 22:44:10 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 q24-20020a63f958000000b004348bd693a8sm5424839pgk.31.2022.09.07.22.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 22:44:08 -0700 (PDT)
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
X-Inumbo-ID: 42e8628a-2f39-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=YqB7dPoU/NVxudY2LKy8japqoOfaZKw4HmSWhiEvGAc=;
        b=ssmBp2OHAvr6iMCNFYOoTcxuRhP8l1ZpoyJUxfqyN/bk9NiLknpTXNaA22ZlQaAxwR
         berkBNROy7WQyI4qdSFihL5XAovJRweZMygx4oA18OY+rib9TGw/Sp9ThFAQjP8GZ2hm
         cWqQMY+8JI7mb8wRgyKxOll4FAzVV1AJiXB2VLPHQbI1FslT+OtHx43S/QYk6sZw+Lpz
         YAeirAON49n2SkhUxoZiWetXFOjL7DeSCDRlLfo3La3L/bWFhhWlklk9pY2jND/7kiYF
         YoWDn+XL8yjkrb9PU9XX7Mpyw0bv8s4QHo4ogTQmItVukzXAlpIVbpcFSgc2Cy08KUvc
         YqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=YqB7dPoU/NVxudY2LKy8japqoOfaZKw4HmSWhiEvGAc=;
        b=IxwIyHcJxigReZFmCjfl9ttQsq03VaJpOOLyuj98PliukJ+H8kvHRHIokUsG294a4J
         sw0KNx4/hZZImLo5ha+NGfO+5u3A/fFlePw7X7l2jmTmAz7sPZqtNjb2OzHzF04ZmSTt
         i49UmVGEuU1syyVz7qn37sEhcyuWqRXsETZYy3mMD4c9HUVv10AzukK3rKCDfTdW07sz
         FLw4FUAmzlTH9pZfGeSJD3BEjleiK6RXdnm0dC97/h3FKuLBwVcGQahsQsEyJ5325eZa
         do/m2hC7FTV2YqYjvP1Du4Og35KNGJ0Jx2f8FKQw98IF3URCVdO1gOYJe4X4A0DUDkNK
         Zvgg==
X-Gm-Message-State: ACgBeo2FR0K97UdaFXAvLj6Yr+sk3cY/ABnC+ROBR8P+CPcawGXrJXQE
	8Be0N6CgMVbmAPt+7HRsz4ZZDg==
X-Google-Smtp-Source: AA6agR6BUcWrlYapkAqC6MjZPNxPhMl+pysDxYJyDRSOfyrWN/lLGNHy6pZakBiGGGZr7dTP6nPBGg==
X-Received: by 2002:a05:6a00:1a14:b0:52d:5fee:d46b with SMTP id g20-20020a056a001a1400b0052d5feed46bmr7615988pfv.82.1662615849419;
        Wed, 07 Sep 2022 22:44:09 -0700 (PDT)
Date: Thu, 8 Sep 2022 11:14:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xen.org, Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>, anthony.perard@citrix.com,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH V5 6/6] libxl: Allocate MMIO params for GPIO device and
 update DT
Message-ID: <20220908054406.2tn3sqp6gqsto7vz@vireshk-i7>
References: <cover.1661159474.git.viresh.kumar@linaro.org>
 <4a238937ceb803f494e5633a3a779866383bd463.1661159474.git.viresh.kumar@linaro.org>
 <855f6a63-5315-d9ff-780c-9512b5a89bd6@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <855f6a63-5315-d9ff-780c-9512b5a89bd6@xen.org>

On 07-09-22, 19:02, Julien Grall wrote:
> It is a very descriptive compatible :). And yes I realize this is the
> compatible chosen by upstream.

:)

> So this is exposing a GPIO interrupt controller but IIUC we will also need
> to describe the devices in the device-tree. Can you outline how you would
> expect it to work?

The same is true for busses like I2C and SPI, which may have client devices in
the DT as well.

Though I don't use them currently in my setup where I need to test the backends.
I am able to test both I2C and GPIO dynamically from the guest, without any
client devices in the DT.

> To put some context, this is related to what I wrote in patch #1. How much
> code will be necessary in libxl to add new device?
> 
> I am not the maintainer of this code, but I would expect some example how
> this can be used once this merged. This would help us to understand whether
> the interface is correct.

I understand what you are looking for and that we may be required to pass the
relation of a client device with the GPIO controller via the "virtio" entry you
suggested for a common device.

I don't have an answer for that at the moment.

-- 
viresh


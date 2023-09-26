Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DB97AEB65
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 13:24:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608410.946882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql6Am-0005Xm-Ps; Tue, 26 Sep 2023 11:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608410.946882; Tue, 26 Sep 2023 11:24:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql6Am-0005Ut-MW; Tue, 26 Sep 2023 11:24:12 +0000
Received: by outflank-mailman (input) for mailman id 608410;
 Tue, 26 Sep 2023 11:24:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PA3Q=FK=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1ql6Ak-0005Un-Ss
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 11:24:10 +0000
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [2607:f8b0:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32fbb4f5-5c5f-11ee-9b0d-b553b5be7939;
 Tue, 26 Sep 2023 13:24:05 +0200 (CEST)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-690d2441b95so6318050b3a.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Sep 2023 04:24:05 -0700 (PDT)
Received: from leoy-yangtze.lan ([98.98.49.34])
 by smtp.gmail.com with ESMTPSA id
 f15-20020aa78b0f000000b0068fe7c4148fsm9636262pfd.57.2023.09.26.04.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 04:24:03 -0700 (PDT)
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
X-Inumbo-ID: 32fbb4f5-5c5f-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695727443; x=1696332243; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PNijtx6LwEe13nbObEOOvNg4tbJVsnRWtVDhFJIbCcw=;
        b=u+8rkhdxgXaFlhzpIPYWPge4uasrzdAKwHAQwmNqV6aNqjolihcCQ+3UFPqOOAlI12
         BRZbTarq7xP6/7tOpW+q13b+Pzy01f8qWS1KTqEQbpD+tZ9bNiiuLNTFmZZ6Ypf04PEU
         ivrDtxlKujJJgLlm4RsN1laJnCFTIgk27Cl490RyNsbDq80PMIWrLxydx/m0YJzJUfYC
         j5m0bc/ltMjVZK9zeIqwyWmmxmIR7PnjLp/mx+F00PTbhtsQx9aEtiEaCESbtUGMQW/k
         IK/Inp9kyzd2tyN6LqNawG4kATLLV9U8MFa2cyw6+bHcjbK0kaFyWlmRWMoaku8ARQH1
         +vJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695727443; x=1696332243;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PNijtx6LwEe13nbObEOOvNg4tbJVsnRWtVDhFJIbCcw=;
        b=VPQbQi1jwlDhnPTngRoBSbWUF8Z2vWkB7vIa5RW2wh9cJnxK2S/g5U98VYZfbgIz66
         8TRc25/er/60Y2Ih5RMGYc5woT6fBp5/g1JTEFdRlhLu5iOzEt2gz3LE1pLh36615Gns
         YP3JHK/tht+BamaGDpCDnGqEvVQ3jlqo8EomBT8WPX3Y03lpgSYxhkMflkYb5XIRUGVh
         cg7nMa16HOBbRrBS8MQ/6R4FHmp2xiTHVEphtFEVIdmGzePdcy6jBOb+FaXb5DNx8wUe
         GHjD/gmUV9pw6vRLSzaGgYXBJUh+MTMKDi26OZHiYYZ4fZfA1I3XDV+y33+7M8m3hFzz
         4SLw==
X-Gm-Message-State: AOJu0YwPTHx2VHUCXmJzSLnzXSm3N//M24lKkcemSAXxakPmBa2wiXxW
	ruUv2hYj8gPW+k+NnTN/O2JSiA==
X-Google-Smtp-Source: AGHT+IGmt/m30UW1zqYxVfKZskQc63eyDJuGXnKQr2FdoVKmYjT+91FwFjB5DaMcUx5CPGJRatJpZg==
X-Received: by 2002:a05:6a00:16c5:b0:68c:3ed9:d39c with SMTP id l5-20020a056a0016c500b0068c3ed9d39cmr3521769pfc.13.1695727443498;
        Tue, 26 Sep 2023 04:24:03 -0700 (PDT)
Date: Tue, 26 Sep 2023 19:23:59 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Michal Orzel <michal.orzel@amd.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Skip memory nodes if not enabled
Message-ID: <20230926112359.GC11115@leoy-yangtze.lan>
References: <20230926053333.180811-1-leo.yan@linaro.org>
 <BDC53ABB-AC26-45AF-A8FC-E12C83209400@arm.com>
 <10c01fc1-8140-c81d-8e9a-4fdce2adcaa0@amd.com>
 <5BF208F8-3676-49C2-8E42-7BA10ACE6190@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5BF208F8-3676-49C2-8E42-7BA10ACE6190@arm.com>

Hi Luca,

On Tue, Sep 26, 2023 at 10:10:57AM +0000, Luca Fancellu wrote:

[...]

> >> I might be wrong, but reading the specifications seems that “status” is not a property
> >> of the child nodes of /reserved-memory, so I’m not sure Xen should do something about it.
> >
> > Please take a look at dt documentation (v0.4) for /memory and /reserved-memory.
> > Under the tables listing possible properties, there is a statement:
> > Note: All other standard properties (Section 2.3) are allowed but are optional.
> 
> Thanks for pointing that out, I missed that bit.

Though ePAPR [1] doesn't explicitly say "status" property can be
included by memory nodes and reserved memory nodes, "status" property
is a standard property.

The Linux kernel checks "status" property for memory nodes and reserved
memory nodes with the of_fdt_device_is_available() function. Actually,
I just reuse this function and rename it in current patch :)

Thanks,
Leo

[1] https://elinux.org/images/c/cf/Power_ePAPR_APPROVED_v1.1.pdf


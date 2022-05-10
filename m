Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1037521B13
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 16:04:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325683.548352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noQTU-00073s-CD; Tue, 10 May 2022 14:04:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325683.548352; Tue, 10 May 2022 14:04:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noQTU-00071o-8h; Tue, 10 May 2022 14:04:28 +0000
Received: by outflank-mailman (input) for mailman id 325683;
 Tue, 10 May 2022 14:04:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BK8O=VS=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1noQTS-00071i-Uf
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 14:04:27 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18f572bb-d06a-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 16:04:25 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id v12so23934092wrv.10
 for <xen-devel@lists.xenproject.org>; Tue, 10 May 2022 07:04:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a056000100f00b0020c5253d8d9sm14142078wrx.37.2022.05.10.07.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 07:04:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 64DA01FFB7;
 Tue, 10 May 2022 15:04:22 +0100 (BST)
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
X-Inumbo-ID: 18f572bb-d06a-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=PInxcsz/FcQAW9iY+fuesUscvZ7z/Uz8rPe6ZunJA3Q=;
        b=TI7OUEQnKF5mSjEs+eQWLGaJB/1jfs8PXIuMv8Dvo1y3ECGqY8X+LprTaki/ZhLYK6
         ANl1aGr981ejGL83JWOl5Uk9n1hCrEr1aB6pnev6uAnM6lrU2AM6d1ppkalVHBqA5XF1
         tibh6j4YjCqEs2zme5tAvsefi3BgmK3C9AHDpMJfOLjAHkWC/MPK6Cro90gl2KR3GwIu
         2YWOcWmjNtb+7m9QawI1zqP6FHmBHp9RdQkAHZxO9MQOvydE3woPO8MBtBO/+7CHcqA0
         zh2H795x2IKTXfomllkT1fRHt2Hn9qxHN06tsi7V++BlnbMeKEYWlqubwvqocT6OWxkF
         M2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=PInxcsz/FcQAW9iY+fuesUscvZ7z/Uz8rPe6ZunJA3Q=;
        b=IDTG72ARrBFszlclx8ik1EjlX8NAZEk8dUW4cxVWL5QMEjZJEYM41djbm0v0GZ/ake
         jWwB63emDShpvzvVkxdLHxQ9ZfYtk1C1vVTsuBDz3q4bAItmRkMTpNEmuBd+mITKXnHn
         PwYBUfrjfagapSYgh3Z5+XM5hUs5AGrw2m6qgtSByo3eINSkESJi0iFrt9htX7L1R4cC
         VoXkypMzn9uBoUF85sAXlZcbDiFoksfc/53N3LhB4DPaxQ3SsG0tLeKigUqf90LPMUsy
         wADkrTLJCbPtYqHkElSWR7eXdRHW+6QCddnAi/WUJ9W4rzVoPJzdyrA6uLrnSYV8t0+D
         E/nA==
X-Gm-Message-State: AOAM531e38KRI6vsBSEByrN8RvTV/HwRXTVwzcTlez8wIBBdEq03Au9c
	wEYr1NAL3miMzVBWGw2jxyjQCQ==
X-Google-Smtp-Source: ABdhPJw/rU56ddlG3Pdq/rLOu+Gd3KFsTifKK/JPDWXEk2hej13zBXTaNs29LkPoYfAzSN+UjAkERQ==
X-Received: by 2002:adf:e942:0:b0:20a:c907:90d6 with SMTP id m2-20020adfe942000000b0020ac90790d6mr18753237wrn.163.1652191464301;
        Tue, 10 May 2022 07:04:24 -0700 (PDT)
References: <20220428103410.2723837-1-alex.bennee@linaro.org>
 <64d47797-3789-694b-0eb5-08fc7527ff5b@xen.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, stratos-dev@op-lists.linaro.org, Richard
 Henderson <richard.henderson@linaro.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v2] xen/arm: p2m don't fall over on FEAT_LPA enabled hw
Date: Tue, 10 May 2022 15:03:52 +0100
In-reply-to: <64d47797-3789-694b-0eb5-08fc7527ff5b@xen.org>
Message-ID: <8735hhtrfd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Julien Grall <julien@xen.org> writes:

> Hi Alex,
>
> On 28/04/2022 11:34, Alex Benn=C3=A9e wrote:
>> When we introduced FEAT_LPA to QEMU's -cpu max we discovered older
>> kernels had a bug where the physical address was copied directly from
>> ID_AA64MMFR0_EL1.PARange field. The early cpu_init code of Xen commits
>> the same error by blindly copying across the max supported range.
>> Unsurprisingly when the page tables aren't set up for these greater
>> ranges hilarity ensues and the hypervisor crashes fairly early on in
>> the boot-up sequence. This happens when we write to the control
>> register in enable_mmu().
>> Attempt to fix this the same way as the Linux kernel does by gating
>> PARange to the maximum the hypervisor can handle. I also had to fix up
>> code in p2m which panics when it sees an "invalid" entry in PARange.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Richard Henderson <richard.henderson@linaro.org>
>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>> Cc: Julien Grall <julien@xen.org>
>> Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
>
> Acked-by: Julien Grall <jgrall@amazon.com>

Will you pick this up via your tree or do I need to do something else to
get it upstreamed? I guess it needs to go on master and last stable?

--=20
Alex Benn=C3=A9e


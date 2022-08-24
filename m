Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3402159F8CC
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 13:48:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392482.630859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQorW-0003lc-It; Wed, 24 Aug 2022 11:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392482.630859; Wed, 24 Aug 2022 11:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQorW-0003j3-G3; Wed, 24 Aug 2022 11:47:58 +0000
Received: by outflank-mailman (input) for mailman id 392482;
 Wed, 24 Aug 2022 11:47:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+X8Z=Y4=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1oQorU-0003it-HK
 for xen-devel@lists.xen.org; Wed, 24 Aug 2022 11:47:56 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 979a3878-23a2-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 13:47:55 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 k6-20020a05600c1c8600b003a54ecc62f6so691117wms.5
 for <xen-devel@lists.xen.org>; Wed, 24 Aug 2022 04:47:55 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j27-20020a05600c1c1b00b003a5ce167a68sm1904338wms.7.2022.08.24.04.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 04:47:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 870E31FFB7;
 Wed, 24 Aug 2022 12:47:53 +0100 (BST)
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
X-Inumbo-ID: 979a3878-23a2-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc;
        bh=kv6MSDgrqc8RobeBOkbfaxVuprh9CpQpHYry2ThHKr8=;
        b=h9pb1oR04ZF95kY6jBIMvgc8xrDkRTzcPYb5a2adG6QUCcb0MG0laAAySG0CXfDnig
         yXTYO+bUdWnI56/sYHFdQ+yLmT5D2N3DPgp7nZ8aDd1Li7ukowZ6aeXs2peuC7jMjYBK
         VCd6GuN83kidzbQr/F1SdKhKSZ9j4/a05ztsoJQjAJFNqc9i0tp9ui2mnZPNWHM4vQYw
         JlU4DLRWmLu0vOuiDDR79MuajK3DcP96HENGtcOqMOsrcEPCbaNErCChMgBzlt5rhHve
         pIjIN1oc7cJuoAYdi6wK+XsWsCJDA0buFgg5hav/8I9MDxN2Zy0+l+gsgcMnI6cSr2cX
         6/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc;
        bh=kv6MSDgrqc8RobeBOkbfaxVuprh9CpQpHYry2ThHKr8=;
        b=7kz7MsDpBmX3YzCMPtLdmwvMSi6xxnfxhrrOmJEdD6oTAiOIEOLaf7NyZAPQh2Pdpo
         P4j7DTaSw7t8DDWsDVq6cGQ3ioabMWq/ZEPqUdZX1ieiom0fwupwDO2zIZ/xkW4vF0Lk
         Zvg2ADLw7hsjEVefUKCMuhs1zwtQi+7a7q8WzjehB/hfF8wO2+fu++suXVNwDS3j/JMD
         1IHMeJTY+q1Ogc4RqDZlU2K2cwoGuD2alxRNOweBh1pH3H1TP8qOlP2TI903Ntmg+fVU
         PKsdxQF8pGvGJogjRuqiIpR2pykYQTDIyXCpj7MN4x8eY+M1xd8v8o3bEzNHXou9bP8J
         m7YA==
X-Gm-Message-State: ACgBeo24Jt6DxtNTM8MKfqENMBS/XeD2ayyeXtp6UN3gsUHeztRvPmjt
	kWUbh+QvaFccbMzfvnkpcgna+Q==
X-Google-Smtp-Source: AA6agR5OzyL0PrRHXkxR0p1iv1i7iftCNzeUEeMySUhhzecIdFAxSM+HSsIcqFeLVxWTs+s8NIA5cQ==
X-Received: by 2002:a1c:770f:0:b0:3a5:ef7f:2973 with SMTP id t15-20020a1c770f000000b003a5ef7f2973mr5067511wmi.111.1661341675005;
        Wed, 24 Aug 2022 04:47:55 -0700 (PDT)
References: <alpine.DEB.2.22.394.2203231838130.2910984@ubuntu-linux-20-04-desktop>
 <57549560-879d-f705-8693-9bfdc73e3f7f@suse.com>
 <20220824091918.szrd6e6ll6h6u2pw@vireshk-i7>
 <a04eebde-1ad4-b6d2-9867-caea88de0484@suse.com>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Juergen Gross <jgross@suse.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Stefano Stabellini
 <sstabellini@kernel.org>, xen-devel@lists.xen.org,
 Stratos-dev@op-lists.linaro.org, mathieu.poirier@linaro.com,
 christopher.w.clark@gmail.com, boris.ostrovsky@oracle.com,
 gregkh@linuxfoundation.org, vincent.guittot@linaro.org,
 olekstysh@gmail.com
Subject: Re: Understanding osdep_xenforeignmemory_map mmap behaviour
Date: Wed, 24 Aug 2022 12:47:08 +0100
In-reply-to: <a04eebde-1ad4-b6d2-9867-caea88de0484@suse.com>
Message-ID: <8735dlj21i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Juergen Gross <jgross@suse.com> writes:

> [[PGP Signed Part:Undecided]]
> On 24.08.22 11:19, Viresh Kumar wrote:
>> On 24-03-22, 06:12, Juergen Gross wrote:
>>> For a rather long time we were using "normal" user pages for this purpo=
se,
>>> which were just locked into memory for doing the hypercall.
>>>
>>> Unfortunately there have been very rare problems with that approach, as
>>> the Linux kernel can set a user page related PTE to invalid for short
>>> periods of time, which led to EFAULT in the hypervisor when trying to
>>> access the hypercall data.
>>>
>>> In Linux this can avoided only by using kernel memory, which is the
>>> reason why the hypercall buffers are allocated and mmap()-ed through the
>>> privcmd driver.
>> Hi Juergen,
>> I understand why we moved from user pages to kernel pages, but I
>> don't
>> fully understand why we need to make two separate calls to map the
>> guest memory, i.e. mmap() followed by ioctl(IOCTL_PRIVCMD_MMAPBATCH).
>> Why aren't we doing all of it from mmap() itself ? I hacked it up to
>> check on it and it works fine if we do it all from mmap() itself.
>
> Hypercall buffers are needed for more than just the "MMAPBATCH" hypercall.
> Or are you suggesting one device per possible hypercall?
>
>> Aren't we abusing the Linux userspace ABI here ? As standard userspace
>> code would expect just mmap() to be enough to map the memory. Yes, the
>> current user, Xen itself, is adapted to make two calls, but it breaks
>> as soon as we want to use something that relies on Linux userspace
>> ABI.
>
> I think you are still mixing up the hypercall buffers with the memory
> you want to map via the hypercall. At least the reference to kernel
> memory above is suggesting that.

Aren't the hypercall buffers all internal to the kernel/hypervisor
interface or are you talking about the ioctl contents?

>
>
> Juergen
>
> [2. OpenPGP public key --- application/pgp-keys; OpenPGP_0xB0DE9DD628BF13=
2F.asc]...
>
> [[End of PGP Signed Part]]


--=20
Alex Benn=C3=A9e


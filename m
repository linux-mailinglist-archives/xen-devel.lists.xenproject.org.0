Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C79559F618
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 11:20:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392306.630566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQmXl-0008MY-S5; Wed, 24 Aug 2022 09:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392306.630566; Wed, 24 Aug 2022 09:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQmXl-0008JA-OP; Wed, 24 Aug 2022 09:19:25 +0000
Received: by outflank-mailman (input) for mailman id 392306;
 Wed, 24 Aug 2022 09:19:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ex+Y=Y4=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oQmXk-0008Ia-NM
 for xen-devel@lists.xen.org; Wed, 24 Aug 2022 09:19:24 +0000
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [2607:f8b0:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6b43916-238d-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 11:19:22 +0200 (CEST)
Received: by mail-pf1-x42f.google.com with SMTP id 83so10204053pfw.6
 for <xen-devel@lists.xen.org>; Wed, 24 Aug 2022 02:19:23 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 r6-20020a634406000000b0042a6dde1d66sm7430131pga.43.2022.08.24.02.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:19:21 -0700 (PDT)
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
X-Inumbo-ID: d6b43916-238d-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=2yKVEzl32zJIBiFaKTktMQRB347BQAs/vumQW+vaaUk=;
        b=O0PYVV9YkUAbuUHpw071Bsaw8P7bRVM0EnCZkhhKPWopL6gWUJlnK2bMrpQ07ZgfET
         dWJbt9pGPSqGDztRJelUHuR9mpet6x/BsnsuDmNsMW+lgTP8rnfAlEfwwI4M2MNieDEe
         N0w+gvhkXtrqjEzvkCH/o7UFiu7sAzWz+CG8Dm7wicyXkaHYLjKzuQNBMwxNOTCXZC9P
         g+LaRrM6TAp+jvXPLej6+JZW/5Dmmf1/IIjVuVVO/Y2HKslsNZtv9yG5IPYQjjZz73DN
         vX8bGkPz2QMxdT7IW0vqNfstGhJ20oq1AHLan0vxOhJbXUPP/9+LktKClp7Ot37DMndc
         O49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=2yKVEzl32zJIBiFaKTktMQRB347BQAs/vumQW+vaaUk=;
        b=ngM1g2kH/xN2GgFY0JkMX6nZG5nK85u4KCUX6z1JsQ6zySz0lzmqq7vVyY3uSJjewa
         BjZN9JE0qmRVDhK3fRzsJBqETF2B9ReKBgCaPJFxStu4UJIU08qmuiF2aIDcJp+6YEje
         mZE4K8ihTw3jCXrRdw8KLXsX5DRBTQI42hhZ84EPP+9dZcsXmxhMg6CUCDgzy7u8LaQT
         4gDsiwyGs90AkpopYbb73A2X0OGPdoitgfYsj5UAPMoHIu91DT9Mh4fr+7U7IaIW5OmE
         Nqv/cbkOOaAyCGCJ2YeR6X1eDTHJMkrg9ag1Pk1bVejVuzAAGmBfseW3Y+T5ILTGE2+K
         oZFw==
X-Gm-Message-State: ACgBeo3bCypPagAbF0MgdRJch+mZC+PBOF1UROXhrz53N6JEdjU9SQeI
	5gqgZujUymB/bk0sLa0RXseGUw==
X-Google-Smtp-Source: AA6agR6GwXeHfFFdESqUXfiilX1UrEfHcITfLQ4AfuM15Kvn4hlq5awrIDfA1iWRcjgKMmkilye4QA==
X-Received: by 2002:a05:6a00:99b:b0:536:754a:ab31 with SMTP id u27-20020a056a00099b00b00536754aab31mr15879381pfg.45.1661332761833;
        Wed, 24 Aug 2022 02:19:21 -0700 (PDT)
Date: Wed, 24 Aug 2022 14:49:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, alex.bennee@linaro.org,
	xen-devel@lists.xen.org, Stratos-dev@op-lists.linaro.org,
	mathieu.poirier@linaro.com, christopher.w.clark@gmail.com,
	boris.ostrovsky@oracle.com, gregkh@linuxfoundation.org,
	vincent.guittot@linaro.org, olekstysh@gmail.com
Subject: Re: Understanding osdep_xenforeignmemory_map mmap behaviour
Message-ID: <20220824091918.szrd6e6ll6h6u2pw@vireshk-i7>
References: <alpine.DEB.2.22.394.2203231838130.2910984@ubuntu-linux-20-04-desktop>
 <57549560-879d-f705-8693-9bfdc73e3f7f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57549560-879d-f705-8693-9bfdc73e3f7f@suse.com>

On 24-03-22, 06:12, Juergen Gross wrote:
> For a rather long time we were using "normal" user pages for this purpose,
> which were just locked into memory for doing the hypercall.
> 
> Unfortunately there have been very rare problems with that approach, as
> the Linux kernel can set a user page related PTE to invalid for short
> periods of time, which led to EFAULT in the hypervisor when trying to
> access the hypercall data.
> 
> In Linux this can avoided only by using kernel memory, which is the
> reason why the hypercall buffers are allocated and mmap()-ed through the
> privcmd driver.

Hi Juergen,

I understand why we moved from user pages to kernel pages, but I don't
fully understand why we need to make two separate calls to map the
guest memory, i.e. mmap() followed by ioctl(IOCTL_PRIVCMD_MMAPBATCH).

Why aren't we doing all of it from mmap() itself ? I hacked it up to
check on it and it works fine if we do it all from mmap() itself.

Aren't we abusing the Linux userspace ABI here ? As standard userspace
code would expect just mmap() to be enough to map the memory. Yes, the
current user, Xen itself, is adapted to make two calls, but it breaks
as soon as we want to use something that relies on Linux userspace
ABI.

For instance, in our case, where we are looking to create
hypervisor-agnostic virtio backends, the rust-vmm library [1] issues
mmap() only and expects it to work. It doesn't know it is running on a
Xen system, and it shouldn't know that as well.

Thanks.

-- 
viresh

[1] https://github.com/rust-vmm/vm-memory/blob/main/src/mmap_unix.rs#L170


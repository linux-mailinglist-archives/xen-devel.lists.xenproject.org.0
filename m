Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AD96992E4
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 12:13:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496468.767231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pScCh-0004k7-IF; Thu, 16 Feb 2023 11:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496468.767231; Thu, 16 Feb 2023 11:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pScCh-0004gz-FI; Thu, 16 Feb 2023 11:13:31 +0000
Received: by outflank-mailman (input) for mailman id 496468;
 Thu, 16 Feb 2023 11:13:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ob5L=6M=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1pScCg-0004gt-LS
 for xen-devel@lists.xen.org; Thu, 16 Feb 2023 11:13:30 +0000
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f06ea350-adea-11ed-933c-83870f6b2ba8;
 Thu, 16 Feb 2023 12:13:29 +0100 (CET)
Received: by mail-pj1-x102d.google.com with SMTP id
 fu4-20020a17090ad18400b002341fadc370so5472120pjb.1
 for <xen-devel@lists.xen.org>; Thu, 16 Feb 2023 03:13:29 -0800 (PST)
Received: from localhost ([122.172.83.155]) by smtp.gmail.com with ESMTPSA id
 u11-20020a6540cb000000b004fbd27c4715sm984377pgp.42.2023.02.16.03.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 03:13:27 -0800 (PST)
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
X-Inumbo-ID: f06ea350-adea-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CRIAf2mxIcjkfWTde+v4O2KiUQlo/kXew0HUnA36GBU=;
        b=eRn1NGliAAfLn+SKyhZxpWV50Bi6dqmOViFM1ayotJjK621018/G+8hISPkt/rh/9t
         a+E6E55rq6DR1wYKvk/KiGR0sq912dnOmCmzXpGD0GoFuzjuSBnX9p3BiS01EwFi+jx3
         xRjDKAXBudqhoJ4AomuOGFLW5uM7qMexiSCpiiHXdDOnBvNODH4oADPJQGkcxcQ4ud10
         PaCxG2ZO1KEQDTVg4TKV0aZMQ++UsY2gupVjW8vhRqnXK60jHNjxJJYtrz+CkNJlTzsF
         0zLgKe6z3OWVOrzrBIH4+d6pN/K0f+kQ/NTue+gKgD6GlR7wm/HO2LErngp7cTnitWcX
         Tqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CRIAf2mxIcjkfWTde+v4O2KiUQlo/kXew0HUnA36GBU=;
        b=CrPIP+Txsh2gEgyXxIWXafBtmBp+uWonvRwHzl2kWcEEI0X/Z4X2VTuxCMEWJiu28j
         iM9UlLY3g9xSrUxOAtQ2XQ7JChlLHrUkuji3GuBd6e5JFJIYwyCUMJH2xQqMxthgMFNF
         yVB0I4VgzXzPAqVG+pO8XZflwHwdZuIIS2N+s8V9wQqPxI2+CrekzCCH99+cyhapa85t
         7Hc5UZlbEwcC/9/DVH5mzedUVcqFsOsNAuCuOcQEASP16RYfwTFlu+Aollp4bh56bZiw
         usSwi0nZk2v/3Ap7GZvYHDBZtCxkbMUTsQ8t7VjP6cMoDHs1uVxTUzumOFd/lR43LKfi
         l9KQ==
X-Gm-Message-State: AO0yUKXwRXc9ov0tVm0jXB+mprS7ekZf7JnBLCt4HCdvBGrVSJBu3KWC
	/lW46C1jFOTLqxAa+5nU+NFodA==
X-Google-Smtp-Source: AK7set80hh4BuqDCLmIFAQbj2QNNGohaQSZfOwF+EAwzxNCx2453l5aOt4lc7oVKh11dNEFa6h5TbQ==
X-Received: by 2002:a05:6a20:430e:b0:c5:d784:a20b with SMTP id h14-20020a056a20430e00b000c5d784a20bmr6006741pzk.29.1676546007896;
        Thu, 16 Feb 2023 03:13:27 -0800 (PST)
Date: Thu, 16 Feb 2023 16:43:25 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	xen-devel@lists.xen.org
Subject: [Discussion] Xen grants and access permissions
Message-ID: <20230216111325.tprjr7rdr52iqvmm@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Oleksandr,

As you already know, I am looking at how we can integrate the Xen
grants work in our implementation of Rust based Xen vhost frontend [1].

The hypervisor independent vhost-user backends [2] talk to
xen-vhost-frontend using the standard vhost-user protocol [3]. Every
memory region that the backends get access to are sent to it by the
frontend as memory region descriptors, which contain only address and
size information and lack any permission flags.

I noticed that with Xen grants, there are strict memory access
restrictions, where a memory region may be marked READ only and we
can't map it as RW anymore, trying that just fails. Because the
standard vhost-user protocol doesn't have any permission flags, the
vhost libraries (in Rust) can't do anything else but try to map
everything as RW.

I am wondering how do I proceed on this as I am very much stuck here.

-- 
viresh

[1] https://github.com/vireshk/xen-vhost-frontend
[2] https://github.com/rust-vmm/vhost-device
[3] https://qemu.readthedocs.io/en/latest/interop/vhost-user.html
[4] https://qemu.readthedocs.io/en/latest/interop/vhost-user.html#memory-regions-description


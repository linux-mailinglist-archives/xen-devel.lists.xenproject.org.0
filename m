Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B9D6BA6F2
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 06:18:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509900.786607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcJWW-0007oo-Hu; Wed, 15 Mar 2023 05:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509900.786607; Wed, 15 Mar 2023 05:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcJWW-0007mj-EP; Wed, 15 Mar 2023 05:18:04 +0000
Received: by outflank-mailman (input) for mailman id 509900;
 Wed, 15 Mar 2023 05:18:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dncz=7H=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1pcJWU-0007md-Ko
 for xen-devel@lists.xen.org; Wed, 15 Mar 2023 05:18:02 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be581796-c2f0-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 06:17:58 +0100 (CET)
Received: by mail-pl1-x62f.google.com with SMTP id ix20so12351625plb.3
 for <xen-devel@lists.xen.org>; Tue, 14 Mar 2023 22:17:56 -0700 (PDT)
Received: from localhost ([122.172.83.155]) by smtp.gmail.com with ESMTPSA id
 bn9-20020a056a00324900b0062578514d6fsm1856054pfb.58.2023.03.14.22.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 22:17:54 -0700 (PDT)
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
X-Inumbo-ID: be581796-c2f0-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678857475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y8QmKYcJg57HlzpunFUH9MGPifRoNDq8hXq0hFkxBNA=;
        b=abtA9w7+N9PnFhqJMTS1vxekyB+/9TRZH757nvWjC02O4HuYQfEbGMmD6ICW7rMFjY
         /VmGD+DSb6byIkc6ilrxJg1Z62GJqLpixlq583fSkrd9N8zzlEq+PUYLqbCjGsD6pZzr
         lNMKud71kSuDbnS5pru+h7MQGeq3nXJGF1+5NYUsY0V54O243pKtc5WzZ0NVCCDd6+Rw
         3bhP/Nawtapv3spmtMwhDzE3512ZNUdt9CaHz4T4WJge5hudYtFOTxOrQLUGqX4uXum5
         MVBH2rVWKsGPVjryEipxT4zwgFRep8zhaSYlfOQGnMfpK3v0H9FUXboiFoC4LXZ5B6gr
         0UYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678857475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8QmKYcJg57HlzpunFUH9MGPifRoNDq8hXq0hFkxBNA=;
        b=szIsT3n2C/JCn811+7gw/TL+lnQLxtbRy3gA9H7l+0tgkYZkrKMIYjg+6E74vqB/CQ
         uaWhNLyyQ1GemHkIlbfHcNhPyt90hzSVBDe/EY9bnC1pypD7QummsPu0LgJd7/DzQiXa
         5KmHlR846uuHM6Cq/kPh5AvHOm0lBCNMJ7MdLONCqcB2nouLZ3c2E3s+hVVMXQlu47MY
         lB8TGy5+DRL8bb/mpcFGgz3U5A29s5yU5OdWc1cBfdICMiuIJwGoPm1jh1Qu0IKLQp10
         9McmJz+AqCb32MWu0+6z9qqzIwAmOlG11UPcANe4hGnLJI5OeR1I3bZQOi4rAZtsDe0y
         zURw==
X-Gm-Message-State: AO0yUKVnyUe1CZxZHqbzeSZqHXJms936Ax2i+PzbZQD6QRw/Ny6+gF0C
	MxlAEA+5jBSnW97myWp6XG2MNQ==
X-Google-Smtp-Source: AK7set+v+08YLmgVZIkdUoqQNIHkvJTCWU5NZ9zfOm8OmZpJiNuz6CJzunAVmSRk/ShmWB32e+7zgw==
X-Received: by 2002:a05:6a20:7a1f:b0:d6:f0:85a with SMTP id t31-20020a056a207a1f00b000d600f0085amr1351227pzh.17.1678857475344;
        Tue, 14 Mar 2023 22:17:55 -0700 (PDT)
Date: Wed, 15 Mar 2023 10:47:52 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Sebastien Boeuf <sebastien.boeuf@intel.com>,
	Liu Jiang <gerry@linux.alibaba.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH V3 0/2] qemu: vhost-user: Support Xen memory mapping
 quirks
Message-ID: <20230315051752.2owlp26mq72dqel2@vireshk-i7>
References: <cover.1678351495.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678351495.git.viresh.kumar@linaro.org>

On 09-03-23, 14:20, Viresh Kumar wrote:
> Hello,
> 
> This patchset tries to update the vhost-user protocol to make it support special
> memory mapping required in case of Xen hypervisor.
> 
> The first patch is mostly cleanup and second one introduces a new xen specific
> feature.
> 
> V2->V3:
> - Remove the extra message and instead update the memory regions to carry
>   additional data.
> 
> - Drop the one region one mmap relationship and allow back-end to map only parts
>   of a region at once, required for Xen grant mappings.
> 
> - Additional cleanup patch 1/2.

Stefan,

Does this version look better ?

-- 
viresh


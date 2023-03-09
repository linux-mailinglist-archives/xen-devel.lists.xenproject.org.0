Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D2A6B1EB7
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 09:51:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508189.782581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paC00-0008Df-HZ; Thu, 09 Mar 2023 08:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508189.782581; Thu, 09 Mar 2023 08:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paC00-0008BI-Dw; Thu, 09 Mar 2023 08:51:44 +0000
Received: by outflank-mailman (input) for mailman id 508189;
 Thu, 09 Mar 2023 08:51:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WFGn=7B=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1paBzz-0006nh-CW
 for xen-devel@lists.xen.org; Thu, 09 Mar 2023 08:51:43 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cb7755b-be57-11ed-87f5-c1b5be75604c;
 Thu, 09 Mar 2023 09:51:42 +0100 (CET)
Received: by mail-pj1-x102a.google.com with SMTP id
 fr5-20020a17090ae2c500b0023af8a036d2so4523512pjb.5
 for <xen-devel@lists.xen.org>; Thu, 09 Mar 2023 00:51:42 -0800 (PST)
Received: from localhost ([122.172.83.155]) by smtp.gmail.com with ESMTPSA id
 h4-20020a170902f54400b0019a6cce205bsm11133655plf.154.2023.03.09.00.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 00:51:40 -0800 (PST)
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
X-Inumbo-ID: 9cb7755b-be57-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678351901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IoLKXeFqXx7KD6iGKmnIOLpPoXbmwYAjlvz4PZEVkSA=;
        b=oI8i8uA/fJ4fx70BP01mQaO1LIeI5Vx3YvB8invcNYwm1oxVme9UEM2+bpZ0C8DltH
         Tmk532tfIlDCJq3ERFUJ5Fr0WFLdOODZ8C8uUs0oHvU7HP44xRE/CWLpdI3qZ/sY+RBo
         0oWINPG2tk2PsX/Qf+08gh/1hnJ0D3oSNZJ8C/yKCCiCQIo/x4NySCgmw0D+aFokkEh5
         Un1/MdTbafvIumV3W1L6SF3RlqTnZ6SbJtk+2fxDOsGv2V7/ojSEtrGDB68zg9hH83ew
         JPsKkHJI6Fc/FNa7cXlcqWIQ5FhzS2D7lN5ALpreItij+kFLQUrHftGBw5K9hEAV1Fm/
         1Rnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678351901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IoLKXeFqXx7KD6iGKmnIOLpPoXbmwYAjlvz4PZEVkSA=;
        b=JozngmhRRDkUh+yqkeEIoLinU2/6EgsXprJDOKKnsTxGhhaop6xD+kIm7RL07EAOnw
         UOkrukzyoDCxIfeTvXP/kAnw5eouwGzR1vJM4vFDgGmolRwoDpHeAtmykPzqfsL3+rk6
         R+X3IWkuIiOvlgfLdegwcgf27Eos3V3ZRB0g6eztbWxFEclZhwvzdNIBNxFQ8RtUH6Zd
         mlVHhuPpB3RghZp8mEB4vyrmTF/YlaL1yLoXk93uzbGbqYyvLEHYj0aC5S5k6QgyU/Ug
         EVkAwaq3bxXjnw4G7Xz4eXJXlIjnJ/5Q7bgWtR+Hx9z5+7MpX6H+1s0Cb4z5nQjrvmrQ
         eJJw==
X-Gm-Message-State: AO0yUKXk2WwmvQn1nsM+azfsSf/GR0yfs95yrfg8Hr1TbZ5gp0EI9ZR0
	0iH4KcVYna819Sqbf5EWyWXEirTZDDNaPazvc30=
X-Google-Smtp-Source: AK7set+XV8TLjm8RgYTqNTMsI0CUUR3mMd7SAtAvTG0E9Jgb0eD9NpjnCNEhIm4iXn1YYGJQOpSeoQ==
X-Received: by 2002:a17:902:e80f:b0:19e:747e:813e with SMTP id u15-20020a170902e80f00b0019e747e813emr23672384plg.23.1678351901368;
        Thu, 09 Mar 2023 00:51:41 -0800 (PST)
Date: Thu, 9 Mar 2023 14:21:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Sebastien Boeuf <sebastien.boeuf@intel.com>,
	Liu Jiang <gerry@linux.alibaba.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH V2] docs: vhost-user: Add Xen specific memory mapping
 support
Message-ID: <20230309085138.jsn5qwlwvtbtjszv@vireshk-i7>
References: <7c3c120bcf2cf023e873800fd3f55239dd302e38.1678100850.git.viresh.kumar@linaro.org>
 <20230306153451.GB51288@fedora>
 <20230307054336.uvky5d7q2qqlxdcv@vireshk-i7>
 <20230307162237.GI124259@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307162237.GI124259@fedora>

On 07-03-23, 11:22, Stefan Hajnoczi wrote:
> VHOST_USER_IOTLB_MSG probably isn't necessary because address
> translation is not required. It will also reduce performance by adding
> extra communication.
> 
> Instead, you could change the 1 memory region : 1 mmap relationship that
> existing non-Xen vhost-user back-end implementations have. In Xen
> vhost-user back-ends, the memory region details (including the file
> descriptor and Xen domain id) would be stashed away in back-end when the
> front-end adds memory regions. No mmap would be performed upon
> VHOST_USER_ADD_MEM_REG or VHOST_USER_SET_MEM_TABLE.
> 
> Whenever the back-end needs to do DMA, it looks up the memory region and
> performs the mmap + Xen-specific calls:
> - A long-lived mmap of the vring is set up when
>   VHOST_USER_SET_VRING_ENABLE is received.
> - Short-lived mmaps of the indirect descriptors and memory pointed to by
>   the descriptors is set up by the virtqueue processing code.
> 
> Does this sound workable to you?

Sounds good. I have sent a proposal (v3) based on that now.

-- 
viresh


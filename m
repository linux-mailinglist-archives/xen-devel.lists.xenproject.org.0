Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEAF5545DC
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 13:50:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353814.580803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3yru-00047J-TU; Wed, 22 Jun 2022 11:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353814.580803; Wed, 22 Jun 2022 11:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3yru-00043t-QJ; Wed, 22 Jun 2022 11:49:58 +0000
Received: by outflank-mailman (input) for mailman id 353814;
 Wed, 22 Jun 2022 11:49:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vZBD=W5=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1o3yrs-00043n-VO
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 11:49:57 +0000
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [2607:f8b0:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6eba794a-f221-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 13:49:55 +0200 (CEST)
Received: by mail-pf1-x42c.google.com with SMTP id d17so6900706pfq.9
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jun 2022 04:49:55 -0700 (PDT)
Received: from localhost ([122.172.201.58]) by smtp.gmail.com with ESMTPSA id
 u1-20020a1709026e0100b0016160b3331bsm12552122plk.305.2022.06.22.04.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 04:49:53 -0700 (PDT)
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
X-Inumbo-ID: 6eba794a-f221-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xTtCO1zrt/IGUKd4FRnY6oWVk5z9FJ/JSc1j6sCiUd4=;
        b=n5TklPf8OeFgLiLBfco2InMdTPlWlmwKj5N5N7es/9LDV7HGfdKe5FC9RvttX7ADH9
         qmXqHUui9kUyhud5UjS1aG17dAs4wbZtG2edYPezh7AGoGtwChAEw/40WM+6qLp1zrZy
         4V0AWIjWsFUvIuG1JjhL2n4J4CsXaxLuvrF0yxRAw5xYFMumsYxkOTamEOserwOg53Y2
         gfTZhxspGroOMjPYKgshBe5W6NDaLB+O1QdpD6eaE5CtKKStMfe6VvdPO6TXMjq+ldDK
         B+1InY3GWc///NG7bl8sV7GxMNdoZxVTH2KoHO2dZ1op7RolOWjELYhcKYhPN7mUKFJu
         +pVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xTtCO1zrt/IGUKd4FRnY6oWVk5z9FJ/JSc1j6sCiUd4=;
        b=FlUti1XdTXs6cQgb/VStJAyIkx2C24ErDLrYvlle+lNL49kZMs8dKq4TZWA/n/qBLo
         rbPNK9IoCeOkSrQBPXwzqAIsDdwVPZaAKkJpauW9orI5x5P+Ewh1ANVNaAv2JAyinsB1
         6MZWa8/AC8e5eA4ChGxKsRRpwKX40WuianffwDE5V+ElXvDYwhIi2daTgnmSLJsiTGdo
         gmnTjc5h0fQ2hz9Scg1NxffoyrzFhbNRW19u+cN/+JVE1NbYcNcWxK4+pUDUB9w1tqxo
         cd4aInJ2X9Zhfw+LOcQo26ts2G0fj3o3H6WBMi2W0Mg/PZVaB8SqnnonR/wSlUr3UImN
         3n1g==
X-Gm-Message-State: AJIora8iG1S3gBK5DowzoMs3lPQ3SyfBv1K1DadbuBbwSSHp/OIGgIUJ
	AhdJCeCtq9rRgfafIQC0vAswCA==
X-Google-Smtp-Source: AGRyM1v0xeMpziioxlHN7hWY+tq/O/X29xdzMLfqoO7AXopXKS/bsLPcaM754GBBxwsXfe2/KGqE5Q==
X-Received: by 2002:aa7:9a11:0:b0:525:2412:920a with SMTP id w17-20020aa79a11000000b005252412920amr15308016pfj.66.1655898594110;
        Wed, 22 Jun 2022 04:49:54 -0700 (PDT)
Date: Wed, 22 Jun 2022 17:19:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Mike Holmes <mike.holmes@linaro.org>, Wei Liu <wl@xen.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: Virtio on Xen with Rust
Message-ID: <20220622114950.lpidph5ugvozhbu5@vireshk-i7>
References: <20220414091538.jijj4lbrkjiby6el@vireshk-i7>
 <CAPD2p-ks4ZxWB8YT0pmX1sF_Mu2H+n_SyvdzE8LwVP_k_+Biog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPD2p-ks4ZxWB8YT0pmX1sF_Mu2H+n_SyvdzE8LwVP_k_+Biog@mail.gmail.com>

On 28-04-22, 16:52, Oleksandr Tyshchenko wrote:
> FYI, currently we are working on one feature to restrict memory access
> using Xen grant mappings based on xen-grant DMA-mapping layer for Linux [1].
> And there is a working PoC on Arm based on an updated virtio-disk. As for
> libraries, there is a new dependency on "xengnttab" library. In comparison
> with Xen foreign mappings model (xenforeignmemory),
> the Xen grant mappings model is a good fit into the Xen security model,
> this is a safe mechanism to share pages between guests.

Hi Oleksandr,

I started getting this stuff into our work and have few questions.

- IIUC, with this feature the guest will allow the host to access only certain
  parts of the guest memory, which is exactly what we want as well. I looked at
  the updated code in virtio-disk and you currently don't allow the grant table
  mappings along with MAP_IN_ADVANCE, is there any particular reason for that ?

- I understand that you currently map on the go, the virqueue descriptor rings
  and then the protocol specific addresses later on, once virtio requests are
  received from the guest.

  But in our case, Vhost user with Rust based hypervisor agnostic backend, the
  vhost master side can send a number of memory regions for the slave (backend)
  to map and the backend won't try to map anything apart from that. The
  virtqueue descriptor rings are available at this point and can be sent, but
  not the protocol specific addresses, which are available only when a virtio
  request comes.

- And so we would like to map everything in advance, and access only the parts
  which we need to, assuming that the guest would just allow those (as the
  addresses are shared by the guest itself).

- Will that just work with the current stuff ?

- In Linux's drivers/xen/gntdev.c, we have:

  static unsigned int limit = 64*1024;

  which translates to 256MB I think, i.e. the max amount of memory we can map at
  once. Will making this 128*1024 allow me to map 512 MB for example in a single
  call ? Any other changes required ?

- When I tried that, I got few errors which I am still not able to fix:

  The IOCTL_GNTDEV_MAP_GRANT_REF ioctl passed but there were failures after
  that:

  (XEN) common/grant_table.c:1055:d0v2 Bad ref 0x40000 for d1
  (XEN) common/grant_table.c:1055:d0v2 Bad ref 0x40001 for d1

  ...

  (XEN) common/grant_table.c:1055:d0v2 Bad ref 0x5fffd for d1
  (XEN) common/grant_table.c:1055:d0v2 Bad ref 0x5fffe for d1
  (XEN) common/grant_table.c:1055:d0v2 Bad ref 0x5ffff for d1
  gnttab: error: mmap failed: Invalid argument


I am working on Linus's origin/master along with the initial patch from Juergen,
picked your Xen patch for iommu node.

I am still at initial stages to properly test this stuff, just wanted to share
the progress to help myself save some of the time debugging this :)

Thanks.

-- 
viresh


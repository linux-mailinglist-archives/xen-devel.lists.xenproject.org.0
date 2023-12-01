Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2048006A8
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 10:17:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645391.1007549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8zds-0008B9-D1; Fri, 01 Dec 2023 09:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645391.1007549; Fri, 01 Dec 2023 09:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8zds-00088h-9v; Fri, 01 Dec 2023 09:17:00 +0000
Received: by outflank-mailman (input) for mailman id 645391;
 Fri, 01 Dec 2023 09:16:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2bjU=HM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r8zdq-00088Y-UR
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 09:16:58 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6061bbf6-902a-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 10:16:57 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40b4746ae3bso14281685e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 01 Dec 2023 01:16:57 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 y8-20020a056000108800b00332fbc183ebsm3665846wrw.76.2023.12.01.01.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 01:16:56 -0800 (PST)
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
X-Inumbo-ID: 6061bbf6-902a-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701422217; x=1702027017; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oyg0wN4TaJ60pHMh49g4yYTPBBGg8ETeH0CB1qE2aP0=;
        b=Et2XKd4cLJ0jqCcgbq3ZiQOhnNdYONoqQtbUz9Yoz6e9lddLkeytLO5pWm7oMFkIMJ
         lrtC5GIJYYoE3eBlE2ldn0uDMYdMnNyekgdJ0X9fb131mBcetql1o1cCNE3d02oJzzhB
         8noN6d5ed+x7eJZRg1h5LfR6I6SxccyyXEMNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701422217; x=1702027017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyg0wN4TaJ60pHMh49g4yYTPBBGg8ETeH0CB1qE2aP0=;
        b=qcLWM9HVCgR8HMNjDqImxV6w5okl5L483z82xksB2+KBOKIOEIIoxMW7EE6E4GeqGJ
         UKT+5Y6NOio0uP6EeHGb99USmhFLzufGDOOzSyZiTVIU1Y0wvHurB5A2jgjySpC/I7Wg
         gWwhj9EN/E+acF0+G0kSgFa3y1Emq/peZryutBQ/OiUeYDQ9TqBqgNMozePma7AXh9nN
         dhAyYMUbuawfYg84Tl/3IX/ghb2MffwUHVXHmtGHy6gLZz0ZHEXYYD8aINJZ8+ut59dg
         Ss62G6HpaurCPgaqDv7FMn61rd4rW0qWgy+M9xT7EOYY7JO4xKY4ZMyAxfgqjfRFE8Vd
         HhMQ==
X-Gm-Message-State: AOJu0YwVv/QyqvyxFO0Qnbtgg6LW9PEybD5yjXlCA5gEIQxkViaSO2oW
	sglDv6Ge7ZUDG69PQdraowxDEQ==
X-Google-Smtp-Source: AGHT+IEhy6Kd9Kc7faIWsztFMU2a8EOY8G0TwKbCHMRMQcYc0GtS17csqrSH+cdYrGY4B8fv6R6GjA==
X-Received: by 2002:a05:600c:3b05:b0:404:f9c1:d5d7 with SMTP id m5-20020a05600c3b0500b00404f9c1d5d7mr280014wms.25.1701422216933;
        Fri, 01 Dec 2023 01:16:56 -0800 (PST)
Date: Fri, 1 Dec 2023 10:16:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v6 4/5] [FUTURE] xen/arm: enable vPCI for domUs
Message-ID: <ZWmkh0Xeaynh43N7@macbook>
References: <20231113222118.825758-1-stewart.hildebrand@amd.com>
 <20231113222118.825758-5-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231113222118.825758-5-stewart.hildebrand@amd.com>

On Mon, Nov 13, 2023 at 05:21:13PM -0500, Stewart Hildebrand wrote:
> @@ -1618,6 +1630,14 @@ int iommu_do_pci_domctl(
>          bus = PCI_BUS(machine_sbdf);
>          devfn = PCI_DEVFN(machine_sbdf);
>  
> +        if ( needs_vpci(d) && !has_vpci(d) )
> +        {
> +            printk(XENLOG_G_WARNING "Cannot assign %pp to %pd: vPCI support not enabled\n",
> +                   &PCI_SBDF(seg, bus, devfn), d);
> +            ret = -EPERM;
> +            break;

I think this is likely too restrictive going forward.  The current
approach is indeed to enable vPCI on a per-domain basis because that's
how PVH dom0 uses it, due to being unable to use ioreq servers.

If we start to expose vPCI suport to guests the interface should be on
a per-device basis, so that vPCI could be enabled for some devices,
while others could still be handled by ioreq servers.

We might want to add a new flag to xen_domctl_assign_device (used by
XEN_DOMCTL_assign_device) in order to signal whether the device will
use vPCI.

Thanks, Roger.


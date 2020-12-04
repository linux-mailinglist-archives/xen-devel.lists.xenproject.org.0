Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1022B2CECED
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:19:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44444.79621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl96z-00086k-PR; Fri, 04 Dec 2020 11:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44444.79621; Fri, 04 Dec 2020 11:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl96z-00086L-Lo; Fri, 04 Dec 2020 11:18:53 +0000
Received: by outflank-mailman (input) for mailman id 44444;
 Fri, 04 Dec 2020 11:18:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl96x-00086F-Kb
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:18:51 +0000
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6e05185-1e04-4afd-a384-015777f45441;
 Fri, 04 Dec 2020 11:18:50 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id 91so996988wrj.7
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:18:50 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id k6sm2720768wmf.25.2020.12.04.03.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:18:49 -0800 (PST)
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
X-Inumbo-ID: f6e05185-1e04-4afd-a384-015777f45441
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/mQZwD0o5vjrIKdlWxuGSJ4YB8S+Z/KzQCzJMkdeqYY=;
        b=YC/pYI7UoiRveRRHDkdB65Fj3uvAV0YYVHVhGPP2cv4qjc5pHQvGn9sxvzxTEkw5my
         suPzO2Mexj5vTmKym7wgYt67XJyn0Z3/U5Ml6xjFrsLRlt3SO1dlqyjOPL+3GSHOem1J
         Otk2CmTQ25hPHD/i7EE1lMKflVFedLJR+J69SRa+knzJBB9FzvUi4+KHjtWhDV2GZEB5
         0ogxUkcYqPb3+rHNcNbVckOpBYFHHT30/57jlFuObG32HKoi+Dk+m92PiJs5c6zSQzDq
         n8pw+M+WlwkOOZ1/CankPUJQVsqRNMoi1Rn5Er6G8Lc7AFONGDbq0EN/VBeAJxFYN44v
         6Q9g==
X-Gm-Message-State: AOAM532mdzC0K6i8TvLI593DtqAPrqaYPvh+nTMvdlErv1HinxFRk7mG
	SrdrX9KmSeRC0VhoDZdDdKQ=
X-Google-Smtp-Source: ABdhPJztSHKwRcD1BAt/CeqBvMknVFdjwDRN0XCxQRcwVtHzJe+o7DrAGu5hDzhxffjMSsV98c1UJQ==
X-Received: by 2002:a5d:4e47:: with SMTP id r7mr4352815wrt.342.1607080730168;
        Fri, 04 Dec 2020 03:18:50 -0800 (PST)
Date: Fri, 4 Dec 2020 11:18:48 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v5 03/23] libxl: Make sure devices added by pci-attach
 are reflected in the config
Message-ID: <20201204111848.bpgebyl3gcgwaprw@liuwe-devbox-debian-v2>
References: <20201203142534.4017-1-paul@xen.org>
 <20201203142534.4017-4-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203142534.4017-4-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Dec 03, 2020 at 02:25:14PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Currently libxl__device_pci_add_xenstore() is broken in that does not
> update the domain's configuration for the first device added (which causes
> creation of the overall backend area in xenstore). This can be easily observed
> by running 'xl list -l' after adding a single device: the device will be
> missing.
> 
> This patch fixes the problem and adds a DEBUG log line to allow easy
> verification that the domain configuration is being modified. Also, the use
> of libxl__device_generic_add() is dropped as it leads to a confusing situation
> where only partial backend information is written under the xenstore
> '/libxl' path. For LIBXL__DEVICE_KIND_PCI devices the only definitive
> information in xenstore is under '/local/domain/0/backend' (the '0' being
> hard-coded).
> 
> NOTE: This patch includes a whitespace in add_pcis_done().
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Acked-by: Wei Liu <wl@xen.org>


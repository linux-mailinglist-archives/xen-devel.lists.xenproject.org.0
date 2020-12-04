Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2792CED07
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:27:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44507.79741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9Ec-0001oU-4C; Fri, 04 Dec 2020 11:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44507.79741; Fri, 04 Dec 2020 11:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9Ec-0001o5-0f; Fri, 04 Dec 2020 11:26:46 +0000
Received: by outflank-mailman (input) for mailman id 44507;
 Fri, 04 Dec 2020 11:26:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl9Eb-0001o0-6K
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:26:45 +0000
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c303893-563c-4cb7-a3a6-7b303daa7b34;
 Fri, 04 Dec 2020 11:26:43 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id 91so1019886wrj.7
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:26:43 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id b11sm2235812wrs.84.2020.12.04.03.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:26:41 -0800 (PST)
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
X-Inumbo-ID: 6c303893-563c-4cb7-a3a6-7b303daa7b34
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DegQS7TWt3u4cw5soBD9Ag1ldmEawFj2H5tQVuxrhUs=;
        b=imGSsAA2nbclZMSTPZy6qlumAw70ZsuRQ+s8dInZeF+lvLKTKu4qfktEW2SNuVFKly
         dnjBIyWLJAXVpQz90bT+nLqqTFUXetayHNTWT4r6k3BGVoAepFZUnHKbhDGNmxNFYRKY
         Bh4fyknk1XUcOYJUZcXx1SnZs9hfmVvBaI1Av3K51QwkP/dQ3wabLeiV348UVKb2Abz4
         4u0MpoCBcPhu/eTP6sVF7oc50ON7d7CWYZeSGtEyfMKZo+hG24CBPhFFpwSZf2XjO2wZ
         pTGVUXUTiJ4Zt/HKuU+koFJU0MEHJWfIbsxe8MusbJ6ys1ur7cLqFTuszxdGrHzfyZCn
         pt1g==
X-Gm-Message-State: AOAM532I8T3uYC1Ed0sPx8IV+75DCydd/wTnth3fU5lf9h4lV1FDmtNf
	sAI6M1tABOGXpPHjXdbXL00=
X-Google-Smtp-Source: ABdhPJwBE9eMkFnYC9WQfWhZtc3YTvZRxUtUYgdtgmqNnjjNxL4Nv2zbrkfJmOw4p19I2tHx0PsTRA==
X-Received: by 2002:a5d:634d:: with SMTP id b13mr4484603wrw.310.1607081202506;
        Fri, 04 Dec 2020 03:26:42 -0800 (PST)
Date: Fri, 4 Dec 2020 11:26:40 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 10/23] libxl: remove get_all_assigned_devices() from
 libxl_pci.c
Message-ID: <20201204112640.5ucp2oazwjbla6e3@liuwe-devbox-debian-v2>
References: <20201203142534.4017-1-paul@xen.org>
 <20201203142534.4017-11-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203142534.4017-11-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Dec 03, 2020 at 02:25:21PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Use of this function is a very inefficient way to check whether a device
> has already been assigned.
> 
> This patch adds code that saves the domain id in xenstore at the point of
> assignment, and removes it again when the device id de-assigned (or the
> domain is destroyed). It is then straightforward to check whether a device
> has been assigned by checking whether a device has a saved domain id.
> 
> NOTE: To facilitate the xenstore check it is necessary to move the
>       pci_info_xs_read() earlier in libxl_pci.c. To keep related functions
>       together, the rest of the pci_info_xs_XXX() functions are moved too.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Acked-by: Wei Liu <wl@xen.org>


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C96793FA72
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 18:19:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766981.1177535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYT5V-0000hV-Ln; Mon, 29 Jul 2024 16:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766981.1177535; Mon, 29 Jul 2024 16:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYT5V-0000f9-J7; Mon, 29 Jul 2024 16:19:05 +0000
Received: by outflank-mailman (input) for mailman id 766981;
 Mon, 29 Jul 2024 16:19:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfTU=O5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sYT5T-0000ez-VL
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 16:19:03 +0000
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [2607:f8b0:4864:20::b31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 446b18c6-4dc6-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 18:19:02 +0200 (CEST)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e0875778facso2081163276.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 09:19:02 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3fae78c6sm53559316d6.126.2024.07.29.09.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 09:19:00 -0700 (PDT)
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
X-Inumbo-ID: 446b18c6-4dc6-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722269941; x=1722874741; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgbMMDklNxipWx8O8O70zQRwrNe5QRaTKfpv0vnkRy4=;
        b=qI9Kerao4SdV+rsjUz7ijttkAp3QnBOBcBZUGRygMWc2ddOCtm2H2KXlsBiPuqv7gp
         IaeRhRQS17Jl6G7Rx+oOeBFT6B1R8PSarfocWmj4DGxkyA47gCrB2RDV2RcgqThvssCb
         hxscrEjce3EBnaXxXciQYT4nAbDnCbr1LXHqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722269941; x=1722874741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgbMMDklNxipWx8O8O70zQRwrNe5QRaTKfpv0vnkRy4=;
        b=EH4RckRcnzLeBJyy4O5MLJY7555uZSbONx5GNyI9WOvKWjpWsi2hdvmXkjTvigT5re
         sJ6BWEh7zscDMOZClEFsnswtc/AD7Z2BiH6kAr4TUBjhugcwg4KGCmn0J1mqO5xM3Nbl
         M6fv3kB5kI5DiKjpc2PSEHHCXjq2UmezACDTXFz5YPx06jzadoAkbisX8P0PcnsSVLqZ
         zuEf9q5Hgoh/e6G/uXk8HoDQNDnYfMLFDOdbCyGiWj8p4Y9COanCJFW0lAlZp6DguMue
         /0yG3odSNAC3+vuis6OBhoC/xWwMwdezQjxQclBabdnolo3kBewdAsK50AIZ0lUTGMrv
         LxIQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/gmonOb2THijrimwLXodwRCh6k7JwL6G+lxsVIbw34ePt/Ivklk2c/0xv08R+GJUnYmVlRlCh/N3Zb5RupIKEEDpoF0LuiZbkERL/hqY=
X-Gm-Message-State: AOJu0YyFhp5Iv5HfFTiuuaMUZfJB3FMDzIBMx4BgYg+alCDpgw6IS4xx
	dU39gdyi/Q5D0jdOIVpVDEdRX9pUSbGfWTnGnmLIMyYV5POZ5wp9vwkT/lTSi6VKXjsitO6Yy7k
	d
X-Google-Smtp-Source: AGHT+IGV+UqNOlplUUcSP0vcmLSwfYvweZe7iroJCVD8QxRgqo/Itoyq/qxrX6XGnMj766MvvYhlDw==
X-Received: by 2002:a05:6902:709:b0:e08:6ce9:6e8e with SMTP id 3f1490d57ef6-e0b544a0b1dmr8365132276.23.1722269941220;
        Mon, 29 Jul 2024 09:19:01 -0700 (PDT)
Date: Mon, 29 Jul 2024 18:18:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, alejandro.vallejo@cloud.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 03/22] x86/dom0: only disable SMAP for the PV dom0 build
Message-ID: <ZqfA714LUFgZOYqw@macbook>
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-4-roger.pau@citrix.com>
 <b1918f51-1ac0-40f8-9174-d8161b2681dd@suse.com>
 <5aad5f48-e32e-4a59-bcef-05adec0ecbec@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5aad5f48-e32e-4a59-bcef-05adec0ecbec@citrix.com>

On Mon, Jul 29, 2024 at 04:52:22PM +0100, Andrew Cooper wrote:
> On 29/07/2024 12:53 pm, Jan Beulich wrote:
> > On 26.07.2024 17:21, Roger Pau Monne wrote:
> >> The PVH dom0 builder doesn't switch page tables and has no need to run with
> >> SMAP disabled.
> >>
> >> Put the SMAP disabling close to the code region where it's necessary, as it
> >> then becomes obvious why switch_cr3_cr4() is required instead of
> >> write_ptbase().
> >>
> >> Note removing SMAP from cr4_pv32_mask is not required, as we never jump into
> >> guest context, and hence updating the value of cr4_pv32_mask is not relevant.
> > I'm okay-ish with that being dropped, but iirc the goal was to keep the
> > variable in sync with CPU state.
> 
> Removing SMAP from cr4_pv32_mask is necessary.
> 
> Otherwise IST vectors will reactive SMAP behind the back of the dombuilder.
> 
> This will probably only manifest in practice in a CONFIG_PV32=y build,

Sorry, I'm possibly missing some context here.  When running the dom0
builder we switch to the guest page-tables, but not to the guest vCPU,
(iow: current == idle) and hence the context is always the Xen
context.

Why would the return path of the IST use cr4_pv32_mask when the
context in which the IST happened was the Xen one, and the current
vCPU is the idle one (a 64bit PV guest from Xen's PoV).

My understanding is that cr4_pv32_mask should only be used when the
current context is running a 32bit PV vCPU.

Thanks, Roger.


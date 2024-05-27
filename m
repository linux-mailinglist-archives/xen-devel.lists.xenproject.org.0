Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5668CFB2A
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 10:21:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730626.1135759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBVbA-0007Hd-LV; Mon, 27 May 2024 08:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730626.1135759; Mon, 27 May 2024 08:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBVbA-0007Et-IE; Mon, 27 May 2024 08:20:52 +0000
Received: by outflank-mailman (input) for mailman id 730626;
 Mon, 27 May 2024 08:20:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0flO=M6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sBVb8-0007En-P2
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 08:20:50 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05b8eebb-1c02-11ef-b4bb-af5377834399;
 Mon, 27 May 2024 10:20:48 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-356c4e926a3so1710423f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 01:20:48 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3587724c6f4sm3336591f8f.28.2024.05.27.01.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 01:20:47 -0700 (PDT)
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
X-Inumbo-ID: 05b8eebb-1c02-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716798048; x=1717402848; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+DBJ1woGsE1g35pnBuR+vdgr+wti5M2VoyQK+WzYEAQ=;
        b=DxUfvlHJrhZ6jMjPtZm570xy5/lKXn2gwV/NjBgdX7J2cCecF6kF8AiUXAYyMFjVy8
         PWIfZia69c0Ul3ZzBY955o2I0dLFTXqDyKtOqZVmyMuMwgpzo/KrtDWcYpPkRTKG6ZPs
         BJxxVQDJdpX060pEBODrGnvJ6VPlsUCNfSj5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716798048; x=1717402848;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+DBJ1woGsE1g35pnBuR+vdgr+wti5M2VoyQK+WzYEAQ=;
        b=VD5LsTeltS0NZ+4VnpXO9P5u3P56kYekSVZUr3GLoKH9ZtkUORLV8h+PMNt9aN07aM
         XAGtvKXXKOdG0xiqh+HEvKKvsfjM7tFIcBuwl5v6x+n5y/WgEj3HXZGQoAY2Q9oHAMYL
         XKGS0DyD8FAmzxRr4DEM2HT71J7XonJabBTTzu646h6trnLAYoUYnsp7EohZX889HZgH
         u3ifrBGv7QxwWVld1t2Sqfn7/tk9Z+NltafXtSCjiyK0SC4ENTa3xEXgnMBURwGfV/+T
         Xt8hJG6VyWfuG7Kaqmf9KNrhJWDeE7ATksu61lM7vQg92oC71/DBPaotXLuIYp36+3Um
         jQeg==
X-Gm-Message-State: AOJu0YxjwbFSLO/snqR9YmSq2enybtfClO31DQtpUzhxgy8aLFBrceqQ
	VesrBIlrB6OYTxJu1Ia3Z7QjctBljPCsx/KzxduKZTxWwCwfMrhvPWFtlqTGenE=
X-Google-Smtp-Source: AGHT+IGhVN18oedPG+wfaoRL0TJAbh8n8SUEfimQDMiXQcjH4MwupcAZouUmwhwVx9WLYsqvO/YNbA==
X-Received: by 2002:a05:6000:a8f:b0:354:e775:19ff with SMTP id ffacd0b85a97d-35527057550mr6750167f8f.38.1716798047736;
        Mon, 27 May 2024 01:20:47 -0700 (PDT)
Date: Mon, 27 May 2024 10:20:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 8/8] xen/x86: Synthesise domain topologies
Message-ID: <ZlRCXmjhsM5o4tVw@macbook>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <f51b54328a09c510c9320f1317c2da371ef16eb5.1715102098.git.alejandro.vallejo@cloud.com>
 <ZlBWtXkpkqzh1EWC@macbook>
 <6e1c52a3-98d2-42e9-96b7-91010806cdf5@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e1c52a3-98d2-42e9-96b7-91010806cdf5@cloud.com>

On Fri, May 24, 2024 at 06:16:01PM +0100, Alejandro Vallejo wrote:
> On 24/05/2024 09:58, Roger Pau Monné wrote:
> > On Wed, May 08, 2024 at 01:39:27PM +0100, Alejandro Vallejo wrote:
> > 
> >> +        rc = x86_topo_from_parts(&p->policy, threads_per_core, cores_per_pkg);
> > 
> > I assume this generates the same topology as the current code, or will
> > the population of the leaves be different in some way?
> > 
> 
> The current code does not populate 0xb. This generates a topology
> consistent with the existing INTENDED topology. The actual APIC IDs will
> be different though (because there's no skipping of odd values).
> 
> All the dance in patch 1 was to make this migrate-safe. The x2apic ID is
> stored in the lapic hidden regs so differences with previous behaviour
> don't matter.

What about systems without CPU policy in the migration stream, will
those also get restored as expected?

I think you likely need to check whether 'restore' is set and keep the
old logic in that case?

As otherwise migrated systems without a CPU policy will get the new
topology information instead of the old one?

> IOW, The differences are:
>   * 0xb is exposed, whereas previously it wasn't
>   * APIC IDs are compacted such that new_apicid=old_apicid/2
>   * There's also a cleanup of the murkier paths to put the right core
>     counts in the right leaves (whereas previously it was bonkers)

This needs to be in the commit message IMO.

> > 
> > Note that currently the host policy also gets the topology leaves
> > cleared, is it intended to not clear them anymore after this change?
> > 
> > (as you only clear the leaves for the guest {max,def} policies)
> > 
> > Thanks, Roger.
> 
> It was like that originally in v1, I changed in v2 as part of feedback
> from Jan.

I think that's fine, but this divergence from current behavior of
cleaning the topology for the host policy needs to be mentioned in
the commit message.

Thanks, Roger.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F338510D6
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 11:29:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679517.1056957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZTYK-0000JW-FR; Mon, 12 Feb 2024 10:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679517.1056957; Mon, 12 Feb 2024 10:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZTYK-0000Gk-CG; Mon, 12 Feb 2024 10:28:44 +0000
Received: by outflank-mailman (input) for mailman id 679517;
 Mon, 12 Feb 2024 10:28:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9jSY=JV=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rZTYI-0000Ge-U9
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 10:28:42 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d629936-c991-11ee-98f5-efadbce2ee36;
 Mon, 12 Feb 2024 11:28:40 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d09b21a8bbso34190071fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 02:28:40 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a22-20020aa7d756000000b0056140d51b7asm2613355eds.83.2024.02.12.02.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 02:28:39 -0800 (PST)
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
X-Inumbo-ID: 7d629936-c991-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707733720; x=1708338520; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jUUI3GfqaHKmy5SV4Q2DqQy4jjrcpq08WVUneH3czzI=;
        b=g0G3GSbFzZNoeHS4JZEqe0ndmDg/hoUr+i74C9sTIMDGCKwSYMaIEULLCgefMVMo6x
         f4zUHKptaWXDzLumbzf8TrgH4qShjdmT20eVCbClfzggFEc3fZLRJ18RnyuhCttfpofm
         dmzQedmF6l/o3Co110/O13uPHLMHnBYhjzLeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707733720; x=1708338520;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUUI3GfqaHKmy5SV4Q2DqQy4jjrcpq08WVUneH3czzI=;
        b=LClOmOo64DonfvxTWbPXYrTQyh7VFASpR1HdMZn4c3tsDS/CWKWMX/9P1l0yUeCeXs
         kz2+5fneexN/aj2DyeR0g47Flgy6sY+UsEqpR9HVdmnke/tZEoC287AUoSOec3FLnkdU
         34G4El4VgCdVq8voxVYprnR08hvOU9GbFZBeM+r/Wgj0in8eX7wMOiW8pyaOPevj0cLP
         jKAU9VMXG/aBewr9Rbinc2LD9qc54Pa6Q9XMH62RgKK0CirmZN8nzMhIhSpLrO7mJhI7
         5zY6g/Vv6aIETXSHGuv8zCGav4PL44T/71S/CcqMXy/OCZvQ489b/HXe4wjBS5+tBlKG
         nWlg==
X-Gm-Message-State: AOJu0Yypysln8UbGZqwH7TEd4lt5YNmW1t8zD7INF/nyY2WOX56+DQFo
	AikvKAxZtSi+cIpNiPrVRtKiqMXskoIbNqwYYd0Wne2ckvngkvjx8FmWH+G1eXk=
X-Google-Smtp-Source: AGHT+IFpRB2TBiEfByAU22ZXMlRhKnmIAe28zTZbsTzbv+YFU43V3QvCc36UDjwfHqMF7B03L5CsVw==
X-Received: by 2002:a2e:960b:0:b0:2d0:a8f6:c882 with SMTP id v11-20020a2e960b000000b002d0a8f6c882mr4234067ljh.42.1707733720146;
        Mon, 12 Feb 2024 02:28:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXM1r3UoT4T13pdtBMst4pWYpM/jLdTKkhnmNmIM0GB72q18iqC1mnVzTMUW8E9jGrrBf/tHg5kq2PonCkiQZJ/uGwyax0QZj6xGzo=
Date: Mon, 12 Feb 2024 10:28:39 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/4] libxl: Add support for blktap vbd3
Message-ID: <12968873-6fc7-4c76-9bf9-6beff73a714e@perard>
References: <20240201183024.145424-1-jandryuk@gmail.com>
 <20240201183024.145424-3-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201183024.145424-3-jandryuk@gmail.com>

On Thu, Feb 01, 2024 at 01:30:22PM -0500, Jason Andryuk wrote:
> This patch re-introduces blktap support to libxl.  Unlike earlier
> versions, it does not link against any blktap library.  libxl changes
> are needed to write to the vbd3 backend XenStore nodes.
> 
> blktap has three components.  tapdisk is a daemon implementing the disk
> IO, NBD (Network Block Device), and Xen PV interfaces.  tap-ctl is a
> tool to control tapdisks - creating, starting, stopping and freeing.
> tapback manages the XenStore operations and instructs tapdisk to
> connect.
> 
> It is notable that tapdisk performs the grant and event channel ops, but
> doesn't interact with XenStore.  tapback performs XenStore operations
> and notifies tapdisks of values and changes.
> 
> The flow is: libxl writes to the "vbd3" XenStore nodes and runs the
> block-tap script.  The block-tap script runs tap-ctl to create a tapdisk
> instance as the physical device.  tapback then sees the tapdisk and
> instructs the tapdisk to connect up the PV blkif interface.
> 
> This is expected to work without the kernel blktap driver, so the
> block-tap script is modified accordingly to write the UNIX NBD path.
> 
> backendtype=tap was not fully removed previously, but it would never
> succeed since it would hit the hardcoded error in disk_try_backend().
> It is reused now.
> 
> An example command to attach a vhd:
> xl block-attach vm 'vdev=xvdf,backendtype=tap,format=vhd,target=/srv/target.vhd'
> 
> Format raw also works to run an "aio:" tapdisk.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD


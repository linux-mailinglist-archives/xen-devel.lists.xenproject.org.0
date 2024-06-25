Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E43916190
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 10:46:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747468.1154889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM1oQ-0005cR-ID; Tue, 25 Jun 2024 08:46:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747468.1154889; Tue, 25 Jun 2024 08:46:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM1oQ-0005Zy-Eq; Tue, 25 Jun 2024 08:46:02 +0000
Received: by outflank-mailman (input) for mailman id 747468;
 Tue, 25 Jun 2024 08:46:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2LY6=N3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sM1oP-0005Zs-9V
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 08:46:01 +0000
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [2607:f8b0:4864:20::92a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57a9e2c1-32cf-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 10:45:59 +0200 (CEST)
Received: by mail-ua1-x92a.google.com with SMTP id
 a1e0cc1a2514c-80f6521eeddso1145740241.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 01:45:59 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b52d82377dsm31721876d6.19.2024.06.25.01.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 01:45:57 -0700 (PDT)
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
X-Inumbo-ID: 57a9e2c1-32cf-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719305157; x=1719909957; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g56+XRF9QGFax5i2ZEBOjZix2dumVKph2ax/brL9KaE=;
        b=T1HAYujrvaz6CNpa670HUoeJDBpPHxK78bZ2RzKl7u7zN0891Q0PQT5lR0FdrQR81I
         FjjkNawBAZ1unjudAcol/C7FgMntWhurVORLt+6clATQzXh3B2A1yt7y33RR9oGnWwPS
         EXbIXEaFpKfHV/6MGq5F9z2MWq/TkDs5LpZu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719305157; x=1719909957;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g56+XRF9QGFax5i2ZEBOjZix2dumVKph2ax/brL9KaE=;
        b=FdlrW4Gr8eQ8+Qw7VfdR4pgHzMtZh20GGYeijc7V+rcpnJBFGE5smihys8F9ZpNMCC
         nTnlVv8TKwMnQLxW1Rn7Th4GdcKa21plmxolligUY1sZx7dDe64dqUQqxhDEmg1TWQYQ
         CYzZZ+XWw8Y7nD/4oDAAeaRJlOb4t777HDtRuxMa5cBW8caXSplOzb5SAOMev4vp6lkX
         p+r2Am/NRtzKWNTpyHA8TpyN8OGJZqTgz2SMsWxIbK/UrzP8Tt/4PsANZW+NiHNZOltQ
         ytTM4PMLvLQRsdlsavRCKvMO2N89kjrS+WumfefXMmsqs+ogRKPaZDuUeqjMTHuc68Wm
         V2xg==
X-Forwarded-Encrypted: i=1; AJvYcCU5Gr44GLgRviQhc41l1t+tptKXtYIzaKEho9kYndxMzGzqbx4RO2BoR7o5426gAFdyELGd0mh531lSiqe/c+MAlM+plTRi9VREAoO4eF8=
X-Gm-Message-State: AOJu0Yx6KnI11sB0r5DJu2VjAbFFjSOxlcv73q/Oxt5X27HuBdcKPm7b
	6tET2QW/wFIzeZrt3WLimfqrs//fFSiU6mXUENS6epUU2NDIki4GRX8qLWD7+/c=
X-Google-Smtp-Source: AGHT+IH0MfSZCdGKMabk40+auVyUctI7c/cU4UkcPOH97YW3mfjjmX4BCPuh/WV68LtaDi5JbfPV3g==
X-Received: by 2002:a05:6122:9a8:b0:4ef:27db:d206 with SMTP id 71dfb90a1353d-4ef69ec006cmr5271895e0c.0.1719305157550;
        Tue, 25 Jun 2024 01:45:57 -0700 (PDT)
Date: Tue, 25 Jun 2024 10:45:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Christoph Hellwig <hch@lst.de>
Cc: jgross@suse.com, marmarek@invisiblethingslab.com,
	xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
	Rusty Bird <rustybird@net-c.com>
Subject: Re: [PATCH] xen-blkfront: fix sector_size propagation to the block
 layer
Message-ID: <ZnqDwwXgwDlggHgH@macbook>
References: <20240625055238.7934-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240625055238.7934-1-hch@lst.de>

On Tue, Jun 25, 2024 at 07:52:38AM +0200, Christoph Hellwig wrote:
> Ensure that info->sector_size and info->physical_sector_size are set
> before the call to blkif_set_queue_limits by doing away with the
> local variables and arguments that propagate them.
> 
> Thanks to Marek Marczykowski-Górecki and Jürgen Groß for root causing
> the issue.
> 
> Fixes: ba3f67c11638 ("xen-blkfront: atomically update queue limits")
> Reported-by: Rusty Bird <rustybird@net-c.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks for debugging this.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Roger.


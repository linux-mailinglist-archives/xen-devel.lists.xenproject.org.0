Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85956984F08
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 01:40:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803382.1213924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stF8Y-0006EC-Iu; Tue, 24 Sep 2024 23:40:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803382.1213924; Tue, 24 Sep 2024 23:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stF8Y-0006Ch-FP; Tue, 24 Sep 2024 23:40:06 +0000
Received: by outflank-mailman (input) for mailman id 803382;
 Tue, 24 Sep 2024 23:40:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C5PF=QW=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1stF8X-00061S-Jl
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 23:40:05 +0000
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [2607:f8b0:4864:20::e29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5280e23c-7ace-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 01:40:04 +0200 (CEST)
Received: by mail-vs1-xe29.google.com with SMTP id
 ada2fe7eead31-49bd221ef66so2309072137.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 16:40:04 -0700 (PDT)
Received: from gmail.com (ip190-5-140-142.intercom.com.sv. [190.5.140.142])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-84e73d22f77sm1150564241.33.2024.09.24.16.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 16:40:01 -0700 (PDT)
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
X-Inumbo-ID: 5280e23c-7ace-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727221203; x=1727826003; darn=lists.xenproject.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7QjF1FQfJHqgsRhj3x6a55Qb1Fio1T7hBVW7nM+kaQ=;
        b=PO4x21c/N5ZLq+b3csV0oFfrCPvsTvQSaw+Eg3VSuJ9AptCCBysSNbQAFjrAKQqy9o
         j1lIqQBEtKV37YbLDdPb+xIoC/liVttiMOnsyp+0ZVFWxx2Hnk8bV+Y2iQIloe5QHmnf
         sSrPz2/j9bP0nn9xEla5z8niowqVW6aV5oRDsEo39JQWBUA4RLyoAhB3Ns1Wd9MS68uM
         z1FG8FXH+NFOWwVpRLjW8Kt7dLTpdn7R01sHB3o3yFjuo27sjo51Br+PK7HXwE4soIeM
         qr1oFWpy+hSgTzhmfhjUWynmTL8RR40zbrFT7/Y1vJjwgw+Yzdpg1DFTbvCP5WKb8fHQ
         b/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727221203; x=1727826003;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7QjF1FQfJHqgsRhj3x6a55Qb1Fio1T7hBVW7nM+kaQ=;
        b=f3kjhb02I79uuh20hMrExtbF+DsvjpEo3XEmo0csc0ykoHUYjLts88wNfWDGI9kH48
         kps6Jvan3zuxnfWIamvEy6lenhGzSplsuTIV9bNyY6KsD3yS0cVEIkg2RdrbehvFx5Vs
         x2EeF50GvuGCdNvpaLx+nmCEjUEg+Kv1Pq4MKm7U1ICypgRgwMNBFW8/eU4XWKVdd3qZ
         c+EJuRDM1s19GuK2/fm8r3cXPID0jmNAepMKj3UDDJe6bdKj1b95y+NEfiSkFc/2DIZm
         j9Q9RtO/jI4LOUnT11I7GjeQ00hpCb8i7rA2brC4cNfc5L1BmWSHNiuJApRqmNK16yys
         /sKw==
X-Forwarded-Encrypted: i=1; AJvYcCWFgDo+vYkj2MJHvkHO3V+IX7rCHkk9Ic47ZeTPlT70VTc4Hibq1LbmrRLk/FKeg39/hA+0qgTjOHw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw68qFDq8N6wuNi92NAUGEbIWQ1oYLw26Yd45zurYZrbvzRaDOB
	WEht8MSNFHYPh/BLdG3YoSJ4CICgIP/b0Z0IueBxNiwH8J/p9V57
X-Google-Smtp-Source: AGHT+IEJevHVbUuNtNAO+5pugxwL2gBJIzJY8gSMOtX18iM3qpJNa787hAeK1T/DnRf42sLWNecp0A==
X-Received: by 2002:a05:6102:dc9:b0:493:b719:efaf with SMTP id ada2fe7eead31-4a15dd1e3b7mr1196323137.20.1727221203112;
        Tue, 24 Sep 2024 16:40:03 -0700 (PDT)
Date: Wed, 25 Sep 2024 01:40:00 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
	bertrand.marquis@arm.com, michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com, dpsmith@apertussolutions.com,
	edgar.iglesias@amd.com
Subject: Re: [PATCH v1 1/6] xen/arm: Decrease size of the 2nd ram bank
Message-ID: <ZvNN0CYDKPMcC4Pa@zapote>
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
 <20240924162359.1390487-2-edgar.iglesias@gmail.com>
 <f20c2ddb-162b-4e62-93b6-882e19e17852@xen.org>
 <alpine.DEB.2.22.394.2409241622320.1417852@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2409241622320.1417852@ubuntu-linux-20-04-desktop>
User-Agent: Mutt/2.2.12 (2023-09-09)

On Tue, Sep 24, 2024 at 04:34:16PM -0700, Stefano Stabellini wrote:
> On Tue, 24 Sep 2024, Julien Grall wrote:
> > Hi Edgar,
> > 
> > On 24/09/2024 17:23, Edgar E. Iglesias wrote:
> > > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > > 
> > > The address range between 4G (32bit) and 1TB (40bit) is fully
> > > allocated. There's no more room for devices on ARM systems with
> > > 40-bit physicall address width.
> > > > This decreases the size of the second RAM bank to free up space
> > > in preparation for virtio-pci and for future use-cases.
> > 
> > I don't think we should reduce the amount of RAM supported in the default
> > case. Instead, I think it is time to support a more dynamic layout so we still
> > allow 1TB guest when QEMU is not emulated a virtual PCI hostbridge.
> 
> Edgar, do you think it would be possible for QEMU to take the virtio-pci
> address ranges and SPIs on the command line? If yes, I think that would
> solve the problem on the QEMU side.

Yes, that is already done on the QEMU side, all addresses and sizes are
passed on the command-line.


> On the Xen side, you have already added "virtio-pci-ranges" as dom0less
> property and that's all we need as far as I can tell.
> 
> Then you can remove patch #1 and patch #2 from this series?

I didn't think of that but yes, that should actually work, good point.

Cheers,
Edgar


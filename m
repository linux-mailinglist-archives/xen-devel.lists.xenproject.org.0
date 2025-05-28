Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7D1AC7251
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 22:39:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999501.1380140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKNXZ-00049D-JO; Wed, 28 May 2025 20:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999501.1380140; Wed, 28 May 2025 20:38:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKNXZ-00047p-Fl; Wed, 28 May 2025 20:38:21 +0000
Received: by outflank-mailman (input) for mailman id 999501;
 Wed, 28 May 2025 20:38:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=68pE=YM=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uKNXY-00047j-2F
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 20:38:20 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afc55694-3c03-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 22:38:18 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-55324587a53so1663133e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 May 2025 13:38:18 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533791d047sm1740e87.197.2025.05.28.13.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 13:38:16 -0700 (PDT)
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
X-Inumbo-ID: afc55694-3c03-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748464697; x=1749069497; darn=lists.xenproject.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IM6C0g8568ddrCVZ/V5BXpWwYkuvhDd1PiVlUhhZSjM=;
        b=PvHUkSVyBKas6oSIqXNNuhHFRonlPXt1/VLtl7ygl72FE5NJn8Owofzd0AFnSOgZl4
         PS9gYJLvAezqCJUFhwAAM/dd1iqnVx1ZSzy3sv+VBMSSyGdqRoAdRzE5WfVPEGh7WZhW
         SgLJ7ZH3nGJKe07nh7TUQTJjjmH1ARzFsdU0Ppu1n5yGw4FAr7evsBJLV+5bZcagsWNq
         NVL4wc5b2qKgh+JjiItGuNwA7ew21vY3TqgeNirbFRgv6I63VX2JSdaAC1OyRbDHPGnV
         PgRG3GGgh1tR8xEjWJ5zooSNs0HXN+Nx1/YoYPR/hd6541WLV6UfjzJoyDKQQ1x4z1iI
         W4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748464697; x=1749069497;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IM6C0g8568ddrCVZ/V5BXpWwYkuvhDd1PiVlUhhZSjM=;
        b=VvHw7rm3L59jtjAcXeNdIR92ehY3IbrdW5nF6+apnYVsUF8ipnx/GyMjr7nLntXtpG
         ZNanZ117WlaFsn/NcjkwETSLmdVc44+Q0eIoIe+4JeX138lvBuU3PLCZoHyhYrtHKVLB
         gyxJPT33Ps+u8NU4RSJ2j5C/9+iHLk3lbGHLa3L+7WutfCwQOONg2mqXOnVBeA1aRQUA
         VZr3XXoA+s1W/u2+6/6Gp7AeXX335YCZENuXt3swPJ+e8meUHsrJ5yqY1oFtrRtqnOs4
         pmJyg2ipfrNUNGo3xHrKMwcjrZ4Vpbt0FnA1prM4LzdgvyA9fWLgWl7gfUbzomoe99Rg
         ZG/g==
X-Gm-Message-State: AOJu0YwhAcGuvl18fZH74IZ7+phb+VCU8f+znWexSX5zCLcm+Q5+p8nv
	MbjpOHW3ByDO0qoxu9uKkTyuvWzBEE/L5c3iHKveIZ/v3rpmyd42OSZj
X-Gm-Gg: ASbGncuTktUSdG4gk4nCRH2ehPAI7jrMeeGDlTSzSKu674MX2+lT1MsR++/rcD1tzR9
	Dpq1OvtJP1qNfp0Sig7KMGuEWcY7ysVk0t/cjq7sAxUFKXU+TRrfutwOQpvx+1fbEafQr5dJnjX
	NvW1hrDFN/XVBLZueuhIi+11oDb19ujmr2Bqfx6dHh4++95FjN/O7erp9nCYenfjiA+rt3qmHcf
	WWesJALeDTPKqkG2r2gn3/bscWGDd+XX4WUoPtimUBBVGQBFI/o0A6FQIU3PdiSvB4UTPOZ14AX
	XiW73fibC54sMxTDLFSxuj5SzJlssd3PtTXtptLRJuQ3fAOIpveSw+HNznM+UKQQKXOHD8J8d84
	uYHNmaB0VWEB6yMjkWCBGn/UJiy9nfloQrg==
X-Google-Smtp-Source: AGHT+IG4IuOuhAAQIBDnnEKwddgoNJS5TMmg7k7sW9aD+tcdmwGinsQ0LbC2A3ei5TR0A6rGnOOJxg==
X-Received: by 2002:a05:6512:3092:b0:553:2782:ac6d with SMTP id 2adb3069b0e04-55335b1e536mr345229e87.15.1748464697146;
        Wed, 28 May 2025 13:38:17 -0700 (PDT)
Date: Wed, 28 May 2025 22:38:15 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org,
	bertrand.marquis@arm.com, michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com, edgar.iglesias@amd.com
Subject: Re: [PATCH v1 0/3] xen/arm: Add option to optionally disable
 trapping on unmapped mmio
Message-ID: <aDd0N1SD5obMbuZ-@zapote>
References: <20250527195616.874614-1-edgar.iglesias@gmail.com>
 <2eac2199-f3e2-4fa8-b6e3-f6cbf999d436@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2eac2199-f3e2-4fa8-b6e3-f6cbf999d436@citrix.com>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2025-03-23)

On Tue, May 27, 2025 at 09:03:11PM +0100, Andrew Cooper wrote:
> On 27/05/2025 8:56 pm, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> >
> > This follows up on the virtio-pci discussion and adds a per-domain
> > option to select the behaviour of accesses to unmapped mmio ranges.
> > The new option is trap-unmapped-mmio. For dom0less I negated it to
> > be able to use a boolean prop and keep existing behaviour, i.e
> > trap-unmapped-mmio-disabled.
> >
> > I'm happy with any name though so if you have better ideas please
> > suggest them!
> >
> > For the domain config i followed the example of x86 flags
> > and XEN_X86_MSR_RELXED, creating a flags field for ARM.
> >
> > Thanks,
> > Edgar
> 
> I think this should be common, rather than ARM specific.
> 
> Traditionally on x86, access to unimplemented address space was ignored
> (write discard, read ~0), but these days you do get a machine check on
> certain ranges, which is for all intents and purposes the same as a data
> abort.
> 
> So even if x86 requires it to be false in the short term, I think the
> control ought to be common, so x86 and others can opt in at a later point.

We can do that, we'd need to have different default values though since
x86 wants default false and ARM default true.

> 
> I don't have a good suggestion for the name, but it's not really about
> MMIO space; it's about address space generally.

What about trap-unmapped-access ?

Cheers,
Edgar


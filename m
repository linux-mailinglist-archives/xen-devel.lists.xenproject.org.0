Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C04B1C724
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 15:56:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071795.1435163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujedM-00021M-IW; Wed, 06 Aug 2025 13:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071795.1435163; Wed, 06 Aug 2025 13:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujedM-0001zd-Fv; Wed, 06 Aug 2025 13:56:48 +0000
Received: by outflank-mailman (input) for mailman id 1071795;
 Wed, 06 Aug 2025 13:56:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kasG=2S=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujedK-0001zV-JS
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 13:56:46 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fc00015-72cd-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 15:56:44 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-458aee6e86aso35285325e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 06:56:44 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-459e0e70218sm80632385e9.20.2025.08.06.06.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 06:56:43 -0700 (PDT)
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
X-Inumbo-ID: 2fc00015-72cd-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754488604; x=1755093404; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xFTD8TgIADwi7DDpB1nVo2XT7ARgAr6lzDswfkrD8jY=;
        b=eMKkprM071vpNpnRP8x25RaYhrmZDquDSGLgE5xdEiF8w6p5tbvl11gLnI+gDIUJqS
         78PYuTqFJyn8UphHuv2IC52UtDi6HUPepqkuI/o2Dqc6Lxxvb/cBPkaXCmdArzkcuS4c
         16kGEi8fD3bkQ2QE4z2n5rdwhooCu9RQ2J1i4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754488604; x=1755093404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFTD8TgIADwi7DDpB1nVo2XT7ARgAr6lzDswfkrD8jY=;
        b=LaeIbRpbobl/YZ3Y6oqXYxgId6P3yiXlBjnd3Sf/S+8aaXXmMOFMJlKPz0QAf7ziuN
         weDewGFF6l4m8RbTiMUETaJ5UjPvkxQpY0Kj6ivdDBelUN1sCOGxnYWacVoDC47s8Vs9
         hbnTlI5HtVzKFiQQRYu68W6bi74JN/f+vC9SlizyOshQ6xOmzb7eUQQiW/v6ay05eKN2
         eiOvtTMLIEDmqri9YnYvs//mf1zTwtQBf80jL2UFOAz1/140FwS4V1yzpWgQPo8GVazC
         8NOz/3xl1Y8bj4XzTIZtdxJD9aMolGNH74rJgWoKaESaCiYhiczkQZK2Www2s+lUGNJZ
         AahQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ8NyszRC0kwPyYsGXbPb5zKQpK69gG7dxwxckH7F+YxPm2u1xFqh6KHieP87kLqTqUHhrxlc/4k8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzbWYTGoZqJNYb20ApCPaPTYS3SQwUIWVLr73bpaNidkhXCnzHH
	vM0uYCesZnxS/86cDPc9ZbnGEzSzInrcOCsoCH7ZGF0CSszfpnSwp6gGZDHE6fFf8ts=
X-Gm-Gg: ASbGncu/n6qmskOBVNTDEzsKfpPJ43m2kSA3WJjPUAb264gxhf65zOFgoSFO+ScobQY
	pxwDhRIEuPiDj6XW2bj4Op90XaJ+2H3gw5s4PFtkNyz5lfEokSGfE/2ak7M3MtzCbFpL+feGvnV
	R98UczR0dLusKHlBMljRWZ2XHvHdVBFZHC67wh0k88zywSkJg3IIDuxDljJ6UQCbXM/4NCh/4LK
	BpeCWFa705wqboI7Zsi/xCTBbvFhT6aWuMa1Rv6AAItPodm8IbYPN4fmSEotQqriOTgYG4xRb6A
	79tHlxCBLfhRs/BcPhJHF+ePUoCARLtbIcvNgCeKKmcia6msiMrcrRoDvgVeNhlOOfANL7nYEKK
	wZLSVz6u5+WvpatLHPIT83Ya9Tu3X+Dw5nlwHq6710cm6BURW+7do5fWkCtPyMOL+3Q==
X-Google-Smtp-Source: AGHT+IHdpdqneunPfLIqYLQWW5SvkVqgoJEp4OOAYoj2hZ9yRC0K5x43/tcFiFBl86RpUYjd19NmUQ==
X-Received: by 2002:a05:600c:35cf:b0:455:f380:32e2 with SMTP id 5b1f17b1804b1-459e70eeb46mr29821165e9.18.1754488604026;
        Wed, 06 Aug 2025 06:56:44 -0700 (PDT)
Date: Wed, 6 Aug 2025 15:56:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmkhn@proton.me
Cc: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
	sstabellini@kernel.org, oleksii.kurochko@gmail.com,
	dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 1/8] xen/domain: introduce common emulation flags
Message-ID: <aJNfGqiTDH991_8L@macbook.local>
References: <20250731192130.3948419-1-dmukhin@ford.com>
 <20250731192130.3948419-2-dmukhin@ford.com>
 <f2be5a00-63e6-489d-a26a-7d48d6ae41ad@suse.com>
 <aJFWQByvktADgYKu@kraken>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aJFWQByvktADgYKu@kraken>

On Tue, Aug 05, 2025 at 12:54:31AM +0000, dmkhn@proton.me wrote:
> + Cc: Oleskii
> 
> On Mon, Aug 04, 2025 at 11:46:36AM +0200, Jan Beulich wrote:
> > On 31.07.2025 21:21, dmkhn@proton.me wrote:
> > > --- a/xen/include/xen/sched.h
> > > +++ b/xen/include/xen/sched.h
> > > @@ -652,6 +652,8 @@ struct domain
> > >      unsigned int *llc_colors;
> > >  #endif
> > >
> > > +    uint32_t emulation_flags;
> > 
> > Just one further remark: The field probably never should have been of this
> > type; unsigned int will do, and imo will want switching to while the field
> > is being moved. (Before giving an x86 ack, I want to convince myself though
> > that this is moving us in the right direction.)
> 
> Hi Jan,
> 
> I can definitely use different mechanism for virt ns16550: add a new field in
> xen_arch_domainconfig. That will also simplify some of the emulation_flags
> checks on x86 and will be more flexible wrt emulator configuration (e.g. I can
> allow passing I/O ports ranges).

For the time being, I would leave emulation_flags in
xen_arch_domainconfig.  The set of emulated devices is
architecture-specific, and pulling it to the generic struct is IMO not
specially helpful, as you then have the definition of the flags
decoupled from the field definition.

For the emulated UART, I don't think you need a new field in
xen_arch_domainconfig, just a new bit in emulation_flags? IOW:

#define _XEN_X86_EMU_VUART          11
#define XEN_X86_EMU_VUART           (1U << _XEN_X86_EMU_VUART)

Thanks, Roger.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D80378B98D6
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 12:31:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715744.1117612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2TiZ-0005HB-2r; Thu, 02 May 2024 10:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715744.1117612; Thu, 02 May 2024 10:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2TiY-0005EV-Ve; Thu, 02 May 2024 10:31:10 +0000
Received: by outflank-mailman (input) for mailman id 715744;
 Thu, 02 May 2024 10:31:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BPCJ=MF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s2TiX-0004oh-He
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 10:31:09 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16bea8d7-086f-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 12:31:08 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41b79451153so46368485e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 03:31:08 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 g20-20020a05600c311400b0041bf685921dsm1493208wmo.0.2024.05.02.03.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 03:31:07 -0700 (PDT)
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
X-Inumbo-ID: 16bea8d7-086f-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714645868; x=1715250668; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PytkBrjX316DhoxmSp+I/eclZGVor1QD1/Gxdd7FvgQ=;
        b=mfajLPCWwS2XYJgngGL1ecXeVuNuspSzQypGNc2Aw4nyc/Ytvpncz+OUiyBfkWflNG
         4Sr9Up/squVzN4TCyR3eRw2DwtTJdedXwLyrd8FGVy8RYQES2byjwVm3dgAAcLEpp7ck
         p4DutpYvyidWM3Ky18PNs4jzHhuI/wJluZLdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714645868; x=1715250668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PytkBrjX316DhoxmSp+I/eclZGVor1QD1/Gxdd7FvgQ=;
        b=r6uVGgk/M9P88wnOTPPm99c26R/IGS3itaCeC+0x+PuPhkiDVPGBsDUzkI0zRZz73p
         ksqyUfGGx8BZxkheP1ej5Kq9o2VfGFS/zxTU3LojCZfLyamDASh5RZ81ILKqKO8IsnhZ
         kmO2jUC47N/6smNLoaGxu+ypvQonxFRkSa5EaCTnHJDuh2VB+XBEXhI7NYGgjZXkg0LA
         qPaJw5JQQRHOVoI7HQ8GQ1rrPMEOfz/bSEjScIr90aJ3rJN5YMaj8xm/Uo2W9tQB++ai
         MITboiZJY0dyjUuqrkKGOdImws/56JxTWwPwnwsVfA2sBmgEkCsKmrO8SVWXEevIRlLX
         6q+g==
X-Gm-Message-State: AOJu0YyLEYMyGJnJVBSrWL/nOaFstPPZnkxq6CEOuO1VmI6IA7ro9nC9
	gE3i4y5+prfeTuoI93Em7rKYhWJOOQep/jG/2rHxjMsU/BGByWNGR48B9fYRfF/zm1iIBLzXL1a
	m
X-Google-Smtp-Source: AGHT+IFlmX7BTc8Hlvkj5v7xK3CbyvqjB32tqVPMFhKg33ITQlw3w6KaUa0XYR7YLOB8zR4+L8etOw==
X-Received: by 2002:a05:600c:358f:b0:41c:2992:a3bd with SMTP id p15-20020a05600c358f00b0041c2992a3bdmr3798812wmq.27.1714645868149;
        Thu, 02 May 2024 03:31:08 -0700 (PDT)
Date: Thu, 2 May 2024 12:31:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH for-4.19] ppc/riscv: fix arch_acquire_resource_check()
Message-ID: <ZjNraq889KamBWfE@macbook>
References: <20240430153423.80875-1-roger.pau@citrix.com>
 <2cabc6a1448c6f18cab963bc463347f088d643dd.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2cabc6a1448c6f18cab963bc463347f088d643dd.camel@gmail.com>

On Thu, May 02, 2024 at 10:46:12AM +0200, Oleksii wrote:
> On Tue, 2024-04-30 at 17:34 +0200, Roger Pau Monne wrote:
> > None of the implementations support set_foreign_p2m_entry() yet,
> > neither they
> > have a p2m walk in domain_relinquish_resources() in order to remove
> > the foreign
> > mappings from the p2m and thus drop the extra refcounts.
> > 
> > Adjust the arch helpers to return false and introduce a comment that
> > clearly
> > states it is not only taking extra refcounts that's needed, but also
> > dropping
> > them on domain teardown.
> I am okay with such adjustment for now as it is more safe and nothing
> will be missed during implementation of p2m, but I am curious how then
> Arm handles that, their implementation is also just returns true. ( I
> planned to have p2m implementation similar to Arm )

Arm does have an implementation of set_foreign_p2m_entry() and
domain_relinquish_resources() that handle foreign mappings correctly.

> 
> Anyway, based on that it safer for RISC-V:
> Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks, Roger.


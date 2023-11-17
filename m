Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A3F7EEFED
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 11:18:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635033.990737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3vv6-0003vN-BD; Fri, 17 Nov 2023 10:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635033.990737; Fri, 17 Nov 2023 10:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3vv6-0003tV-76; Fri, 17 Nov 2023 10:17:52 +0000
Received: by outflank-mailman (input) for mailman id 635033;
 Fri, 17 Nov 2023 10:17:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1e97=G6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r3vv4-0003aG-6j
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 10:17:50 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ea24bbc-8532-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 11:17:48 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5094727fa67so2568151e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 02:17:48 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c4f4800b004083bc9ac90sm2200097wmq.24.2023.11.17.02.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 02:17:47 -0800 (PST)
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
X-Inumbo-ID: 8ea24bbc-8532-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700216268; x=1700821068; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=loXZqCZDmQ7tctq/Y997gxvqbChXA3qRMNqwb52e5U8=;
        b=Q19OA0dxsIiAiB/yq3A+ehLEZNT48nzgVHegleMhRGdn6I3AeJdcUYAuOB3sK2T7FP
         IqbHV1dnQtB6xQ8/v8d22p2W9Wf08NimWyaBnpF+jCPPTovE+QltuCrIcXLpm8FwHn0w
         Xl/GvqdcJjoURGvKht+6ckLwDqoDnGvGHoLHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700216268; x=1700821068;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=loXZqCZDmQ7tctq/Y997gxvqbChXA3qRMNqwb52e5U8=;
        b=esk1mzc4HAHZ1DKV9/KQx3bWv4yFRXzFNY+bk3UAcxWXN5zWqdCGqCdJGiXzQQk5Pu
         7YEhlLOH4FmcEC8Hu/Mbhi2KLE8WGXoDFU46I7buFlLGZ9Pj9whKCLHNvot9MFsxqtWf
         xTbQdZyuhU3JsqdN2z/4g8fQC1j2W9/tyEAFM+GjfKmVyhaweE3poV30wPlD63CeNseL
         3dx7XI5pI/2hytu6l9C79K71BbD5H4KkimeEO0sImJaWcXnhmWtHH3wmAKvVCg3abo3/
         CqofQVof8BxyZZphcSCfagKOslZ0rLRSfLDxhR6F1LBRILWsGRrSedNWHnMq56Dxu7Yr
         oCRg==
X-Gm-Message-State: AOJu0YyV8BxcMPXNJx8i7MKjRPgFO5IiDNHo6fsoCV/n1lAxcAyDplSe
	t3ku8r6kGd0M4wdu3TcMRSBzmg==
X-Google-Smtp-Source: AGHT+IEbr8434/vDbB0YPkN7kEQHhrSbvzO1Y8k461p9hfxyGi7h3f4YDNOiO/oF7N7xwgL9lft7ow==
X-Received: by 2002:a05:6512:104c:b0:50a:756d:40fd with SMTP id c12-20020a056512104c00b0050a756d40fdmr4306611lfb.11.1700216267798;
        Fri, 17 Nov 2023 02:17:47 -0800 (PST)
Date: Fri, 17 Nov 2023 11:17:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: James Dingwall <james@dingwall.me.uk>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	James Dingwall <james-xen@dingwall.me.uk>,
	xen-devel@lists.xenproject.org
Subject: Re: xen 4.15.5: msr_relaxed required for MSR 0x1a2
Message-ID: <ZVc9yq9b6fezMWcY@macbook.local>
References: <ZVZAO/W0m/h+IPbi@dingwall.me.uk>
 <aa13be5e-d90c-4074-a16c-d3b051da754d@citrix.com>
 <ZVcv7259slJF4wBh@dingwall.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZVcv7259slJF4wBh@dingwall.me.uk>

On Fri, Nov 17, 2023 at 09:18:39AM +0000, James Dingwall wrote:
> On Thu, Nov 16, 2023 at 04:32:47PM +0000, Andrew Cooper wrote:
> > On 16/11/2023 4:15 pm, James Dingwall wrote:
> > > Hi,
> > >
> > > Per the msr_relaxed documentation:
> > >
> > >    "If using this option is necessary to fix an issue, please report a bug."
> > >
> > > After recently upgrading an environment from Xen 4.14.5 to Xen 4.15.5 we
> > > started experiencing a BSOD at boot with one of our Windows guests.  We found
> > > that enabling `msr_relaxed = 1` in the guest configuration has resolved the
> > > problem.  With a debug build of Xen and `hvm_debug=2048` on the command line
> > > the following messages were caught as the BSOD happened:
> > >
> > > (XEN) [HVM:11.0] <vmx_msr_read_intercept> ecx=0x1a2
> > > (XEN) vmx.c:3298:d11v0 RDMSR 0x000001a2 unimplemented
> > > (XEN) d11v0 VIRIDIAN CRASH: 1e ffffffffc0000096 fffff80b8de81eb5 0 0
> > >
> > > I found that MSR 0x1a2 is MSR_TEMPERATURE_TARGET and from that this patch
> > > series from last month:
> > >
> > > https://patchwork.kernel.org/project/xen-devel/list/?series=796550
> > >
> > > Picking out just a small part of that fixes the problem for us. Although the
> > > the patch is against 4.15.5 I think it would be relevant to more recent
> > > releases too.
> > 
> > Which version of Windows, and what hardware?
> > 
> > The Viridian Crash isn't about the RDMSR itself - it's presumably
> > collateral damage shortly thereafter.
> > 
> > Does filling in 0 for that MSR also resolve the issue?  It's model
> > specific and we absolutely cannot pass it through from real hardware
> > like that.
> > 
> 
> Hi Andrew,
> 
> Thanks for your response.  The guest is running Windows 10 and the crash
> happens in a proprietary hardware driver.

When you say proprietary you mean a custom driver made for your
use-case, or is this some vendor driver widely available?

Thanks, Roger.


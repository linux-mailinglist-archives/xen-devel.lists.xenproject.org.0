Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B40327DB5C8
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 10:07:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.624996.973802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxOEm-0006ym-N0; Mon, 30 Oct 2023 09:07:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624996.973802; Mon, 30 Oct 2023 09:07:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxOEm-0006wQ-KO; Mon, 30 Oct 2023 09:07:08 +0000
Received: by outflank-mailman (input) for mailman id 624996;
 Mon, 30 Oct 2023 09:07:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3VkP=GM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qxOEk-0006wK-KP
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 09:07:06 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b193c07f-7703-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 10:07:04 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-408002b5b9fso30893225e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Oct 2023 02:07:04 -0700 (PDT)
Received: from localhost ([213.195.118.109]) by smtp.gmail.com with ESMTPSA id
 g12-20020a05600c310c00b004068e09a70bsm8676984wmo.31.2023.10.30.02.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 02:07:03 -0700 (PDT)
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
X-Inumbo-ID: b193c07f-7703-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698656824; x=1699261624; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ad+HV3FtCgbWljPIOnt+yLczS1BYmPVE7tR5BX9B+eY=;
        b=cQh1DRam0MFIGG2/bf2nK1v3ZYrtahwdfxDbwktC2O+4m6gOjFwPMOC7egXSU1TX0r
         mwCTDaptzI6OGvl1y0zuqeGmYCWt5l68k4Ub5lPEoD6aV+knloGK+o45Jba54mczZhJn
         dUARA+Vh8NQkXfM6syH5/UpeuM+tiyWpGbu+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698656824; x=1699261624;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ad+HV3FtCgbWljPIOnt+yLczS1BYmPVE7tR5BX9B+eY=;
        b=lAhuUqpYoYgIcYNckJfXWs8MEed2UDV8pNWR7JUxA46by5KHuQexiYusIByuRRpn3/
         geBlKSHNR5JuSX/CjkXUu1ZkgVCLPgXyCKZgcXxyzsPPE6UbpmiSnzlD3dI4xLqxnSP+
         pklSFSc1Ex52E7QAesNHjTY4dOjYEpYOhszXGFMDO7R+c1CBp0JbNha2T34GdfBznnYL
         M0OhnceJXrz+flED/1JFPyaoKVI/V77oAwpneEkWsN0ur5HeHW+qYU/1qyINFjKHcKpL
         +QNW0khmqmjpNfu0Y2FwpXXY2Zjx2vQpEWYb7U8ibJmyOe1gOSMbU7kN6UJADTMVu0Hp
         HbYw==
X-Gm-Message-State: AOJu0YycQ7P7EagXZpxPXm24Lc7zPXmmvREYmTZIQFiBPydLWQJAAaT/
	7TE/r7zlO6VJgxAaldjjSD2QAw==
X-Google-Smtp-Source: AGHT+IHrOuG5qYldbexv+tLazIKmt1ZHbRlKkwYtmoUSwLWTfNxBG9QF4OP9CnW5ek70ia8e2oqc7A==
X-Received: by 2002:a05:600c:1913:b0:409:351:873d with SMTP id j19-20020a05600c191300b004090351873dmr8162640wmq.31.1698656823892;
        Mon, 30 Oct 2023 02:07:03 -0700 (PDT)
Date: Mon, 30 Oct 2023 10:07:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/2] x86/Kconfig: Introduce CONFIG_{AMD,INTEL} and
 conditionalise ucode
Message-ID: <ZT9yNrdoCKZs3_uY@macbook>
References: <20231026205539.3261811-1-andrew.cooper3@citrix.com>
 <20231026205539.3261811-3-andrew.cooper3@citrix.com>
 <70472259-6429-e60f-7cdc-faa50b2d257f@suse.com>
 <ZTu_WxdWTrthCs4m@macbook>
 <997218cb-b1d3-4fa8-a098-10849a54c592@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <997218cb-b1d3-4fa8-a098-10849a54c592@citrix.com>

On Fri, Oct 27, 2023 at 08:18:18PM +0100, Andrew Cooper wrote:
> On 27/10/2023 2:47 pm, Roger Pau Monné wrote:
> > On Fri, Oct 27, 2023 at 09:12:40AM +0200, Jan Beulich wrote:
> >> On 26.10.2023 22:55, Andrew Cooper wrote:
> >>> We eventually want to be able to build a stripped down Xen for a single
> >>> platform.  Make a start with CONFIG_{AMD,INTEL} (hidden behind EXPERT, but
> >>> available to randconfig), and adjust the microcode logic.
> >>>
> >>> No practical change.
> >>>
> >>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>> ---
> >>> CC: Jan Beulich <JBeulich@suse.com>
> >>> CC: Roger Pau Monné <roger.pau@citrix.com>
> >>> CC: Wei Liu <wl@xen.org>
> >>> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> >>> CC: Stefano Stabellini <stefano.stabellini@amd.com>
> >>> CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> >>>
> >>> I've intentionally ignored the other vendors for now.  They can be put into
> >>> Kconfig by whomever figures out the actual dependencies between their init
> >>> routines.
> >>>
> >>> v2:
> >>>  * Tweak text
> >> What about the indentation issues mentioned in reply to v1?
> >>
> >> As to using un-amended AMD and INTEL - Roger, what's your view here?
> > I think it would be good to add a suffix, like we do for
> > {AMD,INTEL}_IOMMU options, and reserve the plain AMD and INTEL options
> > as platform/system level options that enable both VENDOR_{CPU,IOMMU}
> > sub options.
> >
> > So yes, {INTEL,AMD}_CPU seems a good option.
> 
> Really?  You do realise that, unlike the IOMMU names, this is going to
> be plastered all over the Makefiles and header files?

What's it different from using INTEL_CPU than just plain INTEL?  It's
still going to be plastered all over the Makefiles and header files.

> And it breaks the careful attempt not to use the ambigous term when
> describing what the symbol means.
> 
> I'll send out a v2.5 so you can see it in context, but I'm going to say
> straight up - I think this is a mistake.

My point is that we might want to reserve the top level names (iow:
CONFIG_INTEL, CONFIG_AMD, CONFIG_{VENDOR}) for system wide options
that enable both the CPU and the IOMMU code needed for the selected
vendor.

I'm happy to use a name different than {INTEL,AMD}_CPU for the vendor
CPU/platform code.

Alternatively, I would be fine to use CONFIG_{INTEL,AMD} as long as
the existing CONFIG_{AMD,INTEL}_IOMMU Kconfig options are made
dependent on the newly introduced CONFIG_{INTEL,AMD} options, so when
disabling CONFIG_AMD CONFIG_AMD_IOMMU also gets disabled.

Maybe that's already the intention of the suggested CONFIG_{AMD,INTEL}
and I'm missing the point.

Thanks, Roger.


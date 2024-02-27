Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5467F868AA4
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 09:16:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685899.1067344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rescf-00089g-CO; Tue, 27 Feb 2024 08:15:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685899.1067344; Tue, 27 Feb 2024 08:15:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rescf-00086V-8c; Tue, 27 Feb 2024 08:15:33 +0000
Received: by outflank-mailman (input) for mailman id 685899;
 Tue, 27 Feb 2024 08:15:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7gEZ=KE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rescd-00086P-J9
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 08:15:31 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e267ab4-d548-11ee-afd6-a90da7624cb6;
 Tue, 27 Feb 2024 09:15:29 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-412a3903586so14957975e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 00:15:29 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 i13-20020adfe48d000000b0033ae7d768b2sm10503193wrm.117.2024.02.27.00.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 00:15:28 -0800 (PST)
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
X-Inumbo-ID: 5e267ab4-d548-11ee-afd6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709021729; x=1709626529; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f1Lu3qJeQL0CxcRwHeBftGmjM7NsyeZOURl2FrMqWrk=;
        b=rUnh+wUiQvlw9uJvI8paqqb8qt1vV4F/DsEtzn07+EGh+Bmvu65ARkbviaPR+3im4n
         oYcEpDttNZO7Eb5RMEHJbTL3PNVLk62wSehgl4CRgSG2e7rcsl70YBxzv6LzXP2kkdL2
         IaEFuNyQ6b27FfwzTYrrrT4+7/hKh6X+Ey/AI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709021729; x=1709626529;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f1Lu3qJeQL0CxcRwHeBftGmjM7NsyeZOURl2FrMqWrk=;
        b=gYg2tIQCYD2L/VUyGGZcKjxvNq6eKjn7kkVu9ekbZ6jf8mqKNVu2W4uH69ElVTiOFo
         FjZt+FnaqrKtIye8MNsAEDY3bKo5F/B8lAQpa6brr3FSyFu0bHIGcuPJYt8E233rBmIA
         Mrq5ijYJ6JJ9eMEnSKAz5t8GUYD+hWh0QhaU25IM9FE4XzdD072nSTfvUNt/fCGykjC9
         6Uxw3ryN6w0raNVLOIzlHu7R1iTwJ81zQLmfSVVPyvW/UUs/vlrBuhp/Md+8ixog07XI
         eKsh2LMOT52WTyjplIvZ/xhwWWQJCNHkrSP+VwBmY9WlJ4f+I/IFOe7YEzVFnz1q2i+I
         KrOg==
X-Forwarded-Encrypted: i=1; AJvYcCVNRK/kkffddy519BBYBIFD7cT7qvF2NEkelceRgq8QVJ4H52ffO138ms2aG8oBrtWphM2QENeWISQzTPzD7S0FvtzU3yc/1ksBc5sjUjY=
X-Gm-Message-State: AOJu0YxnLoXlRxJAei8Y+yCTjsGBjKBJ+LrCfXa0MeTK3Tc6cKKGMzuV
	YMU+HZByb6lwo1ArQOSXHYqy19iZe7mzUiVgFbOGcyJWlkxRLeuOSLfL/M+KkOA=
X-Google-Smtp-Source: AGHT+IHGbHjJ6KGAWio/eOr5jbHB7oxw6OfECvx/T5iqVMSzrmqlk/zZINYpuIbt5bavRPXUb+uKKw==
X-Received: by 2002:a05:600c:1c8d:b0:412:afa6:cf3a with SMTP id k13-20020a05600c1c8d00b00412afa6cf3amr149487wms.32.1709021728807;
        Tue, 27 Feb 2024 00:15:28 -0800 (PST)
Date: Tue, 27 Feb 2024 09:15:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 3/3] xen/livepatch: align functions to ensure minimal
 distance between entry points
Message-ID: <Zd2aH_1yNe8XzlKx@macbook>
References: <20240207145547.89689-1-roger.pau@citrix.com>
 <20240207145547.89689-4-roger.pau@citrix.com>
 <670e4a5e-4eec-4a2c-9ed1-fcc164b1d76c@suse.com>
 <Zdx26DwTvcB2zcbw@macbook>
 <116a9e07-4a6a-4170-bf0f-3a7ccbd68f0e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <116a9e07-4a6a-4170-bf0f-3a7ccbd68f0e@suse.com>

On Mon, Feb 26, 2024 at 01:36:32PM +0100, Jan Beulich wrote:
> On 26.02.2024 12:32, Roger Pau Monné wrote:
> > On Tue, Feb 13, 2024 at 04:58:38PM +0100, Jan Beulich wrote:
> >> On 07.02.2024 15:55, Roger Pau Monne wrote:
> >>> The minimal function size requirements for an x86 livepatch are either 5 bytes
> >>> (for jmp) or 9 bytes (for endbr + jmp), and always 4 bytes on Arm.  Ensure that
> >>> distance between functions entry points is always at least of the minimal
> >>> required size for livepatch instruction replacement to be successful.
> >>>
> >>> Add an additional align directive to the linker scripts, in order to ensure that
> >>> the next section placed after the .text.* (per-function sections) is also
> >>> aligned to the required boundary, so that the distance of the last function
> >>> entry point with the next symbol is also of minimal size.
> >>
> >> Perhaps "... minimal required size"?
> > 
> > Yes.
> > 
> >>> --- a/xen/common/Kconfig
> >>> +++ b/xen/common/Kconfig
> >>> @@ -395,8 +395,11 @@ config CRYPTO
> >>>  config LIVEPATCH
> >>>  	bool "Live patching support"
> >>>  	default X86
> >>> -	depends on "$(XEN_HAS_BUILD_ID)" = "y"
> >>> +	depends on "$(XEN_HAS_BUILD_ID)" = "y" && CC_HAS_FUNCTION_ALIGNMENT
> >>>  	select CC_SPLIT_SECTIONS
> >>> +	select FUNCTION_ALIGNMENT_16B if XEN_IBT
> >>> +	select FUNCTION_ALIGNMENT_8B  if X86
> >>> +	select FUNCTION_ALIGNMENT_4B  if ARM
> >>
> >> This isn't strictly needed, is it? Would be nice to avoid re-selection
> >> of what the default for an arch is anyway, as otherwise this will start
> >> looking clumsy when a couple more architectures are added.
> > 
> > My worry was that the default per-arch could change, ie: for example
> > x86 moving from 16 to 8 and then it would hamper livepatch support if
> > IBT is also enabled.  I however think it's very unlikely to reduce the
> > default alignment, and in any case we would hit a build time assert if
> > that ever happens.
> > 
> > So yes, I'm fine with dropping those.
> 
> Oh, no - not "those", only "that", i.e. only the last (Arm) one.

Oh, I see what you mean, even x86 selects the default one when IBT is
enabled, and when not the requirement for livepatch is < than the
default anyway.  That's why I said that we could even drop all of them
and just rely on the build time assert to catch any changes here.

Feel free to drop the ARM one.

Thanks, Roger.


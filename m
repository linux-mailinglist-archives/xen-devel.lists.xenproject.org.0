Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A254ABF2EC
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 13:35:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991706.1375529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHhit-0007K9-9R; Wed, 21 May 2025 11:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991706.1375529; Wed, 21 May 2025 11:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHhit-0007I5-5u; Wed, 21 May 2025 11:34:59 +0000
Received: by outflank-mailman (input) for mailman id 991706;
 Wed, 21 May 2025 11:34:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Cb8=YF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uHhir-0007Hy-Ex
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 11:34:57 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cddf3f6-3637-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 13:34:53 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-442e9c00bf4so49021555e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 04:34:53 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-447f3dd94f1sm68659685e9.35.2025.05.21.04.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 04:34:52 -0700 (PDT)
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
X-Inumbo-ID: 9cddf3f6-3637-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747827293; x=1748432093; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B8zw2/iRLiGc176aMf+E2U4+GHTz3No35Bxuo2nAC/Q=;
        b=TzoS/ITF5wOtdUe2z/D6ErjzlF6dfYB+Aqd+/0T+LNDtksv3f19ZwYUv7OABIh7TpM
         dNbanHqZeWa8L6ouquYR4sMw/wRDoS7PTwvVDCDxBoM7jXccgB3Ap5xgV7HtS1/3LY9p
         v4dfhdStZkf8QRny9gwDVf2/eYEVjozdYv5r0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747827293; x=1748432093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8zw2/iRLiGc176aMf+E2U4+GHTz3No35Bxuo2nAC/Q=;
        b=A77yuY8TegQmW8YyzZcIk3riwQ3o0fmsssm1513j1L6ICB8GIsDfRArEgmxwqqUN7C
         DnULftolsj6Pps+SRkkQjd795ECAlsEAzWRHt+H8Lc8+vg9EDZShJZ/IjnH2c03O2/aD
         Zekkq/PkEOjHXde5FHHr7Y+ytgoUyLog+TyWW3VXLm9SH0Sg6/jKBqQGFAvpK13W5vBN
         qRuj9+SOiZ5xLUo76t6duCDapXgPKWEBPVnVWpcr5kY7LM5Heaqc5Gzvp2GL2ohk59Tz
         17xFLmPfrY2+3wL88FGTVdNMf1wjlhjynq8V4nGIPfhbbscTwZFormCTwbLC9QSVNFRg
         jHTw==
X-Forwarded-Encrypted: i=1; AJvYcCVhbU6IhXsqRZ1x3/q5tbV3e69x1tTeqQTsk5AgUYhbooq49T+rIl3c8fjYD7YiXFNx94mRwCyYZ/g=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxxs7kr/+kcJd91KO+seucEseSFc59Pr6HlmMzP3Omal6bvsyM3
	yYY20w+XR4JI+DxmlxxtiIeM/EWFAARnx9D4lY6aNO4oaqMRdOGsYs5OsSesLP2UmHE=
X-Gm-Gg: ASbGncvAUnfdfWihdT2zClvmYG67a64Bern+ITXh3Vr9GY1puh+ViYpEHdC2qjh1MD9
	XYARK2n2MX/nj1hroBge51khqCK3MDNWqM9sct0reqWFtx/9m7qT0MeuBxJqbtEJYZZS0X9zWht
	p2dcRezhZB5kCqmZmVncSUzPnmlndb198MeAchhmD5I0ZWpbqOX0KLqUydou7EZ0D8Qdm1dQ3z0
	ZMH06kR/oc31IjrDBarBTVM+NIx/dem5DRNSqcr1y1kQ460ahGxHfh+z1qUb4Ue8ffM1z8Aj1NW
	opSSBo3b/jR8IREO8KYl8/+0786jdzF3CU+QoT6H+QSNTbv2+SUq5LPgewHt/2m83BACXTEuwLs
	IdflaArMNIrK/dLWDsQAXQoZVcqdYRAmc1Vk=
X-Google-Smtp-Source: AGHT+IFuRtcERcTaJWOFlLWs5QjgFwFfLKWawWPEj75ZK05Bbk12hPOobOBIfIS0kvE2Ukg5yVDBtw==
X-Received: by 2002:a05:600c:1c16:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-442ff029e12mr157066065e9.23.1747827292683;
        Wed, 21 May 2025 04:34:52 -0700 (PDT)
Date: Wed, 21 May 2025 13:34:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Victor M Lira <victorm.lira@amd.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/vpci: fix handling of BAR overlaps with non-hole
 regions
Message-ID: <aC26W4Brxl-laNif@macbook.local>
References: <20250516083159.61945-1-roger.pau@citrix.com>
 <7bbc1569-672e-42a7-a5b8-4187282fcb18@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7bbc1569-672e-42a7-a5b8-4187282fcb18@suse.com>

On Wed, May 21, 2025 at 10:29:26AM +0200, Jan Beulich wrote:
> On 16.05.2025 10:31, Roger Pau Monne wrote:
> > For once the message printed when a BAR overlaps with a non-hole regions is
> > not accurate on x86.  While the BAR won't be mapped by the vPCI logic, it
> > is quite likely overlapping with a reserved region in the memory map, and
> > already mapped as by default all reserved regions are identity mapped in
> > the p2m.  Fix the message so it just warns about the overlap, without
> > mentioning that the BAR won't be mapped, as this has caused confusion in
> > the past.
> 
> I was trying to get back to this, but my attempt to use this "fixed
> message" as an anchor failed: You don't modify any existing message, and
> hence I was unable to determine which other message you refer to here.
> None of the ones I looked at appear to fit this description.

OK, it's a bit tricky.  Note how the new implementation of
pci_check_bar() unconditionally returns true, which means the message
in modify_bars() will never be printed on x86.  Instead a slightly
different warning message is printed in the x86 implementation of
pci_check_bar().

That's what the above paragraph attempts to explain.

Maybe I need to adjust the last sentence so it's:

"Avoiding printing the warning message in modify_bars(), and instead
print a more lax message in the x86 implementation of pci_check_bar()
to note the current BAR position overlaps with non-hole region(s)."

Does the above make it a bit clearer?

Thanks, Roger.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4896FF004
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 12:38:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533222.829683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px3gr-0005QV-Ib; Thu, 11 May 2023 10:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533222.829683; Thu, 11 May 2023 10:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px3gr-0005O2-FP; Thu, 11 May 2023 10:38:29 +0000
Received: by outflank-mailman (input) for mailman id 533222;
 Thu, 11 May 2023 10:38:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lTi/=BA=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1px3gq-0005Nw-M3
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 10:38:28 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6b911f1-efe7-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 12:38:27 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f423ac6e2dso34891405e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 May 2023 03:38:27 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n18-20020adfe792000000b002f7780eee10sm20108858wrm.59.2023.05.11.03.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 03:38:26 -0700 (PDT)
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
X-Inumbo-ID: f6b911f1-efe7-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1683801507; x=1686393507;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrjW1m3eB5fn7SCWngoeCBr0XcCdI5ZWnuS9TYA8QYY=;
        b=gm+eCL3zxJFTpyYEo0x7GH1kwxxf54VYmD0QlaovBjO6wLjBN2hb0m+eVci99ntZ9B
         lWDVsMhzvoov7nojJTAwR/ZMb4LqpvZnnxNtmNuBd2Zl/JMgQiEAntbt5+Y8flE9qgQ5
         O0uLl7t3XCb0OumJx8fnIqcr4gkGbby+qGzFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683801507; x=1686393507;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZrjW1m3eB5fn7SCWngoeCBr0XcCdI5ZWnuS9TYA8QYY=;
        b=aJBSC7U4DEOHiK8ZFSkmZ+JeM9zFQ3XCWfoF5f6KeeyqWHrhLifFBdzY9MLT0R+1OA
         HaH+3Pw2YyZhAB3gbkbwFPO3Quo5vhvjcZff/OoutTPWoQ/t5Nmg8DKcpNY9aq+HGZSk
         AEKZGpxuWzF3vO/iia/+Ij6HlDKrPKX77tE4Vmy45QcH3fNeqQMy5HyPHUIHHsp1GkOg
         YBNm7YfjyGYopaexwG7FHosgIdTtuckFRAqGS3gXxY1dRC80+1gjPk13xTTqxNH8eN9N
         ZZ8+05v5JP1vUntcDZFUyGA1bCC3uGRUmRH1dOxNIv8SVnCxOnWZgBKSvDI5ktVJQBlB
         1viA==
X-Gm-Message-State: AC+VfDwVxqZ8m3OB3D6fONwwkCMPYy0jRO6L+8pwcvaSTg//+tVuG1S5
	pP4d7jtYoU1tZ7pepM7UwSzIrQ==
X-Google-Smtp-Source: ACHHUZ5ew7UZo5TK2EnyQopfReIYl4ZulUAxFsf0lwyatXUIW9HIy14LK5w9mKlh+Kh0ct7CGcphOw==
X-Received: by 2002:a7b:c84a:0:b0:3f4:241a:e651 with SMTP id c10-20020a7bc84a000000b003f4241ae651mr10115799wml.27.1683801507060;
        Thu, 11 May 2023 03:38:27 -0700 (PDT)
Message-ID: <645cc5a2.df0a0220.e9123.e022@mx.google.com>
X-Google-Original-Message-ID: <ZFzFnytU7LLCX1aF@EMEAENGAAD19049.>
Date: Thu, 11 May 2023 11:38:23 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/3] x86: Add AMD's CpuidUserDis bit definitions
References: <20230509164336.12523-1-alejandro.vallejo@cloud.com>
 <20230509164336.12523-2-alejandro.vallejo@cloud.com>
 <8995344d-cd14-d66b-efb6-e4ac7be6d457@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8995344d-cd14-d66b-efb6-e4ac7be6d457@suse.com>

On Thu, May 11, 2023 at 11:41:13AM +0200, Jan Beulich wrote:
> On 09.05.2023 18:43, Alejandro Vallejo wrote:
> > --- a/xen/include/public/arch-x86/cpufeatureset.h
> > +++ b/xen/include/public/arch-x86/cpufeatureset.h
> > @@ -287,6 +287,7 @@ XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
> >  /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
> >  XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */
> >  XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base (and limit too) */
> > +XEN_CPUFEATURE(CPUID_USER_DIS,     11*32+17) /*   CPUID disable for non-privileged software */
> 
> While I can accept your argument towards staying close to AMD's doc
> with the name, I'd really like to ask that the comment then be
> disambiguated: "non-privileged" is more likely mean CPL=3 than all
> of CPL>0. Since "not fully privileged" is getting a little long,
> maybe indeed say "CPL > 0 software"? [...]

Fair point. That was copied from AMD's PM, but there's no good reason to
keep it that way. I'll modify it as you pointed out.

> I would then offer you my R-b,
> if only I could find proof of the HWCR bit being bit 35. The PM
> mentions it only by name, and the PPRs I've checked all have it
> marked reserved.
> 
> Jan

It is in the Vol2 of the PM. Section 3.2.10 on the HWCR. I'm looking at
revision 4.06, from January 2023.

---
CpuidUserDis. Bit 35. Setting this bit to 1 causes #GP(0) when the CPUID
instruction is executed by non-privileged software (CPL > 0) outside SMM.
Support for the CPUID User Disable feature is indicated by CPUID
Fn80000021_EAX[CpuidUserDis]=1.
---

Alejandro


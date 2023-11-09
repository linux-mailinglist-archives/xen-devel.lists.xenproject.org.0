Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B04EC7E6DFC
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 16:48:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629730.982116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r17GL-0002hv-6j; Thu, 09 Nov 2023 15:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629730.982116; Thu, 09 Nov 2023 15:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r17GL-0002fU-3T; Thu, 09 Nov 2023 15:48:09 +0000
Received: by outflank-mailman (input) for mailman id 629730;
 Thu, 09 Nov 2023 15:48:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/VEo=GW=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r17GJ-0002co-0D
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 15:48:07 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ee86532-7f17-11ee-9b0e-b553b5be7939;
 Thu, 09 Nov 2023 16:48:04 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-507bd644a96so1404268e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Nov 2023 07:48:04 -0800 (PST)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c4f1300b0040772138bb7sm2489965wmq.2.2023.11.09.07.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 07:48:03 -0800 (PST)
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
X-Inumbo-ID: 5ee86532-7f17-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699544884; x=1700149684; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GdGoKsvszk1er7lcMQ58LvUTm+ralEqFHg2PA8LdxCE=;
        b=DrFVb5aoAboCBFLF8xjuCWm6A+dDf9evboa1vYsSuAc33/PxJijv75SV6sziEHDLte
         smNQUq7051lRVwf02HPY7kr2lu+p4nIJw4dI/2hHHwDjWk7dqVJ8JBz/GyKqZJoPP0S6
         RQ2qsj1yXLdSprD19ZcNtMPpxroADpQsxyvIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699544884; x=1700149684;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GdGoKsvszk1er7lcMQ58LvUTm+ralEqFHg2PA8LdxCE=;
        b=nsm6LX9BJQbvK7gbi1plbJDb/4jlsNnwOovzJCLNtGT5ZGLPQnJ6bkr67VTWAyY2JH
         5RzILOuEA2ZNvmFmbHzwgKOXCzJDQQU2KRuqXlJw9r3aQ47P7E1ZLJIZ28mLMbI4gKpo
         5OH3TWYejFymmP6eSIoO55EA2+P97nZZEbtBTM0Mz2dKBFNKefgbEB7WSHmWf5z7D2kj
         ftzxF56wKYUkt6V/yOMtmEnMxRkoLNOKaz/eLS7adMXtXK16xG+1YanKDP6y541g1cEj
         4nwYUBV+7uEXYeAWuisAJk1z6UcUzW3Rv0xNRF7f6qha6npxG+V5ZFObFKw420wsGzqB
         1vxQ==
X-Gm-Message-State: AOJu0YwN81J9+wrcWFVfF63W+GV96/y3XKNla8IzExYgiNnQQPIT4Yyw
	FevdUbYmEn+g9gtS+q57mPuhuQ==
X-Google-Smtp-Source: AGHT+IGKeiI8aPgI1sHfiMXh9ybACJTRaFcogZXVx7uNvt2A89SU0kS4Eh5CrBoMjh70Xw3+vJP0AQ==
X-Received: by 2002:a19:8c19:0:b0:4ff:9a75:211e with SMTP id o25-20020a198c19000000b004ff9a75211emr1692608lfd.42.1699544884364;
        Thu, 09 Nov 2023 07:48:04 -0800 (PST)
Message-ID: <654cff33.050a0220.d1942.a8f1@mx.google.com>
X-Google-Original-Message-ID: <ZUz/MJjh2b5QUTf1@EMEAENGAAD19049.>
Date: Thu, 9 Nov 2023 15:48:00 +0000
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Andrew Cooper <andcooper@tibco.com>
Cc: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org
Subject: Re: Support situation for nestedhvm
References: <ZUqVnfZTtjb/W5EN@mattapan.m5p.com>
 <93db0a9e-1d99-4953-9e3f-7ad69f0e78bf@tibco.com>
 <654cab6f.050a0220.86158.519b@mx.google.com>
 <cc2e0788-fd03-4c54-b84a-a9bdc2851ef4@tibco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc2e0788-fd03-4c54-b84a-a9bdc2851ef4@tibco.com>

On Thu, Nov 09, 2023 at 10:36:21AM +0000, Andrew Cooper wrote:
> On 09/11/2023 9:50 am, Alejandro Vallejo wrote:
> > Hi,
> >
> > On Tue, Nov 07, 2023 at 08:15:32PM +0000, Andrew Cooper wrote:
> >> On 07/11/2023 7:53 pm, Elliott Mitchell wrote:
> >>> I ran into the nestedhvm via the following path.  I was considering the
> >>> feasibility of shedding tasks from a desktop onto a server running Xen.
> >>> I was looking at `man xl.cfg` and noticed "nestedhvm".
> >>>
> >>> Since one of the tasks the computer handled was running other OSes in
> >>> fully simulated environments, this seemed to be something I was looking
> >>> for.  No where did I ever see anything hinting "This configuration option
> >>> is completely unsupported and risky to use".
> >> This one is explicitly covered in SUPPORT.md, and has had XSAs out
> >> against it in the past for being unexpectedly active when it oughtn't to
> >> have been.
> >>
> >>> Things simply started exploding without any warnings.
> >> Things also explode if you try to create a VM with 10x more RAM than you
> >> have, or if you try `./xenwatchdogd --help`, or `xl debug-keys c`, or
> >> many other things. 
> >>
> >> The xl manpage probably ought to state explicitly that the option is
> >> experimental, but that the extent of what I'd consider reasonable here.
> >>
> >> You can't solve educational matters with technical measures.
> >>
> >> ~Andrew
> >>
> > No, but we can prevent users unexpectedly shooting themselves in the foot.
> 
> ... and break OSSTest and XenRT while you're at it.
> 
> Like it or not, this knob is behaved in this way for 15 years.  You will
> be doing harm for no benefit by trying to change it.
Improving UX is a distinctively good benefit. A lot of people on this
mailing list may be aware of its quirks, but a user shouldn't need to be
that aware in order to set up a stable system.

> 
> And if you need a cautionary tail on why this is a bad idea generally,
> as well as a background on why I will firmly object to technical
> countermeasures like this, read up on Xen's allow_unsafe command line
> parameter.
> 
> ~Andrew
This?
  https://bugzilla.redhat.com/show_bug.cgi?id=858724

If so, that's very different. allow_unsafe caused previously accesible
remote hosts to become unbootable after an update, leaving anyone with a
remote host without IPMI interface dead in the water. It's nothing like
preventing spinning up a VM with a set of features that with high
likelihood a user doesn't want.

Both OSSTest and XenRT can simply adjust their nestedhvm knobs based on a
simple probing script.

Cheers,
Alejandro


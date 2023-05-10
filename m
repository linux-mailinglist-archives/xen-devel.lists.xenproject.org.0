Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4096FDCBB
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 13:28:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532751.829053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwhzM-0006HU-Qy; Wed, 10 May 2023 11:28:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532751.829053; Wed, 10 May 2023 11:28:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwhzM-0006Eu-Nv; Wed, 10 May 2023 11:28:08 +0000
Received: by outflank-mailman (input) for mailman id 532751;
 Wed, 10 May 2023 11:28:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9NoG=A7=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1pwhzL-0006Eo-6n
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 11:28:07 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb88a650-ef25-11ed-b229-6b7b168915f2;
 Wed, 10 May 2023 13:28:06 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f475366522so4562205e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 May 2023 04:28:05 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f1-20020a1cc901000000b003f25b40fc24sm22724788wmb.6.2023.05.10.04.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 04:28:04 -0700 (PDT)
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
X-Inumbo-ID: bb88a650-ef25-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1683718085; x=1686310085;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A26bHeWHbnOJ6AvtKoDtD9A0kZdw7DQ7Mh+MMahkDLA=;
        b=WN0QUi9QVNp5utc+AiSnqMH/ApTMiUQ11yt5GwWv3hA5t2UZ1jcBDdA8crnlziAuW8
         MBe5eJAxkyWQWXsdKHN3qLNXaemXJDgxMltNH1N8ga2SrT7A1lR6qRnOnKcuT9zhSad3
         GhlAApIDuDRxOkOdJGlcQcSpq/xRK5G9uGmow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683718085; x=1686310085;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A26bHeWHbnOJ6AvtKoDtD9A0kZdw7DQ7Mh+MMahkDLA=;
        b=N5BFC9mfD2GWqN1GLfQy+7se2BXbCdsE9Xa70p+fdwCSaUAEDz1dhwekpcxsWBwrLM
         wjRSmQ2e61TkH+UCWAQHqQWWODSSnuLJIMUhkRNMN22mLfW6na4nqTvCg+eDiukljq0n
         +t3xSRNVqxbaqP/qT0Anbx6hN6FF8Fj2uTk+bCmpatB1KETRav1uzkajVdPQKzfj8JB7
         4FnM7M0oC8qzO8jJnLY8OG7vUXbA7P7I/Fe+jSZYGd582nkXyTHdm0aBSoeIZvIFzsPA
         b4P0nL++T6si+AdaZdBIzfYfttgFcSJy8Bl8GvQ8afmDnY7OMNXicLKf7EQdtAlSz8m+
         xkMQ==
X-Gm-Message-State: AC+VfDxB2lggi4JY/4F+bWUIw/xvxFJ4o1wyN0YdylzLwdeD8CeMJLPc
	qmYK5aphq69EKKtMa1sojqr8aQ==
X-Google-Smtp-Source: ACHHUZ5EDvRS92Zqj2+MJ6l5hbyVtz0jwP2PcO1AHDcssDjWJk/FtzNubhaaW++z0i1+t/iVD4QMfg==
X-Received: by 2002:a7b:c8d0:0:b0:3f4:2cf3:a54e with SMTP id f16-20020a7bc8d0000000b003f42cf3a54emr2989278wml.41.1683718085351;
        Wed, 10 May 2023 04:28:05 -0700 (PDT)
Message-ID: <645b7fc4.1c0a0220.714be.162d@mx.google.com>
X-Google-Original-Message-ID: <ZFt/wdGirBAVh0FL@EMEAENGAAD19049.>
Date: Wed, 10 May 2023 12:28:01 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 0/3] Add CpuidUserDis support
References: <20230505175705.18098-1-alejandro.vallejo@cloud.com>
 <05b27f59-f906-79af-6c3c-6b6fae7cb1a9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05b27f59-f906-79af-6c3c-6b6fae7cb1a9@suse.com>

On Mon, May 08, 2023 at 11:06:31AM +0200, Jan Beulich wrote:
> On 05.05.2023 19:57, Alejandro Vallejo wrote:
> > Nowadays AMD supports trapping the CPUID instruction from ring3 to ring0,
> 
> Since it's relevant for PV32: Their doc talks about CPL > 0, i.e. not just
> ring 3. Therefore I wonder whether ...

Very true. It's CPL>0, not just ring3. Noted and changed on v2.

> 
> > (CpuidUserDis)
> 
> ... we shouldn't deviate from the PM and avoid the misleading use of "user"
> in our internal naming.
> 
> Jan
> 

IMO it's going to be confusing enough as is. We'll eventually have
virtualized versions of both Intel and AMD that may or may not be
cross-hooked with each other (e.g: virtualized Intel interface on
an AMD host) due to backward compatibility. That means we'll probably
want:

 1. A name for the Intel mechanism, currently "CPUID faulting"
 2. A name for the AMD mechanism, currently "CpuidUserDis"
 3. A generic name for the cpuid-can-be-trapped behaviour, currently
    overloaded with the Intel name (but could do with a Xen-specific one).
    It doesn't matter a lot now, but it will once the AMD interface is
    virtualized.

Sure, we could give it an alternative name on AMD, but we still need yet
another one to disambiguate the trapping behaviour from the specific
mechanism that does it.

Using the AMD manual name does have the upside that it's easier to check
the manual without having to remember the AMD-specific feature that
corresponds to a Xen-specific name. That said, if you have a good suggestion
I'm happy to change it. So long as in the end result is (1), (2) and (3)
have non-ambiguous names.

Alejandro


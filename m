Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A03938C0F65
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 14:13:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719235.1121860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s52e6-0007dh-31; Thu, 09 May 2024 12:13:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719235.1121860; Thu, 09 May 2024 12:13:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s52e5-0007bc-WE; Thu, 09 May 2024 12:13:10 +0000
Received: by outflank-mailman (input) for mailman id 719235;
 Thu, 09 May 2024 12:13:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Rdn=MM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s52e4-0007bS-KR
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 12:13:08 +0000
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [2607:f8b0:4864:20::736])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dc32c36-0dfd-11ef-b4bb-af5377834399;
 Thu, 09 May 2024 14:13:06 +0200 (CEST)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-792bd1f5b38so63816185a.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2024 05:13:06 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf2fc57asm60858485a.81.2024.05.09.05.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 05:13:04 -0700 (PDT)
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
X-Inumbo-ID: 7dc32c36-0dfd-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715256785; x=1715861585; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=32AosGZ+UPa7S5J79mBww78Vop5lui3LlGLrxy9W2Qk=;
        b=YuscnrYsPOJgAlsNH8UHh/f4RMPH90AAF8alDpknJUBRzVui6TQWB/DfeHibTCjF8K
         P7CdjoL9/XUzLmZHXZ2HV8jJX8StJ0WBaxbtNPfKDepvtx88B7ia8BockC+RKgX5Uwh8
         4BvfS8d4mWDDUOKs6oueqRlA1jJOcGFOVPPZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715256785; x=1715861585;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=32AosGZ+UPa7S5J79mBww78Vop5lui3LlGLrxy9W2Qk=;
        b=Vmf3VoxEeahQ3IfFvFHuSCc406e1rh9ExhKM7aH41HgHR/cTWNExJwK29CrbxSEA3n
         00EmdI4UzoB2M0i3k576EMu+cZtYyb+294QPT/hGC2OorFz5UbBncSWpDcj3yCLJ3YnB
         R4YtlreOCZI1iJgDrg/XeoM81K85JxcG4YRAK8JA36iHDkQB0YVpRHYYzgnByTC1qEqj
         DrHfCckeIUWfu8eA7ykjJfLN0g5db2IV6UB33Tdxhuoo6JEt9bSVsUT8SWiAqzE5564X
         aD6Su3J+fjfhsILUimNDm5Iw0KOMsCuWh3ikjG3LxD4RsyEspD1diBpafaJo87m5WK0I
         SjwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDDy5w+yVKegefgWbVy92WTxdkWdxibmeu1caW7NQgehGWWTPIOiKPqBHEV9mK2bP7dkvSmoy8Hfj2Z+eVqGrwO5Gk1y0icBEakk04tJM=
X-Gm-Message-State: AOJu0YwrfWtLguBzMFScBmPUcB4WRF91tdA4REN07hWRM8KlgtWA/fD0
	eyPCvjKb1xTmtA8gud16V3wmzl0XeHWqwc+uWa7rB0TVf0JOq1vhmV0JYXBdCIY=
X-Google-Smtp-Source: AGHT+IGJMWgEDYfhIAYWPQrq5m4Syq+n7eW/SSKwm3mtf34ktSsfdRL9gPKl8tYvWrFm7g0LRSEL1w==
X-Received: by 2002:ae9:f70e:0:b0:792:c13a:1a80 with SMTP id af79cd13be357-792c13a1b3bmr81648985a.44.1715256785284;
        Thu, 09 May 2024 05:13:05 -0700 (PDT)
Date: Thu, 9 May 2024 14:13:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Anthony PERARD <anthony@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.19 v2] tools/xen-cpuid: switch to use cpu-policy
 defined names
Message-ID: <Zjy9zmA1kjgZt9s8@macbook>
References: <20240502114922.94288-1-roger.pau@citrix.com>
 <2ddc6307-c9a6-4ee8-9689-c9c2c5a37142@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ddc6307-c9a6-4ee8-9689-c9c2c5a37142@suse.com>

On Thu, May 02, 2024 at 03:16:54PM +0200, Jan Beulich wrote:
> On 02.05.2024 13:49, Roger Pau Monne wrote:
> > Like it was done recently for libxl, switch to using the auto-generated feature
> > names by the processing of cpufeatureset.h, this allows removing the open-coded
> > feature names, and unifies the feature naming with libxl and the hypervisor.
> > 
> > Introduce a newly auto-generated array that contains the feature names indexed
> > at featureset bit position, otherwise using the existing INIT_FEATURE_NAMES
> > would require iterating over the array elements until a match with the expected
> > bit position is found.
> > 
> > Note that leaf names need to be kept, as the current auto-generated data
> > doesn't contain the leaf names.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Oleksii, now that Jan has provided a Reviewed-by, can you provide a
release-ack for this to go in?

Thanks, Roger.


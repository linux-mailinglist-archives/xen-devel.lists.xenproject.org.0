Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E92684CE7F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 17:00:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677800.1054656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXkLi-0003Ol-JO; Wed, 07 Feb 2024 16:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677800.1054656; Wed, 07 Feb 2024 16:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXkLi-0003MM-Gi; Wed, 07 Feb 2024 16:00:34 +0000
Received: by outflank-mailman (input) for mailman id 677800;
 Wed, 07 Feb 2024 16:00:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9378=JQ=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rXkLh-0003MF-Br
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 16:00:33 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05ae14b9-c5d2-11ee-8a4a-1f161083a0e0;
 Wed, 07 Feb 2024 17:00:32 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-51165a488baso1029605e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 08:00:32 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ha5-20020a170906a88500b00a3667f53691sm906802ejb.86.2024.02.07.08.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 08:00:31 -0800 (PST)
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
X-Inumbo-ID: 05ae14b9-c5d2-11ee-8a4a-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707321632; x=1707926432; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sfJS0fcEO4vKP037vedQWZnTsRIX9mqN55AFC/lUpOc=;
        b=RERqJzwMaDKr0JdT+gRPtg2N9EKBc2CcZDmz06H4M37dCKToGI8eFNS7qKOMprCmOR
         O3LO74/EEE327loWUSKy2/veaVHsQrrOxONJc2dOsUghpCV6DSvy+phbImURJ8RzTM+A
         fDoD+ZPD6SRKakar69PrLC2IgLh54lUAqgypU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707321632; x=1707926432;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sfJS0fcEO4vKP037vedQWZnTsRIX9mqN55AFC/lUpOc=;
        b=qJbGdt1P0gPq+gd+E7LBkhMJqdu8XqIGD07hgX3SN88l/ut7nhsxchwvZT94Zi4XeB
         JjRYeX1NdA2iGV3VrdoouuhWbje6Ri0g22V7xcS1EP0hCiRfqC/06pA4sVvP6bmTycnU
         YCgQ8XiMdDnzxXhFv32tWaVC31u974GIq1gL3uxcKasVFrxCj97/3lglL+yTb8Lp9JZP
         oPRoVOmFLUmj1P2xtP0Cm+pHAOuGdfAqjmo2T6Kp02Gsi9ZSOS08zFFSQqrs6CRc8ikR
         MARXjJq3cRxV+cD8Ie8B36dEm58vKZVhhR7M4oqW7NRUxukcgtLtR1L6mQLS67mm7MZG
         pVrw==
X-Gm-Message-State: AOJu0YzOa1XRiNSWqIB1NdxkptMPx41lMTgFoyk7+Bom1hjs4eC1P0wO
	c4uqlIRYgTC39qsmFYbbGqlHmgaYaLN1JItt5UF3VwtRZnrTZhjg7kfvuo5fBFuZ71D3YeEHqoh
	6
X-Google-Smtp-Source: AGHT+IFwxmNLVP3TGVhNIbNLaXosaEJJ1aWgjEleNZBA7mvzW3rAIVL5Oi0P0dRhyewNjObOjDTS0A==
X-Received: by 2002:a19:c519:0:b0:511:6a0b:1035 with SMTP id w25-20020a19c519000000b005116a0b1035mr491315lfe.17.1707321631950;
        Wed, 07 Feb 2024 08:00:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXrvtUOA0CCda9FTfFUbiNHcclN0TfHmIRdz8SUT6kSrBRnz8jLMWYbkZm11s7ganzsMEi3drndyafd
Date: Wed, 7 Feb 2024 16:00:31 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: zithro / Cyril =?iso-8859-1?Q?R=E9bert?= <slack@rabbit.lu>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] tools/xentop: add option to display dom0 first
Message-ID: <90e6b5d1-8f0e-4596-8f55-4b06d549d58c@perard>
References: <efdca3e0c02576c624403d273c7168c9303fcc52.1707232545.git.slack@rabbit.lu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <efdca3e0c02576c624403d273c7168c9303fcc52.1707232545.git.slack@rabbit.lu>

On Tue, Feb 06, 2024 at 04:15:45PM +0100, zithro / Cyril Rébert wrote:
> Add a command line option to xentop to be able to display dom0 first, on top of the list.
> This is unconditional, so sorting domains with the S option will also ignore dom0.
> 
> Signed-off-by: Cyril Rébert (zithro) <slack@rabbit.lu>
> 
> ---
> Changes in v2:
> - bug fix
> - add documentation

Looks like this v2 contains only changes from v1. Could you instead
squash both version and send it as v3? After that, it looks like the
patch would be ready to be committed (changes looks fine if I look at
both version).

Thanks,

-- 
Anthony PERARD


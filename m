Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 353ED867327
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 12:34:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685483.1066285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reZF3-0004iw-IF; Mon, 26 Feb 2024 11:33:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685483.1066285; Mon, 26 Feb 2024 11:33:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reZF3-0004gT-FP; Mon, 26 Feb 2024 11:33:53 +0000
Received: by outflank-mailman (input) for mailman id 685483;
 Mon, 26 Feb 2024 11:33:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CwqN=KD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1reZF2-0004dR-4M
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 11:33:52 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea4d2945-d49a-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 12:33:51 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5129cdae3c6so3792506e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 03:33:51 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 qp15-20020a056214598f00b0068f4fae633csm2789794qvb.28.2024.02.26.03.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 03:33:50 -0800 (PST)
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
X-Inumbo-ID: ea4d2945-d49a-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708947231; x=1709552031; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vLx1M/wdHuGW603vLItW5StklqX6rJE6dUZuu4WGVMo=;
        b=mCa75bmbIe3EfH3xSgcNCrq6/aIL2CPFfAr4cEUglMZZFkDV7fnUJo5I/zOb0vTZob
         b3EXVXl7E4laL8S6rYiyoHc3om40xqkyUyeAvHUjT8Z8jDNmExV5CarLFFlpT7E54C4a
         XtqHXc4xSFrivj7/EvKdQ3U+oAbqjEenafVZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708947231; x=1709552031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vLx1M/wdHuGW603vLItW5StklqX6rJE6dUZuu4WGVMo=;
        b=eaFOAtOb4cH2xXcO1xQXQNpnpkXE/+oI4lde1uS/1UHB15DMVmM+4BadaYBJXsDvek
         fdIwy1Xfy1W/fx1R2fMA2Z5FQzdTKOplNKHHlMAFQhLTN2j4KeTu1WukFJNXA5bkXDGV
         pLjWM53dPSwAJ4ID4Leo/f1P9zyMTodnwPrrkff8oJQaPfyjtvafK95lgXf+T8uDWQIE
         KyDEM6U5p4I5DV0lNsJeW2R2bL64S4RQQ76kz0ktNzWDM1j4S0so7Aw3/w3Ep6BRxXzd
         6bygUAjRhYM5zIVFlWGJLx+cuk47tCxDdYGUrCB1JaOXY3LJSpYQoCO/blfVCCoXOBZI
         izmg==
X-Forwarded-Encrypted: i=1; AJvYcCXwN7TImZH6t1GnkGJhAX+xnzTbRmpmyzYYxEjbH7rswGvcE6a9+wRWrci616DYZTG34kI4ik/7HbYygH8Ar5X275sLUEORXZFSDn0t3jw=
X-Gm-Message-State: AOJu0YzTpaR0/pDKU3ota37DR5j92fpnR+ywaUbqCMwqTUeOxzgywV6A
	1M7ZR7iEgM4aAJ3+fX/RgTBxV6BvghVEKxuAz/7sKjKAHCZ2iLK2yZmbhbm33sA=
X-Google-Smtp-Source: AGHT+IHHCddmGAQrvWY5Uv6hkoWew+ejXtOiHwSEC7TR8zupr1qeseoz7hlh8VCKKJDHF7MW8Jl68g==
X-Received: by 2002:a05:6512:a95:b0:513:a6:2f4 with SMTP id m21-20020a0565120a9500b0051300a602f4mr988082lfu.13.1708947231256;
        Mon, 26 Feb 2024 03:33:51 -0800 (PST)
Date: Mon, 26 Feb 2024 12:33:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 1/3] xen: introduce Kconfig function alignment option
Message-ID: <Zdx3FjaKKfF6R_U9@macbook>
References: <20240207145547.89689-1-roger.pau@citrix.com>
 <20240207145547.89689-2-roger.pau@citrix.com>
 <ab71e3e7-c032-454a-b9eb-4a8e9e064b8c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ab71e3e7-c032-454a-b9eb-4a8e9e064b8c@suse.com>

On Tue, Feb 13, 2024 at 04:51:13PM +0100, Jan Beulich wrote:
> On 07.02.2024 15:55, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/Kconfig
> > +++ b/xen/arch/x86/Kconfig
> > @@ -29,6 +29,7 @@ config X86
> >  	select HAS_UBSAN
> >  	select HAS_VPCI if HVM
> >  	select NEEDS_LIBELF
> > +	select FUNCTION_ALIGNMENT_16B
> 
> With the insertion here as well as for Arm and PPC obeying alphabetic
> sorting:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Would you like me to resend with that adjusted?

Thanks, Roger.


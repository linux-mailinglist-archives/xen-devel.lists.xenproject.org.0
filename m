Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC1F8CD156
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 13:37:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728426.1133339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA6kK-0005nF-1E; Thu, 23 May 2024 11:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728426.1133339; Thu, 23 May 2024 11:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA6kJ-0005kf-Uc; Thu, 23 May 2024 11:36:31 +0000
Received: by outflank-mailman (input) for mailman id 728426;
 Thu, 23 May 2024 11:36:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqPc=M2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sA6kI-0005kZ-Dk
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 11:36:30 +0000
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [2607:f8b0:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1355f1f-18f8-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 13:36:28 +0200 (CEST)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6f89b16d081so113046a34.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 04:36:28 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43f993b9653sm25978971cf.70.2024.05.23.04.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 04:36:26 -0700 (PDT)
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
X-Inumbo-ID: b1355f1f-18f8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716464187; x=1717068987; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hgI25QredcKhzXFGbYw4fFrt/5Gr4ZzTQrzrpz3tysk=;
        b=O13f/i/UuMRI0nq/Qu6Pd9AHxbnXboAohwaH6Gatjfi/xYUGtJPSbWrONL95mpSqP9
         ztbtENe7qafq/6VRwZpMF/08TO/Hn3jK7vTocpbRuggFNkn4LD/gO4A7e8DDzxkVQo58
         H0LWMPUvJ2WL531djsQ7l6FwAdhMS2YedrQiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716464187; x=1717068987;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hgI25QredcKhzXFGbYw4fFrt/5Gr4ZzTQrzrpz3tysk=;
        b=oZFrshlX47/lWrOWoz0FDZjR4z75Yo0c6NRQDAZdC/MVqXraaSgMYr858/OAJHrKq7
         8oKT4bJhstGnb4NJ73cP4LCnMNCsEzQ+nWFTp4VbfBKE1AT5AwBINFbax1V2eS0IVNXj
         nx+uWVauZLmJ0l4UdZHC2n1oWbF6tQuttIcPGHbioEl3p+y3n92bNQYHF4n9FM/k48sm
         YnGUkiRB11tHgoS1WO8ZK4CpVE87ZhawOuWbadQcbTZzogPsTY9UudRu8OByRO5bk8ku
         hFOTMTjV09bxZdYmQ6pxT8HK8OgndfdxvgSoMAvjcxND0NLq7jcfPRCitRqBr02zI7C/
         y1ng==
X-Gm-Message-State: AOJu0YxagmBok1UDQv5BuNtKdw/WI7QRv/GETfqag0QS2G2Hq3YfeNAX
	86etVisHSIdZeBw9mn9s8VgbQQ3YfRnU0gSxi1CgpoOfsX2IjxzdaoX6McgQFi8=
X-Google-Smtp-Source: AGHT+IF8yYSGP5VaRxRahCLUK4tN1Th63DqmW6zelgbfZ1DBPfTWH1oeyjVkyY/GV9Mkj3JSMb0qCg==
X-Received: by 2002:a05:6830:142:b0:6ee:ca2:523 with SMTP id 46e09a7af769-6f669afc0ddmr4945949a34.26.1716464186998;
        Thu, 23 May 2024 04:36:26 -0700 (PDT)
Date: Thu, 23 May 2024 13:36:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH for-4.19 v3 2/3] xen: enable altp2m at create domain
 domctl
Message-ID: <Zk8qOIIYeOtnNe_0@macbook>
References: <20240517133352.94347-1-roger.pau@citrix.com>
 <20240517133352.94347-3-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240517133352.94347-3-roger.pau@citrix.com>

On Fri, May 17, 2024 at 03:33:51PM +0200, Roger Pau Monne wrote:
> Enabling it using an HVM param is fragile, and complicates the logic when
> deciding whether options that interact with altp2m can also be enabled.
> 
> Leave the HVM param value for consumption by the guest, but prevent it from
> being set.  Enabling is now done using and additional altp2m specific field in
> xen_domctl_createdomain.
> 
> Note that albeit only currently implemented in x86, altp2m could be implemented
> in other architectures, hence why the field is added to xen_domctl_createdomain
> instead of xen_arch_domainconfig.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v2:
>  - Introduce a new altp2m field in xen_domctl_createdomain.
> 
> Changes since v1:
>  - New in this version.
> ---
>  tools/libs/light/libxl_create.c     | 23 ++++++++++++++++++++++-
>  tools/libs/light/libxl_x86.c        | 26 ++++++++++++--------------
>  tools/ocaml/libs/xc/xenctrl_stubs.c |  2 +-
>  xen/arch/arm/domain.c               |  6 ++++++

Could I get an Ack from one of the Arm maintainers for the trivial Arm
change?

Thanks, Roger.


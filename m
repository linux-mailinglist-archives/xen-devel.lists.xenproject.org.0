Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4806A4E9288
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 12:33:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295385.502623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYmfS-0001wW-8w; Mon, 28 Mar 2022 10:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295385.502623; Mon, 28 Mar 2022 10:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYmfS-0001tT-5w; Mon, 28 Mar 2022 10:32:10 +0000
Received: by outflank-mailman (input) for mailman id 295385;
 Mon, 28 Mar 2022 10:32:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1JyH=UH=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nYmfQ-0001tN-8T
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 10:32:08 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 4fd2e84d-ae82-11ec-8fbc-03012f2f19d4;
 Mon, 28 Mar 2022 12:32:05 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A7E1D6E;
 Mon, 28 Mar 2022 03:32:04 -0700 (PDT)
Received: from [10.57.22.195] (unknown [10.57.22.195])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E17973F66F;
 Mon, 28 Mar 2022 03:32:01 -0700 (PDT)
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
X-Inumbo-ID: 4fd2e84d-ae82-11ec-8fbc-03012f2f19d4
Message-ID: <9345a37d-a091-6e32-fad6-9746e49646dc@arm.com>
Date: Mon, 28 Mar 2022 12:31:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/2] xen: Linker scripts synchronization
Content-Language: en-US
From: Michal Orzel <michal.orzel@arm.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220322080233.53134-1-michal.orzel@arm.com>
In-Reply-To: <20220322080233.53134-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jan,

Could you please review this series as you did give some comments in v1?

On 22.03.2022 09:02, Michal Orzel wrote:
> This patch series aims to do the first step towards linker scripts
> synchronization. Linker scripts for arm and x86 share a lot of common
> sections and in order to make the process of changing/improving/syncing
> them, these sections shall be defined in just one place.
> 
> The first patch creates an empty header file xen.lds.h to store the
> constructs mutual to both x86 and arm linker scripts. It also includes
> this header in the scripts.
> 
> The second patch populates xen.lds.h with the first portion of common
> macros and replaces the original contructs with these helpers.
> 
> Michal Orzel (2):
>   xen: Introduce a header to store common linker scripts content
>   xen: Populate xen.lds.h and make use of its macros
> 
>  xen/arch/arm/xen.lds.S    |  38 +++++---------
>  xen/arch/x86/xen.lds.S    |  79 +++-------------------------
>  xen/include/xen/xen.lds.h | 108 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 129 insertions(+), 96 deletions(-)
>  create mode 100644 xen/include/xen/xen.lds.h
> 

Cheers,
Michal


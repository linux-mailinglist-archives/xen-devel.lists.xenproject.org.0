Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2202F0E82
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 09:50:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64663.114259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kysth-0006fj-HY; Mon, 11 Jan 2021 08:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64663.114259; Mon, 11 Jan 2021 08:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kysth-0006fK-EM; Mon, 11 Jan 2021 08:49:57 +0000
Received: by outflank-mailman (input) for mailman id 64663;
 Mon, 11 Jan 2021 08:49:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ekcf=GO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kystg-0006fF-71
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 08:49:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9030a980-4e22-4d91-83fc-5e87270209c3;
 Mon, 11 Jan 2021 08:49:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8326FAD2B;
 Mon, 11 Jan 2021 08:49:54 +0000 (UTC)
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
X-Inumbo-ID: 9030a980-4e22-4d91-83fc-5e87270209c3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610354994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6JpEEx487B/qI2x5uPIhVpi6GWgTrJkWc5mqOtm7pw4=;
	b=CX+jvK9pzOJUAc7FIH/d8oFoPRUQvFUOATS6wslIX8PmZjMbL+irqklI0zZhL6G4beOeWw
	X8fr5ZTPInjDj2P1653SXalfgLzglgdMT5E0ic3sA7pLs269NHNukS+fzy8CkaXjvvj6Wf
	9JEayxnQ61xDHiuIVoMrILqGGkQPvQQ=
Subject: Re: [PATCH v2] xen/arm: do not read MVFR2 when is not defined
To: Stefano Stabellini <sstabellini@kernel.org>, bertrand.marquis@arm.com
Cc: julien@xen.org, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <20210108192243.25889-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f90e40ee-b042-6cc5-a08d-aef41a279527@suse.com>
Date: Mon, 11 Jan 2021 09:49:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108192243.25889-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.01.2021 20:22, Stefano Stabellini wrote:
> MVFR2 is not available on ARMv7. It is available on ARMv8 aarch32 and
> aarch64. If Xen reads MVFR2 on ARMv7 it could crash.
> 
> Avoid the issue by doing the following:
> 
> - define MVFR2_MAYBE_UNDEFINED on arm32
> - if MVFR2_MAYBE_UNDEFINED, do not attempt to read MVFR2 in Xen
> - keep the 3rd register_t in struct cpuinfo_arm.mvfr on arm32 so that a
>   guest read to the register returns '0' instead of crashing the guest.
> 
> '0' is an appropriate value to return to the guest because it is defined
> as "no support for miscellaneous features".
> 
> Aarch64 Xen is not affected by this patch.

But it looks to also be affected by ...

> Fixes: 9cfdb489af81 ("xen/arm: Add ID registers and complete cpuinfo")

... this, faulting (according to osstest logs) early during boot on

000000000025D314	mrs	x1, id_pfr2_el1

afaict.

Jan


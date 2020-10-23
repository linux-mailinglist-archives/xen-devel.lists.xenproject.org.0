Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 820C02972CD
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 17:47:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11126.29501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzHz-0003Fm-Jf; Fri, 23 Oct 2020 15:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11126.29501; Fri, 23 Oct 2020 15:47:35 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzHz-0003FN-G5; Fri, 23 Oct 2020 15:47:35 +0000
Received: by outflank-mailman (input) for mailman id 11126;
 Fri, 23 Oct 2020 15:47:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVzHy-0003FI-Ap
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:47:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 899383f0-e24f-4cb4-a8ce-17f557e89553;
 Fri, 23 Oct 2020 15:47:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 719A2AD49;
 Fri, 23 Oct 2020 15:47:32 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVzHy-0003FI-Ap
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:47:34 +0000
X-Inumbo-ID: 899383f0-e24f-4cb4-a8ce-17f557e89553
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 899383f0-e24f-4cb4-a8ce-17f557e89553;
	Fri, 23 Oct 2020 15:47:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603468052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZMQG8HMDTnF0Z6C9utrK1ZfxnzVLy957Ni7BC+3SY4A=;
	b=hYjzQH9TDvEWmhrw29C6hoQ1tW/zErOkV59h3+vJblSSwAtshznyefE70SOQDBFyG4/c3E
	xQWBvV31sSvpkm2NdhYdsrbBsqORqzv/X8qBzRyIOFiLv29RRVmk1grr1So9U7+LN2dGJF
	nW1+wfV2NzPRVgOJKmYCjEk/veNEgSQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 719A2AD49;
	Fri, 23 Oct 2020 15:47:32 +0000 (UTC)
Subject: Re: [PATCH v2 1/7] xen/acpi: Rework acpi_os_map_memory() and
 acpi_os_unmap_memory()
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, alex.bennee@linaro.org,
 masami.hiramatsu@linaro.org, ehem+xen@m5p.com, bertrand.marquis@arm.com,
 andre.przywara@arm.com, Rahul.Singh@arm.com, Julien Grall
 <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20201023154156.6593-1-julien@xen.org>
 <20201023154156.6593-2-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0fe86a2b-290e-ebd0-ab1a-d6318bef66fe@suse.com>
Date: Fri, 23 Oct 2020 17:47:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201023154156.6593-2-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.10.2020 17:41, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The functions acpi_os_{un,}map_memory() are meant to be arch-agnostic
> while the __acpi_os_{un,}map_memory() are meant to be arch-specific.
> 
> Currently, the former are still containing x86 specific code.
> 
> To avoid this rather strange split, the generic helpers are reworked so
> they are arch-agnostic. This requires the introduction of a new helper
> __acpi_os_unmap_memory() that will undo any mapping done by
> __acpi_os_map_memory().
> 
> Currently, the arch-helper for unmap is basically a no-op so it only
> returns whether the mapping was arch specific. But this will change
> in the future.
> 
> Note that the x86 version of acpi_os_map_memory() was already able to
> able the 1MB region. Hence why there is no addition of new code.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Rahul Singh <rahul.singh@arm.com>
> Tested-by: Rahul Singh <rahul.singh@arm.com>

Non-Arm parts
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


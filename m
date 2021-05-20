Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F6238AE79
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 14:37:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130957.245018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljhvM-0001Hc-JU; Thu, 20 May 2021 12:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130957.245018; Thu, 20 May 2021 12:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljhvM-0001FS-Fu; Thu, 20 May 2021 12:37:12 +0000
Received: by outflank-mailman (input) for mailman id 130957;
 Thu, 20 May 2021 12:37:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3HBq=KP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ljhvL-0001FF-Er
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 12:37:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 459601b0-e461-482e-99ba-234b5ae42aba;
 Thu, 20 May 2021 12:37:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EF813ABE8;
 Thu, 20 May 2021 12:37:09 +0000 (UTC)
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
X-Inumbo-ID: 459601b0-e461-482e-99ba-234b5ae42aba
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621514230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KXmTi30s2R/5r0eMavJpsdbNUKjY1P+JZ6ZKn62iJOE=;
	b=K3lMcDrOmSXLdJf2joKiAOBGit9v05SaNoWhPuP6/r6j0WEFhFrN7CSkIQS6J6vEiTTD3i
	pzSy+s8IW8jW1vmdtYtl6ZjuO5+RVV8ooLfJ1jiKBlFi3GaoD38QrrOshYOI7ZOt1VKMNu
	6ZGzfQT7B3/BQ28B82dbiA1/cqEdORs=
Subject: Re: [PATCH v3 2/2] libelf: improve PVH elfnote parsing
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20210520123012.89855-1-roger.pau@citrix.com>
 <20210520123012.89855-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e9633187-42c1-e922-70b9-30c0b5a862b8@suse.com>
Date: Thu, 20 May 2021 14:37:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210520123012.89855-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 20.05.2021 14:30, Roger Pau Monne wrote:
> Pass an hvm boolean parameter to the elf note parsing and checking
> routines, so that better checking can be done in case libelf is
> dealing with an hvm container.
> 
> elf_xen_note_check shouldn't return early unless PHYS32_ENTRY is set
> and the container is of type HVM, or else the loader and version
> checks would be avoided for kernels intended to be booted as PV but
> that also have PHYS32_ENTRY set.
> 
> Adjust elf_xen_addr_calc_check so that the virtual addresses are
> actually physical ones (by setting virt_base and elf_paddr_offset to
> zero) when the container is of type HVM, as that container is always
> started with paging disabled.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

With the one hunk moved to patch 1
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE502A67F8
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 16:43:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19377.44530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaKwi-0003J6-PB; Wed, 04 Nov 2020 15:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19377.44530; Wed, 04 Nov 2020 15:43:36 +0000
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
	id 1kaKwi-0003Ih-LG; Wed, 04 Nov 2020 15:43:36 +0000
Received: by outflank-mailman (input) for mailman id 19377;
 Wed, 04 Nov 2020 15:43:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gnt3=EK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kaKwg-0003Hy-I7
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 15:43:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f46bcc32-510f-4941-b137-e58d1e359206;
 Wed, 04 Nov 2020 15:43:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9864AB5C;
 Wed,  4 Nov 2020 15:43:32 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gnt3=EK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kaKwg-0003Hy-I7
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 15:43:34 +0000
X-Inumbo-ID: f46bcc32-510f-4941-b137-e58d1e359206
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f46bcc32-510f-4941-b137-e58d1e359206;
	Wed, 04 Nov 2020 15:43:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604504612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1yHBIDHWlcIfcBCCjCG/MjJGOs0S/6P/91kiiG2RQIQ=;
	b=mKWJfss6iuxsdPbHrFu0gb6D3lrZdO3wIGm5NU+EGvdowdRTvLy9i97UWDV+VHwucr/UEv
	qO6OO4xfjmN9SeTndhjYaixE5VYlMJRsIW6YY32KVP9QP0e58pVD/UoLls+K+evqv31Bwm
	7NN9OvVk/dsgng0z1iAa7riwCJY80Kc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C9864AB5C;
	Wed,  4 Nov 2020 15:43:32 +0000 (UTC)
Subject: Re: [PATCH v2 2/4] xen/pci: Introduce new CONFIG_PCI_ATS flag for PCI
 ATS functionality.
To: Rahul Singh <rahul.singh@arm.com>
Cc: Bertrand.Marquis@arm.com, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1604417224.git.rahul.singh@arm.com>
 <27814e614618c413ac61a9f7a48d795c557bfe5c.1604417224.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c9874396-44d2-b969-104f-eb40b4e107c9@suse.com>
Date: Wed, 4 Nov 2020 16:43:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <27814e614618c413ac61a9f7a48d795c557bfe5c.1604417224.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.11.2020 16:59, Rahul Singh wrote:
> --- a/xen/drivers/pci/Kconfig
> +++ b/xen/drivers/pci/Kconfig
> @@ -1,3 +1,12 @@
>  
>  config HAS_PCI
>  	bool
> +
> +config PCI_ATS
> +	bool "PCI ATS support"
> +	default y
> +	depends on X86 && HAS_PCI
> +	---help---
> +	 Enable PCI Address Translation Services.
> +
> +	 If unsure, say Y.

Support for "---help---" having gone away in Linux, I think we'd
better not add new instances. Also indentation of help content
typically is by a tab and two spaces. With these two adjusted

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


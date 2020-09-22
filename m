Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE5F273CB8
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 09:55:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKd8R-0001lx-W0; Tue, 22 Sep 2020 07:54:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tL6=C7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kKd8Q-0001ls-Rp
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 07:54:46 +0000
X-Inumbo-ID: 7e297fa0-1763-42a6-965a-5c494a9a7814
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e297fa0-1763-42a6-965a-5c494a9a7814;
 Tue, 22 Sep 2020 07:54:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600761285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Nd2QijcRjkdIJFibJeEfGDahvETtTVPCV9RnFmuUAM=;
 b=iyP7w4GhqJTfB8q+m1B2YOOngMtCb0ecdWrydsjOu3g/0qYX9vVJUFITVExN5K35ErTD54
 KtfCtT418fQpPoHOrSV1rJCftm/P6XmKt6vuWAiljL1UNE+CJMiQ9sjEbbil9rkTrRwXZq
 OKO2cOAKxkbjPGeyL1F7x1i8bbs0O10=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BCF30AEB6;
 Tue, 22 Sep 2020 07:55:21 +0000 (UTC)
Subject: Re: [PATCH v4 2/4] xen: Introduce HAS_M2P config and use to protect
 mfn_to_gmfn call
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20200921180214.4842-1-julien@xen.org>
 <20200921180214.4842-3-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d901dd53-c3fb-7522-8317-a83bed3e383d@suse.com>
Date: Tue, 22 Sep 2020 09:54:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200921180214.4842-3-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21.09.2020 20:02, Julien Grall wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -63,6 +63,9 @@ config HAS_IOPORTS
>  config HAS_SCHED_GRANULARITY
>  	bool
>  
> +config HAS_M2P
> +	bool

Following Andrew's comments I think the need for this addition
disappears, but in case I'm missing something I'd like to ask for
this to be added higher up - see the patch I've just sent to
re-sort the various HAS_* here.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD874BA9DC
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 20:33:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274963.470612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKmVy-00006l-Pg; Thu, 17 Feb 2022 19:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274963.470612; Thu, 17 Feb 2022 19:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKmVy-0008Ve-M8; Thu, 17 Feb 2022 19:32:30 +0000
Received: by outflank-mailman (input) for mailman id 274963;
 Thu, 17 Feb 2022 19:32:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nKmVx-0008VQ-8L
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 19:32:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nKmVu-0004Ty-Lf; Thu, 17 Feb 2022 19:32:26 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nKmVu-00085Z-GH; Thu, 17 Feb 2022 19:32:26 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=HucGBESsRWJC7dzzmFYEr3QpNJw6JJwcEf+iP1Cl0FE=; b=6F12dy0pyq8/f1IV4fTWJG4Ma/
	DyHAh1h808zL4ELgY/wWLjNigt08uZ/KsxB+EQk2BAoRA9uW30XY1qBpe8UBwBFZrSxF1nRsdKGHQ
	s0S/5ZZZVH/2qUZya80S4BXbjTksB0oB+/2wFq82Q+t5NnluGCKuKiFH8Z37TeaGCNwQ=;
Message-ID: <7fae5d20-f5fc-8858-c18b-fc2dff89e15c@xen.org>
Date: Thu, 17 Feb 2022 19:32:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN PATCH v9 20/30] build: rework "clean" to clean from the root
 dir
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-21-anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220125110103.3527686-21-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 25/01/2022 11:00, Anthony PERARD wrote:
> This will allow "clean" to work from an out-of-tree build when
> it will be available.
> 
> Some of the file been removed in current "clean" target aren't added
> to $(clean-files) because they are already listed in $(extra-) or
> $(extra-y).
> 
> Also start to clean files listed in $(targets). This allows to clean
> "common/config_data.S" and "xsm/flask/flask-policy.S" without
> having to list them a second time.
> 
> Also clean files in "arch/x86/boot" from that directory by allowing
> "clean" to descend into the subdir by adding "boot" into $(subdir-).
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


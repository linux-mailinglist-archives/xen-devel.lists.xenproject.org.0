Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF4D592AEB
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 10:14:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387131.623248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNVES-0002za-RV; Mon, 15 Aug 2022 08:13:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387131.623248; Mon, 15 Aug 2022 08:13:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNVES-0002xI-OU; Mon, 15 Aug 2022 08:13:56 +0000
Received: by outflank-mailman (input) for mailman id 387131;
 Mon, 15 Aug 2022 08:13:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oNVER-0002xC-Di
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 08:13:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oNVEQ-0008LM-Nj; Mon, 15 Aug 2022 08:13:54 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.0.187])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oNVEQ-0007bF-GV; Mon, 15 Aug 2022 08:13:54 +0000
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
	bh=/1AqIghasi3XJN7PR1RdRbpyl/ud2M5DOyamdmNr/cI=; b=tLaKow6bf4ZH9Qll0b5POILnBX
	pXNINsH7odtRYVZ3yBNF235tBS4zNDTbd4/hoicRHCaBWMwpn/ygXVFx6DnB5Tce1dt4Ns3ZQh5wo
	1X+ITRDxk04CUe3ih+X+b2s/oQi66D6uajoEvjgqHDtsr+0z6AtvqG7TjJcboBMBDLOQ=;
Message-ID: <c8d7de5e-0d0b-43cb-2b89-d253a2b0b490@xen.org>
Date: Mon, 15 Aug 2022 09:13:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: Xen 4.17: Current status of series floating in ML
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall
 <jgrall@amazon.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 "Wei Liu (LSG)" <liuwe@microsoft.com>
References: <AS8PR08MB7991375F9A36B36AE5ADF3E092689@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991375F9A36B36AE5ADF3E092689@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/08/2022 06:46, Henry Wang wrote:
> Hi all,

Hi Henry,

Thanks for the list!


> ** Blocker List **:
> 1. Patch: x86: enable interrupts around dump_execstate()
> https://patchwork.kernel.org/project/xen-devel/patch/e717897f-980d-ad44-31d9-39f5e7e1c45e@suse.com/
> Status: Waiting for review.
> 
> 2. tools/xenstore: add some new features to the documentation
> https://patchwork.kernel.org/project/xen-devel/list/?series=665064
> Status: Patch #2 merged. Only patch #5 is not properly reviewed/acked.
> Discussion seems going on and (probably?) needs a respin.

Hmmm... Why is it a blocker? This is only documentation and I haven't 
yet seen any code implementing those new features.

Cheers,

-- 
Julien Grall


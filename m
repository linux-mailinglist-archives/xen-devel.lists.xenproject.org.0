Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C1F648B52
	for <lists+xen-devel@lfdr.de>; Sat, 10 Dec 2022 00:25:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458333.716245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3mjd-0003td-23; Fri, 09 Dec 2022 23:24:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458333.716245; Fri, 09 Dec 2022 23:24:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3mjc-0003ra-VO; Fri, 09 Dec 2022 23:24:52 +0000
Received: by outflank-mailman (input) for mailman id 458333;
 Fri, 09 Dec 2022 23:24:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p3mjb-0003rU-R9
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 23:24:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p3mjY-0007xf-AL; Fri, 09 Dec 2022 23:24:48 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p3mjY-0004nP-4V; Fri, 09 Dec 2022 23:24:48 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=pXXMEZr+ohpBx1O1ek/P1yw9UOmaWk9U75mmjk4MfV8=; b=cHDBPiyssslfmN82Fqif23pw7u
	2ENKH4IwH+FBWefc687JMQNkSlMPO2fUJuDjhI4LZHT3EBVDmJ6/SvcdFyZNVdJb/TdUgfcbp9bzy
	bGiZx+J6E459gljXv5/op8S2N+8OcHDxAQoCKm3THI/oT0HoGLUAzxiz+yyS12bPl9E0=;
Message-ID: <3fe0e377-367d-d6d1-395c-f7091d31ac05@xen.org>
Date: Fri, 9 Dec 2022 23:24:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Henry Wang
 <Henry.Wang@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221014080917.14980-1-Henry.Wang@arm.com>
 <a947e0b4-8f76-cea6-893f-abf30ff95e0d@xen.org>
 <AS8PR08MB7991FD5994497D812FE3AE2E92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <9d5ab09e-650f-118d-0233-d7988f1504f1@xen.org>
 <AS8PR08MB799170627B34BD2627CE3092921D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e6643bfc-5bdf-f685-1b68-b28d341071c1@xen.org>
 <b9a2d6c7-fb09-a89a-14ef-09bc197afa0f@citrix.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
In-Reply-To: <b9a2d6c7-fb09-a89a-14ef-09bc197afa0f@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 09/12/2022 22:18, Andrew Cooper wrote:
> On 09/12/2022 18:51, Julien Grall wrote:
> That said, moving the creation side of things doesn't change the
> teardown requirements.  When I get time to respin the fault_ttl series,
> Gitlab CI will be able to demonstrate the bug I keep on telling you is
> still there, the fix for which is taking the patch I already wrote for
> you.

Is it just a matter of rebasing the series? If so, I am happy to give a 
try to see what comes up...

> There is no correct way to move the final loop out of
> complete_domain_destroy(), even if in the general case you can make it
> more preemptible by moving the allocation later.

Hmmm... I don't think the call to p2m_teardown() in 
complete_domain_destroy() will be necessary once we move the P2M 
allocation out of arch_domain_create().

This is because there will be no use of the P2M after 
domain_relinquish_resources().

Cheers,

-- 
Julien Grall


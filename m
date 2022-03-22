Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E624E4750
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 21:15:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293647.498910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWkul-0002hg-Q8; Tue, 22 Mar 2022 20:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293647.498910; Tue, 22 Mar 2022 20:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWkul-0002fW-Mq; Tue, 22 Mar 2022 20:15:35 +0000
Received: by outflank-mailman (input) for mailman id 293647;
 Tue, 22 Mar 2022 20:15:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nWkuk-0002fQ-Cp
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 20:15:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWkuj-0005sh-V1; Tue, 22 Mar 2022 20:15:33 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.19.186]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWkuj-0006zI-OQ; Tue, 22 Mar 2022 20:15:33 +0000
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
	bh=uBBXBzdtxyws5zZztStvRlCF2ew1rYhGFuuLNRkP/mw=; b=ho/V5sp8v5KcaQOn/RB8Z8YOhV
	WbJyTiXp+3aY1ULLjBGqX7dllZ9lF62uCYV2BQC1x9tw0Reu2AhzcuNmSqaPdqbxitxI/Ea64l/ov
	TLoRg91Qt2kPpqKe4y4GbW4cIP0PGm/WG2AvwDoUnRD6S6z1X3m1nCCRSrVV/b+/sj78=;
Message-ID: <f70d3303-6277-bff7-8b87-af9860102523@xen.org>
Date: Tue, 22 Mar 2022 20:15:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v4 05/11] xen: don't include asm/hypercall.h from C
 sources
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220310073420.15622-1-jgross@suse.com>
 <20220310073420.15622-6-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220310073420.15622-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 10/03/2022 07:34, Juergen Gross wrote:
> Instead of including asm/hypercall.h always use xen/hypercall.h.
> Additionally include xen/hypercall.h from all sources containing a
> hypercall handler.
> 
> This prepares for generating the handlers' prototypes at build time.
> 
> Add a guard in asm/hypercall.h to catch direct inclusion.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

For Arm:

Acked-by: Julien Grall <jgrall@amazon.com> # arm

Cheers,

-- 
Julien Grall


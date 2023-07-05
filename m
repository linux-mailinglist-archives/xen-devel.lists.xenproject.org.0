Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D92BB7485A4
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 16:07:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559215.874007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH39n-0000ao-NE; Wed, 05 Jul 2023 14:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559215.874007; Wed, 05 Jul 2023 14:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH39n-0000YG-KO; Wed, 05 Jul 2023 14:06:59 +0000
Received: by outflank-mailman (input) for mailman id 559215;
 Wed, 05 Jul 2023 14:06:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qH39l-0000Y4-Uo
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 14:06:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qH39k-0001E2-FO; Wed, 05 Jul 2023 14:06:56 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.19.213]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qH39k-0002Ma-8N; Wed, 05 Jul 2023 14:06:56 +0000
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
	bh=cTwsWwAkHS+cxxxtYxFE3djYhwdllEQ8vBVDtI5URuU=; b=idvWPzM7yjBZvVf/WndgvzaTZ0
	7cvSvFNMyQJQLVqnTE9l7G/M3mBvKar9y3Sf/0Ug2woLZiiTSOsA1xdlj1W7y5A8oWqceB8zodhx1
	rb8HCKou6VQ+FUoObO9UzQzals7VJzmtd4JWKXi1IxJ6asUOnkPXta0f3x5Iu68n+2O0=;
Message-ID: <e9822dae-54b2-ee0c-b626-ea601723e3f8@xen.org>
Date: Wed, 5 Jul 2023 15:06:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 0/3] xen/types: Cleanup
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <20230627075618.1180248-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230627075618.1180248-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/06/2023 08:56, Andrew Cooper wrote:
> v2, adjusted per the discussion at XenSummit
> 
> https://cirrus-ci.com/build/6611877547999232
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/912782128
> 
> Andrew Cooper (3):
>    xen/types: Drop #ifdefary for __{SIZE,PTRDIFF}_TYPE__
>    treewide: Avoid including asm/types.h
>    xen/types: Rework stdint vs __{u,s}$N types

For the series (including v2.5):

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


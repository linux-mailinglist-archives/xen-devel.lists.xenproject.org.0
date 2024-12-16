Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 676669F38B5
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 19:18:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858448.1270667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNFfw-0007V3-98; Mon, 16 Dec 2024 18:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858448.1270667; Mon, 16 Dec 2024 18:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNFfw-0007Ru-5m; Mon, 16 Dec 2024 18:18:36 +0000
Received: by outflank-mailman (input) for mailman id 858448;
 Mon, 16 Dec 2024 18:18:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hzbA=TJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1tNFfv-0007Ro-9D
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 18:18:35 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28f15d56-bbda-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 19:18:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 30A498287C30;
 Mon, 16 Dec 2024 12:18:33 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id SWYXOXURHFcH; Mon, 16 Dec 2024 12:18:32 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 92B6A828563F;
 Mon, 16 Dec 2024 12:18:32 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id bMVIlAUYrnsQ; Mon, 16 Dec 2024 12:18:32 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 0D8278287CC1;
 Mon, 16 Dec 2024 12:18:31 -0600 (CST)
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
X-Inumbo-ID: 28f15d56-bbda-11ef-a0d6-8be0dac302b0
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 92B6A828563F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1734373112; bh=ZUBA9xVH4Gb4+YZ4FUbwwstEbbkfAHB0EOf5IYdZhzY=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=fMNsfceqWTUS5IBIeuBSFX2YYHdtjn+ToeGlAtAMmRF4MnbIR2jxSXQRIckDIlfpa
	 F7qSkxusIu1arkwPiSITYLHesy2NJma0garog9unRfpfzBZSYqE3voBnivn5UQ3j1B
	 1qjnUQToFrV9MzSyV7Z2zlTDQW2Zd7Onz+Z/+6yw=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <1283bff8-b890-45a4-a817-198c15649fd7@raptorengineering.com>
Date: Mon, 16 Dec 2024 12:18:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] xen/ppc: mm-radix: Allocate all paging structures
 at runtime
To: Jan Beulich <jbeulich@suse.com>
Cc: tpearson@raptorengineering.com, xen-devel@lists.xenproject.org
References: <cover.1727388925.git.sanastasio@raptorengineering.com>
 <c34ab55cd5ccc7658216e9122eb30569815958d3.1727388925.git.sanastasio@raptorengineering.com>
 <801c913a-d915-4dd0-9ed2-f89c6717b1cb@suse.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <801c913a-d915-4dd0-9ed2-f89c6717b1cb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jan,

On 9/30/24 10:20 AM, Jan Beulich wrote:
> On 27.09.2024 00:24, Shawn Anastasio wrote:
>> In the initial mm-radix implementation, the in-memory partition and
>> process tables required to configure the MMU, as well as the page tables
>> themselves were all allocated statically since the boot allocator was
>> not yet available.
>>
>> Now that it is, allocate these structures at runtime and bump the size
>> of the Process Table to its maximum supported value (on POWER9).
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> On the assumption that the (theoretical only?) case of there being gaps
> in [min_alloc_mfn,max_alloc_mfn] if deemed okay, with it being just more
> memory being mapped in such a case:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Sorry for the late response on this. Your assumption is correct -- in
the case that there are gaps in the allocated region, it will just
result in more memory than is strictly necessary being mapped, and given
the constraints here I'm fine with that tradeoff.

> Jan

Thanks,
Shawn


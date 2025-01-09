Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A51A07FA7
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 19:17:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869093.1280600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVx5M-0001uo-Vb; Thu, 09 Jan 2025 18:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869093.1280600; Thu, 09 Jan 2025 18:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVx5M-0001t6-Rx; Thu, 09 Jan 2025 18:16:48 +0000
Received: by outflank-mailman (input) for mailman id 869093;
 Thu, 09 Jan 2025 18:16:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJAI=UB=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1tVx5L-0001sw-V0
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 18:16:47 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e05a23f6-ceb5-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 19:16:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B7BB9828562D;
 Thu,  9 Jan 2025 12:16:41 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id cumXmu5fu84F; Thu,  9 Jan 2025 12:16:41 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 232718286810;
 Thu,  9 Jan 2025 12:16:41 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id XTontW0C5y6j; Thu,  9 Jan 2025 12:16:41 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 8BFF2828562D;
 Thu,  9 Jan 2025 12:16:40 -0600 (CST)
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
X-Inumbo-ID: e05a23f6-ceb5-11ef-a0df-8be0dac302b0
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 232718286810
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1736446601; bh=Q3uOEm76RN+/AKHBCFoMf2Z99IyyQj3ribq2cdcN+Ew=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=U/oourOYFtI9wj9cG3ZHB9zDMSaN/XuAC4HSmodRJsL3Yvl6SqokXMhRiZjzYeJzB
	 pcTBQSuBFDx0zqUDo8ahWZv0PIDAdx0+DDCcR8BEo9+tbOE+Ihuby/vINcBG5L/nAx
	 8+oU3vr9Ke/fbELw4XgH1FclFTDR5GwCFANfWWp4=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <c7c1ca24-fdfa-4fe0-ae45-c6f609e3d2fb@raptorengineering.com>
Date: Thu, 9 Jan 2025 12:16:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/mm: Introduce per-arch pte_attr_t type for PTE flags
To: Jan Beulich <jbeulich@suse.com>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <47babd3f9ec00c15738a81aa57926e8a1f08cbe6.1735669493.git.sanastasio@raptorengineering.com>
 <a769ef28-5794-45a0-bb3f-e3dc3e3bcef3@suse.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <a769ef28-5794-45a0-bb3f-e3dc3e3bcef3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/9/25 3:15 AM, Jan Beulich wrote:
> On 31.12.2024 19:27, Shawn Anastasio wrote:
>> Xen's memory management APIs map_pages_to_xen, modify_xen_mappings,
>> set_fixmap, ioremap_attr, and __vmap all use an unsigned int to
>> represent architecture-dependent page table entry flags. This assumption
>> does not work on PPC/radix where some flags go past 32-bits, so
>> introduce the pte_attr_t type to allow architectures to opt in to larger
>> types to store PTE flags.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> As iirc Andrew had indicated when suggesting this, what you say for PPC is
> true for x86 as well. Yet still we get around with unsigned int. Hence I
> think the change needs describing differently.
> 

I see what you mean -- I'll reword this to correctly reflect that the
change is not strictly necessary to accomodate architectures with
greater than 32-bit pte flags.

> Jan

Thanks,
Shawn


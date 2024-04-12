Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4268A23DC
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 04:47:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704289.1100607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv6wm-00050s-9j; Fri, 12 Apr 2024 02:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704289.1100607; Fri, 12 Apr 2024 02:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv6wm-0004yI-6f; Fri, 12 Apr 2024 02:47:24 +0000
Received: by outflank-mailman (input) for mailman id 704289;
 Fri, 12 Apr 2024 02:47:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvpr=LR=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rv6wk-0004yC-Mx
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 02:47:22 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb5ee987-f876-11ee-94a3-07e782e9044d;
 Fri, 12 Apr 2024 04:47:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 057348285591;
 Thu, 11 Apr 2024 21:47:20 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Il8aWT3vVW0D; Thu, 11 Apr 2024 21:47:18 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 53C1D82855C0;
 Thu, 11 Apr 2024 21:47:18 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id LG0R5TYFBQA9; Thu, 11 Apr 2024 21:47:17 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id A51FF8285591;
 Thu, 11 Apr 2024 21:47:17 -0500 (CDT)
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
X-Inumbo-ID: fb5ee987-f876-11ee-94a3-07e782e9044d
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 53C1D82855C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1712890038; bh=9CaQmcxSeJrqC/4Yi7BUjqI5TN3iWe3lv35Dy2cMt7s=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=flnOAZHnN84HfdrJjD1eiGXllM88fRPZmkoikvZ2LUkDZdP4WCgSXZOJ08IFgmfvd
	 bkxskDfj3IWuQgQcGPcf6E9hOXdSyKOsXUJrPp9vOhCyfN9lceHShle1nAfcxyzihi
	 r1LLoekjh4iG2Y7Q7OAWKpxKPQnsIi2Z27s21jek=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <cf1a8d28-4f6c-43a2-bece-302f8f9aacc4@raptorengineering.com>
Date: Thu, 11 Apr 2024 21:47:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] xen/ppc: mm-radix: Replace debug printing code
 with printk
To: Jan Beulich <jbeulich@suse.com>
Cc: tpearson@raptorengineering.com, xen-devel@lists.xenproject.org
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <c96e022413f73a531d078db5540a90113e138241.1710443965.git.sanastasio@raptorengineering.com>
 <9d62ae85-87e2-4645-a43d-1a978c8083fc@suse.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <9d62ae85-87e2-4645-a43d-1a978c8083fc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jan,

On 3/25/24 10:29 AM, Jan Beulich wrote:
> On 14.03.2024 23:15, Shawn Anastasio wrote:
>> Now that we have common code building, there's no need to keep the old
>> itoa64+debug print function in mm-radix.c
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Just to clarify: Is this dependent upon any of the earlier patches in this
> series? If not, it could be committed right away.

Sorry for the late reply. You're correct that this patch is not
dependent on any of the other patches in the series, so it can be
committed whenever.

> 
> Jan

Thanks,
Shawn


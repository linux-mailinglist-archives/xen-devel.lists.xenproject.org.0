Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9378D61BA
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 14:29:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733692.1140020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD1ND-0003nU-8e; Fri, 31 May 2024 12:28:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733692.1140020; Fri, 31 May 2024 12:28:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD1ND-0003kI-55; Fri, 31 May 2024 12:28:43 +0000
Received: by outflank-mailman (input) for mailman id 733692;
 Fri, 31 May 2024 12:28:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sD1NC-0003kC-3t
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 12:28:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sD1NB-0007Sw-Ih; Fri, 31 May 2024 12:28:41 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sD1NB-0002p5-AT; Fri, 31 May 2024 12:28:41 +0000
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
	bh=yqvgxQqn4c1Q3YCCWVk16WRDZPJOqFFjQTBiRPKpCqU=; b=sVfTs3L//p1TZx9uXLiBGCiVWv
	TAbloCNn3nRO9JWm+bmABHRhaQfaYi0OI33mCKiG/IXAYRH2PhVu/GldacFlD6OcXkLYCnI5rytzm
	pLjnhZz9sQKcyXxo+MmZnkPcou2SOnktBRaGq1xVB8Cj1ZOP9NxFtZsUvdSn247D6/qs=;
Message-ID: <cc7bb358-d9a1-4284-b51a-07499e225252@xen.org>
Date: Fri, 31 May 2024 13:28:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arch/irq: Make irq_ack_none() mandatory
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20240530184027.44609-1-andrew.cooper3@citrix.com>
 <20240530184027.44609-2-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240530184027.44609-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/05/2024 19:40, Andrew Cooper wrote:
> Any non-stub implementation of these is going to have to do something here.
> 
> irq_end_none() is more complicated and has arch-specific interactions with
> irq_ack_none(), so make it optional.
> 
> For PPC, introduce a stub irq_ack_none().
> 
> For ARM and x86, export the existing {ack,end}_none() helpers, gaining an irq_
> prefix for consisntency with everything else in no_irq_type.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


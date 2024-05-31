Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A83C58D61BB
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 14:30:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733695.1140030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD1OM-0004Ot-HR; Fri, 31 May 2024 12:29:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733695.1140030; Fri, 31 May 2024 12:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD1OM-0004Mj-EJ; Fri, 31 May 2024 12:29:54 +0000
Received: by outflank-mailman (input) for mailman id 733695;
 Fri, 31 May 2024 12:29:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sD1OL-0004Mb-2E
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 12:29:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sD1OK-0007U9-Ev; Fri, 31 May 2024 12:29:52 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sD1OK-0002sI-9E; Fri, 31 May 2024 12:29:52 +0000
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
	bh=VfsZDEwUbCdUOLX6uw2OtqmZ9wf9n6BQe/Wg76+pZFY=; b=bomvM5a9mmcwRohJPa+C4dfg4t
	fODXt5tUTRyR9IKcnXTQz19dIy15eN7X/tD8IxR4S3gMdgUBkeOmg6clzlNT27s3TJZh/QiF8yScG
	ZFrK3CmVH0VKOYZclrr/CdcGQbdVq2J1rAixEZt093cPL2YCfgDOrd8Mbw/LZPr5UCMs=;
Message-ID: <e9409a25-e650-470e-8b9e-b34300ad8d26@xen.org>
Date: Fri, 31 May 2024 13:29:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arch/irq: Centralise no_irq_type
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
 <20240530184027.44609-3-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240530184027.44609-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 30/05/2024 19:40, Andrew Cooper wrote:
> Having no_irq_type defined per arch, but using common callbacks is a mess, and
> particualrly hard to bootstrap a new architecture with.
> 
> Now that the ack()/end() hooks have been exported suitably, move the
> definition of no_irq_type into common/irq.c, and into .rodata for good
> measure.
> 
> No functional change, but a whole lot less tangled.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


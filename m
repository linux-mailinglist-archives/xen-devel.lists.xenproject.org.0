Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FFB639869
	for <lists+xen-devel@lfdr.de>; Sat, 26 Nov 2022 23:21:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448525.705237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oz3WU-0000Nc-F4; Sat, 26 Nov 2022 22:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448525.705237; Sat, 26 Nov 2022 22:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oz3WU-0000K5-C5; Sat, 26 Nov 2022 22:19:46 +0000
Received: by outflank-mailman (input) for mailman id 448525;
 Sat, 26 Nov 2022 22:19:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oz3WT-0000Jz-OE
 for xen-devel@lists.xenproject.org; Sat, 26 Nov 2022 22:19:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oz3WT-0004gv-Il; Sat, 26 Nov 2022 22:19:45 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oz3WT-0002M3-7B; Sat, 26 Nov 2022 22:19:45 +0000
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
	bh=eRS60oFGFi5pf4vDGiKPgDN7+VvXI+dqwYQ4NM8S5HY=; b=xQHAYCrha6jv32TM3dWqpybFSo
	nmjCkSqLn8RAaj8Mw4nNbQz8JsbqYfy9YJHAkeCuEOrZMqd/XHhcW/17dOxCMyDGi7IYDR/v1YmR+
	iFSga+OrNP8NrtBH8r2OzPZfi3duDOpGB2EKx4XiQFsWS9Dma5lvtMujVqgHeFfBhSxA=;
Message-ID: <d7a42f21-6dd3-108e-9278-74d756d941e6@xen.org>
Date: Sat, 26 Nov 2022 22:19:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
To: Per Bilse <per.bilse@citrix.com>, xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <06ad4b3a67a15192fc986b35e3f2fcd35b2f4c2f.1669383767.git.per.bilse@citrix.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] ioreq_broadcast(): accept partial broadcast success
In-Reply-To: <06ad4b3a67a15192fc986b35e3f2fcd35b2f4c2f.1669383767.git.per.bilse@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/11/2022 14:15, Per Bilse wrote:
> A change to XAPI varstored causes

For those unfamiliar with XAPI (like me), can you explain what was the 
change made?

> an unnecessary error message
> to be logged in hypervisor.log whenever an RTC timeoffset update
> is broadcast.
>  In extreme cases this could flood the log file.

Which should be ratelimited as this is using guest error loglevel. But I 
think this is irrelevant here. It would be more relevant to explain why 
it is OK to allow a partial broadcast.

> This patch modifies ioreq_broadcast() to allow partial success.

The commit message is quite vague, so it is hard to know what you are 
trying to solve exactly. AFAIU, there are two reasons for 
ioreq_broadcast to fails:
  1) The IOREQ server didn't register the bufioreq
  2) The IOREQ buffer page is full

While I would agree that the error message is not necessary for 1) (the 
IOREQ server doesn't care about the event), I would disagree for 2) 
because it would indicate something went horribly wrong in the IOREQ 
server and there is a chance your domain may misbehave afterwards.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4444D2045
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 19:30:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287397.487418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nReaj-0001Jj-G1; Tue, 08 Mar 2022 18:29:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287397.487418; Tue, 08 Mar 2022 18:29:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nReaj-0001Hj-Bl; Tue, 08 Mar 2022 18:29:49 +0000
Received: by outflank-mailman (input) for mailman id 287397;
 Tue, 08 Mar 2022 18:29:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nReah-0001Hd-VU
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 18:29:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nReab-0007G5-DD; Tue, 08 Mar 2022 18:29:41 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[10.95.172.145]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nReab-0005zu-5P; Tue, 08 Mar 2022 18:29:41 +0000
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
	bh=s5UqKdjgrMyrK+m2hTM5gbUGSlLhrzWAPN6n+z4EeVo=; b=e49mUC2XqhsPnXPl7k8NI5XBCX
	QXvjry2RZs3cmpS2G3hevO9BgSwEPw8la0WmTwS1VgMcP30hU2M7XQE1TPnPV5zNwqoDU8D16KkWX
	4zQZy2TO+tgEvu8e2mFRbsAi7iktQ7R70atSVoP6MitvQOjypajRE33V6nOTrD3XGK1Q=;
Message-ID: <60744f25-55ff-0a07-bc06-c1a6dc19343e@xen.org>
Date: Tue, 8 Mar 2022 18:29:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 1/3] xen/arm: Add i.MX lpuart driver
To: Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>, "wl@xen.org" <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "van.freenix@gmail.com" <van.freenix@gmail.com>
References: <20220228010711.11566-1-peng.fan@oss.nxp.com>
 <20220228010711.11566-2-peng.fan@oss.nxp.com>
 <16bef21e-42b3-c271-81ab-1d87453a0fdb@xen.org>
 <DU0PR04MB94177B6A7BC34EA6590FF37B88019@DU0PR04MB9417.eurprd04.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DU0PR04MB94177B6A7BC34EA6590FF37B88019@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/02/2022 09:27, Peng Fan wrote:
> Hi Julien,

Hi Peng,

>> Subject: Re: [PATCH 1/3] xen/arm: Add i.MX lpuart driver
>>
>> Hi Peng,
>>
>> On 28/02/2022 01:07, Peng Fan (OSS) wrote:
>>> From: Peng Fan <peng.fan@nxp.com>
>>
>> Can you give me a link to the specification and/or a similar driver in Linux?
> 
> https://www.nxp.com/webapp/Download?colCode=IMX8QMIEC
> Chatper 13.6 Low Power Universal Asynchronous Receiver/
> Transmitter (LPUART)
> But this requires registration to access.
Ok. I think it would still be valuable to add the link of to the spec in 
the commit message.

> 
> Linux driver:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/serial/fsl_lpuart.c

I would also add a link to the Linux code just as a reference (if one 
doesn't want to register).

Cheers,

-- 
Julien Grall


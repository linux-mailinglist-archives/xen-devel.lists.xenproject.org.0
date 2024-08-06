Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4FB948C76
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 11:56:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772689.1183148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbGvl-0006q4-6m; Tue, 06 Aug 2024 09:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772689.1183148; Tue, 06 Aug 2024 09:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbGvl-0006mt-44; Tue, 06 Aug 2024 09:56:37 +0000
Received: by outflank-mailman (input) for mailman id 772689;
 Tue, 06 Aug 2024 09:56:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sbGvj-0006mn-NW
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 09:56:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sbGvi-0002gS-W4; Tue, 06 Aug 2024 09:56:34 +0000
Received: from [15.248.3.88] (helo=[10.24.67.24])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sbGvi-0004OU-Pq; Tue, 06 Aug 2024 09:56:34 +0000
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
	bh=pCDUeCl7JSf1zMFDj8muVFgR+avZxKuB4ubtrhZtYYg=; b=nB6/oQe+PObh4izO54suJwmgea
	f4UsFvTJWqsncUL/8e7/KoexDq6rhUZJM0JnZRI4k/wTqr7Pe192Q7jYzxq0EWlD3KQz/QSvtJxar
	62Um51AoM8nkgPUYvLP5ALkZnNKBIrVY/+vr3Y5iDCcGlnUiq+PYkHKFp6nymHSPL4Pc=;
Message-ID: <8c12dc98-bc9f-49bf-bc18-ddae99fa7312@xen.org>
Date: Tue, 6 Aug 2024 10:56:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: char: omap-uart: add "clock-hz" option
Content-Language: en-GB
To: Amneesh Singh <a-singh21@ti.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240719113313.145587-1-a-singh21@ti.com>
 <b7ef34fe-f6eb-45e8-8f6a-0e2c4bd0175b@xen.org>
 <njlq7laeswww46izwpkzuvnvu3lcycv7kc6dt2urbrpimj6uej@tzjuwwhwwqmp>
From: Julien Grall <julien@xen.org>
In-Reply-To: <njlq7laeswww46izwpkzuvnvu3lcycv7kc6dt2urbrpimj6uej@tzjuwwhwwqmp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/08/2024 10:50, Amneesh Singh wrote:
> On 10:16-20240806, Julien Grall wrote:
>> Hi,
>>
>> On 19/07/2024 12:33, Amneesh Singh wrote:
>>> Quite a few TI K3 devices do not have clock-frequency specified in their
>>> respective UART nodes.
>>
>> Can you outline why fixing the device-tree is not solution?
> Because other frequencies, say 96MHz or 192 MHz are also valid inputs.

Are you saying this is configurable by the user? Or do you mean the 
firmware can configure it?

>>
>>> However hard-coding the frequency is not a
>>   > solution as the function clock input can differ between SoCs.
>>
>> Can you provide some details how Linux is handling those SoCs?
> Yes, like omap-uart under xen, the 8250_omap driver also parses the DT,
> but unlike omap-uart, falls back to clk_get_rate() and if the value is
> still zero, it defaults to 48MHz.

Thanks for the information. Then my next question is why Linux can get 
away with a default value and not Xen?

To give more context, I don't feel it is right to ask the user to 
specify the clock speed. Xen should have a sane default like Linux.

>>
>>> So,
>>> similar to com1/com2, let the user pass the frequency as a dtuart option
>>> via the bootargs. If not specified it will fallback to the same DT
>>> parsing as before. For example, dtuart=serial2:clock-hz=48000000 can be
>>> a valid bootarg.
>>
>> Regardless my questions, any change to the command line needs to be
>> documented in docs/misc/xen-command-line.pandoc.
> I am not sure if that will be necessary as the dtuart option already
> says: "The options are device specific."

Let me ask differently, if you don't document in 
xen-command-line.pandoc, then how do you expect the user to know that 
the option clockspeed exists and what is the expected value?

To me the right place is in xen-command-line.pandoc because it should 
describe all the options (including device specific ones).

Cheers,

-- 
Julien Grall



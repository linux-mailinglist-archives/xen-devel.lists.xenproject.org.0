Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4563D2F8D58
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jan 2021 13:48:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69004.123662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0kzV-00026n-On; Sat, 16 Jan 2021 12:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69004.123662; Sat, 16 Jan 2021 12:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0kzV-00026O-Lp; Sat, 16 Jan 2021 12:47:41 +0000
Received: by outflank-mailman (input) for mailman id 69004;
 Sat, 16 Jan 2021 12:47:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l0kzU-00026J-8J
 for xen-devel@lists.xenproject.org; Sat, 16 Jan 2021 12:47:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0kzQ-0003Cw-Uw; Sat, 16 Jan 2021 12:47:36 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0kzQ-00026U-MJ; Sat, 16 Jan 2021 12:47:36 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=ddzEs/HMAC6HYKga8bDGl14SKrUIOgqRueEHozndPlQ=; b=0oiHvJJeoyySXMHYiaNr5+SNJh
	EBqJBQ/JN3iog8CkFys0dEXvXarN9euO7dMK4pdNcziOpSBF1LUt2NjMbo+mZfSTOm5NVG7W+4djo
	JzuoNaqzw+TxUrFE/zKv2oNBa44iIn+RJtS/xV56ReJfKRJ+Go2+2rmwy5NLkYPYDGBo=;
Subject: Re: IRQ latency measurements in hypervisor
To: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Dario Faggioli <dario.faggioli@suse.com>,
 "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
References: <87pn294szv.fsf@epam.com>
 <alpine.DEB.2.21.2101141515230.31265@sstabellini-ThinkPad-T480s>
 <878s8u43vx.fsf@epam.com>
 <alpine.DEB.2.21.2101151511010.31265@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <36c4f035-2142-d2bd-790a-caf3264107ef@xen.org>
Date: Sat, 16 Jan 2021 12:47:34 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2101151511010.31265@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 15/01/2021 23:17, Stefano Stabellini wrote:
> On Fri, 15 Jan 2021, Volodymyr Babchuk wrote:
>> 9us was in idle state. Interestingly enough, I got latency if 3us while
>> Dom0 was doing some CPU-intensive tasks. So, under load latency is lower
>> than in idle state. I didn't investigated this, so I can't tell you what
>> causes this behavior.
> 
> Did you use vwfi=native? You should definitely be able to see ~3us
> without interference and with 1vCPU <-> 1pCPU

vwfi=native works well in a scenario where each pCPU is dedicated to a 
vCPU. However, if you start to oversubscribe the pCPU, the performance 
are going to degrade quite a lot because there will be less opportunity 
to schedule a different vCPU.

You will also waste quite a bit of pCPU cycles because the vCPU will sit 
doing nothing until the end of its time slice.

Cheers,

-- 
Julien Grall


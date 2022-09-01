Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C895A9314
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 11:27:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396428.636566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTgU3-0002KZ-Sy; Thu, 01 Sep 2022 09:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396428.636566; Thu, 01 Sep 2022 09:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTgU3-0002Hw-QB; Thu, 01 Sep 2022 09:27:35 +0000
Received: by outflank-mailman (input) for mailman id 396428;
 Thu, 01 Sep 2022 09:27:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oTgU2-0002Hq-As
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 09:27:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTgU1-0008U8-S5; Thu, 01 Sep 2022 09:27:33 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.12.167]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTgU1-0001nd-He; Thu, 01 Sep 2022 09:27:33 +0000
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
	bh=lx54AIdaCQA8yNx3PXlyogqS+7PauHF3Hum8ZTPekEI=; b=eFDC3p22pDA6+cJwGAkMlQjrQt
	8he4Gqw51pXB7XVTqTJuPBDihERrtv/F8tgaBW8CeTNKRi+zPpcGG1iWXJi23hcpaP3BFrUEfkyFC
	1IpQsOnNpcFbmliJf2wamLcmJH8/8Oy8B3xRusgrt495jLFLGceAo9ZsvpW0uzxW+L20=;
Message-ID: <bc5ac448-5666-c43f-be06-da9ba1a65336@xen.org>
Date: Thu, 1 Sep 2022 10:27:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH v3 2/7] xen/evtchn: Add an helper to reserve/allocate a
 port
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Stanislav Kinsburskii <staskins@amazon.com>, Julien Grall <jgrall@amazon.com>
References: <cover.1662023183.git.rahul.singh@arm.com>
 <4f8f5abdb7d9dfb241794375d3705524b5b53490.1662023183.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4f8f5abdb7d9dfb241794375d3705524b5b53490.1662023183.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 01/09/2022 10:13, Rahul Singh wrote:
> In a follow-up patch we will want to either reserve or allocate a port
> for various event channel helpers.
> 
> A new wrapper is introduced to either reserve a given port or allocate
> a fresh one if zero.
> 
> Take the opportunity to replace the open-coded version in
> evtchn_bind_virq().
> 
> Signed-off-by: Stanislav Kinsburskii <staskins@amazon.com>

Usually, the "From:" match the first signed-off-by. This is not the case 
here. Can you clarify whether you effectively rewrite the patch or 
simply took it?

If the former, then I would suggest to write: "Based on ..."
If the latter, then please update the "From:".

Cheers,

-- 
Julien Grall


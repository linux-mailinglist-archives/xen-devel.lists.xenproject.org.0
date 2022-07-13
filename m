Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B973F573221
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 11:10:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366313.597059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBYNB-0004D4-J2; Wed, 13 Jul 2022 09:09:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366313.597059; Wed, 13 Jul 2022 09:09:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBYNB-0004AI-G2; Wed, 13 Jul 2022 09:09:33 +0000
Received: by outflank-mailman (input) for mailman id 366313;
 Wed, 13 Jul 2022 09:09:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oBYNA-0004A0-Le
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 09:09:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oBYN9-0007yr-T2; Wed, 13 Jul 2022 09:09:31 +0000
Received: from [54.239.6.184] (helo=[192.168.7.160])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oBYN9-00073A-N6; Wed, 13 Jul 2022 09:09:31 +0000
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
	bh=JBJg4loxW9fQMFNPIoTqiu0K6NxTOmoamH4n3BdPXfw=; b=TzYPpVfKW1a4RLhPs8cMuoXD5n
	Rq/1NHcvL/oyrcCLmSOp1DBVp9PJss7d7vyTi6NU2pn0fMXhC5EjMxRR7pvTZm7lpvxnT5L+aNfvT
	z/HSNkl2ZVVdVMbaXhY/Oj7H5aD3sL+vYvaLp/f2cmoIZN2vEJl3ei8GUiMQbEXWUjoQ=;
Message-ID: <98f7b0fb-770a-6428-3be3-65f776fc9a0b@xen.org>
Date: Wed, 13 Jul 2022 10:09:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v5 1/8] xen/arm: introduce static shared memory
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220620051114.210118-1-Penny.Zheng@arm.com>
 <20220620051114.210118-2-Penny.Zheng@arm.com>
 <45a41132-1520-a894-a9eb-6688c79a660d@xen.org>
 <DU2PR08MB7325C156D4D6D5A2D18E0FF4F7BB9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <9172fc95-0939-3680-94cf-b991c46d0918@xen.org>
 <DU2PR08MB73253B76AB01215366619572F7899@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DU2PR08MB73253B76AB01215366619572F7899@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 13/07/2022 03:42, Penny Zheng wrote:
>>>>
>>>> The Xen doesn't need to handle the optional case.
>>>>
> 
> ... what you suggested here is that during "xen,shared-mem" device tree property
> parsing process, if we find that user doesn't provide physical address, we will output
> an error, saying that it is not supported at the moment, right?

You are correct.

Cheers,

-- 
Julien Grall


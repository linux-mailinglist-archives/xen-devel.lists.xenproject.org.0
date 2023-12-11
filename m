Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFCE80D052
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 16:59:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652348.1018136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCih1-0004Sc-SX; Mon, 11 Dec 2023 15:59:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652348.1018136; Mon, 11 Dec 2023 15:59:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCih1-0004QI-Ps; Mon, 11 Dec 2023 15:59:39 +0000
Received: by outflank-mailman (input) for mailman id 652348;
 Mon, 11 Dec 2023 15:59:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rCih0-0004QC-GB
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 15:59:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rCigz-0007qq-Qx; Mon, 11 Dec 2023 15:59:37 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[10.95.158.169]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rCigz-00056M-Kt; Mon, 11 Dec 2023 15:59:37 +0000
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
	bh=JDALTLNUHOOWl4TmrS/SB86tOCPPNzkrFxf+1wb/W8g=; b=n1SDE2Ix2i8jzJkdULiQToTCqK
	GEJlIwIaXz4/rwuIgSaA9qH5AAY9KLycO0UCHM5F1fN5Lq2qttIsoW1nl+9G9WXCIfWN5MhG4z/P5
	APvEPlIpu2fv5l8sUh+DBm2itNrh7F99LA1U/wdeOt3Ijx+bbp2doPvIHq/OOXWe8PpY=;
Message-ID: <3b3b62a3-0691-4ae7-9234-a8a85516c9eb@xen.org>
Date: Mon, 11 Dec 2023 15:59:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 5/7] xen/arm: traps: add ASSERT_UNREACHABLE() where
 needed
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <394b69b769f2dc2461d2ddb0c7e037f4794eb244.1702283415.git.nicola.vetrini@bugseng.com>
 <08e3c8f0-772e-4c08-9afc-c623f19c85e3@xen.org>
 <c77560d6044700f10a8b149d539a95d1@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c77560d6044700f10a8b149d539a95d1@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicola,

On 11/12/2023 14:54, Nicola Vetrini wrote:
> On 2023-12-11 13:32, Julien Grall wrote:
>> Hi,
>>
>> On 11/12/2023 10:30, Nicola Vetrini wrote:
>>> The branches of the switch after a call to 'do_unexpected_trap'
>>> cannot return, but there is one path that may return, hence
>>> only some clauses are marked with ASSERT_UNREACHABLE().
>> I don't understand why this is necessary. The code should never be 
>> reachable because do_unexpected_trap() is a noreturn().
>>
>> Cheers,
> 
> It was meant as a safeguard against mistakes. 

I am confused about which mistakes you are trying to prevent. Are you 
saying you are not trusting the noreturn attribute?

And if so, are you intending to add ASSERT_UNREACHABLE() after every 
single call to noreturn functions?

> There are MISRA rules that 
> deal with this aspect (e.g., a noreturn function should not return), but 
> they are not in Amendment 2, which is what Xen is following.
Do you mind providing a bit more details about the rules you are talking 
about? At least the numbers would be helpful.

Cheers,

-- 
Julien Grall


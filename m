Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C3E2D0E7D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 11:55:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46222.82011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEAd-00029A-Cd; Mon, 07 Dec 2020 10:55:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46222.82011; Mon, 07 Dec 2020 10:55:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEAd-00028o-9a; Mon, 07 Dec 2020 10:55:07 +0000
Received: by outflank-mailman (input) for mailman id 46222;
 Mon, 07 Dec 2020 10:55:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kmEAb-00028e-4y
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 10:55:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kmEAZ-0005xY-NY; Mon, 07 Dec 2020 10:55:03 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kmEAZ-0005dh-Ek; Mon, 07 Dec 2020 10:55:03 +0000
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
	bh=NnEbqKOdR082NW0t9XwGlGICAQ9n8pOelvEy3ARGAM4=; b=EnlJN2dOBtNox/O5f0saZ6evoi
	qlzgjMIoZ4GNzKJAFBOfqNWlg9siTPnNIJwaub1ezgryKihFJcAISY/TrPcHYgQtVb9PuaRpP37J0
	xrC04R3N9JuvjUF7qpYPJfWy++g7UoSZcKZ/4Df7aXs3bRPKSNrEEoEOSB6zxMWiFrkE=;
Subject: Re: [PATCH v2 7/8] xen/arm: Remove Linux specific code that is not
 usable in XEN
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
 <1d9da8ed4845aeb9e86a5ce6750b811bd7e2020e.1606406359.git.rahul.singh@arm.com>
 <cd74f2a7-7836-ef90-9cd8-857068adb0f5@xen.org>
 <51C0C24A-3CE6-48A3-85F5-14F010409DC3@arm.com>
 <b87e9293-77bb-2c43-63d0-8d54d5fc9a7e@xen.org>
 <0B43914F-93E1-4860-BA45-7E08F817818C@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <72c29861-4e50-dd7d-9986-a84000ece1dd@xen.org>
Date: Mon, 7 Dec 2020 10:55:01 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <0B43914F-93E1-4860-BA45-7E08F817818C@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 07/12/2020 10:36, Rahul Singh wrote:
>> I would implement it in include/xen/compiler.h.
> 
> Ok. I will implement and will share the patch for “__attribute__((__fallthrough__)) ” but for SMMUv3 is that ok if we can proceed with “ /* fallthrough */  ".
The first approach should always be to work with the community to 
introduce such functionality tree-wide. Note that I am not suggesting to 
replace existing "/* fallthrough */" with "fallthrough".

If it is taking too long or the task is significant, then we can discuss 
about way to temporally work around it.

I don't believe we are at that stage yet here.

> As “fallthorugh” implementation is common for all architecture it required review for all stakeholder as per my understanding. I don’t want to block SMMUv3 because of this.

It only requires review from "THE REST" maintainers.

Cheers,

-- 
Julien Grall


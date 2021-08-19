Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A703F1ECB
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 19:11:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169002.308689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGlZU-0000AH-Aj; Thu, 19 Aug 2021 17:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169002.308689; Thu, 19 Aug 2021 17:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGlZU-00007t-7T; Thu, 19 Aug 2021 17:11:16 +0000
Received: by outflank-mailman (input) for mailman id 169002;
 Thu, 19 Aug 2021 17:11:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mGlZS-00007l-Sw
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 17:11:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGlZR-000565-TV; Thu, 19 Aug 2021 17:11:13 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGlZR-0005z5-LQ; Thu, 19 Aug 2021 17:11:13 +0000
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
	bh=iThDMtbvAKmaNNCSXCTXZsfEvjZ9+m9GBO4nARIsLao=; b=oDT9QCysip3cj3BWfFRMpzqNW8
	fxy4m3oUVP4eYoFLBltcteO+uM4EfwGevtVphfD5ZhrndCkYk+DvwzFA49KwEo7ZuN/+ZMnRxxVSV
	D4ZQJpatuYUKen4m8oQacbrduPmlMt+tU0+67QYV/4atALH08mLUF6IxbsXLyY93PdvM=;
Subject: Re: [XEN RFC PATCH 00/40] Add device tree based NUMA support to Arm64
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "jbeulich@suse.com" <jbeulich@suse.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <ff5d713d-02e7-0376-3f3a-053f1b93b98f@xen.org>
 <83288BD9-EADB-45A9-90C1-D1F89F0A21D5@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a733305e-0154-cdc7-639b-69540086fb68@xen.org>
Date: Thu, 19 Aug 2021 18:11:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <83288BD9-EADB-45A9-90C1-D1F89F0A21D5@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 19/08/2021 15:05, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

>> On 19 Aug 2021, at 14:42, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Wei,
>>
>> On 11/08/2021 11:23, Wei Chen wrote:
>>> Xen memory allocation and scheduler modules are NUMA aware.
>>> But actually, on x86 has implemented the architecture APIs
>>> to support NUMA. Arm was providing a set of fake architecture
>>> APIs to make it compatible with NUMA awared memory allocation
>>> and scheduler.
>>> Arm system was working well as a single node NUMA system with
>>> these fake APIs, because we didn't have multiple nodes NUMA
>>> system on Arm. But in recent years, more and more Arm devices
>>> support multiple nodes NUMA system. Like TX2, some Hisilicon
>>> chips and the Ampere Altra.
>>
>> All the platforms you mention here are servers (so mainly ACPI). However, this series is adding DT support.
>>
>> Could you outline the long term plan for DT? Is it going to be used on production HW?
> 
> Yes we are already and will continue to use this on production HW.
> Some embedded hardware will have some usage of NUMA (as some embedded functions do require lots of computing power).

Interesting! Thank you for the clarifications.

> We are doing experiments of that right now using those patches.

Cheers,

-- 
Julien Grall


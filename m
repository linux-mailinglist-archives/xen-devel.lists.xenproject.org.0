Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 231003F1ACB
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 15:42:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168827.308284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGiJM-0001Mm-4Y; Thu, 19 Aug 2021 13:42:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168827.308284; Thu, 19 Aug 2021 13:42:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGiJM-0001Kf-1O; Thu, 19 Aug 2021 13:42:24 +0000
Received: by outflank-mailman (input) for mailman id 168827;
 Thu, 19 Aug 2021 13:42:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mGiJK-0001KZ-Hx
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 13:42:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGiJJ-0000MX-Ng; Thu, 19 Aug 2021 13:42:21 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGiJJ-0001ym-HY; Thu, 19 Aug 2021 13:42:21 +0000
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
	bh=uN3Yz2JUfasxeZpsVtPb5fk0A7iRyX40aNC0cPU/8aw=; b=vW56ITKEyDNkUahnllML3tsaGr
	QpX1LhHlGXdq0QbA4VETIzL0sra2ulbWa8WhVucNeh970AwVM2K/aWr4UNVobLN4FuX5JOK7/rO+X
	eDL4gsRM21k5Bq0m4z9WlRONBXgOvbZoJsKJH8n445IEmuQGSQKy95XpK/jkkmE4eOeA=;
Subject: Re: [XEN RFC PATCH 00/40] Add device tree based NUMA support to Arm64
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ff5d713d-02e7-0376-3f3a-053f1b93b98f@xen.org>
Date: Thu, 19 Aug 2021 14:42:19 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 11/08/2021 11:23, Wei Chen wrote:
> Xen memory allocation and scheduler modules are NUMA aware.
> But actually, on x86 has implemented the architecture APIs
> to support NUMA. Arm was providing a set of fake architecture
> APIs to make it compatible with NUMA awared memory allocation
> and scheduler.
> 
> Arm system was working well as a single node NUMA system with
> these fake APIs, because we didn't have multiple nodes NUMA
> system on Arm. But in recent years, more and more Arm devices
> support multiple nodes NUMA system. Like TX2, some Hisilicon
> chips and the Ampere Altra.

All the platforms you mention here are servers (so mainly ACPI). 
However, this series is adding DT support.

Could you outline the long term plan for DT? Is it going to be used on 
production HW?

Cheers,

-- 
Julien Grall


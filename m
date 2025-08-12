Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A5BB22541
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 13:06:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078637.1439662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulmpX-0004FG-E0; Tue, 12 Aug 2025 11:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078637.1439662; Tue, 12 Aug 2025 11:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulmpX-0004DN-BP; Tue, 12 Aug 2025 11:06:11 +0000
Received: by outflank-mailman (input) for mailman id 1078637;
 Tue, 12 Aug 2025 11:06:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ulmpV-0004DH-KE
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 11:06:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ulmpO-001g6h-33;
 Tue, 12 Aug 2025 11:06:03 +0000
Received: from [2a02:8012:3a1:0:e0a7:2160:d657:5746]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ulmpO-001BqX-2Q;
 Tue, 12 Aug 2025 11:06:02 +0000
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
	bh=JYulpGd8iag5WbECfd6gfoDFyS3bsi1OnfcEwS3z3iU=; b=OqOO339+OM+GaJjTAj0yhIbUvB
	BEAVfEOjvM1nM4S9+hTIMZNI9/FpKsRHKjlsilRm9p09pzH3sJTzQHiin50ZoPKJg8LMyPP8HilUB
	s1v8UavBbXymMWEcQ2QOM7pvMcP9IxgwZzqlQwlky3xqr68zEa/eCia3qiAn7IYJ2cqw=;
Message-ID: <4874f397-b9e6-4740-a3b8-f07b7aa89246@xen.org>
Date: Tue, 12 Aug 2025 12:05:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm: drop assertion from page_is_ram_type()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <804094ae-bb76-4165-9e07-46b775b4b46e@suse.com>
 <86faa2fa-9f23-49a9-a909-a3dd3d5a938f@xen.org>
 <ece155ab-d247-41cb-b3a1-ae4233423cef@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ece155ab-d247-41cb-b3a1-ae4233423cef@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 12/08/2025 07:29, Jan Beulich wrote:
> On 11.08.2025 19:24, Julien Grall wrote:
>> On 11/08/2025 14:01, Jan Beulich wrote:
>>> Its uses in offline_page() and query_page_offline() make it reachable on
>>> Arm, as long as XEN_SYSCTL_page_offline_op doesn't have any Arm-specific
>>> code added. It being reachable was even mentioned in the commit
>>> introducing it, claiming it "clearly shouldn't be called on ARM just
>>> yet".
>>
>> So I agree that the function can be reached. But then I don't think the
>> function can simply return 0.
>>
>> The name is too generic enough that someone may end up to use it in
>> common code and there will be no signal to the user that the function
>> will not properly indicate a RAM page on Arm.
>>
>> I can think of two possible approaches:
>>
>> 1/ Implement properly page_is_ram_type(). We don't have an e820, but we
>> could mimick it using the memory banks we stored.
>> 2/ Rename page_is_ram_type() to page_offlinable() (or similar) so it is
>> clear that the common use is for offlining.
>>
>> The latter might be the simplest.
> 
> I consider page_offlinable() potentially ambiguous: When you offline a PCI
> device, you offline its MMIO as well, for example. Or, much like RAM, some
> page in, say, a video device's framebuffer may have gone bad. One might
> think that such would then also be covered by that function. So minimally
> page_offlinable_ram() or page_is_offlinable_ram(), I think. That would
> then have the benefit of allowing an avenue towards x86 also making its
> checking more precise, as certain RAM ranges can't possibly be offlined.
> If that's fine with you, I can enlarge the patch accordingly.

I would be fine with either name you proposed.

Cheers,

-- 
Julien Grall



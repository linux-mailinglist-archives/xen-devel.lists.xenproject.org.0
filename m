Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 450A7733AF6
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 22:37:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550432.859516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAGCA-0002n8-RG; Fri, 16 Jun 2023 20:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550432.859516; Fri, 16 Jun 2023 20:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAGCA-0002kU-O9; Fri, 16 Jun 2023 20:37:22 +0000
Received: by outflank-mailman (input) for mailman id 550432;
 Fri, 16 Jun 2023 20:37:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qAGC9-0002kO-E7
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 20:37:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qAGC8-0007Dc-Lt; Fri, 16 Jun 2023 20:37:20 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.4.107]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qAGC8-00060Q-Ec; Fri, 16 Jun 2023 20:37:20 +0000
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
	bh=7C8s/62o3UvdoTvj0hJPC2kHTzXj0zeFFIw30Py3mFk=; b=tsdHnLdXcQjGqcqe92pucSs1+R
	EWF5ELYaN98558uqgW/Z4KCApGMm8caHkQp9FJ+7KQAQEpabI3fpFOSZebCue4+ShOFH+OiVwMwsA
	QWfGEkXqDl4a5Kcx4gk8nhpS6fY227/ed2PRoTpak2kbJayhGX7M2fVWEt9W/fyd31mk=;
Message-ID: <33bb42a3-6822-2430-5ec4-3a885c9be2eb@xen.org>
Date: Fri, 16 Jun 2023 21:37:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN v8 1/5] xen/arm: p2m: Use the pa_range_info table to support
 ARM_32 and ARM_64
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230602120754.23817-1-ayan.kumar.halder@amd.com>
 <20230602120754.23817-2-ayan.kumar.halder@amd.com>
 <c48d763b-4b58-69f1-4cce-2f9855aa8ee0@amd.com>
 <e7ffc49f-721a-7397-63bb-465f4c98a4b8@xen.org>
 <9590af0b-e40e-6996-0dc1-00e065d62187@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9590af0b-e40e-6996-0dc1-00e065d62187@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/06/2023 08:59, Michal Orzel wrote:
> Hi Julien,
> 
> On 15/06/2023 22:32, Julien Grall wrote:
>>
>>
>> Hi Michal,
>>
>> I notice you posted some comments but didn't add a Acked-by/Reviewed-by.
>> Can you indicate if you are happy with the patch so long your comments
>> are addressed?
>>
>> If so, are you OK if I deal with them on commit?
> I thought I added my tag but clearly not. With the remarks addressed on commit:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks. The series is now committed.

Cheers,

-- 
Julien Grall


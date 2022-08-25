Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 474F65A13A5
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 16:32:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393442.632399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRDto-0005Cb-CV; Thu, 25 Aug 2022 14:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393442.632399; Thu, 25 Aug 2022 14:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRDto-00059H-95; Thu, 25 Aug 2022 14:32:00 +0000
Received: by outflank-mailman (input) for mailman id 393442;
 Thu, 25 Aug 2022 14:31:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oRDtm-00059B-2y
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 14:31:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oRDtk-00086H-Gp; Thu, 25 Aug 2022 14:31:56 +0000
Received: from [54.239.6.188] (helo=[192.168.11.158])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oRDtk-0002C0-AK; Thu, 25 Aug 2022 14:31:56 +0000
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
	bh=GrjSGEHegGmhgEV2ArvhYIxbRPJYzfXsAF02yXUp4P4=; b=YaDW9Ug/F0MdvVS1pT5RJKHgsQ
	xvcqlvCs3hsFmZJR5AxC9UI8plsyo7BC6N0NdjkxovNMyrbP6DZ+mAy//+sJcS1TOJe7tVRL8vWdV
	emVK8MNd0DkpduuBBpwvIBn6wZZLHh1RcV5egDeHkywuQCeueX1QQ4ck5TZNiiQqoimk=;
Message-ID: <6c14c923-0ab1-5a07-0e3b-4df2956d7ec4@xen.org>
Date: Thu, 25 Aug 2022 15:31:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH v2] Arm32: correct string.h functions for "int" ->
 "unsigned char" conversion
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <8e5df72f-2ed8-3bec-18ff-3da228ab9ee0@suse.com>
 <031ce9f6-ede4-f371-da04-ff8c2df209dc@suse.com>
 <43F406AE-988F-4429-B8CB-F47DBD599B43@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <43F406AE-988F-4429-B8CB-F47DBD599B43@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/08/2022 13:44, Bertrand Marquis wrote:
>> On 24 Aug 2022, at 13:33, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> While Arm64 does so uniformly, for Arm32 only strchr() currently handles
>> this properly. Add the necessary conversion also to strrchr(), memchr(),
>> and memset().
>>
>> As to the placement in memset(): Putting the new insn at the beginning
>> of the function is apparently deemed more "obvious". It could be placed
>> later, as the code reachable without ever making it to the "1" label
>> only ever does byte stores.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

It is now committed.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 764077E7B2B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 11:08:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630083.982776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1ORE-0002e3-7Y; Fri, 10 Nov 2023 10:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630083.982776; Fri, 10 Nov 2023 10:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1ORE-0002bg-4d; Fri, 10 Nov 2023 10:08:32 +0000
Received: by outflank-mailman (input) for mailman id 630083;
 Fri, 10 Nov 2023 10:08:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r1ORC-0002ba-E4
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 10:08:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r1OR8-0001gz-Qh; Fri, 10 Nov 2023 10:08:26 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.18.68]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r1OR8-00069s-Jq; Fri, 10 Nov 2023 10:08:26 +0000
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
	bh=T2vBZ4x+26i9Vnf8G0UbXQfTCIfUBy/50MwHIDuNuMA=; b=LUIeXtC9k73mWz8Hq81SQjM0U4
	3h7fivAHf4uTlevuCrGiXoX2SBSph6OJOCT0lO1T52A+HGkGmWrzZJfr6dsDimRQkJAAqW+5oIbgc
	1eHKDuxfwqi5rMgzd1lByMPITqz7O8hBlYvuTSY6dTrvpA/sNHpSQy+fEAXHLevFiY1A=;
Message-ID: <50ad4fb5-77c4-44f3-80cf-a2555d595e10@xen.org>
Date: Fri, 10 Nov 2023 10:08:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Use hex for bitstream_size as expected by u-boot
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 viryaos-discuss@lists.sourceforge.net
Cc: xen-devel@lists.xenproject.org, brian@woods.art
References: <alpine.DEB.2.22.394.2311091740490.3478774@ubuntu-linux-20-04-desktop>
 <329849be-f2c1-4ca6-8b97-b288d163aeb1@xen.org>
 <dbab3224-a15b-41b4-9a1f-bef4222f3a9d@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <dbab3224-a15b-41b4-9a1f-bef4222f3a9d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/11/2023 10:01, Michal Orzel wrote:
> Hi Julien,
> 
> On 10/11/2023 10:27, Julien Grall wrote:
>>
>>
>> Hi Stefano,
>>
>> On 10/11/2023 01:44, Stefano Stabellini wrote:
>>> Reported-by: Brian Woods <brian@woods.art>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>
>>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>>> index b284887..6e52da5 100755
>>> --- a/scripts/uboot-script-gen
>>> +++ b/scripts/uboot-script-gen
>>> @@ -790,7 +790,7 @@ bitstream_load_and_config()
>>>            check_file_type "$BITSTREAM" "BIT data"
>>>            bitstream_addr=$memaddr
>>>            load_file $BITSTREAM "fpga_bitstream"
>>> -        bitstream_size=$filesize
>>> +        bitstream_size=`printf "0x%X\n" $filesize`
>>
>> Looking at [1], there is no indication that the size parameter for "fpga
>> load" should be hexadecimal. At the contrary, all the example I have
>> found seems to use $filesize.
> U-boot expects size to be passed in hex format. You can see it here:
> https://github.com/u-boot/u-boot/blob/master/cmd/fpga.c#L60C20-L60C27
> 
> Also, AFAICT $filesize var that gets updated after image load (e.g. tftpb) is in hex format.

Hmmm, now that you are saying this... I vaguely recall we had some 
issues in the past with the size. The format was not consistent across 
U-boot.

Maybe this is the same problem here?

[1] https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5759C1B3AB5
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 11:05:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRBJV-0003Wy-9i; Wed, 22 Apr 2020 09:05:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+vI=6G=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jRBJT-0003Wn-Sn
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 09:04:59 +0000
X-Inumbo-ID: 57dc4d86-8478-11ea-9243-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57dc4d86-8478-11ea-9243-12813bfff9fa;
 Wed, 22 Apr 2020 09:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zs3Pw5DcilVBapi9zJ1ao2CuIyx+5LpXrstCOQiZJTQ=; b=2KB6NCl4LyjA8YwfBJsBq4BUjO
 +mQNUrm30/CalGOvtZxscH9ZFC5pmWIn+gWLmz0PViAFnyvSgfZyC+dvJZawTJztBOu5bPkRPpLcn
 6GjHbwPzaGhftgSgKxpIjQsCvcjuDfBn1Dr5drBrh4WYmXgJGTpmgz5BBymCXoGBdLmM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jRBJR-00015r-L3; Wed, 22 Apr 2020 09:04:57 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jRBJR-0006dj-4l; Wed, 22 Apr 2020 09:04:57 +0000
Subject: Re: [PATCH v3 1/2] x86/HVM: expose VM assist hypercall
To: Jan Beulich <jbeulich@suse.com>
References: <cb2dd3ad-2f38-1576-7743-7525e77704b5@suse.com>
 <5ed6b8a1-1f05-c24b-b3a8-d170a315d92a@suse.com>
 <2c5a677e-0327-8924-7ac3-2ae7d673be94@xen.org>
 <e5a28434-d6c9-f920-d8a8-070cb23c62a4@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d3a5ce02-58c1-85e6-9470-eccdfdd8a3ae@xen.org>
Date: Wed, 22 Apr 2020 10:04:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e5a28434-d6c9-f920-d8a8-070cb23c62a4@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 22/04/2020 10:04, Jan Beulich wrote:
> On 22.04.2020 10:57, Julien Grall wrote:
>> On 21/04/2020 15:39, Jan Beulich wrote:
>>> --- a/xen/include/asm-arm/domain.h
>>> +++ b/xen/include/asm-arm/domain.h
>>> @@ -269,6 +269,8 @@ static inline void free_vcpu_guest_conte
>>>      static inline void arch_vcpu_block(struct vcpu *v) {}
>>>    +#define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
>>
>> NIT: Do we want to evaluate d?
> 
> I didn't think we need to, given the very limited use of the
> macro.

Fair point. I thought I would ask just in case.

> 
>> Reviewed-by: Julien Grall <jgrall@amazon.com>
> 
> Thanks.
> 
> Jan
> 

-- 
Julien Grall


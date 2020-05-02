Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 251891C26C6
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 18:10:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUuiF-0001Q8-Qs; Sat, 02 May 2020 16:09:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L6si=6Q=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jUuiE-0001Py-HO
 for xen-devel@lists.xenproject.org; Sat, 02 May 2020 16:09:58 +0000
X-Inumbo-ID: 5e68695e-8c8f-11ea-ae69-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e68695e-8c8f-11ea-ae69-bc764e2007e4;
 Sat, 02 May 2020 16:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sjgRGKeJeHNEvm2DlH6hf3yn/kVQ4Ai7mTa9cxvFe94=; b=2fgUg2DkTSF57YEgShbKnGoC4Q
 fXzcoD/W404cEH+LhTI3RkSAC0mBSmOOsiuX2Y7a7MHn8kpMzyDlPZqCHpQNrCL3PIv1nyxOfbJ6x
 cNzeDDywn5mA2erheJsavrv43bhpqf6zr5iSJK7hTp2dHamlhoWf2VHC9mNwsW49jx6A=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jUuiC-0000tC-OL; Sat, 02 May 2020 16:09:56 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jUuiC-0005Lo-Dw; Sat, 02 May 2020 16:09:56 +0000
Subject: Re: [PATCH v1.1 2/3] xen/sched: fix theoretical races accessing
 vcpu->dirty_cpu
From: Julien Grall <julien@xen.org>
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20200430152848.20275-1-jgross@suse.com>
 <987abb9e-e4f1-1981-595d-0474e91d67f8@xen.org>
 <678d3815-d554-7b92-aa81-908978e2b19b@suse.com>
 <2c72bb17-cf67-a7ce-6dcb-2c3b4d1231e7@xen.org>
Message-ID: <e274cf53-261d-0af5-6d81-2031e70da3e3@xen.org>
Date: Sat, 2 May 2020 17:09:53 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2c72bb17-cf67-a7ce-6dcb-2c3b4d1231e7@xen.org>
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
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 02/05/2020 13:34, Julien Grall wrote:
>>>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>>>> index 195e7ee583..81628e2d98 100644
>>>> --- a/xen/include/xen/sched.h
>>>> +++ b/xen/include/xen/sched.h
>>>> @@ -844,7 +844,7 @@ static inline bool is_vcpu_dirty_cpu(unsigned 
>>>> int cpu)
>>>>   static inline bool vcpu_cpu_dirty(const struct vcpu *v)
>>>>   {
>>>> -    return is_vcpu_dirty_cpu(v->dirty_cpu);
>>>> +    return is_vcpu_dirty_cpu(read_atomic((unsigned int 
>>>> *)&v->dirty_cpu));
>>>
>>> Is the cast necessary?
>>
>> Yes, that was the problem when building for ARM I encountered.
>>
>> read_atomic() on ARM has a local variable of the same type as the
>> read_atomic() parameter for storing the result. Due to the const
>> attribute of v this results in assignment to a read-only variable.
> 
> Doh, we should be able to read from a const value without. So I would 
> argue this is a bug in the read_atomic() implementation on Arm. I will 
> try to come up with a patch.

I have just sent a series [1] to address the issue reported here and a 
few more.

Cheers,

[1] <20200502160700.19573-1-julien@xen.org>

-- 
Julien Grall


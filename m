Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7FE1F774F
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 13:30:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjhso-0007WB-Iu; Fri, 12 Jun 2020 11:30:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kdnc=7Z=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jjhsn-0007S1-Pr
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 11:30:01 +0000
X-Inumbo-ID: 0db0f338-aca0-11ea-b7bb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0db0f338-aca0-11ea-b7bb-bc764e2007e4;
 Fri, 12 Jun 2020 11:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9s6nLu83a31Mn24k92CziNOGaf3LXQklsTVVFdKHZDo=; b=lIJwbc2ijq/xHr8E33YHPL1nb2
 LXUX22UJlWY1kqT4qp4Go3UzG+A+MLUZni8E5ciSjK0t+9D2AMlSSoBByTjrlPbPh0eSIA5OkjL9s
 vKmKznCRcy9bRHHEQcWGEVi7lfi7z9/HJzyS5TkxTq6Sb2gsVXqug8ATQ4yBvi0Pu+DQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjhsk-00081m-Qf; Fri, 12 Jun 2020 11:29:58 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjhsk-0002Pl-Jf; Fri, 12 Jun 2020 11:29:58 +0000
Subject: Re: [RFC PATCH v1 1/6] sched: track time spent in IRQ handler
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "jgross@suse.com" <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-2-volodymyr_babchuk@epam.com>
 <0ce0bbf8-fd15-e87b-727c-56dd7c09cdcb@suse.com>
 <7ec7b6568afb3df41f8407015c198b1ccb341c5b.camel@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <fcedf156-4ed6-c56a-482d-df2f867f7b3e@xen.org>
Date: Fri, 12 Jun 2020 12:29:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <7ec7b6568afb3df41f8407015c198b1ccb341c5b.camel@epam.com>
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "dfaggioli@suse.com" <dfaggioli@suse.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 12/06/2020 12:26, Volodymyr Babchuk wrote:
> Hi Jurgen,
> 
> thanks for the review
> 
> On Fri, 2020-06-12 at 06:36 +0200, Jürgen Groß wrote:
> 
>> On 12.06.20 02:22, Volodymyr Babchuk wrote:
> 
> [...]
> 
>>> +void vcpu_end_irq_handler(void)
>>> +{
>>> +    int delta;
>>> +
>>> +    if (is_idle_vcpu(current))
>>> +        return;
>>> +
>>> +    ASSERT(current->irq_nesting);
>>> +
>>> +    if ( --current->irq_nesting )
>>> +        return;
>>> +
>>> +    /* We assume that irq handling time will not overflow int */
>>
>> This assumption might not hold for long running VMs.
> 
> Basically, this value holds time span between calls to schedule(). This
> variable gets zeroed out every time scheduler requests for time
> adjustment value. So, it should not depend on total VM run time.
This is assuming that the scheduler will be called. With the NULL 
scheduler in place, there is a fair chance this may never be called.

So I think using a 64-bit value is likely safer.

Cheers,

-- 
Julien Grall


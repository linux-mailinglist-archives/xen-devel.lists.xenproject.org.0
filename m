Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 783E819865E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 23:22:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJ1p8-0007EE-QW; Mon, 30 Mar 2020 21:19:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TZrn=5P=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jJ1p6-0007E1-Sp
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 21:19:56 +0000
X-Inumbo-ID: 32ebbe85-72cc-11ea-b9f7-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 32ebbe85-72cc-11ea-b9f7-12813bfff9fa;
 Mon, 30 Mar 2020 21:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+2uTg1xqGaQCJPW0q6ZjQ80XUdQzdE0cy3H5Xiq5dAE=; b=4fSwO8tA6TEfzwk/aTuRzfj6zT
 5+oTe9JQfiKuY0yCBHks/SaFNEDfse34NvUj9lQ2FotTw02iCEiizA0uFvHihNijb/Z3CwhrSf7j5
 48Po64pO9wuE35A77dQNjLlIVeiej+nn0NfhqEswCaO8yDaaR+phQ4KPuCCN36kt6+Us=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJ1p0-000690-JA; Mon, 30 Mar 2020 21:19:50 +0000
Received: from cpc91226-cmbg18-2-0-cust12.5-4.cable.virginm.net ([82.0.29.13]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJ1p0-0004Ka-Cu; Mon, 30 Mar 2020 21:19:50 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
 <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <5deb3992-3cf5-2b00-8cef-af75ed83a1fd@xen.org>
Date: Mon, 30 Mar 2020 22:19:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER
 reads
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Peng Fan <peng.fan@nxp.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Wei Xu <xuwei5@hisilicon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Stefano,

On 30/03/2020 17:35, Stefano Stabellini wrote:
> On Sat, 28 Mar 2020, Julien Grall wrote:
>> qHi Stefano,
>>
>> On 27/03/2020 02:34, Stefano Stabellini wrote:
>>> This is a simple implementation of GICD_ICACTIVER / GICD_ISACTIVER
>>> reads. It doesn't take into account the latest state of interrupts on
>>> other vCPUs. Only the current vCPU is up-to-date. A full solution is
>>> not possible because it would require synchronization among all vCPUs,
>>> which would be very expensive in terms or latency.
>>
>> Your sentence suggests you have number showing that correctly emulating the
>> registers would be too slow. Mind sharing them?
> 
> No, I don't have any numbers. Would you prefer a different wording or a
> better explanation? I also realized there is a typo in there (or/of).
Let me start with I think correctness is more important than speed.
So I would have expected your commit message to contain some fact why 
synchronization is going to be slow and why this is a problem.

To give you a concrete example, the implementation of set/way 
instructions are really slow (it could take a few seconds depending on 
the setup). However, this was fine because not implementing them 
correctly would have a greater impact on the guest (corruption) and they 
are not used often.

I don't think the performance in our case will be in same order 
magnitude. It is most likely to be in the range of milliseconds (if not 
less) which I think is acceptable for emulation (particularly for the 
vGIC) and the current uses.

So lets take a step back and look how we could implement 
ISACTIVER/ICACTIVER correctly.

The only thing we need is a snapshot of the interrupts state a given 
point. I originally thought it would be necessary to use domain_pause() 
which is quite heavy, but I think we only need the vCPU to enter in Xen 
and sync the states of the LRs.

Roughly the code would look like (This is not optimized):

     for_each_vcpu(d, v)
     {
        if ( v->is_running )
          smp_call_function(do_nothing(), v->cpu);
     }

     /* Read the state */

A few remarks:
    * The function do_nothing() is basically a NOP.
    * I am suggesting to use smp_call_function() rather 
smp_send_event_check_cpu() is because we need to know when the vCPU has 
synchronized the LRs. As the function do_nothing() will be call 
afterwards, then we know the the snapshot of the LRs has been done
    * It would be possible to everything in one vCPU.
    * We can possibly optimize it for the SGIs/PPIs case

This is still not perfect, but I don't think the performance would be 
that bad.

Cheers,

-- 
Julien Grall


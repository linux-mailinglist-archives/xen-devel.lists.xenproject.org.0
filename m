Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F38F6209BDF
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 11:25:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joO7o-0007ve-Bm; Thu, 25 Jun 2020 09:24:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhxS=AG=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1joO7n-0007vZ-Cg
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 09:24:51 +0000
X-Inumbo-ID: b86fbe06-b6c5-11ea-818b-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b86fbe06-b6c5-11ea-818b-12813bfff9fa;
 Thu, 25 Jun 2020 09:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uT8yp1vueWRxG+AUh0WvEoJgInnLT9zSJamoBslAAjo=; b=P8PuKnNF7A7p9UXvZKI/BUGisq
 1FX7DwSJSjkG8tWGu+ox2znjZhRbhF46kkfx+JWEnPPtDaJ4pNDv1ad3ZJqM1YKMoKznP/e9TB1BY
 LcO1ZHhmDmlrs+rlQKOQy/JLPdkTfbbje7MFS0KtiBcd/GLRNrZp/zplG0vkmndG45pc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1joO7k-0002sm-RQ; Thu, 25 Jun 2020 09:24:48 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1joO7k-0006rT-KJ; Thu, 25 Jun 2020 09:24:48 +0000
Subject: Re: [PATCH for-4.14] mm: fix public declaration of struct
 xen_mem_acquire_resource
To: Jan Beulich <jbeulich@suse.com>
References: <20200623135246.66170-1-roger.pau@citrix.com>
 <50e25ef7-e7a7-d2c1-5f78-ce32cae35f38@suse.com>
 <20200623155609.GS735@Air-de-Roger>
 <da8d4d26-0524-1d77-8516-e986dd0affaa@suse.com>
 <20200623172652.GU735@Air-de-Roger>
 <24d35c4d-e2b3-1f58-4c6e-71072de01b74@suse.com>
 <04410978-33bf-dedf-7401-248b1a038a9c@xen.org>
 <60ac0a67-1448-4b39-4489-42dc008b6355@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e05c30c2-f8a7-4a2e-8d33-4d1b7c314bb4@xen.org>
Date: Thu, 25 Jun 2020 10:24:45 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <60ac0a67-1448-4b39-4489-42dc008b6355@suse.com>
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
 paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 24/06/2020 15:01, Jan Beulich wrote:
> On 24.06.2020 15:41, Julien Grall wrote:
>> On 24/06/2020 11:12, Jan Beulich wrote:
>>> On 23.06.2020 19:26, Roger Pau Monné wrote:
>>>> I'm confused. Couldn't we switch from uint64_aligned_t to plain
>>>> uint64_t (like it's currently on the Linux headers), and then use the
>>>> compat layer in Xen to handle the size difference when called from
>>>> 32bit environments?
>>>
>>> And which size would we use there? The old or the new one (breaking
>>> future or existing callers respectively)? Meanwhile I think that if
>>> this indeed needs to not be tools-only (which I still question),
>>
>> I think we now agreed on a subthread that the kernel needs to know the
>> layout of the hypercall.
>>
>>> then our only possible route is to add explicit padding for the
>>> 32-bit case alongside the change you're already making.
>>
>> AFAICT Linux 32-bit doesn't have this padding. So wouldn't it make
>> incompatible the two incompatible?
> 
> In principle yes. But they're putting the structure instance on the
> stack, so there's not risk from Xen reading 4 bytes too many. I'd
> prefer keeping the interface as is (i.e. with the previously
> implicit padding made explicit) to avoid risking to break other
> possible callers. But that's just my view on it, anyway ...

It makes sense to me. As Roger said, we would also want to update the 
Linux kernel header for future release.

Cheers,

-- 
Julien Grall


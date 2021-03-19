Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5CF3419EF
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 11:27:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99164.188383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNCM8-00063E-4u; Fri, 19 Mar 2021 10:27:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99164.188383; Fri, 19 Mar 2021 10:27:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNCM8-00062o-1Z; Fri, 19 Mar 2021 10:27:48 +0000
Received: by outflank-mailman (input) for mailman id 99164;
 Fri, 19 Mar 2021 10:27:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lNCM6-00062d-If
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 10:27:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lNCM3-0000pM-R1; Fri, 19 Mar 2021 10:27:43 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lNCM3-0004u6-IU; Fri, 19 Mar 2021 10:27:43 +0000
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
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=+W4oxHwqzy81FKgupvP4mnRf46K3U1wqhmvHgeweaSk=; b=VPSQi0WQiTgKc+hoHP3J730Z6D
	dNwPVKAkm6zTkR5iGIjlM1FkTCbrhk3ZT/xg/atq1OAYys+yL6tffnwRhsMsdv6cqbx9Fii3GpAAD
	zbAPXWhzUJwTsQw86Ild78G51pnFtvw2hfVNYWWVNMwjBTRC7luQrlSFSqXOsvps0ozM=;
Subject: Re: preparations for 4.13.3
From: Julien Grall <julien@xen.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <5373f9d5-fc03-1967-8181-d77bbdaf25b9@suse.com>
 <b82a0932-761d-662c-baa4-59c4801ad5c8@xen.org>
Message-ID: <11f8d1e6-15b2-1fa2-2f50-a30df2fb1a24@xen.org>
Date: Fri, 19 Mar 2021 10:27:41 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b82a0932-761d-662c-baa4-59c4801ad5c8@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Stefano,

Gentle ping. On IRC, Jan pointed out that he would like to realize the 
4.13.3 pretty soon.

Cheers,

On 13/03/2021 15:29, Julien Grall wrote:
> Hi Jan & Stefano,
> 
> On 08/03/2021 09:49, Jan Beulich wrote:
>> All,
>>
>> the release is overdue (my apologies). Please point out backports
>> you find missing from the respective staging branches, but which
>> you consider relevant.
>> > Ones that I have queued already, but which hadn't passed the push
>> gate to master yet when doing a swipe late last week, are
>>
>> c6ad5a701b9a crypto: adjust rijndaelEncrypt() prototype for gcc11
>> 9318fdf757ec x86/shadow: suppress "fast fault path" optimization 
>> without reserved bits
>> 60c0444fae21 x86/shadow: suppress "fast fault path" optimization when 
>> running virtualized
> 
> I would like to also consider the following one:
> 
> 28804c0ce9fd SUPPORT.MD: Clarify the support state for the Arm SMMUv{1, 
> 2} drivers (4.11+ as updating the security support)
> 067935804a8e xen/vgic: Implement write to ISPENDR in vGICv{2, 3} (4.13+)
>      To support newer kernel on stable Xen
> d81133d45d81 xen/arm: Add workaround for Cortex-A53 erratum #843419 (4.13+)
> fd7479b9aec2 xen/arm: Add workaround for Cortex-A55 erratum #1530923 
> (4.13+)
> 5505f5f8e7e8 xen/arm: Add Cortex-A73 erratum 858921 workaround (4.13+)
> 63b4c9bfb788 xen/arm: mm: Access a PT entry before the table is unmapped 
> (4.13 only)
> f6790389613c xen/arm: sched: Ensure the vCPU context is seen before 
> vcpu_pause() returns (4.13 only)
> 
> I have put in parentheses the list of versions targeted.
> 
> Cheers,
> 

-- 
Julien Grall


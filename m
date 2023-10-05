Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECB57B9D3B
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 15:13:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612997.953226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoO9U-0000RH-Pf; Thu, 05 Oct 2023 13:12:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612997.953226; Thu, 05 Oct 2023 13:12:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoO9U-0000Oj-Mv; Thu, 05 Oct 2023 13:12:28 +0000
Received: by outflank-mailman (input) for mailman id 612997;
 Thu, 05 Oct 2023 13:12:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qoO9S-0000Ob-JN
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 13:12:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qoO9R-0004so-7q; Thu, 05 Oct 2023 13:12:25 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qoO9R-0004mX-1W; Thu, 05 Oct 2023 13:12:25 +0000
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
	bh=Osm9Sthp99WO4DTrw9DszrFaafNqoerBI4/f/f5omKs=; b=6H/Mz3kOqnalG2fm2e/zCIxoYa
	7qyIy+djq387JeDgm7J3Sxp21x7W7cJ6o7f80OOBjnyMz1cMuPrJpJHw46gA6bnUVStHU4oU+o2/A
	3D9QbJRsd0t8qlUujZvUxKOjlIsr+iqaydngFtFGSFvV03cXHB/AmJQbRogNis7GqwU0=;
Message-ID: <83378352-097f-4edc-9394-698cdb66bec7@xen.org>
Date: Thu, 5 Oct 2023 14:12:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/10] runstate/time area registration by (guest)
 physical address
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20231002151127.71020-1-roger.pau@citrix.com>
 <4F5568FE-DE94-4F19-9F17-BF251E1F6716@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4F5568FE-DE94-4F19-9F17-BF251E1F6716@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/10/2023 02:27, Henry Wang wrote:
> Hi Roger,
> 
>> On Oct 2, 2023, at 23:11, Roger Pau Monne <roger.pau@citrix.com> wrote:
>>
>> Since it was indicated that introducing specific new vCPU ops may be
>> beneficial independent of the introduction of a fully physical-
>> address-based ABI flavor, here we go. There continue to be a few open
>> questions throughout the series, resolving of which was one of the main
>> goals of the earlier postings.
>>
>> v5 adds one vm-fork specific pre-patch that does simply the introduced
>> code later on.  It does also fix a vm-fork bug.
>>
>> Patches 1 and 6 are missing and Ack from the mem-sharing maintainer.
>>
>> Whole series will need a Release-Ack.
> 
> We agreed in [1] that this series is a good candidate for 4.18, so for the whole
> series,
> 
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

I have now committed the series.

Cheers,

-- 
Julien Grall


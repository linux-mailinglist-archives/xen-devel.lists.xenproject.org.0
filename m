Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C80631D812
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 12:22:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86213.161670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCKtc-0004Ii-9j; Wed, 17 Feb 2021 11:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86213.161670; Wed, 17 Feb 2021 11:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCKtc-0004IJ-6B; Wed, 17 Feb 2021 11:21:28 +0000
Received: by outflank-mailman (input) for mailman id 86213;
 Wed, 17 Feb 2021 11:21:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lCKta-0004IC-4d
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 11:21:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCKtZ-0001YV-48; Wed, 17 Feb 2021 11:21:25 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCKtY-0007sS-R9; Wed, 17 Feb 2021 11:21:24 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Khun2zGuAGcEpvtr5KfIBZmX2CJvevecPfohkAT+DxI=; b=0ukaaQMSOoXI29xQwOUOlA9OTK
	xZwj2BI0i8mflLIgrz15cbvvltIo9laVFYkE4swKwjRyWK5wOlMVJf4j8xX0y/ywZwQr/Yc06xG2/
	kr9ZBBXQH8N3kOqkS1xA2HOePM+U0GZ19rVEtakGKO4K+V5nJ3gnpE7oCQea3XOH1PU0=;
Subject: Re: [for-4.15][PATCH v2 1/5] xen/x86: p2m: Don't map the special
 pages in the IOMMU page-tables
To: Jan Beulich <jbeulich@suse.com>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210209152816.15792-1-julien@xen.org>
 <20210209152816.15792-2-julien@xen.org>
 <d2485d44-180e-499c-d917-80da3486d98e@suse.com>
 <797ac673-9c7b-ff39-1266-94c96bde0f26@xen.org>
 <d394dc9c-d02c-f24a-7414-ec626ac5e82b@suse.com>
 <4ddf0f24-0379-e724-84e1-9b296167e000@xen.org>
 <237bb7b8-038e-4f10-98e8-559edc764f59@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <83fe56bc-42e7-68a0-c2e9-8bef7e412062@xen.org>
Date: Wed, 17 Feb 2021 11:21:22 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <237bb7b8-038e-4f10-98e8-559edc764f59@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 15/02/2021 13:14, Jan Beulich wrote:
> On 15.02.2021 13:54, Julien Grall wrote:
>> On 15/02/2021 12:36, Jan Beulich wrote:
>>> On 15.02.2021 12:38, Julien Grall wrote:
>>>> Given this series needs to go in 4.15 (we would introduce a 0-day
>>>> otherwise), could you clarify whether your patch [1] is intended to
>>>> replace this one in 4.15?
>>>
>>> Yes, that or a cut down variant (simply moving the invocation of
>>> set_mmio_p2m_entry()). The more that there the controversy
>>> continued regarding the adjustment to p2m_get_iommu_flags(). I
>>> did indicate there that I've dropped it for v2.
>>
>> Do you have a link to v2? I would like to try with my series.
> 
> I didn't post it yet, as I didn't consider the v1 discussion
> settled so far. The intermediate version I have at present is
> below.

Thanks! I will drop patch #1 from my series and resend it.

Cheers,

-- 
Julien Grall


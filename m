Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBDA3BE87C
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 14:59:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152175.281148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m179F-0000Bj-J1; Wed, 07 Jul 2021 12:59:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152175.281148; Wed, 07 Jul 2021 12:59:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m179F-00008o-Fq; Wed, 07 Jul 2021 12:59:29 +0000
Received: by outflank-mailman (input) for mailman id 152175;
 Wed, 07 Jul 2021 12:59:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m179E-00008i-5G
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 12:59:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m179C-0003ol-K4; Wed, 07 Jul 2021 12:59:26 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m179C-0006xY-Dd; Wed, 07 Jul 2021 12:59:26 +0000
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
	bh=APBRZIcZ1sFqieUZbFSvA+swlopjorMydYJES25crnI=; b=p41d/j07XwbP5fHg1A4vcERweX
	UbHcBotirUynDzhhzvkeyAcVDgEU7XrCv3Nr0FPhinJHfb7VtjepaYwSkALNA5hh5SDaTH8NnaUOh
	eAzpVtYwQgj/MpHSW+Y3PTbpnMgBWc/vcfoQx/cGmcjNHSWYsXnTQIycwHPIxkX1IM/A=;
Subject: Re: [PATCH] tools/libxc: use uint32_t for pirq in
 xc_domain_irq_permission
To: Jan Beulich <jbeulich@suse.com>
Cc: iwj@xenproject.org, wl@xen.org, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, sstabellini@kernel.org, jgross@suse.com,
 christian.lindig@citrix.com, dave@recoil.org,
 xen-devel@lists.xenproject.org, Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1625619764-23537-1-git-send-email-igor.druzhinin@citrix.com>
 <b1720313-d636-9c8c-3109-748dbe311187@xen.org>
 <5e454ba6-3d3f-9402-140d-f576f9124402@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <927c1c59-734a-4013-9286-137fd7026c26@xen.org>
Date: Wed, 7 Jul 2021 13:59:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5e454ba6-3d3f-9402-140d-f576f9124402@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 07/07/2021 13:54, Jan Beulich wrote:
> On 07.07.2021 14:51, Julien Grall wrote:
>> On 07/07/2021 02:02, Igor Druzhinin wrote:
>>> Current unit8_t for pirq argument in this interface is too restrictive
>>> causing failures on modern hardware with lots of GSIs. That extends down to
>>> XEN_DOMCTL_irq_permission ABI structure where it needs to be fixed up
>>> as well. Internal Xen structures appear to be fine. Existing users of
>>> the interface in tree (libxl, ocaml and python bindings) are already using
>>> int for pirq representation that should be wide enough.
>>
>> By "int", I am assuming you imply "signed int", is that correct?
>>
>> If so, should the function xc_domain_irq_permission() interface take an
>> int in parameter and check it is not negative?
> 
> Please let's not make things worse than they are, the more that

Well, what I am trying to prevent is surprise where the caller 
mistakenly pass a negative value that will be interpreted as a positive 
value...

Such issues are beyong annoying to debug...

 > ./CODING_STYLE is unambiguous in cases like this one.

Hmmm... The coding style mention the fixed size but nothing about the 
signedness of the type...

The alternative suggestion is to keep a unsigned type but check the bit 
31 is not set.

Cheers,

-- 
Julien Grall


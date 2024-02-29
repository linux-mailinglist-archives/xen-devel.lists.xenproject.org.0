Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFB886CAF7
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 15:09:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687159.1070149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfh5X-0004et-SW; Thu, 29 Feb 2024 14:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687159.1070149; Thu, 29 Feb 2024 14:08:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfh5X-0004ca-Po; Thu, 29 Feb 2024 14:08:43 +0000
Received: by outflank-mailman (input) for mailman id 687159;
 Thu, 29 Feb 2024 14:08:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rfh5X-0004cU-57
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 14:08:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfh5V-0005vn-3H; Thu, 29 Feb 2024 14:08:41 +0000
Received: from [15.248.3.86] (helo=[10.45.19.50])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfh5U-00070p-Tj; Thu, 29 Feb 2024 14:08:41 +0000
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
	bh=ZhEVV07QhjmW4WPBcBjiExgQDTWwxdqTGeVErWPEgWw=; b=niGBEgUc7WGTscn4OC4DnaF0H3
	0PZeqX5NLFQyMJ1ueqrRzm3jaf13I/aT6+EdrLIuTHQowux3/9EIgkI8uLVmaOX1kU4UIPPuuZtmO
	D2wx4FiAIAKK+BHJZ+ddrgeGQjI+C0lKjDsP6STUuksqcxnAPkmk0JPMtb0xu6cQcMec=;
Message-ID: <d8e29575-9cca-4a08-9deb-03c0b1ade9d7@xen.org>
Date: Thu, 29 Feb 2024 14:08:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/23] xen/asm-generic: introduce generic fls() and
 flsl() functions
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <df7ab5055ef08fa595f913072302770a3f6a5c33.1708962629.git.oleksii.kurochko@gmail.com>
 <e22ca712-b8cf-4bc9-87df-22cbd7819733@xen.org>
 <654620c6-731a-4a91-8f1c-72961191dff1@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <654620c6-731a-4a91-8f1c-72961191dff1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 29/02/2024 14:03, Jan Beulich wrote:
> On 29.02.2024 14:54, Julien Grall wrote:
>> On 26/02/2024 17:38, Oleksii Kurochko wrote:
>>> These functions can be useful for architectures that don't
>>> have corresponding arch-specific instructions.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>>    Changes in V5:
>>>      - new patch
>>> ---
>>>    xen/include/asm-generic/bitops/fls.h  | 18 ++++++++++++++++++
>>>    xen/include/asm-generic/bitops/flsl.h | 10 ++++++++++
>>
>> One header per function seems a little bit excessive to me. Do you have
>> any pointer where this request is coming from?
> 
> That's in an attempt to follow Linux'es way of having this, aiui. This way
> an arch can mix and match header inclusions and private definitions without
> any #ifdef-ary.

Ok. I am not going to oppose it if the goal is to keep the headers in 
sync with Linux.

Although, it might have been useful to mention it in the commit message.

Cheers,

-- 
Julien Grall


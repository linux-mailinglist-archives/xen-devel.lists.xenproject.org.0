Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB60575655A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 15:46:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564577.882096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLOXv-0004uQ-9T; Mon, 17 Jul 2023 13:45:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564577.882096; Mon, 17 Jul 2023 13:45:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLOXv-0004sP-6a; Mon, 17 Jul 2023 13:45:51 +0000
Received: by outflank-mailman (input) for mailman id 564577;
 Mon, 17 Jul 2023 13:45:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qLOXt-0004sF-Qy
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 13:45:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLOXt-0007Ro-37; Mon, 17 Jul 2023 13:45:49 +0000
Received: from [54.239.6.185] (helo=[192.168.23.25])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLOXs-0000gJ-Qz; Mon, 17 Jul 2023 13:45:48 +0000
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
	bh=FLR4dplDpUC6ZXveFYhYw5cA7ylv9KJfGNAf6Xjr5bU=; b=6PzeuLG4mCBLGLOEChR3hclCgm
	ZDu7+yeuhLd5yhQSnrqTzMxPZg4ABnT1Y9diFPVhlEkmPu4H1d++5AomE1giwqBb6J2TE9Gl91bkC
	jRlkJBN51282YH8i3bAVXXvI9gqPmichEpA5SxPKPQ8qaPzahXDkKEGlGhhjOY9RZwMw=;
Message-ID: <47629f09-92ef-24e5-365e-0d1b8f723bd2@xen.org>
Date: Mon, 17 Jul 2023 14:45:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [RFC PATCH 2/4] xen/arm64: bitops: justify uninitialized variable
 inside a macro
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
 "ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
 <d06a312944bee7457fa2ac75e0cfef20f0ec430f.1689329728.git.nicola.vetrini@bugseng.com>
 <d1ccb5e1-d122-88df-e46a-39494b6d6d12@xen.org>
 <299D0BAE-D15E-4260-AF3E-8D84CF058083@arm.com>
 <528fb310-f469-e449-d1c3-269fa7dec750@xen.org>
 <2bc64be1-10c0-d064-a5a2-1f076b596e6e@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2bc64be1-10c0-d064-a5a2-1f076b596e6e@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17/07/2023 13:16, Nicola Vetrini wrote:
> 
> 
> On 16/07/23 18:50, Julien Grall wrote:
>> Hi,
>>
>> On 16/07/2023 10:20, Luca Fancellu wrote:
>>>> On 14 Jul 2023, at 14:05, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 14/07/2023 12:49, Nicola Vetrini wrote:
>>>>> The macro 'testop' expands to a function that declares the local
>>>>> variable 'oldbit', which is written before being set, but is such a
>>>>> way that is not amenable to automatic checking.
>>>>
>>>> The code is pretty straightforward. So I am not entirely sure why 
>>>> Eclair is not happy. Is it because the value is set by assembly code?
> 
> Exactly.

I am a bit puzzled. There are other values read from assembly (e.g. 
READ_SYSREG(), read_atomic()) within Xen. This is including 'res' in the 
same function. So can you elaborate, why 'oldbit' is a problem but not 
the others?

Cheers,

-- 
Julien Grall


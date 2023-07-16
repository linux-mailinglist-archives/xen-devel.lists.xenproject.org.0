Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26133754FDE
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jul 2023 18:52:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564117.881397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qL4xO-0001uf-Cg; Sun, 16 Jul 2023 16:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564117.881397; Sun, 16 Jul 2023 16:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qL4xO-0001sz-9Y; Sun, 16 Jul 2023 16:50:50 +0000
Received: by outflank-mailman (input) for mailman id 564117;
 Sun, 16 Jul 2023 16:50:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qL4xN-0001st-I0
 for xen-devel@lists.xenproject.org; Sun, 16 Jul 2023 16:50:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qL4xM-0008Al-IH; Sun, 16 Jul 2023 16:50:48 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qL4xM-0002qK-9U; Sun, 16 Jul 2023 16:50:48 +0000
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
	bh=ItGT6v8bVkITgc4WS/g5tFMZBIepdldn/F9rCI8F0ks=; b=PBp+zPDZe7kIQGfXtjQVazaofs
	cr4c5oIFcI/6L1j6x8fqVCsbbaXrQHeCimqufXJJyhPFHsx/0IOVLf7Zx+m8qoap/V8+L2FUuKuhj
	sj4hY7RHDZjsw8qUPzd5cK7lMgHcb3JbwlCnY6knR+qXpCXJ80ISgFwhwXDMFUhxpzDs=;
Message-ID: <528fb310-f469-e449-d1c3-269fa7dec750@xen.org>
Date: Sun, 16 Jul 2023 17:50:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 2/4] xen/arm64: bitops: justify uninitialized variable
 inside a macro
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <299D0BAE-D15E-4260-AF3E-8D84CF058083@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 16/07/2023 10:20, Luca Fancellu wrote:
>> On 14 Jul 2023, at 14:05, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 14/07/2023 12:49, Nicola Vetrini wrote:
>>> The macro 'testop' expands to a function that declares the local
>>> variable 'oldbit', which is written before being set, but is such a
>>> way that is not amenable to automatic checking.
>>
>> The code is pretty straightforward. So I am not entirely sure why Eclair is not happy. Is it because the value is set by assembly code?
> 
> Hi Julien,
> 
> Yes I agree that it’s strange, do you think that that if at line 97 we initialize oldbit to zero, it would solve the issue?

At the moment, I am not entirely happy to zero oldbit because we have 
other places in Xen where we need assembly instructions to read a value 
(e.g. READ_SYSREG()).

So I would first like to understand why Eclair can't cope with it.

Cheers,

-- 
Julien Grall


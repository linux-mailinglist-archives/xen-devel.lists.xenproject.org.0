Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44410756E81
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 22:45:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564843.882567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLV5u-0008Hm-GJ; Mon, 17 Jul 2023 20:45:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564843.882567; Mon, 17 Jul 2023 20:45:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLV5u-0008Fl-Dk; Mon, 17 Jul 2023 20:45:22 +0000
Received: by outflank-mailman (input) for mailman id 564843;
 Mon, 17 Jul 2023 20:45:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qLV5s-0008Ff-SN
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 20:45:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLV5r-0002mv-Gf; Mon, 17 Jul 2023 20:45:19 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLV5r-00074R-Ao; Mon, 17 Jul 2023 20:45:19 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=8rXnZt+NJdqovxuQinuh1Jwi84LtZoiCAQgyn3qV8sQ=; b=M3aHOE127H/+MKwGEeUlLt0dyd
	LhSR7FNd8pvRbEIVvyXV/S2McQRVNS/nnijVWBW06VuKVB6gdMsjCbEmRi9S0/YZggYfNJbE3uMDJ
	3JhqLGiU6V2aWYpJGtaRgr4HTre1C3CV7C6YSnkSMStl+tlgXI7DL6jxVds8gywo80ZU=;
Message-ID: <8617ddae-02f6-981f-73fc-50be2e24ea64@xen.org>
Date: Mon, 17 Jul 2023 21:45:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 2/4] xen/arm64: bitops: justify uninitialized variable
 inside a macro
From: Julien Grall <julien@xen.org>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
 <d06a312944bee7457fa2ac75e0cfef20f0ec430f.1689329728.git.nicola.vetrini@bugseng.com>
 <76cb0f23-ebcb-2c51-2312-c926b0d6d570@xen.org>
In-Reply-To: <76cb0f23-ebcb-2c51-2312-c926b0d6d570@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/07/2023 21:40, Julien Grall wrote:
> On 14/07/2023 12:49, Nicola Vetrini wrote:
>> The macro 'testop' expands to a function that declares the local
>> variable 'oldbit', which is written before being set, but is such a
>> way that is not amenable to automatic checking.
>>
>> Therefore, a deviation comment, is introduced to document this situation.
>>
>> A similar reasoning applies to macro 'guest_testop'.
> 
> Would you be able to check if the code below (only compile tested so 
> far) would silence Eclair?

Hmmm.. I think my e-mail client mangled the diff. Here an unmangled 
version if needed:

http://paste.debian.net/1286154/

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FB66510CF
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 17:58:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466260.725133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7JSb-0001Gy-KR; Mon, 19 Dec 2022 16:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466260.725133; Mon, 19 Dec 2022 16:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7JSb-0001F0-H8; Mon, 19 Dec 2022 16:57:53 +0000
Received: by outflank-mailman (input) for mailman id 466260;
 Mon, 19 Dec 2022 16:57:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p7JSa-0001Eu-3n
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 16:57:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7JSZ-00057V-TK; Mon, 19 Dec 2022 16:57:51 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.8.73])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7JSZ-0006aj-OD; Mon, 19 Dec 2022 16:57:51 +0000
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
	bh=8v3nXT1Y1o6GAu4MAikm3tc28LYhYH3cjVtHuJtvXgA=; b=xs2MWsZmxND+9glK0WH7l9mufb
	1S/ka0FZCqAU8p9S1Hc2VJJqVHGsKzywxiiabYkw/dQjjsngUSx7uE+Vyy/abooDQRJqlT/ej6Few
	7iap5QoUwZMVUd4Dnjabpo9aW6PNMlzWN/MhABjhnptoh8tVvjUxhSjgAJ3ZI5ITSHfA=;
Message-ID: <78f8b94f-7a60-8739-cd3b-e2ce28ca9e3d@xen.org>
Date: Mon, 19 Dec 2022 16:57:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2 3/3] x86/ucode: load microcode earlier on boot CPU
Content-Language: en-US
To: Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20221219144533.19836-1-sergey.dyasli@citrix.com>
 <20221219144533.19836-4-sergey.dyasli@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221219144533.19836-4-sergey.dyasli@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sergey,

On 19/12/2022 14:45, Sergey Dyasli wrote:
> Call early_microcode_init() straight after multiboot modules become
> accessible. Modify it to load the ucode directly from the blob bypassing
> populating microcode_cache because xmalloc is still not available at
> that point during Xen boot.
> 
> Introduce early_microcode_init_cache() for populating microcode_cache.
> It needs to rescan the modules in order to find the new virtual address
> of the ucode blob because it changes during the boot process, e.g.
> from 0x00000000010802fc to 0xffff83204dac52fc.
> 
> While at it, drop alternative_vcall() from early_microcode_init() since
> it's not useful in an __init fuction.

Can you explain in the commit message why you need to load the microcode 
early? E.g. is it a nice feature to have or a real issue?

If the latter, then I think we will need to consider the patches for 
backport.

Cheers,

-- 
Julien Grall


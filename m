Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FFF4BEA52
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 20:13:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276419.472573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nME7q-0007qa-9P; Mon, 21 Feb 2022 19:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276419.472573; Mon, 21 Feb 2022 19:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nME7q-0007ok-5R; Mon, 21 Feb 2022 19:13:34 +0000
Received: by outflank-mailman (input) for mailman id 276419;
 Mon, 21 Feb 2022 19:13:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nME7o-0007oe-Po
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 19:13:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nME7m-0004mf-OK; Mon, 21 Feb 2022 19:13:30 +0000
Received: from [54.239.6.189] (helo=[192.168.5.64])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nME7m-0004Ps-I0; Mon, 21 Feb 2022 19:13:30 +0000
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
	bh=JYqiO5ZeR4k8edLUhIFlT4qB0cgLLPLEkraSJOdVvJ8=; b=5DQKUee2jXxloMfvmscK8EOHTI
	sCiqwGA8NvgFdlMhTfoo5yWaceCzLgN+i3ZvTtGYXi+P3qmLQxzBE2BJ23eJoz5bD/NwYMWFACutZ
	Km4q8CbtuI3b+Cqcgtcl2l6ey0vBKqshTqG4bdM+xH2wJf2+brm9akD7/Bm9/SiGcx8E=;
Message-ID: <96610d30-0de2-96e9-e838-504acf83a8d8@xen.org>
Date: Mon, 21 Feb 2022 19:13:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [XEN v8 2/2] xen/arm64: io: Support instructions (for which ISS
 is not valid) on emulated MMIO region using MMIO/ioreq handler
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20220212233433.46018-1-ayankuma@xilinx.com>
 <20220212233433.46018-3-ayankuma@xilinx.com>
 <1599e2f3-0a34-020a-dd42-5ba87dad555d@xen.org>
 <10cf253b-fc58-1afc-66ec-33ac3008bb0f@xilinx.com>
 <576cf522-f002-afac-36b6-b31f87724dca@xen.org>
 <e53b1407-4701-f0f1-5f49-5bd8cbb6eb41@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e53b1407-4701-f0f1-5f49-5bd8cbb6eb41@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 21/02/2022 19:05, Ayan Kumar Halder wrote:
> If we (ie Xen) didn't decode the instruction manually, then check_p2m() 
> has not been invoked yet.  This is because of the following 
> (info.dabt.valid == True) :-
> 
>          if ( !is_data || !info.dabt.valid )
>          {
> 
>                  ...
> 
>                  if ( check_p2m(is_data, gpa) )
>                      return;
> 
>                  ...
> 
>          }
> 
> So, in this scenario ( !info.dabt.valid), it would not be necessary to 
> invoke check_p2m() after try_handle_mmio().
> 
> However, if we havenot decoded the instruction manually (ie 
> info.dabt.valid == True), and try_handle_mmio() returns IO_UNHANDLED, 
> then it will be necessary to invoke "check_p2m(is_data, gpa)"

Hmmm you are right. But this doesn't seem to match the code you wrote 
below. What did I miss?

Cheers,

-- 
Julien Grall


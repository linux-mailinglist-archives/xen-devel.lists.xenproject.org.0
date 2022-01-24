Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8649498762
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 18:59:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259947.448788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC3cJ-0006ja-UT; Mon, 24 Jan 2022 17:58:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259947.448788; Mon, 24 Jan 2022 17:58:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC3cJ-0006hg-QM; Mon, 24 Jan 2022 17:58:59 +0000
Received: by outflank-mailman (input) for mailman id 259947;
 Mon, 24 Jan 2022 17:58:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nC3cI-0006ha-J2
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 17:58:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nC3cI-0006u6-5W; Mon, 24 Jan 2022 17:58:58 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[10.85.42.33])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nC3cH-0007VQ-VB; Mon, 24 Jan 2022 17:58:58 +0000
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
	bh=J7SNXqjou4UgQI6acXBIJNYaW5J/Obp9KxjZ3tjfxIM=; b=EUX2S0nwCWH2OD2w/5SwxvzJcb
	HTSd006T5/Gqm0jiWgKYVWml2m/KZGheF4Bfh7wLXo/KlLKboxbnTztKmRMKsF80D5Sy2XTC9XYWJ
	nERrIvQq6eaJuoLRtBbLV9QrNzcrD0DwK4bBrA1qsZpx9NQW/QpQPKiIiZGcySRBuZAk=;
Message-ID: <9609102e-8d58-8378-29b8-4e1190eb1e3c@xen.org>
Date: Mon, 24 Jan 2022 17:58:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [XEN v3] xen/arm64: io: Decode ldr/str post-indexing instructions
To: Andre Przywara <andre.przywara@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 stefanos@xilinx.com, Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 jbeulich@suse.com, wei.chen@arm.com
References: <20220120215527.28138-1-ayankuma@xilinx.com>
 <20220122013046.6a786d3f@slackpad.fritz.box>
 <18e715ae-111d-58e6-55f9-a48a521e99b3@xilinx.com>
 <20220124143601.3e2ac6ac@donnerap.cambridge.arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220124143601.3e2ac6ac@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andre,

On 24/01/2022 14:36, Andre Przywara wrote:
> On Mon, 24 Jan 2022 12:07:42 +0000
>> Also, if an instruction is being modified by the guest (after it has
>> been loaded in the I cache), and if the guest does not invalidate the I
>> cache + ISB, then this is a malicious behavior by the guest. Is my
>> understanding correct ?
> 
> I wouldn't say malicious per se, there might be legitimate reasons to do
> so, but in the Xen context this is mostly irrelevant, since we don't trust
> the guest anyway. So whether it's malicious or accidental, the hypervisor
> might be mislead.

I agree the hypervisor will be mislead to execute the wrong instruction. 
But, in reality, I don't see how this is a massive problem as this 
thread seems to imply. At best the guest will shoot itself in the foot.

IOW, for now, I think it is fine to assume that the guest will have 
invalidated the cache instruction before executing any instruction that 
may fault with ISV=0. This could be revisted if we have use-cases where 
we really need to know what the guest executed.

Cheers,

-- 
Julien Grall


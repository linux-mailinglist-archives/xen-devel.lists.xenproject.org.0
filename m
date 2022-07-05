Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD28566EAB
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 14:50:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361201.590598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8i0f-00020S-Bv; Tue, 05 Jul 2022 12:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361201.590598; Tue, 05 Jul 2022 12:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8i0f-0001xk-9D; Tue, 05 Jul 2022 12:50:33 +0000
Received: by outflank-mailman (input) for mailman id 361201;
 Tue, 05 Jul 2022 12:50:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o8i0d-0001xL-Q3
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 12:50:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8i0d-0004JR-1R; Tue, 05 Jul 2022 12:50:31 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[10.7.237.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8i0c-0000CF-QI; Tue, 05 Jul 2022 12:50:30 +0000
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
	bh=IFM1tQAZdPrKjkRGc+JdhGaKY0PIEFYs4qE1xcicQKI=; b=UXD0pkTUqMLkU7/HypNxRBawj0
	QMGpg0+I03/31QRGrHiMIrqN1o4Wz7CVG8J4g2Dit3UTRnzZeveR53aHf7gHIP4oAyo2hrYtyokQA
	cfHeMs1X7wzw3KsNJi0DX9PzkmxA6TUHIAg1fgcyeIFReiuMRr7ab7HTs2FZaEfIjQl8=;
Message-ID: <b8ecac83-bfae-a57c-e917-3d128eddb13d@xen.org>
Date: Tue, 5 Jul 2022 13:50:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 3/7] xen/common: Use unsigned int instead of plain
 unsigned
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Michal Orzel <Michal.Orzel@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>
References: <20220627131543.410971-1-michal.orzel@arm.com>
 <20220627131543.410971-4-michal.orzel@arm.com>
 <4ee1fbaf-9d31-d28e-cb8d-f330c6a1923f@arm.com>
 <fdaa154e-95f1-6f80-6f27-f94aaaf1f77b@xen.org>
 <32242AE5-AF31-4AE1-94FC-4375E9CEE007@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <32242AE5-AF31-4AE1-94FC-4375E9CEE007@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/07/2022 13:07, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

>> On 29 Jun 2022, at 11:52, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 29/06/2022 11:46, Michal Orzel wrote:
>>> On 27.06.2022 15:15, Michal Orzel wrote:
>>>> This is just for the style and consistency reasons as the former is
>>>> being used more often than the latter.
>>>>
>>>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>>> It looks like this change was forgotten when merging other patches from the series.
>>
>> I noticed the same and was going to commit it yesterday night. However, it is technically missing an ack/review for trace.c (this is maintained by George).
>>
>> The change is small and likely not controversial. So I guess we could do without George's review. That said, I would like to give him a chance to answer (I will commit it on Friday if there are no answer).
> 
> Just a gentle ping on this.

Thanks for the reminder, the patch is now merged.

Cheers,

-- 
Julien Grall


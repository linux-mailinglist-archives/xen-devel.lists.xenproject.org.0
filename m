Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0211D644DEB
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 22:26:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455585.713093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2fS8-0005u0-Tz; Tue, 06 Dec 2022 21:26:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455585.713093; Tue, 06 Dec 2022 21:26:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2fS8-0005rF-QL; Tue, 06 Dec 2022 21:26:12 +0000
Received: by outflank-mailman (input) for mailman id 455585;
 Tue, 06 Dec 2022 21:26:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2fS6-0005r7-U9
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 21:26:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2fS5-0002ru-TG; Tue, 06 Dec 2022 21:26:09 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2fS5-0002hB-Kv; Tue, 06 Dec 2022 21:26:09 +0000
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
	bh=KwzGXX09l4ohziPxc9xX7H0c2GRkqVO1+8OfuSqEMaA=; b=xKugV26xWdvs318YAtoLpHB7mS
	s5y24q/dwGZWh4lsu887/WaAJv318bp5m6VJ0IW3XLzQUsniWrSU9UfbSUMNGEDK2lFvL+mELmMnw
	WfNXv+sY2T/mgUEsMbtjZLOeGacJBzbNCLCxQAl1Qb3/bcxkbVlRAVoCHQn+0e+Pam2w=;
Message-ID: <b2779158-0143-d85e-abd6-6dca97e88517@xen.org>
Date: Tue, 6 Dec 2022 21:26:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 00/19] xen/arm64: Suspend to RAM support for Xen
From: Julien Grall <julien@xen.org>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
References: <cover.1665128335.git.mykyta_poturai@epam.com>
 <1af48fce-b234-1f08-3882-8f071893dc3c@xen.org>
In-Reply-To: <1af48fce-b234-1f08-3882-8f071893dc3c@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/12/2022 20:32, Julien Grall wrote:
> Hi,
> 
> On 07/10/2022 14:08, Mykyta Poturai wrote:
>> This is a series from Mirela Simonovic. Ported to 4.16 and with
>> added changes suggested here
>> https://lore.kernel.org/all/CAKPH-NjmaZENb8gT=+FobrAycRF01_--6GuRA2ck9Di5wiudhA@mail.gmail.com
>>
>> This series contains support for suspend to RAM (in the following text 
>> just
>> 'suspend') for Xen on arm64. The implementation is aligned with the 
>> design
>> specification that has been proposed on xen-devel list:
>> https://lists.xenproject.org/archives/html/xen-devel/2017-12/msg01574.html
>>
>> At a high-level the series contains:
>> 1) Support for suspending guests via virtual PSCI SYSTEM_SUSPEND call
>> 2) Support for resuming a guest on an interrupt targeted to that guest
>> 3) Support for suspending Xen after dom0 finalizes the suspend
>> 4) Support for resuming Xen on an interrupt that is targeted to a guest
> 
>  From the previous discussion, there were a few dubious code in 
> cpu_disable() (e.g. mdelay()). So did you go through the code to confirm 
> it is fully Arm compliant?

Another missing pieces is that we don't free anything related to the CPU 
that is been powered down. But AFAICT, we will end up to allocate the 
memory again for things like page tables, per-cpu...

Cheers,

-- 
Julien Grall


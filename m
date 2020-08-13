Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0015D243E63
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 19:35:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6H8P-0006JF-9J; Thu, 13 Aug 2020 17:35:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6jG6=BX=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k6H8N-0006JA-Vb
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 17:35:24 +0000
X-Inumbo-ID: ee74fd6b-2ee9-4720-b55d-56bcd18ab007
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee74fd6b-2ee9-4720-b55d-56bcd18ab007;
 Thu, 13 Aug 2020 17:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=Q9EPBMPpic/bSkkL9+3L70HRPIx2u2FUqgf9Dws360M=; b=OwPFACB8fQ4f+uHKY1PjCoUSMq
 7symAX04j2oWu0SP1gHrj02ZzVMUIsB838dQN9UKzTeseCsziAlcA7L6LNqY6ptvseDgrIi6V22BW
 hgA4AcggkbbaZFwp3OnOj5lpcuDHDiHMQkxOPcBuaE+KpMh5Vn1wmBObj3lArFOrpQ6E=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6H8I-0007PS-7J; Thu, 13 Aug 2020 17:35:18 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6H8H-0003Kk-SI; Thu, 13 Aug 2020 17:35:18 +0000
Subject: Re: [PATCH v3] xen/arm: Convert runstate address during hypcall
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <3911d221ce9ed73611b93aa437b9ca227d6aa201.1596099067.git.bertrand.marquis@arm.com>
 <f48f81d5-589e-3f75-1044-583114bf497e@xen.org>
 <CB9F22FE-BEFF-4A36-BC81-A18F9E0F9D7C@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f45d3213-c785-4f62-5c3e-77093062d1b6@xen.org>
Date: Thu, 13 Aug 2020 18:35:15 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CB9F22FE-BEFF-4A36-BC81-A18F9E0F9D7C@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Bertrand,

On 31/07/2020 14:26, Bertrand Marquis wrote:
>>> +    {
>>> +        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%"PRIvaddr
>>> +                ": Invalid offset\n", vaddr);
>>
>> We usually enforce 80 character per lines except for format string. So it is easier to grep them in the code.
> 
> Ok i will fix this one and the following ones.
> But here PRIvaddr would break any attempt to grep something in fact.

The idea is you can grep a few words on the message and then easily find 
the line.

Cheers,

-- 
Julien Grall


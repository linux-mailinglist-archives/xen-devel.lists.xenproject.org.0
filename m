Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB34751CDE
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 11:11:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563028.879906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJsLa-0001R7-7D; Thu, 13 Jul 2023 09:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563028.879906; Thu, 13 Jul 2023 09:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJsLa-0001PG-4V; Thu, 13 Jul 2023 09:10:50 +0000
Received: by outflank-mailman (input) for mailman id 563028;
 Thu, 13 Jul 2023 09:10:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qJsLY-0001PA-JG
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 09:10:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qJsLX-0003fk-6j; Thu, 13 Jul 2023 09:10:47 +0000
Received: from [15.248.2.150] (helo=[10.24.67.22])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qJsLW-0000Tc-VZ; Thu, 13 Jul 2023 09:10:47 +0000
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
	bh=8LZFOLx1RGeM07jcNM4RNjnkjegoh+yZ61l0VIGUVWw=; b=yFvHf79esqr4NQl32aF22Cwn8n
	KTlc3Z9nN0GvO1D4niBIgREz5q/jEMApW5kS1ff0Moh7RegiZQl4SirpXYxbp01u+x9xE+ndZGHtQ
	bgWNx1OHROBObqcy19Og7I2/RNVqyVKDsDy6HlDsvj4aG4O/3+gORoWHflWMUE2nrRug=;
Message-ID: <1ee3260f-7592-8384-9000-ea068b84a6c7@xen.org>
Date: Thu, 13 Jul 2023 10:10:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v9 00/24] Xen FF-A mediator
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Wei Liu <wl@xen.org>, Marc Bonnici <Marc.Bonnici@arm.com>,
 Achin Gupta <Achin.Gupta@arm.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
 <480AA225-0590-40BE-BCD5-ADCCB1BC2274@arm.com>
 <CAHUa44FQotjOASHhUknwju20iOoFnub3erYOp+b_2+h=NCvv1A@mail.gmail.com>
 <DBFFABBE-AF3A-4ED1-8DAB-B00054D41C37@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DBFFABBE-AF3A-4ED1-8DAB-B00054D41C37@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/07/2023 08:37, Bertrand Marquis wrote:
>> On 13 Jul 2023, at 09:12, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>>>
>>> It makes it easier for reviewers if you put the changelog per patch
>>> instead of having all of them in the cover letter.
>>
>> OK. When I post the next version is it enough to document the v9->v10
>> changes in the affected patches?
> 
> 
> Yes that would be ok for me. If someone else has other requirements they will tell you :-)

No problem from me. It would be mean to request adding the per-patch 
changelog retroactively for 10 versions :).

Cheers,

-- 
Julien Grall


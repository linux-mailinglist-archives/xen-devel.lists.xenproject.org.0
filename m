Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 665FD810E6C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 11:27:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653836.1020478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDMSE-0007TC-90; Wed, 13 Dec 2023 10:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653836.1020478; Wed, 13 Dec 2023 10:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDMSE-0007Qh-5Z; Wed, 13 Dec 2023 10:27:02 +0000
Received: by outflank-mailman (input) for mailman id 653836;
 Wed, 13 Dec 2023 10:27:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rDMSD-0007Qb-BP
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 10:27:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rDMSC-0006Yt-Hm; Wed, 13 Dec 2023 10:27:00 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[192.168.2.97])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rDMSC-0004aY-Bi; Wed, 13 Dec 2023 10:27:00 +0000
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
	bh=oRIDefNm2wt/VIm+lNP5XxTf25jurIqcEEwhAZSz+FM=; b=ZDu0Jp7+vUoHiKo6EEx8D1nVnr
	yBeXnJsdvDhoUtSRh5iZyTmgAkw9mUufdRvqFs2HesaaSTYywd2LA6y3a4QMjXLotxT8aoBjWNRV1
	UXsxP54lrDLg+daify3wqzPEOzhUWNaUAzlrXe1Qb2O/mKoYe+2z+VPCRcn766hbG0Wg=;
Message-ID: <93fc510a-29ed-41c7-8786-e9d9d5912a65@xen.org>
Date: Wed, 13 Dec 2023 10:26:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SAF-* comment at the end of the line
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@amd.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <27B32A01-F4D9-4A92-BA16-F43D0AF4F29E@arm.com>
 <alpine.DEB.2.22.394.2312051840070.110490@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2312051840070.110490@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 06/12/2023 02:42, Stefano Stabellini wrote:
> On Tue, 5 Dec 2023, Luca Fancellu wrote:
>> Hi all,
>>
>> I’m writing this mail to collect thoughts about the need to improve the SAF-* comments.
>>
>> I think we reached a point where we need to use deviations for some violation that we want
>> to keep in the code with a proper justification and an issue was raised when the comment
>> cannot be put on a line on its own.
>>
>> e.g.
>>
>> If ( condition-1 &&
>>       condition-2 &&
>>        [...] )
>> {
>>      ...
>> }
>>
>> For example in the code above, if the violation is in the second condition, breaking the conditions
>> to have an empty line between them for the SAF-* comment is not ideal, so we could maybe
>> improve the in-code comment to be used at the end of the line:
>>
>> e.g.
>>
>> If ( condition-1 &&
>>       condition-2 && /* SAF-*-safe [...] */
>>        [...] )
>> {
>>      ...
>> }
>>
>> This might require also a deviation on the coding style to allow the comment to overcome the line length.
>>
>> Bertrand, from his experience with safety certifications, feels that adding this feature could be enough
>> to cover the majority of the cases where we need to deviate a violation in the code.
>>
>> Using it consistently in the code base as the only way to deviate a violation can also help the adoption
>> of the project to people who might want to fix them instead of deviating them, the only thing they would need
>> to do is to grep for SAF-* to have a rough idea of how many justified violation are in the code.
>>
>> Please let me know your thoughts before I start to implement the feature.
> 
> I think we need this feature and in fact we have already been adding it
> in an ad-hoc way with /* octal-ok */
> 
> It would like to remove octal-ok and use a generic way (SAF) to do the
> same.

+1.

Cheers,

-- 
Julien Grall


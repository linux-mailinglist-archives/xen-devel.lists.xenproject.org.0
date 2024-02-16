Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 943B18583EB
	for <lists+xen-devel@lfdr.de>; Fri, 16 Feb 2024 18:18:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682331.1061477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rb1py-0001hh-LW; Fri, 16 Feb 2024 17:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682331.1061477; Fri, 16 Feb 2024 17:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rb1py-0001fS-IH; Fri, 16 Feb 2024 17:17:22 +0000
Received: by outflank-mailman (input) for mailman id 682331;
 Fri, 16 Feb 2024 17:17:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rb1pw-0001fK-TX
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2024 17:17:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rb1pl-00079I-Mr; Fri, 16 Feb 2024 17:17:09 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rb1pl-0000WF-8e; Fri, 16 Feb 2024 17:17:09 +0000
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
	bh=d2PXqay6fCZUfSopUt46LnDOsNwIDSjZ+NJObjpuqHg=; b=PUJwyqPlxl1cxw46Q6lYNEqkv5
	BaOYglLvn/4d3RssWdn0p9110zF35jW8IA1ndbhiBfHVaWOnxcE+gq5gkJTdDlFRjgwQyaeplH6uI
	Bv8mR6eA/236gW0t8vAWPP0s9CNt2d00RGNDU0/+Jj02MeaP6n4PyVn+AJ5iiW79VsHE=;
Message-ID: <f4dfdf1e-9a19-4616-bcbc-1bfa805a35c4@xen.org>
Date: Fri, 16 Feb 2024 17:17:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (resend) 00/27] Remove the directmap
Content-Language: en-GB
To: Elias El Yandouzi <eliasely@amazon.com>, Jan Beulich <jbeulich@suse.com>
Cc: pdurrant@amazon.com, dwmw@amazon.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 xen-devel@lists.xenproject.org
References: <20240116192611.41112-1-eliasely@amazon.com>
 <04d113bf-71ab-4eba-a95f-72318c888d1f@suse.com>
 <217a6edd-96f8-4589-b500-2dc31a1b0bee@amazon.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <217a6edd-96f8-4589-b500-2dc31a1b0bee@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 05/02/2024 11:11, Elias El Yandouzi wrote:
> Hi Jan,
> 
> On 29/01/2024 08:28, Jan Beulich wrote:
> 
>> On 16.01.2024 20:25, Elias El Yandouzi wrote:
>>> Julien Grall (8):
>>>    xen/vmap: Check the page has been mapped in vm_init_type()
>>>    xen/vmap: Introduce vmap_size() and use it
>>>    xen/arm: fixmap: Rename the fixmap slots to follow the x86 convention
>>
>> Btw, if there was clear indication that e.g. this patch (fully ack-ed
>> afaict) can go in ahead of earlier patches, I probably would have put
>> it in already. Considering it sits half way through the series, I don't
>> want to blindly chance it, though.
>>
> 
> I just forgot to strip off those ack tags. The patch got approved quite 
> a while ago and I thought it would be better to submit it again.

I spoke with Stefano on Matrix and he was fine with keeping the ack. I 
assume that Jan is also ok as he asked if we could commit.

So I have committed the patch.

Cheers,

-- 
Julien Grall


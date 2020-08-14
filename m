Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D700244EAC
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 21:10:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6f63-0000nP-Iu; Fri, 14 Aug 2020 19:10:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=osIB=BY=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k6f61-0000nK-D1
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 19:10:33 +0000
X-Inumbo-ID: 4650cc06-6580-45ae-a0c4-28de85c397ae
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4650cc06-6580-45ae-a0c4-28de85c397ae;
 Fri, 14 Aug 2020 19:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=8QKY2s8aXmdPF0FCx/9Nfsv5XHoKdhBpp+wbemNRimk=; b=bPWSXfj2O6AGY2egC4JhPXixAX
 gYp91Hteo5uA5b2ucxX1cpFEcO1s5VspV6dtKmX9sDms5HFXWJ8mExcFa00+n2KTwpoZULvkhzysS
 ePk7jJVY9lNfuZMETQsvdP55mAcYD1E3Fkp7dCovC8TnVCFr2WiU0AMc5C/Tx6d5aTis=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6f5w-0004pf-Mm; Fri, 14 Aug 2020 19:10:28 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6f5w-0001rT-En; Fri, 14 Aug 2020 19:10:28 +0000
Subject: Re: [RESEND][PATCH v2 6/7] xen/guest_access: Consolidate guest access
 helpers in xen/guest_access.h
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-7-julien@xen.org>
 <alpine.DEB.2.21.2007301234180.1767@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <1f397467-5e57-7a8a-f121-19eef25dd26d@xen.org>
Date: Fri, 14 Aug 2020 20:10:26 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2007301234180.1767@sstabellini-ThinkPad-T480s>
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

Hi Stefano,

On 30/07/2020 20:37, Stefano Stabellini wrote:
> On Thu, 30 Jul 2020, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Most of the helpers to access guest memory are implemented the same way
>> on Arm and x86. The only differences are:
>>      - guest_handle_{from, to}_param(): while on x86 XEN_GUEST_HANDLE()
> 
> It is actually just guest_handle_to_param() ?

Yes. I forgot Jan recently removed the helper in commit dd5520f9df05 
"x86: adjustments to guest handle treatment". I will update the commit 
message.

> 
> 
>>        and XEN_GUEST_HANDLE_PARAM() are the same, they are not on Arm. It
>>        is still fine to use the Arm implementation on x86.
>>      - __clear_guest_offset(): Interestingly the prototype does not match
>>        between the x86 and Arm. However, the Arm one is bogus. So the x86
>>        implementation can be used.
>>      - guest_handle{,_subrange}_okay(): They are validly differing
>>        because Arm is only supporting auto-translated guest and therefore
>>        handles are always valid.
>>
>> In the past, the ia64 and ppc64 port use a different model to access
>> guest parameter. They have been long gone now.
>>
>> Given Xen currently only support 2 archictures, it is too soon to have a
>> directory asm-generic as it is not possible to differentiate it with the
>> existing directory xen/. If/When there is a 3rd port, we can decide to
>> create the new directory if that new port decide to use a different way
>> to access guest parameter.
>>
>> For now, consolidate it in xen/guest_access.h.
>>
>> While it would be possible to adjust the coding style at the same, this
>> is left for a follow-up patch so 'diff' can be used to check the
>> consolidation was done correctly.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Looks good to me
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thank you!

Cheers,

-- 
Julien Grall


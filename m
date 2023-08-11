Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C54AF779731
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 20:42:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582621.912481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUX5M-00061k-Tg; Fri, 11 Aug 2023 18:42:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582621.912481; Fri, 11 Aug 2023 18:42:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUX5M-0005zj-QS; Fri, 11 Aug 2023 18:42:08 +0000
Received: by outflank-mailman (input) for mailman id 582621;
 Fri, 11 Aug 2023 18:42:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qUX5L-0005zd-FA
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 18:42:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qUX5F-0002fn-OF; Fri, 11 Aug 2023 18:42:01 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.207.66]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qUX5F-0002zO-G0; Fri, 11 Aug 2023 18:42:01 +0000
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
	bh=kdQaYnEum4p7jEr0WZXY0shFRjePUR5maVA/N7BPryw=; b=I0ukBYz6aZb0xaZCvQjGiAkQmV
	yPrZOZIDQPCQAvqTlj1GmNgKDp6Ih/7864zcEwiVuVaG7F0UShmC2XSMJXusXCMhab8IFpjWj6pPk
	JI20pHcRbozLNu6W0J+a4+LHsNoKrzd6U5IKmTsWyUIV3ZS3V/pifFXj9APP7nO4fsEw=;
Message-ID: <3c6964b5-e31e-49e3-ad05-c19853fdbf4a@xen.org>
Date: Fri, 11 Aug 2023 19:41:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 10/11] xen/sched: add ASSERT_UNREACHABLE() to address
 MISRA C:2012 Rule 2.1
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Jan Beulich <jbeulich@suse.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <3f1385f2ddb151a53ca092ea1caeac5d12fd80f5.1690985045.git.nicola.vetrini@bugseng.com>
 <db2ac35e-b371-4537-9d56-8703e3648abe@xen.org>
 <5135e7ac-1025-3a45-7cf6-d049a15b8df5@suse.com>
 <be588477-cafd-4875-aeef-9b17206a5cc5@xen.org>
 <cde2ae86db8ba9a86ce5afdb9f47a4e4@bugseng.com>
 <6aac7add-544b-4c8a-b397-2a6b6c6b766c@xen.org>
 <alpine.DEB.2.22.394.2308081401400.2127516@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2308081401400.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 08/08/2023 22:14, Stefano Stabellini wrote:
> On Tue, 8 Aug 2023, Julien Grall wrote:
>> On 08/08/2023 16:53, Nicola Vetrini wrote:
>>>>> ... "return" alone already tells the compiler that "break" is
>>>>> unreachable. You don't need unreachable() for that. As said before,
>>>>> "break" like this simply want purging (and Misra is wrong to demand
>>>>> "break" everywhere - it should instead demand no [unannotated]
>>>>> fall-through, which can also be achieved by return, continue, and
>>>>> goto).
>>>>
>>>> My suggestion was in the context of this series where we add
>>>> ASSERT_UNREACHABLE() before break. From my understanding, we don't
>>>> have a lot of leeway here because, from what Nicola wrote, rule 16.3
>>>> is mandatory.
>>>>
>>>> So I think using unreachable is better if we every decide to use break
>>>> after return.
>>>>
>>>> Cheers,
>>>
>>> 16.3 is not Mandatory, just Required.
>>
>> Ah I misread what you wrote. In that case...
>>
>>> I was just reluctant to knowingly add one more violation
>>> while fixing another before submitting the patch. If indeed 16.3 won't
>>> likely be adopted by Xen,
>>> then that break should indeed go away.
>>>
>>> However, the main thing that's holding me back from doing a slimmed-down v2
>>> here is that
>>> evidently there's no consensus even on the ASSERT_UNREACHABLE() patches.
>>
>> ... I agree with the following statement from Jan:
>>
>> "it should instead demand no [unannotated] fall-through, which can also be
>> achieved by return, continue, and goto"
> 
> I also think it is a better idea to have no unannotated fall-through in
> switch statements (unless we have a "case" with nothing underneath, so
> two cases next to each other). In other words the following are all OK
> in my view:
> 
>    case A:
>      do();
>      break;
>    case B:
>      do();
>      return true;
>    case Ca:
>    case Cb:
>      goto fail;
>    case D:
>      i++;
>      continue;
>    case E:
>      do();
>      /* fall-through */
>    case F:
>      do();
>      break;
> 
> While the following is not OK:
> 
>    case A:
>      do();
>    case B:
>      do();
> 
> This should be what we already do in Xen, although it is not documented
> properly. Jan, Julien do you agree?

I agree.

Cheers,

-- 
Julien Grall


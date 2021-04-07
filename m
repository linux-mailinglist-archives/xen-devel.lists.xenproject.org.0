Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 922CA356E24
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 16:07:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106693.204003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU8p2-0005fX-31; Wed, 07 Apr 2021 14:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106693.204003; Wed, 07 Apr 2021 14:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU8p1-0005f8-Vt; Wed, 07 Apr 2021 14:06:19 +0000
Received: by outflank-mailman (input) for mailman id 106693;
 Wed, 07 Apr 2021 14:06:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lU8p0-0005f3-W6
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 14:06:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lU8oz-0006gU-OH; Wed, 07 Apr 2021 14:06:17 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lU8oz-0000Gk-Cr; Wed, 07 Apr 2021 14:06:17 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=hJKX5BjNhn6Bj4ZnIL9xJUzfsT49s1e+TRm0HZdcxVk=; b=iSptm15fy2pkqGphvn+ocVt7Fa
	2GWn3xAuivtzwupkqCn7YvIQLpCHsZwLuLS1k85ODxw0vO8zqdUhGDvX39lCavmk14E4uTuqW1+Tr
	OUnb0MKAW/6XngNldAW0Y5P9c3VOOQ+ouEKOuwXPh5+BPpllvYUerHXyrBL/pXBaMXPA=;
Subject: Re: [PATCH 02/23] lib: move 64-bit div/mod compiler helpers
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
 <0fec827f-bb0b-4ea1-7757-9c27e9138be7@suse.com>
 <008a8b14-8f58-2127-9e97-87c696e07b5e@xen.org>
 <0ddcecbb-dc42-ba4e-fccc-6988c7e54456@suse.com>
 <ad4aaf01-697e-dc12-39c5-17d375a40b00@xen.org>
 <75299b2a-9610-57fb-95a3-c49d926af54b@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <42f74b93-1ef2-a3c5-6718-01efd4ffce2c@xen.org>
Date: Wed, 7 Apr 2021 15:06:15 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <75299b2a-9610-57fb-95a3-c49d926af54b@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 07/04/2021 09:33, Jan Beulich wrote:
> On 06.04.2021 21:34, Julien Grall wrote:
>> Hi Jan,
>>
>> On 01/04/2021 16:23, Jan Beulich wrote:
>>> On 01.04.2021 16:56, Julien Grall wrote:
>>>> On 01/04/2021 11:19, Jan Beulich wrote:
>>>>> --- a/xen/common/lib.c
>>>>> +++ b/xen/lib/divmod.c
>>>>> @@ -40,7 +40,6 @@
>>>>>      * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
>>>>>      * SUCH DAMAGE.
>>>>>      */
>>>>> -#if BITS_PER_LONG == 32
>>>>
>>>> In theory BITS_PER_LONG == 32 is not quite the same as 32-bit arch. Can
>>>> you clarify whether this code is necessary on 64-bit arch where long is
>>>> only 32-bit.
>>>
>>> Likely the compiler can get away without invoking these helpers, so
>>> the code would remain unused. I'm uncertain whether CONFIG_64BIT
>>> ought to be set for such an architecture, as we assume sizeof(long)
>>> == sizeof(void*), and hence pointers would then need to be 32-bit
>>> as well there.
>>
>> This is a fair point. Would you mind to add a sentence explaining that
>> in the commit message?
> 
> I've added
> 
> "Note that we imply "32-bit arch" to be the same as BITS_PER_LONG == 32,
>   i.e. we aren't (not just here) prepared to have a 64-bit arch with
>   BITS_PER_LONG == 32. Yet even if we supported such, likely the compiler
>   would get away there without invoking these helpers, so the code would
>   remain unused in practice."

Sounds fine to me.

> 
>> With that:
>>
>> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> Thanks. Any chance to also get an ack on patch 1, so at least these two
> (or three, seeing that you also did ack patch 3) could go in before my
> re-posting of the series to add the one line commit message additions
> that you did ask for on all the str* and mem* patches? (Alternatively I
> could take the time and re-order the two.)

I didn't ack #1 because I am not very familiar with the x86 constraints.
If anyone with x86 background (maybe Roger?) is willing to review it, 
then I would be happy to give my ack.

Cheers,

-- 
Julien Grall


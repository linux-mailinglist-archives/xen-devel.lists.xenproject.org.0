Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A2672CA25
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 17:32:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547333.854657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8jWR-0003nY-Q7; Mon, 12 Jun 2023 15:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547333.854657; Mon, 12 Jun 2023 15:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8jWR-0003lC-Na; Mon, 12 Jun 2023 15:31:59 +0000
Received: by outflank-mailman (input) for mailman id 547333;
 Mon, 12 Jun 2023 15:31:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q8jWQ-0003l6-VA
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 15:31:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q8jWF-0002nd-Nx; Mon, 12 Jun 2023 15:31:47 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.16.94]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q8jWF-0001Xk-Gv; Mon, 12 Jun 2023 15:31:47 +0000
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
	bh=Vx2W0WVZtIrOzHTNcmlB2OteYmca/ah7XnkCyRB/pns=; b=hzGmSBiQ+VY1XbsQicgHjoeoOE
	ykp/2zRGEbIRnzstRldC3ceulQqkqp/V+YNteX2OrGr1ZYjHixlkcb4DyAJc7mNraoOkyQEx09Sga
	Cv/fecI5BY4Yn3OxL/0FnI/M8dpx1hM7+9+lXnOvkuVrqQQBWu4mRYsVe1GAdebM7wQ4=;
Message-ID: <755e1f21-5a98-c5ff-328f-789f38a6ab8b@xen.org>
Date: Mon, 12 Jun 2023 16:31:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH 2/3] xen/ppc: Implement early serial printk on
 PaPR/pseries
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Shawn Anastasio <shawn@anastas.io>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 tpearson@raptorengineering.com, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <shawnanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1686148363.git.shawn@anastas.io>
 <e9a4878544d264688578d7899867df7e8207aba5.1686148363.git.shawn@anastas.io>
 <0c0a19de-dde3-8b98-4354-6d3d2019179b@suse.com>
 <0b24d36b-adbc-9e7c-df6e-8754c269855d@citrix.com>
 <d0d9b1be-a9e2-fff9-d631-149086ea1dfe@suse.com>
 <d52feaa7-4217-973e-19fe-9ec027eed5fc@citrix.com>
 <1c35f696-5a65-06da-8af5-685b8ad2e849@xen.org>
 <e16bcfa1-2b40-6bf0-57c9-5045ae1fdf80@citrix.com>
 <bcbab76d-ca8c-0772-3a9f-59fef3a2b5f5@xen.org>
 <CT87KSPVSBUG.2C4SWW2EDTA5Z@Shawns-Mac-mini.lan>
 <3a7eca41-0ecf-4bf1-1daf-9d66f4aa6400@xen.org>
 <CA+zSX=bZ7yx90geyCo3x0jxJy7X2f4E2XiazYEn0EDE+4O==pQ@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CA+zSX=bZ7yx90geyCo3x0jxJy7X2f4E2XiazYEn0EDE+4O==pQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi George,

Thanks for the summary! A couple of comments below.

On 12/06/2023 16:19, George Dunlap wrote:
> On Fri, Jun 9, 2023 at 5:07 PM Julien Grall <julien@xen.org> wrote:
> 
>> Hi Shawn,
>>
>> On 09/06/2023 16:01, Shawn Anastasio wrote:
>>> On Fri Jun 9, 2023 at 5:12 AM CDT, Julien Grall wrote:
>>>> Strictly speaking we can refuse any code. That count for license as
>>>> well. Anyway, I didn't request a change here. I merely pointed out that
>>>> any use of GPLv2+ should be justified because on Arm most of the people
>>>> don't pay attention on the license and pick the one from an existing
>> file.
>>>
>>> Hi Julien,
>>>
>>> The choice of GPLv2+ for many of the files in this patchset was indeed
>>> inherited from old IBM-written Xen code that the files in question were
>>> derived from. I did not realize it was permissible or even desirable to
>>> relicense those to GPLv2-only.
>>>
>>> As for the new files, GPLv2+ was chosen to remain consistent and to open
>>> the door for future derivations from GPLv2+ licensed code, either from
>>> the older Xen tree or from the Linux ppc tree, much of which is also
>>> licensed as GPLv2+. If it would reduce friction, these files could be
>>> relicensed to GPLv2-only.
>>
>> (Before someone points out, I know this is already a problem on other
>> part of Xen. But it would be ideal if we avoid spreading this mess on
>> new architectures :).
>>
>> Thanks for the explanations. To clarify, are you saying that all the
>> files will be GPLv2+ or just some?
>>
>> If the latter, then my concern would be that if you need to import
>> GPLv2-only code, then you may need to write your code in a different
>> file. This may become messy to handle and some developer may end up to
>> be confused.
>>
>> I am not a lawyer though, so you may want to check the implications here.
>>
> 
> Shawn,
> 
> Again sorry that you've sort of bumped a hornet's nest here.
> 
> Just to clarify, the situation as I understand it is:
> 
> 1. Large parts of Xen, being inherited from the Linux Kernel, are
> GPLv2-only; and the documentation clearly states that code is GPLv2-only
> unless explicitly stated otherwise.
> 
> 2. Some individual files in Xen are labelled as GPLv2-or-later; but as they
> rely on the "only" files, Xen as a whole can only be compiled under a GPLv2
> license.
> 
> 3. New contributions to a file assumed to have the same license as the
> header of the file; i.e., the code contained in patches to GPLv2-or-later
> files is assumed to be granted according to a GPLv2-or-later license.

The new contribution here could be code imported from Linux that would 
be GPLv2-only in GPLv2-or-later file. It is not clear to me what would 
be the legal implication.

> 
> 4. In the past, the legal teams of some contributors -- namely ARM -- were
> wary of the GPLv3; specifically the patent grant.  Since ARM doesn't make
> anything themselves, their patents are literally their product; they need
> to be very careful of not accidentally granting them to the world.  I think
> one thing ARM may have been afraid of at some point is one of their
> engineers accidentally submitting a patch to a GPLv2-or-later file which
> would, when taken with a GPLv3 (or GPLv4 license, once it comes out) cause
> them to lose too much control over their IP.
> 
> My understanding is that Julien is afraid that if the "GPLv2-or-later"
> files start to proliferate, that companies like ARM will start to become
> more wary of contributing; and so has been generally trying to encourage
> new files to be labelled "GPLv2-only" unless there's a good reason to do
> otherwise.  (Other issues like copying code from GPLv2-only are potential
> pitfalls as well, but probably less important.)
There is that and also the fact that we now need to be more careful when 
importing code from Linux. In Shawn's case this is mitigated by the fact 
that the license in Xen files should match the one in Linux.

> Additionally, I think it would be good if the community *did* have a
> discussion about whether we want an official policy; so that either we can
> point people to the relevant doc (with explanation), or stop bothering
> about it. :-)

+1. Do you think that would be a good topic for Xen Summit?

Cheers,

-- 
Julien Grall


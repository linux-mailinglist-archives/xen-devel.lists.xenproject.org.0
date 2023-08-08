Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0FA774CC9
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 23:17:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580469.908691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTU5G-0004pJ-Qb; Tue, 08 Aug 2023 21:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580469.908691; Tue, 08 Aug 2023 21:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTU5G-0004mm-NZ; Tue, 08 Aug 2023 21:17:42 +0000
Received: by outflank-mailman (input) for mailman id 580469;
 Tue, 08 Aug 2023 21:17:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7Ml=DZ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qTU5G-0004me-0W
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 21:17:42 +0000
Received: from sender3-of-o58.zoho.com (sender3-of-o58.zoho.com
 [136.143.184.58]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00c412fc-3631-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 23:17:40 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691529454289825.6972881222913;
 Tue, 8 Aug 2023 14:17:34 -0700 (PDT)
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
X-Inumbo-ID: 00c412fc-3631-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1691529456; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bWZ96RYWs2zTCSBhUa4XqhfrH/dRwZrDtjZ/fDju1umciQyDfqON8YF6qXGZS4OJ30Jq/dAgSb8zYucfaFlchyiCc7MhH0JySznz6q08rRplwMAWOiLvLY13tXPMi8+UAwmGz0d2wNin/qxzjE4oeJQj9D7AgZzXvuPK6z67ob4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691529456; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Q9bUDKxlqAq/RRI2lcmaz2jxZMJZQ5lF2Xvw2zb5hyo=; 
	b=kDZKMidf3RhwDHzAjSCB8whlFnDlGDfw3OH8ip9Vg0jpCmuR5ByrJhI3ZfUW33hYgs8JNEPPKnRTtGNxIn44+pMR+rl+8VAZspo+waXXt4tsDfE2oV3vqh5jUGYm8JOetgbqNgVTqBvy9mGD9u2dkXzgo+fSbkic/GtZFoWes+U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691529456;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Q9bUDKxlqAq/RRI2lcmaz2jxZMJZQ5lF2Xvw2zb5hyo=;
	b=nDttOTywfSx4HVP+i9Hl/UVWC594v6plWLtgfjDgqho2/nEyN0qeaetjCZ3Dzxjl
	V9oFhkc/dc9CGPMBDAF2EYFzrGGHVeCFdqDypGwb057+qYg26q3gQlf995EotxOGcmf
	NRwNq35zkjBXL54MphpEBCujTtIoeq0b6mtjNISA=
Message-ID: <c692fa5e-e2c4-6779-1fa6-172f11b51e30@apertussolutions.com>
Date: Tue, 8 Aug 2023 17:17:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 1/2] docs: update hyperlaunch device tree
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20230803104438.24720-1-dpsmith@apertussolutions.com>
 <20230803104438.24720-2-dpsmith@apertussolutions.com>
 <cec087cd-7ac7-5680-b931-feabe7aef261@amd.com>
 <65e62111-7997-de4d-cf12-15d89ec87471@apertussolutions.com>
 <2a72cbf1-a9d7-6edf-37f6-5197c9d40452@amd.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <2a72cbf1-a9d7-6edf-37f6-5197c9d40452@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/4/23 03:06, Michal Orzel wrote:
> Hi Daniel,
> 
> On 03/08/2023 18:57, Daniel P. Smith wrote:
>>
>>
>> On 8/3/23 07:45, Michal Orzel wrote:
>>> Hi Daniel,
>>>
>>> On 03/08/2023 12:44, Daniel P. Smith wrote:
>>>>
>>>>
>>>> With on going development of hyperlaunch, changes to the device tree definitions
>>>> has been necessary. This commit updates the specification for all current changes
>>>> along with changes expected to be made in finalizing the capability.
>>>>
>>>> This commit also adds a HYPERLAUNCH section to the MAINTAINERS file and places
>>>> this documentation under its purview. It also reserves the path
>>>> `xen/common/domain-builder` for the hyperlaunch domain builder code base.
>>>>
>>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> [...]
>>>> +
>>>>    memory
>>>> -  The amount of memory to assign to the domain, in KBs.
>>>> +  The amount of memory to assign to the domain, in KBs. This field uses a DTB
>>>> +  Reg which contains a start and size. For memory allocation start may or may
>>>> +  not have significance but size will always be used for the amount of memory
>>>>      Required.
>>>>
>>>> +  Format: String  min:<sz> | max:<sz> | <sz>, e.g. "256M"
>>> There is a mismatch between the description and above format:
>>> - KB vs MB
>>> - string vs reg format
>>> - the x86 example uses string and Arm uses reg format
>>
>> Hmmm. I missed this in the hyperlaunch v1 update. In the original design
>> that came from the working group it was going to use a reg as suggest by
>> dom0less. During development of v1, we found it was not rich enough to
>> express how Dom0 could be allocated memory and switched to a string to
>> mirror the dom0 memory hypervisor command line parameter.
> On Arm, dom0_mem cmdline parameter is used to specify only size (no min,max)

I understand. For general domain construction, these are legitimate 
values and hyperlaunch is meant to be able to fully construct a running 
environment just as if it was constructed by a toolstack. We must also 
be able to handle situations where a general configuration is being 
reused across systems and must be able to express the minimum memory 
each domain must have, how much should be attempted to be allocated, and 
if ballooning is enabled, being able to articulate that to the 
hyperlaunch domain builder.

I did not say this in reply to Julien, but I am not opposed to three 
separate parameters if that is what the conscience arrives at. I found 
the existing parser and the structure it creates as a useful and 
reusable component for obtaining and storing the values.

>>
>> A question for those involved with dom0less, is what are the opinions
>> about using this form for memory allocation. Is it required/possible to
>> be able to instruct the hypervisor what physical address to use as the
>> start of a domain's memory?
> "memory" dt property is used to specify just amount of memory for domain in KBs using reg format.
> It is not used to specify the static memory region (with start and size). For that, we have another property called "xen,static-mem".
> Therefore, it would be possible to switch memory to string but it would not be compatible with the current use anymore.

It would be compatible in the sense that dom0less-compatibility-mode 
could still accept it as just amount of memory. Which brings up a good 
point, whether I do it here or it is done in the patch series that will 
introduce dom0less-compatibilty-mode, there probably will need to be a 
top level flag under the hypervisor node to indicate it is a dom0less 
compatible configuration.

v/r,
dps



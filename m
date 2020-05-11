Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C79071CDB76
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 15:41:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY8fm-0005X0-Cx; Mon, 11 May 2020 13:40:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Y5i=6Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jY8fl-0005Wv-1A
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 13:40:45 +0000
X-Inumbo-ID: 02b32888-938d-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02b32888-938d-11ea-ae69-bc764e2007e4;
 Mon, 11 May 2020 13:40:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 34D70AD35;
 Mon, 11 May 2020 13:40:45 +0000 (UTC)
Subject: Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the
 menuconfig directly
To: Julien Grall <julien@xen.org>
References: <20200430142548.23751-1-julien@xen.org>
 <20200430142548.23751-3-julien@xen.org>
 <3a4ec020-f626-031e-73a6-b2eee97ab9e8@suse.com>
 <123BE55A-AACB-4FE3-94E2-1559ED73DD09@citrix.com>
 <24240.3047.877655.345428@mariner.uk.xensource.com>
 <1d8eb504-51e9-b8e7-f1af-862760f0f15d@xen.org>
 <24244.16076.627203.282982@mariner.uk.xensource.com>
 <09d729ad-58a7-1f4b-c779-5fd81d7009a4@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4017f7f0-744b-70ff-8fa4-b33c53a8b9e2@suse.com>
Date: Mon, 11 May 2020 15:40:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <09d729ad-58a7-1f4b-c779-5fd81d7009a4@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.05.2020 15:30, Julien Grall wrote:
> Hi Ian,
> 
> Thank you for the clarification.
> 
> On 07/05/2020 18:01, Ian Jackson wrote:
>> Julien Grall writes ("Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the menuconfig directly"):
>>> On 04/05/2020 13:34, Ian Jackson wrote:
>>>> George Dunlap writes ("Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the menuconfig directly"):
>>>>> On Apr 30, 2020, at 3:50 PM, Jan Beulich <JBeulich@suse.com> wrote:
>>>>>> Well, if I'm not mis-remembering it was on purpose to make it more
>>>>>> difficult for people to declare themselves "experts". FAOD I'm not
>>>>>> meaning to imply I don't see and accept the frustration aspect you
>>>>>> mention further up. The two need to be carefully weighed against
>>>>>> one another.
>>>>
>>>> Yes, it was on purpose.  However, I had my doubts at the time and
>>>> I think experience has shown that this was a mistake.
>>>>
>>>>> I don’t think we need to make it difficult for people to declare
>>>>> themselves experts, particularly as “all” it means at the moment is,
>>>>> “Can build something which is not security supported”.  People who
>>>>> are building their own hypervisors are already pretty well advanced;
>>>>> I think we can let them shoot themselves in the foot if they want
>>>>> to.
>>>>
>>>> Precisely.
>>>
>>> Can I consider this as an Acked-by? :)
>>
>> I am happy with the principle of the change.  I haven't reviewed the
>> details of the commit message etc.
>>
>> I reviewed the thread and there were two concernes raised:
>>
>>   * The question of principle.  I disagree with this concern
>>     because I approve of principle of the patch.
>>
>>   * Some detail about the precise justificaton as written in
>>     the commit message, regarding `clean' targets.  Apparently the
>>     assertion may not be completely true.  I haven't seen a proposed
>>     alternative wording.
> 
> I have checked the latest staging, the `clean` target doesn't trash 
> .config anymore.
> 
>>
>> I don't feel I should ack a controversial patch with an unresolved
>> wording issue.  Can you tell me what your proposed wording is ?
>> To avoid blocking this change I would be happy to review your wording
>> and see if it meets my reading of the stated objection.
> 
> Here a suggested rewording:
> 
> "EXPERT mode is currently used to gate any options that are in technical
> preview or not security supported At the moment, the only way to select
> it is to use XEN_CONFIG_EXPERT=y on the make command line.
> 
> However, if the user forget to add the option when (re)building or when 
> using menuconfig, then .config will get rewritten. This may lead to a 
> rather frustrating experience as it is difficult to diagnostic the
> issue.

To me this looks very similar to e.g. not suitably overriding the
default toolchain binaries, if one has a need to build with newer
ones than what a distro provides. According to some of my routinely
built configs both can be done by putting suitable entries into
./.config (not xen/.config), removing the need to remember adding
either to the make command line.

Jan


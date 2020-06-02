Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 901C71EBC41
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 15:00:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg6Wu-0003YX-LD; Tue, 02 Jun 2020 13:00:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jg6Wt-0003YS-Nc
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 13:00:31 +0000
X-Inumbo-ID: 09aed8b2-a4d1-11ea-9947-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09aed8b2-a4d1-11ea-9947-bc764e2007e4;
 Tue, 02 Jun 2020 13:00:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2F617AA7C;
 Tue,  2 Jun 2020 13:00:32 +0000 (UTC)
Subject: Re: [PATCH v2 for-4.14 1/3] xen/monitor: Control register values
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <cover.1590028160.git.tamas@tklengyel.com>
 <b3c147cc226f3a30daec73b2ffd57bd285bc8659.1590028160.git.tamas@tklengyel.com>
 <20200602110223.GW1195@Air-de-Roger>
 <CABfawh=NST0Vq+O5UCqyCxt1z2O9pcES_DQon4-cs9w0TPOuJQ@mail.gmail.com>
 <a9256e7a-b11f-cd45-7d8c-a72cfca4ddab@suse.com>
 <CABfawhkneOTsVE3nD41_F3u3Jihf8kk8N9eFHMP9znGUnugvsw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c7091857-2613-303e-416e-a4778278e428@suse.com>
Date: Tue, 2 Jun 2020 15:00:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CABfawhkneOTsVE3nD41_F3u3Jihf8kk8N9eFHMP9znGUnugvsw@mail.gmail.com>
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.06.2020 14:51, Tamas K Lengyel wrote:
> On Tue, Jun 2, 2020 at 6:47 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 02.06.2020 14:40, Tamas K Lengyel wrote:
>>> On Tue, Jun 2, 2020 at 5:08 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
>>>>
>>>> On Wed, May 20, 2020 at 08:31:52PM -0600, Tamas K Lengyel wrote:
>>>>> Extend the monitor_op domctl to include option that enables
>>>>> controlling what values certain registers are permitted to hold
>>>>> by a monitor subscriber.
>>>>
>>>> I think the change could benefit for some more detail commit message
>>>> here. Why is this useful?
>>>
>>> You would have to ask the Bitdefender folks who made the feature. I
>>> don't use it. Here we are just making it optional as it is buggy so it
>>> is disabled by default.
>>
>> Now that's exactly the opposite of what I had derived from the
>> description here so far. Perhaps an at least weak indication
>> that you want to reword this. For example, from your reply to
>> Roger I understand it's rather that the new flag allows to
>> "suppress" the controlling (since presumably you don't change
>> default behavior), rather then "enabling" it.
> 
> What we are adding is a domctl you need to call that enables this
> feature. It's not an option to suppress it. It shouldn't have been
> enabled by default to begin with. That was a mistake when the feature
> was contributed and it is buggy.

Okay, in this case it's important to point out that you alter
default behavior. The BitDefender folks may not like this, yet
they've been surprisingly silent so far.

Jan


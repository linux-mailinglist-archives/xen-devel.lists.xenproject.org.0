Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AF21DE3B3
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 12:07:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc4aQ-00015m-UM; Fri, 22 May 2020 10:07:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=knsM=7E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jc4aQ-00015h-9p
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 10:07:30 +0000
X-Inumbo-ID: 0b65bbd2-9c14-11ea-aba9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b65bbd2-9c14-11ea-aba9-12813bfff9fa;
 Fri, 22 May 2020 10:07:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7E252AC63;
 Fri, 22 May 2020 10:07:31 +0000 (UTC)
Subject: Re: [PATCH v3] x86/PV: remove unnecessary toggle_guest_pt() overhead
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <24d8b606-f74b-9367-d67e-e952838c7048@suse.com>
 <d7840278-b999-65fa-40bf-2b78e5266837@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a6084473-2fb7-4106-66a4-d180ef483314@suse.com>
Date: Fri, 22 May 2020 12:07:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <d7840278-b999-65fa-40bf-2b78e5266837@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21.05.2020 18:46, Andrew Cooper wrote:
> On 05/05/2020 07:16, Jan Beulich wrote:
>> While the mere updating of ->pv_cr3 and ->root_pgt_changed aren't overly
>> expensive (but still needed only for the toggle_guest_mode() path), the
>> effect of the latter on the exit-to-guest path is not insignificant.
>> Move the logic into toggle_guest_mode(), on the basis that
>> toggle_guest_pt() will always be invoked in pairs, yet we can't safely
>> undo the setting of root_pgt_changed during the second of these
>> invocations.
>>
>> While at it, add a comment ahead of toggle_guest_pt() to clarify its
>> intended usage.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I'm still of the opinion that the commit message wants rewriting to get
> the important points across clearly.
> 
> And those are that toggle_guest_pt() is called in pairs specifically to
> read kernel data structures when emulating a userspace action, and that
> this doesn't modify cr3 from the guests point of view, and therefore
> doesn't need the resync on exit-to-guest path.

Is this

"toggle_guest_pt() is called in pairs, to read guest kernel data
 structures when emulating a guest userspace action. Hence this doesn't
 modify cr3 from the guest's point of view, and therefore doesn't need
 any resync on the exit-to-guest path. Therefore move the updating of
 ->pv_cr3 and ->root_pgt_changed into toggle_guest_mode(), since undoing
 the changes during the second of these invocations wouldn't be a safe
 thing to do."

any better?

Jan


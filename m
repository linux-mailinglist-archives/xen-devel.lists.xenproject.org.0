Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE7726A050
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 10:01:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kI5tH-00033R-MP; Tue, 15 Sep 2020 08:00:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kI5tF-00033L-Uo
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 08:00:37 +0000
X-Inumbo-ID: c4b68c41-04a1-45c7-b606-06a5843484c7
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4b68c41-04a1-45c7-b606-06a5843484c7;
 Tue, 15 Sep 2020 08:00:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9B051AF86;
 Tue, 15 Sep 2020 08:00:51 +0000 (UTC)
Subject: Re: [PATCH 1/3] x86/shim: fix build with PV_SHIM_EXCLUSIVE and
 SHADOW_PAGING
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
References: <5d86a23c-5dea-8697-9ba1-900d35b99695@suse.com>
 <3ddb9adf-22b5-9196-1f3c-7cb3cafd08dd@suse.com>
 <20200914164412.GI753@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <41b041fb-5a02-755a-11d9-967e7acde0b8@suse.com>
Date: Tue, 15 Sep 2020 10:00:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200914164412.GI753@Air-de-Roger>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.09.2020 18:44, Roger Pau Monné wrote:
> On Mon, Sep 14, 2020 at 02:38:49PM +0200, Jan Beulich wrote:
>> While there's little point in enabling both, the combination ought to at
>> least build correctly. Drop the direct PV_SHIM_EXCLUSIVE conditionals
>> and instead zap PG_log_dirty to zero under the right conditions, and key
>> other #ifdef-s off of that.
>>
>> While there also expand on ded576ce07e9 ("x86/shadow: dirty VRAM
>> tracking is needed for HVM only"): There was yet another is_hvm_domain()
>> missing, and code touching the struct fields needs to be guarded by
>> suitable #ifdef-s as well. While there also guard shadow-mode-only
>> fields accordingly.
>>
>> Fixes: 8b5b49ceb3d9 ("x86: don't include domctl and alike in shim-exclusive builds")
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> We seem to be growing more and more ifdefs which is not ideal IMO, we
> should rather aim to remove them by splitting code into separate
> compilation units. There doesn't seem to be much option to split
> stuff in this case, so be it.

Right - I was indeed wondering whether maybe shadow_vram_{get,put}_l1e()
could be moved into hvm.c, but I didn't want to right away take the time
to check, as it seemed more important to get the build issue addressed.

Beyond the #ifdef-s added there the majority of the changes here are
merely adjustments to existing ones. (I'd except the new PG_log_dirty
conditional #define-s from the ones wanting better alternatives, as we
have been doing the same already for other PG_* constants.)

Jan


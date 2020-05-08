Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6B81CA563
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 09:46:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWxhi-0002R6-W7; Fri, 08 May 2020 07:45:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jWxhh-0002R1-2V
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 07:45:53 +0000
X-Inumbo-ID: f088047e-90ff-11ea-9fcd-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f088047e-90ff-11ea-9fcd-12813bfff9fa;
 Fri, 08 May 2020 07:45:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 72260AFCF;
 Fri,  8 May 2020 07:45:53 +0000 (UTC)
Subject: Re: [PATCH v2 1/4] x86/mm: no-one passes a NULL domain to
 init_xen_l4_slots()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <9d4b738a-4487-6bfc-3076-597d074c7b47@suse.com>
 <8787b72e-c71e-b75d-2ca0-0c6fe7c8259f@suse.com>
 <20200421164055.GW28601@Air-de-Roger>
 <4779dde6-6582-1776-ea9b-a2cd46ac3bc3@suse.com>
 <a40d1289-d88b-db93-1e6f-8f44c9c96bcf@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ede5db03-bf12-baff-055f-569bc5c11f2c@suse.com>
Date: Fri, 8 May 2020 09:45:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <a40d1289-d88b-db93-1e6f-8f44c9c96bcf@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.05.2020 19:26, Andrew Cooper wrote:
> On 05/05/2020 07:31, Jan Beulich wrote:
>> On 21.04.2020 18:40, Roger Pau Monné wrote:
>>> On Tue, Apr 21, 2020 at 11:11:03AM +0200, Jan Beulich wrote:
>>>> Drop the NULL checks - they've been introduced by commit 8d7b633ada
>>>> ("x86/mm: Consolidate all Xen L4 slot writing into
>>>> init_xen_l4_slots()") for no apparent reason.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>> you weren't entirely happy with the change because of the
>> possible (or, as you state, necessary) need to undo this. I
>> still think in the current shape the NULL checks are
>> pointless and hence would better go away. Re-introducing them
>> (adjusted to whatever shape the function may be in by that
>> time) is not that big of a problem. May I ask that you
>> explicitly clarify whether you actively NAK the patch, accept
>> it going in with Roger's R-b, or would be willing to ack it?
> 
> I'm not going to nack it, because that would be petty, but I still don't
> think it is a useful use of your time to be making more work for someone
> in the future to revert.
> 
> However, if you wish to take the patch with Roger's R-b, then please fix
> the stale commit message, seeing as this is v2 and I explained exactly
> why it was done like that.

Is "... without giving a reason; I'm told this was done in anticipation
of the function potentially getting called with a NULL argument" any
better? I don't think the commit message here was stale, as said commit
indeed gives no explanation, yet all call sites pass non-NULL.

Jan


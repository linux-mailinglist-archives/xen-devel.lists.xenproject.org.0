Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 826D8357C73
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 08:20:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107047.204616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUO1a-0002GU-1V; Thu, 08 Apr 2021 06:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107047.204616; Thu, 08 Apr 2021 06:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUO1Z-0002G5-UU; Thu, 08 Apr 2021 06:20:17 +0000
Received: by outflank-mailman (input) for mailman id 107047;
 Thu, 08 Apr 2021 06:20:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUO1Y-0002Fz-Uf
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 06:20:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20b1fd93-8af7-4eb6-ae70-d88b01b390c3;
 Thu, 08 Apr 2021 06:20:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 673B8AE56;
 Thu,  8 Apr 2021 06:20:15 +0000 (UTC)
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
X-Inumbo-ID: 20b1fd93-8af7-4eb6-ae70-d88b01b390c3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617862815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rwqytcB5B0WIPQt9yvtK6b25nB9sj1W53HWhXgDISW4=;
	b=F6Vv6AI0DbNP68c5Lnwqh8DyYj3qN8xhMJ2UoePtukVKF3Or+ZnVtjfgSo97hczOZPAbvq
	NYzdUDSaoAluRQWdMyXtZQLOJqIRdRNQDZzUH5Vt550Od3GdmJn/wCrPKRQ1uycDYRT188
	6x1MbHblCq1qj6K8H1vkyEB3FX7qDiI=
Subject: Re: [PATCH v3 03/11] x86/vlapic: introduce an EOI callback mechanism
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-4-roger.pau@citrix.com>
 <d18d9e3b-872f-b0cb-aebf-5e55d4433b75@suse.com>
 <YG3djUEiAd9wqQvv@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e5a45339-a79a-a903-0599-86e14f493818@suse.com>
Date: Thu, 8 Apr 2021 08:20:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YG3djUEiAd9wqQvv@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 07.04.2021 18:27, Roger Pau Monné wrote:
> On Wed, Apr 07, 2021 at 04:55:43PM +0200, Jan Beulich wrote:
>> On 31.03.2021 12:32, Roger Pau Monne wrote:
>>> Add a new vlapic_set_irq_callback helper in order to inject a vector
>>> and set a callback to be executed when the guest performs the end of
>>> interrupt acknowledgment.
>>>
>>> Such functionality will be used to migrate the current ad hoc handling
>>> done in vlapic_handle_EOI for the vectors that require some logic to
>>> be executed when the end of interrupt is performed.
>>>
>>> The setter of the callback will be in charge for setting the callback
>>> again on resume. That is the reason why vlapic_set_callback is not a
>>> static function.
>>
>> I'm struggling with your use of "resume" here: Resuming from S3
>> doesn't require re-doing anything that's kept in memory, does it?
>> So what meaning does the word have here?
> 
> Right, I can see the confusion. Resume here means a guest being
> migrated or restored, not Xen itself being resumed. Callbacks are not
> part of the exported guest state, and hence any emulated device that
> requires a callback will have to register it as part of loading the
> saved state.
> 
>> Apart from this, and with the xzalloc_array() change requested
>> by Andrew, this looks good to me.

In which case with this change and "resume" replaced suitably in the
description
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


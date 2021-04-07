Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3CA356F65
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 16:55:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106736.204087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU9at-0002Se-CK; Wed, 07 Apr 2021 14:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106736.204087; Wed, 07 Apr 2021 14:55:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU9at-0002SF-8v; Wed, 07 Apr 2021 14:55:47 +0000
Received: by outflank-mailman (input) for mailman id 106736;
 Wed, 07 Apr 2021 14:55:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjXx=JE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lU9ar-0002Rq-QW
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 14:55:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a5d48c5-54b9-4a86-95a4-9d6c1b8eaa5e;
 Wed, 07 Apr 2021 14:55:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 06E52AC79;
 Wed,  7 Apr 2021 14:55:44 +0000 (UTC)
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
X-Inumbo-ID: 0a5d48c5-54b9-4a86-95a4-9d6c1b8eaa5e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617807344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Py8d3CUcnsKwYhlPbpBJihEdE0AlK3qAg75SbmmHmCk=;
	b=tUlsyzs2bw9uF6vQb/NHMwV+Q3fd2zW0nezJUtkbQI+07/D6UdFQdIT8dIjWXxrqM7SVOF
	NDHqZ3nc0BFiLvR5CpXRsJCydm2+b2magAJ6y2OXhVFOzMv1IAJkoTTUYO6r24y8P2bDCe
	+C3G+SkRPua3f/JIKKll2PrDZJTk5XQ=
Subject: Re: [PATCH v3 03/11] x86/vlapic: introduce an EOI callback mechanism
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d18d9e3b-872f-b0cb-aebf-5e55d4433b75@suse.com>
Date: Wed, 7 Apr 2021 16:55:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210331103303.79705-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 31.03.2021 12:32, Roger Pau Monne wrote:
> Add a new vlapic_set_irq_callback helper in order to inject a vector
> and set a callback to be executed when the guest performs the end of
> interrupt acknowledgment.
> 
> Such functionality will be used to migrate the current ad hoc handling
> done in vlapic_handle_EOI for the vectors that require some logic to
> be executed when the end of interrupt is performed.
> 
> The setter of the callback will be in charge for setting the callback
> again on resume. That is the reason why vlapic_set_callback is not a
> static function.

I'm struggling with your use of "resume" here: Resuming from S3
doesn't require re-doing anything that's kept in memory, does it?
So what meaning does the word have here?

Apart from this, and with the xzalloc_array() change requested
by Andrew, this looks good to me.

Jan


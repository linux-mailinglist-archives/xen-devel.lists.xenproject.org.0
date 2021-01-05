Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F1C2EAFA8
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 17:09:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62075.109681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwou3-0003wa-Kr; Tue, 05 Jan 2021 16:09:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62075.109681; Tue, 05 Jan 2021 16:09:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwou3-0003wB-HH; Tue, 05 Jan 2021 16:09:47 +0000
Received: by outflank-mailman (input) for mailman id 62075;
 Tue, 05 Jan 2021 16:09:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwou1-0003w5-LS
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 16:09:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8fcdc31-025a-4f19-9757-895ce7a1003a;
 Tue, 05 Jan 2021 16:09:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AB35DACAF;
 Tue,  5 Jan 2021 16:09:43 +0000 (UTC)
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
X-Inumbo-ID: e8fcdc31-025a-4f19-9757-895ce7a1003a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609862983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NQhg+w43/YYgdTbKPtDTwWPan7JMlhC/EvzXYmxgHeU=;
	b=vHeHtSpG3QtH30lCEkPMIwno0D8dUsJRlWd39yWV3p6BQ4QXWwwaOyg8nrSeSoK2kSKFkQ
	z/WLs4Qm+aBCgV7RUyz1oe1TZL4L1ODXn1eaDcuwlXq2lcYQnU1L5RHDzbDCxvIgtbxWqa
	jTuKrPuvpbWjNN+FECaWTOmV+yNxOAQ=
Subject: Re: [PATCH 2/4] xen/evtchn: Switch to dmalloc
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20201223163442.8840-1-andrew.cooper3@citrix.com>
 <20201223163442.8840-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c0f7609c-af1c-2296-8362-4dde2848871f@suse.com>
Date: Tue, 5 Jan 2021 17:09:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201223163442.8840-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.12.2020 17:34, Andrew Cooper wrote:
> RFC: Likely more to convert.  This is just a minimal attempt.

Looks complete as far as this one file goes. More can be found
in evtchn_fifo.c of course.

> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -16,6 +16,7 @@
>  
>  #include "event_channel.h"
>  
> +#include <xen/dmalloc.h>
>  #include <xen/init.h>
>  #include <xen/lib.h>
>  #include <xen/errno.h>
> @@ -153,7 +154,7 @@ static struct evtchn *alloc_evtchn_bucket(struct domain *d, unsigned int port)
>      struct evtchn *chn;
>      unsigned int i;
>  
> -    chn = xzalloc_array(struct evtchn, EVTCHNS_PER_BUCKET);
> +    chn = dzalloc_array(d, struct evtchn, EVTCHNS_PER_BUCKET);
>      if ( !chn )
>          return NULL;

There's an error path down from here which also needs converting.

Jan


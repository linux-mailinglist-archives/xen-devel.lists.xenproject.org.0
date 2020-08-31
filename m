Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C8E257476
	for <lists+xen-devel@lfdr.de>; Mon, 31 Aug 2020 09:44:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCeU4-0005WU-6d; Mon, 31 Aug 2020 07:44:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RZUy=CJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kCeU2-0005WI-G9
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 07:44:06 +0000
X-Inumbo-ID: 3c3ce64c-682b-4429-89f4-31a01678d9a5
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c3ce64c-682b-4429-89f4-31a01678d9a5;
 Mon, 31 Aug 2020 07:44:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A6290AD87;
 Mon, 31 Aug 2020 07:44:39 +0000 (UTC)
Subject: Ping: [PATCH v3 5/8] evtchn: add compat struct checking for newer
 sub-ops
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
References: <adb0fe93-c251-b84a-a357-936029af0e9c@suse.com>
 <99e52b76-de0f-13ac-f37a-6e14cd4b566f@suse.com>
Message-ID: <3599eaa2-66b2-9039-829b-2409844d194d@suse.com>
Date: Mon, 31 Aug 2020 09:44:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <99e52b76-de0f-13ac-f37a-6e14cd4b566f@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23.07.2020 17:50, Jan Beulich wrote:
> Various additions to the interface did not get mirrored into the compat
> handling machinery. Luckily all additions were done in ways not making
> any form of translation necessary.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: New.

Anyone?

For the rest of this series, I'm going to put it in with Roger's
R-b-s, as there hasn't been other feedback in over a month. As the
one here is sufficiently simple and of little risk, I think I'll
also time out waiting for an ack or R-b by the end of the week.

Jan

> --- a/xen/common/compat/xlat.c
> +++ b/xen/common/compat/xlat.c
> @@ -54,6 +54,22 @@ CHECK_evtchn_op;
>  #undef xen_evtchn_status
>  #undef xen_evtchn_unmask
>  
> +#define xen_evtchn_expand_array evtchn_expand_array
> +CHECK_evtchn_expand_array;
> +#undef xen_evtchn_expand_array
> +
> +#define xen_evtchn_init_control evtchn_init_control
> +CHECK_evtchn_init_control;
> +#undef xen_evtchn_init_control
> +
> +#define xen_evtchn_reset evtchn_reset
> +CHECK_evtchn_reset;
> +#undef xen_evtchn_reset
> +
> +#define xen_evtchn_set_priority evtchn_set_priority
> +CHECK_evtchn_set_priority;
> +#undef xen_evtchn_set_priority
> +
>  #define xen_mmu_update mmu_update
>  CHECK_mmu_update;
>  #undef xen_mmu_update
> --- a/xen/include/xlat.lst
> +++ b/xen/include/xlat.lst
> @@ -66,8 +66,12 @@
>  ?	evtchn_bind_vcpu		event_channel.h
>  ?	evtchn_bind_virq		event_channel.h
>  ?	evtchn_close			event_channel.h
> +?	evtchn_expand_array		event_channel.h
> +?	evtchn_init_control		event_channel.h
>  ?	evtchn_op			event_channel.h
> +?	evtchn_reset			event_channel.h
>  ?	evtchn_send			event_channel.h
> +?	evtchn_set_priority		event_channel.h
>  ?	evtchn_status			event_channel.h
>  ?	evtchn_unmask			event_channel.h
>  ?	gnttab_cache_flush		grant_table.h
> 



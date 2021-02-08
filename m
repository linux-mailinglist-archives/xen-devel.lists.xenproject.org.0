Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CC6312FD0
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 11:56:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82764.152985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l94D9-0003Ob-3g; Mon, 08 Feb 2021 10:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82764.152985; Mon, 08 Feb 2021 10:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l94D9-0003OB-0R; Mon, 08 Feb 2021 10:56:07 +0000
Received: by outflank-mailman (input) for mailman id 82764;
 Mon, 08 Feb 2021 10:56:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZIyB=HK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l94D7-0003O5-Pt
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 10:56:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c759e767-a26c-49a2-9332-575394cc8971;
 Mon, 08 Feb 2021 10:56:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DF59FAD62;
 Mon,  8 Feb 2021 10:56:02 +0000 (UTC)
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
X-Inumbo-ID: c759e767-a26c-49a2-9332-575394cc8971
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612781763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GDtqT/NkvhN0liuoHeVYmWQQ/qglAed0OLmt4k3vztk=;
	b=cW0ogfxkd/UKFPFOgseBcxImbbi+BEa2vzwQpips5bFo6q8aYGXVXq+PvZUXxpj4jtGzLK
	YHmR6RPl3mvQAdYD9BZv4Tba1cqp5Lnu1nXUcqmbZOqkHVYsMsSQ0TcAM91i9h34kTUQZ3
	HCfENYwEKDGasa2084vdf+EjunuVN1c=
Subject: Re: [PATCH v2 2/3] x86/time: adjust time recording
 time_calibration_tsc_rendezvous()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Claudemir Todo Bom <claudemir@todobom.com>
References: <b8d1d4f8-8675-1393-8524-d060ffb1551a@suse.com>
 <26b71f94-d1c7-d906-5b2a-4e7994d6f7c0@suse.com>
 <YB1vGGl59oNZb5m5@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <861c931e-7922-0b5b-58a9-63e46ba24af0@suse.com>
Date: Mon, 8 Feb 2021 11:56:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YB1vGGl59oNZb5m5@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05.02.2021 17:15, Roger Pau Monné wrote:
> On Mon, Feb 01, 2021 at 01:43:04PM +0100, Jan Beulich wrote:
>> The (stime,tsc) tuple is the basis for extrapolation by get_s_time().
>> Therefore the two better get taken as close to one another as possible.
>> This means two things: First, reading platform time is too early when
>> done on the first iteration. The closest we can get is on the last
>> iteration, immediately before telling other CPUs to write their TSCs
>> (and then also writing CPU0's). While at the first glance it may seem
>> not overly relevant when exactly platform time is read (when assuming
>> that only stime is ever relevant anywhere, and hence the association
>> with the precise TSC values is of lower interest), both CPU frequency
>> changes and the effects of SMT make it unpredictable (between individual
>> rendezvous instances) how long the loop iterations will take. This will
>> in turn lead to higher an error than neccesary in how close to linear
>> stime movement we can get.
>>
>> Second, re-reading the TSC for local recording is increasing the overall
>> error as well, when we already know a more precise value - the one just
>> written.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> I've been thinking this all seems doomed when Xen runs in a virtualized
> environment, and should likely be disabled. There's no point on trying
> to sync the TSC over multiple vCPUs as the scheduling delay between
> them will likely skew any calculations.

We may want to consider to force the equivalent of
"clocksource=tsc" in that case. Otoh a well behaved hypervisor
underneath shouldn't lead to us finding a need to clear
TSC_RELIABLE, at which point this logic wouldn't get engaged
in the first place.

Jan


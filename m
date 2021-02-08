Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7894831315C
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 12:50:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82809.153058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l953Z-00010E-HH; Mon, 08 Feb 2021 11:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82809.153058; Mon, 08 Feb 2021 11:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l953Z-0000zo-Dm; Mon, 08 Feb 2021 11:50:17 +0000
Received: by outflank-mailman (input) for mailman id 82809;
 Mon, 08 Feb 2021 11:50:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZIyB=HK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l953Y-0000zi-10
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 11:50:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a59b54c-0cb5-49f5-8aec-2d17403fdff6;
 Mon, 08 Feb 2021 11:50:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 093A8AD3E;
 Mon,  8 Feb 2021 11:50:10 +0000 (UTC)
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
X-Inumbo-ID: 8a59b54c-0cb5-49f5-8aec-2d17403fdff6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612785010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=khQPCjFLkaUBbFM0VZHYHJDPpvAzDhX5L0EjibS3IuE=;
	b=ZiuWX8Xl97t9TdV0zeuAalqt/N3WciFiF+uG1D4jL3M1AF8v6v2EJYO7GL8OeKkoZP4oqB
	keX9e/52QFb0cay5K9G8JLSWC35eQusxqVXrU2kaz6FWfpYWWtWOvUhz2GydcM/1n7RCAh
	h+1BglsuFbnY2V96i0B6HqwntBMtSEI=
Subject: Re: [PATCH v2 2/3] x86/time: adjust time recording
 time_calibration_tsc_rendezvous()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Claudemir Todo Bom <claudemir@todobom.com>
References: <b8d1d4f8-8675-1393-8524-d060ffb1551a@suse.com>
 <26b71f94-d1c7-d906-5b2a-4e7994d6f7c0@suse.com>
 <YB1vGGl59oNZb5m5@Air-de-Roger>
 <861c931e-7922-0b5b-58a9-63e46ba24af0@suse.com>
 <YCEa7JxPCAzyWqfe@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9d37329c-50fd-81ae-6987-40c81b78e031@suse.com>
Date: Mon, 8 Feb 2021 12:50:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YCEa7JxPCAzyWqfe@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.02.2021 12:05, Roger Pau Monné wrote:
> On Mon, Feb 08, 2021 at 11:56:01AM +0100, Jan Beulich wrote:
>> On 05.02.2021 17:15, Roger Pau Monné wrote:
>>> I've been thinking this all seems doomed when Xen runs in a virtualized
>>> environment, and should likely be disabled. There's no point on trying
>>> to sync the TSC over multiple vCPUs as the scheduling delay between
>>> them will likely skew any calculations.
>>
>> We may want to consider to force the equivalent of
>> "clocksource=tsc" in that case. Otoh a well behaved hypervisor
>> underneath shouldn't lead to us finding a need to clear
>> TSC_RELIABLE, at which point this logic wouldn't get engaged
>> in the first place.
> 
> I got the impression that on a loaded system guests with a non-trivial
> amount of vCPUs might be in trouble to be able to schedule them all
> close enough for the rendezvous to not report a big skew, and thus
> disable TSC_RELIABLE?

No, check_tsc_warp() / tsc_check_reliability() don't have a
problem there. Every CPU reads the shared "most advanced"
stamp before reading its local one. So it doesn't matter how
large the gaps are here. In fact the possible bad effect is
the other way around here - if the scheduling effects are
too heavy, we may mistakenly consider TSCs reliable when
they aren't.

A problem of the kind you describe exists in the actual
rendezvous function. And actually any problem of this kind
can, on a smaller scale, already be be observed with SMT,
because the individual hyperthreads of a core can't
possibly all run at the same time.

As occurs to me only now, I think we can improve accuracy
some (in particular on big systems) by making sure
struct calibration_rendezvous's master_tsc_stamp is not
sharing its cache line with semaphore and master_stime. The
latter get written by (at least) the BSP, while
master_tsc_stamp is stable after the 2nd loop iteration.
Hence on the 3rd and 4th iterations we could even prefetch
it to reduce the delay on the last one.

Jan


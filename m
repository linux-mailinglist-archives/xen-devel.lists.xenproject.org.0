Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8785330A2C1
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 08:38:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79588.144877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6TmD-0001ru-VN; Mon, 01 Feb 2021 07:37:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79588.144877; Mon, 01 Feb 2021 07:37:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6TmD-0001rV-Rs; Mon, 01 Feb 2021 07:37:37 +0000
Received: by outflank-mailman (input) for mailman id 79588;
 Mon, 01 Feb 2021 07:37:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6TmC-0001rQ-NH
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 07:37:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77de3bb1-3abc-4ba6-a741-6e9017ed9156;
 Mon, 01 Feb 2021 07:37:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D2A7BAD18;
 Mon,  1 Feb 2021 07:37:34 +0000 (UTC)
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
X-Inumbo-ID: 77de3bb1-3abc-4ba6-a741-6e9017ed9156
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612165054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sTh2n4NnU4Dc05aqukiyC6j0Tu3DgFwJVfulzJ12f0M=;
	b=XZBp5nBnRwyJK85FMN2KvGV2EragKRqas+ZBENpYp1OB7108QIcJ68DLzzs+DbzXZQoH2J
	h++ehRdwqJiEfFTItcuR6RIFG0wmnIk0K7smuPIEtHxM2i14Mjw2f5XZARVxI8TpKu4Svf
	Qls7xv+X2ZrDB5iIAyiCgOCi1IY9MIw=
Subject: Re: [PATCH RFC 2/2] x86/time: don't move TSC backwards in
 time_calibration_tsc_rendezvous()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Claudemir Todo Bom <claudemir@todobom.com>
References: <35443b5a-1410-7099-a937-e9f537bbe989@suse.com>
 <d0f1f249-293c-5a7f-4b6c-1caeb275e7b9@suse.com>
Message-ID: <ee7e4c77-24e3-9ff8-6f7c-e99860328099@suse.com>
Date: Mon, 1 Feb 2021 08:37:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <d0f1f249-293c-5a7f-4b6c-1caeb275e7b9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.01.2021 17:20, Jan Beulich wrote:
> @@ -1696,6 +1696,21 @@ static void time_calibration_tsc_rendezv
>                  r->master_stime = read_platform_stime(NULL);
>                  r->master_tsc_stamp = rdtsc_ordered();
>              }
> +            else if ( r->master_tsc_stamp < r->max_tsc_stamp )
> +            {
> +                /*
> +                 * We want to avoid moving the TSC backwards for any CPU.
> +                 * Use the largest value observed anywhere on the first
> +                 * iteration and bump up our previously recorded system
> +                 * accordingly.
> +                 */
> +                uint64_t delta = r->max_tsc_stamp - r->master_tsc_stamp;
> +
> +                r->master_stime += scale_delta(delta,
> +                                               &this_cpu(cpu_time).tsc_scale);
> +                r->master_tsc_stamp = r->max_tsc_stamp;
> +            }

I went too far here - adjusting ->master_stime like this is
a mistake. Especially in extreme cases like Claudemir's this
can lead to the read_platform_stime() visible in context
above reading a value behind the previously recorded one,
leading to NOW() moving backwards (temporarily).

Instead of this I think I will want to move the call to
read_platform_stime() to the last iteration, such that the
gap between the point in time when it was taken and the
point in time the TSCs start counting from their new values
gets minimized. In fact I intend that to also do away with
the unnecessary reading back of the TSC in
time_calibration_rendezvous_tail() - we already know the
closest TSC value we can get hold of (without calculations),
which is the one we wrote a few cycles back.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB7A30B95E
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 09:16:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80394.147084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6qrU-0007rr-8C; Tue, 02 Feb 2021 08:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80394.147084; Tue, 02 Feb 2021 08:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6qrU-0007rS-4t; Tue, 02 Feb 2021 08:16:36 +0000
Received: by outflank-mailman (input) for mailman id 80394;
 Tue, 02 Feb 2021 08:16:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=licP=HE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6qrS-0007rN-F6
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 08:16:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad1a5445-1e8b-48b6-beba-0382da2c07d2;
 Tue, 02 Feb 2021 08:16:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C272CAD57;
 Tue,  2 Feb 2021 08:16:32 +0000 (UTC)
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
X-Inumbo-ID: ad1a5445-1e8b-48b6-beba-0382da2c07d2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612253792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o1jo4rfmACOXREMgoKonmem5GnxsE2wCTSrHFtLGgDI=;
	b=mDlujh96hgx8/qCAtPDa8pNIiNOS+y/8flFruo9jZwfK2lW2TJVLhrVwfoEvjn6mQ6TyGz
	y5Sa5G8Uw7NMgoBQMwhfhV1I211tlwEHrOAtCBJjlA6qynC4VX5LRA6dpiQRIStpbO0q6r
	hW6ZCzDuzrj37eepooFpm8gDn4GqWr8=
Subject: Re: [PATCH v2 3/3] x86/time: don't move TSC backwards in
 time_calibration_tsc_rendezvous()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Claudemir Todo Bom <claudemir@todobom.com>
References: <b8d1d4f8-8675-1393-8524-d060ffb1551a@suse.com>
 <80d05abb-4d53-3229-8326-21d79e32dfe4@suse.com>
Message-ID: <22d172b7-bee6-79da-f194-e504ada14871@suse.com>
Date: Tue, 2 Feb 2021 09:16:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <80d05abb-4d53-3229-8326-21d79e32dfe4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.02.2021 13:43, Jan Beulich wrote:
> As per the comment ahead of it, the original purpose of the function was
> to deal with TSCs halted in deep C states. While this probably explains
> why only forward moves were ever expected, I don't see how this could
> have been reliable in case CPU0 was deep-sleeping for a sufficiently
> long time. My only guess here is a hidden assumption of CPU0 never being
> idle for long enough.

Furthermore that comment looks to be contradicting the actual use of
the function: It gets installed when !RELIABLE_TSC, while the comment
would suggest !NONSTOP_TSC. I suppose the comment is simply misleading,
because RELIABLE_TSC implies NONSTOP_TSC according to all the places
where either of the two feature bits gets played with. Plus in the
!NONSTOP_TSC case we write the TSC explicitly anyway when coming back
out of a (deep; see below) C-state.

As an implication from the above mwait_idle_cpu_init() then looks to
pointlessly clear "reliable" when "nonstop" is clear.

It further looks odd that mwait_idle() (unlike acpi_processor_idle())
calls cstate_restore_tsc() independent of what C-state was active.

> @@ -1719,9 +1737,12 @@ static void time_calibration_tsc_rendezv
>              while ( atomic_read(&r->semaphore) > total_cpus )
>                  cpu_relax();
>          }
> +
> +        /* Just in case a read above ended up reading zero. */
> +        tsc += !tsc;
>      }
>  
> -    time_calibration_rendezvous_tail(r, r->master_tsc_stamp);
> +    time_calibration_rendezvous_tail(r, tsc, r->master_tsc_stamp);

This, in particular, wouldn't be valid when !NONSTOP_TSC without
cstate_restore_tsc(). We then wouldn't have a way to know whether
the observed gap is because of the TSC having been halted for a
while (as the comment ahead of the function - imo wrongly, as per
above - suggests), or whether - like in Claudemir's case - the
individual TSCs were offset against one another.

Jan


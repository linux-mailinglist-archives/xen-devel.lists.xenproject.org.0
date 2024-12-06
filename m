Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A409E7A4F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 21:59:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.850509.1264920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJfP8-0006xb-6w; Fri, 06 Dec 2024 20:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 850509.1264920; Fri, 06 Dec 2024 20:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJfP8-0006uk-4P; Fri, 06 Dec 2024 20:58:26 +0000
Received: by outflank-mailman (input) for mailman id 850509;
 Fri, 06 Dec 2024 20:58:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q2bs=S7=linux.microsoft.com=eahariha@srs-se1.protection.inumbo.net>)
 id 1tJfP6-0006ue-If
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 20:58:24 +0000
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d2aa23ba-b414-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 21:58:21 +0100 (CET)
Received: from [100.65.128.154] (unknown [20.236.11.102])
 by linux.microsoft.com (Postfix) with ESMTPSA id 8B63620ACD7A;
 Fri,  6 Dec 2024 12:58:18 -0800 (PST)
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
X-Inumbo-ID: d2aa23ba-b414-11ef-99a3-01e77a169b0f
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8B63620ACD7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1733518699;
	bh=M9PuEUd7fHK0twjnpmT4sQ2WiGKSyXN5nPrU+06sRxI=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=opdIpAACnQeStJ33oACe6p52ZM8f0Sws7Fv8oVZEtnJ34oxYkj2Ifncn0UBE7+8VM
	 /Rer5IHWNKL+Om4cBhthsawIs+kQdevr3ykVw21CBvfVnNLhAZ1lcWLQbVr0aJDoH2
	 0Lv+tHrW7mbf2ysXMzyMfTT7x/zNVB+cEVkkvmJU=
Message-ID: <dab77729-682f-4182-9fb2-cd522ac29b5f@linux.microsoft.com>
Date: Fri, 6 Dec 2024 12:58:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, cocci@inria.fr,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-mm@kvack.org,
 linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 live-patching@vger.kernel.org, linux-sound@vger.kernel.org,
 etnaviv@lists.freedesktop.org, oss-drivers@corigine.com,
 linuxppc-dev@lists.ozlabs.org, Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH v2 00/21] Converge on using secs_to_jiffies()
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <b9fcb12a-b7a4-4c33-836e-67109ce07deb@intel.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <b9fcb12a-b7a4-4c33-836e-67109ce07deb@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/29/2024 4:57 AM, Przemek Kitszel wrote:
> 
> [removed most non-list recipients, it's just too much]
> 
> On 11/15/24 10:26 PM, Easwar Hariharan wrote:
<snip>
>>
>> ---
>> Changes in v2:
>> - EDITME: describe what is new in this series revision.
>> - EDITME: use bulletpoints and terse descriptions.
>> - Link to v1: https://lore.kernel.org/r/20241115-converge-secs-to-
>> jiffies-v1-0-19aadc34941b@linux.microsoft.com
> 
> that is not a proper changelog, you were supposed to edit those
> placeholder entries; please look around for examples
> 
> There is also just too much recipients. Please split up your patches
> into smaller pieces. You will also learn the process on a smaller
> sample.
> 
> And definitively please wait for 48h before reposting such big series.

Yes, sorry, I sent out a v2 in a moment of panic on including the
already accepted patch in v1. I failed to edit the changelog in that
same panic. I'll try to not panic and do better in the future.

> 
> Regarding code - you could also convert msecs_to_jiffies(const * HZ),
> there are 10 that are greppable.
> 

Those seem to be mistakes. const*HZ is a seconds-denominated timeout,
being passed to msecs_to_jiffies() which will treat it as a
millisecond-denominated timeout resulting in an excessively long
timeout. I suppose that's better than a too-short timeout, and
apparently it's been working fine all along since hardware responds
before the too-long timeout expires. Half of them are in
drivers/scsi/arcmsr/arcmsr_hba.c and the pattern has apparently been
there since 2010.

Thanks,
Easwar


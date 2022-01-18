Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17008492508
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 12:38:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258452.445117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9mno-0007t9-5T; Tue, 18 Jan 2022 11:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258452.445117; Tue, 18 Jan 2022 11:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9mno-0007qZ-2H; Tue, 18 Jan 2022 11:37:28 +0000
Received: by outflank-mailman (input) for mailman id 258452;
 Tue, 18 Jan 2022 11:37:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iVgW=SC=cantab.net=dvrabel@srs-se1.protection.inumbo.net>)
 id 1n9mnm-0007qT-6D
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 11:37:26 +0000
Received: from smarthost01c.ixn.mail.zen.net.uk
 (smarthost01c.ixn.mail.zen.net.uk [212.23.1.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0130b2a6-7853-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 12:37:24 +0100 (CET)
Received: from [82.70.146.41] (helo=pear.davidvrabel.org.uk)
 by smarthost01c.ixn.mail.zen.net.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 (envelope-from <dvrabel@cantab.net>)
 id 1n9mnk-0000SO-29; Tue, 18 Jan 2022 11:37:24 +0000
Received: from apple.davidvrabel.org.uk ([82.70.146.43])
 by pear.davidvrabel.org.uk with esmtp (Exim 4.92)
 (envelope-from <dvrabel@cantab.net>)
 id 1n9mnj-0007o5-5T; Tue, 18 Jan 2022 11:37:23 +0000
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
X-Inumbo-ID: 0130b2a6-7853-11ec-9bbc-9dff3e4ee8c5
Message-ID: <a4eedbc9-f5bd-2195-679a-77747614c258@cantab.net>
Date: Tue, 18 Jan 2022 11:37:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <6c50c7b6-e521-e34f-1808-a4e2961b807e@suse.com>
 <5d3db5f4-44db-b782-656b-d755fbf4c441@suse.com>
From: David Vrabel <dvrabel@cantab.net>
In-Reply-To: <5d3db5f4-44db-b782-656b-d755fbf4c441@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 82.70.146.43
X-SA-Exim-Mail-From: dvrabel@cantab.net
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	pear.davidvrabel.org.uk
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,SPF_NEUTRAL,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.2
Subject: Re: [PATCH] x86/time: further improve TSC / CPU freq calibration
 accuracy
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on pear.davidvrabel.org.uk)
X-Originating-smarthost01c-IP: [82.70.146.41]
Feedback-ID: 82.70.146.41



On 18/01/2022 08:50, Jan Beulich wrote:
> On 13.01.2022 14:41, Jan Beulich wrote:
>> Calibration logic assumes that the platform timer (HPET or ACPI PM
>> timer) and the TSC are read at about the same time. This assumption may
>> not hold when a long latency event (e.g. SMI or NMI) occurs between the
>> two reads. Reduce the risk of reading uncorrelated values by doing at
>> least four pairs of reads, using the tuple where the delta between the
>> enclosing TSC reads was smallest. From the fourth iteration onwards bail
>> if the new TSC delta isn't better (smaller) than the best earlier one.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> When running virtualized, scheduling in the host would also constitute
> long latency events. I wonder whether, to compensate for that, we'd want
> more than 3 "base" iterations, as I would expect scheduling events to
> occur more frequently than e.g. SMI (and with a higher probability of
> multiple ones occurring in close succession).

Should Xen be continually or periodically recalibrating? Rather than 
trying to get it perfect at the start of day?

You may also be able to find inspiration from the design or 
implementation of the Precision Time Protocol which has to similarly 
filter out outliers due to transmission delays.

David


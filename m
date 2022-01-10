Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC17489C77
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 16:45:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255384.437595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6wq3-0005JP-F1; Mon, 10 Jan 2022 15:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255384.437595; Mon, 10 Jan 2022 15:44:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6wq3-0005HV-C9; Mon, 10 Jan 2022 15:44:03 +0000
Received: by outflank-mailman (input) for mailman id 255384;
 Mon, 10 Jan 2022 15:44:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RiBW=R2=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n6wq2-0005HP-3k
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 15:44:02 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f598a00-722c-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 16:43:58 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47784)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n6wpv-000nlQ-2Z (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 10 Jan 2022 15:43:55 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 89AB01FE75;
 Mon, 10 Jan 2022 15:43:55 +0000 (GMT)
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
X-Inumbo-ID: 1f598a00-722c-11ec-81c1-a30af7de8005
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <0b2d6240-5780-b8ea-8828-ece44047cd63@srcf.net>
Date: Mon, 10 Jan 2022 15:43:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: James Dingwall <james-xen@dingwall.me.uk>, alexander.rossa@ncr.com,
 xen-devel@lists.xenproject.org
References: <20210721092958.GA2502468@dingwall.me.uk>
 <c9c6778d-9823-4b07-fb48-604acef1f3de@suse.com>
 <20210726123332.GA3844057@dingwall.me.uk>
 <06be7360-0235-3773-b833-3e0d65512092@suse.com>
 <20211105152501.GA485838@dingwall.me.uk>
 <20220106150809.GA856484@dingwall.me.uk>
 <78540c18-c54e-07e8-c099-d7bfd29bea91@suse.com>
 <YdwodzmyvNwGJaSM@Air-de-Roger>
 <539e31bc-3e68-9e9d-3bb3-2d0f1b2834fc@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: xen 4.14.3 incorrect (~3x) cpu frequency reported
In-Reply-To: <539e31bc-3e68-9e9d-3bb3-2d0f1b2834fc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/01/2022 13:11, Jan Beulich wrote:
> On 10.01.2022 13:37, Roger Pau Monné wrote:
>> On Fri, Jan 07, 2022 at 12:39:04PM +0100, Jan Beulich wrote:
>>> @@ -415,16 +416,35 @@ static int64_t __init init_hpet(struct p
>>>  
>>>      pts->frequency = hpet_rate;
>>>  
>>> +for(i = 0; i < 16; ++i) {//temp
>>>      count = hpet_read32(HPET_COUNTER);
>>>      start = rdtsc_ordered();
>>>      target = count + CALIBRATE_VALUE(hpet_rate);
>>>      if ( target < count )
>>>          while ( hpet_read32(HPET_COUNTER) >= count )
>>>              continue;
>>> -    while ( hpet_read32(HPET_COUNTER) < target )
>>> +    while ( (count = hpet_read32(HPET_COUNTER)) < target )
>>>          continue;
>>>  
>>> -    return (rdtsc_ordered() - start) * CALIBRATE_FRAC;
>>> +    expired = rdtsc_ordered() - start;
>> There's also a window between the HPET read and the TSC read where an
>> SMI/NMI could cause a wrong frequency detection.
> Right, as said in an earlier reply I did notice this myself (actually
> on the way home on Friday). As also said there, for now I can't see
> any real (i.e. complete) solution to this and the similar instances
> of the issue elsewhere.

Calibration loops like this cannot be made robust.  This is specifically
why frequency information is being made available via architectural
means, and is available via non-architectural means in other cases.

There's a whole bunch of situations (#STOPCLK, TERM and PSMI off the top
of my head, but I bet HDC will screw with things too) which will mess
with any calibration loop, even if you could disable SMIs.  While,
mechanically, we can disable SMIs on AMD with CLGI, we absolutely
shouldn't run a calibration loop like this with SMIs disabled.


Much as I hate to suggest it, we should parse the frequency out of the
long CPUID string, and compare it to the calibration time.  (This
technique is mandated in the Intel BWG during very early setup.)

If it is different by a large margin, rerun the calibration, and if it
is still different, complain loudly into the logs.  This will fix a
one-off-spurious event, whereas if e.g. the system is thermally
throttling due to a bad heat sync, there is nothing software can do to
recover the system.

~Andrew


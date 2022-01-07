Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 502304876D6
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jan 2022 12:52:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254399.436218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5nmc-0006um-Qx; Fri, 07 Jan 2022 11:51:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254399.436218; Fri, 07 Jan 2022 11:51:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5nmc-0006rZ-NK; Fri, 07 Jan 2022 11:51:46 +0000
Received: by outflank-mailman (input) for mailman id 254399;
 Fri, 07 Jan 2022 11:51:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VgWa=RX=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n5nmb-0006rT-4v
 for xen-devel@lists.xenproject.org; Fri, 07 Jan 2022 11:51:45 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ea913f4-6fb0-11ec-9ce5-af14b9085ebd;
 Fri, 07 Jan 2022 12:51:44 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:46210)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n5nmV-000L8C-9c (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 07 Jan 2022 11:51:40 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 502A21FA57;
 Fri,  7 Jan 2022 11:51:39 +0000 (GMT)
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
X-Inumbo-ID: 2ea913f4-6fb0-11ec-9ce5-af14b9085ebd
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <9295e128-fd61-0fa2-70f0-c0132cd0f2db@srcf.net>
Date: Fri, 7 Jan 2022 11:51:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, James Dingwall <james-xen@dingwall.me.uk>
Cc: alexander.rossa@ncr.com, xen-devel@lists.xenproject.org
References: <20210721092958.GA2502468@dingwall.me.uk>
 <c9c6778d-9823-4b07-fb48-604acef1f3de@suse.com>
 <20210726123332.GA3844057@dingwall.me.uk>
 <06be7360-0235-3773-b833-3e0d65512092@suse.com>
 <20211105152501.GA485838@dingwall.me.uk>
 <20220106150809.GA856484@dingwall.me.uk>
 <76c0e41b-f0a0-60e5-f2b4-d19724ee2db2@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: xen 4.14.3 incorrect (~3x) cpu frequency reported
In-Reply-To: <76c0e41b-f0a0-60e5-f2b4-d19724ee2db2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/01/2022 16:00, Jan Beulich wrote:
> On 06.01.2022 16:08, James Dingwall wrote:
>>>> On Wed, Jul 21, 2021 at 12:59:11PM +0200, Jan Beulich wrote:                                                                            
>>>>> On 21.07.2021 11:29, James Dingwall wrote:                                                                                             
>>>>>> We have a system which intermittently starts up and reports an incorrect cpu frequency:                                               
>> ...
>>>> I'm sorry to ask, but have you got around to actually doing that? Or
>>>> else is resolving this no longer of interest?
>> We have experienced an occurence of this issue on 4.14.3 with 'loglvl=all'
>> present on the xen command line.  I have attached the 'xl dmesg' output for
>> the fast MHz boot, the diff from the normal case is small so I've not added
>> that log separately:
>>
>> --- normal-mhz/xl-dmesg.txt     2022-01-06 14:13:47.231465234 +0000
>> +++ funny-mhz/xl-dmesg.txt      2022-01-06 13:45:43.825148510 +0000
>> @@ -211,7 +211,7 @@
>>  (XEN)  cap enforcement granularity: 10ms
>>  (XEN) load tracking window length 1073741824 ns
>>  (XEN) Platform timer is 24.000MHz HPET
>> -(XEN) Detected 2294.639 MHz processor.
>> +(XEN) Detected 7623.412 MHz processor.
>>  (XEN) EFI memory map:
>>  (XEN)  0000000000000-0000000007fff type=3 attr=000000000000000f
>>  (XEN)  0000000008000-000000003cfff type=7 attr=000000000000000f
>> @@ -616,6 +616,7 @@
>>  (XEN) PCI add device 0000:b7:00.1
>>  (XEN) PCI add device 0000:b7:00.2
>>  (XEN) PCI add device 0000:b7:00.3
>> +(XEN) Platform timer appears to have unexpectedly wrapped 10 or more times.
>>  (XEN) [VT-D]d0:PCIe: unmap 0000:65:00.2
>>  (XEN) [VT-D]d32753:PCIe: map 0000:65:00.2
>>  (XEN) [VT-D]d0:PCIe: unmap 0000:65:00.1
> Thanks. In an earlier mail the reported value was 6895.384 MHz, but I
> guess that was on a different system (with a base freq of 2200 MHz).
> I wonder how stable the too high value is ...
>
> For the moment I have only one possibly explanation: A SMI hitting in
> the middle of the tail of init_hpet() (or init_pmtimer()), taking long
> enough to cause the function to return way too large a number. With a
> 50ms calibration period that would be about 166ms. I vaguely recall
> having heard of SMI potentially taking this long.

SMI's are stupidly long.  To avoid leaking secrets via speculation, SMIs
have to rendezvous at least the sibling threads, and SMM entry/exit
undergoes every flushing action which has been slowing down software
since 2018.

You can confirm SMIs using MSR_SMI_COUNT (0x34).  It's
non-architectural, but is present in Nehalem and later.

~Andrew


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4551E46D4FA
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 15:01:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242271.419061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muxV7-00066g-6n; Wed, 08 Dec 2021 14:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242271.419061; Wed, 08 Dec 2021 14:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muxV7-00064h-3j; Wed, 08 Dec 2021 14:00:53 +0000
Received: by outflank-mailman (input) for mailman id 242271;
 Wed, 08 Dec 2021 14:00:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cpXy=QZ=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1muxV5-00064a-R5
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 14:00:51 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fb6bf28-582f-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 15:00:50 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:35758)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1muxV3-0006PR-7p (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 08 Dec 2021 14:00:49 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 12BBD1FB51;
 Wed,  8 Dec 2021 14:00:49 +0000 (GMT)
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
X-Inumbo-ID: 3fb6bf28-582f-11ec-a831-37629979565c
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <4176f64e-fdb1-8d23-d226-bde5e473883b@srcf.net>
Date: Wed, 8 Dec 2021 14:00:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20211203073058.10980-1-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] tools/libs/light: set video_mem for PVH guests
In-Reply-To: <20211203073058.10980-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/12/2021 07:30, Juergen Gross wrote:
> The size of the video memory of PVH guests should be set to 0 in case
> no value has been specified.
>
> Doing not so will leave it to be -1, resulting in an additional 1 kB
> of RAM being advertised in the memory map (here the output of a PVH
> Mini-OS boot with 16 MB of RAM assigned):
>
> Memory map:
> 000000000000-0000010003ff: RAM
> 0000feff8000-0000feffffff: Reserved
> 0000fc008000-0000fc00803f: ACPI
> 0000fc000000-0000fc000fff: ACPI
> 0000fc001000-0000fc007fff: ACPI

The patch itself is fine, but some further observations based on the
memory map alone.

It is rude to provide an unsorted memory map.

The LAPIC range is required to be reserved by the ACPI spec, missing
here.  Conversely, it's unclear what the reserved region is trying to
describe.

Of the 3 ACPI ranges, one is RSDP (the first 64 bytes), one is the info
block (4k), and one is the ACPI tables themselves.

RSDP really ought to be merged into the same block as the rest of the
ACPI tables.

The info block must not be marked ACPI reclaimable RAM, because it is
referenced by AML inside the DSDT/etc.  This is a very serious issue if
the OS actually exercises its right to reclaim those regions and use
them as RAM.

~Andrew


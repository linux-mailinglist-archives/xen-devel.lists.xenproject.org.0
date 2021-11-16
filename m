Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D914531D6
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 13:10:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226266.390940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmxHP-0000Gb-P2; Tue, 16 Nov 2021 12:09:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226266.390940; Tue, 16 Nov 2021 12:09:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmxHP-0000E5-M4; Tue, 16 Nov 2021 12:09:39 +0000
Received: by outflank-mailman (input) for mailman id 226266;
 Tue, 16 Nov 2021 12:09:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G1Gk=QD=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mmxHO-0000Dy-AY
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 12:09:38 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fff80e1-46d6-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 13:09:35 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47120)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mmxHK-000N0E-hc (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 16 Nov 2021 12:09:34 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 3DA791FAC8;
 Tue, 16 Nov 2021 12:09:34 +0000 (GMT)
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
X-Inumbo-ID: 0fff80e1-46d6-11ec-9787-a32c541c8605
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <e1efcf93-b633-26f2-31f2-9ee53563a41b@srcf.net>
Date: Tue, 16 Nov 2021 12:09:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v2 0/6] x86: ACPI / APIC / IOMMU interaction
In-Reply-To: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2021 12:30, Jan Beulich wrote:
> While reworking patch 1 (the only one here that I consider a candidate
> for 4.16; see there) I stumbled over quite a few things that have long
> been ripe for cleaning up. Hence the tail of 5 further patches ...
>
> 1: x2APIC: defer probe until after IOMMU ACPI table parsing
> 2: APIC: drop clustered_apic_check() hook
> 3: APIC: drop {acpi_madt,mps}_oem_check() hooks
> 4: APIC: drop probe_default()
> 5: APIC: rename cmdline_apic
> 6: ACPI: drop dead interpreter-related code

Patches 2 thru 6 clean up an area I'd recently stumbled upon.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Since they clean up a pile of function pointers, I've pulled them into 
x86-next.


Patch 1 is looking very risky at this point, especially given the late 
correction, and I think it would be wise to wait for 4.17.

~Andrew


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09021476F55
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 12:01:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247859.427431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxoUp-0002SA-Fe; Thu, 16 Dec 2021 11:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247859.427431; Thu, 16 Dec 2021 11:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxoUp-0002PI-Bd; Thu, 16 Dec 2021 11:00:23 +0000
Received: by outflank-mailman (input) for mailman id 247859;
 Thu, 16 Dec 2021 11:00:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sk45=RB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mxoUn-0002PC-JQ
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 11:00:21 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b12132c-5e5f-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 12:00:19 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:43862)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mxoUk-000aVM-gZ (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 16 Dec 2021 11:00:18 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 01E271FA47;
 Thu, 16 Dec 2021 11:00:17 +0000 (GMT)
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
X-Inumbo-ID: 5b12132c-5e5f-11ec-9e60-abaf8a552007
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <cb9bea36-9feb-dbc7-ce36-38fd42792f11@srcf.net>
Date: Thu, 16 Dec 2021 11:00:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] revert "hvmloader: PA range 0xfc000000-0xffffffff should
 be UC"
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <036c6899-dbfe-eca8-7974-5a13d20455a7@suse.com>
 <YbsMwIYFULP5sXQP@Air-de-Roger>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <YbsMwIYFULP5sXQP@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/12/2021 09:54, Roger Pau Monné wrote:
> On Tue, Dec 14, 2021 at 09:21:22AM +0100, Jan Beulich wrote:
>> This reverts commit c22bd567ce22f6ad9bd93318ad0d7fd1c2eadb0d.
>>
>> While its description is correct from an abstract or real hardware pov,
>> the range is special inside HVM guests. The range being UC in particular
>> gets in the way of OVMF, which places itself at [FFE00000,FFFFFFFF].
> I would assume this range to be unpopulated? Does hvmloader populate
> it in order to place ovmf?

It's generally not unpopulated.  The video RAM lives there until the VGA
BAR is reprogrammed.

The reason OVMF places itself there is because it is where the real SPI
ROM is mapped in address space on a real system.

>> While this is benign to epte_get_entry_emt() as long as the IOMMU isn't
>> enabled for a guest, it becomes a very noticable problem otherwise: It
>> takes about half a minute for OVMF to decompress itself into its
>> designated address range.
>>
>> And even beyond OVMF there's no reason to have e.g. the ACPI memory
>> range marked UC.
>>
>> Fixes: c22bd567ce22 ("hvmloader: PA range 0xfc000000-0xffffffff should be UC")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

~Andrew




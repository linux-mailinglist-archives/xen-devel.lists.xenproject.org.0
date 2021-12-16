Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB70547700B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 12:17:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247879.427475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxolA-0005y0-Ol; Thu, 16 Dec 2021 11:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247879.427475; Thu, 16 Dec 2021 11:17:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxolA-0005wD-Lc; Thu, 16 Dec 2021 11:17:16 +0000
Received: by outflank-mailman (input) for mailman id 247879;
 Thu, 16 Dec 2021 11:17:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sk45=RB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mxol9-0005w7-7f
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 11:17:15 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7db1f22-5e61-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 12:17:13 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:44402)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mxol6-000M1T-2i (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 16 Dec 2021 11:17:12 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 985681FAC8;
 Thu, 16 Dec 2021 11:17:12 +0000 (GMT)
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
X-Inumbo-ID: b7db1f22-5e61-11ec-9e60-abaf8a552007
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <e4c8e8e7-b326-c201-24bc-44c25c0aafe0@srcf.net>
Date: Thu, 16 Dec 2021 11:17:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <036c6899-dbfe-eca8-7974-5a13d20455a7@suse.com>
 <YbsMwIYFULP5sXQP@Air-de-Roger>
 <cb9bea36-9feb-dbc7-ce36-38fd42792f11@srcf.net>
 <YbseXUE0byGJCzsy@Air-de-Roger>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] revert "hvmloader: PA range 0xfc000000-0xffffffff should
 be UC"
In-Reply-To: <YbseXUE0byGJCzsy@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/12/2021 11:09, Roger Pau Monné wrote:
> On Thu, Dec 16, 2021 at 11:00:17AM +0000, Andrew Cooper wrote:
>> On 16/12/2021 09:54, Roger Pau Monné wrote:
>>> On Tue, Dec 14, 2021 at 09:21:22AM +0100, Jan Beulich wrote:
>>>> This reverts commit c22bd567ce22f6ad9bd93318ad0d7fd1c2eadb0d.
>>>>
>>>> While its description is correct from an abstract or real hardware pov,
>>>> the range is special inside HVM guests. The range being UC in particular
>>>> gets in the way of OVMF, which places itself at [FFE00000,FFFFFFFF].
>>> I would assume this range to be unpopulated? Does hvmloader populate
>>> it in order to place ovmf?
>> It's generally not unpopulated.  The video RAM lives there until the VGA
>> BAR is reprogrammed.
> Right, but that's an MMIO area from guests PoV, even if in our
> implementation is backed by RAM pages.
>
>> The reason OVMF places itself there is because it is where the real SPI
>> ROM is mapped in address space on a real system.
> Just to clarify my understanding, this is not reported as a RAM region
> to guests? So hvmloader or the domain builder populates this with RAM
> to place OVMF, even if not reported as a RAM region in the memory map
> (much like with ACPI tables for example).
>
> I wonder whether we should have some kind of document or code comment
> about the guest memory layout (maybe there's one and I'm missing it).

Like most things with guest physmap handling, it's broken and held
together with hope.

Yes, it's logically an MMIO region, but actually "just plain RAM" under
the hood.

What should happen is the domain builder place OVMF there directly. 
OVMF is linked to run there, and there ought to be no hvmloader involved
for UEFI guests, and there shouldn't be any copying into place
required.  That was a very short sited move on behalf of the OVMF
support logic, and I guarantee you that it creates more problems than it
allegedly solves.

~Andrew


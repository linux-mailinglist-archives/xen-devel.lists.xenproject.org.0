Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E18365F410C
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 12:50:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415403.659973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1offUe-0007fg-8s; Tue, 04 Oct 2022 10:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415403.659973; Tue, 04 Oct 2022 10:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1offUe-0007dN-6C; Tue, 04 Oct 2022 10:49:44 +0000
Received: by outflank-mailman (input) for mailman id 415403;
 Tue, 04 Oct 2022 10:49:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=02wi=2F=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1offUd-0007dH-3y
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 10:49:43 +0000
Received: from ppsw-30.srv.uis.cam.ac.uk (ppsw-30.srv.uis.cam.ac.uk
 [131.111.8.130]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f83ac6d-43d2-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 12:49:41 +0200 (CEST)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:38408)
 by ppsw-30.srv.uis.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1offUV-000oi0-J2 (Exim 4.96) (return-path <amc96@srcf.net>);
 Tue, 04 Oct 2022 11:49:35 +0100
Received: from [10.80.2.8] (default-46-102-197-194.interdsl.co.uk
 [46.102.197.194]) (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 9DF331FC0D;
 Tue,  4 Oct 2022 11:49:35 +0100 (BST)
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
X-Inumbo-ID: 3f83ac6d-43d2-11ed-9377-c1cf23e5d27e
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <4f55fc1b-30b0-c5bf-bfec-bb237b8c9379@srcf.net>
Date: Tue, 4 Oct 2022 11:49:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
 <Yzb9BDGc45OshRZN@MacBook-Air-de-Roger.local>
 <df0dc3e1-da12-9d42-b652-e33419134d38@suse.com>
 <Yzv92zTdfG748MXO@MacBook-Air-de-Roger.local>
 <19befbce-ac16-19fe-25a0-73678ce440c0@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use to
 ordinary RAM
In-Reply-To: <19befbce-ac16-19fe-25a0-73678ce440c0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/10/2022 11:23, Jan Beulich wrote:
> On 04.10.2022 11:33, Roger Pau Monné wrote:
>> On Tue, Oct 04, 2022 at 10:06:36AM +0200, Jan Beulich wrote:
>>> On 30.09.2022 16:28, Roger Pau Monné wrote:
>>>> On Fri, Sep 30, 2022 at 09:50:40AM +0200, Jan Beulich wrote:
>>>>> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
>>>>> higher priority than the type of the range. To avoid accessing memory at
>>>>> runtime which was re-used for other purposes, make
>>>>> efi_arch_process_memory_map() follow suit. While on x86 in theory the
>>>>> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
>>>>> E820_ACPI memory there and hence that type's handling can be left alone.
>>>> What about dom0?  Should it be translated to E820_RESERVED so that
>>>> dom0 doesn't try to use it either?
>>> I'm afraid I don't understand the questions. Not the least because I
>>> think "it" can't really mean "dom0" from the earlier sentence.
>> Sorry, let me try again:
>>
>> The memory map provided to dom0 will contain E820_ACPI entries for
>> memory ranges with the EFI_MEMORY_RUNTIME attributes in the EFI memory
>> map.  Is there a risk from dom0 reclaiming such E820_ACPI ranges,
>> overwriting the data needed for runtime services?
> How would Dom0 go about doing so?

Zeroing the memory and putting it into its own heap.

You seem to be presuming that some unwritten and unenforced rules exist.

Once dom0 has booted, Xen cannot safety touch any ACPI reclaimable
range.  It doesn't go wrong in practice because OSes don't actually
reclaim the reclaimable ranges (which is also why Xen HVM guests don't
explode either.)

~Andrew


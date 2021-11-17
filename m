Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 944D6454560
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 12:10:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226744.391938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnIpI-00015m-E3; Wed, 17 Nov 2021 11:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226744.391938; Wed, 17 Nov 2021 11:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnIpI-00011U-AP; Wed, 17 Nov 2021 11:10:04 +0000
Received: by outflank-mailman (input) for mailman id 226744;
 Wed, 17 Nov 2021 11:10:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tBek=QE=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mnIpH-0000qH-7r
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 11:10:03 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e816f481-4796-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 12:10:01 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:59708)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mnIpE-000Xw4-7t (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 17 Nov 2021 11:10:00 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 28D1D1FC53;
 Wed, 17 Nov 2021 11:10:00 +0000 (GMT)
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
X-Inumbo-ID: e816f481-4796-11ec-a9d2-d9f7a1cc8784
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <d2650a7e-f681-301c-6959-bc84a502255a@srcf.net>
Date: Wed, 17 Nov 2021 11:09:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <b6d598cd-c244-2b7f-c731-fe839df3382e@suse.com>
 <b62a87ca-b68f-76fd-51c6-114e8b8e125b@suse.com>
 <YZTDkNRY5pMLFUR6@Air-de-Roger>
 <fe31a1b4-8c66-701d-f951-6426fa72252c@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: PCI pass-through vs PoD
In-Reply-To: <fe31a1b4-8c66-701d-f951-6426fa72252c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/11/2021 10:13, Jan Beulich wrote:
> On 17.11.2021 09:55, Roger Pau Monné wrote:
>> On Wed, Nov 17, 2021 at 09:39:17AM +0100, Jan Beulich wrote:
>>> On 13.09.2021 11:02, Jan Beulich wrote:
>>>> libxl__domain_config_setdefault() checks whether PoD is going to be
>>>> enabled and fails domain creation if at the same time devices would get
>>>> assigned. Nevertheless setting up of IOMMU page tables is allowed.
>> I'm unsure whether allowing enabling the IOMMU with PoD is the right
>> thing to do, at least for our toolstack.
> May I ask about the reasons of you being unsure?

PoD and passthrough is a total nonsense.  You cannot have IOMMU mappings 
to bits of the guest physical address space which don't exist.

It is now the case that IOMMU (or not) must be specified at domain 
creation time, which is ahead of creating PoD pages.  Certainly as far 
as Xen is concerned, the logic probably wants reversing to have 
add_to_physmap&friends reject PoD if an IOMMU was configured.

A toolstack could, in principle, defer the decision to first device 
assignment.

However, this is terrible behaviour all around, because one way or 
another we've got to force-populate all PoD pages (which is potentially 
minutes worth of work to do), and liable to suffer -ENOMEM, or we have 
to reject a control operation with -EBUSY for a task which is dependent 
on the guest kernel actions in a known-buggy area.


There is no point trying to make this work.  If a user wants a device, 
they don't get to have PoD.  Anything else is a waste of time and effort 
on our behalf for a usecase that doesn't exist in practice.

~Andrew


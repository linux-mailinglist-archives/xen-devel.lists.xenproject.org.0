Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 405714546ED
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 14:08:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226850.392162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnKel-0005pn-9m; Wed, 17 Nov 2021 13:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226850.392162; Wed, 17 Nov 2021 13:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnKel-0005nV-6i; Wed, 17 Nov 2021 13:07:19 +0000
Received: by outflank-mailman (input) for mailman id 226850;
 Wed, 17 Nov 2021 13:07:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tBek=QE=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mnKej-0005nP-Bc
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 13:07:17 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48a91cc4-47a7-11ec-9787-a32c541c8605;
 Wed, 17 Nov 2021 14:07:15 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47420)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mnKeg-000gfD-hF (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 17 Nov 2021 13:07:14 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 1EB8B1FBFC;
 Wed, 17 Nov 2021 13:07:14 +0000 (GMT)
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
X-Inumbo-ID: 48a91cc4-47a7-11ec-9787-a32c541c8605
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <5c503268-f729-ae02-c9f0-d015cdc747f9@srcf.net>
Date: Wed, 17 Nov 2021 13:07:13 +0000
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
 <d2650a7e-f681-301c-6959-bc84a502255a@srcf.net>
 <3d7d5069-591d-4535-c13a-5976e1172a68@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: PCI pass-through vs PoD
In-Reply-To: <3d7d5069-591d-4535-c13a-5976e1172a68@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/11/2021 11:23, Jan Beulich wrote:
> On 17.11.2021 12:09, Andrew Cooper wrote:
>> On 17/11/2021 10:13, Jan Beulich wrote:
>>> On 17.11.2021 09:55, Roger Pau Monné wrote:
>>>> On Wed, Nov 17, 2021 at 09:39:17AM +0100, Jan Beulich wrote:
>>>>> On 13.09.2021 11:02, Jan Beulich wrote:
>>>>>> libxl__domain_config_setdefault() checks whether PoD is going to be
>>>>>> enabled and fails domain creation if at the same time devices would get
>>>>>> assigned. Nevertheless setting up of IOMMU page tables is allowed.
>>>> I'm unsure whether allowing enabling the IOMMU with PoD is the right
>>>> thing to do, at least for our toolstack.
>>> May I ask about the reasons of you being unsure?
>> PoD and passthrough is a total nonsense.  You cannot have IOMMU mappings
>> to bits of the guest physical address space which don't exist.
>>
>> It is now the case that IOMMU (or not) must be specified at domain
>> creation time, which is ahead of creating PoD pages.  Certainly as far
>> as Xen is concerned, the logic probably wants reversing to have
>> add_to_physmap&friends reject PoD if an IOMMU was configured.
>>
>> A toolstack could, in principle, defer the decision to first device
>> assignment.
> Right, which is what I consider the preferred approach.

Why?

Just because something is technically possible, does not mean it is an 
appropriate or clever thing to do.

In this case, we're talking about extra complexity in Xen and the 
toolstack, which in the very best case comes with unattractive user 
experience properties, to "fix" an issue which doesn't happen in practice.

>> and liable to suffer -ENOMEM,
> Not if (as suggested) we first check that the PoD cache is large enough
> to cover all PoD entries.

Just because at this instant we have enough free RAM to force-populate 
all PoD entries doesn't mean the same is true in 2 minutes time after 
we've been slowly force-populating a massive VM.

Yes, there are heuristics we can use to short-circuit the failure early, 
but that's still spelt -ENOMEM and reported to the user as such.

The only way to succeed here is to force populate the VM and to have not 
suffered -ENOMEM by the end of this task.

>> or we have
>> to reject a control operation with -EBUSY for a task which is dependent
>> on the guest kernel actions in a known-buggy area.
> Why reject anything?

Because the guest kernel has no knowledge of nor the ability to query 
the PoD status of a page, the only way to not have things malfunction is 
to enforce that there are no P2M entries of type PoD when devices are 
assigned.

If you don't want to / can't force-populate the entire VM prior to 
having device assigned, then the assign operation needs to fail.

>> There is no point trying to make this work.  If a user wants a device,
>> they don't get to have PoD.  Anything else is a waste of time and effort
>> on our behalf for a usecase that doesn't exist in practice.
> Not sure where you take the latter from. I suppose I'll submit the patch
> as I have it now (once I have properly resolved dependencies on other
> patches I have queued and/or pending), and if that's not deemed acceptable
> plus if at the same time I don't really agree with proposed alternatives,
> I'll leave fixing the bug to someone else. Of course the expectation then
> is that such a bug fix come forward within a reasonable time frame ...

What bug?  PoD and PCI Passthrough are mutually exclusive technologies.

We can (now) tell up front when a VM is configured with these mutually 
exclusive options.  Such a configuration should be rejected as early as 
possible.


What you're talking about is introducing extra complexity to explicitly 
support running the VM in a known-incompatible configuration, with the 
decision point for fixing said incompatibility deferred until runtime 
and now with a possibility of "genuinely can't this to become compatible".

Failing device assignment (potentially after a multi-minute wait) with 
"well you shouldn't have enabled PoD to begin with, you fool" is clearly 
worse behaviour than refusing to create such a VM in the first place, 
and you need a far far better reason than "because it's technically 
possible" to justify doing this.

~Andrew


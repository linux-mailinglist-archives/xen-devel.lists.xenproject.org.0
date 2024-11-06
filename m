Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE019BF3E4
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 18:06:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831288.1246503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8jSq-00067X-1q; Wed, 06 Nov 2024 17:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831288.1246503; Wed, 06 Nov 2024 17:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8jSp-00065i-Va; Wed, 06 Nov 2024 17:05:03 +0000
Received: by outflank-mailman (input) for mailman id 831288;
 Wed, 06 Nov 2024 17:05:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RQdK=SB=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t8jSn-00065c-OJ
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 17:05:01 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f904c74-9c61-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 18:04:57 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730912689645601.7594197816804;
 Wed, 6 Nov 2024 09:04:49 -0800 (PST)
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
X-Inumbo-ID: 3f904c74-9c61-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjNmOTA0Yzc0LTljNjEtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTEyNjk4LjA3NzQzOSwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730912691; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=huXcBegMGQ942MOBBGGqR/MvFcYKWdLeENOwUxao8mPt0OHCoJ4IeOUvockwmbMTYTfXK/TUUbimUB7RNRw8BN6FXbmdyEX9p6506EKr2BEPlgaLUqMTRvvvfitqJVTSWUR76VImQhYQFsFHdZxLhK5RM9m/5s5vV1BPZXisc6Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730912691; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9ZYY3pcLpZM/hm5b8/Lo8mDisbvisyGqObheT8aXFzY=; 
	b=HaMRU2AJPa7Ovq178rUAxsJ76zmpwLEYmfbUn7Nycwk3tpuJb69aUsjkEWXs/vhj8DchdUDt9Kb3WcswyYCHcNwGMP6tlmGpLhQJ5l5DH4gEW9bUb3XERCNAhrANH824wONhkxKHbyWabqlkloYsxyNnymkGJ/NfC4fSkFQSITg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730912691;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9ZYY3pcLpZM/hm5b8/Lo8mDisbvisyGqObheT8aXFzY=;
	b=HWE66jvXgWc8Db7b3FEnlVO5HFHXVm0SFBgpg8pcg7OcZND+/1vph7ZO21dPUdzI
	tM2hMdtYRjwZx+izJePy/6FXOcDcfGYA16f1k2BPUSCSCn4r2ianXUgQrLl63FXyPN9
	jHEVQrabLyWUdcpzl/bdNMBGtqd3pMpkK57dJG4w=
Message-ID: <f5ca5e27-2ca2-4670-aa05-fa6ab1e4f6c7@apertussolutions.com>
Date: Wed, 6 Nov 2024 12:04:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] xen/pci: introduce PF<->VF links
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
 <20241018203913.1162962-3-stewart.hildebrand@amd.com>
 <56b5a45b-871d-41a4-8e1d-74d72020054f@suse.com>
 <9ab19f1b-0dee-490e-b4f6-b07e6ae6223b@amd.com>
 <a40185b1-7c1b-4a57-91fb-e439a4c896f0@apertussolutions.com>
 <D5DDABNKHN42.1HD2T6NV99J51@cloud.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <D5DDABNKHN42.1HD2T6NV99J51@cloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/4/24 06:45, Alejandro Vallejo wrote:
> On Sat Nov 2, 2024 at 3:18 PM GMT, Daniel P. Smith wrote:
>> On 11/1/24 16:16, Stewart Hildebrand wrote:
>>> +Daniel (XSM mention)
>>>
>>> On 10/28/24 13:02, Jan Beulich wrote:
>>>> On 18.10.2024 22:39, Stewart Hildebrand wrote:
>>>>> Add links between a VF's struct pci_dev and its associated PF struct
>>>>> pci_dev. Move the calls to pci_get_pdev()/pci_add_device() down to avoid
>>>>> dropping and re-acquiring the pcidevs_lock().
>>>>>
>>>>> During PF removal, unlink VF from PF and mark the VF broken. As before,
>>>>> VFs may exist without a corresponding PF, although now only with
>>>>> pdev->broken = true.
>>>>>
>>>>> The hardware domain is expected to remove the associated VFs before
>>>>> removing the PF. Print a warning in case a PF is removed with associated
>>>>> VFs still present.
>>>>>
>>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>>> ---
>>>>> Candidate for backport to 4.19 (the next patch depends on this one)
>>>>>
>>>>> v5->v6:
>>>>> * move printk() before ASSERT_UNREACHABLE()
>>>>> * warn about PF removal with VFs still present
>>>>
>>>> Hmm, maybe I didn't make this clear enough when commenting on v5: I wasn't
>>>> just after an adjustment to the commit message. I'm instead actively
>>>> concerned of the resulting behavior. Question is whether we can reasonably
>>>> do something about that.
>>>>
>>>> Jan
>>>
>>> Right. My suggestion then is to go back to roughly how it was done in
>>> v4 [0]:
>>>
>>> * Remove the VFs right away during PF removal, so that we don't end up
>>> with stale VFs. Regarding XSM, assume that a domain with permission to
>>> remove the PF is also allowed to remove the VFs. We should probably also
>>> return an error from pci_remove_device in the case of removing the PF
>>> with VFs still present (and still perform the removals despite returning
>>> an error). Subsequent attempts by a domain to remove the VFs would
>>> return an error (as they have already been removed), but that's expected
>>> since we've taken a stance that PF-then-VF removal order is invalid
>>> anyway.
>>
>> I am not confident this is a safe assumption. It will likely be safe for
>> probably 99% of the implementations. Apologies for not following
>> closely, and correct me if I am wrong here, but from a resource
>> perspective each VF can appear to the system as its own unique BDF and
>> so I am fairly certain it would be possible to uniquely label each VF.
>> For instance in the SVP architecture, the VF may be labeled to restrict
>> control to a hardware domain within a Guest Virtual Platform while the
>> PF may be restricted to the Supervisor Virtual Platform. In this
>> scenario, the Guest would be torn down before the Supervisor so the VF
>> should get released before the PF. But it's all theoretical, so I have
>> no real implementation to point at that this could be checked/confirmed.
>>
>> I am only raising this for awareness and not as an objection. If people
>> want to punt that theoretical use case down the road until someone
>> actually attempts it, I would not be opposed.
> 
> Wouldn't it stand to reason then to act conditionally on the authority of the
> caller?

Correct, and as I hopefully clarified in response to Roger, like 
everything with virtualization, it's turtles all the way down. Try 
having this model in mind,

   +----------------+  +-------------------------------+
   | Supervisor VP  |  | Guest VP                      |
   |                |  |                               |
   | +------------+ |  | +------------+ +------------+ |
   | |    HWDOM   | |  | |    HWDOM   | |    Guest   | |
   | |  +------+  | |  | |  +------+  | |  +------+  | |
   | |  |      |  | |  | |  |      |  | |  |      |  | |
   | |  |  PF  |  | |  | |  |  VF  +--+-+-->  PCI |  | |
   | |  |      |  | |  | |  |      |  | |  |      |  | |
   | |  +------+  | |  | |  +------+  | |  +------+  | |
   | +------------+ |  | +------------+ +------------+ |
   +----------------+  +-------------------------------+


> i.e: If the caller has the (XSM-checked) authority to remove _BOTH_ PF and
> VFs, remove all. If it doesn't have authority to remove the VFs then early exit
> with an error, leaving the PF behind as well.

Yes, I would agree that is reasonable. Please, I am not trying to make 
this complicated, but just trying to give a more advanced (nested?) 
model to consider. Not something that we have to figure out all the 
details of how to make it all work. I am just saying, consider that a VF 
may have a different label than the PF which allows another domain to be 
able to take actions on the device as if the domain fully owns that 
virtual PCI device. A code comment around the xsm check(s) could state 
that it is expected that a system with access to the PF label must have 
access to all VF labels and the dummy policy should already be wired up 
to only allow the hwdom to do it.

> That would do the clean thing in the common case and be consistent with the
> security policy even with a conflicting policy. The semantics are somewhat more
> complex, but trying to remove a PF before removing the VFs is silly and the
> only sensible thing (imo) is to help out during cleanup _or_ be strict about
> checking.

Yes, and I was not trying to suggest the PF would be removed before the 
VFs. Apologies if it sounds as though I am repeating, myself,, all that 
I was attempting to say is that the VFs should be able to be checked 
separately from the PF. This would allow a domain that was granted 
ownership of a VF, to be able to unplug the VF and only that VF from the 
system. I would leave it to the PCI logic to manage the sequencing of 
the PF and VF operations. In such a scenario, I would expect the hwdom 
to have the facilities to monitor/check the status of the VF to manage 
the case that a guest unplugged it.

v/r,
dps


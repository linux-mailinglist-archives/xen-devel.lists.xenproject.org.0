Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4498C9BF319
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 17:21:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831265.1246473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8imO-0006lr-LD; Wed, 06 Nov 2024 16:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831265.1246473; Wed, 06 Nov 2024 16:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8imO-0006ja-Ie; Wed, 06 Nov 2024 16:21:12 +0000
Received: by outflank-mailman (input) for mailman id 831265;
 Wed, 06 Nov 2024 16:21:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RQdK=SB=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t8imN-0006jU-7L
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 16:21:11 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e71ba78-9c5b-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 17:21:05 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730910055422541.3328016191316;
 Wed, 6 Nov 2024 08:20:55 -0800 (PST)
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
X-Inumbo-ID: 1e71ba78-9c5b-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjFlNzFiYTc4LTljNWItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTEwMDY1LjU4MTgyMiwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730910058; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lE1d2NDoPhLRtKrdCBKTxTlLm3oGWD6CqS9S8FHgHumg6nMDZ7KlPsUud/Wur/TgacHwVLW3GRq2nWblbAQC0KiiINzRYswQ1wPlOHPOIywk6FDXEvsiKc2GUmskbMK6q1bcYGK44c855T1DOTN/NgWCSCd6qDgYn6OeJkVoCGg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730910058; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eKU1yiXHigfAhJthGM4+219Bnmvbjh9/dWAbzDGrca8=; 
	b=PcLOE4E5ZrnZg60Px31GOZS3Xnj7KOz7Q4n/A9eQvIrLK7OOojWf9KQciBdQb/4AnmhYMwLt52PzC5swtlFumiGalrGftRYnBQ9V5SVXCHH3RkylUKtK+Iu9s17aWzgLIe7iPvYArZKMAuI6Yfq7wijJv7HgYgQYRV5P3OfjvGM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730910058;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=eKU1yiXHigfAhJthGM4+219Bnmvbjh9/dWAbzDGrca8=;
	b=e+6Rr1AC/t3Tixr9vUF4brqtCNtHU4XtpFKcdER9XoBcWtN1wkif2dykuOc5wQzp
	OYhGBeHcpyDZgS72OvVKE2Hcw6KQD+TI9ERBZeqJrssNMj1y0WeJaO5xLs3SSyWNw7N
	/bht1JPvcoeGjuiaF06mrLsv8F0dSZdnu/w3P8Fc=
Message-ID: <f4b8593f-654b-4fcd-b3b2-dab6dd227e8e@apertussolutions.com>
Date: Wed, 6 Nov 2024 11:20:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] xen/pci: introduce PF<->VF links
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
 <20241018203913.1162962-3-stewart.hildebrand@amd.com>
 <56b5a45b-871d-41a4-8e1d-74d72020054f@suse.com>
 <9ab19f1b-0dee-490e-b4f6-b07e6ae6223b@amd.com>
 <a40185b1-7c1b-4a57-91fb-e439a4c896f0@apertussolutions.com>
 <D5DDABNKHN42.1HD2T6NV99J51@cloud.com> <ZyngfwQYZTFfwqlp@macbook>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <ZyngfwQYZTFfwqlp@macbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/5/24 04:08, Roger Pau Monné wrote:
> On Mon, Nov 04, 2024 at 11:45:05AM +0000, Alejandro Vallejo wrote:
>> On Sat Nov 2, 2024 at 3:18 PM GMT, Daniel P. Smith wrote:
>>> On 11/1/24 16:16, Stewart Hildebrand wrote:
>>>> +Daniel (XSM mention)
>>>>
>>>> On 10/28/24 13:02, Jan Beulich wrote:
>>>>> On 18.10.2024 22:39, Stewart Hildebrand wrote:
>>>>>> Add links between a VF's struct pci_dev and its associated PF struct
>>>>>> pci_dev. Move the calls to pci_get_pdev()/pci_add_device() down to avoid
>>>>>> dropping and re-acquiring the pcidevs_lock().
>>>>>>
>>>>>> During PF removal, unlink VF from PF and mark the VF broken. As before,
>>>>>> VFs may exist without a corresponding PF, although now only with
>>>>>> pdev->broken = true.
>>>>>>
>>>>>> The hardware domain is expected to remove the associated VFs before
>>>>>> removing the PF. Print a warning in case a PF is removed with associated
>>>>>> VFs still present.
>>>>>>
>>>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>>>> ---
>>>>>> Candidate for backport to 4.19 (the next patch depends on this one)
>>>>>>
>>>>>> v5->v6:
>>>>>> * move printk() before ASSERT_UNREACHABLE()
>>>>>> * warn about PF removal with VFs still present
>>>>>
>>>>> Hmm, maybe I didn't make this clear enough when commenting on v5: I wasn't
>>>>> just after an adjustment to the commit message. I'm instead actively
>>>>> concerned of the resulting behavior. Question is whether we can reasonably
>>>>> do something about that.
>>>>>
>>>>> Jan
>>>>
>>>> Right. My suggestion then is to go back to roughly how it was done in
>>>> v4 [0]:
>>>>
>>>> * Remove the VFs right away during PF removal, so that we don't end up
>>>> with stale VFs. Regarding XSM, assume that a domain with permission to
>>>> remove the PF is also allowed to remove the VFs. We should probably also
>>>> return an error from pci_remove_device in the case of removing the PF
>>>> with VFs still present (and still perform the removals despite returning
>>>> an error). Subsequent attempts by a domain to remove the VFs would
>>>> return an error (as they have already been removed), but that's expected
>>>> since we've taken a stance that PF-then-VF removal order is invalid
>>>> anyway.
>>>
>>> I am not confident this is a safe assumption. It will likely be safe for
>>> probably 99% of the implementations. Apologies for not following
>>> closely, and correct me if I am wrong here, but from a resource
>>> perspective each VF can appear to the system as its own unique BDF and
>>> so I am fairly certain it would be possible to uniquely label each VF.
>>> For instance in the SVP architecture, the VF may be labeled to restrict
>>> control to a hardware domain within a Guest Virtual Platform while the
>>> PF may be restricted to the Supervisor Virtual Platform. In this
>>> scenario, the Guest would be torn down before the Supervisor so the VF
>>> should get released before the PF. But it's all theoretical, so I have
>>> no real implementation to point at that this could be checked/confirmed.
>>>
>>> I am only raising this for awareness and not as an objection. If people
>>> want to punt that theoretical use case down the road until someone
>>> actually attempts it, I would not be opposed.
>>
>> Wouldn't it stand to reason then to act conditionally on the authority of the
>> caller?
>>
>> i.e: If the caller has the (XSM-checked) authority to remove _BOTH_ PF and
>> VFs, remove all. If it doesn't have authority to remove the VFs then early exit
>> with an error, leaving the PF behind as well.
> 
> I'm unsure if it makes sense to have an entity that's allowed to issue
> a pci_remove_device() against a PF, but not against the VFs of the
> device.

Apologies for not fully defining how SVP would work. The Supervisor is 
the one of the few domains considered running at the higher trust level.

When I was referring to restricting the VF, for instance, that a VF of 
L:M:N may be assigned label gvp1_pci_t that only allows guest VP 1 
access, while VF X:Y:Z would be labeled gvp2_pci_t that grants guest VP 
2 access only.

At the same time, the Supervisor would be allowed in the policy to 
remove all VFs, in the example above it would have access to 
gvp1/2_pci_t labeled devices. In theory, it would have attempted to have 
the Guest VP tear down (or unplug the VF in a hotplug scenario) the 
virtual device. But in the end, it can't rely on the Guest VP to 
properly shutdown/unplug, and must be able to properly manage the system.

> The owner of the PF should be capable of disabling SR-IOV, at which
> point all the VFs disappear from the PCI config space.  If such entity
> is capable of controlling the SR-IOV capability, it should also be
> able to issue pci_remove_device() calls against the VFs.

Correct, as I mentioned above.

v/r,
dps


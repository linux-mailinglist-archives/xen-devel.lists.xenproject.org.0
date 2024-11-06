Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1239BF342
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 17:32:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831279.1246494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8iwg-000148-QL; Wed, 06 Nov 2024 16:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831279.1246494; Wed, 06 Nov 2024 16:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8iwg-00011p-NZ; Wed, 06 Nov 2024 16:31:50 +0000
Received: by outflank-mailman (input) for mailman id 831279;
 Wed, 06 Nov 2024 16:31:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RQdK=SB=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t8iwe-00011j-Gm
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 16:31:48 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bae2695-9c5c-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 17:31:45 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730910696820382.4793134129818;
 Wed, 6 Nov 2024 08:31:36 -0800 (PST)
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
X-Inumbo-ID: 9bae2695-9c5c-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjliYWUyNjk1LTljNWMtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTEwNzA1LjQ0MTUwOSwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730910698; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hQUevx2WvOCg2KOsDLB6yKttBXpJPP4M9a/QlyKPKbz1/YRXK97+YGrsRsWq4Y2KwY+2Ca/knqxOpB1GsCesbXA0Xo0lgEk5cV8poFE4ern1UzmR6XnhsfVZEbq9SWmhGHaWiGagCmO35i7GSK7uEzfM9GwuKVApTIR6OsYJXGY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730910698; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EYM9AbxuG3iCsPgSx7jA1ypaIDcyAYrS6EpKQIkX8AU=; 
	b=c+f1+7DTUk44KlwV+l/JTut9/vGyb+ncRwisADv85bMHSyta+DnYcHjZ5e8QZyRNNsXbEt9TKmCjrph3eJzP+xd6iGU5I6qW6pCej3qCnuLRaqDbfFJGdSlteOsg+cv5XfB2jv3XW92NqRRnCcWmTF40+ltO2ncn6+8I+UySusc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730910698;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=EYM9AbxuG3iCsPgSx7jA1ypaIDcyAYrS6EpKQIkX8AU=;
	b=iOxBmTQc+u2m/NxCHnF+xQ5/WW4LYe4oyROQFHBNPpwV68080E+8X/NvfZgg8Itt
	/5whLSQcv36xf5g3a46eN8oMWz7SWHk3ga5dU3R+or/jOpV5zHEwaSzWKbsmVbCnH72
	PJwK8Agq9QuoXHb6IqQbSG7gQpfsT3jUpH200MYw=
Message-ID: <33c6687c-4593-4259-bfe5-ff19746eafea@apertussolutions.com>
Date: Wed, 6 Nov 2024 11:31:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] xen/pci: introduce PF<->VF links
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
 <20241018203913.1162962-3-stewart.hildebrand@amd.com>
 <56b5a45b-871d-41a4-8e1d-74d72020054f@suse.com>
 <9ab19f1b-0dee-490e-b4f6-b07e6ae6223b@amd.com>
 <a40185b1-7c1b-4a57-91fb-e439a4c896f0@apertussolutions.com>
 <ZynfSMUVEy71ZskR@macbook>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <ZynfSMUVEy71ZskR@macbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/5/24 04:03, Roger Pau Monné wrote:
> On Sat, Nov 02, 2024 at 11:18:24AM -0400, Daniel P. Smith wrote:
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
>> probably 99% of the implementations. Apologies for not following closely,
>> and correct me if I am wrong here, but from a resource perspective each VF
>> can appear to the system as its own unique BDF and so I am fairly certain it
>> would be possible to uniquely label each VF. For instance in the SVP
>> architecture, the VF may be labeled to restrict control to a hardware domain
>> within a Guest Virtual Platform while the PF may be restricted to the
>> Supervisor Virtual Platform. In this scenario, the Guest would be torn down
>> before the Supervisor so the VF should get released before the PF.
> 
> The VF getting released before the PF is what we would usually expect?
> 
> I'm a bit confused because a guest being torn down doesn't imply that
> the device is removed from Xen (iow: a call to pci_remove_device()).
> Removing a device is hot-unplugging the PCI device from Xen, not
> deassinging from a guest.

I was providing a use-case that was crafted, just not implemented. I 
have not looked at SRIOV in some time and not at the level necessary to 
determine this, but I would be uneasy thinking a VF could just be 
released from a guest to be reassigned either to the host hardware 
domain, aka Supervisor VP, or another guest. Perhaps a reset of the VF 
is enough or it might need more, I have not looked at the details at 
this point since we are still ages away from Xen being exactly capable 
of really doing a true implementation of the SVP architecture.

> I would also be uneasy with assigning a PF to a non-privileged domain,
> specially if VFs from that same device are being assigned to trusted
> domains.

As mentioned in the other response, the PF is in a higher trusted domain 
level than where the VFs would be assigned.

> My assumption is that you generally want the PFs assigned to the
> hardware domain, and the VFs assigned to any other domains (trusted or
> not).

In the SVP architecture, there is more than one "hardware domain".

v/r,
dps



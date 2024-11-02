Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CD49BA113
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2024 16:20:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829449.1244436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7Ftv-0006uh-25; Sat, 02 Nov 2024 15:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829449.1244436; Sat, 02 Nov 2024 15:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7Ftu-0006sZ-V7; Sat, 02 Nov 2024 15:18:54 +0000
Received: by outflank-mailman (input) for mailman id 829449;
 Sat, 02 Nov 2024 15:18:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RajI=R5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t7Ftt-0006sT-A4
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2024 15:18:53 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfd93eb2-992d-11ef-a0c5-8be0dac302b0;
 Sat, 02 Nov 2024 16:18:46 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730560705768342.0005909141787;
 Sat, 2 Nov 2024 08:18:25 -0700 (PDT)
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
X-Inumbo-ID: bfd93eb2-992d-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJmZDkzZWIyLTk5MmQtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNTYwNzI2LjM5MDAwNiwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730560713; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SQZb0kk41l0W1st0ggwylNkSakmjybuZxhjMIIPwAY9AoR0I4qGsq/QWQdOEDDu3z+gnGhmi8ubgMtr+zhv/Lfbvm7BdMtRgfN3RSZR8yGZO16KOxnD5QZftvknF5cMj4tEPI4RAE+VuS+IHtc27pmVzAdPPwkygyE/m3LyZAmo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730560713; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bOIT/7nKAlEW3wEzoZX1SSO29resDpQHeUh54jKqz10=; 
	b=YWsbRMwe1/6cKWqJuj9dBVc7qCDn2LTD9EeOyF6S5DGlg/+rqbuPPbg8bAV7SETrTxmRUpJ+UFp3Ag05H+w4Ruk5l5GYN0EGVY9MADba+H7yFA1fNa2RIRhpnhOW8+pIR1PxYtm5UpZZ4HUBLfM7BEccmR4qIDFobK/hFRvG4aA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730560713;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=bOIT/7nKAlEW3wEzoZX1SSO29resDpQHeUh54jKqz10=;
	b=MkTieauXV2qPMIf8VvgrtQmja0nfGV/0+OclcmLc8F5ZA5TURMLIdvQhVaXdNZeY
	bz/tmy/kAdxoGhvmqDJdce12oZuHkKVk7Ortr8kkx3FgOyYkxy7z8ZiHb+ETlwfURzY
	ykW73XaSuK2fn342OYDH5UlC9vywd1k7iGxbAL5s=
Message-ID: <a40185b1-7c1b-4a57-91fb-e439a4c896f0@apertussolutions.com>
Date: Sat, 2 Nov 2024 11:18:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] xen/pci: introduce PF<->VF links
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
 <20241018203913.1162962-3-stewart.hildebrand@amd.com>
 <56b5a45b-871d-41a4-8e1d-74d72020054f@suse.com>
 <9ab19f1b-0dee-490e-b4f6-b07e6ae6223b@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <9ab19f1b-0dee-490e-b4f6-b07e6ae6223b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/1/24 16:16, Stewart Hildebrand wrote:
> +Daniel (XSM mention)
> 
> On 10/28/24 13:02, Jan Beulich wrote:
>> On 18.10.2024 22:39, Stewart Hildebrand wrote:
>>> Add links between a VF's struct pci_dev and its associated PF struct
>>> pci_dev. Move the calls to pci_get_pdev()/pci_add_device() down to avoid
>>> dropping and re-acquiring the pcidevs_lock().
>>>
>>> During PF removal, unlink VF from PF and mark the VF broken. As before,
>>> VFs may exist without a corresponding PF, although now only with
>>> pdev->broken = true.
>>>
>>> The hardware domain is expected to remove the associated VFs before
>>> removing the PF. Print a warning in case a PF is removed with associated
>>> VFs still present.
>>>
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>> ---
>>> Candidate for backport to 4.19 (the next patch depends on this one)
>>>
>>> v5->v6:
>>> * move printk() before ASSERT_UNREACHABLE()
>>> * warn about PF removal with VFs still present
>>
>> Hmm, maybe I didn't make this clear enough when commenting on v5: I wasn't
>> just after an adjustment to the commit message. I'm instead actively
>> concerned of the resulting behavior. Question is whether we can reasonably
>> do something about that.
>>
>> Jan
> 
> Right. My suggestion then is to go back to roughly how it was done in
> v4 [0]:
> 
> * Remove the VFs right away during PF removal, so that we don't end up
> with stale VFs. Regarding XSM, assume that a domain with permission to
> remove the PF is also allowed to remove the VFs. We should probably also
> return an error from pci_remove_device in the case of removing the PF
> with VFs still present (and still perform the removals despite returning
> an error). Subsequent attempts by a domain to remove the VFs would
> return an error (as they have already been removed), but that's expected
> since we've taken a stance that PF-then-VF removal order is invalid
> anyway.

I am not confident this is a safe assumption. It will likely be safe for 
probably 99% of the implementations. Apologies for not following 
closely, and correct me if I am wrong here, but from a resource 
perspective each VF can appear to the system as its own unique BDF and 
so I am fairly certain it would be possible to uniquely label each VF. 
For instance in the SVP architecture, the VF may be labeled to restrict 
control to a hardware domain within a Guest Virtual Platform while the 
PF may be restricted to the Supervisor Virtual Platform. In this 
scenario, the Guest would be torn down before the Supervisor so the VF 
should get released before the PF. But it's all theoretical, so I have 
no real implementation to point at that this could be checked/confirmed.

I am only raising this for awareness and not as an objection. If people 
want to punt that theoretical use case down the road until someone 
actually attempts it, I would not be opposed.

v/r,
dps


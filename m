Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A99DA3975B8
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 16:45:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134905.250876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo5dA-0007yM-TG; Tue, 01 Jun 2021 14:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134905.250876; Tue, 01 Jun 2021 14:44:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo5dA-0007vz-QB; Tue, 01 Jun 2021 14:44:32 +0000
Received: by outflank-mailman (input) for mailman id 134905;
 Tue, 01 Jun 2021 14:44:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tu9B=K3=rmail.be=alien@srs-us1.protection.inumbo.net>)
 id 1lo5d8-0007vt-W1
 for xen-devel@lists.xen.org; Tue, 01 Jun 2021 14:44:31 +0000
Received: from mail.rmail.be (unknown [85.234.218.189])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d6351342-6f8c-47cc-a737-8a4e9d9686bc;
 Tue, 01 Jun 2021 14:44:29 +0000 (UTC)
Received: from mail.rmail.be (localhost [127.0.0.1])
 by mail.rmail.be (Postfix) with ESMTP id B5F7BB11C91;
 Tue,  1 Jun 2021 16:44:28 +0200 (CEST)
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
X-Inumbo-ID: d6351342-6f8c-47cc-a737-8a4e9d9686bc
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 01 Jun 2021 16:44:28 +0200
From: AL13N <alien@rmail.be>
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xen.org>
Subject: Re: pci passthrough issue introduced between 4.14.1 and 4.15.0
In-Reply-To: <b5ff15fc-ec3b-6b48-3d15-7de29fa5b2aa@suse.com>
References: <6ccb04f2d93be6089b049df1f94a91dd@mail.rmail.be>
 <e9a3f7a8-7bf2-4f0a-cc25-d8ce015df1f2@suse.com>
 <a7c0e9b0cdd8f9e709abc329c7f6239c@mail.rmail.be>
 <b5ff15fc-ec3b-6b48-3d15-7de29fa5b2aa@suse.com>
Message-ID: <175befe0e853565761e51f07b79c49cf@mail.rmail.be>
X-Sender: alien@rmail.be
User-Agent: Roundcube Webmail/1.0.9-1.2.mga5

Jan Beulich schreef op 2021-06-01 16:33:
> On 01.06.2021 16:06, AL13N wrote:
>> Jan Beulich schreef op 2021-06-01 12:08:
>>> On 01.06.2021 09:36, AL13N wrote:
>>>> Not 100% it's a bug or something i did wrong, but,
>>>> 
>>>> with xl create i start a PV with 3 pci passthroughs
>>>> 
>>>> after wards, xl pci-list shows all 3 nicely
>>>> 
>>>> looking at the domU boot logs, pcifront is only creating one pci
>>>> device
>>>> and lspci in the guest shows only 1 pci entry
>>>> 
>>>> in at least 4.14.1 it still works.
>>> 
>>> This reminds me of my report at
>>> https://lists.xen.org/archives/html/xen-devel/2021-03/msg00956.html
>>> 
>>> Meanwhile the proposed pciback change has gone in upstream:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/xen/xen-pciback?id=c81d3d24602540f65256f98831d0a25599ea6b87
>>> 
>>> I wasn't, however, aware that this may have been an issue going
>>> from 4.14.1 to 4.15.0, i.e. something that was presumably (as
>>> George also has just said) a regression in the tools. Or else I
>>> probably wouldn't have suggested taking care of this in Linux.
>>> Nevertheless you may want to give that change a try.
>> 
>> Well, both tests have only different tools en hypervisor, no kernel 
>> was
>> changed between both tests, neither in dom0 or domU , so, it might not
>> be pciback?
> 
> Well, if the problem was introduced in the tools and this having been
> the reason for me running into the same or a similar issue, the patch
> may still address the issue, even if - in case it's a regression in
> the tools - it would have been better to also address the issue there.
> As said, when analyzing the issue I didn't have indications of changed
> tool stack behavior, i.e. I assumed the problem would have always been
> there.

Yeah after rereading the thread, i got this impression.

though after looking at a quick grep:

[alien@localhost xen]$ git log RELEASE-4.14.1..RELEASE-4.15.0 --oneline 
--decorate -- tools/xl/ | grep -i pci
bdc0799fe2 libxlu: introduce xlu_pci_parse_spec_string()
96ed6ff297 libxlu: introduce xlu_pci_parse_spec_string()
929f231140 libxl: introduce 'libxl_pci_bdf' in the idl...
c00da82355 libxl: add libxl_device_pci_assignable_list_free()...
7499b22ba1 libxl: make sure callers of libxl_device_pci_list() free the 
list after use
6c2590967f xl: s/pcidev/pci where possible


it doesn't seem like one of these? (well, i've not familiar with any of 
the xen code)

This mailing list is the correct place for the toolstack too? right?

Regards,

Maarten


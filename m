Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FE5397509
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 16:07:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134875.250832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo52P-0001t2-53; Tue, 01 Jun 2021 14:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134875.250832; Tue, 01 Jun 2021 14:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo52P-0001qa-26; Tue, 01 Jun 2021 14:06:33 +0000
Received: by outflank-mailman (input) for mailman id 134875;
 Tue, 01 Jun 2021 14:06:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tu9B=K3=rmail.be=alien@srs-us1.protection.inumbo.net>)
 id 1lo52N-0001qU-AH
 for xen-devel@lists.xen.org; Tue, 01 Jun 2021 14:06:31 +0000
Received: from mail.rmail.be (unknown [85.234.218.189])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ffe33ae8-98d4-44b0-8f6c-393e4e1857a9;
 Tue, 01 Jun 2021 14:06:29 +0000 (UTC)
Received: from mail.rmail.be (localhost [127.0.0.1])
 by mail.rmail.be (Postfix) with ESMTP id 6832BB11C2F;
 Tue,  1 Jun 2021 16:06:28 +0200 (CEST)
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
X-Inumbo-ID: ffe33ae8-98d4-44b0-8f6c-393e4e1857a9
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 01 Jun 2021 16:06:28 +0200
From: AL13N <alien@rmail.be>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Jan Beulich <jbeulich@suse.com>
Subject: Re: pci passthrough issue introduced between 4.14.1 and 4.15.0
In-Reply-To: <e9a3f7a8-7bf2-4f0a-cc25-d8ce015df1f2@suse.com>
References: <6ccb04f2d93be6089b049df1f94a91dd@mail.rmail.be>
 <e9a3f7a8-7bf2-4f0a-cc25-d8ce015df1f2@suse.com>
Message-ID: <a7c0e9b0cdd8f9e709abc329c7f6239c@mail.rmail.be>
X-Sender: alien@rmail.be
User-Agent: Roundcube Webmail/1.0.9-1.2.mga5

Jan Beulich schreef op 2021-06-01 12:08:
> On 01.06.2021 09:36, AL13N wrote:
>> Not 100% it's a bug or something i did wrong, but,
>> 
>> with xl create i start a PV with 3 pci passthroughs
>> 
>> after wards, xl pci-list shows all 3 nicely
>> 
>> looking at the domU boot logs, pcifront is only creating one pci 
>> device
>> and lspci in the guest shows only 1 pci entry
>> 
>> in at least 4.14.1 it still works.
> 
> This reminds me of my report at
> https://lists.xen.org/archives/html/xen-devel/2021-03/msg00956.html
> 
> Meanwhile the proposed pciback change has gone in upstream:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/xen/xen-pciback?id=c81d3d24602540f65256f98831d0a25599ea6b87
> 
> I wasn't, however, aware that this may have been an issue going
> from 4.14.1 to 4.15.0, i.e. something that was presumably (as
> George also has just said) a regression in the tools. Or else I
> probably wouldn't have suggested taking care of this in Linux.
> Nevertheless you may want to give that change a try.

Well, both tests have only different tools en hypervisor, no kernel was 
changed between both tests, neither in dom0 or domU , so, it might not 
be pciback?


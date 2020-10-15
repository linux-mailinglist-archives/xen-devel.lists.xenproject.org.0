Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD9528F59C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 17:14:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7482.19566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT4xG-0002FB-0l; Thu, 15 Oct 2020 15:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7482.19566; Thu, 15 Oct 2020 15:14:09 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT4xF-0002Em-Tg; Thu, 15 Oct 2020 15:14:09 +0000
Received: by outflank-mailman (input) for mailman id 7482;
 Thu, 15 Oct 2020 15:14:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MKI8=DW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kT4xE-0002Eh-LP
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:14:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb5f354e-3026-4aa5-b2be-c582157dd67d;
 Thu, 15 Oct 2020 15:14:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DCC11AF38;
 Thu, 15 Oct 2020 15:14:06 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MKI8=DW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kT4xE-0002Eh-LP
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:14:08 +0000
X-Inumbo-ID: cb5f354e-3026-4aa5-b2be-c582157dd67d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id cb5f354e-3026-4aa5-b2be-c582157dd67d;
	Thu, 15 Oct 2020 15:14:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602774847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JT35egOZX0/8U2WS3c60CxyaHcSgWqzsX0cCoEL980o=;
	b=AMKmceQJs/7D4jxUz5FFqlbRwxsQd8iQkepDpwtsC8LGD+DBuPGdUB83ETUuAQsmhIBvRG
	8ARTsotkGwOo72sVSYiTGpP3zP314Iqg94MgU9TTlqP+4FqKpaKUzTVqG3En/m/85DNnyd
	KWJCVFenSXwMoec46TXFfxiLj8IciOQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DCC11AF38;
	Thu, 15 Oct 2020 15:14:06 +0000 (UTC)
Subject: Re: [PATCH] libelf: Handle PVH kernels lacking ENTRY elfnote
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20201014153150.83875-1-jandryuk@gmail.com>
 <6d373cae-c7dc-e109-1df3-ccbbe4bdd9c8@suse.com>
 <CAKf6xpv5GNjw0pjOxEqdVj2+C6v+O5PDZG5yYkNfytDjUT_r5w@mail.gmail.com>
 <4229544b-e98d-6f3c-14aa-a884c403ba74@suse.com>
 <CAKf6xpt_VhJ5r4scuAkWU3aGxgwiYNtHaBDpMoFJS+q837aFiA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d8e93366-0f99-37c7-e5f4-8efaf804d2e2@suse.com>
Date: Thu, 15 Oct 2020 17:14:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CAKf6xpt_VhJ5r4scuAkWU3aGxgwiYNtHaBDpMoFJS+q837aFiA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.10.2020 16:50, Jason Andryuk wrote:
> On Thu, Oct 15, 2020 at 3:00 AM Jan Beulich <jbeulich@suse.com> wrote:
>> And why is there no bounds check of ->phys_entry paralleling the
>> ->virt_entry one?
> 
> What is the purpose of this checking?  It's sanity checking which is
> generally good, but what is the harm from failing the checks?  A
> corrupt kernel can crash itself?  Maybe you could start executing
> something (the initramfs?) instead of the actual kernel?

This is at least getting close to a possible security issue.
Booting a hacked up binary can be a problem afaik.

>> On the whole, as long as we don't know what mode we're planning to
>> boot in, we can't skip any checks, as the mere presence of
>> XEN_ELFNOTE_PHYS32_ENTRY doesn't mean that's also what gets used.
>> Therefore simply bypassing any of the checks is not an option.
> 
> elf_xen_note_check() early exits when it finds phys_entry set, so
> there is already some bypassing.
> 
>> In
>> particular what you suggest would lead to failure to check
>> e_entry-derived ->virt_entry when the PVH-specific note is
>> present but we're booting in PV mode. For now I don't see how to
>> address this without making the function aware of the intended
>> booting mode.
> 
> Yes, the relevant checks depend on the desired booting mode.
> 
> The e_entry use seems a little problematic.  You said the ELF
> Specification states it should be a virtual address, but Linux seems
> to fill it with a physical address.  You could use a heuristic e_entry
> < 0 (0xffff...) to compare with the virtual addresses otherwise check
> against physical?

Don't we have a physical range as well? And don't we adjust the
entry point already in certain cases anyway? Checking and adjustment
can (and should) be brought in sync, and else checking the entry
point fits at least one of the two ranges may be better than no
checking at all, I think.

Jan


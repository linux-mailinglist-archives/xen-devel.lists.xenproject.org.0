Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 393BD4445CA
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 17:19:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221087.382615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miIzB-0000ux-It; Wed, 03 Nov 2021 16:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221087.382615; Wed, 03 Nov 2021 16:19:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miIzB-0000t2-Fe; Wed, 03 Nov 2021 16:19:37 +0000
Received: by outflank-mailman (input) for mailman id 221087;
 Wed, 03 Nov 2021 16:19:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miIz9-0000sw-UK
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 16:19:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miIz9-0004my-Q2
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 16:19:35 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miIz9-0002rc-OP
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 16:19:35 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1miIz1-0004mp-7a; Wed, 03 Nov 2021 16:19:27 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=ab5CL6e3yOj6109hkJWHetVrsHpL7IULwpbRJx4AE/o=; b=JColMU4EnNms0dbHQHWoOAYfqg
	6ks/K52Itn78Y8QbBN3zGDalZDQUwFPBoBZBJseYRdTp23PIayGwvELlrBlvbB0CVVioSFOUgLUMN
	CoBFsvl7QYzzigeyxH6trGm+L7sVvPzfYIyjFfnZV28+gemwJLlKljiZji7cUoygJGuU=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24962.46734.824520.805708@mariner.uk.xensource.com>
Date: Wed, 3 Nov 2021 16:19:26 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?=  <roger.pau@citrix.com>,
    Paul Durrant <paul@xen.org>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 0/3][4.16] x86/IOMMU: enabled / intremap handling
In-Reply-To: <dde21f84-861f-9c68-5e55-28f5bf407aa4@suse.com>
References: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
	<a51d6449-caba-8a67-3c11-b593574f3839@suse.com>
	<dde21f84-861f-9c68-5e55-28f5bf407aa4@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH v2 0/3][4.16] x86/IOMMU: enabled / intremap handling"):
> On 02.11.2021 11:17, Jan Beulich wrote:
> > On 21.10.2021 11:57, Jan Beulich wrote:
> >> In the course of reading the response to v1 (patch 1 only) I realized
> >> that not only that patch needs further adjustment, but that also
> >> further changes are needed (and there's likely yet more amiss).
> >>
> >> 1: x86/IOMMU: mark IOMMU / intremap not in use when ACPI tables are missing
> >> 2: x86/APIC: avoid iommu_supports_x2apic() on error path
> >> 3: AMD/IOMMU: iommu_enable vs iommu_intremap
> > 
> > Ian, while we further discuss / refine patch 3, the first two have the
> > needed R-b, but will now need you release-ack aiui.
> 
> Seeing your reply on IRC, here an attempt at a release justification
> (the patches were ready by Oct 29, but no-one cared to commit them
> in my absence, so I thought I'd get away without such a write-up):
> 
> Patch 1 addresses a regression identified by Andrew. The main risk I
> see here (which has turned up only very recently) is disagreement on
> patch 3 which imo has an effect also on what patch 1 does, as to the
> (non-)effects of "iommu=off" on the hypervisor command line. This,
> however, is not an effect of the patch, but pre-existing behavior.
> The behavioral change (in this regard) is in patch 3, which is still
> under discussion.

Thank you.  I also went to the list and read the thread there.

Patch 1:

Reviewed-by: Ian Jackson <iwj@xenproject.org>

> Patch 2 corrects an (unlikely but not impossible to be taken) error
> path, supposedly making systems functional again in case they would
> in fact cause that error path to be taken. The risk looks low to me,
> given that two function calls with previously assumed to be
> identical results now get folded into one with the result latched.

This one also:

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

I think, from reading the thread, that patch 3 is not targeting 4.16.

Thanks,
Ian.


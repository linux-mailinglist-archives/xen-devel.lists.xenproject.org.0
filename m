Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9CB428BA0
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 12:57:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205752.361137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZszE-0002jd-T5; Mon, 11 Oct 2021 10:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205752.361137; Mon, 11 Oct 2021 10:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZszE-0002hn-Pp; Mon, 11 Oct 2021 10:56:52 +0000
Received: by outflank-mailman (input) for mailman id 205752;
 Mon, 11 Oct 2021 10:56:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mZszD-0002hh-Pb
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 10:56:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mZszD-0003I6-LR
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 10:56:51 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mZszD-0001JD-KL
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 10:56:51 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mZszA-0000pZ-2h; Mon, 11 Oct 2021 11:56:48 +0100
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
	bh=Gp7FEYIValsTd7qVjWMOFYbEzpSwJt1AHwUmFDj4Bo0=; b=dZaOR27H/53M6UAVpKiBDO1wWC
	A5Sd2ZqFGMXgMwVf0lYTOshUqJ/kWnaYoBHwFzuOrYr3UoTZXB82asRNhfYiuhwqj+PfOkNr9Eiv5
	TfRPd2tuKBsSK61mrkWJI1d5DbmBDItGiB5z1vBhLsWklEtAOkXJ+OLSw1JNz9aKqJnU=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24932.6255.815797.597475@mariner.uk.xensource.com>
Date: Mon, 11 Oct 2021 11:56:47 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH 0/2] VT-d: correct / extend workaround(s) leaving an IOMMU
 disabled [and 1 more messages]
In-Reply-To: <ced41449-6aa2-3b20-77cd-78dafcad4bc7@suse.com>,
	<a385938d-243e-1790-da1f-be7c4f5f2c3f@suse.com>
References: <ced41449-6aa2-3b20-77cd-78dafcad4bc7@suse.com>
	<a385938d-243e-1790-da1f-be7c4f5f2c3f@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH 0/2] VT-d: correct / extend workaround(s) leaving an IOMMU disabled"):
> Ian - I'm also Cc-ing you since this feels like being on the edge
> between a new feature and a bug fix.

Thanks.

I think 2/ is a new quirk (or, new behaviour for an existing quirk).
I think I am happy to treat that as a bugfix, assuming we are
reasonably confident that most systems (including in particular all
systems without the quirk) will take unchanged codepaths.  Is that
right ?

I don't understand 1/.  It looks bugfixish to me but I am really not
qualified.  I am inclined to defer to your judgement, but it would
help me if you explicitly addressed the overall risks/benefits.

But when reading the patch I did notice one thing that struck me as
undesriable:

> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -750,27 +750,43 @@ static void iommu_enable_translation(str
>              if ( force_iommu )
> -                panic("BIOS did not enable IGD for VT properly, crash Xen for security purpose\n");
> +                panic(crash_fmt, msg);
...
> +        if ( force_iommu )
> +            panic(crash_fmt, msg);

Does this really mean that every exit path from
iommu_enable_translation that doesn't enable the iommu has to have a
check for force_iommu ?

That seems like a recipe for missing one.  And I think a missed one
would be an XSA.  Could we not structure the code some way to avoid
this foreseeable human error ?

Ian.


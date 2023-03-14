Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B676B916D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 12:18:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509548.785489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc2fH-0004of-7O; Tue, 14 Mar 2023 11:17:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509548.785489; Tue, 14 Mar 2023 11:17:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc2fH-0004mx-4K; Tue, 14 Mar 2023 11:17:59 +0000
Received: by outflank-mailman (input) for mailman id 509548;
 Tue, 14 Mar 2023 11:17:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tqJf=7G=antarean.org=joost@srs-se1.protection.inumbo.net>)
 id 1pc2fE-0004mr-SA
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 11:17:57 +0000
Received: from gw2.antarean.org (gw2.antarean.org [141.105.125.208])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ddaf8919-c259-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 12:17:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by gw2.antarean.org (Postfix) with ESMTP id 4PbWBV1NCWz8tP3;
 Tue, 14 Mar 2023 12:14:26 +0100 (CET)
Received: from gw2.antarean.org ([127.0.0.1])
 by localhost (gw2.antarean.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mBwyV5UYvJ-9; Tue, 14 Mar 2023 12:14:25 +0100 (CET)
Received: from mailstore1.adm.antarean.org (localhost [127.0.0.1])
 by gw2.antarean.org (Postfix) with ESMTP id 4PbWBT3Z3bz8sYJ;
 Tue, 14 Mar 2023 12:14:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mailstore1.adm.antarean.org (Postfix) with ESMTP id 4PbWGT1jz9z17;
 Tue, 14 Mar 2023 11:17:53 +0000 (UTC)
Received: from mailstore1.adm.antarean.org ([127.0.0.1])
 by localhost (mailstore1.adm.antarean.org [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id 2fME-9-NgdHR; Tue, 14 Mar 2023 11:17:53 +0000 (UTC)
Received: from 94e1ce1d9c1e (web2.adm.antarean.org [10.55.16.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailstore1.adm.antarean.org (Postfix) with ESMTPSA id 4PbWGS5VVcz15;
 Tue, 14 Mar 2023 11:17:52 +0000 (UTC)
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
X-Inumbo-ID: ddaf8919-c259-11ed-87f5-c1b5be75604c
X-Virus-Scanned: amavisd-new at antarean.org
X-Virus-Scanned: amavisd-new at antarean.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=antarean.org;
	s=default; t=1678792672;
	bh=NZZGjlmHmVh1yAc8rYtIL8Z+lS2faaW+TwAhY2S6R1I=;
	h=From:In-Reply-To:References:List-Id:To:Cc:Subject:Date;
	b=Kb/pbynvZCMZL6uvI/OIhFv2684DWED3xNr7S5i8aIqM2OGR+0SeQL80pxzhvuG0x
	 DbDrkdb/MiCu+XixoOE0iYxa35xGC24YffaPFofHoBUZFEFN5w2gWKkGQs9xQ5kBk3
	 5lh2EJzPhY4G+FSReOB9GRqvdfa3lp4FuUZ1vO2Y=
User-Agent: EGroupware API 21.1.001
From: Joost Roeleveld <joost@antarean.org>
X-Priority: 3
X-Mailer: EGroupware-Mail
In-Reply-To: <858a4288-46ac-d423-a529-b3b77b7fbc8a@citrix.com>
References: <Y1JkuKTjVYrOWbvm@eldamar.lan>
 <85ad4508-b979-c792-e92b-01bc16260dec@acm.org>
 <CAK=zhgr=MYn=-mrz3gKUFoXG_+EQ796bHEWSdK88o1Aqamby7g@mail.gmail.com>
 <2fd505a07bd26d76f1166761fa50905414edb7ef.camel@linux.ibm.com>
 <30a056c8-071f-4259-3253-75e718af619d@suse.com>
 <Y1bEQMS5SNTbZO/3@infradead.org>
 <858a4288-46ac-d423-a529-b3b77b7fbc8a@citrix.com>
To: Christoph Hellwig <hch@infradead.org>, Andrew Cooper
 <Andrew.Cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, jejb@linux.ibm.com, Sreekanth Reddy
 <sreekanth.reddy@broadcom.com>, Bart Van Assche <bvanassche@acm.org>,
 Salvatore Bonaccorso <carnil@debian.org>, sathya.prakash@broadcom.com,
 suganath-prabu.subramani@broadcom.com, "Martin K. Petersen"
 <martin.petersen@oracle.com>, MPT-FusionLinux.pdl@broadcom.com,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, adi@kriegisch.at
Subject: Re: Report in downstream Debian: mpt3sas broken with xen dom0 with
 update to 5.10.149 in 5.10.y.
Message-ID: <20230314111752.EGroupware.TiNRv1BSroWqKL7zQtfNLJ8@_>
Date: Tue, 14 Mar 2023 11:17:52 +0000
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0

> On Mon, Oct 24, 2022 at 05:28:05PM +0000, Andrew Cooper wrote:
>> I don't know exactly how this translates to Linux internals, but most
>> devices are fine and it's routinely the mpt2/3sas drivers which
>> encounter problems.  It would be lovely if we could get to the bottom of
>> this for once and for all.
>
> So to summarize my two mails: I think te use of dma_get_required_mask
> in mpt3sas is wrong, and the dma_get_required_mask return value from
> xen-swiotlb is also wrong. Fixing either one should fix this problem,
> and I think we should fix both.

Hi all,

Is there anything that can be done to get this fixed in xen and the  
kernel somehow?
I keep having to manually patch the mpt3sas driver to prevent it from  
being able to switch to 32bit mode each time I upgrade the kernel.

Many thanks,

Joost



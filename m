Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 372E86B933E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 13:17:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509570.785559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc3aU-0006gX-7s; Tue, 14 Mar 2023 12:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509570.785559; Tue, 14 Mar 2023 12:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc3aU-0006eM-4s; Tue, 14 Mar 2023 12:17:06 +0000
Received: by outflank-mailman (input) for mailman id 509570;
 Tue, 14 Mar 2023 12:17:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tqJf=7G=antarean.org=joost@srs-se1.protection.inumbo.net>)
 id 1pc3aS-0006eC-Si
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 12:17:04 +0000
Received: from gw1.antarean.org (gw1.antarean.org [194.145.200.214])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 2037094c-c262-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 13:17:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by gw1.antarean.org (Postfix) with ESMTP id 4PbXP71sR3z13Dk;
 Tue, 14 Mar 2023 13:08:43 +0100 (CET)
Received: from gw1.antarean.org ([127.0.0.1])
 by localhost (gw1.antarean.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EWqbXQhI_2Zu; Tue, 14 Mar 2023 13:08:43 +0100 (CET)
Received: from mailstore1.adm.antarean.org (localhost [127.0.0.1])
 by gw1.antarean.org (Postfix) with ESMTP id 4PbXP65xJ3z10d4;
 Tue, 14 Mar 2023 13:08:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mailstore1.adm.antarean.org (Postfix) with ESMTP id 4PbXZj25TZz17;
 Tue, 14 Mar 2023 12:17:01 +0000 (UTC)
Received: from mailstore1.adm.antarean.org ([127.0.0.1])
 by localhost (mailstore1.adm.antarean.org [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id YfXJxy9Uk6Q3; Tue, 14 Mar 2023 12:17:01 +0000 (UTC)
Received: from 94e1ce1d9c1e (web2.adm.antarean.org [10.55.16.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailstore1.adm.antarean.org (Postfix) with ESMTPSA id 4PbXZh61dlz15;
 Tue, 14 Mar 2023 12:17:00 +0000 (UTC)
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
X-Inumbo-ID: 2037094c-c262-11ed-b464-930f4c7d94ae
X-Virus-Scanned: amavisd-new at antarean.org
X-Virus-Scanned: amavisd-new at antarean.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=antarean.org;
	s=default; t=1678796220;
	bh=kVC1G/GLJjGa15c6gUhk9SaYr6gE5j4T6wnhZQ4qCWU=;
	h=From:In-Reply-To:References:List-Id:To:Cc:Subject:Date;
	b=XHP7alzsnRLIOsrifniTxuti1mYWZfdrBe2tdqBAyiLpX/4WG3y0PdNyO0EHknsvi
	 tK3t11vnLQd7Hawat1lAlmpokd/uyleweiUVfT3sTNICC7ZY3upoPxVly/HGfOo0VF
	 ArVI18FNz/tA1454r//QuhSWxPKaaIGBIYNCCEXQ=
User-Agent: EGroupware API 21.1.001
From: Joost Roeleveld <joost@antarean.org>
X-Priority: 3
X-Mailer: EGroupware-Mail
In-Reply-To: <8cc36c16-4aa0-9c47-ab2f-c75c1e22772f@citrix.com>
References: <Y1JkuKTjVYrOWbvm@eldamar.lan>
 <85ad4508-b979-c792-e92b-01bc16260dec@acm.org>
 <CAK=zhgr=MYn=-mrz3gKUFoXG_+EQ796bHEWSdK88o1Aqamby7g@mail.gmail.com>
 <2fd505a07bd26d76f1166761fa50905414edb7ef.camel@linux.ibm.com>
 <30a056c8-071f-4259-3253-75e718af619d@suse.com>
 <Y1bEQMS5SNTbZO/3@infradead.org>
 <858a4288-46ac-d423-a529-b3b77b7fbc8a@citrix.com>
 <20230314111752.EGroupware.TiNRv1BSroWqKL7zQtfNLJ8@_>
 <4c5de098-5cd3-116b-54cb-6972c6c06818@suse.com>
 <8cc36c16-4aa0-9c47-ab2f-c75c1e22772f@citrix.com>
To: Salvatore Bonaccorso <carnil@debian.org>, Andrew Cooper
 <Andrew.Cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Christoph Hellwig <hch@infradead.org>,
 jejb@linux.ibm.com, Sreekanth Reddy <sreekanth.reddy@broadcom.com>, Bart Van
 Assche <bvanassche@acm.org>, sathya.prakash@broadcom.com,
 suganath-prabu.subramani@broadcom.com, "Martin K. Petersen"
 <martin.petersen@oracle.com>, MPT-FusionLinux.pdl@broadcom.com,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, adi@kriegisch.at
Subject: Re: Report in downstream Debian: mpt3sas broken with xen dom0 with
 update to 5.10.149 in 5.10.y.
Message-ID: <20230314121700.EGroupware.xKx-UoFXvmK_oyhozRCvi4Y@_>
Date: Tue, 14 Mar 2023 12:17:00 +0000
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0

> Hi Andrew,
>
> On Tue, Mar 14, 2023 at 11:41:08AM +0000, Andrew Cooper wrote:
>> On 14/03/2023 11:23 am, Juergen Gross wrote:
>> > On 14.03.23 12:17, Joost Roeleveld wrote:
>> >>> On Mon, Oct 24, 2022 at 05:28:05PM +0000, Andrew Cooper wrote:
>> >>>> I don't know exactly how this translates to Linux internals, but most
>> >>>> devices are fine and it's routinely the mpt2/3sas drivers which
>> >>>> encounter problems.  It would be lovely if we could get to the
>> >>>> bottom of
>> >>>> this for once and for all.
>> >>>
>> >>> So to summarize my two mails: I think te use of dma_get_required_mask
>> >>> in mpt3sas is wrong, and the dma_get_required_mask return value from
>> >>> xen-swiotlb is also wrong. Fixing either one should fix this problem,
>> >>> and I think we should fix both.
>> >>
>> >> Hi all,
>> >>
>> >> Is there anything that can be done to get this fixed in xen and the
>> >> kernel somehow?
>> >> I keep having to manually patch the mpt3sas driver to prevent it from
>> >> being able to switch to 32bit mode each time I upgrade the kernel.
>> >
>> > Just use 5.10.173.
>>
>> Its still broken even in 6.1
>>
>> We've just stumbled over this yet again in XenServer.
>
> The mentioned commit has been backported to 6.1.16, 5.15.100 and
> 5.10.173. Is the issue still reproducible with 6.1.16?

I ran into this on 6.1.12.

Not in a position to test with 6.1.16+ yet as the only system using  
this driver is production.

Kind regards,

Joost



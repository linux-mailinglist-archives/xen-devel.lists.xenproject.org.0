Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 025A781403E
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 03:51:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654832.1022241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDyHP-0002SZ-EK; Fri, 15 Dec 2023 02:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654832.1022241; Fri, 15 Dec 2023 02:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDyHP-0002Q3-BX; Fri, 15 Dec 2023 02:50:23 +0000
Received: by outflank-mailman (input) for mailman id 654832;
 Fri, 15 Dec 2023 02:50:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onWf=H2=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rDyHN-0002Pv-2n
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 02:50:21 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abf60fd7-9af4-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 03:50:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8A1F38285463;
 Thu, 14 Dec 2023 20:50:13 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id bmues2ljoQog; Thu, 14 Dec 2023 20:50:13 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id EDE098285558;
 Thu, 14 Dec 2023 20:50:12 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3W1wJtzMBbe9; Thu, 14 Dec 2023 20:50:12 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 36E3B8285463;
 Thu, 14 Dec 2023 20:50:12 -0600 (CST)
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
X-Inumbo-ID: abf60fd7-9af4-11ee-9b0f-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com EDE098285558
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1702608613; bh=M2dCAVskJ5Bbdcz6mR8vjfRrGA1mVbY8VyComlFME8I=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=EgAD4Hql2I95us9FrFWuNXq5lcZByCv/TPakGVVHFHZh6jArDSgBj4XtIhAlE31Cs
	 vk+80EZNxhygmGa/RAeWSBPyjbuqx0Tfkhh25nuLuH45U8M0b+56wNP/2p7frJcSkM
	 rzTngJLqKlkq0DG5N4RiZMhtk6U/1McSDMQoGZI8=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <bd465581-601e-4d7d-a345-6d88740c9e64@raptorengineering.com>
Date: Thu, 14 Dec 2023 20:50:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/ppc: Enable Boot Allocator
Content-Language: en-US
To: Julien Grall <julien@xen.org>,
 Timothy Pearson <tpearson@raptorengineering.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Oleksii <oleksii.kurochko@gmail.com>
References: <cover.1701384928.git.sanastasio@raptorengineering.com>
 <5ed3351f7824a5d0a1ff29c17cb55b2608f28109.1701384928.git.sanastasio@raptorengineering.com>
 <938b9bfe-fba0-4c77-b2e5-fb79fb316ab4@xen.org>
 <7e0ea8d9ca0a3a90550eb7b9e65fe86c.squirrel@vali.starlink.edu>
 <1981531f-a919-4569-9b6b-8f962f9d7cfb@xen.org>
 <536439989.51518893.1701471704571.JavaMail.zimbra@raptorengineeringinc.com>
 <4ce0f52f-8a63-4d10-8cea-5c3b905477ec@xen.org>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <4ce0f52f-8a63-4d10-8cea-5c3b905477ec@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julien,

Thank you for the feedback. Most of your points will be addressed by
following your suggestion of moving ARM's bootfdt.c to common, but I
wanted to respond with a few points of clarification.

On 12/1/23 5:23 PM, Julien Grall wrote:
> * fdt_get_mem_rsv_paddr(), this is part of the DT is used to reserve
> memory. This was superseed to /reserved-memory, but I wonder how
> widespread this is on PPC?

As far as I can tell, the DT reserve memory map is not used on
PPC/PowerNV. This information is instead communicated through
`reserved-memory` nodes in the DT itself, which the existing code
handles.

> * If am not mistaken you are adding the Xen module as BOOTMOD_KERNEL,
> however this is meant to be used for the domain kernel. Xen should be
> BOOTMOD_XEN.

Thank you for pointing this out -- BOOTMOD_XEN is indeed the correct
choice here.

> I hope that helps.
> 
> Cheers,
>

Thanks,
Shawn



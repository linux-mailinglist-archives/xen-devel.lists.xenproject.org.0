Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C6AC6DF30
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 11:23:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165704.1492391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLfKS-00060J-8S; Wed, 19 Nov 2025 10:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165704.1492391; Wed, 19 Nov 2025 10:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLfKS-0005yk-5b; Wed, 19 Nov 2025 10:22:24 +0000
Received: by outflank-mailman (input) for mailman id 1165704;
 Wed, 19 Nov 2025 10:22:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OdYd=53=bounce.vates.tech=bounce-md_30504962.691d9a59.v1-4f590a01462a46599c9640fe486dc864@srs-se1.protection.inumbo.net>)
 id 1vLfKQ-0005xG-NP
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 10:22:22 +0000
Received: from mail180-15.suw31.mandrillapp.com
 (mail180-15.suw31.mandrillapp.com [198.2.180.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a02d059f-c531-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 11:22:18 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-15.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4dBHbY2xKSzPm168Y
 for <xen-devel@lists.xenproject.org>; Wed, 19 Nov 2025 10:22:17 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4f590a01462a46599c9640fe486dc864; Wed, 19 Nov 2025 10:22:17 +0000
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
X-Inumbo-ID: a02d059f-c531-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763547737; x=1763817737;
	bh=QzctCEEK/dV3EtP47Px3B23oMG15atUFFGtIhwSfgno=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=uE7vopbNyJyMQu/c193crsgsrpLoJOCwoD31DLiWDyuHfkGiQKW2cIRJpPjAKZyfv
	 GsfY2P0cOGU9kLXkSDpDPdDBdGjwdbwDa17ejYPzhoMpm/YHcLHkndBKtSKiOpLr4X
	 jKwNWql3I5zitMihFtNy0Xi/ZHmxPxkvYD020Pp/2annaUA+pnRb7N0nkPmyxlQ1ra
	 phuM3KldeMcjm4658RNm6nTQBCmCDlXQHHGi5w+vJyuv9Lx8iAPonDZMCbC72LV7Mo
	 GfY+MPS2f9tBDM9ATDwDg///JsYnipcByc6kSkt8uo/aMRzYF4pa0MDir9C2N0b+qO
	 bFes08Iw/IwGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763547737; x=1763808237; i=teddy.astie@vates.tech;
	bh=QzctCEEK/dV3EtP47Px3B23oMG15atUFFGtIhwSfgno=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=akah1bSCW9wVkaH3W40BK8demLU1A/4ZdZ+hjPsj2/xnOJo7o9XeHAAk0RkpL2/Xv
	 z4PPH2g1FMuALLtuwnF6DcPHydgNgzwjiQ5BxOnkIG6EmUpKjaPbRsg99Je7nbCUnT
	 mFN1njO4/muDfI3NDWanMUEDjFyp5o9FYmiiRM8idZipS6SNY9tWuQyKY00XUDOuE+
	 t2Rj4rvaODhPYmdzLu/rRK3cg0GS4MJsE/mRgbxB7qwBpUFaAuFkAmWkUTX3ZHSkxf
	 qXQxXIk93HCjW1zSqexxqkb3lILA9v9OG4dcPXn0+JAxNmMGenxe2I3Y2i/mqygFSd
	 sj52BWdauvmxQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=202/2]=20amd/iommu:=20Remove=20dead=20non-atomic=20update=20checking?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763547736243
Message-Id: <f9193b72-dcb2-4140-8b6b-46e7b509ed1b@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Jason Andryuk" <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1762961527.git.teddy.astie@vates.tech> <b0e81bd67c3f135a4102d12ed95a52ce56482992.1762961527.git.teddy.astie@vates.tech> <367dc942-7113-46cf-9c54-fa77dc6b4c53@suse.com>
In-Reply-To: <367dc942-7113-46cf-9c54-fa77dc6b4c53@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4f590a01462a46599c9640fe486dc864?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251119:md
Date: Wed, 19 Nov 2025 10:22:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 13/11/2025 =C3=A0 12:39, Jan Beulich a =C3=A9crit=C2=A0:
> On 12.11.2025 16:37, Teddy Astie wrote:
>> When updating a DTE, amd_iommu_setup_domain_device() would check if
>> the update had been non-atomic (i.e rc > 0) and throw a warning if
>> such non-atomic update could be dangerous.  However since commit
>> 3fc44151d83d, rc can no longer be positive, making this branch
>> unreachable code.
> 
> I.e. it addresses a Misra concern and hence ...
> 
>> No functional change intended.
>>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> 
> ... wants at least an Amends: tag, likely a Fixes: one. Then:

With :

Fixes: 3fc44151d83d ("x86/iommu: remove non-CX16 logic from DMA remapping")

?

As it is the commit that removed the rc > 0 case.

> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Jan
> 



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech




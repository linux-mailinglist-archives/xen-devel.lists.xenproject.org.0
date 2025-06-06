Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B95AAD0327
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 15:26:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008568.1387842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNX52-0003cO-JK; Fri, 06 Jun 2025 13:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008568.1387842; Fri, 06 Jun 2025 13:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNX52-0003a4-Fn; Fri, 06 Jun 2025 13:25:56 +0000
Received: by outflank-mailman (input) for mailman id 1008568;
 Fri, 06 Jun 2025 13:25:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UAog=YV=bounce.vates.tech=bounce-md_30504962.6842ec60.v1-a41518aacceb4cd2865e87b16ebd8c84@srs-se1.protection.inumbo.net>)
 id 1uNX51-0003Zy-0m
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 13:25:55 +0000
Received: from mail132-4.atl131.mandrillapp.com
 (mail132-4.atl131.mandrillapp.com [198.2.132.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5145c55-42d9-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 15:25:53 +0200 (CEST)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-4.atl131.mandrillapp.com (Mailchimp) with ESMTP id 4bDMX02tCjzlgMHS
 for <xen-devel@lists.xenproject.org>; Fri,  6 Jun 2025 13:25:52 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a41518aacceb4cd2865e87b16ebd8c84; Fri, 06 Jun 2025 13:25:52 +0000
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
X-Inumbo-ID: c5145c55-42d9-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1749216352; x=1749486352;
	bh=pKtdmWwVTl323wr3IxBBT/chgkj+dBGCyHJFfn9HzSs=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=LOBADznMdhQixqm8UQ/+5eQPcpdZQo7Vp/YU8g5fL6mjf1clJndOZLjA/aB6sI6cI
	 rGCO7kDvuTxdVaj6B6+Wznt5ejV3jN5Hxi+AruIOgpLPKPoCz6fDL59QThN/x6lrID
	 TrZiPOxJqeOv2/aEnGC80IHJKU5i6adDyVMl/gpBT5n4iWzmPb/OmtXFar7k95SwLX
	 wogFZagTnMghTjcu0Qpiivvy1Pch/rdBqz1uySrjLzPp/LZtDrJ2H8yynPeZZibar7
	 vXqK3ODQpUSgEnAxzIyZx3ymYmtFonSXWW/xZckL+pRCUVR/OZIH65DfDymsUlnCqe
	 o6AkA+Xix7Gzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1749216352; x=1749476852; i=teddy.astie@vates.tech;
	bh=pKtdmWwVTl323wr3IxBBT/chgkj+dBGCyHJFfn9HzSs=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=1tpbsm825U1rLjA4A4S27fNxDvyUZzBOHQAjn9oziDymk4uARvBkHir+kpWP8ZngO
	 K9JXo2ojV0q7LGJSCtGSrZzyrdKa6KJU3AL3gXABlHHWRvs44GtjbL1qnrhAEuvPE7
	 HNY5EQLyAdW/eefd8eaXDj9Jz1g6Fzx5Mx78/oXjo3je5r5QUFu7SQS3fNMaTjtdvv
	 xQwE8mRZvo1NDfPgNEgrulKzW6+U+K/bkNzDoSbcpc+4G2g1eiKwzVFeB/+NtPfXQu
	 gkaqMfUiTZl7HOyjlJgltr0zXPuDVhvkUxGi8QUrqTsKkFvT8Xb5iZM6F69pEn0NWy
	 7hDHD6kiX6GFA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v5=203/6]=20x86:=20re-work=20memcpy()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1749216351289
Message-Id: <d7502059-baf8-4839-9371-d3812208cdbf@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <73481cbf-337f-4e85-81d2-3487366cd822@suse.com> <017e689a-41a2-4722-a5e7-19ffef27500f@suse.com> <81da4e8e-9dcf-4630-a535-39ce0b07260c@vates.tech> <bac962f2-807c-4cf8-aab8-2480f38244e2@suse.com>
In-Reply-To: <bac962f2-807c-4cf8-aab8-2480f38244e2@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a41518aacceb4cd2865e87b16ebd8c84?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250606:md
Date: Fri, 06 Jun 2025 13:25:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 06/06/2025 =C3=A0 11:13, Jan Beulich a =C3=A9crit=C2=A0:
> On 05.06.2025 19:06, Teddy Astie wrote:
>> Le 05/06/2025 =C3=A0 12:27, Jan Beulich a =C3=A9crit=C2=A0:
>>> Move the function to its own assembly file. Having it in C just for the
>>> entire body to be an asm() isn't really helpful. Then have two flavors:
>>> A "basic" version using qword steps for the bulk of the operation, and =
an
>>> ERMS version for modern hardware, to be substituted in via alternatives
>>> patching.
>>>
>>> Alternatives patching, however, requires an extra precaution: It uses
>>> memcpy() itself, and hence the function may patch itself. Luckily the
>>> patched-in code only replaces the prolog of the original function. Make
>>> sure this remains this way.
>>
>> We can probably workaround that by using a separate memcpy for
>> alternatives patching. So it wouldn't end up patching itself.
> 
> We could, yes, but imo we better wouldn't.
> 

As Andrew pointed out that it's not that simple to use a separate 
memcpy. So should probably keep the current approach.

>> Aside that:
>> Reviewed-by: Teddy Astie <teddy.astie@vates.tech>
> 
> Please clarify whether this applies without that suggestion of yours take=
n
> care of.
> 

Yes.

> Jan

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech




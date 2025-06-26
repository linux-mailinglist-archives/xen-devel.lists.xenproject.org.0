Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FED5AE9D51
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 14:17:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026262.1401466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUlXh-0002uw-78; Thu, 26 Jun 2025 12:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026262.1401466; Thu, 26 Jun 2025 12:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUlXh-0002t7-4c; Thu, 26 Jun 2025 12:17:25 +0000
Received: by outflank-mailman (input) for mailman id 1026262;
 Thu, 26 Jun 2025 12:17:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o+kl=ZJ=bounce.vates.tech=bounce-md_30504962.685d3a4d.v1-c1a4f0ada62143388848be4f9023356b@srs-se1.protection.inumbo.net>)
 id 1uUlXg-0002sI-2h
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 12:17:24 +0000
Received: from mail180-2.suw31.mandrillapp.com
 (mail180-2.suw31.mandrillapp.com [198.2.180.2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80ad9555-5287-11f0-b894-0df219b8e170;
 Thu, 26 Jun 2025 14:17:18 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-2.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4bSd3d3XNJzS62TVL
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 12:17:17 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c1a4f0ada62143388848be4f9023356b; Thu, 26 Jun 2025 12:17:17 +0000
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
X-Inumbo-ID: 80ad9555-5287-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1750940237; x=1751210237;
	bh=UWIKLwILb6aA5FgaHMD88bwDLgXunzUumJKkuTX5xQ0=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=wZw0KzfWs5iZslDNqh5WC9W232kfx8ykspQ6D3yUKP9wHdPAIM0oqVJaYvMsCptDC
	 KfNbYaMLux4Bc8XIyWaVO1+sVFNRkXsVRqsp4eEAZBu6mDkhutwcu5jvbiRZUSwFr2
	 99ba5p8CEEitNT9wZG9ZCxg/pAnIDyC39JiI8LKKZzewuQ5KvRSFL26SQaDcjrFgvT
	 Goh3hGdSL5O0L1Vs0iWpqTPEb791lcGfgh69GVevnenmYa2CJSzvS6LfTIw3dCwgiO
	 NYuj5OE//nSzJQqIW4i1qaXZeNJef6+7f795+zdkXeo8MtYU5VmlBO76E+bjWJcFAH
	 tyOxEe48MFFBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1750940237; x=1751200737; i=teddy.astie@vates.tech;
	bh=UWIKLwILb6aA5FgaHMD88bwDLgXunzUumJKkuTX5xQ0=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Bvv7pC5urOtAwzG787xNJgk9XVOIZqbSAmE1pWavmvCkM5Zt1NfLIrYF42kJ9ExFi
	 8FJg/8pNUejy9e/Co/kBje4/X4vQ4nHrmZdQyYWdE96mk6TEoHLMGh5xuAJ5VNKMP0
	 I/0EYZx8xRAQWZ83ReTXH30TEDLV5fLvzUWpkKnsCtilUAJtxTz03UaJ1PkNNylave
	 Lv06tQcrLqrXLQnQqGgTbGZB5XSuMTEhlZxtPN2gH7sbiZx/RyIu8uSWS58Pb1nnBL
	 R5Fy6U4AbS9wVKXN5AVHoZRiZnAx8tpJoXblpeojk/iMWBaKDTZlSxFrPM/5Ka+Sc6
	 Tw4aWRKq/C4bA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=2003/17]=20xen/riscv:=20introduce=20guest=20domain's=20VMID=20allocation=20and=20manegement?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1750940235219
Message-Id: <096224cd-12f3-4e4f-8cd8-74c1ae292609@vates.tech>
To: "Juergen Gross" <jgross@suse.com>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Jan Beulich" <jbeulich@suse.com>
Cc: "Alistair Francis" <alistair.francis@wdc.com>, "Bob Eshleman" <bobbyeshleman@gmail.com>, "Connor Davis" <connojdavis@gmail.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com> <abbf1c30c485d4baae25d4c1fb26942f60015403.1749555949.git.oleksii.kurochko@gmail.com> <d747fd23-9ac3-49d2-8a5e-699290cef3f4@suse.com> <145f71c2-643e-4839-a2ae-0bc1f049db74@gmail.com> <80223fe3-7403-4026-9505-8826c318fabb@suse.com> <a692d449-4101-498e-a460-33e4b2fb7176@gmail.com> <f5c14ffa-6314-4534-a83e-4024b379755c@suse.com> <1a570c32-e207-47f5-9702-a752246328a9@gmail.com> <f4a20826-0949-4bf0-a8e8-eecd1428f739@suse.com> <264db0b0-43bf-4829-a5cc-ca696601349c@gmail.com> <7c5761b5-805c-4d56-ad8c-1746540423e4@suse.com>
In-Reply-To: <7c5761b5-805c-4d56-ad8c-1746540423e4@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c1a4f0ada62143388848be4f9023356b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250626:md
Date: Thu, 26 Jun 2025 12:17:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 26/06/2025 =C3=A0 13:46, Juergen Gross a =C3=A9crit=C2=A0:
> On 26.06.25 13:34, Oleksii Kurochko wrote:
>>
>> On 6/26/25 12:41 PM, Jan Beulich wrote:
>> - Minimized inter-CPU TLB flushes =E2=80=94 since VMIDs are local, TLB e=
ntries 
>> don=E2=80=99t need
>> =C2=A0=C2=A0 to be invalidated on other CPUs when reused.
>> - Better scalability =E2=80=94 this approach works better on systems wit=
h a 
>> large number
>> =C2=A0=C2=A0 of CPUs.
>> - Frequent VM switches don=E2=80=99t require global TLB flushes =E2=80=
=94 reducing the 
>> overhead
>> =C2=A0=C2=A0 of context switching.
>> However, the downside is that this model consumes more VMIDs. For 
>> example,
>> if a single domain runs on 4 vCPUs across 4 CPUs, it will consume 4 
>> VMIDs instead
>> of just one.
> 
> Consider you have 4 bits for VMIDs, resulting in 16 VMID values.
> 
> If you have a system with 32 physical CPUs and 32 domains with 1 vcpu eac=
h
> on that system, your scheme would NOT allow to keep each physical cpu bus=
y
> by running a domain on it, as only 16 domains could be active at the same
> time.
> 

Why not instead consider dropping use of VMID in case there is no one 
remaining ?
(i.e systematically flush the guest TLB before entering the vcpu and 
using a "blank" VMID)

I don't expect a lot of platforms to allow for 32 pCPU while not giving 
more than 16 VMID values. So it would just be less efficient in that 
case at worst.

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech




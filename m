Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D57CFCC8689
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 16:23:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188842.1509873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVtMN-0004fy-IB; Wed, 17 Dec 2025 15:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188842.1509873; Wed, 17 Dec 2025 15:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVtMN-0004eC-Er; Wed, 17 Dec 2025 15:22:39 +0000
Received: by outflank-mailman (input) for mailman id 1188842;
 Wed, 17 Dec 2025 15:22:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JtcV=6X=bounce.vates.tech=bounce-md_30504962.6942cab9.v1-f977cb9039de4ecaaea512ea9f1a06ad@srs-se1.protection.inumbo.net>)
 id 1vVtML-0004dq-EC
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 15:22:37 +0000
Received: from mail186-20.suw21.mandrillapp.com
 (mail186-20.suw21.mandrillapp.com [198.2.186.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 365c78c8-db5c-11f0-b15b-2bf370ae4941;
 Wed, 17 Dec 2025 16:22:35 +0100 (CET)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-20.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4dWcx54jtfzFCWljR
 for <xen-devel@lists.xenproject.org>; Wed, 17 Dec 2025 15:22:33 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f977cb9039de4ecaaea512ea9f1a06ad; Wed, 17 Dec 2025 15:22:33 +0000
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
X-Inumbo-ID: 365c78c8-db5c-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1765984953; x=1766254953;
	bh=g4SX8fwM2YkDIv4TQg3YtBTOuJ7xDMTlgexSpduwx3E=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=NMcrUnkvq4myMmPFpGpX8hNIjBJGj5QdkiyaoC64iiEuOB14aJqy6vj5H5vVL/YTD
	 Xdhme9vVlCtmm7797RYj//Y8wWfBxE17yz5NLric4YbeUMoSggtENQfq898t+PE+7V
	 zX4uR6JtbR339MqeuLxxCVC1tOtoGk9Tr53GTo8//EuDJEzl6Hc9G3t3mtrEQ16Bac
	 8F1kQcX0z2UH0q30Jq7/V2+yeAChHeeDCTLh205MWclan9Q9CO6oFWRMd7ZMgpzzk2
	 H0YKv/YStrQAdODKxLIX7gE4+OnDedZbNUnTkTjwMvVIsGGthFNHVPIUx88R4i+sAP
	 z3QSsVI/Az/Jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1765984953; x=1766245453; i=anthony.perard@vates.tech;
	bh=g4SX8fwM2YkDIv4TQg3YtBTOuJ7xDMTlgexSpduwx3E=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=KbCU1KeQiGojSfnn4TzjX5Du6H9AryDp1UoogLRZp1fjdNNzcc3lo/GhJMgyA/Lnh
	 bS/y0VfPWelFi6HMRSy8oM34SdfeU4wNc4pz+86usGxBp+H+8UiWLzSQofFnRO01gk
	 hMeyFgwxYSJ+jOVrvCyZwLHTxz+5pXEDbds+Gy9um5Sc1aPsj1NgRSXz2iTrdx1/zX
	 pz092YaEds009YjDk0pGPRpDuOHMBJRX4RZcEN/z2iKbGrBS60DmDTy3/O7kOyTp5c
	 Mbpx1Egc6ZdS5szD4Wjix7s4Fm4k96BAG1eY5HjPzNzfuGDu2NpbZJdUL53orbHlm7
	 r5K0rXPfr3kKg==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[RESEND=20PATCH=20v2=202/3]=20hvmloader:=20Update=20to=20SMBIOS=202.6?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1765984952731
To: "Teddy Astie" <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <aULKuBann7bzQtBS@l14>
References: <cover.1756460430.git.teddy.astie@vates.tech> <57c674cc364d3b8f4c6d03533b9e2b45728d2c19.1756460430.git.teddy.astie@vates.tech>
In-Reply-To: <57c674cc364d3b8f4c6d03533b9e2b45728d2c19.1756460430.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f977cb9039de4ecaaea512ea9f1a06ad?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251217:md
Date: Wed, 17 Dec 2025 15:22:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Aug 29, 2025 at 09:58:16AM +0000, Teddy Astie wrote:
> Currently, hvmloader uses SMBIOS 2.4, however, when using OVMF, the
> SMBIOS is patched to 2.8, which has clarified the UUID format (as GUID).
> 
> In Linux, if the SMBIOS version is >= 2.6, the GUID format is used, else
> (undefined as per SMBIOS spec), big endian is used (used by Xen). Therefore,
> you have a endian mismatch causing the UUIDs to mismatch in the guest.
> 
> $ cat /sys/hypervisor/uuid
> e865e63f-3d30-4f0b-83e0-8fdfc1e30eb7
> $ cat /sys/devices/virtual/dmi/id/product_uuid
> 3fe665e8-303d-0b4f-83e0-8fdfc1e30eb7
> $ cat /sys/devices/virtual/dmi/id/product_serial
> e865e63f-3d30-4f0b-83e0-8fdfc1e30eb7
> 
> This patch updates the SMBIOS version from 2.4 to 2.6 and does the appropriate
> modifications of the table. This effectively fix this endianness mismatch with
> OVMF; while the UUID displayed by Linux is still the same for SeaBIOS.

Just curious, why change hvmloader to generate an SMBIOS v2.6 table
when OVMF later say it's v2.8 ? Why do we change hvmloader when the
problem is OVMF making change to the table before giving it to the OS?

As far as I can tell, OVMF doesn't take into account the version of the
SMBIOS table provided by hvmloader and just use the default set at build
time. This can be changed with the PCD
gEfiMdeModulePkgTokenSpaceGuid.PcdSmbiosVersion, it's currently set to
v2.8. The main used of the version number by OVMF seems to be to check
the max sizes.

Before making any changes in hvmloader, we should first fix OvmfXen to
take into account the version of the SMBIOS table that is received.
Otherwise, we just add more tech dept. We might one day want to use a
newer version of SMBIOS, OVMF should be ready by then.


Now, for the change of SMBIOS version. I think that starting to provide
a v2.6 is a good move, but we should list the correct reason for doing
so. OVMF can mostly stay out of the picture here, and be fix separately.
One main issue we can state is that Linux and Windows interpret the UUID
in the SMBIOS differently, when the version is v2.4. I've booted Windows
with SeaBIOS and read the UUID from the SMBIOS table with

    wmic csproduct get uuid

and the UUID return is read according to the new definition propose in
SMBIOS v2.6, even if the table is said to be v2.4, so the UUID is
different from the one set by the toolstack. Moving to v2.6 would indeed
fix this discrepancy.


Next, we are going to want a way to fallback to v2.4 when a guest needs
to observe no changes across reboot. `xl` already have
`smbios_firmware=` which is passthrough `hvmloader` via xenstore entry
`hvmloader/smbios/{address,length}`, but that interface would allow to
only replace a structure (like replacing the type 1 structure) and
doesn't allow to change the version. (And that would duplicate SMBIOS
table generation between hvmloader and the toolstack, which isn't ideal.)
So, will need some changes to `xl`, `libxl`, and `hvmloader`.


> Fixes: c683914ef913 ("Add code to generate SMBIOS tables to hvmloader.")
> (SMBIOS versions before 2.6 has a ill-defined UUID definition)

This space in a commit description is usually reserved for tags and
sometime comment of change made to a patch while
committing/cherry-picking. Comment about a previous commit can be before
these tags, like stating that "commit a1b2c3 made some unhelpful
changes and still have the Fixes:a1b2c3 (...) tag.

> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Thanks,

-- 

--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech




Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D10D032F1
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 14:55:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197682.1515161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdqSo-0000hJ-LR; Thu, 08 Jan 2026 13:54:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197682.1515161; Thu, 08 Jan 2026 13:54:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdqSo-0000ee-I7; Thu, 08 Jan 2026 13:54:10 +0000
Received: by outflank-mailman (input) for mailman id 1197682;
 Thu, 08 Jan 2026 13:54:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MP95=7N=bounce.vates.tech=bounce-md_30504962.695fb6fd.v1-dd8687acf30f42049fe384c5d2cd292a@srs-se1.protection.inumbo.net>)
 id 1vdqSm-0000eY-Ta
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 13:54:09 +0000
Received: from mail137-3.atl71.mandrillapp.com
 (mail137-3.atl71.mandrillapp.com [198.2.137.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f88c3b9-ec99-11f0-b15e-2bf370ae4941;
 Thu, 08 Jan 2026 14:54:07 +0100 (CET)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-3.atl71.mandrillapp.com (Mailchimp) with ESMTP id 4dn5ws1M0SzBsTph7
 for <xen-devel@lists.xenproject.org>; Thu,  8 Jan 2026 13:54:05 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 dd8687acf30f42049fe384c5d2cd292a; Thu, 08 Jan 2026 13:54:05 +0000
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
X-Inumbo-ID: 7f88c3b9-ec99-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1767880445; x=1768150445;
	bh=KmZMGZXkEPrMpnkrR8lVjvSw/IC8z1Te/ER/D6CzF5M=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=CkjQ6Wac9Fxn1KMRrqKYIzPtA9ie4qsGtNM9BoeVN/8xnnMeXtA+qvn9n/D4naKQb
	 VOIeAv9Xr2KJ5k+Ro7k6jUXUpeJv0SoO4q68YI5PpG5TioIOzsYp0FbmYKaHW+1YV1
	 Wg7PvV6OZyzUfNS+56Ju4kqtIvok1SsSNgSS7N2nv7DxB5rVtXdACSGedZKXV+5/qq
	 gJt2r0Ahfyc5+1OJS4CDBdh0L6tPcbrWkpQmG96BVEjiG8hQuUxVARcxIPUBD/PYgI
	 Um1egE39O9mbXHEq3T5ehxwAwVm2puz/yHobyM1X0mdOdtYW6+cAKF3YyiYsrAJwJr
	 vt4HSi6iYtVOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1767880445; x=1768140945; i=teddy.astie@vates.tech;
	bh=KmZMGZXkEPrMpnkrR8lVjvSw/IC8z1Te/ER/D6CzF5M=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=aTYg8jVu/Wa0ZUkt4eHJ4fokwCbf6oS4SBUtQJlaf89eTpAVPm2UKPK3L/GHdlxdi
	 VzDjQh3YGgiSURhNTRcCjBhSFD6qLukMI+PAm/8QC57T2DXCfkFyKlGrKc5eRZHdoA
	 FP3xU1wkauHJ4/pAWTjSn5/EBU6+6rajJ6aaWU1BL6ipwce/ki9MheRXKXgY3vZLqD
	 /xx56NwROrqDTPTPVixALovlpzVBpsD99wH2Qbnfa2Ls/zL9JLEbQD54xmWigoU6mo
	 AjnFCQ1+N9b0xeB+SV4QGvB61uR2H7B1fXXaVv9t9pOGysFlsyWpyimS8GBbHJ6MTA
	 2neiL77JfgNpw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RESEND=20PATCH=20v2=202/3]=20hvmloader:=20Update=20to=20SMBIOS=202.6?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1767880443744
Message-Id: <3c6aa6e6-fddc-4b86-925d-078b3c1df765@vates.tech>
To: "Anthony PERARD" <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <cover.1756460430.git.teddy.astie@vates.tech> <57c674cc364d3b8f4c6d03533b9e2b45728d2c19.1756460430.git.teddy.astie@vates.tech> <aULKuBann7bzQtBS@l14>
In-Reply-To: <aULKuBann7bzQtBS@l14>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.dd8687acf30f42049fe384c5d2cd292a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260108:md
Date: Thu, 08 Jan 2026 13:54:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Le 17/12/2025 =C3=A0 16:26, Anthony PERARD a =C3=A9crit=C2=A0:
> On Fri, Aug 29, 2025 at 09:58:16AM +0000, Teddy Astie wrote:
>> Currently, hvmloader uses SMBIOS 2.4, however, when using OVMF, the
>> SMBIOS is patched to 2.8, which has clarified the UUID format (as GUID).
>>
>> In Linux, if the SMBIOS version is >=3D 2.6, the GUID format is used, el=
se
>> (undefined as per SMBIOS spec), big endian is used (used by Xen). Theref=
ore,
>> you have a endian mismatch causing the UUIDs to mismatch in the guest.
>>
>> $ cat /sys/hypervisor/uuid
>> e865e63f-3d30-4f0b-83e0-8fdfc1e30eb7
>> $ cat /sys/devices/virtual/dmi/id/product_uuid
>> 3fe665e8-303d-0b4f-83e0-8fdfc1e30eb7
>> $ cat /sys/devices/virtual/dmi/id/product_serial
>> e865e63f-3d30-4f0b-83e0-8fdfc1e30eb7
>>
>> This patch updates the SMBIOS version from 2.4 to 2.6 and does the appro=
priate
>> modifications of the table. This effectively fix this endianness mismatc=
h with
>> OVMF; while the UUID displayed by Linux is still the same for SeaBIOS.
> 
> Just curious, why change hvmloader to generate an SMBIOS v2.6 table
> when OVMF later say it's v2.8 ? Why do we change hvmloader when the
> problem is OVMF making change to the table before giving it to the OS?
> 
> As far as I can tell, OVMF doesn't take into account the version of the
> SMBIOS table provided by hvmloader and just use the default set at build
> time. This can be changed with the PCD
> gEfiMdeModulePkgTokenSpaceGuid.PcdSmbiosVersion, it's currently set to
> v2.8. The main used of the version number by OVMF seems to be to check
> the max sizes.
> 
> Before making any changes in hvmloader, we should first fix OvmfXen to
> take into account the version of the SMBIOS table that is received.
> Otherwise, we just add more tech dept. We might one day want to use a
> newer version of SMBIOS, OVMF should be ready by then.
> 

That would be better, but with a small issue. SMBIOS 2.4 doesn't define 
EFI as a way to query SMBIOS location. That probably doesn't really 
matter, as the table content of 2.4 still has a meaning in the next 
SMBIOS specifications; but is still worth noting.

> 
> Now, for the change of SMBIOS version. I think that starting to provide
> a v2.6 is a good move, but we should list the correct reason for doing
> so. OVMF can mostly stay out of the picture here, and be fix separately.
> One main issue we can state is that Linux and Windows interpret the UUID
> in the SMBIOS differently, when the version is v2.4. I've booted Windows
> with SeaBIOS and read the UUID from the SMBIOS table with
> 
>      wmic csproduct get uuid
> 
> and the UUID return is read according to the new definition propose in
> SMBIOS v2.6, even if the table is said to be v2.4, so the UUID is
> different from the one set by the toolstack. Moving to v2.6 would indeed
> fix this discrepancy.
> 
On Windows, only doing the endianness change (expected for v2.6) would 
fix what Windows reads, as AFAIU it always considers GUID encoding.

> 
> Next, we are going to want a way to fallback to v2.4 when a guest needs
> to observe no changes across reboot. `xl` already have
> `smbios_firmware=3D` which is passthrough `hvmloader` via xenstore entry
> `hvmloader/smbios/{address,length}`, but that interface would allow to
> only replace a structure (like replacing the type 1 structure) and
> doesn't allow to change the version. (And that would duplicate SMBIOS
> table generation between hvmloader and the toolstack, which isn't ideal.)
> So, will need some changes to `xl`, `libxl`, and `hvmloader`.
> 

I had in mind the idea of moving the entire SMBIOS table creation to be 
fully done in the toolstack (to give it full control on this); so 
hvmloader will no longer have to generate it. The caveats is that it 
implies moving various things around.

> 
>> Fixes: c683914ef913 ("Add code to generate SMBIOS tables to hvmloader.")
>> (SMBIOS versions before 2.6 has a ill-defined UUID definition)
> 
> This space in a commit description is usually reserved for tags and
> sometime comment of change made to a patch while
> committing/cherry-picking. Comment about a previous commit can be before
> these tags, like stating that "commit a1b2c3 made some unhelpful
> changes and still have the Fixes:a1b2c3 (...) tag.
> 
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> 
> Thanks,
> 

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech




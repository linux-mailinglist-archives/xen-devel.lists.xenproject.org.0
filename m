Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E80CE6BB3
	for <lists+xen-devel@lfdr.de>; Mon, 29 Dec 2025 13:40:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194023.1512523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaCXB-00045B-0h; Mon, 29 Dec 2025 12:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194023.1512523; Mon, 29 Dec 2025 12:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaCXA-000427-Tq; Mon, 29 Dec 2025 12:39:36 +0000
Received: by outflank-mailman (input) for mailman id 1194023;
 Mon, 29 Dec 2025 12:39:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sd1l=7D=bounce.vates.tech=bounce-md_30504962.69527681.v1-11c129495fa742df9fe82a7d7a6f0cf9@srs-se1.protection.inumbo.net>)
 id 1vaCXA-000421-0E
 for xen-devel@lists.xenproject.org; Mon, 29 Dec 2025 12:39:36 +0000
Received: from mail136-3.atl41.mandrillapp.com
 (mail136-3.atl41.mandrillapp.com [198.2.136.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bce6bb9-e4b3-11f0-9ccf-f158ae23cfc8;
 Mon, 29 Dec 2025 13:39:31 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-3.atl41.mandrillapp.com (Mailchimp) with ESMTP id 4dfwlP5sSkzBsTwx4
 for <xen-devel@lists.xenproject.org>; Mon, 29 Dec 2025 12:39:29 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 11c129495fa742df9fe82a7d7a6f0cf9; Mon, 29 Dec 2025 12:39:29 +0000
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
X-Inumbo-ID: 6bce6bb9-e4b3-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1767011969; x=1767281969;
	bh=2wHYd+DLVMV+Is74h/VwDQsZQyju8+YI5bbokfnCZd0=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Y0NiD1sZBVrzM4XvDOO8fcoyKdmWT1MLOVVjZ3DfCLCeiJ4q2T59rLvPzq+MU6NuG
	 O1CaoKYKWVSR9hNMu9qEs9/mw6x5NdQrFPGDWQaYcfqqFmC/y+FQj77wpZzQ4BYFsW
	 G1pR72jmIn7Clt5gT+3/tikPjOGoCwrbN1uSyHwDvf6PWROkKVzaMp26oYqVuVs5cc
	 8W+Dktw0M1qSBIyV7WRObs9Gm40v1n2EMPLyqJi3ykFHq9IBumebMh/RNPj3t8qSMv
	 udckXDq95VCVQA8gxajud7kFqNDpOyFqgs8JHDB3pO9M3GaAZWd9yEy4iBPJeMmahH
	 09/X2usi7RXbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1767011969; x=1767272469; i=teddy.astie@vates.tech;
	bh=2wHYd+DLVMV+Is74h/VwDQsZQyju8+YI5bbokfnCZd0=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=1lRnadWzwSghSOfxSSvR6JuizPriLUEeIXuLFfZjC19K3bVAcEYVugSy2d6k1QIkX
	 7pqsiGs3mg7oh/3llg+IztvmvYi2YncqPxlfzMjVug2uCRcFcWXfNxYBme59+ZCKfP
	 BEhaxF+JrUKjqeWjWGRAbjHX0zPZynb8FQnApeShkHXsrlPmoPq7Q/9e+8mS7+WInR
	 2wivLZdyn84girJLwgzbsPLVr3AgKXK5iJvNKrWikmY4f7w26GDNs0cIHQ0XtraZJx
	 ryC1y4XUP+3odNhGw+gMt/DH+Gw6Z5oPFg+561VoGHRtJBJByPs0Fwdfn5ExN8ekFR
	 3wbBB/9Uwlg6Q==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH]=20pvh:=20Introduce=20SIF=5FHVM=5FGHCB=20for=20SEV-ES/SNP=20guests?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1767011968454
Message-Id: <7bbd6560-c988-44d9-a2e8-448cceb455e2@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <3b6f5146287d3402a09836b7cf876d4f8dc9eee1.1766889890.git.teddy.astie@vates.tech> <7d439b75-801b-406d-98e0-29c207e1c1ba@suse.com>
In-Reply-To: <7d439b75-801b-406d-98e0-29c207e1c1ba@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.11c129495fa742df9fe82a7d7a6f0cf9?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251229:md
Date: Mon, 29 Dec 2025 12:39:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 29/12/2025 =C3=A0 09:24, Jan Beulich a =C3=A9crit=C2=A0:
> On 28.12.2025 13:49, Teddy Astie wrote:
>> Under SEV, the pagetables needs to be post-processed to add the C-bit
>> (to make the mapping encrypted). The guest is expected to query the C-bi=
t
>> through CPUID. However, under SEV-ES and SEV-SNP modes, this instruction
>> now triggers #VC instead. The guest would need to setup a IDT very early
>> and instead use the early-GHCB protocol to emulate CPUID, which is
>> complicated.
> 
> But isn't this going to be needed for plain HVM anyway?
> 

This hint is only relevant for PVH entry point. The other guest boot 
paths can still rely on other mechanisms, e.g UEFI boot doesn't rely on 
the IDT approach and relies instead on the UEFI firmware to provide the 
early GHCB handler for the OS.

 From a Linux implementation standpoint, as PVH entry-point doesn't live 
in compressed/ boot code of Linux, the early-GHCB handlers 
(do_vc_no_ghcb and do_boot_stage2_vc) don't exist from there; so we 
either need to reimplement in non-compressed code or use another approach.

>> --- a/xen/include/public/xen.h
>> +++ b/xen/include/public/xen.h
>> @@ -890,6 +890,8 @@ typedef struct start_info start_info_t;
>>   #define SIF_MOD_START_PFN (1<<3)  /* Is mod_start a PFN? */
>>   #define SIF_VIRT_P2M_4TOOLS (1<<4) /* Do Xen tools understand a virt. =
mapped */
>>                                      /* P->M making the 3 level tree obs=
olete? */
>> +#define SIF_HVM_GHCB      (1<<5)   /* Domain is SEV-ES/SNP guest that r=
equires */
>> +                                   /* use of GHCB. */
> 
> Naming-wise, do we really want to tie this to AMD (and hence exclude othe=
r
> vendors, or require yet another bit to be allocated later)?
> 

This is SEV-ES/SNP only, I don't think the same bit can be reused for 
another technology (unless it also uses the GHCB MSR). As the guest 
can't even check if it is Intel or AMD CPU at this point (if running 
under SEV-ES or SEV-SNP).

> Jan
> 

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech




Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 292D0C20D68
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 16:11:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153774.1484045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEUIN-000739-Ql; Thu, 30 Oct 2025 15:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153774.1484045; Thu, 30 Oct 2025 15:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEUIN-00070n-NF; Thu, 30 Oct 2025 15:10:35 +0000
Received: by outflank-mailman (input) for mailman id 1153774;
 Thu, 30 Oct 2025 15:10:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CzSz=5H=raptorengineering.com=tpearson@srs-se1.protection.inumbo.net>)
 id 1vEUIN-0006rl-3V
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 15:10:35 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9405bedf-b5a2-11f0-9d16-b5c5bf9af7f9;
 Thu, 30 Oct 2025 16:10:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C41617791C28;
 Thu, 30 Oct 2025 10:10:31 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id qLxgRnko9HcV; Thu, 30 Oct 2025 10:10:31 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 28C317791D5F;
 Thu, 30 Oct 2025 10:10:31 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id HVRYlm1oAj6F; Thu, 30 Oct 2025 10:10:31 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 08A0B7791C28;
 Thu, 30 Oct 2025 10:10:31 -0500 (CDT)
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
X-Inumbo-ID: 9405bedf-b5a2-11f0-9d16-b5c5bf9af7f9
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 28C317791D5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1761837031; bh=VxeOnt7rxrW/scawRbAXucAPnTfzQqZWvCR3Oykm0Lw=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=VmFze60JcyflVIo/obplSBl9/QcTBhdZGho/scGkuR7+s1hR96I5IgJnBi4u2F4NR
	 +TbkLW9SvMrxB9cLG2ABDpG4CORBnz6YyIXqmySqvZWDkIZXfUwbG85XGQ6I49PkPL
	 mm46mSl7NBmPDmdedd5rt+UDHoQxkZi/aY4hZJdw=
X-Virus-Scanned: amavisd-new at rptsys.com
Date: Thu, 30 Oct 2025 10:10:30 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, 
	Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, 
	Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <1147119844.6178.1761837030938.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <6744abf0-3326-4de2-a14b-70faf56e91e6@suse.com>
References: <1066630274.4872.1761755029561.JavaMail.zimbra@raptorengineeringinc.com> <6744abf0-3326-4de2-a14b-70faf56e91e6@suse.com>
Subject: Re: [PATCH v2] xen/ppc: Fix tooling FTBFS due to missing
 definitions in public header
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC141 (Linux)/8.5.0_GA_3042)
Thread-Topic: xen/ppc: Fix tooling FTBFS due to missing definitions in public header
Thread-Index: 8c1xizcSLi7qAz85JJI7wBArmtZGcQ==



----- Original Message -----
> From: "Jan Beulich" <jbeulich@suse.com>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "xen-devel" <xen-devel@lists.xenproject.org>, "Andrew Cooper" <andrew=
.cooper3@citrix.com>, "Julien Grall"
> <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Anthony=
 PERARD" <anthony.perard@vates.tech>, "Michal
> Orzel" <michal.orzel@amd.com>, "Roger Pau Monn=C3=A9" <roger.pau@citrix.c=
om>
> Sent: Thursday, October 30, 2025 2:43:00 AM
> Subject: Re: [PATCH v2] xen/ppc: Fix tooling FTBFS due to missing definit=
ions in public header

> On 29.10.2025 17:23, Timothy Pearson wrote:
>> int64_aligned_t and uint64_aligned_t need to be exposed when the GNU C c=
ompiler
>> is in use.
>>=20
>> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
>=20
> Thanks. However, you've lost my R-b, and the Cc list was again entirely e=
mpty.
>=20
> Jan

Apologies again.  I had thought for a trivial patch the CC was not required=
, will keep that in mind in the future.  Thanks!


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9600C20F0D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 16:32:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153818.1484085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEUcz-0003GW-5Z; Thu, 30 Oct 2025 15:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153818.1484085; Thu, 30 Oct 2025 15:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEUcz-0003E1-2g; Thu, 30 Oct 2025 15:31:53 +0000
Received: by outflank-mailman (input) for mailman id 1153818;
 Thu, 30 Oct 2025 15:31:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CzSz=5H=raptorengineering.com=tpearson@srs-se1.protection.inumbo.net>)
 id 1vEUcy-0002DF-9c
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 15:31:52 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e4b28aa-b5a5-11f0-9d16-b5c5bf9af7f9;
 Thu, 30 Oct 2025 16:31:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id AAC7F7790720;
 Thu, 30 Oct 2025 10:31:50 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id PS08QgnjzqLW; Thu, 30 Oct 2025 10:31:50 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 0A2E177907D5;
 Thu, 30 Oct 2025 10:31:50 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 7-VaWVDYBTLm; Thu, 30 Oct 2025 10:31:49 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id DDFBC7790720;
 Thu, 30 Oct 2025 10:31:49 -0500 (CDT)
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
X-Inumbo-ID: 8e4b28aa-b5a5-11f0-9d16-b5c5bf9af7f9
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 0A2E177907D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1761838310; bh=IgybOXYTuqFeds5uM5j9KzF1rmHHpteR8WES1693GQU=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=KJhHFxWjQoosZn/3B0zt6M8gZ9XpqSBqfizlDwHHwq3PvoTZVVeGdTvSDQz9/Jgye
	 84HTBwvEtk5UzRahJ95RO2KNw5SBThNWyctr+QrtvSP2FUl+XoCTtrbC/QFQor5qNa
	 oc4E4wCaCI8HeObIIy4oFPNmKOFVxiSo6yWt3PM4=
X-Virus-Scanned: amavisd-new at rptsys.com
Date: Thu, 30 Oct 2025 10:31:49 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, 
	Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, 
	Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <619951488.6326.1761838309870.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <fb391488-ea43-4565-9d1c-cdfd58602615@suse.com>
References: <1066630274.4872.1761755029561.JavaMail.zimbra@raptorengineeringinc.com> <6744abf0-3326-4de2-a14b-70faf56e91e6@suse.com> <1147119844.6178.1761837030938.JavaMail.zimbra@raptorengineeringinc.com> <fb391488-ea43-4565-9d1c-cdfd58602615@suse.com>
Subject: Re: [PATCH v2] xen/ppc: Fix tooling FTBFS due to missing
 definitions in public header
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC141 (Linux)/8.5.0_GA_3042)
Thread-Topic: xen/ppc: Fix tooling FTBFS due to missing definitions in public header
Thread-Index: GOLKPcU4SRpHb2GslXxaFZbEsgrErw==



----- Original Message -----
> From: "Jan Beulich" <jbeulich@suse.com>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "xen-devel" <xen-devel@lists.xenproject.org>, "Andrew Cooper" <andrew=
.cooper3@citrix.com>, "Julien Grall"
> <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Anthony=
 PERARD" <anthony.perard@vates.tech>, "Michal
> Orzel" <michal.orzel@amd.com>, "Roger Pau Monn=C3=A9" <roger.pau@citrix.c=
om>
> Sent: Thursday, October 30, 2025 10:30:39 AM
> Subject: Re: [PATCH v2] xen/ppc: Fix tooling FTBFS due to missing definit=
ions in public header

> On 30.10.2025 16:10, Timothy Pearson wrote:
>> ----- Original Message -----
>>> From: "Jan Beulich" <jbeulich@suse.com>
>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>=20
>>> On 29.10.2025 17:23, Timothy Pearson wrote:
>>>> int64_aligned_t and uint64_aligned_t need to be exposed when the GNU C=
 compiler
>>>> is in use.
>>>>
>>>> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
>>>
>>> Thanks. However, you've lost my R-b, and the Cc list was again entirely=
 empty.
>>=20
>> Apologies again.  I had thought for a trivial patch the CC was not requi=
red,
>> will keep that in mind in the future.
>=20
> Just to clarify: However trivial a patch, it needs to be acked by a maint=
ainer.
> Hence
> they will want Cc-ing (not everyone's subscribed to the list, and not eve=
ryone
> may be
> following each and every patch that's flowing in).
>=20
> Jan

Fair enough.  I'll come up to speed eventually. ;)


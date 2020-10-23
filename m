Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E412979B4
	for <lists+xen-devel@lfdr.de>; Sat, 24 Oct 2020 01:36:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11348.30083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kW6bX-0002z7-SH; Fri, 23 Oct 2020 23:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11348.30083; Fri, 23 Oct 2020 23:36:15 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kW6bX-0002yi-PD; Fri, 23 Oct 2020 23:36:15 +0000
Received: by outflank-mailman (input) for mailman id 11348;
 Fri, 23 Oct 2020 23:36:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fepJ=D6=nask.pl=michall@srs-us1.protection.inumbo.net>)
 id 1kW6bW-0002yd-Dm
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 23:36:14 +0000
Received: from mx.nask.net.pl (unknown [195.187.55.89])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef37d5a8-c4db-4c2f-987b-8f3cd60cca37;
 Fri, 23 Oct 2020 23:36:11 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=fepJ=D6=nask.pl=michall@srs-us1.protection.inumbo.net>)
	id 1kW6bW-0002yd-Dm
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 23:36:14 +0000
X-Inumbo-ID: ef37d5a8-c4db-4c2f-987b-8f3cd60cca37
Received: from mx.nask.net.pl (unknown [195.187.55.89])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ef37d5a8-c4db-4c2f-987b-8f3cd60cca37;
	Fri, 23 Oct 2020 23:36:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at 
Date: Sat, 24 Oct 2020 01:36:09 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: =?utf-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Message-ID: <1398275796.814046.1603496169810.JavaMail.zimbra@nask.pl>
In-Reply-To: <a80f05ac-bd18-563e-12f7-1a0f9f0d4f6b@suse.com>
References: <157653679.6164.1603407559737.JavaMail.zimbra@nask.pl> <a80f05ac-bd18-563e-12f7-1a0f9f0d4f6b@suse.com>
Subject: Re: BUG: credit=sched2 machine hang when using DRAKVUF
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.187.238.14]
X-Mailer: Zimbra 9.0.0_GA_3969 (ZimbraWebClient - GC86 (Win)/9.0.0_GA_3969)
Thread-Topic: credit=sched2 machine hang when using DRAKVUF
Thread-Index: ehjKdI2aZ/NIQ0mvEFcfZJ714jsIjw==

----- 23 pa=C5=BA, 2020 o 6:47, J=C3=BCrgen Gro=C3=9F jgross@suse.com napis=
a=C5=82(a):

> On 23.10.20 00:59, Micha=C5=82 Leszczy=C5=84ski wrote:
>> Hello,
>>=20
>> when using DRAKVUF against a Windows 7 x64 DomU, the whole machine hangs=
 after a
>> few minutes.
>>=20
>> The chance for a hang seems to be correlated with number of PCPUs, in th=
is case
>> we have 14 PCPUs and hang is very easily reproducible, while on other ma=
chines
>> with 2-4 PCPUs it's very rare (but still occurring sometimes). The issue=
 is
>> observed with the default sched=3Dcredit2 and is no longer reproducible =
once
>> sched=3Dcredit is set.
>=20
> Interesting. Can you please share some more information?
>=20
> Which Xen version are you using?

RELEASE-4.14

>=20
> Is there any additional information in the dom0 log which could be
> related to the hang (earlier WARN() splats, Oopses, Xen related
> messages, hardware failure messages, ...?

I will try to find something out next week and will come back to you.

>=20
> Can you please try to get backtraces of all cpus at the time of the
> hang?
>=20
> It would help to know which cpu was the target of the call of
> smp_call_function_single(), so a disassembly of that function would
> be needed to find that information from the dumped registers.
>=20
> I'm asking because I've seen a similar problem recently and I was
> rather suspecting a fifo event channel issue than the Xen scheduler,
> but your data suggests it could be the scheduler after all (if it is
> the same issue, of course).
>=20
>=20
> Juergen


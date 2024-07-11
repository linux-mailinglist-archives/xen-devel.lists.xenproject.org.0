Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4743492E8F0
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 15:09:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757460.1166400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRtYR-0001Sq-TR; Thu, 11 Jul 2024 13:09:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757460.1166400; Thu, 11 Jul 2024 13:09:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRtYR-0001Qh-QG; Thu, 11 Jul 2024 13:09:47 +0000
Received: by outflank-mailman (input) for mailman id 757460;
 Thu, 11 Jul 2024 13:09:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NKZT=OL=inria.fr=fonyuy-asheri.caleb@srs-se1.protection.inumbo.net>)
 id 1sRtYQ-0001QV-HI
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 13:09:46 +0000
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7a126b1-3f86-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 15:09:45 +0200 (CEST)
Received: from zcs2-store8.inria.fr ([128.93.142.6])
 by mail2-relais-roc.national.inria.fr with ESMTP; 11 Jul 2024 15:09:44 +0200
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
X-Inumbo-ID: d7a126b1-3f86-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:message-id:in-reply-to:references:
   subject:mime-version:content-transfer-encoding;
  bh=cZr7xXnv9h1f+J7ATc+bPjBhHBobn15a9yykB9OuHrA=;
  b=JzNofOm+sqt1JomdvzT/gHc+Zpw4WCwqjZRIqjHrWgDn9oac5IGSqlGU
   to+GxptIYIv4c5q3/yNvqBrvPlXPj2gKAsJcGqosyNS3TjDeNg6QY2ini
   MIOOGpcKewsQkRMAXZaOXJJpTcmz6dBCQqYwAXjhLrSv2C0PTAmXdODVZ
   U=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=fonyuy-asheri.caleb@inria.fr; spf=None smtp.helo=postmaster@zcs2-store8.inria.fr
Received-SPF: Pass (mail2-relais-roc.national.inria.fr: domain of
  fonyuy-asheri.caleb@inria.fr designates 128.93.142.6 as
  permitted sender) identity=mailfrom; client-ip=128.93.142.6;
  receiver=mail2-relais-roc.national.inria.fr;
  envelope-from="fonyuy-asheri.caleb@inria.fr";
  x-sender="fonyuy-asheri.caleb@inria.fr";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 include:mailout.safebrands.com
  a:basic-mail.safebrands.com a:basic-mail01.safebrands.com
  a:basic-mail02.safebrands.com ip4:128.93.142.0/24
  ip4:192.134.164.0/24 ip4:128.93.162.160 ip4:89.107.174.7 mx
  ~all"
Received-SPF: None (mail2-relais-roc.national.inria.fr: no sender
  authenticity information available from domain of
  postmaster@zcs2-store8.inria.fr) identity=helo;
  client-ip=128.93.142.6;
  receiver=mail2-relais-roc.national.inria.fr;
  envelope-from="fonyuy-asheri.caleb@inria.fr";
  x-sender="postmaster@zcs2-store8.inria.fr";
  x-conformance=spf_only
X-IronPort-AV: E=Sophos;i="6.09,200,1716242400"; 
   d="scan'208";a="175059713"
X-MGA-submission: =?us-ascii?q?MDFVP1RRxer2988/hwgirEH9VHDz0NW0w8OCyL?=
 =?us-ascii?q?SDRTkFvV9QtYwlqOjkcr1GqkkOfMQMSA/Ez/4HMsTBPmyTmIPjukkFbZ?=
 =?us-ascii?q?0dFP7OYdefFZGSJ9/sZ37N5mZUlKwOHyquEmJ9ioV/yqa/DMyk7Nondr?=
 =?us-ascii?q?laHHPViTBMaTlZUJ7g7Po//A=3D=3D?=
Date: Thu, 11 Jul 2024 15:09:44 +0200 (CEST)
From: Fonyuy-Asheri Caleb <fonyuy-asheri.caleb@inria.fr>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <1438936323.2292864.1720703384889.JavaMail.zimbra@inria.fr>
In-Reply-To: <24c09811-71ae-44e9-89d4-cec2c0f5a210@citrix.com>
References: <60751777.2038091.1720694327760.JavaMail.zimbra@inria.fr> <94e94a94-14f2-4fa6-bc3b-6c64c1b84b59@citrix.com> <1546743760.2065506.1720696161057.JavaMail.zimbra@inria.fr> <f0bdd5ca-3f85-4998-9476-18e768352bec@citrix.com> <71164270.2157213.1720700315521.JavaMail.zimbra@inria.fr> <24c09811-71ae-44e9-89d4-cec2c0f5a210@citrix.com>
Subject: Re: Help with Understanding vcpu xstate restore error during vm
 migration
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [131.254.23.3]
X-Mailer: Zimbra 10.0.8_GA_4611 (ZimbraWebClient - GC126 (Linux)/10.0.8_GA_4611)
Thread-Topic: Help with Understanding vcpu xstate restore error during vm migration
Thread-Index: 4sl4sid4hzL+PQUIcGGIaGZ0RbnpjA==


----- Original Message -----
> From: "Andrew Cooper" <andrew.cooper3@citrix.com>
> To: "Fonyuy-Asheri Caleb" <fonyuy-asheri.caleb@inria.fr>
> Cc: "xen-devel" <xen-devel@lists.xenproject.org>, "Jan Beulich" <jbeulich=
@suse.com>, "Roger Pau Monn=E9"
> <roger.pau@citrix.com>
> Sent: Thursday, July 11, 2024 3:04:05 PM
> Subject: Re: Help with Understanding vcpu xstate restore error during vm =
migration

> On 11/07/2024 1:18 pm, Fonyuy-Asheri Caleb wrote:
>>>> Please do you mind giving me more insight on the logic currently imple=
mented
>>>> and maybe what is wrong with it? It will be important for me since wha=
t I'm
>>>> doing is research work.
>>> See 9e6dbbe8bf40^..267122a24c49
>> What reference is this please?
>=20
> It's a git commit-range. You want:
>=20
> $ git log 9e6dbbe8bf40^..267122a24c49
>=20
> to view them.
>=20
>>
>>>> How do the values evc->size and xfeature_mask relate to the source and=
 target
>>>> processor xstates (or xstate management)?
>>> The lower bounds check is for normal reasons, while the upper bounds
>>> check is a sanity "does this image appear to have more states active
>>> than the current system".
>>>
>>> The upper bound is bogus, because "what this VM has" has no true
>>> relationship to "what Xen decided to turn on by default at boot".
>> I see. My initial question about this was more of understanding how this
>> information
>> is gathered. Is it directly related to the CPUID of the VM or does depen=
d on the
>> state
>> of the VM at the moment of migrating it?
>>
>> If it is related to the CPUID, how is it constructed?
>=20
> The size of the xsave area is a function of the *current* value in
> %xcr0.=A0 (On Haswell.=A0 Lets ignore MSR_XSS on newer systems for now.)
>=20
> However, because guests can modify %xcr0 and turn states back off, Xen
> has to track xcr0_accum which is all bits we've ever seen the guest turn =
on.
>=20
> CPUID (and in particular, the guest's CPU policy data) controls which
> states the guest is permitted to activate, which in turn influences the
> size.
>=20
> Xen's normal CPUID handling logic *should* make it impossible for a
> guest to see features which hardware isn't capable of, and should block
> migration to a system which is less capable too.
>=20
> I suspect what's going on here is that the destination has one or more
> of AVX|SSE|x87 disabled somehow, and this check is failing before the
> more coherent one which should explain why the VM can't migrate in...
>=20

Thank you. This makes much more sense now.=20


>=20
>>
>>>>> To start with, which version (or versions?) of Xen, and what hardware=
?
>>>> Xen version 4.18.3-pre
>>> As you're not on a specific tag, exact changeset?
>> I am on the stable-4.18 tag.
>=20
> That's a branch which moves, not a tag.
>=20
> What does `git show` say?=A0 Just need the first few lines.
Here is the output of git show:


commit 45c5333935628e7c80de0bd5a9d9eff50b305b16 (HEAD -> stable-4.18, origi=
n/staging-4.18, origin/stable-4.18)
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Jul 4 16:57:29 2024 +0200

    evtchn: build fix for Arm


>=20
> ~Andrew

Caleb


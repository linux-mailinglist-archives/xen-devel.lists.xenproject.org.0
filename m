Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D7F8BC9DD
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 10:46:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717327.1119424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3tz2-0006fh-LV; Mon, 06 May 2024 08:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717327.1119424; Mon, 06 May 2024 08:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3tz2-0006cP-Ig; Mon, 06 May 2024 08:46:04 +0000
Received: by outflank-mailman (input) for mailman id 717327;
 Mon, 06 May 2024 08:46:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Q7K=MJ=inria.fr=fonyuy-asheri.caleb@srs-se1.protection.inumbo.net>)
 id 1s3tz0-0006Kb-Aa
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 08:46:02 +0000
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 101eb759-0b85-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 10:46:00 +0200 (CEST)
Received: from zcs2-store8.inria.fr ([128.93.142.6])
 by mail2-relais-roc.national.inria.fr with ESMTP; 06 May 2024 10:46:00 +0200
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
X-Inumbo-ID: 101eb759-0b85-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:message-id:in-reply-to:references:
   subject:mime-version:content-transfer-encoding;
  bh=3YzvehrpGhuFqIC/wsqReooTMwVJmiiSvD4Ye90gxdU=;
  b=BvBRwtZqgfG4WqgQFe7VuQKN+eRRxRU02FB4qzwgDlb4KDoWFTgZvROw
   Kj5NEs1W7Gavd8B60AP9CEu4rIg174+Du82mtAbYjDurytnynXvSWZ0Dc
   9SpKZjDOa15MgqqASOo0hXikVWLLhfuhyLK+aVvjt8VKu8GnsZToVc7le
   A=;
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
X-IronPort-AV: E=Sophos;i="6.07,257,1708383600"; 
   d="scan'208";a="164628874"
X-MGA-submission: =?us-ascii?q?MDEmAluPrGZbeGbY2zZzPkIZW/UO20cBb4070q?=
 =?us-ascii?q?Fp21AzsCMXN87/g9v5E0Lq3Jwa0vpoalWr1hgmnNn84mqmcLrMfBv4cS?=
 =?us-ascii?q?VJ6vJtPALmqPKlxbpWg1r2FQjtDeYGOreW/eDkXjN1QpYu8HE9/gkSBP?=
 =?us-ascii?q?kaByGhP6jr6mqzANm5ILR5nw=3D=3D?=
Date: Mon, 6 May 2024 10:45:59 +0200 (CEST)
From: Fonyuy-Asheri Caleb <fonyuy-asheri.caleb@inria.fr>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <1049993614.4894172.1714985159910.JavaMail.zimbra@inria.fr>
In-Reply-To: <ZjiWDMXFNmwSzAxQ@macbook>
References: <2066842119.4829764.1714981618946.JavaMail.zimbra@inria.fr> <ZjiWDMXFNmwSzAxQ@macbook>
Subject: Re: file xen/include/xen/lib/x86/cpu-policy.h: Meaning of CPUID
 constants
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [131.254.23.3]
X-Mailer: Zimbra 10.0.8_GA_4611 (ZimbraWebClient - GC124 (Linux)/10.0.8_GA_4611)
Thread-Topic: file xen/include/xen/lib/x86/cpu-policy.h: Meaning of CPUID constants
Thread-Index: H7fOWAst3uymhR9+0n74Xxv6FcRcAQ==

> From: "Roger Pau Monn=E9" <roger.pau@citrix.com>
> To: "Fonyuy-Asheri Caleb" <fonyuy-asheri.caleb@inria.fr>
> Cc: "xen-devel" <xen-devel@lists.xenproject.org>
> Sent: Monday, May 6, 2024 10:34:20 AM
> Subject: Re: file xen/include/xen/lib/x86/cpu-policy.h: Meaning of CPUID =
constants

> On Mon, May 06, 2024 at 09:46:58AM +0200, Fonyuy-Asheri Caleb wrote:
>> Hi,
>> I am currently doing a study on the way xen handles CPUID information.
>>=20
>> I came across these constants in the code (xen/include/xen/lib/x86/cpu-p=
olicy.h
>> file) but no explanation of why they have been set that way.
>>=20
>> #define CPUID_GUEST_NR_BASIC (0xdu + 1)
>> #define CPUID_GUEST_NR_CACHE (5u + 1)
>> #define CPUID_GUEST_NR_FEAT (2u + 1)
>> #define CPUID_GUEST_NR_TOPO (1u + 1)
>> #define CPUID_GUEST_NR_XSTATE (62u + 1)
>> #define CPUID_GUEST_NR_EXTD_INTEL (0x8u + 1)
>> #define CPUID_GUEST_NR_EXTD_AMD (0x21u + 1)
>>=20
>> Please can someone explain to me why we have these constants or point to=
 a
>> documentation which explains it?
>> I am particularly interested in the CPUID_GUEST_NR_BASIC given that for =
intel
>> processors for example, we have
>> basic leaves running up to 0x21u already for recent processors. This val=
ue sort
>> of forces a particular max leaf value.
>=20
> This is related to the maximum leaves supported in the cpu_policy
> structure:
>=20
> https://elixir.bootlin.com/xen/latest/source/xen/include/xen/lib/x86/cpu-=
policy.h#L122
>=20
> For basic leaves (0x000000xx) we support up to leaf 0xd (XSTATE).  It
> doesn't mean there are no further leaves behind it, but we likely
> still have no use for them, and hence they are not part of the policy.
> The cpu-policy is used to store a (cpuid) policy object for guests,
> so if the information exposed in those leaves are related to features
> that are never exposed to guests is makes no sense to have space for
> them.

So if I understand you well, you mean before extending this, we need to per=
form a study on the=20
leaves to confirm how useful they are to the guests depending on the cpu in=
formation they carry.=20

>=20
> Regards, Roger.


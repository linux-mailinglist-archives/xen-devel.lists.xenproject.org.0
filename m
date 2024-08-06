Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A559489B9
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 09:05:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772516.1182964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbEFa-0003rL-2G; Tue, 06 Aug 2024 07:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772516.1182964; Tue, 06 Aug 2024 07:04:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbEFZ-0003pE-Vr; Tue, 06 Aug 2024 07:04:53 +0000
Received: by outflank-mailman (input) for mailman id 772516;
 Tue, 06 Aug 2024 07:04:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nfQe=PF=inria.fr=fonyuy-asheri.caleb@srs-se1.protection.inumbo.net>)
 id 1sbEFY-0003gs-5J
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 07:04:52 +0000
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c8244a2-53c2-11ef-bc04-fd08da9f4363;
 Tue, 06 Aug 2024 09:04:51 +0200 (CEST)
Received: from zcs2-store8.inria.fr ([128.93.142.6])
 by mail2-relais-roc.national.inria.fr with ESMTP; 06 Aug 2024 09:04:51 +0200
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
X-Inumbo-ID: 2c8244a2-53c2-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:message-id:in-reply-to:references:
   subject:mime-version:content-transfer-encoding;
  bh=JBO23CLncQN8Wua0Tl4SDw612qo/NR9TnhmVZJi8TP0=;
  b=agrebRzL+KVAzgk5gYAhlttvvWdWevZ+ofVpIWlmvhDAu8Uxqx+uuTTU
   U9fUVa1S+ylwPPA2mdz5d1VQy+8hzmqWnFzswy4+cileAtUvntM1kr1Mn
   BGb1R+IVIs0HTuBSvkDPoggt6E2Tj5EvB760I5xMvawplIS/epQxYYSFl
   4=;
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
X-IronPort-AV: E=Sophos;i="6.09,267,1716242400"; 
   d="scan'208";a="178219637"
X-MGA-submission: =?us-ascii?q?MDFeyFYrsujnHhHSNTFYbq2D8e3fbgJ5bplJhB?=
 =?us-ascii?q?ND1we4I+xHbNk5DkNLE0hdDBbBL5AORqZ6fCtZzt0eRhEtv+cSat9xJx?=
 =?us-ascii?q?v5Ac25E8FH4J34A9mj0w7GVOYC7WKjDqzLlYTySPBVLxMX0GgjS0prIo?=
 =?us-ascii?q?PNMge8W5t81g64xn5X9Gih/w=3D=3D?=
Date: Tue, 6 Aug 2024 09:04:50 +0200 (CEST)
From: Fonyuy-Asheri Caleb <fonyuy-asheri.caleb@inria.fr>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <120712863.15929301.1722927890402.JavaMail.zimbra@inria.fr>
In-Reply-To: <ece26efe-c1af-4fd2-910d-01a33beda5cc@citrix.com>
References: <60751777.2038091.1720694327760.JavaMail.zimbra@inria.fr> <94e94a94-14f2-4fa6-bc3b-6c64c1b84b59@citrix.com> <1546743760.2065506.1720696161057.JavaMail.zimbra@inria.fr> <8f8dac21-92fe-4760-8578-2fbfde2f2c14@citrix.com> <1557490999.4048664.1721029086794.JavaMail.zimbra@inria.fr> <77f1ff6e-a7dd-45c8-b706-429674b559f2@suse.com> <ece26efe-c1af-4fd2-910d-01a33beda5cc@citrix.com>
Subject: Re: Help with Understanding vcpu xstate restore error during vm
 migration
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [131.254.23.3]
X-Mailer: Zimbra 10.0.8_GA_4611 (ZimbraWebClient - GC127 (Linux)/10.0.8_GA_4611)
Thread-Topic: Help with Understanding vcpu xstate restore error during vm migration
Thread-Index: 9qK/H/iwr6ZqhrFw+kugctFayT/D5A==

Hello Andrew,=20
Hello Jan,

Please permit me to come back to this once again.=20

> On 15/07/2024 9:16 am, Jan Beulich wrote:
>> On 15.07.2024 09:38, Fonyuy-Asheri Caleb wrote:
>>>> Perhaps the more important question, are you booting the skylake with
>>>> cpuid=3Dno-avx on the command line by any chance?
>>> No. I didn't boot any of the machines with any cpuid modification whats=
oever.
>> Yet is there perhaps "Mitigating GDS by disabling AVX" in the boot log o=
f
>> the hypervisor (which sadly so far you didn't supply anywhere afaics)?
>=20
> Oh - good point.=A0 I'd completely forgotten about that.
>=20
> If you've got out-of-date microcode (specifically microcode prior to
> 2023-08-08), then yes, Xen will disable AVX by default to mitigate
> CVE-2022-40982 / "Gather Data Sampling", and the symptoms would look
> exactly like this.
>=20
> ~Andrew


I was able to obtain access to an Ice Lake Xeon processor
which is one of the processors affected by the GDS vulnerability.

I will like to know what could be the effect of this "cpuid=3Dno-avx" xen d=
efault
on the xstates handled by the system. How does this disabling manifest itse=
lf=20
between on my CPUID or list of features?=20

Also, I would like to understand the relationship between xstates in xen an=
d xsave
dependencies on the system? I was expecting to have more xstates once i hav=
e more
xsave dependencies but was surprised to notice a live migration go through =
from a=20
cpu with more xsave dependencies to one with fewer dependencies(features wh=
ich=20
use xsave). Is there something I'm understanding wrongly?=20

Lastly, during vm migration, do we consider all possible xstates or just th=
e active=20
xstates of the cpu? I am not able to figure that out from the code yet.=20


Thank you in advance

Caleb


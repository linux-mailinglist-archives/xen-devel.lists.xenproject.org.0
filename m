Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B71C930EF4
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 09:38:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758696.1168127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTGHi-0004uA-GU; Mon, 15 Jul 2024 07:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758696.1168127; Mon, 15 Jul 2024 07:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTGHi-0004sO-Db; Mon, 15 Jul 2024 07:38:10 +0000
Received: by outflank-mailman (input) for mailman id 758696;
 Mon, 15 Jul 2024 07:38:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0XWl=OP=inria.fr=fonyuy-asheri.caleb@srs-se1.protection.inumbo.net>)
 id 1sTGHg-0004sI-VX
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 07:38:09 +0000
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d43cad5-427d-11ef-bbfb-fd08da9f4363;
 Mon, 15 Jul 2024 09:38:07 +0200 (CEST)
Received: from zcs2-store8.inria.fr ([128.93.142.6])
 by mail2-relais-roc.national.inria.fr with ESMTP; 15 Jul 2024 09:38:07 +0200
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
X-Inumbo-ID: 2d43cad5-427d-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:message-id:in-reply-to:references:
   subject:mime-version:content-transfer-encoding;
  bh=Q2xB0ycytdFt6GtQ0OAtp7lxpvGQTrLNcLfOs+LKlbk=;
  b=SiAIHQsy/RL4Hr2zcLHzeEZKQeXd1yBggb6ECWYt+AxY9HXi0tzlTU3W
   RGlrL/qwZEM2UCvfn7PX+J/3TmF9UMkSwV2u0DURnmMw3EZxtCKcb5ge+
   T1pd3Xn1LYX5cJ+fo8MYiIbOjXLKL1DpJevDi8vQhlH59gO35QYg0CI2k
   Y=;
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
X-IronPort-AV: E=Sophos;i="6.09,209,1716242400"; 
   d="scan'208";a="175442015"
X-MGA-submission: =?us-ascii?q?MDGIhysIclcNmZ9sFdGvhmx7zROVj2FBKMX6pk?=
 =?us-ascii?q?apSphm3CswQtUox6bV2zY2UELeHCoH4MZZDzJo8oAqCWQTDtYDs+w0q2?=
 =?us-ascii?q?pr4dgNnqETl8u6L1Nmoe3GJAY5i3xPs4ZmJyqZHRra7AwdeY1xAtpFYp?=
 =?us-ascii?q?Pn21ei1ePRbvkIGxG2NVWDSQ=3D=3D?=
Date: Mon, 15 Jul 2024 09:38:06 +0200 (CEST)
From: Fonyuy-Asheri Caleb <fonyuy-asheri.caleb@inria.fr>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <1557490999.4048664.1721029086794.JavaMail.zimbra@inria.fr>
In-Reply-To: <8f8dac21-92fe-4760-8578-2fbfde2f2c14@citrix.com>
References: <60751777.2038091.1720694327760.JavaMail.zimbra@inria.fr> <94e94a94-14f2-4fa6-bc3b-6c64c1b84b59@citrix.com> <1546743760.2065506.1720696161057.JavaMail.zimbra@inria.fr> <8f8dac21-92fe-4760-8578-2fbfde2f2c14@citrix.com>
Subject: Re: Help with Understanding vcpu xstate restore error during vm
 migration
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Originating-IP: [131.254.23.3]
X-Mailer: Zimbra 10.0.8_GA_4611 (ZimbraWebClient - GC126 (Linux)/10.0.8_GA_4611)
Thread-Topic: Help with Understanding vcpu xstate restore error during vm migration
Thread-Index: Ux+ols7um7sPrHotp+o2RrMr45DJ8Q==

>> PV Default policy: 30 leaves, 2 MSRs
>> ...
>>   0000000d:00000000 -> 00000003:00000000:00000240:00000000
>>   0000000d:00000001 -> 00000007:00000000:00000000:00000000
> 
> ... PV guests get nothing, while you're trying to migrate in a guest
> which...
> 
>> =========================================================================================================
>> VM xen-cpuid -p $domid
>> ---------------------------------------------------------------------------------------------------------
>> Domain 3 policy: 31 leaves, 2 MSRs
>> ...
>>   0000000d:00000000 -> 00000007:00000000:00000340:00000000
>>   0000000d:00000001 -> 00000001:00000000:00000000:00000000
>>   0000000d:00000002 -> 00000100:00000240:00000000:00000000
> 
> ... has AVX.

This makes much more sense now. 
> 
> This explains why you're hitting the "guest size > xen size" check.
> 
> Migration should have failed earlier with a clearer message about the VM
> having features not available on the target, but I suspect I know why it
> didn't, and sadly its an item I've had on the todo list for a few years.
> 
> Perhaps the more important question, are you booting the skylake with
> cpuid=no-avx on the command line by any chance?

No. I didn't boot any of the machines with any cpuid modification whatsoever. 

> 
> ~Andrew

Thanks a lot for these pointers Andrew.

Caleb.

